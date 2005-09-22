" Vim syntax file
" Language:	Universe Basic (Used also in DataStage)
" Maintainer:	L. Husar <lh3@atlas.cz>
" Last Change:	9/22/2005 10:02AM


" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

if version >= 600
  setlocal iskeyword+=.
else
  set iskeyword+=.
endif

syn case ignore

" A bunch of useful BASIC keywords
syn keyword basicStatement	ABORT
syn keyword basicStatement	BEGIN
syn keyword basicStatement	CALL CALLING CASE CHAIN COMMON CONTINUE
syn keyword basicStatement	DEFFUN
syn keyword basicStatement	ELSE END ENTER ERROR EXECUTE EXIT
syn keyword basicStatement	FOR
syn keyword basicStatement	GOSUB GOTO
syn keyword basicStatement	IF
syn keyword basicStatement	LOOP
syn keyword basicStatement	NEXT
syn keyword basicStatement	ON
syn keyword basicStatement	PERFORM
syn keyword basicStatement	REPEAT RETURN
syn keyword basicStatement	STOP SUBR
syn keyword basicStatement	THEN
syn keyword basicStatement	UNTIL
syn keyword basicStatement	WHILE

syn keyword basicFunction	ABS ABSS ACOS ADDS ALPHA ANDS ASCII ASIN ATAN AUTHORIZATION AUXMAP
syn keyword basicFunction	BITAND BITNOT BITOR BITRESET BITSET BITTEST BITXOR BREAK BSCAN BYTE BYTELEN  BYTETYPE BYTEVAL
syn keyword basicFunction	CATS CHANGE CHAR CHARS CHECKSUM CLEARDATA CLEARFILE CLEARPROMPTS CLEARSELECT CLOSE CLOSESEQ COMMIT COMPARE CONVERT COS COSH COUNT COUNTS CREATE CRT
syn keyword basicFunction	DATA DATE DCOUNT DEBUG DEL DELETE DELETELIST DELETEU DISPLAY DIV DIVS DOWNCASE DQUOTE DTX
syn keyword basicFunction	EBCDIC ECHO EOF EQS EREPLACE ERRMSG EXCHANGE EXP EXTRACT
syn keyword basicFunction	FADD FDIV FFIX FFLT FIELD FIELDS FIELDSTORE FILEINFO FILELOCK FILEUNLOCK FIND FINDSTR FIX FLUSH FMT FMTDP FMTS FMTSDP FMUL FOLD FOLDDP FOOTING FSUB
syn keyword basicFunction	GES GET GETLIST GETLOCALE GETREM GETX GROUP GROUPSTORE GTS
syn keyword basicFunction	HEADING HUSH
syn keyword basicFunction	ICONV ICONVS IFS ILPROMPT INDEX INDEXS INDICES INMAT INPUT INPUTCLEAR INPUTDISP INPUTDP INPUTERR INPUTNULL INPUTTRAP INS INSERT INT ISNULL ISNULLS ISOLATION ITYPE
syn keyword basicFunction	KEYEDIT KEYEXIT KEYIN KEYTRAP
syn keyword basicFunction	LEFT LEN LENDP LENS LENSDP LES LEVEL LN LOCALEINFO LOCATE LOCK LOWER LTS
syn keyword basicFunction	MATBUILD MATCHFIELD MATPARSE MATREAD MATREADL MATREADU MATWRITE MATWRITEU MAXIMUM MINIMUM MOD MODS MULS
syn keyword basicFunction	NAP NEG NEGS NES NOBUF NOTS NUM NUMS
syn keyword basicFunction	OCONV OCONVS OPEN OPENDEV OPENPATH OPENSEQ ORS
syn keyword basicFunction	PAGE PRECISION PRINT PRINTER PRINTERR PROCREAD PROCWRITE PROMPT PWR
syn keyword basicFunction	QUOTE
syn keyword basicFunction	RAISE RANDOMIZE READ READBLK READL READLIST READNEXT READSEQ READT READU READV READVL READVU REAL RECORDLOCKED RECORDLOCKL RECORDLOCKU RELEASE REMOVE REPLACE RESET REUSE 
syn keyword basicFunction	REVREMOVE REWIND RIGHT RND ROLLBACK RPC.CALL RPC.CONNECT RPC.DISCONNECT
syn keyword basicFunction	SADD SCMP SDIV SEEK SELECT SELECTE SELECTINDEX SELECTINFO SEND SENTENCE SEQ SEQS SET SETLOCALE SETREM SIN SINH SLEEP SMUL SOUNDEX SPACE SPACES SPLICE SQRT SQUOTE SSELECT 
syn keyword basicFunction	SSUB START STATUS STR STRS SUBS SUBSTRINGS SUM SUMMATION SYSTEM 
syn keyword basicFunction	TABSTOP TAN TANH TERMINFO TIME TIMEDATE TIMEOUT TPARM TPRINT TRANS TRANSACTION TRIM TRIMB TRIMBS TRIMF TRIMFS TRIMS TTYCTL TTYGET TTYSET
syn keyword basicFunction	UNICHAR UNICHARS UNISEQ UNISEQS UNLOCK UPCASE UPRINT
syn keyword basicFunction	WEOF WEOFSEQ WRITE WRITEBLK WRITELIST WRITESEQ WRITESEQF WRITET WRITEU WRITEV WRITEVU
syn keyword basicFunction	XLATE XTD

syn match basicConditional      "="
syn match basicConditional      ":"
syn match basicConditional      "<>"
syn match basicConditional      "<"
syn match basicConditional      ">"
syn match basicConditional      ">="
syn match basicConditional      "<="
syn match basicConditional      ":="
syn match basicConditional      "+="
syn keyword basicConditional      AND
syn keyword basicConditional      OR

"integer number, or floating point number without a dot.
syn match  basicNumber		"\<\d\+\>"
"floating point number, with dot
syn match  basicNumber		"\<\d\+\.\d*\>"
"floating point number, starting with a dot
syn match  basicNumber		"\.\d\+\>"

syn match  basicSpecial         "DSJ\.ME"
syn match  basicSpecial         "DSJ\.PARAMVALUE"
syn match  basicSpecial         "DSU\."
syn match  basicSpecial         "DSX\."
syn match  basicSpecial         "\w*\:"
syn keyword basicSpecial        DSLogInfo DSLogFatal DSLogWarn DSExecute 

syn match  basicSpecial         "@DATE"
syn match  basicSpecial         "@FM"
syn match  basicSpecial         "@VM"
syn match  basicSpecial         "@NULL"

"syn region  basicString		start=+"+  skip=+\\\\\|\\"+  end=+"+  contains=basicSpecial
"syn region  basicString		start=+'+  end=+'+  contains=basicSpecial
syn region  basicString		start=+"+  skip=+\\\\\|\\"+  end=+"+  
syn region  basicString		start=+'+  end=+'+  

syn region  basicComment	start="REM\s" end="$" contains=basicTodo
syn region  basicComment	start="*" end="$" contains=basicTodo


" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_basic_syntax_inits")
  if version < 508
    let did_basic_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink basicLabel		Label
  HiLink basicConditional	Conditional
  HiLink basicRepeat		Repeat
  HiLink basicLineNumber	Comment
  HiLink basicNumber		Number
  HiLink basicError		Error
  HiLink basicStatement	        Statement
  HiLink basicString		String
  HiLink basicSpecial		Special
  HiLink basicTodo		Todo
  HiLink basicFunction		Identifier
  HiLink basicTypeSpecifier     Type
  HiLink basicFilenumber        basicTypeSpecifier
  HiLink basicComment		Comment
  "hi basicMathsOperator term=bold cterm=bold gui=bold

  delcommand HiLink
endif

let b:current_syntax = "unibasic"

" vim: ts=8
