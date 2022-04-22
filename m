Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBDE50BF5B
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 20:16:04 +0200 (CEST)
Received: from localhost ([::1]:38586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhxp5-0003ov-KF
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 14:16:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1nhxI6-0008Mg-7n
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 13:42:00 -0400
Received: from rev.ng ([5.9.113.41]:59801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1nhxI1-0006AU-9G
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 13:41:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lVoitugGjQzIc7MQmoN7m6uMqqFStq72KLjzgbe+QQQ=; b=JUvCZsZe4HeVKVN7rwbLppdizc
 UgRgUTy8eWD8msK61DMpxp34zKo9KgmNeY+3ZKebQYjZxCRrNJcIeXzC1VSWVW3p5o3CRyamooNiG
 H/2hqwaOeD6dX2so4RG6m/V2zAaApt3bfsDyH1/n7uQs+iRn2PxuAT50zqleEKVw+sto=;
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, tsimpson@quicinc.com, bcain@quicinc.com, mlambert@quicinc.com,
 babush@rev.ng, nizzo@rev.ng, richard.henderson@linaro.org
Subject: [PATCH v9 10/12] target/hexagon: import parser for idef-parser
Date: Fri, 22 Apr 2022 19:40:57 +0200
Message-Id: <20220422174059.4304-11-anjo@rev.ng>
In-Reply-To: <20220422174059.4304-1-anjo@rev.ng>
References: <20220422174059.4304-1-anjo@rev.ng>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>

Signed-off-by: Alessandro Di Federico <ale@rev.ng>
Signed-off-by: Paolo Montesel <babush@rev.ng>
Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
---
 target/hexagon/idef-parser/idef-parser.y    |  961 ++++++++
 target/hexagon/idef-parser/parser-helpers.c | 2346 +++++++++++++++++++
 target/hexagon/idef-parser/parser-helpers.h |  372 +++
 target/hexagon/meson.build                  |   25 +
 4 files changed, 3704 insertions(+)
 create mode 100644 target/hexagon/idef-parser/idef-parser.y
 create mode 100644 target/hexagon/idef-parser/parser-helpers.c
 create mode 100644 target/hexagon/idef-parser/parser-helpers.h

diff --git a/target/hexagon/idef-parser/idef-parser.y b/target/hexagon/idef-parser/idef-parser.y
new file mode 100644
index 0000000000..096cca2d17
--- /dev/null
+++ b/target/hexagon/idef-parser/idef-parser.y
@@ -0,0 +1,961 @@
+%{
+/*
+ *  Copyright(c) 2019-2022 rev.ng Labs Srl. All Rights Reserved.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "idef-parser.h"
+#include "parser-helpers.h"
+#include "idef-parser.tab.h"
+#include "idef-parser.yy.h"
+
+/* Uncomment this to disable yyasserts */
+/* #define NDEBUG */
+
+#define ERR_LINE_CONTEXT 40
+
+%}
+
+%lex-param {void *scanner}
+%parse-param {void *scanner}
+%parse-param {Context *c}
+
+%define parse.error verbose
+%define parse.lac full
+%define api.pure full
+
+%locations
+
+%union {
+    GString *string;
+    HexValue rvalue;
+    HexSat sat;
+    HexCast cast;
+    HexExtract extract;
+    HexMpy mpy;
+    HexSignedness signedness;
+    int index;
+}
+
+/* Tokens */
+%start input
+
+%expect 1
+
+%token IN INAME VAR
+%token ABS CROUND ROUND CIRCADD COUNTONES INC DEC ANDA ORA XORA PLUSPLUS ASL
+%token ASR LSR EQ NEQ LTE GTE MIN MAX ANDL FOR ICIRC IF MUN FSCR FCHK SXT
+%token ZXT CONSTEXT LOCNT BREV SIGN LOAD STORE PC NPC LPCFG
+%token CANCEL IDENTITY PART1 ROTL INSBITS SETBITS EXTRANGE
+%token CAST4_8U FAIL CARRY_FROM_ADD ADDSAT64 LSBNEW
+%token TYPE_SIZE_T TYPE_INT TYPE_SIGNED TYPE_UNSIGNED TYPE_LONG
+
+%token <rvalue> REG IMM PRED
+%token <index> ELSE
+%token <mpy> MPY
+%token <sat> SAT
+%token <cast> CAST DEPOSIT SETHALF
+%token <extract> EXTRACT
+%type <string> INAME
+%type <rvalue> rvalue lvalue VAR assign_statement var var_decl var_type
+%type <rvalue> FAIL
+%type <rvalue> TYPE_SIGNED TYPE_UNSIGNED TYPE_INT TYPE_LONG TYPE_SIZE_T
+%type <index> if_stmt IF
+%type <signedness> SIGN
+
+/* Operator Precedences */
+%left MIN MAX
+%left '('
+%left ','
+%left '='
+%right CIRCADD
+%right INC DEC ANDA ORA XORA
+%left '?' ':'
+%left ANDL
+%left '|'
+%left '^' ANDOR
+%left '&'
+%left EQ NEQ
+%left '<' '>' LTE GTE
+%left ASL ASR LSR
+%right ABS
+%left '-' '+'
+%left '*' '/' '%' MPY
+%right '~' '!'
+%left '['
+%right CAST
+%right LOCNT BREV
+
+/* Bison Grammar */
+%%
+
+/* Input file containing the description of each hexagon instruction */
+input : instructions
+      {
+          YYACCEPT;
+      }
+      ;
+
+instructions : instruction instructions
+             | %empty
+             ;
+
+instruction : INAME
+              {
+                  gen_inst(c, $1);
+              }
+              arguments
+              {
+                  EMIT_SIG(c, ")");
+                  EMIT_HEAD(c, "{\n");
+              }
+              code
+              {
+                  gen_inst_code(c, &@1);
+              }
+            | error /* Recover gracefully after instruction compilation error */
+              {
+                  free_instruction(c);
+              }
+            ;
+
+arguments : '(' ')'
+          | '(' argument_list ')';
+
+argument_list : argument_decl ',' argument_list
+              | argument_decl
+              ;
+
+var : VAR
+      {
+          track_string(c, $1.var.name);
+          $$ = $1;
+      }
+    ;
+
+/*
+ * Here the integer types are defined from valid combinations of
+ * `signed`, `unsigned`, `int`, and `long` tokens. The `signed`
+ * and `unsigned` tokens are here assumed to always be placed
+ * first in the type declaration, which is not the case in
+ * normal C. Similarly, `int` is assumed to always be placed
+ * last in the type.
+ */
+type_int : TYPE_INT
+         | TYPE_SIGNED
+         | TYPE_SIGNED TYPE_INT;
+type_uint : TYPE_UNSIGNED
+          | TYPE_UNSIGNED TYPE_INT;
+type_ulonglong : TYPE_UNSIGNED TYPE_LONG TYPE_LONG
+               | TYPE_UNSIGNED TYPE_LONG TYPE_LONG TYPE_INT;
+
+/*
+ * Here the various valid int types defined above specify
+ * their `signedness` and `bit_width`. The LP64 convention
+ * is assumed where longs are 64-bit, long longs are then
+ * assumed to also be 64-bit.
+ */
+var_type : TYPE_SIZE_T
+           {
+              yyassert(c, &@1, $1.bit_width <= 64,
+                       "Variables with size > 64-bit are not supported!");
+              $$ = $1;
+           }
+         | type_int
+           {
+              $$.signedness = SIGNED;
+              $$.bit_width  = 32;
+           }
+         | type_uint
+           {
+              $$.signedness = UNSIGNED;
+              $$.bit_width  = 32;
+           }
+         | type_ulonglong
+           {
+              $$.signedness = UNSIGNED;
+              $$.bit_width  = 64;
+           }
+         ;
+
+/* Rule to capture declarations of VARs */
+var_decl : var_type IMM
+           {
+              /*
+               * Rule to capture "int i;" declarations since "i" is special
+               * and assumed to be always be IMM. Moreover, "i" is only
+               * assumed to be used in for-loops.
+               *
+               * Therefore we want to NOP these declarations.
+               */
+              yyassert(c, &@2, $2.imm.type == I,
+                       "Variable declaration with immedaties only allowed"
+                       " for the loop induction variable \"i\"");
+              $$ = $2;
+           }
+         | var_type var
+           {
+              /*
+               * Allocate new variable, this checks that it hasn't already
+               * been declared.
+               */
+              gen_varid_allocate(c, &@1, &$2, $1.bit_width, $1.signedness);
+              /* Copy var for variable name */
+              $$ = $2;
+              /* Copy type info from var_type */
+              $$.signedness = $1.signedness;
+              $$.bit_width  = $1.bit_width;
+           }
+         ;
+
+/* Return the modified registers list */
+code : '{' statements '}'
+       {
+           c->inst.code_begin = c->input_buffer + @2.first_column - 1;
+           c->inst.code_end = c->input_buffer + @2.last_column - 1;
+       }
+     | '{'
+       {
+           /* Nop */
+       }
+       '}'
+     ;
+
+argument_decl : REG
+                {
+                    emit_arg(c, &@1, &$1);
+                    /* Enqueue register into initialization list */
+                    g_array_append_val(c->inst.init_list, $1);
+                }
+              | PRED
+                {
+                    emit_arg(c, &@1, &$1);
+                    /* Enqueue predicate into initialization list */
+                    g_array_append_val(c->inst.init_list, $1);
+                }
+              | IN REG
+                {
+                    emit_arg(c, &@2, &$2);
+                }
+              | IN PRED
+                {
+                    emit_arg(c, &@2, &$2);
+                }
+              | IMM
+                {
+                    EMIT_SIG(c, ", int %ciV", $1.imm.id);
+                }
+              ;
+
+code_block : '{' statements '}'
+           | '{' '}'
+           ;
+
+/* A list of one or more statements */
+statements : statements statement
+           | statement
+           ;
+
+/* Statements can be assignment (rvalue ';'), control or memory statements */
+statement : control_statement
+          | var_decl ';'
+          | rvalue ';'
+            {
+                gen_rvalue_free(c, &@1, &$1);
+            }
+          | code_block
+          | ';'
+          ;
+
+assign_statement : lvalue '=' rvalue
+                   {
+                       @1.last_column = @3.last_column;
+                       gen_assign(c, &@1, &$1, &$3);
+                       $$ = $1;
+                   }
+                 | var_decl '=' rvalue
+                   {
+                       @1.last_column = @3.last_column;
+                       gen_assign(c, &@1, &$1, &$3);
+                       $$ = $1;
+                   }
+                 | lvalue INC rvalue
+                   {
+                       @1.last_column = @3.last_column;
+                       HexValue tmp = gen_bin_op(c, &@1, ADD_OP, &$1, &$3);
+                       gen_assign(c, &@1, &$1, &tmp);
+                       $$ = $1;
+                   }
+                 | lvalue DEC rvalue
+                   {
+                       @1.last_column = @3.last_column;
+                       HexValue tmp = gen_bin_op(c, &@1, SUB_OP, &$1, &$3);
+                       gen_assign(c, &@1, &$1, &tmp);
+                       $$ = $1;
+                   }
+                 | lvalue ANDA rvalue
+                   {
+                       @1.last_column = @3.last_column;
+                       HexValue tmp = gen_bin_op(c, &@1, ANDB_OP, &$1, &$3);
+                       gen_assign(c, &@1, &$1, &tmp);
+                       $$ = $1;
+                   }
+                 | lvalue ORA rvalue
+                   {
+                       @1.last_column = @3.last_column;
+                       HexValue tmp = gen_bin_op(c, &@1, ORB_OP, &$1, &$3);
+                       gen_assign(c, &@1, &$1, &tmp);
+                       $$ = $1;
+                   }
+                 | lvalue XORA rvalue
+                   {
+                       @1.last_column = @3.last_column;
+                       HexValue tmp = gen_bin_op(c, &@1, XORB_OP, &$1, &$3);
+                       gen_assign(c, &@1, &$1, &tmp);
+                       $$ = $1;
+                   }
+                 | PRED '=' rvalue
+                   {
+                       @1.last_column = @3.last_column;
+                       gen_pred_assign(c, &@1, &$1, &$3);
+                   }
+                 | IMM '=' rvalue
+                   {
+                       @1.last_column = @3.last_column;
+                       yyassert(c, &@1, $3.type == IMMEDIATE,
+                                "Cannot assign non-immediate to immediate!");
+                       yyassert(c, &@1, $1.imm.type == VARIABLE,
+                                "Cannot assign to non-variable!");
+                       /* Assign to the function argument */
+                       OUT(c, &@1, &$1, " = ", &$3, ";\n");
+                       $$ = $1;
+                   }
+                 | PC '=' rvalue
+                   {
+                       @1.last_column = @3.last_column;
+                       yyassert(c, &@1, !is_inside_ternary(c),
+                                "Assignment side-effect not modeled!");
+                       $3 = gen_rvalue_truncate(c, &@1, &$3);
+                       $3 = rvalue_materialize(c, &@1, &$3);
+                       OUT(c, &@1, "gen_write_new_pc(", &$3, ");\n");
+                       gen_rvalue_free(c, &@1, &$3); /* Free temporary value */
+                   }
+                 | LOAD '(' IMM ',' IMM ',' SIGN ',' var ',' lvalue ')'
+                   {
+                       @1.last_column = @12.last_column;
+                       yyassert(c, &@1, !is_inside_ternary(c),
+                                "Assignment side-effect not modeled!");
+                       yyassert(c, &@1, $3.imm.value == 1,
+                                "LOAD of arrays not supported!");
+                       gen_load(c, &@1, &$5, $7, &$9, &$11);
+                   }
+                 | STORE '(' IMM ',' IMM ',' var ',' rvalue ')'
+                   /* Store primitive */
+                   {
+                       @1.last_column = @10.last_column;
+                       yyassert(c, &@1, !is_inside_ternary(c),
+                                "Assignment side-effect not modeled!");
+                       yyassert(c, &@1, $3.imm.value == 1,
+                                "STORE of arrays not supported!");
+                       gen_store(c, &@1, &$5, &$7, &$9);
+                   }
+                 | LPCFG '=' rvalue
+                   {
+                       @1.last_column = @3.last_column;
+                       yyassert(c, &@1, !is_inside_ternary(c),
+                                "Assignment side-effect not modeled!");
+                       $3 = gen_rvalue_truncate(c, &@1, &$3);
+                       $3 = rvalue_materialize(c, &@1, &$3);
+                       OUT(c, &@1, "SET_USR_FIELD(USR_LPCFG, ", &$3, ");\n");
+                       gen_rvalue_free(c, &@1, &$3);
+                   }
+                 | DEPOSIT '(' rvalue ',' rvalue ',' rvalue ')'
+                   {
+                       @1.last_column = @8.last_column;
+                       yyassert(c, &@1, !is_inside_ternary(c),
+                                "Assignment side-effect not modeled!");
+                       gen_deposit_op(c, &@1, &$5, &$7, &$3, &$1);
+                   }
+                 | SETHALF '(' rvalue ',' lvalue ',' rvalue ')'
+                   {
+                       @1.last_column = @8.last_column;
+                       yyassert(c, &@1, !is_inside_ternary(c),
+                                "Assignment side-effect not modeled!");
+                       gen_sethalf(c, &@1, &$1, &$3, &$5, &$7);
+                   }
+                 | SETBITS '(' rvalue ',' rvalue ',' rvalue ',' rvalue ')'
+                   {
+                       @1.last_column = @10.last_column;
+                       yyassert(c, &@1, !is_inside_ternary(c),
+                                "Assignment side-effect not modeled!");
+                       gen_setbits(c, &@1, &$3, &$5, &$7, &$9);
+                   }
+                 | INSBITS '(' lvalue ',' rvalue ',' rvalue ',' rvalue ')'
+                   {
+                       @1.last_column = @10.last_column;
+                       yyassert(c, &@1, !is_inside_ternary(c),
+                                "Assignment side-effect not modeled!");
+                       gen_rdeposit_op(c, &@1, &$3, &$9, &$7, &$5);
+                   }
+                 | IDENTITY '(' rvalue ')'
+                   {
+                       @1.last_column = @4.last_column;
+                       $$ = $3;
+                   }
+                 ;
+
+control_statement : frame_check
+                  | cancel_statement
+                  | if_statement
+                  | for_statement
+                  | fpart1_statement
+                  ;
+
+frame_check : FCHK '(' rvalue ',' rvalue ')' ';'
+              {
+                  gen_rvalue_free(c, &@1, &$3);
+                  gen_rvalue_free(c, &@1, &$5);
+              }
+            ;
+
+cancel_statement : CANCEL
+                   {
+                       OUT(c, &@1, "gen_cancel(insn->slot);\n");
+                   }
+                 ;
+
+if_statement : if_stmt
+               {
+                   /* Fix else label */
+                   OUT(c, &@1, "gen_set_label(if_label_", &$1, ");\n");
+               }
+             | if_stmt ELSE
+               {
+                   @1.last_column = @2.last_column;
+                   $2 = gen_if_else(c, &@1, $1);
+               }
+               statement
+               {
+                   OUT(c, &@1, "gen_set_label(if_label_", &$2, ");\n");
+               }
+             ;
+
+for_statement : FOR '(' IMM '=' IMM ';' IMM '<' IMM ';' IMM PLUSPLUS ')'
+                {
+                    yyassert(c, &@3,
+                             $3.imm.type == I &&
+                             $7.imm.type == I &&
+                             $11.imm.type == I,
+                             "Loop induction variable must be \"i\"");
+                    @1.last_column = @13.last_column;
+                    OUT(c, &@1, "for (int ", &$3, " = ", &$5, "; ",
+                        &$7, " < ", &$9);
+                    OUT(c, &@1, "; ", &$11, "++) {\n");
+                }
+                code_block
+                {
+                    OUT(c, &@1, "}\n");
+                }
+              ;
+
+fpart1_statement : PART1
+                   {
+                       OUT(c, &@1, "if (insn->part1) {\n");
+                   }
+                   '(' statements ')'
+                   {
+                       @1.last_column = @3.last_column;
+                       OUT(c, &@1, "return; }\n");
+                   }
+                 ;
+
+if_stmt : IF '(' rvalue ')'
+          {
+              @1.last_column = @3.last_column;
+              $1 = gen_if_cond(c, &@1, &$3);
+          }
+          statement
+          {
+              $$ = $1;
+          }
+        ;
+
+rvalue : FAIL
+         {
+             yyassert(c, &@1, false, "Encountered a FAIL token as rvalue.\n");
+         }
+       | assign_statement
+       | REG
+         {
+             $$ = $1;
+         }
+       | IMM
+         {
+             $$ = $1;
+         }
+       | PRED
+         {
+             $$ = gen_rvalue_pred(c, &@1, &$1);
+         }
+       | PC
+         {
+             /* Read PC from the CR */
+             HexValue rvalue;
+             memset(&rvalue, 0, sizeof(HexValue));
+             rvalue.type = IMMEDIATE;
+             rvalue.imm.type = IMM_PC;
+             rvalue.bit_width = 32;
+             rvalue.signedness = UNSIGNED;
+             $$ = rvalue;
+         }
+       | NPC
+         {
+             /*
+              * NPC is only read from CALLs, so we can hardcode it
+              * at translation time
+              */
+             HexValue rvalue;
+             memset(&rvalue, 0, sizeof(HexValue));
+             rvalue.type = IMMEDIATE;
+             rvalue.imm.type = IMM_NPC;
+             rvalue.bit_width = 32;
+             rvalue.signedness = UNSIGNED;
+             $$ = rvalue;
+         }
+       | CONSTEXT
+         {
+             HexValue rvalue;
+             memset(&rvalue, 0, sizeof(HexValue));
+             rvalue.type = IMMEDIATE;
+             rvalue.imm.type = IMM_CONSTEXT;
+             rvalue.signedness = UNSIGNED;
+             rvalue.is_dotnew = false;
+             rvalue.is_manual = false;
+             $$ = rvalue;
+         }
+       | var
+         {
+             $$ = gen_rvalue_var(c, &@1, &$1);
+         }
+       | MPY '(' rvalue ',' rvalue ')'
+         {
+             @1.last_column = @6.last_column;
+             $$ = gen_rvalue_mpy(c, &@1, &$1, &$3, &$5);
+         }
+       | rvalue '+' rvalue
+         {
+             @1.last_column = @3.last_column;
+             $$ = gen_bin_op(c, &@1, ADD_OP, &$1, &$3);
+         }
+       | rvalue '-' rvalue
+         {
+             @1.last_column = @3.last_column;
+             $$ = gen_bin_op(c, &@1, SUB_OP, &$1, &$3);
+         }
+       | rvalue '*' rvalue
+         {
+             @1.last_column = @3.last_column;
+             $$ = gen_bin_op(c, &@1, MUL_OP, &$1, &$3);
+         }
+       | rvalue ASL rvalue
+         {
+             @1.last_column = @3.last_column;
+             $$ = gen_bin_op(c, &@1, ASL_OP, &$1, &$3);
+         }
+       | rvalue ASR rvalue
+         {
+             @1.last_column = @3.last_column;
+             assert_signedness(c, &@1, $1.signedness);
+             if ($1.signedness == UNSIGNED) {
+                 $$ = gen_bin_op(c, &@1, LSR_OP, &$1, &$3);
+             } else if ($1.signedness == SIGNED) {
+                 $$ = gen_bin_op(c, &@1, ASR_OP, &$1, &$3);
+             }
+         }
+       | rvalue LSR rvalue
+         {
+             @1.last_column = @3.last_column;
+             $$ = gen_bin_op(c, &@1, LSR_OP, &$1, &$3);
+         }
+       | rvalue '&' rvalue
+         {
+             @1.last_column = @3.last_column;
+             $$ = gen_bin_op(c, &@1, ANDB_OP, &$1, &$3);
+         }
+       | rvalue '|' rvalue
+         {
+             @1.last_column = @3.last_column;
+             $$ = gen_bin_op(c, &@1, ORB_OP, &$1, &$3);
+         }
+       | rvalue '^' rvalue
+         {
+             @1.last_column = @3.last_column;
+             $$ = gen_bin_op(c, &@1, XORB_OP, &$1, &$3);
+         }
+       | rvalue ANDL rvalue
+         {
+             @1.last_column = @3.last_column;
+             $$ = gen_bin_op(c, &@1, ANDL_OP, &$1, &$3);
+         }
+       | MIN '(' rvalue ',' rvalue ')'
+         {
+             @1.last_column = @3.last_column;
+             $$ = gen_bin_op(c, &@1, MINI_OP, &$3, &$5);
+         }
+       | MAX '(' rvalue ',' rvalue ')'
+         {
+             @1.last_column = @3.last_column;
+             $$ = gen_bin_op(c, &@1, MAXI_OP, &$3, &$5);
+         }
+       | '~' rvalue
+         {
+             @1.last_column = @2.last_column;
+             $$ = gen_rvalue_not(c, &@1, &$2);
+         }
+       | '!' rvalue
+         {
+             @1.last_column = @2.last_column;
+             $$ = gen_rvalue_notl(c, &@1, &$2);
+         }
+       | SAT '(' IMM ',' rvalue ')'
+         {
+             @1.last_column = @6.last_column;
+             $$ = gen_rvalue_sat(c, &@1, &$1, &$3, &$5);
+         }
+       | CAST rvalue
+         {
+             @1.last_column = @2.last_column;
+             /* Assign target signedness */
+             $2.signedness = $1.signedness;
+             $$ = gen_cast_op(c, &@1, &$2, $1.bit_width, $1.signedness);
+         }
+       | rvalue EQ rvalue
+         {
+             @1.last_column = @3.last_column;
+             $$ = gen_bin_cmp(c, &@1, TCG_COND_EQ, &$1, &$3);
+         }
+       | rvalue NEQ rvalue
+         {
+             @1.last_column = @3.last_column;
+             $$ = gen_bin_cmp(c, &@1, TCG_COND_NE, &$1, &$3);
+         }
+       | rvalue '<' rvalue
+         {
+             @1.last_column = @3.last_column;
+
+             assert_signedness(c, &@1, $1.signedness);
+             assert_signedness(c, &@1, $3.signedness);
+             if ($1.signedness == UNSIGNED || $3.signedness == UNSIGNED) {
+                 $$ = gen_bin_cmp(c, &@1, TCG_COND_LTU, &$1, &$3);
+             } else {
+                 $$ = gen_bin_cmp(c, &@1, TCG_COND_LT, &$1, &$3);
+             }
+         }
+       | rvalue '>' rvalue
+         {
+             @1.last_column = @3.last_column;
+
+             assert_signedness(c, &@1, $1.signedness);
+             assert_signedness(c, &@1, $3.signedness);
+             if ($1.signedness == UNSIGNED || $3.signedness == UNSIGNED) {
+                 $$ = gen_bin_cmp(c, &@1, TCG_COND_GTU, &$1, &$3);
+             } else {
+                 $$ = gen_bin_cmp(c, &@1, TCG_COND_GT, &$1, &$3);
+             }
+         }
+       | rvalue LTE rvalue
+         {
+             @1.last_column = @3.last_column;
+
+             assert_signedness(c, &@1, $1.signedness);
+             assert_signedness(c, &@1, $3.signedness);
+             if ($1.signedness == UNSIGNED || $3.signedness == UNSIGNED) {
+                 $$ = gen_bin_cmp(c, &@1, TCG_COND_LEU, &$1, &$3);
+             } else {
+                 $$ = gen_bin_cmp(c, &@1, TCG_COND_LE, &$1, &$3);
+             }
+         }
+       | rvalue GTE rvalue
+         {
+             @1.last_column = @3.last_column;
+
+             assert_signedness(c, &@1, $1.signedness);
+             assert_signedness(c, &@1, $3.signedness);
+             if ($1.signedness == UNSIGNED || $3.signedness == UNSIGNED) {
+                 $$ = gen_bin_cmp(c, &@1, TCG_COND_GEU, &$1, &$3);
+             } else {
+                 $$ = gen_bin_cmp(c, &@1, TCG_COND_GE, &$1, &$3);
+             }
+         }
+       | rvalue '?'
+         {
+             $1.is_manual = true;
+             Ternary t = { 0 };
+             t.state = IN_LEFT;
+             t.cond = $1;
+             g_array_append_val(c->ternary, t);
+         }
+         rvalue ':'
+         {
+             Ternary *t = &g_array_index(c->ternary, Ternary,
+                                         c->ternary->len - 1);
+             t->state = IN_RIGHT;
+         }
+         rvalue
+         {
+             @1.last_column = @5.last_column;
+             $$ = gen_rvalue_ternary(c, &@1, &$1, &$4, &$7);
+         }
+       | FSCR '(' rvalue ')'
+         {
+             @1.last_column = @4.last_column;
+             $$ = gen_rvalue_fscr(c, &@1, &$3);
+         }
+       | SXT '(' rvalue ',' IMM ',' rvalue ')'
+         {
+             @1.last_column = @8.last_column;
+             yyassert(c, &@1, $5.type == IMMEDIATE &&
+                      $5.imm.type == VALUE,
+                      "SXT expects immediate values\n");
+             $$ = gen_extend_op(c, &@1, &$3, $5.imm.value, &$7, SIGNED);
+         }
+       | ZXT '(' rvalue ',' IMM ',' rvalue ')'
+         {
+             @1.last_column = @8.last_column;
+             yyassert(c, &@1, $5.type == IMMEDIATE &&
+                      $5.imm.type == VALUE,
+                      "ZXT expects immediate values\n");
+             $$ = gen_extend_op(c, &@1, &$3, $5.imm.value, &$7, UNSIGNED);
+         }
+       | '(' rvalue ')'
+         {
+             $$ = $2;
+         }
+       | ABS rvalue
+         {
+             @1.last_column = @2.last_column;
+             $$ = gen_rvalue_abs(c, &@1, &$2);
+         }
+       | CROUND '(' rvalue ',' rvalue ')'
+         {
+             @1.last_column = @6.last_column;
+             $$ = gen_convround_n(c, &@1, &$3, &$5);
+         }
+       | CROUND '(' rvalue ')'
+         {
+             @1.last_column = @4.last_column;
+             $$ = gen_convround(c, &@1, &$3);
+         }
+       | ROUND '(' rvalue ',' rvalue ')'
+         {
+             @1.last_column = @6.last_column;
+             $$ = gen_round(c, &@1, &$3, &$5);
+         }
+       | '-' rvalue
+         {
+             @1.last_column = @2.last_column;
+             $$ = gen_rvalue_neg(c, &@1, &$2);
+         }
+       | ICIRC '(' rvalue ')' ASL IMM
+         {
+             @1.last_column = @6.last_column;
+             $$ = gen_tmp(c, &@1, 32, UNSIGNED);
+             OUT(c, &@1, "gen_read_ireg(", &$$, ", ", &$3, ", ", &$6, ");\n");
+             gen_rvalue_free(c, &@1, &$3);
+         }
+       | CIRCADD '(' rvalue ',' rvalue ',' rvalue ')'
+         {
+             @1.last_column = @8.last_column;
+             gen_circ_op(c, &@1, &$3, &$5, &$7);
+         }
+       | LOCNT '(' rvalue ')'
+         {
+             @1.last_column = @4.last_column;
+             /* Leading ones count */
+             $$ = gen_locnt_op(c, &@1, &$3);
+         }
+       | COUNTONES '(' rvalue ')'
+         {
+             @1.last_column = @4.last_column;
+             /* Ones count */
+             $$ = gen_ctpop_op(c, &@1, &$3);
+         }
+       | LPCFG
+         {
+             $$ = gen_tmp_value(c, &@1, "0", 32, UNSIGNED);
+             OUT(c, &@1, "GET_USR_FIELD(USR_LPCFG, ", &$$, ");\n");
+         }
+       | EXTRACT '(' rvalue ',' rvalue ')'
+         {
+             @1.last_column = @6.last_column;
+             $$ = gen_extract_op(c, &@1, &$5, &$3, &$1);
+         }
+       | EXTRANGE '(' rvalue ',' rvalue ',' rvalue ')'
+         {
+             @1.last_column = @8.last_column;
+             yyassert(c, &@1, $5.type == IMMEDIATE &&
+                      $5.imm.type == VALUE &&
+                      $7.type == IMMEDIATE &&
+                      $7.imm.type == VALUE,
+                      "Range extract needs immediate values!\n");
+             $$ = gen_rextract_op(c,
+                                  &@1,
+                                  &$3,
+                                  $7.imm.value,
+                                  $5.imm.value - $7.imm.value + 1);
+         }
+       | CAST4_8U '(' rvalue ')'
+         {
+             @1.last_column = @4.last_column;
+             $$ = gen_rvalue_truncate(c, &@1, &$3);
+             $$.signedness = UNSIGNED;
+             $$ = rvalue_materialize(c, &@1, &$$);
+             $$ = gen_rvalue_extend(c, &@1, &$$);
+         }
+       | BREV '(' rvalue ')'
+         {
+             @1.last_column = @4.last_column;
+             $$ = gen_rvalue_brev(c, &@1, &$3);
+         }
+       | ROTL '(' rvalue ',' rvalue ')'
+         {
+             @1.last_column = @6.last_column;
+             $$ = gen_rotl(c, &@1, &$3, &$5);
+         }
+       | ADDSAT64 '(' rvalue ',' rvalue ',' rvalue ')'
+         {
+             @1.last_column = @8.last_column;
+             gen_addsat64(c, &@1, &$3, &$5, &$7);
+         }
+       | CARRY_FROM_ADD '(' rvalue ',' rvalue ',' rvalue ')'
+         {
+             @1.last_column = @8.last_column;
+             $$ = gen_carry_from_add(c, &@1, &$3, &$5, &$7);
+         }
+       | LSBNEW '(' rvalue ')'
+         {
+             @1.last_column = @4.last_column;
+             HexValue one = gen_imm_value(c, &@1, 1, 32, UNSIGNED);
+             $$ = gen_bin_op(c, &@1, ANDB_OP, &$3, &one);
+         }
+       ;
+
+lvalue : FAIL
+         {
+             @1.last_column = @1.last_column;
+             yyassert(c, &@1, false, "Encountered a FAIL token as lvalue.\n");
+         }
+       | REG
+         {
+             $$ = $1;
+         }
+       | var
+         {
+             $$ = $1;
+         }
+       ;
+
+%%
+
+int main(int argc, char **argv)
+{
+    if (argc != 5) {
+        fprintf(stderr,
+                "Semantics: Hexagon ISA to tinycode generator compiler\n\n");
+        fprintf(stderr,
+                "Usage: ./semantics IDEFS EMITTER_C EMITTER_H "
+                "ENABLED_INSTRUCTIONS_LIST\n");
+        return 1;
+    }
+
+    enum {
+        ARG_INDEX_ARGV0 = 0,
+        ARG_INDEX_IDEFS,
+        ARG_INDEX_EMITTER_C,
+        ARG_INDEX_EMITTER_H,
+        ARG_INDEX_ENABLED_INSTRUCTIONS_LIST
+    };
+
+    FILE *enabled_file = fopen(argv[ARG_INDEX_ENABLED_INSTRUCTIONS_LIST], "w");
+
+    FILE *output_file = fopen(argv[ARG_INDEX_EMITTER_C], "w");
+    fputs("#include \"qemu/osdep.h\"\n", output_file);
+    fputs("#include \"qemu/log.h\"\n", output_file);
+    fputs("#include \"cpu.h\"\n", output_file);
+    fputs("#include \"internal.h\"\n", output_file);
+    fputs("#include \"tcg/tcg-op.h\"\n", output_file);
+    fputs("#include \"insn.h\"\n", output_file);
+    fputs("#include \"opcodes.h\"\n", output_file);
+    fputs("#include \"translate.h\"\n", output_file);
+    fputs("#define QEMU_GENERATE\n", output_file);
+    fputs("#include \"genptr.h\"\n", output_file);
+    fputs("#include \"tcg/tcg.h\"\n", output_file);
+    fputs("#include \"macros.h\"\n", output_file);
+    fprintf(output_file, "#include \"%s\"\n", argv[ARG_INDEX_EMITTER_H]);
+
+    FILE *defines_file = fopen(argv[ARG_INDEX_EMITTER_H], "w");
+    assert(defines_file != NULL);
+    fputs("#ifndef HEX_EMITTER_H\n", defines_file);
+    fputs("#define HEX_EMITTER_H\n", defines_file);
+    fputs("\n", defines_file);
+    fputs("#include \"insn.h\"\n\n", defines_file);
+
+    /* Parser input file */
+    Context context = { 0 };
+    context.defines_file = defines_file;
+    context.output_file = output_file;
+    context.enabled_file = enabled_file;
+    /* Initialize buffers */
+    context.out_str = g_string_new(NULL);
+    context.signature_str = g_string_new(NULL);
+    context.header_str = g_string_new(NULL);
+    context.ternary = g_array_new(FALSE, TRUE, sizeof(Ternary));
+    /* Read input file */
+    FILE *input_file = fopen(argv[ARG_INDEX_IDEFS], "r");
+    fseek(input_file, 0L, SEEK_END);
+    long input_size = ftell(input_file);
+    context.input_buffer = (char *) calloc(input_size + 1, sizeof(char));
+    fseek(input_file, 0L, SEEK_SET);
+    size_t read_chars = fread(context.input_buffer,
+                              sizeof(char),
+                              input_size,
+                              input_file);
+    if (read_chars != (size_t) input_size) {
+        fprintf(stderr, "Error: an error occurred while reading input file!\n");
+        return -1;
+    }
+    yylex_init(&context.scanner);
+    YY_BUFFER_STATE buffer;
+    buffer = yy_scan_string(context.input_buffer, context.scanner);
+    /* Start the parsing procedure */
+    yyparse(context.scanner, &context);
+    if (context.implemented_insn != context.total_insn) {
+        fprintf(stderr,
+                "Warning: %d/%d meta instructions have been implemented!\n",
+                context.implemented_insn,
+                context.total_insn);
+    }
+    fputs("#endif " START_COMMENT " HEX_EMITTER_h " END_COMMENT "\n",
+          defines_file);
+    /* Cleanup */
+    yy_delete_buffer(buffer, context.scanner);
+    yylex_destroy(context.scanner);
+    free(context.input_buffer);
+    g_string_free(context.out_str, TRUE);
+    g_string_free(context.signature_str, TRUE);
+    g_string_free(context.header_str, TRUE);
+    g_array_free(context.ternary, TRUE);
+    fclose(output_file);
+    fclose(input_file);
+    fclose(defines_file);
+    fclose(enabled_file);
+
+    return 0;
+}
diff --git a/target/hexagon/idef-parser/parser-helpers.c b/target/hexagon/idef-parser/parser-helpers.c
new file mode 100644
index 0000000000..44b52ae6b0
--- /dev/null
+++ b/target/hexagon/idef-parser/parser-helpers.c
@@ -0,0 +1,2346 @@
+/*
+ *  Copyright(c) 2019-2022 rev.ng Labs Srl. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <assert.h>
+#include <inttypes.h>
+#include <stdarg.h>
+#include <stdbool.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+
+#include "idef-parser.h"
+#include "parser-helpers.h"
+#include "idef-parser.tab.h"
+#include "idef-parser.yy.h"
+
+void yyerror(YYLTYPE *locp,
+             yyscan_t scanner __attribute__((unused)),
+             Context *c,
+             const char *s)
+{
+    const char *code_ptr = c->input_buffer;
+
+    fprintf(stderr, "WARNING (%s): '%s'\n", c->inst.name->str, s);
+
+    fprintf(stderr, "Problematic range: ");
+    for (int i = locp->first_column; i < locp->last_column; i++) {
+        if (code_ptr[i] != '\n') {
+            fprintf(stderr, "%c", code_ptr[i]);
+        }
+    }
+    fprintf(stderr, "\n");
+
+    for (unsigned i = 0;
+         i < 80 &&
+         code_ptr[locp->first_column - 10 + i] != '\0' &&
+         code_ptr[locp->first_column - 10 + i] != '\n';
+         i++) {
+        fprintf(stderr, "%c", code_ptr[locp->first_column - 10 + i]);
+    }
+    fprintf(stderr, "\n");
+    for (unsigned i = 0; i < 9; i++) {
+        fprintf(stderr, " ");
+    }
+    fprintf(stderr, "^");
+    for (int i = 0; i < (locp->last_column - locp->first_column) - 1; i++) {
+        fprintf(stderr, "~");
+    }
+    fprintf(stderr, "\n");
+    c->inst.error_count++;
+}
+
+bool is_direct_predicate(HexValue *value)
+{
+    return value->pred.id >= '0' && value->pred.id <= '3';
+}
+
+bool is_inside_ternary(Context *c)
+{
+    return c->ternary->len > 0;
+}
+
+/* Print functions */
+void str_print(Context *c, YYLTYPE *locp, const char *string)
+{
+    (void) locp;
+    EMIT(c, "%s", string);
+}
+
+void uint8_print(Context *c, YYLTYPE *locp, uint8_t *num)
+{
+    (void) locp;
+    EMIT(c, "%u", *num);
+}
+
+void uint64_print(Context *c, YYLTYPE *locp, uint64_t *num)
+{
+    (void) locp;
+    EMIT(c, "%" PRIu64, *num);
+}
+
+void int_print(Context *c, YYLTYPE *locp, int *num)
+{
+    (void) locp;
+    EMIT(c, "%d", *num);
+}
+
+void uint_print(Context *c, YYLTYPE *locp, unsigned *num)
+{
+    (void) locp;
+    EMIT(c, "%u", *num);
+}
+
+void tmp_print(Context *c, YYLTYPE *locp, HexTmp *tmp)
+{
+    (void) locp;
+    EMIT(c, "tmp_%d", tmp->index);
+}
+
+void pred_print(Context *c, YYLTYPE *locp, HexPred *pred, bool is_dotnew)
+{
+    (void) locp;
+    char suffix = is_dotnew ? 'N' : 'V';
+    EMIT(c, "P%c%c", pred->id, suffix);
+}
+
+void reg_compose(Context *c, YYLTYPE *locp, HexReg *reg, char reg_id[5])
+{
+    memset(reg_id, 0, 5 * sizeof(char));
+    switch (reg->type) {
+    case GENERAL_PURPOSE:
+        reg_id[0] = 'R';
+        break;
+    case CONTROL:
+        reg_id[0] = 'C';
+        break;
+    case MODIFIER:
+        reg_id[0] = 'M';
+        break;
+    case DOTNEW:
+        reg_id[0] = 'N';
+        reg_id[1] = reg->id;
+        reg_id[2] = 'N';
+        return;
+    }
+    switch (reg->bit_width) {
+    case 32:
+        reg_id[1] = reg->id;
+        reg_id[2] = 'V';
+        break;
+    case 64:
+        reg_id[1] = reg->id;
+        reg_id[2] = reg->id;
+        reg_id[3] = 'V';
+        break;
+    default:
+        yyassert(c, locp, false, "Unhandled register bit width!\n");
+    }
+}
+
+static void reg_arg_print(Context *c, YYLTYPE *locp, HexReg *reg)
+{
+    char reg_id[5];
+    reg_compose(c, locp, reg, reg_id);
+    EMIT(c, "%s", reg_id);
+}
+
+void reg_print(Context *c, YYLTYPE *locp, HexReg *reg)
+{
+    (void) locp;
+    EMIT(c, "hex_gpr[%u]", reg->id);
+}
+
+void imm_print(Context *c, YYLTYPE *locp, HexImm *imm)
+{
+    switch (imm->type) {
+    case I:
+        EMIT(c, "i");
+        break;
+    case VARIABLE:
+        EMIT(c, "%ciV", imm->id);
+        break;
+    case VALUE:
+        EMIT(c, "((int64_t) %" PRIu64 "ULL)", (int64_t) imm->value);
+        break;
+    case QEMU_TMP:
+        EMIT(c, "qemu_tmp_%" PRIu64, imm->index);
+        break;
+    case IMM_PC:
+        EMIT(c, "ctx->base.pc_next");
+        break;
+    case IMM_NPC:
+        EMIT(c, "ctx->npc");
+        break;
+    case IMM_CONSTEXT:
+        EMIT(c, "insn->extension_valid");
+        break;
+    default:
+        yyassert(c, locp, false, "Cannot print this expression!");
+    }
+}
+
+void var_print(Context *c, YYLTYPE *locp, HexVar *var)
+{
+    (void) locp;
+    EMIT(c, "%s", var->name->str);
+}
+
+void rvalue_print(Context *c, YYLTYPE *locp, void *pointer)
+{
+  HexValue *rvalue = (HexValue *) pointer;
+  switch (rvalue->type) {
+  case REGISTER:
+      reg_print(c, locp, &rvalue->reg);
+      break;
+  case REGISTER_ARG:
+      reg_arg_print(c, locp, &rvalue->reg);
+      break;
+  case TEMP:
+      tmp_print(c, locp, &rvalue->tmp);
+      break;
+  case IMMEDIATE:
+      imm_print(c, locp, &rvalue->imm);
+      break;
+  case VARID:
+      var_print(c, locp, &rvalue->var);
+      break;
+  case PREDICATE:
+      pred_print(c, locp, &rvalue->pred, rvalue->is_dotnew);
+      break;
+  default:
+      yyassert(c, locp, false, "Cannot print this expression!");
+  }
+}
+
+void out_assert(Context *c, YYLTYPE *locp,
+                void *dummy __attribute__((unused)))
+{
+    abort();
+    yyassert(c, locp, false, "Unhandled print type!");
+}
+
+/* Copy output code buffer */
+void commit(Context *c)
+{
+    /* Emit instruction pseudocode */
+    EMIT_SIG(c, "\n" START_COMMENT " ");
+    for (char *x = c->inst.code_begin; x < c->inst.code_end; x++) {
+        EMIT_SIG(c, "%c", *x);
+    }
+    EMIT_SIG(c, " " END_COMMENT "\n");
+
+    /* Commit instruction code to output file */
+    fwrite(c->signature_str->str, sizeof(char), c->signature_str->len,
+           c->output_file);
+    fwrite(c->header_str->str, sizeof(char), c->header_str->len,
+           c->output_file);
+    fwrite(c->out_str->str, sizeof(char), c->out_str->len,
+           c->output_file);
+
+    fwrite(c->signature_str->str, sizeof(char), c->signature_str->len,
+           c->defines_file);
+    fprintf(c->defines_file, ";\n");
+}
+
+static void gen_c_int_type(Context *c, YYLTYPE *locp, unsigned bit_width,
+                           HexSignedness signedness)
+{
+    const char *signstr = (signedness == UNSIGNED) ? "u" : "";
+    OUT(c, locp, signstr, "int", &bit_width, "_t");
+}
+
+static HexValue gen_constant(Context *c,
+                             YYLTYPE *locp,
+                             const char *value,
+                             unsigned bit_width,
+                             HexSignedness signedness)
+{
+    HexValue rvalue;
+    assert(bit_width == 32 || bit_width == 64);
+    memset(&rvalue, 0, sizeof(HexValue));
+    rvalue.type = TEMP;
+    rvalue.bit_width = bit_width;
+    rvalue.signedness = signedness;
+    rvalue.is_dotnew = false;
+    rvalue.is_manual = true;
+    rvalue.tmp.index = c->inst.tmp_count;
+    OUT(c, locp, "TCGv_i", &bit_width, " tmp_", &c->inst.tmp_count,
+        " = tcg_constant_i", &bit_width, "(", value, ");\n");
+    c->inst.tmp_count++;
+    return rvalue;
+}
+
+/* Temporary values creation */
+HexValue gen_tmp(Context *c,
+                 YYLTYPE *locp,
+                 unsigned bit_width,
+                 HexSignedness signedness)
+{
+    HexValue rvalue;
+    assert(bit_width == 32 || bit_width == 64);
+    memset(&rvalue, 0, sizeof(HexValue));
+    rvalue.type = TEMP;
+    rvalue.bit_width = bit_width;
+    rvalue.signedness = signedness;
+    rvalue.is_dotnew = false;
+    rvalue.is_manual = false;
+    rvalue.tmp.index = c->inst.tmp_count;
+    OUT(c, locp, "TCGv_i", &bit_width, " tmp_", &c->inst.tmp_count,
+        " = tcg_temp_new_i", &bit_width, "();\n");
+    c->inst.tmp_count++;
+    return rvalue;
+}
+
+HexValue gen_tmp_local(Context *c,
+                       YYLTYPE *locp,
+                       unsigned bit_width,
+                       HexSignedness signedness)
+{
+    HexValue rvalue;
+    assert(bit_width == 32 || bit_width == 64);
+    memset(&rvalue, 0, sizeof(HexValue));
+    rvalue.type = TEMP;
+    rvalue.bit_width = bit_width;
+    rvalue.signedness = signedness;
+    rvalue.is_dotnew = false;
+    rvalue.is_manual = false;
+    rvalue.tmp.index = c->inst.tmp_count;
+    OUT(c, locp, "TCGv_i", &bit_width, " tmp_", &c->inst.tmp_count,
+        " = tcg_temp_local_new_i", &bit_width, "();\n");
+    c->inst.tmp_count++;
+    return rvalue;
+}
+
+HexValue gen_tmp_value(Context *c,
+                       YYLTYPE *locp,
+                       const char *value,
+                       unsigned bit_width,
+                       HexSignedness signedness)
+{
+    HexValue rvalue;
+    assert(bit_width == 32 || bit_width == 64);
+    memset(&rvalue, 0, sizeof(HexValue));
+    rvalue.type = TEMP;
+    rvalue.bit_width = bit_width;
+    rvalue.signedness = signedness;
+    rvalue.is_dotnew = false;
+    rvalue.is_manual = false;
+    rvalue.tmp.index = c->inst.tmp_count;
+    OUT(c, locp, "TCGv_i", &bit_width, " tmp_", &c->inst.tmp_count,
+        " = tcg_const_i", &bit_width, "(", value, ");\n");
+    c->inst.tmp_count++;
+    return rvalue;
+}
+
+static HexValue gen_tmp_value_from_imm(Context *c,
+                                       YYLTYPE *locp,
+                                       HexValue *value)
+{
+    HexValue rvalue;
+    assert(value->type == IMMEDIATE);
+    memset(&rvalue, 0, sizeof(HexValue));
+    rvalue.type = TEMP;
+    rvalue.bit_width = value->bit_width;
+    rvalue.signedness = value->signedness;
+    rvalue.is_dotnew = false;
+    rvalue.is_manual = false;
+    rvalue.tmp.index = c->inst.tmp_count;
+    /*
+     * Here we output the call to `tcg_const_i<width>` in
+     * order to create the temporary value. Note, that we
+     * add a cast
+     *
+     *   `tcg_const_i<width>`((int<width>_t) ...)`
+     *
+     * This cast is required to avoid implicit integer
+     * conversion warnings since all immediates are
+     * output as `((int64_t) 123ULL)`, even if the
+     * integer is 32-bit.
+     */
+    OUT(c, locp, "TCGv_i", &rvalue.bit_width, " tmp_", &c->inst.tmp_count);
+    OUT(c, locp, " = tcg_const_i", &rvalue.bit_width,
+        "((int", &rvalue.bit_width, "_t) (", value, "));\n");
+
+    c->inst.tmp_count++;
+    return rvalue;
+}
+
+HexValue gen_imm_value(Context *c __attribute__((unused)),
+                       YYLTYPE *locp,
+                       int value,
+                       unsigned bit_width,
+                       HexSignedness signedness)
+{
+    (void) locp;
+    HexValue rvalue;
+    assert(bit_width == 32 || bit_width == 64);
+    memset(&rvalue, 0, sizeof(HexValue));
+    rvalue.type = IMMEDIATE;
+    rvalue.bit_width = bit_width;
+    rvalue.signedness = signedness;
+    rvalue.is_dotnew = false;
+    rvalue.is_manual = false;
+    rvalue.imm.type = VALUE;
+    rvalue.imm.value = value;
+    return rvalue;
+}
+
+HexValue gen_imm_qemu_tmp(Context *c, YYLTYPE *locp, unsigned bit_width,
+                          HexSignedness signedness)
+{
+    (void) locp;
+    HexValue rvalue;
+    assert(bit_width == 32 || bit_width == 64);
+    memset(&rvalue, 0, sizeof(HexValue));
+    rvalue.type = IMMEDIATE;
+    rvalue.is_dotnew = false;
+    rvalue.is_manual = false;
+    rvalue.bit_width = bit_width;
+    rvalue.signedness = signedness;
+    rvalue.imm.type = QEMU_TMP;
+    rvalue.imm.index = c->inst.qemu_tmp_count++;
+    return rvalue;
+}
+
+void gen_rvalue_free(Context *c, YYLTYPE *locp, HexValue *rvalue)
+{
+    if (rvalue->type == TEMP && !rvalue->is_manual) {
+        const char *bit_suffix = (rvalue->bit_width == 64) ? "i64" : "i32";
+        OUT(c, locp, "tcg_temp_free_", bit_suffix, "(", rvalue, ");\n");
+    }
+}
+
+static void gen_rvalue_free_manual(Context *c, YYLTYPE *locp, HexValue *rvalue)
+{
+    rvalue->is_manual = false;
+    gen_rvalue_free(c, locp, rvalue);
+}
+
+HexValue rvalue_materialize(Context *c, YYLTYPE *locp, HexValue *rvalue)
+{
+    if (rvalue->type == IMMEDIATE) {
+        HexValue res = gen_tmp_value_from_imm(c, locp, rvalue);
+        gen_rvalue_free(c, locp, rvalue);
+        return res;
+    }
+    return *rvalue;
+}
+
+HexValue gen_rvalue_extend(Context *c, YYLTYPE *locp, HexValue *rvalue)
+{
+    assert_signedness(c, locp, rvalue->signedness);
+    if (rvalue->bit_width > 32) {
+        return *rvalue;
+    }
+
+    if (rvalue->type == IMMEDIATE) {
+        HexValue res = gen_imm_qemu_tmp(c, locp, 64, rvalue->signedness);
+        bool is_unsigned = (rvalue->signedness == UNSIGNED);
+        const char *sign_suffix = is_unsigned ? "u" : "";
+        gen_c_int_type(c, locp, 64, rvalue->signedness);
+        OUT(c, locp, " ", &res, " = ");
+        OUT(c, locp, "(", sign_suffix, "int64_t) ");
+        OUT(c, locp, "(", sign_suffix, "int32_t) ");
+        OUT(c, locp, rvalue, ";\n");
+        return res;
+    } else {
+        HexValue res = gen_tmp(c, locp, 64, rvalue->signedness);
+        bool is_unsigned = (rvalue->signedness == UNSIGNED);
+        const char *sign_suffix = is_unsigned ? "u" : "";
+        OUT(c, locp, "tcg_gen_ext", sign_suffix,
+            "_i32_i64(", &res, ", ", rvalue, ");\n");
+        gen_rvalue_free(c, locp, rvalue);
+        return res;
+    }
+}
+
+HexValue gen_rvalue_truncate(Context *c, YYLTYPE *locp, HexValue *rvalue)
+{
+    if (rvalue->type == IMMEDIATE) {
+        HexValue res = *rvalue;
+        res.bit_width = 32;
+        return res;
+    } else {
+        if (rvalue->bit_width == 64) {
+            HexValue res = gen_tmp(c, locp, 32, rvalue->signedness);
+            OUT(c, locp, "tcg_gen_trunc_i64_tl(", &res, ", ", rvalue, ");\n");
+            gen_rvalue_free(c, locp, rvalue);
+            return res;
+        }
+    }
+    return *rvalue;
+}
+
+/*
+ * Attempts to lookup the `Var` struct associated with the given `varid`.
+ * The `dst` argument is populated with the found name, bit_width, and
+ * signedness, given that `dst` is non-NULL. Returns true if the lookup
+ * succeeded and false otherwise.
+ */
+static bool try_find_variable(Context *c, YYLTYPE *locp,
+                              HexValue *dst,
+                              HexValue *varid)
+{
+    yyassert(c, locp, varid, "varid to lookup is NULL");
+    yyassert(c, locp, varid->type == VARID,
+             "Can only lookup variables by varid");
+    for (unsigned i = 0; i < c->inst.allocated->len; i++) {
+        Var *curr = &g_array_index(c->inst.allocated, Var, i);
+        if (g_string_equal(varid->var.name, curr->name)) {
+            if (dst) {
+                dst->var.name = curr->name;
+                dst->bit_width = curr->bit_width;
+                dst->signedness = curr->signedness;
+            }
+            return true;
+        }
+    }
+    return false;
+}
+
+/* Calls `try_find_variable` and asserts succcess. */
+static void find_variable(Context *c, YYLTYPE *locp,
+                          HexValue *dst,
+                          HexValue *varid)
+{
+    bool found = try_find_variable(c, locp, dst, varid);
+    yyassert(c, locp, found, "Use of undeclared variable!\n");
+}
+
+/* Handle signedness, if both unsigned -> result is unsigned, else signed */
+static inline HexSignedness bin_op_signedness(Context *c, YYLTYPE *locp,
+                                              HexSignedness sign1,
+                                              HexSignedness sign2)
+{
+    assert_signedness(c, locp, sign1);
+    assert_signedness(c, locp, sign2);
+    return (sign1 == UNSIGNED && sign2 == UNSIGNED) ? UNSIGNED : SIGNED;
+}
+
+void gen_varid_allocate(Context *c,
+                        YYLTYPE *locp,
+                        HexValue *varid,
+                        unsigned bit_width,
+                        HexSignedness signedness)
+{
+    const char *bit_suffix = (bit_width == 64) ? "i64" : "i32";
+    bool found = try_find_variable(c, locp, NULL, varid);
+    Var new_var;
+
+    memset(&new_var, 0, sizeof(Var));
+
+    yyassert(c, locp, !found, "Redeclaration of variables not allowed!");
+    assert_signedness(c, locp, signedness);
+
+    /* `varid` only carries name information */
+    new_var.name = varid->var.name;
+    new_var.bit_width = bit_width;
+    new_var.signedness = signedness;
+
+    EMIT_HEAD(c, "TCGv_%s %s", bit_suffix, varid->var.name->str);
+    EMIT_HEAD(c, " = tcg_temp_local_new_%s();\n", bit_suffix);
+    g_array_append_val(c->inst.allocated, new_var);
+}
+
+enum OpTypes {
+    IMM_IMM = 0,
+    IMM_REG = 1,
+    REG_IMM = 2,
+    REG_REG = 3,
+};
+
+HexValue gen_bin_cmp(Context *c,
+                     YYLTYPE *locp,
+                     TCGCond type,
+                     HexValue *op1,
+                     HexValue *op2)
+{
+    HexValue op1_m = *op1;
+    HexValue op2_m = *op2;
+    enum OpTypes op_types = (op1_m.type != IMMEDIATE) << 1
+                            | (op2_m.type != IMMEDIATE);
+
+    bool op_is64bit = op1_m.bit_width == 64 || op2_m.bit_width == 64;
+    const char *bit_suffix = op_is64bit ? "i64" : "i32";
+    unsigned bit_width = (op_is64bit) ? 64 : 32;
+    HexValue res = gen_tmp(c, locp, bit_width, UNSIGNED);
+
+    /* Extend to 64-bits, if required */
+    if (op_is64bit) {
+        op1_m = gen_rvalue_extend(c, locp, &op1_m);
+        op2_m = gen_rvalue_extend(c, locp, &op2_m);
+    }
+
+    switch (op_types) {
+    case IMM_IMM:
+    case IMM_REG:
+        yyassert(c, locp, false, "Binary comparisons between IMM op IMM and"
+                                 "IMM op REG not handled!");
+        break;
+    case REG_IMM:
+        OUT(c, locp, "tcg_gen_setcondi_", bit_suffix, "(");
+        OUT(c, locp, cond_to_str(type), ", ", &res, ", ", &op1_m, ", ", &op2_m,
+            ");\n");
+        break;
+    case REG_REG:
+        OUT(c, locp, "tcg_gen_setcond_", bit_suffix, "(");
+        OUT(c, locp, cond_to_str(type), ", ", &res, ", ", &op1_m, ", ", &op2_m,
+            ");\n");
+        break;
+    default:
+        fprintf(stderr, "Error in evalutating immediateness!");
+        abort();
+    }
+
+    /* Free operands */
+    gen_rvalue_free(c, locp, &op1_m);
+    gen_rvalue_free(c, locp, &op2_m);
+
+    return res;
+}
+
+static void gen_simple_op(Context *c, YYLTYPE *locp, unsigned bit_width,
+                          const char *bit_suffix, HexValue *res,
+                          enum OpTypes op_types,
+                          HexValue *op1,
+                          HexValue *op2,
+                          const char *imm_imm,
+                          const char *imm_reg,
+                          const char *reg_imm,
+                          const char *reg_reg)
+{
+    switch (op_types) {
+    case IMM_IMM: {
+        HexSignedness signedness = bin_op_signedness(c, locp,
+                                                     op1->signedness,
+                                                     op2->signedness);
+        gen_c_int_type(c, locp, bit_width, signedness);
+        OUT(c, locp, " ", res,
+            " = ", op1, imm_imm, op2, ";\n");
+    } break;
+    case IMM_REG:
+        OUT(c, locp, imm_reg, bit_suffix,
+            "(", res, ", ", op2, ", ", op1, ");\n");
+        break;
+    case REG_IMM:
+        OUT(c, locp, reg_imm, bit_suffix,
+            "(", res, ", ", op1, ", ", op2, ");\n");
+        break;
+    case REG_REG:
+        OUT(c, locp, reg_reg, bit_suffix,
+            "(", res, ", ", op1, ", ", op2, ");\n");
+        break;
+    }
+    gen_rvalue_free(c, locp, op1);
+    gen_rvalue_free(c, locp, op2);
+}
+
+static void gen_sub_op(Context *c, YYLTYPE *locp, unsigned bit_width,
+                       const char *bit_suffix, HexValue *res,
+                       enum OpTypes op_types, HexValue *op1,
+                       HexValue *op2)
+{
+    switch (op_types) {
+    case IMM_IMM: {
+        HexSignedness signedness = bin_op_signedness(c, locp,
+                                                     op1->signedness,
+                                                     op2->signedness);
+        gen_c_int_type(c, locp, bit_width, signedness);
+        OUT(c, locp, " ", res,
+            " = ", op1, " - ", op2, ";\n");
+    } break;
+    case IMM_REG: {
+        OUT(c, locp, "tcg_gen_subfi_", bit_suffix,
+            "(", res, ", ", op1, ", ", op2, ");\n");
+    } break;
+    case REG_IMM: {
+        OUT(c, locp, "tcg_gen_subi_", bit_suffix,
+            "(", res, ", ", op1, ", ", op2, ");\n");
+    } break;
+    case REG_REG: {
+        OUT(c, locp, "tcg_gen_sub_", bit_suffix,
+            "(", res, ", ", op1, ", ", op2, ");\n");
+    } break;
+    }
+    gen_rvalue_free(c, locp, op1);
+    gen_rvalue_free(c, locp, op2);
+}
+
+static void gen_asl_op(Context *c, YYLTYPE *locp, unsigned bit_width,
+                       bool op_is64bit, const char *bit_suffix,
+                       HexValue *res, enum OpTypes op_types,
+                       HexValue *op1, HexValue *op2)
+{
+    HexValue op1_m = *op1;
+    HexValue op2_m = *op2;
+    switch (op_types) {
+    case IMM_IMM: {
+        HexSignedness signedness = bin_op_signedness(c, locp,
+                                                     op1->signedness,
+                                                     op2->signedness);
+        gen_c_int_type(c, locp, bit_width, signedness);
+        OUT(c, locp, " ", res,
+            " = ", op1, " << ", op2, ";\n");
+    } break;
+    case REG_IMM: {
+        OUT(c, locp, "if (", op2, " >= ", &bit_width, ") {\n");
+        OUT(c, locp, "tcg_gen_movi_", bit_suffix, "(", res, ", 0);\n");
+        OUT(c, locp, "} else {\n");
+        OUT(c, locp, "tcg_gen_shli_", bit_suffix,
+                "(", res, ", ", op1, ", ", op2, ");\n");
+        OUT(c, locp, "}\n");
+    } break;
+    case IMM_REG:
+        op1_m.bit_width = bit_width;
+        op1_m = rvalue_materialize(c, locp, &op1_m);
+        /* fallthrough */
+    case REG_REG: {
+        OUT(c, locp, "tcg_gen_shl_", bit_suffix,
+            "(", res, ", ", &op1_m, ", ", op2, ");\n");
+    } break;
+    }
+    if (op_types == IMM_REG || op_types == REG_REG) {
+        /*
+         * Handle left shift by 64/32 which hexagon-sim expects to clear out
+         * register
+         */
+        HexValue zero = gen_constant(c, locp, "0", bit_width, UNSIGNED);
+        HexValue edge = gen_imm_value(c, locp, bit_width, bit_width, UNSIGNED);
+        edge = rvalue_materialize(c, locp, &edge);
+        if (op_is64bit) {
+            op2_m = gen_rvalue_extend(c, locp, &op2_m);
+        }
+        op1_m = rvalue_materialize(c, locp, &op1_m);
+        op2_m = rvalue_materialize(c, locp, &op2_m);
+        OUT(c, locp, "tcg_gen_movcond_i", &bit_width);
+        OUT(c, locp, "(TCG_COND_GEU, ", res, ", ", &op2_m, ", ", &edge);
+        OUT(c, locp, ", ", &zero, ", ", res, ");\n");
+        gen_rvalue_free(c, locp, &edge);
+    }
+    gen_rvalue_free(c, locp, &op1_m);
+    gen_rvalue_free(c, locp, &op2_m);
+}
+
+static void gen_asr_op(Context *c, YYLTYPE *locp, unsigned bit_width,
+                       bool op_is64bit, const char *bit_suffix,
+                       HexValue *res, enum OpTypes op_types,
+                       HexValue *op1, HexValue *op2)
+{
+    HexValue op1_m = *op1;
+    HexValue op2_m = *op2;
+    switch (op_types) {
+    case IMM_IMM:
+    case IMM_REG:
+        yyassert(c, locp, false, "ASR between IMM op IMM, and IMM op REG"
+                                 " not handled!");
+        break;
+    case REG_IMM: {
+        HexSignedness signedness = bin_op_signedness(c, locp,
+                                                     op1->signedness,
+                                                     op2->signedness);
+        OUT(c, locp, "{\n");
+        gen_c_int_type(c, locp, bit_width, signedness);
+        OUT(c, locp, " shift = ", op2, ";\n");
+        OUT(c, locp, "if (", op2, " >= ", &bit_width, ") {\n");
+        OUT(c, locp, "    shift = ", &bit_width, " - 1;\n");
+        OUT(c, locp, "}\n");
+        OUT(c, locp, "tcg_gen_sari_", bit_suffix,
+            "(", res, ", ", op1, ", shift);\n}\n");
+    } break;
+    case REG_REG:
+        OUT(c, locp, "tcg_gen_sar_", bit_suffix,
+            "(", res, ", ", &op1_m, ", ", op2, ");\n");
+        break;
+    }
+    if (op_types == REG_REG) {
+        /* Handle right shift by values >= bit_width */
+        const char *offset = op_is64bit ? "63" : "31";
+        HexValue tmp = gen_tmp(c, locp, bit_width, SIGNED);
+        HexValue zero = gen_constant(c, locp, "0", bit_width, SIGNED);
+        HexValue edge = gen_imm_value(c, locp, bit_width, bit_width, UNSIGNED);
+
+        edge = rvalue_materialize(c, locp, &edge);
+        if (op_is64bit) {
+            op2_m = gen_rvalue_extend(c, locp, &op2_m);
+        }
+        op1_m = rvalue_materialize(c, locp, &op1_m);
+        op2_m = rvalue_materialize(c, locp, &op2_m);
+
+        OUT(c, locp, "tcg_gen_extract_", bit_suffix, "(",
+            &tmp, ", ", &op1_m, ", ", offset, ", 1);\n");
+        OUT(c, locp, "tcg_gen_sub_", bit_suffix, "(",
+            &tmp, ", ", &zero, ", ", &tmp, ");\n");
+        OUT(c, locp, "tcg_gen_movcond_i", &bit_width);
+        OUT(c, locp, "(TCG_COND_GEU, ", res, ", ", &op2_m, ", ", &edge);
+        OUT(c, locp, ", ", &tmp, ", ", res, ");\n");
+        gen_rvalue_free(c, locp, &edge);
+        gen_rvalue_free(c, locp, &tmp);
+    }
+    gen_rvalue_free(c, locp, &op1_m);
+    gen_rvalue_free(c, locp, &op2_m);
+}
+
+static void gen_lsr_op(Context *c, YYLTYPE *locp, unsigned bit_width,
+                       bool op_is64bit, const char *bit_suffix,
+                       HexValue *res, enum OpTypes op_types,
+                       HexValue *op1, HexValue *op2)
+{
+    HexValue op1_m = *op1;
+    HexValue op2_m = *op2;
+    switch (op_types) {
+    case IMM_IMM:
+    case IMM_REG:
+        yyassert(c, locp, false, "LSR between IMM op IMM, and IMM op REG"
+                                 " not handled!");
+        break;
+    case REG_IMM:
+        OUT(c, locp, "if (", op2, " >= ", &bit_width, ") {\n");
+        OUT(c, locp, "tcg_gen_movi_", bit_suffix, "(", res, ", 0);\n");
+        OUT(c, locp, "} else {\n");
+        OUT(c, locp, "tcg_gen_shri_", bit_suffix,
+            "(", res, ", ", op1, ", ", op2, ");\n");
+        OUT(c, locp, "}\n");
+        break;
+    case REG_REG:
+        OUT(c, locp, "tcg_gen_shr_", bit_suffix,
+            "(", res, ", ", &op1_m, ", ", op2, ");\n");
+        break;
+    }
+    if (op_types == REG_REG) {
+        /* Handle right shift by values >= bit_width */
+        HexValue zero = gen_constant(c, locp, "0", bit_width, UNSIGNED);
+        HexValue edge = gen_imm_value(c, locp, bit_width, bit_width, UNSIGNED);
+        edge = rvalue_materialize(c, locp, &edge);
+        if (op_is64bit) {
+            op2_m = gen_rvalue_extend(c, locp, &op2_m);
+        }
+        op1_m = rvalue_materialize(c, locp, &op1_m);
+        op2_m = rvalue_materialize(c, locp, &op2_m);
+        OUT(c, locp, "tcg_gen_movcond_i", &bit_width);
+        OUT(c, locp, "(TCG_COND_GEU, ", res, ", ", &op2_m, ", ", &edge);
+        OUT(c, locp, ", ", &zero, ", ", res, ");\n");
+        gen_rvalue_free(c, locp, &edge);
+    }
+    gen_rvalue_free(c, locp, &op1_m);
+    gen_rvalue_free(c, locp, &op2_m);
+}
+
+/*
+ * Note: This implementation of logical `and` does not mirror that in C.
+ * We do not short-circuit logical expressions!
+ */
+static void gen_andl_op(Context *c, YYLTYPE *locp, unsigned bit_width,
+                        const char *bit_suffix, HexValue *res,
+                        enum OpTypes op_types, HexValue *op1,
+                        HexValue *op2)
+{
+    (void) bit_width;
+    HexValue tmp1, tmp2;
+    HexValue zero = gen_constant(c, locp, "0", 32, UNSIGNED);
+    memset(&tmp1, 0, sizeof(HexValue));
+    memset(&tmp2, 0, sizeof(HexValue));
+    switch (op_types) {
+    case IMM_IMM:
+    case IMM_REG:
+    case REG_IMM:
+        yyassert(c, locp, false, "ANDL between IMM op IMM, IMM op REG, and"
+                                 " REG op IMM, not handled!");
+        break;
+    case REG_REG:
+        tmp1 = gen_bin_cmp(c, locp, TCG_COND_NE, op1, &zero);
+        tmp2 = gen_bin_cmp(c, locp, TCG_COND_NE, op2, &zero);
+        OUT(c, locp, "tcg_gen_and_", bit_suffix,
+            "(", res, ", ", &tmp1, ", ", &tmp2, ");\n");
+        gen_rvalue_free_manual(c, locp, &zero);
+        gen_rvalue_free(c, locp, &tmp1);
+        gen_rvalue_free(c, locp, &tmp2);
+        break;
+    }
+}
+
+static void gen_minmax_op(Context *c, YYLTYPE *locp, unsigned bit_width,
+                          HexValue *res, enum OpTypes op_types,
+                          HexValue *op1, HexValue *op2, bool minmax)
+{
+    const char *mm;
+    HexValue op1_m = *op1;
+    HexValue op2_m = *op2;
+    bool is_unsigned;
+
+    assert_signedness(c, locp, res->signedness);
+    is_unsigned = res->signedness == UNSIGNED;
+
+    if (minmax) {
+        /* Max */
+        mm = is_unsigned ? "tcg_gen_umax" : "tcg_gen_smax";
+    } else {
+        /* Min */
+        mm = is_unsigned ? "tcg_gen_umin" : "tcg_gen_smin";
+    }
+    switch (op_types) {
+    case IMM_IMM:
+        yyassert(c, locp, false, "MINMAX between IMM op IMM, not handled!");
+        break;
+    case IMM_REG:
+        op1_m.bit_width = bit_width;
+        op1_m = rvalue_materialize(c, locp, &op1_m);
+        OUT(c, locp, mm, "_i", &bit_width, "(");
+        OUT(c, locp, res, ", ", &op1_m, ", ", op2, ");\n");
+        break;
+    case REG_IMM:
+        op2_m.bit_width = bit_width;
+        op2_m = rvalue_materialize(c, locp, &op2_m);
+        /* Fallthrough */
+    case REG_REG:
+        OUT(c, locp, mm, "_i", &bit_width, "(");
+        OUT(c, locp, res, ", ", op1, ", ", &op2_m, ");\n");
+        break;
+    }
+    gen_rvalue_free(c, locp, &op1_m);
+    gen_rvalue_free(c, locp, &op2_m);
+}
+
+/* Code generation functions */
+HexValue gen_bin_op(Context *c,
+                    YYLTYPE *locp,
+                    OpType type,
+                    HexValue *op1,
+                    HexValue *op2)
+{
+    /* Replicate operands to avoid side effects */
+    HexValue op1_m = *op1;
+    HexValue op2_m = *op2;
+    enum OpTypes op_types;
+    bool op_is64bit;
+    HexSignedness signedness;
+    unsigned bit_width;
+    const char *bit_suffix;
+    HexValue res;
+
+    memset(&res, 0, sizeof(HexValue));
+
+    /*
+     * If the operands are VARID's we need to look up the
+     * type information.
+     */
+    if (op1_m.type == VARID) {
+        find_variable(c, locp, &op1_m, &op1_m);
+    }
+    if (op2_m.type == VARID) {
+        find_variable(c, locp, &op2_m, &op2_m);
+    }
+
+    op_types = (op1_m.type != IMMEDIATE) << 1
+               | (op2_m.type != IMMEDIATE);
+    op_is64bit = op1_m.bit_width == 64 || op2_m.bit_width == 64;
+    /* Shift greater than 32 are 64 bits wide */
+
+    if (type == ASL_OP && op2_m.type == IMMEDIATE &&
+        op2_m.imm.type == VALUE && op2_m.imm.value >= 32) {
+        op_is64bit = true;
+    }
+
+    bit_width = (op_is64bit) ? 64 : 32;
+    bit_suffix = op_is64bit ? "i64" : "i32";
+
+    /* Extend to 64-bits, if required */
+    if (op_is64bit) {
+        op1_m = gen_rvalue_extend(c, locp, &op1_m);
+        op2_m = gen_rvalue_extend(c, locp, &op2_m);
+    }
+
+    signedness = bin_op_signedness(c, locp, op1_m.signedness, op2_m.signedness);
+    if (op_types != IMM_IMM) {
+        res = gen_tmp(c, locp, bit_width, signedness);
+    } else {
+        res = gen_imm_qemu_tmp(c, locp, bit_width, signedness);
+    }
+
+    switch (type) {
+    case ADD_OP:
+        gen_simple_op(c, locp, bit_width, bit_suffix, &res,
+                      op_types, &op1_m, &op2_m,
+                      " + ",
+                      "tcg_gen_addi_",
+                      "tcg_gen_addi_",
+                      "tcg_gen_add_");
+        break;
+    case SUB_OP:
+        gen_sub_op(c, locp, bit_width, bit_suffix, &res, op_types,
+                   &op1_m, &op2_m);
+        break;
+    case MUL_OP:
+        gen_simple_op(c, locp, bit_width, bit_suffix, &res,
+                      op_types, &op1_m, &op2_m,
+                      " * ",
+                      "tcg_gen_muli_",
+                      "tcg_gen_muli_",
+                      "tcg_gen_mul_");
+        break;
+    case ASL_OP:
+        gen_asl_op(c, locp, bit_width, op_is64bit, bit_suffix, &res, op_types,
+                   &op1_m, &op2_m);
+        break;
+    case ASR_OP:
+        gen_asr_op(c, locp, bit_width, op_is64bit, bit_suffix, &res, op_types,
+                   &op1_m, &op2_m);
+        break;
+    case LSR_OP:
+        gen_lsr_op(c, locp, bit_width, op_is64bit, bit_suffix, &res, op_types,
+                   &op1_m, &op2_m);
+        break;
+    case ANDB_OP:
+        gen_simple_op(c, locp, bit_width, bit_suffix, &res,
+                      op_types, &op1_m, &op2_m,
+                      " & ",
+                      "tcg_gen_andi_",
+                      "tcg_gen_andi_",
+                      "tcg_gen_and_");
+        break;
+    case ORB_OP:
+        gen_simple_op(c, locp, bit_width, bit_suffix, &res,
+                      op_types, &op1_m, &op2_m,
+                      " | ",
+                      "tcg_gen_ori_",
+                      "tcg_gen_ori_",
+                      "tcg_gen_or_");
+        break;
+    case XORB_OP:
+        gen_simple_op(c, locp, bit_width, bit_suffix, &res,
+                      op_types, &op1_m, &op2_m,
+                      " ^ ",
+                      "tcg_gen_xori_",
+                      "tcg_gen_xori_",
+                      "tcg_gen_xor_");
+        break;
+    case ANDL_OP:
+        gen_andl_op(c, locp, bit_width, bit_suffix, &res, op_types, &op1_m,
+                    &op2_m);
+        break;
+    case MINI_OP:
+        gen_minmax_op(c, locp, bit_width, &res, op_types, &op1_m, &op2_m,
+                      false);
+        break;
+    case MAXI_OP:
+        gen_minmax_op(c, locp, bit_width, &res, op_types, &op1_m, &op2_m, true);
+        break;
+    }
+    return res;
+}
+
+HexValue gen_cast_op(Context *c,
+                     YYLTYPE *locp,
+                     HexValue *src,
+                     unsigned target_width,
+                     HexSignedness signedness)
+{
+    assert_signedness(c, locp, src->signedness);
+    if (src->bit_width == target_width) {
+        return *src;
+    } else if (src->type == IMMEDIATE) {
+        HexValue res = *src;
+        res.bit_width = target_width;
+        res.signedness = signedness;
+        return res;
+    } else {
+        HexValue res = gen_tmp(c, locp, target_width, signedness);
+        /* Truncate */
+        if (src->bit_width > target_width) {
+            OUT(c, locp, "tcg_gen_trunc_i64_tl(", &res, ", ", src, ");\n");
+        } else {
+            assert_signedness(c, locp, src->signedness);
+            if (src->signedness == UNSIGNED) {
+                /* Extend unsigned */
+                OUT(c, locp, "tcg_gen_extu_i32_i64(",
+                    &res, ", ", src, ");\n");
+            } else {
+                /* Extend signed */
+                OUT(c, locp, "tcg_gen_ext_i32_i64(",
+                    &res, ", ", src, ");\n");
+            }
+        }
+        gen_rvalue_free(c, locp, src);
+        return res;
+    }
+}
+
+
+/*
+ * Implements an extension when the `src_width` is an immediate.
+ * If the `value` to extend is also an immediate we use `extract/sextract`
+ * from QEMU `bitops.h`. If `value` is a TCGv then we rely on
+ * `tcg_gen_extract/tcg_gen_sextract`.
+ */
+static HexValue gen_extend_imm_width_op(Context *c,
+                                        YYLTYPE *locp,
+                                        HexValue *src_width,
+                                        unsigned dst_width,
+                                        HexValue *value,
+                                        HexSignedness signedness)
+{
+    /*
+     * If the source width is not an immediate value, we need to guard
+     * our extend op with if statements to handle the case where
+     * `src_width_m` is 0.
+     */
+    const char *sign_prefix;
+    bool need_guarding;
+
+    assert_signedness(c, locp, signedness);
+    assert(dst_width == 64 || dst_width == 32);
+    assert(src_width->type == IMMEDIATE);
+
+    sign_prefix = (signedness == UNSIGNED) ? "" : "s";
+    need_guarding = (src_width->imm.type != VALUE);
+
+    if (src_width->imm.type == VALUE &&
+        src_width->imm.value == 0) {
+        /*
+         * We can bail out early if the source width is known to be zero
+         * at translation time.
+         */
+        return gen_imm_value(c, locp, 0, dst_width, signedness);
+    }
+
+    if (value->type == IMMEDIATE) {
+        /*
+         * If both the value and source width are immediates,
+         * we can perform the extension at translation time
+         * using QEMUs bitops.
+         */
+        HexValue res = gen_imm_qemu_tmp(c, locp, dst_width, signedness);
+        gen_c_int_type(c, locp, dst_width, signedness);
+        OUT(c, locp, " ", &res, " = 0;\n");
+        if (need_guarding) {
+            OUT(c, locp, "if (", src_width, " != 0) {\n");
+        }
+        OUT(c, locp, &res, " = ", sign_prefix, "extract", &dst_width);
+        OUT(c, locp, "(", value, ", 0, ", src_width, ");\n");
+        if (need_guarding) {
+            OUT(c, locp, "}\n");
+        }
+
+        gen_rvalue_free(c, locp, value);
+        return res;
+    } else {
+        /*
+         * If the source width is an immediate and the value to
+         * extend is a TCGv, then use tcg_gen_extract/tcg_gen_sextract
+         */
+        HexValue res = gen_tmp(c, locp, dst_width, signedness);
+
+        /*
+         * If the width is an immediate value we know it is non-zero
+         * at this point, otherwise we need an if-statement
+         */
+        if (need_guarding) {
+            OUT(c, locp, "if (", src_width, " != 0) {\n");
+        }
+        OUT(c, locp, "tcg_gen_", sign_prefix, "extract_i", &dst_width);
+        OUT(c, locp, "(", &res, ", ", value, ", 0, ", src_width,
+            ");\n");
+        if (need_guarding) {
+            OUT(c, locp, "} else {\n");
+            OUT(c, locp, "tcg_gen_movi_i", &dst_width, "(", &res,
+                ", 0);\n");
+            OUT(c, locp, "}\n");
+        }
+
+        gen_rvalue_free(c, locp, value);
+        return res;
+    }
+}
+
+/*
+ * Implements an extension when the `src_width` is given by
+ * a TCGv. Here we need to reimplement the behaviour of
+ * `tcg_gen_extract` and the like using shifts and masks.
+ */
+static HexValue gen_extend_tcg_width_op(Context *c,
+                                        YYLTYPE *locp,
+                                        HexValue *src_width,
+                                        unsigned dst_width,
+                                        HexValue *value,
+                                        HexSignedness signedness)
+{
+    HexValue src_width_m = rvalue_materialize(c, locp, src_width);
+    HexValue zero = gen_constant(c, locp, "0", dst_width, UNSIGNED);
+    HexValue shift = gen_tmp(c, locp, dst_width, UNSIGNED);
+    HexValue res;
+
+    assert_signedness(c, locp, signedness);
+    assert(dst_width == 64 || dst_width == 32);
+    assert(src_width->type != IMMEDIATE);
+
+    res = gen_tmp(c, locp, dst_width, signedness);
+
+    OUT(c, locp, "tcg_gen_subfi_i", &dst_width);
+    OUT(c, locp, "(", &shift, ", ", &dst_width, ", ", &src_width_m, ");\n");
+    if (signedness == UNSIGNED) {
+        const char *mask_str = (dst_width == 32)
+            ? "0xffffffff"
+            : "0xffffffffffffffff";
+        HexValue mask = gen_tmp_value(c, locp, mask_str,
+                                     dst_width, UNSIGNED);
+        OUT(c, locp, "tcg_gen_shr_i", &dst_width, "(",
+            &mask, ", ", &mask, ", ", &shift, ");\n");
+        OUT(c, locp, "tcg_gen_and_i", &dst_width, "(",
+            &res, ", ", value, ", ", &mask, ");\n");
+        gen_rvalue_free(c, locp, &mask);
+    } else {
+        OUT(c, locp, "tcg_gen_shl_i", &dst_width, "(",
+            &res, ", ", value, ", ", &shift, ");\n");
+        OUT(c, locp, "tcg_gen_sar_i", &dst_width, "(",
+            &res, ", ", &res, ", ", &shift, ");\n");
+    }
+    OUT(c, locp, "tcg_gen_movcond_i", &dst_width, "(TCG_COND_EQ, ", &res,
+        ", ");
+    OUT(c, locp, &src_width_m, ", ", &zero, ", ", &zero, ", ", &res,
+        ");\n");
+
+    gen_rvalue_free(c, locp, &src_width_m);
+    gen_rvalue_free(c, locp, value);
+    gen_rvalue_free(c, locp, &shift);
+
+    return res;
+}
+
+HexValue gen_extend_op(Context *c,
+                       YYLTYPE *locp,
+                       HexValue *src_width,
+                       unsigned dst_width,
+                       HexValue *value,
+                       HexSignedness signedness)
+{
+    unsigned bit_width = (dst_width = 64) ? 64 : 32;
+    HexValue value_m = *value;
+    HexValue src_width_m = *src_width;
+
+    assert_signedness(c, locp, signedness);
+    yyassert(c, locp, value_m.bit_width <= bit_width &&
+                      src_width_m.bit_width <= bit_width,
+                      "Extending to a size smaller than the current size"
+                      " makes no sense");
+
+    if (value_m.bit_width < bit_width) {
+        value_m = gen_rvalue_extend(c, locp, &value_m);
+    }
+
+    if (src_width_m.bit_width < bit_width) {
+        src_width_m = gen_rvalue_extend(c, locp, &src_width_m);
+    }
+
+    if (src_width_m.type == IMMEDIATE) {
+        return gen_extend_imm_width_op(c, locp, &src_width_m, bit_width,
+                                       &value_m, signedness);
+    } else {
+        return gen_extend_tcg_width_op(c, locp, &src_width_m, bit_width,
+                                       &value_m, signedness);
+    }
+}
+
+/*
+ * Implements `rdeposit` for the special case where `width`
+ * is of TCGv type. In this case we need to reimplement the behaviour
+ * of `tcg_gen_deposit*` using binary operations and masks/shifts.
+ *
+ * Note: this is the only type of `rdeposit` that occurs, meaning the
+ * `width` is _NEVER_ of IMMEDIATE type.
+ */
+void gen_rdeposit_op(Context *c,
+                     YYLTYPE *locp,
+                     HexValue *dst,
+                     HexValue *value,
+                     HexValue *begin,
+                     HexValue *width)
+{
+    /*
+     * Otherwise if the width is not known, we fallback on reimplementing
+     * desposit in TCG.
+     */
+    HexValue begin_m = *begin;
+    HexValue value_m = *value;
+    HexValue width_m = *width;
+    const char *mask_str = (dst->bit_width == 32)
+        ? "0xffffffffUL"
+        : "0xffffffffffffffffUL";
+    HexValue mask = gen_constant(c, locp, mask_str, dst->bit_width,
+                                 UNSIGNED);
+    const char *dst_width_str = (dst->bit_width == 32) ? "32" : "64";
+    HexValue k64 = gen_constant(c, locp, dst_width_str, dst->bit_width,
+                                UNSIGNED);
+    HexValue res;
+    HexValue zero;
+
+    assert(dst->bit_width >= value->bit_width);
+    assert(begin->type == IMMEDIATE && begin->imm.type == VALUE);
+    assert(dst->type == REGISTER_ARG);
+
+    yyassert(c, locp, width->type != IMMEDIATE,
+             "Immediate index to rdeposit not handled!");
+
+    yyassert(c, locp, value_m.bit_width == dst->bit_width &&
+                      begin_m.bit_width == dst->bit_width &&
+                      width_m.bit_width == dst->bit_width,
+                      "Extension/truncation should be taken care of"
+                      " before rdeposit!");
+
+    width_m = rvalue_materialize(c, locp, &width_m);
+
+    /*
+     * mask = 0xffffffffffffffff >> (64 - width)
+     * mask = mask << begin
+     * value = (value << begin) & mask
+     * res = dst & ~mask
+     * res = res | value
+     * dst = (width != 0) ? res : dst
+     */
+    k64 = gen_bin_op(c, locp, SUB_OP, &k64, &width_m);
+    mask = gen_bin_op(c, locp, LSR_OP, &mask, &k64);
+    begin_m.is_manual = true;
+    mask = gen_bin_op(c, locp, ASL_OP, &mask, &begin_m);
+    mask.is_manual = true;
+    value_m = gen_bin_op(c, locp, ASL_OP, &value_m, &begin_m);
+    value_m = gen_bin_op(c, locp, ANDB_OP, &value_m, &mask);
+
+    OUT(c, locp, "tcg_gen_not_i", &dst->bit_width, "(", &mask, ", ",
+        &mask, ");\n");
+    mask.is_manual = false;
+    res = gen_bin_op(c, locp, ANDB_OP, dst, &mask);
+    res = gen_bin_op(c, locp, ORB_OP, &res, &value_m);
+
+    /*
+     * We don't need to truncate `res` here, since all operations involved use
+     * the same bit width.
+     */
+
+    /* If the width is zero, then return the identity dst = dst */
+    zero = gen_constant(c, locp, "0", res.bit_width, UNSIGNED);
+    OUT(c, locp, "tcg_gen_movcond_i", &res.bit_width, "(TCG_COND_NE, ",
+        dst);
+    OUT(c, locp, ", ", &width_m, ", ", &zero, ", ", &res, ", ", dst,
+        ");\n");
+
+    gen_rvalue_free(c, locp, width);
+    gen_rvalue_free(c, locp, &res);
+}
+
+void gen_deposit_op(Context *c,
+                    YYLTYPE *locp,
+                    HexValue *dst,
+                    HexValue *value,
+                    HexValue *index,
+                    HexCast *cast)
+{
+    HexValue value_m = *value;
+    unsigned bit_width = (dst->bit_width == 64) ? 64 : 32;
+    unsigned width = cast->bit_width;
+
+    yyassert(c, locp, index->type == IMMEDIATE,
+             "Deposit index must be immediate!\n");
+
+    /*
+     * Using tcg_gen_deposit_i**(dst, dst, ...) requires dst to be
+     * initialized.
+     */
+    gen_inst_init_args(c, locp);
+
+    /* If the destination value is 32, truncate the value, otherwise extend */
+    if (dst->bit_width != value->bit_width) {
+        if (bit_width == 32) {
+            value_m = gen_rvalue_truncate(c, locp, &value_m);
+        } else {
+            value_m = gen_rvalue_extend(c, locp, &value_m);
+        }
+    }
+    value_m = rvalue_materialize(c, locp, &value_m);
+    OUT(c, locp, "tcg_gen_deposit_i", &bit_width, "(", dst, ", ", dst, ", ");
+    OUT(c, locp, &value_m, ", ", index, " * ", &width, ", ", &width, ");\n");
+    gen_rvalue_free(c, locp, index);
+    gen_rvalue_free(c, locp, &value_m);
+}
+
+HexValue gen_rextract_op(Context *c,
+                         YYLTYPE *locp,
+                         HexValue *src,
+                         unsigned begin,
+                         unsigned width)
+{
+    unsigned bit_width = (src->bit_width == 64) ? 64 : 32;
+    HexValue res = gen_tmp(c, locp, bit_width, UNSIGNED);
+    OUT(c, locp, "tcg_gen_extract_i", &bit_width, "(", &res);
+    OUT(c, locp, ", ", src, ", ", &begin, ", ", &width, ");\n");
+    gen_rvalue_free(c, locp, src);
+    return res;
+}
+
+HexValue gen_extract_op(Context *c,
+                        YYLTYPE *locp,
+                        HexValue *src,
+                        HexValue *index,
+                        HexExtract *extract)
+{
+    unsigned bit_width = (src->bit_width == 64) ? 64 : 32;
+    unsigned width = extract->bit_width;
+    const char *sign_prefix;
+    HexValue res;
+
+    yyassert(c, locp, index->type == IMMEDIATE,
+             "Extract index must be immediate!\n");
+    assert_signedness(c, locp, extract->signedness);
+
+    sign_prefix = (extract->signedness == UNSIGNED) ? "" : "s";
+    res = gen_tmp(c, locp, bit_width, extract->signedness);
+
+    OUT(c, locp, "tcg_gen_", sign_prefix, "extract_i", &bit_width,
+        "(", &res, ", ", src);
+    OUT(c, locp, ", ", index, " * ", &width, ", ", &width, ");\n");
+
+    /* Some extract operations have bit_width != storage_bit_width */
+    if (extract->storage_bit_width > bit_width) {
+        HexValue tmp = gen_tmp(c, locp, extract->storage_bit_width,
+                               extract->signedness);
+        const char *sign_suffix = (extract->signedness == UNSIGNED) ? "u" : "";
+        OUT(c, locp, "tcg_gen_ext", sign_suffix, "_i32_i64(",
+            &tmp, ", ", &res, ");\n");
+        gen_rvalue_free(c, locp, &res);
+        res = tmp;
+    }
+
+    gen_rvalue_free(c, locp, src);
+    gen_rvalue_free(c, locp, index);
+    return res;
+}
+
+void gen_write_reg(Context *c, YYLTYPE *locp, HexValue *reg, HexValue *value)
+{
+    HexValue value_m = *value;
+    yyassert(c, locp, reg->type == REGISTER, "reg must be a register!");
+    value_m = gen_rvalue_truncate(c, locp, &value_m);
+    value_m = rvalue_materialize(c, locp, &value_m);
+    OUT(c,
+        locp,
+        "gen_log_reg_write(", &reg->reg.id, ", ",
+        &value_m, ");\n");
+    OUT(c,
+        locp,
+        "ctx_log_reg_write(ctx, ", &reg->reg.id,
+        ");\n");
+    gen_rvalue_free(c, locp, reg);
+    gen_rvalue_free(c, locp, &value_m);
+}
+
+void gen_assign(Context *c,
+                YYLTYPE *locp,
+                HexValue *dst,
+                HexValue *value)
+{
+    HexValue value_m = *value;
+    unsigned bit_width;
+
+    yyassert(c, locp, !is_inside_ternary(c),
+             "Assign in ternary not allowed!");
+
+    if (dst->type == REGISTER) {
+        gen_write_reg(c, locp, dst, &value_m);
+        return;
+    }
+
+    if (dst->type == VARID) {
+        find_variable(c, locp, dst, dst);
+    }
+    bit_width = dst->bit_width == 64 ? 64 : 32;
+
+    if (bit_width != value_m.bit_width) {
+        if (bit_width == 64) {
+            value_m = gen_rvalue_extend(c, locp, &value_m);
+        } else {
+            value_m = gen_rvalue_truncate(c, locp, &value_m);
+        }
+    }
+
+    const char *imm_suffix = (value_m.type == IMMEDIATE) ? "i" : "";
+    OUT(c, locp, "tcg_gen_mov", imm_suffix, "_i", &bit_width,
+        "(", dst, ", ", &value_m, ");\n");
+
+    gen_rvalue_free(c, locp, &value_m);
+}
+
+HexValue gen_convround(Context *c,
+                       YYLTYPE *locp,
+                       HexValue *src)
+{
+    HexValue src_m = *src;
+    unsigned bit_width = src_m.bit_width;
+    const char *size = (bit_width == 32) ? "32" : "64";
+    HexValue res = gen_tmp(c, locp, bit_width, src->signedness);
+    HexValue mask = gen_constant(c, locp, "0x3", bit_width, UNSIGNED);
+    HexValue one = gen_constant(c, locp, "1", bit_width, UNSIGNED);
+    HexValue and;
+    HexValue src_p1;
+
+    src_m.is_manual = true;
+
+    and = gen_bin_op(c, locp, ANDB_OP, &src_m, &mask);
+    src_p1 = gen_bin_op(c, locp, ADD_OP, &src_m, &one);
+
+    OUT(c, locp, "tcg_gen_movcond_i", size, "(TCG_COND_EQ, ", &res);
+    OUT(c, locp, ", ", &and, ", ", &mask, ", ");
+    OUT(c, locp, &src_p1, ", ", &src_m, ");\n");
+
+    /* Free src but use the original `is_manual` value */
+    gen_rvalue_free(c, locp, src);
+
+    /* Free the rest of the values */
+    gen_rvalue_free(c, locp, &src_p1);
+
+    return res;
+}
+
+static HexValue gen_convround_n_b(Context *c,
+                                  YYLTYPE *locp,
+                                  HexValue *a,
+                                  HexValue *n)
+{
+    HexValue one = gen_constant(c, locp, "1", 32, UNSIGNED);
+    HexValue res = gen_tmp(c, locp, 64, UNSIGNED);
+    HexValue tmp = gen_tmp(c, locp, 32, UNSIGNED);
+    HexValue tmp_64 = gen_tmp(c, locp, 64, UNSIGNED);
+
+    assert(n->type != IMMEDIATE);
+    OUT(c, locp, "tcg_gen_ext_i32_i64(", &res, ", ", a, ");\n");
+    OUT(c, locp, "tcg_gen_shl_i32(", &tmp);
+    OUT(c, locp, ", ", &one, ", ", n, ");\n");
+    OUT(c, locp, "tcg_gen_and_i32(", &tmp);
+    OUT(c, locp, ", ", &tmp, ", ", a, ");\n");
+    OUT(c, locp, "tcg_gen_shri_i32(", &tmp);
+    OUT(c, locp, ", ", &tmp, ", 1);\n");
+    OUT(c, locp, "tcg_gen_ext_i32_i64(", &tmp_64, ", ", &tmp, ");\n");
+    OUT(c, locp, "tcg_gen_add_i64(", &res);
+    OUT(c, locp, ", ", &res, ", ", &tmp_64, ");\n");
+
+    gen_rvalue_free(c, locp, &tmp);
+    gen_rvalue_free(c, locp, &tmp_64);
+
+    return res;
+}
+
+static HexValue gen_convround_n_c(Context *c,
+                                  YYLTYPE *locp,
+                                  HexValue *a,
+                                  HexValue *n)
+{
+    HexValue res = gen_tmp(c, locp, 64, UNSIGNED);
+    HexValue one = gen_constant(c, locp, "1", 32, UNSIGNED);
+    HexValue tmp = gen_tmp(c, locp, 32, UNSIGNED);
+    HexValue tmp_64 = gen_tmp(c, locp, 64, UNSIGNED);
+
+    OUT(c, locp, "tcg_gen_ext_i32_i64(", &res, ", ", a, ");\n");
+    OUT(c, locp, "tcg_gen_subi_i32(", &tmp);
+    OUT(c, locp, ", ", n, ", 1);\n");
+    OUT(c, locp, "tcg_gen_shl_i32(", &tmp);
+    OUT(c, locp, ", ", &one, ", ", &tmp, ");\n");
+    OUT(c, locp, "tcg_gen_ext_i32_i64(", &tmp_64, ", ", &tmp, ");\n");
+    OUT(c, locp, "tcg_gen_add_i64(", &res);
+    OUT(c, locp, ", ", &res, ", ", &tmp_64, ");\n");
+
+    gen_rvalue_free(c, locp, &one);
+    gen_rvalue_free(c, locp, &tmp);
+    gen_rvalue_free(c, locp, &tmp_64);
+
+    return res;
+}
+
+HexValue gen_convround_n(Context *c,
+                         YYLTYPE *locp,
+                         HexValue *src,
+                         HexValue *pos)
+{
+    HexValue zero = gen_constant(c, locp, "0", 64, UNSIGNED);
+    HexValue l_32 = gen_constant(c, locp, "1", 32, UNSIGNED);
+    HexValue cond = gen_tmp(c, locp, 32, UNSIGNED);
+    HexValue cond_64 = gen_tmp(c, locp, 64, UNSIGNED);
+    HexValue mask = gen_tmp(c, locp, 32, UNSIGNED);
+    HexValue n_64 = gen_tmp(c, locp, 64, UNSIGNED);
+    HexValue res = gen_tmp(c, locp, 64, UNSIGNED);
+    /* If input is 64 bit cast it to 32 */
+    HexValue src_casted = gen_cast_op(c, locp, src, 32, src->signedness);
+    HexValue pos_casted = gen_cast_op(c, locp, pos, 32, pos->signedness);
+    HexValue r1;
+    HexValue r2;
+    HexValue r3;
+
+    src_casted = rvalue_materialize(c, locp, &src_casted);
+    pos_casted = rvalue_materialize(c, locp, &pos_casted);
+
+    /*
+     * r1, r2, and r3 represent the results of three different branches.
+     *   - r1 picked if pos_casted == 0
+     *   - r2 picked if (src_casted & ((1 << (pos_casted - 1)) - 1)) == 0),
+     *     that is if bits 0, ..., pos_casted-1 are all 0.
+     *   - r3 picked otherwise.
+     */
+    r1 = gen_rvalue_extend(c, locp, &src_casted);
+    r2 = gen_convround_n_b(c, locp, &src_casted, &pos_casted);
+    r3 = gen_convround_n_c(c, locp, &src_casted, &pos_casted);
+
+    /*
+     * Calculate the condition
+     *   (src_casted & ((1 << (pos_casted - 1)) - 1)) == 0),
+     * which checks if the bits 0,...,pos-1 are all 0.
+     */
+    OUT(c, locp, "tcg_gen_sub_i32(", &mask);
+    OUT(c, locp, ", ", &pos_casted, ", ", &l_32, ");\n");
+    OUT(c, locp, "tcg_gen_shl_i32(", &mask);
+    OUT(c, locp, ", ", &l_32, ", ", &mask, ");\n");
+    OUT(c, locp, "tcg_gen_sub_i32(", &mask);
+    OUT(c, locp, ", ", &mask, ", ", &l_32, ");\n");
+    OUT(c, locp, "tcg_gen_and_i32(", &cond);
+    OUT(c, locp, ", ", &src_casted, ", ", &mask, ");\n");
+    OUT(c, locp, "tcg_gen_extu_i32_i64(", &cond_64, ", ", &cond, ");\n");
+
+    OUT(c, locp, "tcg_gen_ext_i32_i64(", &n_64, ", ", &pos_casted, ");\n");
+
+    /*
+     * if the bits 0, ..., pos_casted-1 are all 0, then pick r2 otherwise,
+     * pick r3.
+     */
+    OUT(c, locp, "tcg_gen_movcond_i64");
+    OUT(c, locp, "(TCG_COND_EQ, ", &res, ", ", &cond_64, ", ", &zero);
+    OUT(c, locp, ", ", &r2, ", ", &r3, ");\n");
+
+    /* Lastly, if the pos_casted == 0, then pick r1 */
+    OUT(c, locp, "tcg_gen_movcond_i64");
+    OUT(c, locp, "(TCG_COND_EQ, ", &res, ", ", &n_64, ", ", &zero);
+    OUT(c, locp, ", ", &r1, ", ", &res, ");\n");
+
+    /* Finally shift back val >>= n */
+    OUT(c, locp, "tcg_gen_shr_i64(", &res);
+    OUT(c, locp, ", ", &res, ", ", &n_64, ");\n");
+
+    gen_rvalue_free(c, locp, &src_casted);
+    gen_rvalue_free(c, locp, &pos_casted);
+
+    gen_rvalue_free(c, locp, &r1);
+    gen_rvalue_free(c, locp, &r2);
+    gen_rvalue_free(c, locp, &r3);
+
+    gen_rvalue_free(c, locp, &cond);
+    gen_rvalue_free(c, locp, &cond_64);
+    gen_rvalue_free(c, locp, &mask);
+    gen_rvalue_free(c, locp, &n_64);
+
+    res = gen_rvalue_truncate(c, locp, &res);
+    return res;
+}
+
+HexValue gen_round(Context *c,
+                   YYLTYPE *locp,
+                   HexValue *src,
+                   HexValue *pos)
+{
+    HexValue zero = gen_constant(c, locp, "0", 64, UNSIGNED);
+    HexValue one = gen_constant(c, locp, "1", 64, UNSIGNED);
+    HexValue res;
+    HexValue n_m1;
+    HexValue shifted;
+    HexValue sum;
+    HexValue src_width;
+    HexValue a;
+    HexValue b;
+
+    assert_signedness(c, locp, src->signedness);
+    yyassert(c, locp, src->bit_width <= 32,
+             "fRNDN not implemented for bit widths > 32!");
+
+    res = gen_tmp(c, locp, 64, src->signedness);
+
+    src_width = gen_imm_value(c, locp, src->bit_width, 32, UNSIGNED);
+    a = gen_extend_op(c, locp, &src_width, 64, src, SIGNED);
+    a = rvalue_materialize(c, locp, &a);
+
+    src_width = gen_imm_value(c, locp, 5, 32, UNSIGNED);
+    b = gen_extend_op(c, locp, &src_width, 64, pos, UNSIGNED);
+    b = rvalue_materialize(c, locp, &b);
+
+    /* Disable auto-free of values used more than once */
+    a.is_manual = true;
+    b.is_manual = true;
+
+    n_m1 = gen_bin_op(c, locp, SUB_OP, &b, &one);
+    shifted = gen_bin_op(c, locp, ASL_OP, &one, &n_m1);
+    sum = gen_bin_op(c, locp, ADD_OP, &shifted, &a);
+
+    OUT(c, locp, "tcg_gen_movcond_i64");
+    OUT(c, locp, "(TCG_COND_EQ, ", &res, ", ", &b, ", ", &zero);
+    OUT(c, locp, ", ", &a, ", ", &sum, ");\n");
+
+    gen_rvalue_free_manual(c, locp, &a);
+    gen_rvalue_free_manual(c, locp, &b);
+    gen_rvalue_free(c, locp, &sum);
+
+    return res;
+}
+
+/* Circular addressing mode with auto-increment */
+void gen_circ_op(Context *c,
+                 YYLTYPE *locp,
+                 HexValue *addr,
+                 HexValue *increment,
+                 HexValue *modifier)
+{
+    HexValue cs = gen_tmp(c, locp, 32, UNSIGNED);
+    HexValue increment_m = *increment;
+    increment_m = rvalue_materialize(c, locp, &increment_m);
+    OUT(c, locp, "gen_read_reg(", &cs, ", HEX_REG_CS0 + MuN);\n");
+    OUT(c,
+        locp,
+        "gen_helper_fcircadd(",
+        addr,
+        ", ",
+        addr,
+        ", ",
+        &increment_m,
+        ", ",
+        modifier);
+    OUT(c, locp, ", ", &cs, ");\n");
+    gen_rvalue_free(c, locp, &increment_m);
+    gen_rvalue_free(c, locp, modifier);
+    gen_rvalue_free(c, locp, &cs);
+}
+
+HexValue gen_locnt_op(Context *c, YYLTYPE *locp, HexValue *src)
+{
+    const char *bit_suffix = src->bit_width == 64 ? "64" : "32";
+    HexValue src_m = *src;
+    HexValue res;
+
+    assert_signedness(c, locp, src->signedness);
+    res = gen_tmp(c, locp, src->bit_width == 64 ? 64 : 32, src->signedness);
+    src_m = rvalue_materialize(c, locp, &src_m);
+    OUT(c, locp, "tcg_gen_not_i", bit_suffix, "(",
+        &res, ", ", &src_m, ");\n");
+    OUT(c, locp, "tcg_gen_clzi_i", bit_suffix, "(", &res, ", ", &res, ", ");
+    OUT(c, locp, bit_suffix, ");\n");
+    gen_rvalue_free(c, locp, &src_m);
+    return res;
+}
+
+HexValue gen_ctpop_op(Context *c, YYLTYPE *locp, HexValue *src)
+{
+    const char *bit_suffix = src->bit_width == 64 ? "64" : "32";
+    HexValue src_m = *src;
+    HexValue res;
+    assert_signedness(c, locp, src->signedness);
+    res = gen_tmp(c, locp, src->bit_width == 64 ? 64 : 32, src->signedness);
+    src_m = rvalue_materialize(c, locp, &src_m);
+    OUT(c, locp, "tcg_gen_ctpop_i", bit_suffix,
+        "(", &res, ", ", &src_m, ");\n");
+    gen_rvalue_free(c, locp, &src_m);
+    return res;
+}
+
+HexValue gen_rotl(Context *c, YYLTYPE *locp, HexValue *src, HexValue *width)
+{
+    const char *suffix = src->bit_width == 64 ? "i64" : "i32";
+    HexValue amount = *width;
+    HexValue res;
+    assert_signedness(c, locp, src->signedness);
+    res = gen_tmp(c, locp, src->bit_width, src->signedness);
+    if (amount.bit_width < src->bit_width) {
+        amount = gen_rvalue_extend(c, locp, &amount);
+    } else {
+        amount = gen_rvalue_truncate(c, locp, &amount);
+    }
+    amount = rvalue_materialize(c, locp, &amount);
+    OUT(c, locp, "tcg_gen_rotl_", suffix, "(",
+        &res, ", ", src, ", ", &amount, ");\n");
+    gen_rvalue_free(c, locp, src);
+    gen_rvalue_free(c, locp, &amount);
+
+    return res;
+}
+
+HexValue gen_carry_from_add(Context *c,
+                            YYLTYPE *locp,
+                            HexValue *op1,
+                            HexValue *op2,
+                            HexValue *op3)
+{
+    HexValue zero = gen_constant(c, locp, "0", 64, UNSIGNED);
+    HexValue res = gen_tmp(c, locp, 64, UNSIGNED);
+    HexValue cf = gen_tmp(c, locp, 64, UNSIGNED);
+    HexValue op1_m = rvalue_materialize(c, locp, op1);
+    HexValue op2_m = rvalue_materialize(c, locp, op2);
+    HexValue op3_m = rvalue_materialize(c, locp, op3);
+    op3_m = gen_rvalue_extend(c, locp, &op3_m);
+
+    OUT(c, locp, "tcg_gen_add2_i64(", &res, ", ", &cf, ", ", &op1_m, ", ",
+        &zero);
+    OUT(c, locp, ", ", &op3_m, ", ", &zero, ");\n");
+    OUT(c, locp, "tcg_gen_add2_i64(", &res, ", ", &cf, ", ", &res, ", ", &cf);
+    OUT(c, locp, ", ", &op2_m, ", ", &zero, ");\n");
+
+    gen_rvalue_free(c, locp, &op1_m);
+    gen_rvalue_free(c, locp, &op2_m);
+    gen_rvalue_free(c, locp, &op3_m);
+    gen_rvalue_free(c, locp, &res);
+    return cf;
+}
+
+void gen_addsat64(Context *c,
+                  YYLTYPE *locp,
+                  HexValue *dst,
+                  HexValue *op1,
+                  HexValue *op2)
+{
+    HexValue op1_m = rvalue_materialize(c, locp, op1);
+    HexValue op2_m = rvalue_materialize(c, locp, op2);
+    OUT(c, locp, "gen_add_sat_i64(", dst, ", ", &op1_m, ", ", &op2_m, ");\n");
+}
+
+void gen_inst(Context *c, GString *iname)
+{
+    c->total_insn++;
+    c->inst.name = iname;
+    c->inst.allocated = g_array_new(FALSE, FALSE, sizeof(Var));
+    c->inst.init_list = g_array_new(FALSE, FALSE, sizeof(HexValue));
+    c->inst.strings = g_array_new(FALSE, FALSE, sizeof(GString *));
+    EMIT_SIG(c, "void emit_%s(DisasContext *ctx, Insn *insn, Packet *pkt",
+             c->inst.name->str);
+}
+
+
+/*
+ * Initialize declared but uninitialized registers, but only for
+ * non-conditional instructions
+ */
+void gen_inst_init_args(Context *c, YYLTYPE *locp)
+{
+    if (!c->inst.init_list) {
+        return;
+    }
+
+    for (unsigned i = 0; i < c->inst.init_list->len; i++) {
+        HexValue *val = &g_array_index(c->inst.init_list, HexValue, i);
+        if (val->type == REGISTER_ARG) {
+            char reg_id[5];
+            reg_compose(c, locp, &val->reg, reg_id);
+            EMIT_HEAD(c, "tcg_gen_movi_i%u(%s, 0);\n", val->bit_width, reg_id);
+        } else if (val->type == PREDICATE) {
+            char suffix = val->is_dotnew ? 'N' : 'V';
+            EMIT_HEAD(c, "tcg_gen_movi_i%u(P%c%c, 0);\n", val->bit_width,
+                      val->pred.id, suffix);
+        } else {
+            yyassert(c, locp, false, "Invalid arg type!");
+        }
+    }
+
+    /* Free argument init list once we have initialized everything */
+    g_array_free(c->inst.init_list, TRUE);
+    c->inst.init_list = NULL;
+}
+
+void gen_inst_code(Context *c, YYLTYPE *locp)
+{
+    if (c->inst.error_count != 0) {
+        fprintf(stderr,
+                "Parsing of instruction %s generated %d errors!\n",
+                c->inst.name->str,
+                c->inst.error_count);
+    } else {
+        free_variables(c, locp);
+        c->implemented_insn++;
+        fprintf(c->enabled_file, "%s\n", c->inst.name->str);
+        emit_footer(c);
+        commit(c);
+    }
+    free_instruction(c);
+}
+
+void gen_pred_assign(Context *c, YYLTYPE *locp, HexValue *left_pred,
+                     HexValue *right_pred)
+{
+    char pred_id[2] = {left_pred->pred.id, 0};
+    bool is_direct = is_direct_predicate(left_pred);
+    HexValue r = rvalue_materialize(c, locp, right_pred);
+    r = gen_rvalue_truncate(c, locp, &r);
+    yyassert(c, locp, !is_inside_ternary(c),
+             "Predicate assign not allowed in ternary!");
+    /* Extract predicate TCGv */
+    if (is_direct) {
+        *left_pred = gen_tmp_value(c, locp, "0", 32, UNSIGNED);
+    }
+    /* Extract first 8 bits, and store new predicate value */
+    OUT(c, locp, "tcg_gen_mov_i32(", left_pred, ", ", &r, ");\n");
+    OUT(c, locp, "tcg_gen_andi_i32(", left_pred, ", ", left_pred,
+        ", 0xff);\n");
+    if (is_direct) {
+        OUT(c, locp, "gen_log_pred_write(ctx, ", pred_id, ", ", left_pred,
+            ");\n");
+        OUT(c, locp, "ctx_log_pred_write(ctx, ", pred_id, ");\n");
+        gen_rvalue_free(c, locp, left_pred);
+    }
+    /* Free temporary value */
+    gen_rvalue_free(c, locp, &r);
+}
+
+void gen_load(Context *c, YYLTYPE *locp, HexValue *width,
+              HexSignedness signedness, HexValue *ea, HexValue *dst)
+{
+    char size_suffix[4] = {0};
+    const char *sign_suffix;
+    /* Memop width is specified in the load macro */
+    assert_signedness(c, locp, signedness);
+    sign_suffix = (width->imm.value > 4)
+                   ? ""
+                   : ((signedness == UNSIGNED) ? "u" : "s");
+    /* If dst is a variable, assert that is declared and load the type info */
+    if (dst->type == VARID) {
+        find_variable(c, locp, dst, dst);
+    }
+
+    snprintf(size_suffix, 4, "%" PRIu64, width->imm.value * 8);
+    /* Lookup the effective address EA */
+    find_variable(c, locp, ea, ea);
+    OUT(c, locp, "if (insn->slot == 0 && pkt->pkt_has_store_s1) {\n");
+    OUT(c, locp, "process_store(ctx, pkt, 1);\n");
+    OUT(c, locp, "}\n");
+    OUT(c, locp, "tcg_gen_qemu_ld", size_suffix, sign_suffix);
+    OUT(c, locp, "(");
+    if (dst->bit_width > width->imm.value * 8) {
+        /*
+         * Cast to the correct TCG type if necessary, to avoid implict cast
+         * warnings. This is needed when the width of the destination var is
+         * larger than the size of the requested load.
+         */
+        OUT(c, locp, "(TCGv) ");
+    }
+    OUT(c, locp, dst, ", ", ea, ", ctx->mem_idx);\n");
+    /* If the var in EA was truncated it is now a tmp HexValue, so free it. */
+    gen_rvalue_free(c, locp, ea);
+}
+
+void gen_store(Context *c, YYLTYPE *locp, HexValue *width, HexValue *ea,
+               HexValue *src)
+{
+    HexValue src_m = *src;
+    /* Memop width is specified in the store macro */
+    unsigned mem_width = width->imm.value;
+    /* Lookup the effective address EA */
+    find_variable(c, locp, ea, ea);
+    src_m = rvalue_materialize(c, locp, &src_m);
+    OUT(c, locp, "gen_store", &mem_width, "(cpu_env, ", ea, ", ", &src_m);
+    OUT(c, locp, ", ctx, insn->slot);\n");
+    gen_rvalue_free(c, locp, &src_m);
+    /* If the var in ea was truncated it is now a tmp HexValue, so free it. */
+    gen_rvalue_free(c, locp, ea);
+}
+
+void gen_sethalf(Context *c, YYLTYPE *locp, HexCast *sh, HexValue *n,
+                 HexValue *dst, HexValue *value)
+{
+    yyassert(c, locp, n->type == IMMEDIATE,
+             "Deposit index must be immediate!\n");
+    if (dst->type == VARID) {
+        find_variable(c, locp, dst, dst);
+    }
+
+    gen_deposit_op(c, locp, dst, value, n, sh);
+}
+
+void gen_setbits(Context *c, YYLTYPE *locp, HexValue *hi, HexValue *lo,
+                 HexValue *dst, HexValue *value)
+{
+    unsigned len;
+    HexValue tmp;
+
+    yyassert(c, locp, hi->type == IMMEDIATE &&
+             hi->imm.type == VALUE &&
+             lo->type == IMMEDIATE &&
+             lo->imm.type == VALUE,
+             "Range deposit needs immediate values!\n");
+
+    *value = gen_rvalue_truncate(c, locp, value);
+    len = hi->imm.value + 1 - lo->imm.value;
+    tmp = gen_tmp(c, locp, 32, value->signedness);
+    /* Emit an `and` to ensure `value` is either 0 or 1. */
+    OUT(c, locp, "tcg_gen_andi_i32(", &tmp, ", ", value, ", 1);\n");
+    /* Use `neg` to map 0 -> 0 and 1 -> 0xffff... */
+    OUT(c, locp, "tcg_gen_neg_i32(", &tmp, ", ", &tmp, ");\n");
+    OUT(c, locp, "tcg_gen_deposit_i32(", dst, ", ", dst,
+        ", ", &tmp, ", ");
+    OUT(c, locp, lo, ", ", &len, ");\n");
+
+    gen_rvalue_free(c, locp, &tmp);
+    gen_rvalue_free(c, locp, hi);
+    gen_rvalue_free(c, locp, lo);
+    gen_rvalue_free(c, locp, value);
+}
+
+unsigned gen_if_cond(Context *c, YYLTYPE *locp, HexValue *cond)
+{
+    const char *bit_suffix;
+    /* Generate an end label, if false branch to that label */
+    OUT(c, locp, "TCGLabel *if_label_", &c->inst.if_count,
+        " = gen_new_label();\n");
+    *cond = rvalue_materialize(c, locp, cond);
+    bit_suffix = (cond->bit_width == 64) ? "i64" : "i32";
+    OUT(c, locp, "tcg_gen_brcondi_", bit_suffix, "(TCG_COND_EQ, ", cond,
+        ", 0, if_label_", &c->inst.if_count, ");\n");
+    gen_rvalue_free(c, locp, cond);
+    return c->inst.if_count++;
+}
+
+unsigned gen_if_else(Context *c, YYLTYPE *locp, unsigned index)
+{
+    unsigned if_index = c->inst.if_count++;
+    /* Generate label to jump if else is not verified */
+    OUT(c, locp, "TCGLabel *if_label_", &if_index,
+        " = gen_new_label();\n");
+    /* Jump out of the else statement */
+    OUT(c, locp, "tcg_gen_br(if_label_", &if_index, ");\n");
+    /* Fix the else label */
+    OUT(c, locp, "gen_set_label(if_label_", &index, ");\n");
+    return if_index;
+}
+
+HexValue gen_rvalue_pred(Context *c, YYLTYPE *locp, HexValue *pred)
+{
+    /* Predicted instructions need to zero out result args */
+    gen_inst_init_args(c, locp);
+
+    if (is_direct_predicate(pred)) {
+        bool is_dotnew = pred->is_dotnew;
+        char predicate_id[2] = { pred->pred.id, '\0' };
+        char *pred_str = (char *) &predicate_id;
+        *pred = gen_tmp_value(c, locp, "0", 32, UNSIGNED);
+        if (is_dotnew) {
+            OUT(c, locp, "tcg_gen_mov_i32(", pred,
+                ", hex_new_pred_value[");
+            OUT(c, locp, pred_str, "]);\n");
+        } else {
+            OUT(c, locp, "gen_read_preg(", pred, ", ", pred_str, ");\n");
+        }
+    }
+
+    return *pred;
+}
+
+HexValue gen_rvalue_var(Context *c, YYLTYPE *locp, HexValue *var)
+{
+    find_variable(c, locp, var, var);
+    return *var;
+}
+
+HexValue gen_rvalue_mpy(Context *c, YYLTYPE *locp, HexMpy *mpy,
+                        HexValue *op1, HexValue *op2)
+{
+    HexValue res;
+    memset(&res, 0, sizeof(HexValue));
+
+    assert_signedness(c, locp, mpy->first_signedness);
+    assert_signedness(c, locp, mpy->second_signedness);
+
+    *op1 = gen_cast_op(c, locp, op1, mpy->first_bit_width * 2,
+                     mpy->first_signedness);
+    /* Handle fMPTY3216.. */
+    if (mpy->first_bit_width == 32) {
+        *op2 = gen_cast_op(c, locp, op2, 64, mpy->second_signedness);
+    } else {
+        *op2 = gen_cast_op(c, locp, op2, mpy->second_bit_width * 2,
+                         mpy->second_signedness);
+    }
+    res = gen_bin_op(c, locp, MUL_OP, op1, op2);
+    /* Handle special cases required by the language */
+    if (mpy->first_bit_width == 16 && mpy->second_bit_width == 16) {
+        HexValue src_width = gen_imm_value(c, locp, 32, 32, UNSIGNED);
+        HexSignedness signedness = bin_op_signedness(c, locp,
+                                                     mpy->first_signedness,
+                                                     mpy->second_signedness);
+        res = gen_extend_op(c, locp, &src_width, 64, &res,
+                            signedness);
+    }
+    return res;
+}
+
+static inline HexValue gen_rvalue_simple_unary(Context *c, YYLTYPE *locp,
+                                               HexValue *value,
+                                               const char *c_code,
+                                               const char *tcg_code)
+{
+    unsigned bit_width = (value->bit_width == 64) ? 64 : 32;
+    HexValue res;
+    if (value->type == IMMEDIATE) {
+        res = gen_imm_qemu_tmp(c, locp, bit_width, value->signedness);
+        gen_c_int_type(c, locp, value->bit_width, value->signedness);
+        OUT(c, locp, " ", &res, " = ", c_code, "(", value, ");\n");
+    } else {
+        res = gen_tmp(c, locp, bit_width, value->signedness);
+        OUT(c, locp, tcg_code, "_i", &bit_width, "(", &res, ", ", value,
+            ");\n");
+        gen_rvalue_free(c, locp, value);
+    }
+    return res;
+}
+
+
+HexValue gen_rvalue_not(Context *c, YYLTYPE *locp, HexValue *value)
+{
+    return gen_rvalue_simple_unary(c, locp, value, "~", "tcg_gen_not");
+}
+
+HexValue gen_rvalue_notl(Context *c, YYLTYPE *locp, HexValue *value)
+{
+    unsigned bit_width = (value->bit_width == 64) ? 64 : 32;
+    HexValue res;
+    if (value->type == IMMEDIATE) {
+        res = gen_imm_qemu_tmp(c, locp, bit_width, value->signedness);
+        gen_c_int_type(c, locp, value->bit_width, value->signedness);
+        OUT(c, locp, " ", &res, " = !(", value, ");\n");
+    } else {
+        HexValue zero = gen_constant(c, locp, "0", bit_width, UNSIGNED);
+        HexValue one = gen_constant(c, locp, "0xff", bit_width, UNSIGNED);
+        res = gen_tmp(c, locp, bit_width, value->signedness);
+        OUT(c, locp, "tcg_gen_movcond_i", &bit_width);
+        OUT(c, locp, "(TCG_COND_EQ, ", &res, ", ", value, ", ", &zero);
+        OUT(c, locp, ", ", &one, ", ", &zero, ");\n");
+        gen_rvalue_free(c, locp, value);
+    }
+    return res;
+}
+
+HexValue gen_rvalue_sat(Context *c, YYLTYPE *locp, HexSat *sat,
+                        HexValue *width, HexValue *value)
+{
+    const char *unsigned_str;
+    const char *bit_suffix = (value->bit_width == 64) ? "i64" : "i32";
+    HexValue res;
+    HexValue ovfl;
+    /*
+     * Note: all saturates are assumed to implicitly set overflow.
+     * This assumption holds for the instructions currently parsed
+     * by idef-parser.
+     */
+    yyassert(c, locp, width->imm.value < value->bit_width,
+             "To compute overflow, source width must be greater than"
+             " saturation width!");
+    yyassert(c, locp, !is_inside_ternary(c),
+             "Saturating from within a ternary is not allowed!");
+    assert_signedness(c, locp, sat->signedness);
+
+    unsigned_str = (sat->signedness == UNSIGNED) ? "u" : "";
+    res = gen_tmp_local(c, locp, value->bit_width, sat->signedness);
+    ovfl = gen_tmp_local(c, locp, 32, sat->signedness);
+    OUT(c, locp, "gen_sat", unsigned_str, "_", bit_suffix, "_ovfl(");
+    OUT(c, locp, &ovfl, ", ", &res, ", ", value, ", ", &width->imm.value,
+        ");\n");
+    OUT(c, locp, "gen_set_usr_field_if(USR_OVF,", &ovfl, ");\n");
+    gen_rvalue_free(c, locp, value);
+
+    return res;
+}
+
+HexValue gen_rvalue_fscr(Context *c, YYLTYPE *locp, HexValue *value)
+{
+    HexValue key = gen_tmp(c, locp, 64, UNSIGNED);
+    HexValue res = gen_tmp(c, locp, 64, UNSIGNED);
+    HexValue frame_key = gen_tmp(c, locp, 32, UNSIGNED);
+    *value = gen_rvalue_extend(c, locp, value);
+    OUT(c, locp, "gen_read_reg(", &frame_key, ", HEX_REG_FRAMEKEY);\n");
+    OUT(c, locp, "tcg_gen_concat_i32_i64(",
+        &key, ", ", &frame_key, ", ", &frame_key, ");\n");
+    OUT(c, locp, "tcg_gen_xor_i64(", &res, ", ", value, ", ", &key, ");\n");
+    gen_rvalue_free(c, locp, &key);
+    gen_rvalue_free(c, locp, &frame_key);
+    gen_rvalue_free(c, locp, value);
+    return res;
+}
+
+HexValue gen_rvalue_abs(Context *c, YYLTYPE *locp, HexValue *value)
+{
+    return gen_rvalue_simple_unary(c, locp, value, "abs", "tcg_gen_abs");
+}
+
+HexValue gen_rvalue_neg(Context *c, YYLTYPE *locp, HexValue *value)
+{
+    return gen_rvalue_simple_unary(c, locp, value, "-", "tcg_gen_neg");
+}
+
+HexValue gen_rvalue_brev(Context *c, YYLTYPE *locp, HexValue *value)
+{
+    HexValue res;
+    yyassert(c, locp, value->bit_width <= 32,
+             "fbrev not implemented for 64-bit integers!");
+    res = gen_tmp(c, locp, value->bit_width, value->signedness);
+    *value = rvalue_materialize(c, locp, value);
+    OUT(c, locp, "gen_helper_fbrev(", &res, ", ", value, ");\n");
+    gen_rvalue_free(c, locp, value);
+    return res;
+}
+
+HexValue gen_rvalue_ternary(Context *c, YYLTYPE *locp, HexValue *cond,
+                            HexValue *true_branch, HexValue *false_branch)
+{
+    bool is_64bit = (true_branch->bit_width == 64) ||
+                    (false_branch->bit_width == 64);
+    unsigned bit_width = (is_64bit) ? 64 : 32;
+    HexValue zero = gen_constant(c, locp, "0", bit_width, UNSIGNED);
+    HexValue res = gen_tmp(c, locp, bit_width, UNSIGNED);
+    Ternary *ternary = NULL;
+
+    if (is_64bit) {
+        *cond = gen_rvalue_extend(c, locp, cond);
+        *true_branch = gen_rvalue_extend(c, locp, true_branch);
+        *false_branch = gen_rvalue_extend(c, locp, false_branch);
+    } else {
+        *cond = gen_rvalue_truncate(c, locp, cond);
+    }
+    *cond = rvalue_materialize(c, locp, cond);
+    *true_branch = rvalue_materialize(c, locp, true_branch);
+    *false_branch = rvalue_materialize(c, locp, false_branch);
+
+    OUT(c, locp, "tcg_gen_movcond_i", &bit_width);
+    OUT(c, locp, "(TCG_COND_NE, ", &res, ", ", cond, ", ", &zero);
+    OUT(c, locp, ", ", true_branch, ", ", false_branch, ");\n");
+
+    assert(c->ternary->len > 0);
+    ternary = &g_array_index(c->ternary, Ternary, c->ternary->len - 1);
+    gen_rvalue_free_manual(c, locp, &ternary->cond);
+    g_array_remove_index(c->ternary, c->ternary->len - 1);
+
+    gen_rvalue_free(c, locp, cond);
+    gen_rvalue_free(c, locp, true_branch);
+    gen_rvalue_free(c, locp, false_branch);
+    return res;
+}
+
+const char *cond_to_str(TCGCond cond)
+{
+    switch (cond) {
+    case TCG_COND_NEVER:
+        return "TCG_COND_NEVER";
+    case TCG_COND_ALWAYS:
+        return "TCG_COND_ALWAYS";
+    case TCG_COND_EQ:
+        return "TCG_COND_EQ";
+    case TCG_COND_NE:
+        return "TCG_COND_NE";
+    case TCG_COND_LT:
+        return "TCG_COND_LT";
+    case TCG_COND_GE:
+        return "TCG_COND_GE";
+    case TCG_COND_LE:
+        return "TCG_COND_LE";
+    case TCG_COND_GT:
+        return "TCG_COND_GT";
+    case TCG_COND_LTU:
+        return "TCG_COND_LTU";
+    case TCG_COND_GEU:
+        return "TCG_COND_GEU";
+    case TCG_COND_LEU:
+        return "TCG_COND_LEU";
+    case TCG_COND_GTU:
+        return "TCG_COND_GTU";
+    default:
+        abort();
+    }
+}
+
+void emit_arg(Context *c, YYLTYPE *locp, HexValue *arg)
+{
+    switch (arg->type) {
+    case REGISTER_ARG:
+        if (arg->reg.type == DOTNEW) {
+            EMIT_SIG(c, ", TCGv N%cN", arg->reg.id);
+        } else {
+            bool is64 = (arg->bit_width == 64);
+            const char *type = is64 ? "TCGv_i64" : "TCGv_i32";
+            char reg_id[5];
+            reg_compose(c, locp, &(arg->reg), reg_id);
+            EMIT_SIG(c, ", %s %s", type, reg_id);
+            /* MuV register requires also MuN to provide its index */
+            if (arg->reg.type == MODIFIER) {
+                EMIT_SIG(c, ", int MuN");
+            }
+        }
+        break;
+    case PREDICATE:
+        {
+            char suffix = arg->is_dotnew ? 'N' : 'V';
+            EMIT_SIG(c, ", TCGv P%c%c", arg->pred.id, suffix);
+        }
+        break;
+    default:
+        {
+            fprintf(stderr, "emit_arg got unsupported argument!");
+            abort();
+        }
+    }
+}
+
+void emit_footer(Context *c)
+{
+    EMIT(c, "}\n");
+    EMIT(c, "\n");
+}
+
+void track_string(Context *c, GString *s)
+{
+    g_array_append_val(c->inst.strings, s);
+}
+
+void free_variables(Context *c, YYLTYPE *locp)
+{
+    for (unsigned i = 0; i < c->inst.allocated->len; ++i) {
+        Var *var = &g_array_index(c->inst.allocated, Var, i);
+        const char *suffix = var->bit_width == 64 ? "i64" : "i32";
+        OUT(c, locp, "tcg_temp_free_", suffix, "(", var->name->str, ");\n");
+    }
+}
+
+void free_instruction(Context *c)
+{
+    assert(!is_inside_ternary(c));
+    /* Free the strings */
+    g_string_truncate(c->signature_str, 0);
+    g_string_truncate(c->out_str, 0);
+    g_string_truncate(c->header_str, 0);
+    /* Free strings allocated by the instruction */
+    for (unsigned i = 0; i < c->inst.strings->len; i++) {
+        g_string_free(g_array_index(c->inst.strings, GString*, i), TRUE);
+    }
+    g_array_free(c->inst.strings, TRUE);
+    /* Free INAME token value */
+    g_string_free(c->inst.name, TRUE);
+    /* Free variables and registers */
+    g_array_free(c->inst.allocated, TRUE);
+    /* Initialize instruction-specific portion of the context */
+    memset(&(c->inst), 0, sizeof(Inst));
+}
+
+void assert_signedness(Context *c,
+                       YYLTYPE *locp,
+                       HexSignedness signedness)
+{
+    yyassert(c, locp,
+             signedness != UNKNOWN_SIGNEDNESS,
+             "Unspecified signedness");
+}
diff --git a/target/hexagon/idef-parser/parser-helpers.h b/target/hexagon/idef-parser/parser-helpers.h
new file mode 100644
index 0000000000..31a4e80386
--- /dev/null
+++ b/target/hexagon/idef-parser/parser-helpers.h
@@ -0,0 +1,372 @@
+/*
+ *  Copyright(c) 2019-2022 rev.ng Labs Srl. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef PARSER_HELPERS_H
+#define PARSER_HELPERS_H
+
+#include <assert.h>
+#include <inttypes.h>
+#include <stdarg.h>
+#include <stdbool.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+
+#include "tcg/tcg-cond.h"
+
+#include "idef-parser.tab.h"
+#include "idef-parser.yy.h"
+#include "idef-parser.h"
+
+/* Decomment this to disable yyasserts */
+/* #define NDEBUG */
+
+#define ERR_LINE_CONTEXT 40
+
+#define START_COMMENT "/" "*"
+#define END_COMMENT "*" "/"
+
+void yyerror(YYLTYPE *locp,
+             yyscan_t scanner __attribute__((unused)),
+             Context *c,
+             const char *s);
+
+#ifndef NDEBUG
+#define yyassert(context, locp, condition, msg)              \
+    if (!(condition)) {                                      \
+        yyerror(locp, (context)->scanner, (context), (msg)); \
+    }
+#endif
+
+bool is_direct_predicate(HexValue *value);
+
+bool is_inside_ternary(Context *c);
+
+/**
+ * Print functions
+ */
+
+void str_print(Context *c, YYLTYPE *locp, const char *string);
+
+void uint8_print(Context *c, YYLTYPE *locp, uint8_t *num);
+
+void uint64_print(Context *c, YYLTYPE *locp, uint64_t *num);
+
+void int_print(Context *c, YYLTYPE *locp, int *num);
+
+void uint_print(Context *c, YYLTYPE *locp, unsigned *num);
+
+void tmp_print(Context *c, YYLTYPE *locp, HexTmp *tmp);
+
+void pred_print(Context *c, YYLTYPE *locp, HexPred *pred, bool is_dotnew);
+
+void reg_compose(Context *c, YYLTYPE *locp, HexReg *reg, char reg_id[5]);
+
+void reg_print(Context *c, YYLTYPE *locp, HexReg *reg);
+
+void imm_print(Context *c, YYLTYPE *locp, HexImm *imm);
+
+void var_print(Context *c, YYLTYPE *locp, HexVar *var);
+
+void rvalue_print(Context *c, YYLTYPE *locp, void *pointer);
+
+void out_assert(Context *c, YYLTYPE *locp, void *dummy);
+
+/**
+ * Copies output code buffer into stdout
+ */
+void commit(Context *c);
+
+#define OUT_IMPL(c, locp, x)                    \
+    _Generic(*(x),                              \
+        char:      str_print,                   \
+        uint8_t:   uint8_print,                 \
+        uint64_t:  uint64_print,                \
+        int:       int_print,                   \
+        unsigned:  uint_print,                  \
+        HexValue:  rvalue_print,                \
+        default:   out_assert                   \
+    )(c, locp, x);
+
+/* FOREACH macro */
+#define FE_1(c, locp, WHAT, X) WHAT(c, locp, X)
+#define FE_2(c, locp, WHAT, X, ...) \
+    WHAT(c, locp, X)FE_1(c, locp, WHAT, __VA_ARGS__)
+#define FE_3(c, locp, WHAT, X, ...) \
+    WHAT(c, locp, X)FE_2(c, locp, WHAT, __VA_ARGS__)
+#define FE_4(c, locp, WHAT, X, ...) \
+    WHAT(c, locp, X)FE_3(c, locp, WHAT, __VA_ARGS__)
+#define FE_5(c, locp, WHAT, X, ...) \
+    WHAT(c, locp, X)FE_4(c, locp, WHAT, __VA_ARGS__)
+#define FE_6(c, locp, WHAT, X, ...) \
+    WHAT(c, locp, X)FE_5(c, locp, WHAT, __VA_ARGS__)
+#define FE_7(c, locp, WHAT, X, ...) \
+    WHAT(c, locp, X)FE_6(c, locp, WHAT, __VA_ARGS__)
+#define FE_8(c, locp, WHAT, X, ...) \
+    WHAT(c, locp, X)FE_7(c, locp, WHAT, __VA_ARGS__)
+#define FE_9(c, locp, WHAT, X, ...) \
+    WHAT(c, locp, X)FE_8(c, locp, WHAT, __VA_ARGS__)
+/* repeat as needed */
+
+#define GET_MACRO(_1, _2, _3, _4, _5, _6, _7, _8, _9, NAME, ...) NAME
+
+#define FOR_EACH(c, locp, action, ...)          \
+  do {                                          \
+    GET_MACRO(__VA_ARGS__,                      \
+              FE_9,                             \
+              FE_8,                             \
+              FE_7,                             \
+              FE_6,                             \
+              FE_5,                             \
+              FE_4,                             \
+              FE_3,                             \
+              FE_2,                             \
+              FE_1)(c, locp, action,            \
+                    __VA_ARGS__)                \
+  } while (0)
+
+#define OUT(c, locp, ...) FOR_EACH((c), (locp), OUT_IMPL, __VA_ARGS__)
+
+const char *cmp_swap(Context *c, YYLTYPE *locp, const char *type);
+
+/**
+ * Temporary values creation
+ */
+
+HexValue gen_tmp(Context *c,
+                 YYLTYPE *locp,
+                 unsigned bit_width,
+                 HexSignedness signedness);
+
+HexValue gen_tmp_value(Context *c,
+                       YYLTYPE *locp,
+                       const char *value,
+                       unsigned bit_width,
+                       HexSignedness signedness);
+
+HexValue gen_imm_value(Context *c __attribute__((unused)),
+                       YYLTYPE *locp,
+                       int value,
+                       unsigned bit_width,
+                       HexSignedness signedness);
+
+HexValue gen_imm_qemu_tmp(Context *c, YYLTYPE *locp, unsigned bit_width,
+                          HexSignedness signedness);
+
+void gen_rvalue_free(Context *c, YYLTYPE *locp, HexValue *rvalue);
+
+HexValue rvalue_materialize(Context *c, YYLTYPE *locp, HexValue *rvalue);
+
+HexValue gen_rvalue_extend(Context *c, YYLTYPE *locp, HexValue *rvalue);
+
+HexValue gen_rvalue_truncate(Context *c, YYLTYPE *locp, HexValue *rvalue);
+
+void gen_varid_allocate(Context *c,
+                        YYLTYPE *locp,
+                        HexValue *varid,
+                        unsigned bit_width,
+                        HexSignedness signedness);
+
+/**
+ * Code generation functions
+ */
+
+HexValue gen_bin_cmp(Context *c,
+                     YYLTYPE *locp,
+                     TCGCond type,
+                     HexValue *op1,
+                     HexValue *op2);
+
+HexValue gen_bin_op(Context *c,
+                    YYLTYPE *locp,
+                    OpType type,
+                    HexValue *op1,
+                    HexValue *op2);
+
+HexValue gen_cast_op(Context *c,
+                     YYLTYPE *locp,
+                     HexValue *src,
+                     unsigned target_width,
+                     HexSignedness signedness);
+
+/**
+ * gen_extend_op extends a region of src_width_ptr bits stored in a
+ * value_ptr to the size of dst_width. Note: src_width_ptr is a
+ * HexValue * to handle the special case where it is unknown at
+ * translation time.
+ */
+HexValue gen_extend_op(Context *c,
+                       YYLTYPE *locp,
+                       HexValue *src_width,
+                       unsigned dst_width,
+                       HexValue *value,
+                       HexSignedness signedness);
+
+void gen_rdeposit_op(Context *c,
+                     YYLTYPE *locp,
+                     HexValue *dst,
+                     HexValue *value,
+                     HexValue *begin,
+                     HexValue *width);
+
+void gen_deposit_op(Context *c,
+                    YYLTYPE *locp,
+                    HexValue *dst,
+                    HexValue *value,
+                    HexValue *index,
+                    HexCast *cast);
+
+HexValue gen_rextract_op(Context *c,
+                         YYLTYPE *locp,
+                         HexValue *src,
+                         unsigned begin,
+                         unsigned width);
+
+HexValue gen_extract_op(Context *c,
+                        YYLTYPE *locp,
+                        HexValue *src,
+                        HexValue *index,
+                        HexExtract *extract);
+
+HexValue gen_read_reg(Context *c, YYLTYPE *locp, HexValue *reg);
+
+void gen_write_reg(Context *c, YYLTYPE *locp, HexValue *reg, HexValue *value);
+
+void gen_assign(Context *c,
+                YYLTYPE *locp,
+                HexValue *dst,
+                HexValue *value);
+
+HexValue gen_convround(Context *c,
+                       YYLTYPE *locp,
+                       HexValue *src);
+
+HexValue gen_round(Context *c,
+                   YYLTYPE *locp,
+                   HexValue *src,
+                   HexValue *position);
+
+HexValue gen_convround_n(Context *c,
+                         YYLTYPE *locp,
+                         HexValue *src,
+                         HexValue *pos);
+
+/**
+ * Circular addressing mode with auto-increment
+ */
+void gen_circ_op(Context *c,
+                 YYLTYPE *locp,
+                 HexValue *addr,
+                 HexValue *increment,
+                 HexValue *modifier);
+
+HexValue gen_locnt_op(Context *c, YYLTYPE *locp, HexValue *src);
+
+HexValue gen_ctpop_op(Context *c, YYLTYPE *locp, HexValue *src);
+
+HexValue gen_rotl(Context *c, YYLTYPE *locp, HexValue *src, HexValue *n);
+
+HexValue gen_deinterleave(Context *c, YYLTYPE *locp, HexValue *mixed);
+
+HexValue gen_interleave(Context *c,
+                        YYLTYPE *locp,
+                        HexValue *odd,
+                        HexValue *even);
+
+HexValue gen_carry_from_add(Context *c,
+                            YYLTYPE *locp,
+                            HexValue *op1,
+                            HexValue *op2,
+                            HexValue *op3);
+
+void gen_addsat64(Context *c,
+                  YYLTYPE *locp,
+                  HexValue *dst,
+                  HexValue *op1,
+                  HexValue *op2);
+
+void gen_inst(Context *c, GString *iname);
+
+void gen_inst_init_args(Context *c, YYLTYPE *locp);
+
+void gen_inst_code(Context *c, YYLTYPE *locp);
+
+void gen_pred_assign(Context *c, YYLTYPE *locp, HexValue *left_pred,
+                     HexValue *right_pred);
+
+void gen_load(Context *c, YYLTYPE *locp, HexValue *size,
+              HexSignedness signedness, HexValue *ea, HexValue *dst);
+
+void gen_store(Context *c, YYLTYPE *locp, HexValue *size, HexValue *ea,
+               HexValue *src);
+
+void gen_sethalf(Context *c, YYLTYPE *locp, HexCast *sh, HexValue *n,
+                 HexValue *dst, HexValue *value);
+
+void gen_setbits(Context *c, YYLTYPE *locp, HexValue *hi, HexValue *lo,
+                 HexValue *dst, HexValue *value);
+
+unsigned gen_if_cond(Context *c, YYLTYPE *locp, HexValue *cond);
+
+unsigned gen_if_else(Context *c, YYLTYPE *locp, unsigned index);
+
+HexValue gen_rvalue_pred(Context *c, YYLTYPE *locp, HexValue *pred);
+
+HexValue gen_rvalue_var(Context *c, YYLTYPE *locp, HexValue *var);
+
+HexValue gen_rvalue_mpy(Context *c, YYLTYPE *locp, HexMpy *mpy, HexValue *op1,
+                        HexValue *op2);
+
+HexValue gen_rvalue_not(Context *c, YYLTYPE *locp, HexValue *value);
+
+HexValue gen_rvalue_notl(Context *c, YYLTYPE *locp, HexValue *value);
+
+HexValue gen_rvalue_sat(Context *c, YYLTYPE *locp, HexSat *sat, HexValue *n,
+                        HexValue *value);
+
+HexValue gen_rvalue_fscr(Context *c, YYLTYPE *locp, HexValue *value);
+
+HexValue gen_rvalue_abs(Context *c, YYLTYPE *locp, HexValue *value);
+
+HexValue gen_rvalue_neg(Context *c, YYLTYPE *locp, HexValue *value);
+
+HexValue gen_rvalue_brev(Context *c, YYLTYPE *locp, HexValue *value);
+
+HexValue gen_rvalue_ternary(Context *c, YYLTYPE *locp, HexValue *cond,
+                            HexValue *true_branch, HexValue *false_branch);
+
+const char *cond_to_str(TCGCond cond);
+
+void emit_header(Context *c);
+
+void emit_arg(Context *c, YYLTYPE *locp, HexValue *arg);
+
+void emit_footer(Context *c);
+
+void track_string(Context *c, GString *s);
+
+void free_variables(Context *c, YYLTYPE *locp);
+
+void free_instruction(Context *c);
+
+void assert_signedness(Context *c,
+                       YYLTYPE *locp,
+                       HexSignedness signedness);
+
+#endif /* PARSER_HELPERS_h */
diff --git a/target/hexagon/meson.build b/target/hexagon/meson.build
index 63f13e1d21..bfc74ba441 100644
--- a/target/hexagon/meson.build
+++ b/target/hexagon/meson.build
@@ -200,4 +200,29 @@ flex = generator(find_program('flex'),
                  output: ['@BASENAME@.yy.c', '@BASENAME@.yy.h'],
                  arguments: ['-o', '@OUTPUT0@', '--header-file=@OUTPUT1@', '@INPUT@'])
 
+bison = generator(find_program('bison'),
+                  output: ['@BASENAME@.tab.c', '@BASENAME@.tab.h'],
+                  arguments: ['@INPUT@', '--defines=@OUTPUT1@', '--output=@OUTPUT0@'])
+
+glib_dep = dependency('glib-2.0', native: true)
+
+idef_parser = executable('idef-parser',
+                         [flex.process(idef_parser_dir / 'idef-parser.lex'),
+                          bison.process(idef_parser_dir / 'idef-parser.y'),
+                          idef_parser_dir / 'parser-helpers.c'],
+                         include_directories: ['idef-parser', '../../include/'],
+                         dependencies: [glib_dep],
+                         c_args: ['-Wextra'],
+                         native: true)
+
+idef_generated_tcg = custom_target(
+    'idef-generated-tcg',
+    output: ['idef-generated-emitter.c',
+             'idef-generated-emitter.h.inc',
+             'idef-generated-enabled-instructions'],
+    input: preprocessed_idef_parser_input_generated,
+    depend_files: [hex_common_py],
+    command: [idef_parser, '@INPUT@', '@OUTPUT0@', '@OUTPUT1@', '@OUTPUT2@'],
+)
+
 target_arch += {'hexagon': hexagon_ss}
-- 
2.35.1


