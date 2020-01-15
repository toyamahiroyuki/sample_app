class BooksController < ApplicationController
  def top
  end

  def index
  	@book = Book.new
  	@books =Book.all
  end

  def create
  	@book = Book.new(book_params)
  	if @book.save
    flash[:notice] = "投稿を登録しました(successfully)"
  	redirect_to book_path(@book)
    else
    @books = Book.all
    render action: :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] = "投稿を更新しました(successfully)"
    redirect_to book_path(@book)
    else
    @books = Book.all
    render action: :show
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "投稿が削除されました(successfully)"
    redirect_to books_path

  end

  def show
   @book = Book.find(params[:id])

  end

private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
