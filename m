Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0839683960
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 23:33:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMzAR-0004yw-Ne; Tue, 31 Jan 2023 17:31:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pMzAP-0004yh-6K
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 17:31:53 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pMzAK-0003HL-PV
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 17:31:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OggWJIdjvK8pBdlaQGIVnurdFA8iOTzOyodh7bFGlK0=; b=hZlAebMxBrakwQYAb58M6NcmmS
 Khr8FIzlthhRkmLNfe90JDIW8buSg32GEs3Y2iPPy5N2r1lxWtMzxYTkA6s/20aiFWEJ4TKOZMAwt
 ZuYnH+oA6zlYWuX89iNtWL1FKGJRScW7gr6lMpJwD1Us3mw2MGnWuNx+RfY5ELu9wtxk=;
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, tsimpson@quicinc.com, bcain@quicinc.com, mlambert@quicinc.com
Subject: [PATCH] target/hexagon/idef-parser: Remove unused code paths
Date: Tue, 31 Jan 2023 23:31:33 +0100
Message-Id: <20230131223133.8592-1-anjo@rev.ng>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Removes code paths used by COF instructions, which are no longer
processed by idef-parser.

Signed-off-by: Anton Johansson <anjo@rev.ng>
---
 target/hexagon/idef-parser/idef-parser.h    |  1 -
 target/hexagon/idef-parser/idef-parser.lex  | 27 +------------
 target/hexagon/idef-parser/idef-parser.y    | 45 +--------------------
 target/hexagon/idef-parser/macros.inc       | 10 -----
 target/hexagon/idef-parser/parser-helpers.c |  3 --
 5 files changed, 4 insertions(+), 82 deletions(-)

diff --git a/target/hexagon/idef-parser/idef-parser.h b/target/hexagon/idef-parser/idef-parser.h
index 5c49d4da3e..354528bbc8 100644
--- a/target/hexagon/idef-parser/idef-parser.h
+++ b/target/hexagon/idef-parser/idef-parser.h
@@ -82,7 +82,6 @@ enum ImmUnionTag {
     VALUE,
     QEMU_TMP,
     IMM_PC,
-    IMM_NPC,
     IMM_CONSTEXT,
 };
 
diff --git a/target/hexagon/idef-parser/idef-parser.lex b/target/hexagon/idef-parser/idef-parser.lex
index ff87a02c3a..2658d9fb2e 100644
--- a/target/hexagon/idef-parser/idef-parser.lex
+++ b/target/hexagon/idef-parser/idef-parser.lex
@@ -140,8 +140,6 @@ STRING_LIT               \"(\\.|[^"\\])*\"
                            yylval->rvalue.is_dotnew = true;
                            yylval->rvalue.signedness = SIGNED;
                            return PRED; }
-"IV1DEAD()"              |
-"fPAUSE(uiV);"           { return ';'; }
 "+="                     { return INC; }
 "-="                     { return DEC; }
 "++"                     { return PLUSPLUS; }
@@ -159,9 +157,8 @@ STRING_LIT               \"(\\.|[^"\\])*\"
 "else"                   { return ELSE; }
 "for"                    { return FOR; }
 "fREAD_IREG"             { return ICIRC; }
-"fPART1"                 { return PART1; }
 "if"                     { return IF; }
-"fFRAME_SCRAMBLE"        { return FSCR; }
+"fFRAME_SCRAMBLE"        |
 "fFRAME_UNSCRAMBLE"      { return FSCR; }
 "fFRAMECHECK"            { return FCHK; }
 "Constant_extended"      { return CONSTEXT; }
@@ -312,11 +309,7 @@ STRING_LIT               \"(\\.|[^"\\])*\"
 "(unsigned int)"         { yylval->cast.bit_width = 32;
                            yylval->cast.signedness = UNSIGNED;
                            return CAST; }
-"fREAD_PC()"             |
-"PC"                     { return PC; }
-"fREAD_NPC()"            |
-"NPC"                    { return NPC; }
-"fGET_LPCFG"             |
+"fREAD_PC()"             { return PC; }
 "USR.LPCFG"              { return LPCFG; }
 "LOAD_CANCEL(EA)"        { return LOAD_CANCEL; }
 "STORE_CANCEL(EA)"       |
@@ -360,14 +353,6 @@ STRING_LIT               \"(\\.|[^"\\])*\"
                            yylval->rvalue.bit_width = 32;
                            yylval->rvalue.signedness = UNSIGNED;
                            return REG; }
-"fREAD_LC"[01]           { yylval->rvalue.type = REGISTER;
-                           yylval->rvalue.reg.type = CONTROL;
-                           yylval->rvalue.reg.id = HEX_REG_LC0
-                                                 + (yytext[8] - '0') * 2;
-                           yylval->rvalue.reg.bit_width = 32;
-                           yylval->rvalue.bit_width = 32;
-                           yylval->rvalue.signedness = UNSIGNED;
-                           return REG; }
 "LC"[01]                 { yylval->rvalue.type = REGISTER;
                            yylval->rvalue.reg.type = CONTROL;
                            yylval->rvalue.reg.id = HEX_REG_LC0
@@ -376,14 +361,6 @@ STRING_LIT               \"(\\.|[^"\\])*\"
                            yylval->rvalue.bit_width = 32;
                            yylval->rvalue.signedness = UNSIGNED;
                            return REG; }
-"fREAD_SA"[01]           { yylval->rvalue.type = REGISTER;
-                           yylval->rvalue.reg.type = CONTROL;
-                           yylval->rvalue.reg.id = HEX_REG_SA0
-                                                 + (yytext[8] - '0') * 2;
-                           yylval->rvalue.reg.bit_width = 32;
-                           yylval->rvalue.bit_width = 32;
-                           yylval->rvalue.signedness = UNSIGNED;
-                           return REG; }
 "SA"[01]                 { yylval->rvalue.type = REGISTER;
                            yylval->rvalue.reg.type = CONTROL;
                            yylval->rvalue.reg.id = HEX_REG_SA0
diff --git a/target/hexagon/idef-parser/idef-parser.y b/target/hexagon/idef-parser/idef-parser.y
index c14cb39500..ec7ca56906 100644
--- a/target/hexagon/idef-parser/idef-parser.y
+++ b/target/hexagon/idef-parser/idef-parser.y
@@ -52,8 +52,8 @@
 %token IN INAME VAR
 %token ABS CROUND ROUND CIRCADD COUNTONES INC DEC ANDA ORA XORA PLUSPLUS ASL
 %token ASR LSR EQ NEQ LTE GTE MIN MAX ANDL FOR ICIRC IF MUN FSCR FCHK SXT
-%token ZXT CONSTEXT LOCNT BREV SIGN LOAD STORE PC NPC LPCFG
-%token LOAD_CANCEL CANCEL IDENTITY PART1 ROTL INSBITS SETBITS EXTRANGE
+%token ZXT CONSTEXT LOCNT BREV SIGN LOAD STORE PC LPCFG
+%token LOAD_CANCEL CANCEL IDENTITY ROTL INSBITS SETBITS EXTRANGE
 %token CAST4_8U FAIL CARRY_FROM_ADD ADDSAT64 LSBNEW
 %token TYPE_SIZE_T TYPE_INT TYPE_SIGNED TYPE_UNSIGNED TYPE_LONG
 
@@ -339,16 +339,6 @@ assign_statement : lvalue '=' rvalue
                        OUT(c, &@1, &$1, " = ", &$3, ";\n");
                        $$ = $1;
                    }
-                 | PC '=' rvalue
-                   {
-                       @1.last_column = @3.last_column;
-                       yyassert(c, &@1, !is_inside_ternary(c),
-                                "Assignment side-effect not modeled!");
-                       $3 = gen_rvalue_truncate(c, &@1, &$3);
-                       $3 = rvalue_materialize(c, &@1, &$3);
-                       OUT(c, &@1, "gen_write_new_pc(", &$3, ");\n");
-                       gen_rvalue_free(c, &@1, &$3); /* Free temporary value */
-                   }
                  | LOAD '(' IMM ',' IMM ',' SIGN ',' var ',' lvalue ')'
                    {
                        @1.last_column = @12.last_column;
@@ -417,7 +407,6 @@ control_statement : frame_check
                   | cancel_statement
                   | if_statement
                   | for_statement
-                  | fpart1_statement
                   ;
 
 frame_check : FCHK '(' rvalue ',' rvalue ')' ';'
@@ -471,17 +460,6 @@ for_statement : FOR '(' IMM '=' IMM ';' IMM '<' IMM ';' IMM PLUSPLUS ')'
                 }
               ;
 
-fpart1_statement : PART1
-                   {
-                       OUT(c, &@1, "if (insn->part1) {\n");
-                   }
-                   '(' statements ')'
-                   {
-                       @1.last_column = @3.last_column;
-                       OUT(c, &@1, "return; }\n");
-                   }
-                 ;
-
 if_stmt : IF '(' rvalue ')'
           {
               @1.last_column = @3.last_column;
@@ -521,20 +499,6 @@ rvalue : FAIL
              rvalue.signedness = UNSIGNED;
              $$ = rvalue;
          }
-       | NPC
-         {
-             /*
-              * NPC is only read from CALLs, so we can hardcode it
-              * at translation time
-              */
-             HexValue rvalue;
-             memset(&rvalue, 0, sizeof(HexValue));
-             rvalue.type = IMMEDIATE;
-             rvalue.imm.type = IMM_NPC;
-             rvalue.bit_width = 32;
-             rvalue.signedness = UNSIGNED;
-             $$ = rvalue;
-         }
        | CONSTEXT
          {
              HexValue rvalue;
@@ -793,11 +757,6 @@ rvalue : FAIL
              /* Ones count */
              $$ = gen_ctpop_op(c, &@1, &$3);
          }
-       | LPCFG
-         {
-             $$ = gen_tmp_value(c, &@1, "0", 32, UNSIGNED);
-             OUT(c, &@1, "GET_USR_FIELD(USR_LPCFG, ", &$$, ");\n");
-         }
        | EXTRACT '(' rvalue ',' rvalue ')'
          {
              @1.last_column = @6.last_column;
diff --git a/target/hexagon/idef-parser/macros.inc b/target/hexagon/idef-parser/macros.inc
index 6b697da87a..c2801c97f1 100644
--- a/target/hexagon/idef-parser/macros.inc
+++ b/target/hexagon/idef-parser/macros.inc
@@ -97,17 +97,8 @@
 #define fWRITE_LR(A) (LR = A)
 #define fWRITE_FP(A) (FP = A)
 #define fWRITE_SP(A) (SP = A)
-/*
- * Note: There is a rule in the parser that matches `PC = ...` and emits
- * a call to `gen_write_new_pc`. We need to call `gen_write_new_pc` to
- * get the correct semantics when there are multiple stores in a packet.
- */
-#define fBRANCH(LOC, TYPE) (PC = LOC)
-#define fJUMPR(REGNO, TARGET, TYPE) (PC = TARGET)
 #define fWRITE_LOOP_REGS0(START, COUNT) SA0 = START; (LC0 = COUNT)
 #define fWRITE_LOOP_REGS1(START, COUNT) SA1 = START; (LC1 = COUNT)
-#define fWRITE_LC0(VAL) (LC0 = VAL)
-#define fWRITE_LC1(VAL) (LC1 = VAL)
 #define fSET_LPCFG(VAL) (USR.LPCFG = VAL)
 #define fWRITE_P0(VAL) P0 = VAL;
 #define fWRITE_P1(VAL) P1 = VAL;
@@ -121,7 +112,6 @@
 #define fEA_GPI(IMM) (EA = fREAD_GP() + IMM)
 #define fPM_I(REG, IMM) (REG = REG + IMM)
 #define fPM_M(REG, MVAL) (REG = REG + MVAL)
-#define fWRITE_NPC(VAL) (PC = VAL)
 
 /* Unary operators */
 #define fROUND(A) (A + 0x8000)
diff --git a/target/hexagon/idef-parser/parser-helpers.c b/target/hexagon/idef-parser/parser-helpers.c
index 8110686c51..937fed6a42 100644
--- a/target/hexagon/idef-parser/parser-helpers.c
+++ b/target/hexagon/idef-parser/parser-helpers.c
@@ -185,9 +185,6 @@ void imm_print(Context *c, YYLTYPE *locp, HexImm *imm)
     case IMM_PC:
         EMIT(c, "ctx->base.pc_next");
         break;
-    case IMM_NPC:
-        EMIT(c, "ctx->npc");
-        break;
     case IMM_CONSTEXT:
         EMIT(c, "insn->extension_valid");
         break;
-- 
2.39.0


