# execute code in the site root dir
pkg_file = function(..., mustWork = TRUE) {
  system.file(..., package = 'bookdown', mustWork = mustWork)
}

in_root = function(expr) xfun::in_dir(getwd(), expr)

source_addin = function(file) in_root(sys.source(
  pkg_file('scripts', file), envir = new.env(parent = globalenv()),
  keep.source = FALSE
))

jquery_dependency = function() {
  jquerylib::jquery_core()
}

mathquill = function() {
  sys.source(bookdown_file('scripts', 'mathquill.R'), new.env())
}

insert_image_addin = function() source_addin('insert_image.R')
