Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 535FB34EB1F
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 16:53:47 +0200 (CEST)
Received: from localhost ([::1]:36008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRFkY-0003oK-3V
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 10:53:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1lRFVp-0003Mx-KK
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 10:38:33 -0400
Received: from rev.ng ([5.9.113.41]:51543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1lRFVe-0004x8-0i
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 10:38:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qQSKDTMx7Ayf0+fx40LBYGduvBs84fR2cXgf8peB/VU=; b=ROLC1cnECaZhv9waPNaLT+b1yv
 jCT17dIGa7U2XR8k19BEAnestBP7rFYQJ9LzgfMoozuD/ReouYAWNx6NUq5rbsAszFrHsUfV1bJ/l
 6DL9nQudoykEsDYDviLepdFm49jXf9JHxTjdm2rp1HSOABVHOGbkv2/yo5A9nSCITPZA=;
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, bcain@quicinc.com, babush@rev.ng, nizzo@rev.ng,
 philmd@redhat.com, richard.henderson@linaro.org,
 Alessandro Di Federico <ale@rev.ng>
Subject: [PATCH v3 10/12] target/hexagon: import parser for idef-parser
Date: Tue, 30 Mar 2021 16:37:48 +0200
Message-Id: <20210330143750.3037824-11-ale.qemu@rev.ng>
In-Reply-To: <20210330143750.3037824-1-ale.qemu@rev.ng>
References: <20210330143750.3037824-1-ale.qemu@rev.ng>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=ale@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Reply-to:  Alessandro Di Federico <ale.qemu@rev.ng>
From:  Alessandro Di Federico via <qemu-devel@nongnu.org>

From: Paolo Montesel <babush@rev.ng>

Signed-off-by: Alessandro Di Federico <ale@rev.ng>
Signed-off-by: Paolo Montesel <babush@rev.ng>
---
 target/hexagon/idef-parser/idef-parser.y      |  940 +++++++
 target/hexagon/idef-parser/parser-helpers.c   | 2230 +++++++++++++++++
 target/hexagon/idef-parser/parser-helpers.h   |  344 +++
 target/hexagon/meson.build                    |   26 +-
 tests/docker/dockerfiles/alpine.docker        |    1 +
 tests/docker/dockerfiles/centos7.docker       |    1 +
 tests/docker/dockerfiles/centos8.docker       |    1 +
 tests/docker/dockerfiles/debian10.docker      |    2 +
 .../dockerfiles/fedora-i386-cross.docker      |    2 +
 .../dockerfiles/fedora-win32-cross.docker     |    2 +
 .../dockerfiles/fedora-win64-cross.docker     |    2 +
 tests/docker/dockerfiles/fedora.docker        |    1 +
 tests/docker/dockerfiles/opensuse-leap.docker |    1 +
 tests/docker/dockerfiles/ubuntu.docker        |    2 +
 tests/docker/dockerfiles/ubuntu1804.docker    |    2 +
 tests/docker/dockerfiles/ubuntu2004.docker    |    4 +-
 16 files changed, 3559 insertions(+), 2 deletions(-)
 create mode 100644 target/hexagon/idef-parser/idef-parser.y
 create mode 100644 target/hexagon/idef-parser/parser-helpers.c
 create mode 100644 target/hexagon/idef-parser/parser-helpers.h

diff --git a/target/hexagon/idef-parser/idef-parser.y b/target/hexagon/idef-parser/idef-parser.y
new file mode 100644
index 0000000000..5d96c9262a
--- /dev/null
+++ b/target/hexagon/idef-parser/idef-parser.y
@@ -0,0 +1,940 @@
+%{
+/*
+ * Copyright(c) 2019-2021 rev.ng Srls. All Rights Reserved.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
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
+    bool is_unsigned;
+    int index;
+}
+
+/* Tokens */
+%start input
+
+%expect 1
+
+%token INAME DREG DIMM DPRE DEA RREG WREG FREG FIMM RPRE WPRE FPRE FWRAP FEA VAR
+%token POW ABS CROUND ROUND CIRCADD COUNTONES INC DEC ANDA ORA XORA PLUSPLUS ASL
+%token ASR LSR EQ NEQ LTE GTE MIN MAX ANDL ORL FOR ICIRC IF MUN FSCR FCHK SXT
+%token ZXT CONSTEXT LOCNT BREV SIGN LOAD STORE CONSTLL CONSTULL PC NPC LPCFG
+%token CANCEL IDENTITY PART1 BREV_4 BREV_8 ROTL INSBITS SETBITS EXTBITS EXTRANGE
+%token CAST4_8U SETOVF FAIL DEINTERLEAVE INTERLEAVE CARRY_FROM_ADD
+
+%token <rvalue> REG IMM PRE
+%token <index> ELSE
+%token <mpy> MPY
+%token <sat> SAT
+%token <cast> CAST DEPOSIT SETHALF
+%token <extract> EXTRACT
+%type <string> INAME
+%type <rvalue> rvalue lvalue VAR assign_statement var
+%type <rvalue> DREG DIMM DPRE RREG RPRE FAIL
+%type <index> if_stmt IF ':' '?'
+%type <is_unsigned> SIGN
+
+/* Operator Precedences */
+%left MIN MAX
+%left '('
+%left ','
+%left '='
+%right CIRCADD
+%right INC DEC ANDA ORA XORA
+%left '?' ':'
+%left ORL
+%left ANDL
+%left '|'
+%left '^' ANDOR
+%left '&'
+%left EQ NEQ
+%left '<' '>' LTE GTE
+%left ASL ASR LSR
+%right ABS
+%left '-' '+'
+%left POW
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
+                  gen_inst_args(c, &@1);
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
+argument_list : decl ',' argument_list
+              | decl
+              ;
+
+var : VAR
+      {
+          track_string(c, $1.var.name);
+          $$ = $1;
+      }
+    ;
+
+/* Return the modified registers list */
+code : '{' statements '}'
+       {
+           c->inst.code_begin = c->input_buffer + @2.first_column;
+           c->inst.code_end = c->input_buffer + @2.last_column - 1;
+       }
+     | '{'
+       {
+           /* Nop */
+       }
+       '}'
+     ;
+
+decl : REG
+       {
+           emit_arg(c, &@1, &$1);
+           /* Enqueue register into initialization list */
+           g_array_append_val(c->inst.init_list, $1);
+       }
+     | IMM
+       {
+           EMIT_SIG(c, ", int %ciV", $1.imm.id);
+       }
+     | PRE
+       {
+           emit_arg(c, &@1, &$1);
+           /* Enqueue predicate into initialization list */
+           g_array_append_val(c->inst.init_list, $1);
+       }
+     | var
+       {
+           yyassert(c, &@1, !strcmp($1.var.name->str, "EA"),
+                    "Unknown argument variable!");
+       }
+     | RREG
+       {
+           emit_arg(c, &@1, &$1);
+       }
+     | WREG
+     | FREG
+     | FIMM
+     | RPRE
+       {
+           emit_arg(c, &@1, &$1);
+       }
+     | WPRE
+     | FPRE
+     | FEA
+     ;
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
+          | rvalue ';'
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
+                 | PRE '=' rvalue
+                   {
+                       @1.last_column = @3.last_column;
+                       gen_pre_assign(c, &@1, &$1, &$3);
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
+                       $3 = rvalue_truncate(c, &@1, &$3);
+                       $3 = rvalue_materialize(c, &@1, &$3);
+                       OUT(c, &@1, "gen_write_new_pc(", &$3, ");\n");
+                       rvalue_free(c, &@1, &$3); /* Free temporary value */
+                   }
+                 | LOAD '(' IMM ',' IMM ',' SIGN ',' var ',' lvalue ')'
+                   {
+                       @1.last_column = @12.last_column;
+                       gen_load(c, &@1, &$3, &$5, $7, &$9, &$11);
+                   }
+                 | STORE '(' IMM ',' IMM ',' var ',' rvalue ')'
+                   /* Store primitive */
+                   {
+                       @1.last_column = @10.last_column;
+                       gen_store(c, &@1, &$3, &$5, &$7, &$9);
+                   }
+                 | LPCFG '=' rvalue
+                   {
+                       @1.last_column = @3.last_column;
+                       $3 = rvalue_truncate(c, &@1, &$3);
+                       $3 = rvalue_materialize(c, &@1, &$3);
+                       OUT(c, &@1, "SET_USR_FIELD(USR_LPCFG, ", &$3, ");\n");
+                       rvalue_free(c, &@1, &$3);
+                   }
+                 | DEPOSIT '(' rvalue ',' rvalue ',' rvalue ')'
+                   {
+                       @1.last_column = @8.last_column;
+                       gen_deposit_op(c, &@1, &$5, &$7, &$3, &$1);
+                   }
+                 | SETHALF '(' rvalue ',' lvalue ',' rvalue ')'
+                   {
+                       @1.last_column = @8.last_column;
+                       gen_sethalf(c, &@1, &$1, &$3, &$5, &$7);
+                   }
+                 | SETBITS '(' rvalue ',' rvalue ',' rvalue ',' rvalue ')'
+                   {
+                       @1.last_column = @10.last_column;
+                       gen_setbits(c, &@1, &$3, &$5, &$7, &$9);
+                   }
+                 | INSBITS '(' lvalue ',' rvalue ',' rvalue ',' rvalue ')'
+                   {
+                       @1.last_column = @10.last_column;
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
+                  rvalue_free(c, &@1, &$3);
+                  rvalue_free(c, &@1, &$5);
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
+                    @1.last_column = @13.last_column;
+                    OUT(c, &@1, "for (int ", &$3, " = ", &$5, "; ",
+                        &$7, " < ", &$9);
+                    OUT(c, &@1, "; ", &$11, "++) {\n");
+                }
+                code_block
+                {
+                    OUT(c, &@1, "}\n");
+                }
+              | FOR '(' IMM '=' IMM ';' IMM '<' IMM ';' IMM INC IMM ')'
+                {
+                    @1.last_column = @14.last_column;
+                    OUT(c, &@1, "for (int ", &$3, " = ", &$5, "; ",
+                        &$7, " < ", &$9);
+                    OUT(c, &@1, "; ", &$11, " += ", &$13, ") {\n");
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
+             if ($1.reg.type == CONTROL) {
+                 $$ = gen_read_creg(c, &@1, &$1);
+             } else {
+                 $$ = $1;
+             }
+         }
+       | IMM
+         {
+             $$ = $1;
+         }
+       | CONSTLL '(' IMM ')'
+         {
+             $3.is_unsigned = false;
+             $3.bit_width = 64;
+             $$ = $3;
+         }
+       | CONSTULL '(' IMM ')'
+         {
+             $3.is_unsigned = true;
+             $3.bit_width = 64;
+             $$ = $3;
+         }
+       | PRE
+         {
+             $$ = gen_rvalue_pre(c, &@1, &$1);
+         }
+       | PC
+         {
+             /* Read PC from the CR */
+             $$ = gen_tmp(c, &@1, 32);
+             OUT(c, &@1, "tcg_gen_movi_i32(", &$$, ", ctx->base.pc_next);\n");
+         }
+       | NPC
+         {
+             /* NPC is only read from CALLs, so we can hardcode it
+                at translation time */
+             $$ = gen_tmp(c, &@1, 32);
+             OUT(c, &@1, "tcg_gen_movi_i32(", &$$, ", ctx->npc);\n");
+         }
+       | CONSTEXT
+         {
+             HexValue rvalue;
+             rvalue.type = IMMEDIATE;
+             rvalue.imm.type = IMM_CONSTEXT;
+             rvalue.is_unsigned = true;
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
+       | rvalue POW rvalue
+         {
+             @1.last_column = @3.last_column;
+             $$ = gen_rvalue_pow(c, &@1, &$1, &$3);
+         }
+       | rvalue '%' rvalue
+         {
+             @1.last_column = @3.last_column;
+             $$ = gen_bin_op(c, &@1, MOD_OP, &$1, &$3);
+         }
+       | rvalue ASL rvalue
+         {
+             @1.last_column = @3.last_column;
+             $$ = gen_bin_op(c, &@1, ASL_OP, &$1, &$3);
+         }
+       | rvalue ASR rvalue
+         {
+             @1.last_column = @3.last_column;
+             if ($1.is_unsigned) {
+                 $$ = gen_bin_op(c, &@1, LSR_OP, &$1, &$3);
+             } else {
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
+             $2.is_unsigned = $1.is_unsigned;
+             $$ = gen_cast_op(c, &@1, &$2, $1.bit_width);
+             $$.is_unsigned = $1.is_unsigned;
+         }
+       | rvalue '[' rvalue ']'
+         {
+             @1.last_column = @4.last_column;
+             if ($3.type == IMMEDIATE) {
+                 $$ = gen_tmp(c, &@1, $1.bit_width);
+                 OUT(c, &@1, "tcg_gen_extract_i", &$$.bit_width, "(");
+                 OUT(c, &@1, &$$, ", ", &$1, ", ", &$3, ", 1);\n");
+             } else {
+                 HexValue one = gen_imm_value(c, &@1, 1, $3.bit_width);
+                 HexValue tmp = gen_bin_op(c, &@1, ASR_OP, &$1, &$3);
+                 $$ = gen_bin_op(c, &@1, ANDB_OP, &tmp, &one);
+             }
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
+             if ($1.is_unsigned || $3.is_unsigned) {
+                 $$ = gen_bin_cmp(c, &@1, TCG_COND_LTU, &$1, &$3);
+             } else {
+                 $$ = gen_bin_cmp(c, &@1, TCG_COND_LT, &$1, &$3);
+             }
+         }
+       | rvalue '>' rvalue
+         {
+             @1.last_column = @3.last_column;
+             if ($1.is_unsigned || $3.is_unsigned) {
+                 $$ = gen_bin_cmp(c, &@1, TCG_COND_GTU, &$1, &$3);
+             } else {
+                 $$ = gen_bin_cmp(c, &@1, TCG_COND_GT, &$1, &$3);
+             }
+         }
+       | rvalue LTE rvalue
+         {
+             @1.last_column = @3.last_column;
+             if ($1.is_unsigned || $3.is_unsigned) {
+                 $$ = gen_bin_cmp(c, &@1, TCG_COND_LEU, &$1, &$3);
+             } else {
+                 $$ = gen_bin_cmp(c, &@1, TCG_COND_LE, &$1, &$3);
+             }
+         }
+       | rvalue GTE rvalue
+         {
+             @1.last_column = @3.last_column;
+             if ($1.is_unsigned || $3.is_unsigned) {
+                 $$ = gen_bin_cmp(c, &@1, TCG_COND_GEU, &$1, &$3);
+             } else {
+                 $$ = gen_bin_cmp(c, &@1, TCG_COND_GE, &$1, &$3);
+             }
+         }
+       | rvalue '?'
+         {
+             $2 = gen_if_cond(c, &@1, &$1);
+             $1 = gen_tmp(c, &@1, 64);
+         }
+         rvalue ':'
+         {
+             $4 = rvalue_materialize(c, &@1, &$4);
+             HexValue tmp = $4;
+             if ($4.bit_width < 64) {
+                 tmp = rvalue_extend(c, &@1, &tmp);
+             }
+             OUT(c, &@1, "tcg_gen_mov_i64(", &$1, ", ", &tmp, ");\n");
+             rvalue_free(c, &@1, &tmp);
+             $5 = gen_if_else(c, &@1, $2);
+         }
+         rvalue
+         {
+             /* Note: $4 was already rvalue_free'd */
+             unsigned final_width = ($4.bit_width == $7.bit_width)
+                                    ? $4.bit_width : 64;
+             $7 = rvalue_materialize(c, &@1, &$7);
+             $7 = rvalue_extend(c, &@1, &$7);
+             OUT(c, &@1, "tcg_gen_mov_i64(", &$1, ", ", &$7, ");\n");
+             rvalue_free(c, &@1, &$7);
+
+             $1.is_unsigned = $4.is_unsigned || $7.is_unsigned;
+
+             OUT(c, &@1, "gen_set_label(if_label_", &$5, ");\n");
+             if (final_width < 64) {
+                 $$ = rvalue_truncate(c, &@1, &$1);
+             } else {
+                 $$ = $1;
+             }
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
+             $5.imm.value = 64;
+             $$ = gen_extend_op(c, &@1, &$3, &$5, &$7, false);
+         }
+       | ZXT '(' rvalue ',' IMM ',' rvalue ')'
+         {
+             @1.last_column = @8.last_column;
+             yyassert(c, &@1, $5.type == IMMEDIATE &&
+                      $5.imm.type == VALUE,
+                      "ZXT expects immediate values\n");
+             $$ = gen_extend_op(c, &@1, &$3, &$5, &$7, true);
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
+             $$ = gen_tmp(c, &@1, 32);
+             OUT(c, &@1, "gen_read_ireg(", &$$, ", ", &$3, ", ", &$6, ");\n");
+             rvalue_free(c, &@1, &$3);
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
+             $$ = gen_tmp_value(c, &@1, "0", 32);
+             OUT(c, &@1, "tcg_gen_extract_tl(", &$$,
+                 ", hex_gpr[HEX_REG_USR], ");
+             OUT(c, &@1, "reg_field_info[USR_LPCFG].offset, ");
+             OUT(c, &@1, "reg_field_info[USR_LPCFG].width);\n");
+         }
+       | EXTRACT '(' rvalue ',' rvalue ')'
+         {
+             @1.last_column = @6.last_column;
+             $$ = gen_extract_op(c, &@1, &$5, &$3, &$1);
+         }
+       | EXTBITS '(' rvalue ',' rvalue ',' rvalue ')'
+         {
+             @1.last_column = @8.last_column;
+             yyassert(c, &@1, $5.type == IMMEDIATE &&
+                      $5.imm.type == VALUE &&
+                      $7.type == IMMEDIATE &&
+                      $7.imm.type == VALUE,
+                      "Range extract needs immediate values!\n");
+             $$ = gen_rextract_op(c, &@1, &$3, $7.imm.value, $5.imm.value);
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
+             $$ = rvalue_truncate(c, &@1, &$3);
+             $$.is_unsigned = true;
+             $$ = rvalue_materialize(c, &@1, &$$);
+             $$ = rvalue_extend(c, &@1, &$$);
+         }
+       | BREV '(' rvalue ')'
+         {
+             @1.last_column = @4.last_column;
+             $$ = gen_rvalue_brev(c, &@1, &$3);
+         }
+       | BREV_4 '(' rvalue ')'
+         {
+             @1.last_column = @4.last_column;
+             $$ = gen_fbrev_4(c, &@1, &$3);
+         }
+       | BREV_8 '(' rvalue ')'
+         {
+             @1.last_column = @4.last_column;
+             $$ = gen_fbrev_8(c, &@1, &$3);
+         }
+       | ROTL '(' rvalue ',' rvalue ')'
+         {
+             @1.last_column = @6.last_column;
+             $$ = gen_rotl(c, &@1, &$3, &$5);
+         }
+       | SETOVF '(' ')'
+         {
+             @1.last_column = @3.last_column;
+             OUT(c, &@1, "gen_set_usr_fieldi(USR_OVF, 1);\n");
+         }
+       | SETOVF '(' rvalue ')'
+         {
+             /* Convenience fSET_OVERFLOW with pass-through */
+             @1.last_column = @3.last_column;
+             OUT(c, &@1, "gen_set_usr_fieldi(USR_OVF, 1);\n");
+             $$ = $3;
+         }
+       | DEINTERLEAVE '(' rvalue ')'
+         {
+             @1.last_column = @4.last_column;
+             $$ = gen_deinterleave(c, &@1, &$3);
+         }
+       | INTERLEAVE '(' rvalue ',' rvalue ')'
+         {
+             @1.last_column = @6.last_column;
+             $$ = gen_interleave(c, &@1, &$3, &$5);
+         }
+       | CARRY_FROM_ADD '(' rvalue ',' rvalue ',' rvalue ')'
+         {
+             @1.last_column = @8.last_column;
+               $$ = gen_carry_from_add(c, &@1, &$3, &$5, &$7);
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
+    if (read_chars != input_size) {
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
+    fclose(output_file);
+    fclose(input_file);
+    fclose(defines_file);
+    fclose(enabled_file);
+
+    return 0;
+}
diff --git a/target/hexagon/idef-parser/parser-helpers.c b/target/hexagon/idef-parser/parser-helpers.c
new file mode 100644
index 0000000000..2b024f494f
--- /dev/null
+++ b/target/hexagon/idef-parser/parser-helpers.c
@@ -0,0 +1,2230 @@
+/*
+ * Copyright(c) 2019-2021 rev.ng Srls. All Rights Reserved.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
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
+const char *creg_str[] = {"HEX_REG_SP", "HEX_REG_FP", "HEX_REG_LR",
+                          "HEX_REG_GP", "HEX_REG_LC0", "HEX_REG_LC1",
+                          "HEX_REG_SA0", "HEX_REG_SA1"};
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
+    for (int i = 0;
+         i < 80 &&
+         code_ptr[locp->first_column - 10 + i] != '\0' &&
+         code_ptr[locp->first_column - 10 + i] != '\n';
+         i++) {
+        fprintf(stderr, "%c", code_ptr[locp->first_column - 10 + i]);
+    }
+    fprintf(stderr, "\n");
+    for (int i = 0; i < 9; i++) {
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
+    return value->pre.id >= '0' && value->pre.id <= '3';
+}
+
+/* Print functions */
+void str_print(Context *c, YYLTYPE *locp, const char *string)
+{
+    EMIT(c, "%s", string);
+}
+
+
+void uint64_print(Context *c, YYLTYPE *locp, uint64_t *num)
+{
+    EMIT(c, "%" PRIu64, *num);
+}
+
+void int_print(Context *c, YYLTYPE *locp, int *num)
+{
+    EMIT(c, "%d", *num);
+}
+
+void uint_print(Context *c, YYLTYPE *locp, unsigned *num)
+{
+    EMIT(c, "%u", *num);
+}
+
+void tmp_print(Context *c, YYLTYPE *locp, HexTmp *tmp)
+{
+    EMIT(c, "tmp_%d", tmp->index);
+}
+
+void pre_print(Context *c, YYLTYPE *locp, HexPre *pre, bool is_dotnew)
+{
+    char suffix = is_dotnew ? 'N' : 'V';
+    EMIT(c, "P%c%c", pre->id, suffix);
+}
+
+void reg_compose(Context *c, YYLTYPE *locp, HexReg *reg, char reg_id[5])
+{
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
+        /* The DOTNEW case is managed by the upper level function */
+        break;
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
+void reg_print(Context *c, YYLTYPE *locp, HexReg *reg)
+{
+  if (reg->type == DOTNEW) {
+    EMIT(c, "N%cN", reg->id);
+  } else {
+    char reg_id[5] = { 0 };
+    reg_compose(c, locp, reg, reg_id);
+    EMIT(c, "%s", reg_id);
+  }
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
+        EMIT(c, "((int64_t)%" PRIu64 "ULL)", (int64_t)imm->value);
+        break;
+    case QEMU_TMP:
+        EMIT(c, "qemu_tmp_%" PRIu64, imm->index);
+        break;
+    case IMM_PC:
+        EMIT(c, "dc->pc");
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
+    EMIT(c, "%s", var->name->str);
+}
+
+void rvalue_out(Context *c, YYLTYPE *locp, void *pointer)
+{
+  HexValue *rvalue = (HexValue *) pointer;
+  switch (rvalue->type) {
+  case REGISTER:
+      reg_print(c, locp, &rvalue->reg);
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
+      pre_print(c, locp, &rvalue->pre, rvalue->is_dotnew);
+      break;
+  default:
+      yyassert(c, locp, false, "Cannot print this expression!");
+  }
+}
+
+void out_assert(Context *c, YYLTYPE *locp,
+                void *dummy __attribute__((unused))) {
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
+/* Temporary values creation */
+HexValue gen_tmp(Context *c, YYLTYPE *locp, int bit_width)
+{
+    HexValue rvalue;
+    rvalue.type = TEMP;
+    bit_width = (bit_width == 64) ? 64 : 32;
+    rvalue.bit_width = bit_width;
+    rvalue.is_unsigned = false;
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
+                       int bit_width)
+{
+    HexValue rvalue;
+    rvalue.type = TEMP;
+    rvalue.bit_width = bit_width;
+    rvalue.is_unsigned = false;
+    rvalue.is_dotnew = false;
+    rvalue.is_manual = false;
+    rvalue.tmp.index = c->inst.tmp_count;
+    OUT(c, locp, "TCGv_i", &bit_width, " tmp_", &c->inst.tmp_count,
+        " = tcg_const_i", &bit_width, "(", value, ");\n");
+    c->inst.tmp_count++;
+    return rvalue;
+}
+
+HexValue gen_imm_value(Context *c __attribute__((unused)),
+                       YYLTYPE *locp,
+                       int value,
+                       int bit_width)
+{
+    HexValue rvalue;
+    rvalue.type = IMMEDIATE;
+    rvalue.bit_width = bit_width;
+    rvalue.is_unsigned = false;
+    rvalue.is_dotnew = false;
+    rvalue.is_manual = false;
+    rvalue.imm.type = VALUE;
+    rvalue.imm.value = value;
+    return rvalue;
+}
+
+void rvalue_free(Context *c, YYLTYPE *locp, HexValue *rvalue)
+{
+    if (rvalue->type == TEMP && !rvalue->is_manual) {
+        const char *bit_suffix = (rvalue->bit_width == 64) ? "i64" : "i32";
+        OUT(c, locp, "tcg_temp_free_", bit_suffix, "(", rvalue, ");\n");
+    }
+}
+
+static void rvalue_free_manual(Context *c, YYLTYPE *locp, HexValue *rvalue)
+{
+    rvalue->is_manual = false;
+    rvalue_free(c, locp, rvalue);
+}
+
+HexValue rvalue_materialize(Context *c, YYLTYPE *locp, HexValue *rvalue)
+{
+    if (rvalue->type == IMMEDIATE) {
+        HexValue tmp = gen_tmp(c, locp, rvalue->bit_width);
+        tmp.is_unsigned = rvalue->is_unsigned;
+        const char *bit_suffix = (rvalue->bit_width == 64) ? "i64" : "i32";
+        OUT(c, locp, "tcg_gen_movi_", bit_suffix,
+            "(", &tmp, ", ", rvalue, ");\n");
+        rvalue_free(c, locp, rvalue);
+        return tmp;
+    }
+    return *rvalue;
+}
+
+HexValue rvalue_extend(Context *c, YYLTYPE *locp, HexValue *rvalue)
+{
+    if (rvalue->type == IMMEDIATE) {
+        HexValue res = *rvalue;
+        res.bit_width = 64;
+        return res;
+    } else {
+        if (rvalue->bit_width == 32) {
+            HexValue res = gen_tmp(c, locp, 64);
+            const char *sign_suffix = (rvalue->is_unsigned) ? "u" : "";
+            OUT(c, locp, "tcg_gen_ext", sign_suffix,
+                "_i32_i64(", &res, ", ", rvalue, ");\n");
+            rvalue_free(c, locp, rvalue);
+            return res;
+        }
+    }
+    return *rvalue;
+}
+
+HexValue rvalue_truncate(Context *c, YYLTYPE *locp, HexValue *rvalue)
+{
+    if (rvalue->type == IMMEDIATE) {
+        HexValue res = *rvalue;
+        res.bit_width = 32;
+        return res;
+    } else {
+        if (rvalue->bit_width == 64) {
+            HexValue res = gen_tmp(c, locp, 32);
+            OUT(c, locp, "tcg_gen_trunc_i64_tl(", &res, ", ", rvalue, ");\n");
+            rvalue_free(c, locp, rvalue);
+            return res;
+        }
+    }
+    return *rvalue;
+}
+
+int find_variable(Context *c, YYLTYPE *locp, HexValue *varid)
+{
+    for (int i = 0; i < c->inst.allocated->len; i++) {
+        Var *curr = &g_array_index(c->inst.allocated, Var, i);
+        if (g_string_equal(varid->var.name, curr->name)) {
+            return i;
+        }
+    }
+    return -1;
+}
+
+void varid_allocate(Context *c,
+                    YYLTYPE *locp,
+                    HexValue *varid,
+                    int width,
+                    bool is_unsigned)
+{
+    varid->bit_width = width;
+    const char *bit_suffix = width == 64 ? "64" : "32";
+    int index = find_variable(c, locp, varid);
+    bool found = index != -1;
+    if (found) {
+        Var *other = &g_array_index(c->inst.allocated, Var, index);
+        varid->var.name = other->name;
+        varid->bit_width = other->bit_width;
+        varid->is_unsigned = other->is_unsigned;
+    } else {
+        EMIT_HEAD(c, "TCGv_i%s %s", bit_suffix, varid->var.name->str);
+        EMIT_HEAD(c, " = tcg_temp_local_new_i%s();\n", bit_suffix);
+        Var new_var = {
+            .name = varid->var.name,
+            .bit_width = width,
+            .is_unsigned = is_unsigned,
+        };
+        g_array_append_val(c->inst.allocated, new_var);
+    }
+}
+
+void ea_free(Context *c, YYLTYPE *locp)
+{
+    OUT(c, locp, "tcg_temp_free(EA);\n");
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
+                     HexValue *op1_ptr,
+                     HexValue *op2_ptr)
+{
+    HexValue op1 = *op1_ptr;
+    HexValue op2 = *op2_ptr;
+    enum OpTypes op_types = (op1.type != IMMEDIATE) << 1
+                            | (op2.type != IMMEDIATE);
+
+    /* Find bit width of the two operands, if at least one is 64 bit use a */
+    /* 64bit operation, eventually extend 32bit operands. */
+    bool op_is64bit = op1.bit_width == 64 || op2.bit_width == 64;
+    const char *bit_suffix = op_is64bit ? "i64" : "i32";
+    int bit_width = (op_is64bit) ? 64 : 32;
+    if (op_is64bit) {
+        switch (op_types) {
+        case IMM_IMM:
+            break;
+        case IMM_REG:
+            op2 = rvalue_extend(c, locp, &op2);
+            break;
+        case REG_IMM:
+            op1 = rvalue_extend(c, locp, &op1);
+            break;
+        case REG_REG:
+            op1 = rvalue_extend(c, locp, &op1);
+            op2 = rvalue_extend(c, locp, &op2);
+            break;
+        }
+    }
+
+    HexValue res = gen_tmp(c, locp, bit_width);
+
+    switch (op_types) {
+    case IMM_IMM:
+        OUT(c, locp, "tcg_gen_movi_", bit_suffix,
+            "(", &res, ", ", &op1, " == ", &op2, ");\n");
+        break;
+    case IMM_REG:
+    {
+        HexValue swp = op2;
+        op2 = op1;
+        op1 = swp;
+        /* Swap comparison direction */
+        type = tcg_swap_cond(type);
+    }
+    /* fallthrough */
+    case REG_IMM:
+        OUT(c, locp, "tcg_gen_setcondi_", bit_suffix, "(");
+        OUT(c, locp, cond_to_str(type), ", ", &res, ", ", &op1, ", ", &op2,
+            ");\n");
+        break;
+    case REG_REG:
+        OUT(c, locp, "tcg_gen_setcond_", bit_suffix, "(");
+        OUT(c, locp, cond_to_str(type), ", ", &res, ", ", &op1, ", ", &op2,
+            ");\n");
+        break;
+    default:
+        fprintf(stderr, "Error in evalutating immediateness!");
+        abort();
+    }
+
+    /* Free operands */
+    rvalue_free(c, locp, &op1);
+    rvalue_free(c, locp, &op2);
+
+    return res;
+}
+
+static void gen_simple_op(Context *c, YYLTYPE *locp, unsigned bit_width,
+                          const char *bit_suffix, HexValue *res,
+                          enum OpTypes op_types, HexValue *op1,
+                          HexValue *op2,
+                          const char *imm_imm,
+                          const char *imm_reg,
+                          const char *reg_imm,
+                          const char *reg_reg
+                          ) {
+    switch (op_types) {
+    case IMM_IMM:
+        OUT(c, locp, "int", &bit_width, "_t ", res,
+            " = ", op1, imm_imm, op2, ";\n");
+        break;
+    case IMM_REG:
+        OUT(c, locp, imm_reg, bit_suffix,
+            "(", res, ", ", op2, ", (int64_t)", op1, ");\n");
+        break;
+    case REG_IMM:
+        OUT(c, locp, reg_imm, bit_suffix,
+            "(", res, ", ", op1, ", (int64_t)", op2, ");\n");
+        break;
+    case REG_REG:
+        OUT(c, locp, reg_reg, bit_suffix,
+            "(", res, ", ", op1, ", ", op2, ");\n");
+        break;
+    }
+    rvalue_free(c, locp, op1);
+    rvalue_free(c, locp, op2);
+}
+
+static void gen_sub_op(Context *c, YYLTYPE *locp, unsigned bit_width,
+                       const char *bit_suffix, HexValue *res,
+                       enum OpTypes op_types, HexValue *op1, HexValue *op2)
+{
+    switch (op_types) {
+    case IMM_IMM:
+        OUT(c, locp, "int", &bit_width, "_t ", res,
+            " = ", op1, " - ", op2, ";\n");
+        break;
+    case IMM_REG:
+        OUT(c, locp, "tcg_gen_subfi_", bit_suffix,
+            "(", res, ", ", op1, ", ", op2, ");\n");
+        break;
+    case REG_IMM:
+        OUT(c, locp, "tcg_gen_subi_", bit_suffix,
+            "(", res, ", ", op1, ", ", op2, ");\n");
+        break;
+    case REG_REG:
+        OUT(c, locp, "tcg_gen_sub_", bit_suffix,
+            "(", res, ", ", op1, ", ", op2, ");\n");
+        break;
+    }
+    rvalue_free(c, locp, op1);
+    rvalue_free(c, locp, op2);
+}
+
+static void gen_asl_op(Context *c, YYLTYPE *locp, unsigned bit_width,
+                       bool op_is64bit, const char *bit_suffix, HexValue *res,
+                       enum OpTypes op_types, HexValue *op1_ptr,
+                       HexValue *op2_ptr)
+{
+    HexValue op1 = *op1_ptr;
+    HexValue op2 = *op2_ptr;
+    switch (op_types) {
+    case IMM_IMM:
+        OUT(c, locp, "int", &bit_width, "_t ", res,
+            " = ", &op1, " << ", &op2, ";\n");
+        break;
+    case REG_IMM:
+        {
+            OUT(c, locp, "if (", &op2, " >= ", &bit_width, ") {\n");
+            OUT(c, locp, "tcg_gen_movi_", bit_suffix, "(", res, ", 0);\n");
+            OUT(c, locp, "} else {\n");
+            OUT(c, locp, "tcg_gen_shli_", bit_suffix,
+                "(", res, ", ", &op1, ", ", &op2, ");\n");
+            OUT(c, locp, "}\n");
+        }
+        break;
+    case IMM_REG:
+        op1.bit_width = bit_width;
+        op1 = rvalue_materialize(c, locp, &op1);
+        /* Fallthrough */
+    case REG_REG:
+        OUT(c, locp, "tcg_gen_shl_", bit_suffix,
+            "(", res, ", ", &op1, ", ", &op2, ");\n");
+        break;
+    }
+    if (op_types == IMM_REG || op_types == REG_REG) {
+        /* Handle left shift by 64/32 which hexagon-sim expects to clear out */
+        /* register */
+        HexValue edge = gen_imm_value(c, locp, bit_width, bit_width);
+        edge = rvalue_materialize(c, locp, &edge);
+        HexValue zero = gen_tmp_value(c, locp, "0", bit_width);
+        if (op_is64bit) {
+            op2 = rvalue_extend(c, locp, &op2);
+        }
+        op1 = rvalue_materialize(c, locp, &op1);
+        op2 = rvalue_materialize(c, locp, &op2);
+        OUT(c, locp, "tcg_gen_movcond_i", &bit_width);
+        OUT(c, locp, "(TCG_COND_GEU, ", res, ", ", &op2, ", ", &edge);
+        OUT(c, locp, ", ", &zero, ", ", res, ");\n");
+        rvalue_free(c, locp, &edge);
+        rvalue_free(c, locp, &zero);
+    }
+    rvalue_free(c, locp, &op1);
+    rvalue_free(c, locp, &op2);
+}
+
+static void gen_asr_op(Context *c, YYLTYPE *locp, unsigned bit_width,
+                       bool op_is64bit, const char *bit_suffix, HexValue *res,
+                       enum OpTypes op_types, HexValue *op1_ptr,
+                       HexValue *op2_ptr)
+{
+    HexValue op1 = *op1_ptr;
+    HexValue op2 = *op2_ptr;
+    switch (op_types) {
+    case IMM_IMM:
+        OUT(c, locp, "int", &bit_width, "_t ", res,
+            " = ", &op1, " >> ", &op2, ";\n");
+        break;
+    case REG_IMM:
+        OUT(c, locp, "{\nint", &bit_width, "_t shift = ", &op2, ";\n");
+        OUT(c, locp, "if (", &op2, " >= ", &bit_width, ") {\n");
+        OUT(c, locp, "    shift = ", &bit_width, " - 1;\n");
+        OUT(c, locp, "}\n");
+        OUT(c, locp, "tcg_gen_sari_", bit_suffix,
+            "(", res, ", ", &op1, ", shift);\n}\n");
+        break;
+    case IMM_REG:
+        op1 = rvalue_materialize(c, locp, &op1);
+        /* Fallthrough */
+    case REG_REG:
+        OUT(c, locp, "tcg_gen_sar_", bit_suffix,
+            "(", res, ", ", &op1, ", ", &op2, ");\n");
+        break;
+    }
+    if (op_types == IMM_REG ||  op_types == REG_REG) {
+        /* Handle right shift by values >= bit_width */
+        HexValue edge = gen_imm_value(c, locp, bit_width, bit_width);
+        edge = rvalue_materialize(c, locp, &edge);
+        HexValue tmp = gen_tmp(c, locp, bit_width);
+        HexValue zero = gen_tmp_value(c, locp, "0", bit_width);
+        if (op_is64bit) {
+            op2 = rvalue_extend(c, locp, &op2);
+        }
+        op1 = rvalue_materialize(c, locp, &op1);
+        op2 = rvalue_materialize(c, locp, &op2);
+
+        const char *offset = op_is64bit ? "63" : "31";
+        OUT(c, locp, "tcg_gen_extract_", bit_suffix, "(",
+            &tmp, ", ", &op1, ", ", offset, ", 1);\n");
+        OUT(c, locp, "tcg_gen_sub_", bit_suffix, "(",
+            &tmp, ", ", &zero, ", ", &tmp, ");\n");
+        OUT(c, locp, "tcg_gen_movcond_i", &bit_width);
+        OUT(c, locp, "(TCG_COND_GEU, ", res, ", ", &op2, ", ", &edge);
+        OUT(c, locp, ", ", &tmp, ", ", res, ");\n");
+        rvalue_free(c, locp, &edge);
+        rvalue_free(c, locp, &tmp);
+        rvalue_free(c, locp, &zero);
+    }
+    rvalue_free(c, locp, &op1);
+    rvalue_free(c, locp, &op2);
+}
+
+static void gen_lsr_op(Context *c, YYLTYPE *locp, unsigned bit_width,
+                       bool op_is64bit, const char *bit_suffix, HexValue *res,
+                       enum OpTypes op_types, HexValue *op1_ptr,
+                       HexValue *op2_ptr)
+{
+    HexValue op1 = *op1_ptr;
+    HexValue op2 = *op2_ptr;
+    switch (op_types) {
+    case IMM_IMM:
+        OUT(c, locp, "int", &bit_width, "_t ",
+            res, " = ", &op1, " >> ", &op2, ";\n");
+        break;
+    case REG_IMM:
+        OUT(c, locp, "if (", &op2, " >= ", &bit_width, ") {\n");
+        OUT(c, locp, "tcg_gen_movi_", bit_suffix, "(", res, ", 0);\n");
+        OUT(c, locp, "} else {\n");
+        OUT(c, locp, "tcg_gen_shri_", bit_suffix,
+            "(", res, ", ", &op1, ", ", &op2, ");\n");
+        OUT(c, locp, "}\n");
+        break;
+    case IMM_REG:
+        op1 = rvalue_materialize(c, locp, &op1);
+        /* Fallthrough */
+    case REG_REG:
+        OUT(c, locp, "tcg_gen_shr_", bit_suffix,
+            "(", res, ", ", &op1, ", ", &op2, ");\n");
+        break;
+    }
+    if (op_types == IMM_REG ||  op_types == REG_REG) {
+        /* Handle right shift by values >= bit_width */
+        HexValue edge = gen_imm_value(c, locp, bit_width, bit_width);
+        edge = rvalue_materialize(c, locp, &edge);
+        HexValue zero = gen_tmp_value(c, locp, "0", bit_width);
+        if (op_is64bit) {
+            op2 = rvalue_extend(c, locp, &op2);
+        }
+        op1 = rvalue_materialize(c, locp, &op1);
+        op2 = rvalue_materialize(c, locp, &op2);
+        OUT(c, locp, "tcg_gen_movcond_i", &bit_width);
+        OUT(c, locp, "(TCG_COND_GEU, ", res, ", ", &op2, ", ", &edge);
+        OUT(c, locp, ", ", &zero, ", ", res, ");\n");
+        rvalue_free(c, locp, &edge);
+        rvalue_free(c, locp, &zero);
+    }
+    rvalue_free(c, locp, &op1);
+    rvalue_free(c, locp, &op2);
+}
+
+static void gen_andl_op(Context *c, YYLTYPE *locp, unsigned bit_width,
+                        const char *bit_suffix, HexValue *res,
+                        enum OpTypes op_types, HexValue *op1, HexValue *op2)
+{
+    HexValue zero, tmp1, tmp2;
+    switch (op_types) {
+    case IMM_IMM:
+        OUT(c, locp, "int", &bit_width, "_t ",
+            res, " = ", op1, " && ", op2, ";\n");
+        break;
+    case IMM_REG:
+        zero = gen_tmp_value(c, locp, "0", 32);
+        tmp2 = gen_bin_cmp(c, locp, TCG_COND_NE, op2, &zero);
+        OUT(c, locp, "tcg_gen_andi_", bit_suffix,
+            "(", res, ", ", op1, " != 0 , ", &tmp2, ");\n");
+        rvalue_free(c, locp, &tmp2);
+        break;
+    case REG_IMM:
+        zero = gen_tmp_value(c, locp, "0", 32);
+        tmp1 = gen_bin_cmp(c, locp, TCG_COND_NE, op1, &zero);
+        OUT(c, locp, "tcg_gen_andi_", bit_suffix,
+            "(", res, ", ", &tmp1, ", ", op2, " != 0);\n");
+        rvalue_free(c, locp, &tmp1);
+        break;
+    case REG_REG:
+        zero = gen_tmp_value(c, locp, "0", 32);
+        zero.is_manual = true;
+        tmp1 = gen_bin_cmp(c, locp, TCG_COND_NE, op1, &zero);
+        tmp2 = gen_bin_cmp(c, locp, TCG_COND_NE, op2, &zero);
+        OUT(c, locp, "tcg_gen_and_", bit_suffix,
+            "(", res, ", ", &tmp1, ", ", &tmp2, ");\n");
+        rvalue_free_manual(c, locp, &zero);
+        rvalue_free(c, locp, &tmp1);
+        rvalue_free(c, locp, &tmp2);
+        break;
+    }
+}
+
+static void gen_mini_op(Context *c, YYLTYPE *locp, unsigned bit_width,
+                        HexValue *res, enum OpTypes op_types,
+                        HexValue *op1_ptr, HexValue *op2_ptr)
+{
+    HexValue op1 = *op1_ptr;
+    HexValue op2 = *op2_ptr;
+    const char *min = res->is_unsigned ? "tcg_gen_umin" : "tcg_gen_smin";
+    switch (op_types) {
+    case IMM_IMM:
+        OUT(c, locp, "int", &bit_width, "_t ", res, " = (", &op1, " <= ");
+        OUT(c, locp, &op2, ") ? ", &op1, " : ", &op2, ";\n");
+        break;
+    case IMM_REG:
+        op1.bit_width = bit_width;
+        op1 = rvalue_materialize(c, locp, &op1);
+        OUT(c, locp, min, "_i", &bit_width, "(");
+        OUT(c, locp, res, ", ", &op1, ", ", &op2, ");\n");
+        break;
+    case REG_IMM:
+        op2.bit_width = bit_width;
+        op2 = rvalue_materialize(c, locp, &op2);
+        /* Fallthrough */
+    case REG_REG:
+        OUT(c, locp, min, "_i", &bit_width, "(");
+        OUT(c, locp, res, ", ", &op1, ", ", &op2, ");\n");
+        break;
+    }
+    rvalue_free(c, locp, &op1);
+    rvalue_free(c, locp, &op2);
+}
+
+static void gen_maxi_op(Context *c, YYLTYPE *locp, unsigned bit_width,
+                        HexValue *res, enum OpTypes op_types,
+                        HexValue *op1_ptr, HexValue *op2_ptr)
+{
+    HexValue op1 = *op1_ptr;
+    HexValue op2 = *op2_ptr;
+    const char *min = res->is_unsigned ? "tcg_gen_umax" : "tcg_gen_smax";
+    switch (op_types) {
+    case IMM_IMM:
+        OUT(c, locp, "int", &bit_width, "_t ", res, " = (", &op1, " <= ");
+        OUT(c, locp, &op2, ") ? ", &op2, " : ", &op1, ";\n");
+        break;
+    case IMM_REG:
+        op1.bit_width = bit_width;
+        op1 = rvalue_materialize(c, locp, &op1);
+        OUT(c, locp, min, "_i", &bit_width, "(");
+        OUT(c, locp, res, ", ", &op1, ", ", &op2, ");\n");
+        break;
+    case REG_IMM:
+        op2.bit_width = bit_width;
+        op2 = rvalue_materialize(c, locp, &op2);
+        /* Fallthrough */
+    case REG_REG:
+        OUT(c, locp, min, "_i", &bit_width, "(");
+        OUT(c, locp, res, ", ", &op1, ", ", &op2, ");\n");
+        break;
+    }
+    rvalue_free(c, locp, &op1);
+    rvalue_free(c, locp, &op2);
+}
+
+static void gen_mod_op(Context *c, YYLTYPE *locp, HexValue *res,
+                       enum OpTypes op_types, HexValue *op1, HexValue *op2)
+{
+    switch (op_types) {
+    case IMM_IMM:
+        OUT(c, locp, "int64_t ", res, " = ", op1, " % ", op2, ";\n");
+        break;
+    case IMM_REG:
+    case REG_IMM:
+    case REG_REG:
+        OUT(c, locp, "gen_helper_mod(",
+            res, ", ", op1, ", ", op2, ");\n");
+        break;
+    }
+    rvalue_free(c, locp, op1);
+    rvalue_free(c, locp, op2);
+}
+
+/* Code generation functions */
+HexValue gen_bin_op(Context *c,
+                    YYLTYPE *locp,
+                    OpType type,
+                    HexValue *operand1,
+                    HexValue *operand2)
+{
+    /* Replicate operands to avoid side effects */
+    HexValue op1 = *operand1;
+    HexValue op2 = *operand2;
+
+    /* Enforce variables' size */
+    if (op1.type == VARID) {
+        int index = find_variable(c, locp, &op1);
+        yyassert(c, locp, c->inst.allocated->len > 0,
+                 "Variable in bin_op must exist!\n");
+        op1.bit_width = g_array_index(c->inst.allocated, Var, index).bit_width;
+    }
+    if (op2.type == VARID) {
+        int index = find_variable(c, locp, &op2);
+        yyassert(c, locp, c->inst.allocated->len > 0,
+                 "Variable in bin_op must exist!\n");
+        op2.bit_width = g_array_index(c->inst.allocated, Var, index).bit_width;
+    }
+
+    enum OpTypes op_types = (op1.type != IMMEDIATE) << 1
+                            | (op2.type != IMMEDIATE);
+
+    /* Find bit width of the two operands, if at least one is 64 bit use a */
+    /* 64bit operation, eventually extend 32bit operands. */
+    bool op_is64bit = op1.bit_width == 64 || op2.bit_width == 64;
+    /* Shift greater than 32 are 64 bits wide */
+    if (type == ASL_OP && op2.type == IMMEDIATE &&
+        op2.imm.type == VALUE && op2.imm.value >= 32)
+        op_is64bit = true;
+    const char *bit_suffix = op_is64bit ? "i64" : "i32";
+    int bit_width = (op_is64bit) ? 64 : 32;
+    /* Handle bit width */
+    if (op_is64bit) {
+        switch (op_types) {
+        case IMM_IMM:
+            break;
+        case IMM_REG:
+            op2 = rvalue_extend(c, locp, &op2);
+            break;
+        case REG_IMM:
+            op1 = rvalue_extend(c, locp, &op1);
+            break;
+        case REG_REG:
+            op1 = rvalue_extend(c, locp, &op1);
+            op2 = rvalue_extend(c, locp, &op2);
+            break;
+        }
+    }
+    HexValue res;
+    if (op_types != IMM_IMM) {
+        res = gen_tmp(c, locp, bit_width);
+    } else {
+        res.type = IMMEDIATE;
+        res.is_dotnew = false;
+        res.is_manual = false;
+        res.imm.type = QEMU_TMP;
+        res.imm.index = c->inst.qemu_tmp_count;
+        res.bit_width = bit_width;
+    }
+    /* Handle signedness, if both unsigned -> result is unsigned, else signed */
+    res.is_unsigned = op1.is_unsigned && op2.is_unsigned;
+
+    switch (type) {
+    case ADD_OP:
+        gen_simple_op(c, locp, bit_width, bit_suffix, &res,
+                      op_types, &op1, &op2,
+                      " + ",
+                      "tcg_gen_addi_",
+                      "tcg_gen_addi_",
+                      "tcg_gen_add_");
+        break;
+    case SUB_OP:
+        gen_sub_op(c, locp, bit_width, bit_suffix, &res, op_types, &op1, &op2);
+        break;
+    case MUL_OP:
+        gen_simple_op(c, locp, bit_width, bit_suffix, &res,
+                      op_types, &op1, &op2,
+                      " * ",
+                      "tcg_gen_muli_",
+                      "tcg_gen_muli_",
+                      "tcg_gen_mul_");
+        break;
+    case ASL_OP:
+        gen_asl_op(c, locp, bit_width, op_is64bit, bit_suffix, &res, op_types,
+                   &op1, &op2);
+        break;
+    case ASR_OP:
+        gen_asr_op(c, locp, bit_width, op_is64bit, bit_suffix, &res, op_types,
+                   &op1, &op2);
+        break;
+    case LSR_OP:
+        gen_lsr_op(c, locp, bit_width, op_is64bit, bit_suffix, &res, op_types,
+                   &op1, &op2);
+        break;
+    case ANDB_OP:
+        gen_simple_op(c, locp, bit_width, bit_suffix, &res,
+                      op_types, &op1, &op2,
+                      " & ",
+                      "tcg_gen_andi_",
+                      "tcg_gen_andi_",
+                      "tcg_gen_and_");
+        break;
+    case ORB_OP:
+        gen_simple_op(c, locp, bit_width, bit_suffix, &res,
+                      op_types, &op1, &op2,
+                      " | ",
+                      "tcg_gen_ori_",
+                      "tcg_gen_ori_",
+                      "tcg_gen_or_");
+        break;
+    case XORB_OP:
+        gen_simple_op(c, locp, bit_width, bit_suffix, &res,
+                      op_types, &op1, &op2,
+                      " ^ ",
+                      "tcg_gen_xori_",
+                      "tcg_gen_xori_",
+                      "tcg_gen_xor_");
+        break;
+    case ANDL_OP:
+        gen_andl_op(c, locp, bit_width, bit_suffix, &res, op_types, &op1, &op2);
+        break;
+    case MINI_OP:
+        gen_mini_op(c, locp, bit_width, &res, op_types, &op1, &op2);
+        break;
+    case MAXI_OP:
+        gen_maxi_op(c, locp, bit_width, &res, op_types, &op1, &op2);
+        break;
+    case MOD_OP:
+        gen_mod_op(c, locp, &res, op_types, &op1, &op2);
+        break;
+    }
+    if (op_types == IMM_IMM) {
+        c->inst.qemu_tmp_count++;
+    }
+    return res;
+}
+
+HexValue gen_cast_op(Context *c,
+                     YYLTYPE *locp,
+                     HexValue *source,
+                     unsigned target_width) {
+    if (source->bit_width == target_width) {
+        return *source;
+    } else if (source->type == IMMEDIATE) {
+        HexValue res = *source;
+        res.bit_width = target_width;
+        return res;
+    } else {
+        HexValue res = gen_tmp(c, locp, target_width);
+        /* Truncate */
+        if (source->bit_width > target_width) {
+            OUT(c, locp, "tcg_gen_trunc_i64_tl(", &res, ", ", source, ");\n");
+        } else {
+            if (source->is_unsigned) {
+                /* Extend unsigned */
+                OUT(c, locp, "tcg_gen_extu_i32_i64(",
+                    &res, ", ", source, ");\n");
+            } else {
+                /* Extend signed */
+                OUT(c, locp, "tcg_gen_ext_i32_i64(",
+                    &res, ", ", source, ");\n");
+            }
+        }
+        rvalue_free(c, locp, source);
+        return res;
+    }
+}
+
+HexValue gen_extend_op(Context *c,
+                       YYLTYPE *locp,
+                       HexValue *src_width_ptr,
+                       HexValue *dst_width_ptr,
+                       HexValue *value_ptr,
+                       bool is_unsigned) {
+    HexValue src_width = *src_width_ptr;
+    HexValue dst_width = *dst_width_ptr;
+    HexValue value = *value_ptr;
+    src_width = rvalue_extend(c, locp, &src_width);
+    value = rvalue_extend(c, locp, &value);
+    src_width = rvalue_materialize(c, locp, &src_width);
+    value = rvalue_materialize(c, locp, &value);
+
+    HexValue res = gen_tmp(c, locp, 64);
+    HexValue shift = gen_tmp_value(c, locp, "64", 64);
+    HexValue zero = gen_tmp_value(c, locp, "0", 64);
+    OUT(c, locp, "tcg_gen_sub_i64(",
+        &shift, ", ", &shift, ", ", &src_width, ");\n");
+    if (is_unsigned) {
+        HexValue mask = gen_tmp_value(c, locp, "0xffffffffffffffff", 64);
+        OUT(c, locp, "tcg_gen_shr_i64(",
+            &mask, ", ", &mask, ", ", &shift, ");\n");
+        OUT(c, locp, "tcg_gen_and_i64(",
+            &res, ", ", &value, ", ", &mask, ");\n");
+        rvalue_free(c, locp, &mask);
+    } else {
+        OUT(c, locp, "tcg_gen_shl_i64(",
+            &res, ", ", &value, ", ", &shift, ");\n");
+        OUT(c, locp, "tcg_gen_sar_i64(",
+            &res, ", ", &res, ", ", &shift, ");\n");
+    }
+    OUT(c, locp, "tcg_gen_movcond_i64(TCG_COND_EQ, ", &res, ", ");
+    OUT(c, locp, &src_width, ", ", &zero, ", ", &zero, ", ", &res, ");\n");
+
+    rvalue_free(c, locp, &src_width);
+    rvalue_free(c, locp, &dst_width);
+    rvalue_free(c, locp, &value);
+    rvalue_free(c, locp, &shift);
+    rvalue_free(c, locp, &zero);
+
+    res.is_unsigned = is_unsigned;
+    return res;
+}
+
+void gen_rdeposit_op(Context *c,
+                     YYLTYPE *locp,
+                     HexValue *dest,
+                     HexValue *value,
+                     HexValue *begin,
+                     HexValue *width)
+{
+    HexValue dest_m = *dest;
+    dest_m.is_manual = true;
+
+    HexValue value_m = rvalue_extend(c, locp, value);
+    HexValue begin_m = rvalue_extend(c, locp, begin);
+    HexValue width_orig = *width;
+    width_orig.is_manual = true;
+    HexValue width_m = rvalue_extend(c, locp, &width_orig);
+    width_m = rvalue_materialize(c, locp, &width_m);
+
+    HexValue mask = gen_tmp_value(c, locp, "0xffffffffffffffffUL", 64);
+    mask.is_unsigned = true;
+    HexValue k64 = gen_tmp_value(c, locp, "64", 64);
+    k64 = gen_bin_op(c, locp, SUB_OP, &k64, &width_m);
+    mask = gen_bin_op(c, locp, LSR_OP, &mask, &k64);
+    begin_m.is_manual = true;
+    mask = gen_bin_op(c, locp, ASL_OP, &mask, &begin_m);
+    mask.is_manual = true;
+    value_m = gen_bin_op(c, locp, ASL_OP, &value_m, &begin_m);
+    value_m = gen_bin_op(c, locp, ANDB_OP, &value_m, &mask);
+
+    OUT(c, locp, "tcg_gen_not_i64(", &mask, ", ", &mask, ");\n");
+    mask.is_manual = false;
+    HexValue res = gen_bin_op(c, locp, ANDB_OP, &dest_m, &mask);
+    res = gen_bin_op(c, locp, ORB_OP, &res, &value_m);
+
+    if (dest->bit_width != res.bit_width) {
+        res = rvalue_truncate(c, locp, &res);
+    }
+
+    HexValue zero = gen_tmp_value(c, locp, "0", res.bit_width);
+    OUT(c, locp, "tcg_gen_movcond_i", &res.bit_width, "(TCG_COND_NE, ", dest);
+    OUT(c, locp, ", ", &width_orig, ", ", &zero, ", ", &res, ", ", dest,
+        ");\n");
+
+    rvalue_free(c, locp, &zero);
+    rvalue_free(c, locp, width);
+    rvalue_free(c, locp, &res);
+}
+
+void gen_deposit_op(Context *c,
+                    YYLTYPE *locp,
+                    HexValue *dest,
+                    HexValue *value,
+                    HexValue *index,
+                    HexCast *cast)
+{
+    yyassert(c, locp, index->type == IMMEDIATE,
+             "Deposit index must be immediate!\n");
+    HexValue value_m = *value;
+    int bit_width = (dest->bit_width == 64) ? 64 : 32;
+    int width = cast->bit_width;
+    /* If the destination value is 32, truncate the value, otherwise extend */
+    if (dest->bit_width != value->bit_width) {
+        if (bit_width == 32) {
+            value_m = rvalue_truncate(c, locp, &value_m);
+        } else {
+            value_m = rvalue_extend(c, locp, &value_m);
+        }
+    }
+    value_m = rvalue_materialize(c, locp, &value_m);
+    OUT(c, locp, "tcg_gen_deposit_i", &bit_width, "(", dest, ", ", dest, ", ");
+    OUT(c, locp, &value_m, ", ", index, " * ", &width, ", ", &width, ");\n");
+    rvalue_free(c, locp, index);
+    rvalue_free(c, locp, &value_m);
+}
+
+HexValue gen_rextract_op(Context *c,
+                         YYLTYPE *locp,
+                         HexValue *source,
+                         int begin,
+                         int width) {
+    int bit_width = (source->bit_width == 64) ? 64 : 32;
+    HexValue res = gen_tmp(c, locp, bit_width);
+    OUT(c, locp, "tcg_gen_extract_i", &bit_width, "(", &res);
+    OUT(c, locp, ", ", source, ", ", &begin, ", ", &width, ");\n");
+    rvalue_free(c, locp, source);
+    return res;
+}
+
+HexValue gen_extract_op(Context *c,
+                        YYLTYPE *locp,
+                        HexValue *source,
+                        HexValue *index,
+                        HexExtract *extract) {
+    yyassert(c, locp, index->type == IMMEDIATE,
+             "Extract index must be immediate!\n");
+    int bit_width = (source->bit_width == 64) ? 64 : 32;
+    const char *sign_prefix = (extract->is_unsigned) ? "" : "s";
+    int width = extract->bit_width;
+    HexValue res = gen_tmp(c, locp, bit_width);
+    res.is_unsigned = extract->is_unsigned;
+    OUT(c, locp, "tcg_gen_", sign_prefix, "extract_i", &bit_width,
+        "(", &res, ", ", source);
+    OUT(c, locp, ", ", index, " * ", &width, ", ", &width, ");\n");
+
+    /* Some extract operations have bit_width != storage_bit_width */
+    if (extract->storage_bit_width > bit_width) {
+        HexValue tmp = gen_tmp(c, locp, extract->storage_bit_width);
+        tmp.is_unsigned = extract->is_unsigned;
+        if (extract->is_unsigned) {
+            /* Extend unsigned */
+            OUT(c, locp, "tcg_gen_extu_i32_i64(",
+                &tmp, ", ", &res, ");\n");
+        } else {
+            /* Extend signed */
+            OUT(c, locp, "tcg_gen_ext_i32_i64(",
+                &tmp, ", ", &res, ");\n");
+        }
+        rvalue_free(c, locp, &res);
+        res = tmp;
+    }
+
+    rvalue_free(c, locp, source);
+    rvalue_free(c, locp, index);
+    return res;
+}
+
+HexValue gen_read_creg(Context *c, YYLTYPE *locp, HexValue *reg)
+{
+    yyassert(c, locp, reg->type == REGISTER, "reg must be a register!");
+    if (reg->reg.id < 'a') {
+        HexValue tmp = gen_tmp_value(c, locp, "0", 32);
+        const char *id = creg_str[(uint8_t)reg->reg.id];
+        OUT(c, locp, "READ_REG(", &tmp, ", ", id, ");\n");
+        rvalue_free(c, locp, reg);
+        return tmp;
+    }
+    return *reg;
+}
+
+void gen_write_creg(Context *c,
+                    YYLTYPE *locp,
+                    HexValue *reg,
+                    HexValue *value)
+{
+    yyassert(c, locp, reg->type == REGISTER, "reg must be a register!");
+    HexValue value_m = *value;
+    value_m = rvalue_truncate(c, locp, &value_m);
+    value_m = rvalue_materialize(c, locp, &value_m);
+    OUT(c,
+        locp,
+        "gen_log_reg_write(", creg_str[(uint8_t)reg->reg.id], ", ",
+        &value_m, ");\n");
+    OUT(c,
+        locp,
+        "ctx_log_reg_write(ctx, ", creg_str[(uint8_t)reg->reg.id], ");\n");
+    rvalue_free(c, locp, reg);
+    rvalue_free(c, locp, &value_m);
+}
+
+void gen_assign(Context *c,
+                YYLTYPE *locp,
+                HexValue *dest,
+                HexValue *value)
+{
+    HexValue value_m = *value;
+    if (dest->type == REGISTER &&
+        dest->reg.type == CONTROL && dest->reg.id < 'a') {
+        gen_write_creg(c, locp, dest, &value_m);
+        return;
+    }
+    /* Create (if not present) and assign to temporary variable */
+    if (dest->type == VARID) {
+        varid_allocate(c, locp, dest, value_m.bit_width, value_m.is_unsigned);
+    }
+    int bit_width = dest->bit_width == 64 ? 64 : 32;
+    if (bit_width != value_m.bit_width) {
+        if (bit_width == 64) {
+            value_m = rvalue_extend(c, locp, &value_m);
+        } else {
+            value_m = rvalue_truncate(c, locp, &value_m);
+        }
+    }
+    value_m = rvalue_materialize(c, locp, &value_m);
+    if (value_m.type == IMMEDIATE) {
+        OUT(c, locp, "tcg_gen_movi_i", &bit_width,
+            "(", dest, ", ", &value_m, ");\n");
+    } else {
+        OUT(c, locp, "tcg_gen_mov_i", &bit_width,
+            "(", dest, ", ", &value_m, ");\n");
+    }
+    rvalue_free(c, locp, &value_m);
+}
+
+HexValue gen_convround(Context *c,
+                       YYLTYPE *locp,
+                       HexValue *source)
+{
+    HexValue src = *source;
+    src.is_manual = true;
+
+    unsigned bit_width = src.bit_width;
+    const char *size = (bit_width == 32) ? "32" : "64";
+    HexValue res = gen_tmp(c, locp, bit_width);
+    HexValue mask = gen_tmp_value(c, locp, "0x3", bit_width);
+    mask.is_manual = true;
+    HexValue and = gen_bin_op(c, locp, ANDB_OP, &src, &mask);
+    HexValue one = gen_tmp_value(c, locp, "1", bit_width);
+    HexValue src_p1 = gen_bin_op(c, locp, ADD_OP, &src, &one);
+
+    OUT(c, locp, "tcg_gen_movcond_i", size, "(TCG_COND_EQ, ", &res);
+    OUT(c, locp, ", ", &and, ", ", &mask, ", ");
+    OUT(c, locp, &src_p1, ", ", &src, ");\n");
+
+    /* Free src but use the original `is_manual` value */
+    rvalue_free(c, locp, source);
+
+    /* Free the rest of the values */
+    rvalue_free_manual(c, locp, &mask);
+    rvalue_free(c, locp, &and);
+    rvalue_free(c, locp, &src_p1);
+
+    return res;
+}
+
+static HexValue gen_convround_n_a(Context *c,
+                                  YYLTYPE *locp,
+                                  HexValue *a,
+                                  HexValue *n)
+{
+    HexValue res = gen_tmp(c, locp, 64);
+    OUT(c, locp, "tcg_gen_ext_i32_i64(", &res, ", ", a, ");\n");
+    return res;
+}
+
+static HexValue gen_convround_n_b(Context *c,
+                                  YYLTYPE *locp,
+                                  HexValue *a,
+                                  HexValue *n)
+{
+    HexValue res = gen_tmp(c, locp, 64);
+    OUT(c, locp, "tcg_gen_ext_i32_i64(", &res, ", ", a, ");\n");
+
+    HexValue one = gen_tmp_value(c, locp, "1", 32);
+    HexValue tmp = gen_tmp(c, locp, 32);
+    HexValue tmp_64 = gen_tmp(c, locp, 64);
+
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
+    rvalue_free(c, locp, &one);
+    rvalue_free(c, locp, &tmp);
+    rvalue_free(c, locp, &tmp_64);
+
+    return res;
+}
+
+static HexValue gen_convround_n_c(Context *c,
+                                  YYLTYPE *locp,
+                                  HexValue *a,
+                                  HexValue *n)
+{
+    HexValue res = gen_tmp(c, locp, 64);
+    OUT(c, locp, "tcg_gen_ext_i32_i64(", &res, ", ", a, ");\n");
+
+    HexValue one = gen_tmp_value(c, locp, "1", 32);
+    HexValue tmp = gen_tmp(c, locp, 32);
+    HexValue tmp_64 = gen_tmp(c, locp, 64);
+
+    OUT(c, locp, "tcg_gen_subi_i32(", &tmp);
+    OUT(c, locp, ", ", n, ", 1);\n");
+    OUT(c, locp, "tcg_gen_shl_i32(", &tmp);
+    OUT(c, locp, ", ", &one, ", ", &tmp, ");\n");
+    OUT(c, locp, "tcg_gen_ext_i32_i64(", &tmp_64, ", ", &tmp, ");\n");
+    OUT(c, locp, "tcg_gen_add_i64(", &res);
+    OUT(c, locp, ", ", &res, ", ", &tmp_64, ");\n");
+
+    rvalue_free(c, locp, &one);
+    rvalue_free(c, locp, &tmp);
+    rvalue_free(c, locp, &tmp_64);
+
+    return res;
+}
+
+HexValue gen_convround_n(Context *c,
+                         YYLTYPE *locp,
+                         HexValue *source_ptr,
+                         HexValue *bit_pos_ptr)
+{
+    /* If input is 64 bit cast it to 32 */
+    HexValue source = gen_cast_op(c, locp, source_ptr, 32);
+    HexValue bit_pos = gen_cast_op(c, locp, bit_pos_ptr, 32);
+
+    source = rvalue_materialize(c, locp, &source);
+    bit_pos = rvalue_materialize(c, locp, &bit_pos);
+
+    HexValue r1 = gen_convround_n_a(c, locp, &source, &bit_pos);
+    HexValue r2 = gen_convround_n_b(c, locp, &source, &bit_pos);
+    HexValue r3 = gen_convround_n_c(c, locp, &source, &bit_pos);
+
+    HexValue l_32 = gen_tmp_value(c, locp, "1", 32);
+
+    HexValue cond = gen_tmp(c, locp, 32);
+    HexValue cond_64 = gen_tmp(c, locp, 64);
+    HexValue mask = gen_tmp(c, locp, 32);
+    HexValue n_64 = gen_tmp(c, locp, 64);
+    HexValue res = gen_tmp(c, locp, 64);
+    HexValue zero = gen_tmp_value(c, locp, "0", 64);
+
+    OUT(c, locp, "tcg_gen_sub_i32(", &mask);
+    OUT(c, locp, ", ", &bit_pos, ", ", &l_32, ");\n");
+    OUT(c, locp, "tcg_gen_shl_i32(", &mask);
+    OUT(c, locp, ", ", &l_32, ", ", &mask, ");\n");
+    OUT(c, locp, "tcg_gen_sub_i32(", &mask);
+    OUT(c, locp, ", ", &mask, ", ", &l_32, ");\n");
+    OUT(c, locp, "tcg_gen_and_i32(", &cond);
+    OUT(c, locp, ", ", &source, ", ", &mask, ");\n");
+    OUT(c, locp, "tcg_gen_extu_i32_i64(", &cond_64, ", ", &cond, ");\n");
+    OUT(c, locp, "tcg_gen_ext_i32_i64(", &n_64, ", ", &bit_pos, ");\n");
+
+    OUT(c, locp, "tcg_gen_movcond_i64");
+    OUT(c, locp, "(TCG_COND_EQ, ", &res, ", ", &cond_64, ", ", &zero);
+    OUT(c, locp, ", ", &r2, ", ", &r3, ");\n");
+
+    OUT(c, locp, "tcg_gen_movcond_i64");
+    OUT(c, locp, "(TCG_COND_EQ, ", &res, ", ", &n_64, ", ", &zero);
+    OUT(c, locp, ", ", &r1, ", ", &res, ");\n");
+
+    OUT(c, locp, "tcg_gen_shr_i64(", &res);
+    OUT(c, locp, ", ", &res, ", ", &n_64, ");\n");
+
+    rvalue_free(c, locp, &source);
+    rvalue_free(c, locp, &bit_pos);
+
+    rvalue_free(c, locp, &r1);
+    rvalue_free(c, locp, &r2);
+    rvalue_free(c, locp, &r3);
+
+    rvalue_free(c, locp, &cond);
+    rvalue_free(c, locp, &cond_64);
+    rvalue_free(c, locp, &l_32);
+    rvalue_free(c, locp, &mask);
+    rvalue_free(c, locp, &n_64);
+    rvalue_free(c, locp, &zero);
+
+    res = rvalue_truncate(c, locp, &res);
+    return res;
+}
+
+HexValue gen_round(Context *c,
+                   YYLTYPE *locp,
+                   HexValue *source,
+                   HexValue *position) {
+    yyassert(c, locp, source->bit_width <= 32,
+             "fRNDN not implemented for bit widths > 32!");
+
+    HexValue src = *source;
+    HexValue pos = *position;
+
+    HexValue src_width = gen_imm_value(c, locp, src.bit_width, 32);
+    HexValue dst_width = gen_imm_value(c, locp, 64, 32);
+    HexValue a = gen_extend_op(c, locp, &src_width, &dst_width, &src, false);
+
+    src_width = gen_imm_value(c, locp, 5, 32);
+    dst_width = gen_imm_value(c, locp, 64, 32);
+    HexValue b = gen_extend_op(c, locp, &src_width, &dst_width, &pos, true);
+
+    /* Disable auto-free of values used more than once */
+    a.is_manual = true;
+    b.is_manual = true;
+
+    HexValue res = gen_tmp(c, locp, 64);
+
+    HexValue one = gen_tmp_value(c, locp, "1", 64);
+    HexValue n_m1 = gen_bin_op(c, locp, SUB_OP, &b, &one);
+    one = gen_tmp_value(c, locp, "1", 64);
+    HexValue shifted = gen_bin_op(c, locp, ASL_OP, &one, &n_m1);
+    HexValue sum = gen_bin_op(c, locp, ADD_OP, &shifted, &a);
+
+    HexValue zero = gen_tmp_value(c, locp, "0", 64);
+    OUT(c, locp, "tcg_gen_movcond_i64");
+    OUT(c, locp, "(TCG_COND_EQ, ", &res, ", ", &b, ", ", &zero);
+    OUT(c, locp, ", ", &a, ", ", &sum, ");\n");
+
+    rvalue_free_manual(c, locp, &a);
+    rvalue_free_manual(c, locp, &b);
+    rvalue_free(c, locp, &zero);
+    rvalue_free(c, locp, &sum);
+
+    return res;
+}
+
+/* Circular addressing mode with auto-increment */
+void gen_circ_op(Context *c,
+                 YYLTYPE *locp,
+                 HexValue *addr,
+                 HexValue *increment,
+                 HexValue *modifier) {
+    HexValue increment_m = *increment;
+    HexValue cs = gen_tmp(c, locp, 32);
+    increment_m = rvalue_materialize(c, locp, &increment_m);
+    OUT(c, locp, "READ_REG(", &cs, ", HEX_REG_CS0 + MuN);\n");
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
+    rvalue_free(c, locp, &increment_m);
+    rvalue_free(c, locp, modifier);
+    rvalue_free(c, locp, &cs);
+}
+
+HexValue gen_locnt_op(Context *c, YYLTYPE *locp, HexValue *source)
+{
+    HexValue source_m = *source;
+    const char *bit_suffix = source->bit_width == 64 ? "64" : "32";
+    HexValue res = gen_tmp(c, locp, source->bit_width == 64 ? 64 : 32);
+    res.type = TEMP;
+    source_m = rvalue_materialize(c, locp, &source_m);
+    OUT(c, locp, "tcg_gen_not_i", bit_suffix, "(",
+        &res, ", ", &source_m, ");\n");
+    OUT(c, locp, "tcg_gen_clzi_i", bit_suffix, "(", &res, ", ", &res, ", ");
+    OUT(c, locp, bit_suffix, ");\n");
+    rvalue_free(c, locp, &source_m);
+    return res;
+}
+
+HexValue gen_ctpop_op(Context *c, YYLTYPE *locp, HexValue *source)
+{
+    HexValue source_m = *source;
+    const char *bit_suffix = source_m.bit_width == 64 ? "64" : "32";
+    HexValue res = gen_tmp(c, locp, source_m.bit_width == 64 ? 64 : 32);
+    res.type = TEMP;
+    source_m = rvalue_materialize(c, locp, &source_m);
+    OUT(c, locp, "tcg_gen_ctpop_i", bit_suffix,
+        "(", &res, ", ", &source_m, ");\n");
+    rvalue_free(c, locp, &source_m);
+    return res;
+}
+
+HexValue gen_fbrev_4(Context *c, YYLTYPE *locp, HexValue *source)
+{
+    HexValue source_m = *source;
+
+    HexValue res = gen_tmp(c, locp, 32);
+    HexValue tmp1 = gen_tmp(c, locp, 32);
+    HexValue tmp2 = gen_tmp(c, locp, 32);
+
+    source_m = rvalue_materialize(c, locp, &source_m);
+    source_m = rvalue_truncate(c, locp, &source_m);
+
+    OUT(c, locp, "tcg_gen_mov_tl(", &res, ", ", &source_m, ");\n");
+    OUT(c, locp, "tcg_gen_andi_tl(", &tmp1, ", ", &res, ", 0xaaaaaaaa);\n");
+    OUT(c, locp, "tcg_gen_shri_tl(", &tmp1, ", ", &tmp1, ", 1);\n");
+    OUT(c, locp, "tcg_gen_andi_tl(", &tmp2, ", ", &res, ", 0x55555555);\n");
+    OUT(c, locp, "tcg_gen_shli_tl(", &tmp2, ", ", &tmp2, ", 1);\n");
+    OUT(c, locp, "tcg_gen_or_tl(", &res, ", ", &tmp1, ", ", &tmp2, ");\n");
+    OUT(c, locp, "tcg_gen_andi_tl(", &tmp1, ", ", &res, ", 0xcccccccc);\n");
+    OUT(c, locp, "tcg_gen_shri_tl(", &tmp1, ", ", &tmp1, ", 2);\n");
+    OUT(c, locp, "tcg_gen_andi_tl(", &tmp2, ", ", &res, ", 0x33333333);\n");
+    OUT(c, locp, "tcg_gen_shli_tl(", &tmp2, ", ", &tmp2, ", 2);\n");
+    OUT(c, locp, "tcg_gen_or_tl(", &res, ", ", &tmp1, ", ", &tmp2, ");\n");
+    OUT(c, locp, "tcg_gen_andi_tl(", &tmp1, ", ", &res, ", 0xf0f0f0f0);\n");
+    OUT(c, locp, "tcg_gen_shri_tl(", &tmp1, ", ", &tmp1, ", 4);\n");
+    OUT(c, locp, "tcg_gen_andi_tl(", &tmp2, ", ", &res, ", 0x0f0f0f0f);\n");
+    OUT(c, locp, "tcg_gen_shli_tl(", &tmp2, ", ", &tmp2, ", 4);\n");
+    OUT(c, locp, "tcg_gen_or_tl(", &res, ", ", &tmp1, ", ", &tmp2, ");\n");
+    OUT(c, locp, "tcg_gen_bswap32_tl(", &res, ", ", &res, ");\n");
+
+    rvalue_free(c, locp, &tmp1);
+    rvalue_free(c, locp, &tmp2);
+    rvalue_free(c, locp, &source_m);
+
+    return res;
+}
+
+HexValue gen_fbrev_8(Context *c, YYLTYPE *locp, HexValue *source)
+{
+    HexValue source_m = *source;
+
+    source_m = rvalue_extend(c, locp, &source_m);
+    source_m = rvalue_materialize(c, locp, &source_m);
+
+    HexValue res = gen_tmp(c, locp, 64);
+    HexValue tmp1 = gen_tmp(c, locp, 64);
+    HexValue tmp2 = gen_tmp(c, locp, 64);
+
+    OUT(c, locp, "tcg_gen_mov_i64(",
+        &res, ", ", &source_m, ");\n");
+    OUT(c, locp, "tcg_gen_andi_i64(",
+        &tmp1, ", ", &res, ", 0xaaaaaaaaaaaaaaaa);\n");
+    OUT(c, locp, "tcg_gen_shri_i64(",
+        &tmp1, ", ", &tmp1, ", 1);\n");
+    OUT(c, locp, "tcg_gen_andi_i64(",
+        &tmp2, ", ", &res, ", 0x5555555555555555);\n");
+    OUT(c, locp, "tcg_gen_shli_i64(",
+        &tmp2, ", ", &tmp2, ", 1);\n");
+    OUT(c, locp, "tcg_gen_or_i64(", &res, ", ", &tmp1, ", ", &tmp2, ");\n");
+    OUT(c, locp, "tcg_gen_andi_i64(",
+        &tmp1, ", ", &res, ", 0xcccccccccccccccc);\n");
+    OUT(c, locp, "tcg_gen_shri_i64(",
+        &tmp1, ", ", &tmp1, ", 2);\n");
+    OUT(c, locp, "tcg_gen_andi_i64(",
+        &tmp2, ", ", &res, ", 0x3333333333333333);\n");
+    OUT(c, locp, "tcg_gen_shli_i64(",
+        &tmp2, ", ", &tmp2, ", 2);\n");
+    OUT(c, locp, "tcg_gen_or_i64(", &res, ", ", &tmp1, ", ", &tmp2, ");\n");
+    OUT(c, locp, "tcg_gen_andi_i64(",
+        &tmp1, ", ", &res, ", 0xf0f0f0f0f0f0f0f0);\n");
+    OUT(c, locp, "tcg_gen_shri_i64(",
+        &tmp1, ", ", &tmp1, ", 4);\n");
+    OUT(c, locp, "tcg_gen_andi_i64(",
+        &tmp2, ", ", &res, ", 0x0f0f0f0f0f0f0f0f);\n");
+    OUT(c, locp, "tcg_gen_shli_i64(",
+        &tmp2, ", ", &tmp2, ", 4);\n");
+    OUT(c, locp, "tcg_gen_or_i64(", &res, ", ", &tmp1, ", ", &tmp2, ");\n");
+    OUT(c, locp, "tcg_gen_andi_i64(",
+        &tmp1, ", ", &res, ", 0xff00ff00ff00ff00);\n");
+    OUT(c, locp, "tcg_gen_shri_i64(",
+        &tmp1, ", ", &tmp1, ", 8);\n");
+    OUT(c, locp, "tcg_gen_andi_i64(",
+        &tmp2, ", ", &res, ", 0x00ff00ff00ff00ff);\n");
+    OUT(c, locp, "tcg_gen_shli_i64(",
+        &tmp2, ", ", &tmp2, ", 8);\n");
+    OUT(c, locp, "tcg_gen_or_i64(", &res, ", ", &tmp1, ", ", &tmp2, ");\n");
+    OUT(c, locp, "tcg_gen_andi_i64(",
+        &tmp1, ", ", &res, ", 0xffff0000ffff0000);\n");
+    OUT(c, locp, "tcg_gen_shri_i64(",
+        &tmp1, ", ", &tmp1, ", 16);\n");
+    OUT(c, locp, "tcg_gen_andi_i64(",
+        &tmp2, ", ", &res, ", 0x0000ffff0000ffff);\n");
+    OUT(c, locp, "tcg_gen_shli_i64(",
+        &tmp2, ", ", &tmp2, ", 16);\n");
+    OUT(c, locp, "tcg_gen_or_i64(", &res, ", ", &tmp1, ", ", &tmp2, ");\n");
+    OUT(c, locp, "tcg_gen_shri_i64(", &tmp1, ", ", &res, ", 32);\n");
+    OUT(c, locp, "tcg_gen_shli_i64(", &tmp2, ", ", &res, ", 32);\n");
+    OUT(c, locp, "tcg_gen_or_i64(", &res, ", ", &tmp1, ", ", &tmp2, ");\n");
+
+    rvalue_free(c, locp, &tmp1);
+    rvalue_free(c, locp, &tmp2);
+    rvalue_free(c, locp, &source_m);
+
+    return res;
+}
+
+HexValue gen_rotl(Context *c, YYLTYPE *locp, HexValue *source, HexValue *n)
+{
+    HexValue amount = *n;
+    amount = rvalue_materialize(c, locp, &amount);
+    const char *suffix = source->bit_width == 64 ? "i64" : "i32";
+
+    HexValue res = gen_tmp(c, locp, source->bit_width);
+    res.is_unsigned = source->is_unsigned;
+    OUT(c, locp, "tcg_gen_rotl_", suffix, "(",
+        &res, ", ", source, ", ", &amount, ");\n");
+    rvalue_free(c, locp, source);
+    rvalue_free(c, locp, &amount);
+
+    return res;
+}
+
+const char *INTERLEAVE_MASKS[6] = {
+    "0x5555555555555555ULL",
+    "0x3333333333333333ULL",
+    "0x0f0f0f0f0f0f0f0fULL",
+    "0x00ff00ff00ff00ffULL",
+    "0x0000ffff0000ffffULL",
+    "0x00000000ffffffffULL",
+};
+
+HexValue gen_deinterleave(Context *c, YYLTYPE *locp, HexValue *mixed)
+{
+    HexValue src = rvalue_extend(c, locp, mixed);
+
+    HexValue a = gen_tmp(c, locp, 64);
+    a.is_unsigned = true;
+    HexValue b = gen_tmp(c, locp, 64);
+    b.is_unsigned = true;
+
+    const char **masks = INTERLEAVE_MASKS;
+
+    OUT(c, locp, "tcg_gen_shri_i64(", &a, ", ", &src, ", 1);\n");
+    OUT(c, locp, "tcg_gen_andi_i64(", &a, ", ", &a, ", ", masks[0], ");\n");
+    OUT(c, locp, "tcg_gen_andi_i64(", &b, ", ", &src, ", ", masks[0], ");\n");
+
+    HexValue res = gen_tmp(c, locp, 64);
+    res.is_unsigned = true;
+
+    unsigned shift = 1;
+    for (unsigned i = 1; i < 6; ++i) {
+        OUT(c, locp, "tcg_gen_shri_i64(", &res, ", ", &b, ", ", &shift, ");\n");
+        OUT(c, locp, "tcg_gen_or_i64(", &b, ", ", &res, ", ", &b, ");\n");
+        OUT(c, locp, "tcg_gen_andi_i64(", &b, ", ", &b, ", ", masks[i], ");\n");
+        OUT(c, locp, "tcg_gen_shri_i64(", &res, ", ", &a, ", ", &shift, ");\n");
+        OUT(c, locp, "tcg_gen_or_i64(", &a, ", ", &res, ", ", &a, ");\n");
+        OUT(c, locp, "tcg_gen_andi_i64(", &a, ", ", &a, ", ", masks[i], ");\n");
+        shift <<= 1;
+    }
+
+    OUT(c, locp, "tcg_gen_shli_i64(", &a, ", ", &a, ", 32);\n");
+    OUT(c, locp, "tcg_gen_or_i64(", &res, ", ", &a, ", ", &b, ");\n");
+
+    rvalue_free(c, locp, &a);
+    rvalue_free(c, locp, &b);
+
+    return res;
+}
+
+HexValue gen_interleave(Context *c,
+                        YYLTYPE *locp,
+                        HexValue *odd,
+                        HexValue *even)
+{
+    HexValue a = rvalue_truncate(c, locp, odd);
+    a.is_unsigned = true;
+    HexValue b = rvalue_truncate(c, locp, even);
+    a.is_unsigned = true;
+
+    a = rvalue_extend(c, locp, &a);
+    b = rvalue_extend(c, locp, &b);
+
+    HexValue res = gen_tmp(c, locp, 64);
+    res.is_unsigned = true;
+
+    const char **masks = INTERLEAVE_MASKS;
+
+    unsigned shift = 16;
+    for (int i = 4; i >= 0; --i) {
+        OUT(c, locp, "tcg_gen_shli_i64(", &res, ", ", &a, ", ", &shift, ");\n");
+        OUT(c, locp, "tcg_gen_or_i64(", &a, ", ", &res, ", ", &a, ");\n");
+        OUT(c, locp, "tcg_gen_andi_i64(", &a, ", ", &a, ", ", masks[i], ");\n");
+        OUT(c, locp, "tcg_gen_shli_i64(", &res, ", ", &b, ", ", &shift, ");\n");
+        OUT(c, locp, "tcg_gen_or_i64(", &b, ", ", &res, ", ", &b, ");\n");
+        OUT(c, locp, "tcg_gen_andi_i64(", &b, ", ", &b, ", ", masks[i], ");\n");
+        shift >>= 1;
+    }
+
+    OUT(c, locp, "tcg_gen_shli_i64(", &a, ", ", &a, ", 1);\n");
+    OUT(c, locp, "tcg_gen_or_i64(", &res, ", ", &a, ", ", &b, ");\n");
+
+    rvalue_free(c, locp, &a);
+    rvalue_free(c, locp, &b);
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
+    HexValue opa = rvalue_materialize(c, locp, op1);
+    HexValue opb = rvalue_materialize(c, locp, op2);
+    HexValue opc = rvalue_materialize(c, locp, op3);
+    opc = rvalue_extend(c, locp, &opc);
+
+    HexValue zero = gen_tmp_value(c, locp, "0", 64);
+    HexValue res = gen_tmp(c, locp, 64);
+    HexValue cf = gen_tmp(c, locp, 64);
+    OUT(c, locp, "tcg_gen_add2_i64(", &res, ", ", &cf, ", ", &opa, ", ", &zero);
+    OUT(c, locp, ", ", &opc, ", ", &zero, ");\n");
+    OUT(c, locp, "tcg_gen_add2_i64(", &res, ", ", &cf, ", ", &res, ", ", &cf);
+    OUT(c, locp, ", ", &opb, ", ", &zero, ");\n");
+
+    rvalue_free(c, locp, &opa);
+    rvalue_free(c, locp, &opb);
+    rvalue_free(c, locp, &opc);
+    rvalue_free(c, locp, &zero);
+    rvalue_free(c, locp, &res);
+    return cf;
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
+void gen_inst_args(Context *c, YYLTYPE *locp)
+{
+    EMIT_SIG(c, ")");
+    EMIT_HEAD(c, "{\n");
+
+    /* Initialize declared but uninitialized registers, but only for */
+    /* non-conditional instructions */
+    for (int i = 0; i < c->inst.init_list->len; i++) {
+        HexValue *reg = &g_array_index(c->inst.init_list, HexValue, i);
+        if (reg->type == REGISTER || reg->type == PREDICATE) {
+            OUT(c, locp, "tcg_gen_movi_i", &reg->bit_width, "(",
+                reg, ", 0);\n");
+        }
+    }
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
+void gen_pre_assign(Context *c, YYLTYPE *locp, HexValue *l, HexValue *r)
+{
+    bool is_direct = is_direct_predicate(l);
+    char pre_id[2] = " ";
+    pre_id[0] = l->pre.id;
+    /* Extract predicate TCGv */
+    if (is_direct) {
+        *l = gen_tmp_value(c, locp, "0", 32);
+    }
+    *r = rvalue_materialize(c, locp, r);
+    *r = rvalue_truncate(c, locp, r);
+    /* Extract first 8 bits, and store new predicate value */
+    if (r->type == IMMEDIATE) {
+        OUT(c, locp, &r, " = (", r, " & 0xff) << i;\n");
+        OUT(c, locp, "tcg_gen_ori_i32(", l, ", ", l, ", ", r, ");\n");
+    } else {
+        OUT(c, locp, "tcg_gen_mov_i32(", l, ", ", r, ");\n");
+        OUT(c, locp, "tcg_gen_andi_i32(", l, ", ", l, ", 0xff);\n");
+    }
+    if (is_direct) {
+        OUT(c, locp, "gen_log_pred_write(", pre_id, ", ", l, ");\n");
+        OUT(c, locp, "ctx_log_pred_write(ctx, ", pre_id, ");\n");
+        rvalue_free(c, locp, l);
+    }
+    rvalue_free(c, locp, r);  /* Free temporary value */
+}
+
+void gen_load(Context *c, YYLTYPE *locp, HexValue *num, HexValue *size,
+              bool is_unsigned, HexValue *ea, HexValue *dst)
+{
+    /* Memop width is specified in the load macro */
+    int bit_width = (size->imm.value > 4) ? 64 : 32;
+    const char *sign_suffix = (size->imm.value > 4)
+                              ? ""
+                              : ((is_unsigned) ? "u" : "s");
+    char size_suffix[4] = { 0 };
+    /* Create temporary variable (if not present) */
+    if (dst->type == VARID) {
+        /* TODO: this is a common pattern, the parser should be varid-aware. */
+        varid_allocate(c, locp, dst, bit_width, is_unsigned);
+    }
+    snprintf(size_suffix, 4, "%" PRIu64, size->imm.value * 8);
+    if (bit_width == 32) {
+        *dst = rvalue_truncate(c, locp, dst);
+    } else {
+        *dst = rvalue_extend(c, locp, dst);
+    }
+    int var_id = find_variable(c, locp, ea);
+    yyassert(c, locp, var_id != -1, "Load variable must exist!\n");
+    /* We need to enforce the variable size */
+    ea->bit_width = g_array_index(c->inst.allocated, Var, var_id).bit_width;
+    if (ea->bit_width != 32) {
+        *ea = rvalue_truncate(c, locp, ea);
+    }
+    OUT(c, locp, "if (insn->slot == 0 && pkt->pkt_has_store_s1) {\n");
+    OUT(c, locp, "process_store(ctx, pkt, 1);\n");
+    OUT(c, locp, "}\n");
+    OUT(c, locp, "tcg_gen_qemu_ld", size_suffix, sign_suffix);
+    OUT(c, locp, "(", dst, ", ", ea, ", 0);\n");
+    /* If the var in EA was truncated it is now a tmp HexValue, so free it. */
+    rvalue_free(c, locp, ea);
+}
+
+void gen_store(Context *c, YYLTYPE *locp, HexValue *num, HexValue *size,
+               HexValue *ea, HexValue *src)
+{
+    /* Memop width is specified in the store macro */
+    int mem_width = size->imm.value;
+    /* Adjust operand bit width to memop bit width */
+    if (mem_width < 8) {
+        *src = rvalue_truncate(c, locp, src);
+    } else {
+        *src = rvalue_extend(c, locp, src);
+    }
+    assert(ea->type == VARID);
+    int var_id = find_variable(c, locp, ea);
+    yyassert(c, locp, var_id != -1, "Load variable must exist!\n");
+    /* We need to enforce the variable size */
+    ea->bit_width = g_array_index(c->inst.allocated, Var, var_id).bit_width;
+    if (ea->bit_width != 32) {
+        *ea = rvalue_truncate(c, locp, ea);
+    }
+    *src = rvalue_materialize(c, locp, src);
+    OUT(c, locp, "gen_store", &mem_width, "(cpu_env, ", ea, ", ", src);
+    OUT(c, locp, ", ctx, insn->slot);\n");
+    rvalue_free(c, locp, src);
+    /* If the var in ea was truncated it is now a tmp HexValue, so free it. */
+    rvalue_free(c, locp, ea);
+}
+
+void gen_sethalf(Context *c, YYLTYPE *locp, HexCast *sh, HexValue *n,
+                 HexValue *dst, HexValue *val)
+{
+    yyassert(c, locp, n->type == IMMEDIATE,
+             "Deposit index must be immediate!\n");
+    if (dst->type == VARID) {
+        int var_id = find_variable(c, locp, dst);
+        if (var_id == -1) {
+            HexValue zero = gen_imm_value(c, locp, 0, 64);
+            zero.is_unsigned = true;
+            dst->bit_width = 64;
+            gen_assign(c, locp, dst, &zero);
+        } else {
+            /* We need to enforce the variable size (default is 32) */
+            dst->bit_width = g_array_index(c->inst.allocated,
+                                           Var,
+                                           var_id).bit_width;
+        }
+    }
+    gen_deposit_op(c, locp, dst, val, n, sh);
+}
+
+void gen_setbits(Context *c, YYLTYPE *locp, HexValue *hi, HexValue *lo,
+                 HexValue *dst, HexValue *val)
+{
+    yyassert(c, locp, hi->type == IMMEDIATE &&
+             hi->imm.type == VALUE &&
+             lo->type == IMMEDIATE &&
+             lo->imm.type == VALUE,
+             "Range deposit needs immediate values!\n");
+
+    *val = rvalue_truncate(c, locp, val);
+    unsigned len = hi->imm.value + 1 - lo->imm.value;
+    HexValue tmp = gen_tmp(c, locp, 32);
+    OUT(c, locp, "tcg_gen_neg_i32(", &tmp, ", ", val, ");\n");
+    OUT(c, locp, "tcg_gen_deposit_i32(", dst, ", ", dst, ", ", &tmp, ", ");
+    OUT(c, locp, lo, ", ", &len, ");\n");
+
+    rvalue_free(c, locp, &tmp);
+    rvalue_free(c, locp, hi);
+    rvalue_free(c, locp, lo);
+    rvalue_free(c, locp, val);
+}
+
+int gen_if_cond(Context *c, YYLTYPE *locp, HexValue *cond)
+{
+    /* Generate an end label, if false branch to that label */
+    OUT(c, locp, "TCGLabel *if_label_", &c->inst.if_count,
+        " = gen_new_label();\n");
+    *cond = rvalue_materialize(c, locp, cond);
+    const char *bit_suffix = (cond->bit_width == 64) ? "i64" : "i32";
+    OUT(c, locp, "tcg_gen_brcondi_", bit_suffix, "(TCG_COND_EQ, ", cond,
+        ", 0, if_label_", &c->inst.if_count, ");\n");
+    rvalue_free(c, locp, cond);
+    return c->inst.if_count++;
+}
+
+int gen_if_else(Context *c, YYLTYPE *locp, int index)
+{
+    /* Generate label to jump if else is not verified */
+    OUT(c, locp, "TCGLabel *if_label_", &c->inst.if_count,
+        " = gen_new_label();\n");
+    int if_index = c->inst.if_count;
+    c->inst.if_count++;
+    /* Jump out of the else statement */
+    OUT(c, locp, "tcg_gen_br(if_label_", &if_index, ");\n");
+    /* Fix the else label */
+    OUT(c, locp, "gen_set_label(if_label_", &index, ");\n");
+    return if_index;
+}
+
+HexValue gen_rvalue_pre(Context *c, YYLTYPE *locp, HexValue *pre)
+{
+    if (is_direct_predicate(pre)) {
+        bool is_dotnew = pre->is_dotnew;
+        char predicate_id[2] = { pre->pre.id, '\0' };
+        char *pre_str = (char *) &predicate_id;
+        *pre = gen_tmp_value(c, locp, "0", 32);
+        if (is_dotnew) {
+            OUT(c, locp, "tcg_gen_mov_i32(", pre, ", hex_new_pred_value[");
+            OUT(c, locp, pre_str, "]);\n");
+        } else {
+            OUT(c, locp, "gen_read_preg(", pre, ", ", pre_str, ");\n");
+        }
+    }
+    return *pre;
+}
+
+HexValue gen_rvalue_var(Context *c, YYLTYPE *locp, HexValue *var)
+{
+    /* Assign correct bit width and signedness */
+    bool found = false;
+    for (int i = 0; i < c->inst.allocated->len; i++) {
+        Var *other = &g_array_index(c->inst.allocated, Var, i);
+        if (g_string_equal(var->var.name, other->name)) {
+            found = true;
+            other->name = var->var.name;
+            var->bit_width = other->bit_width;
+            var->is_unsigned = other->is_unsigned;
+            break;
+        }
+    }
+    yyassert(c, locp, found, "Undefined symbol!\n");
+    return *var;
+}
+
+HexValue gen_rvalue_mpy(Context *c, YYLTYPE *locp, HexMpy *mpy, HexValue *a,
+                        HexValue *b)
+{
+    a->is_unsigned = mpy->first_unsigned;
+    b->is_unsigned = mpy->second_unsigned;
+    *a = gen_cast_op(c, locp, a, mpy->first_bit_width * 2);
+    /* Handle fMPTY3216.. */
+    if (mpy->first_bit_width == 32) {
+        *b = gen_cast_op(c, locp, b, 64);
+    } else {
+        *b = gen_cast_op(c, locp, b, mpy->second_bit_width * 2);
+    }
+    HexValue ret = gen_bin_op(c, locp, MUL_OP, a, b);
+    /* Handle special cases required by the language */
+    if (mpy->first_bit_width == 16 && mpy->second_bit_width == 16) {
+        HexValue src_width = gen_imm_value(c, locp, 32, 32);
+        HexValue dst_width = gen_imm_value(c, locp, 64, 32);
+        ret = gen_extend_op(c, locp, &src_width, &dst_width, &ret,
+                            mpy->first_unsigned && mpy->second_unsigned);
+    }
+    return ret;
+}
+
+HexValue gen_rvalue_pow(Context *c, YYLTYPE *locp, HexValue *l, HexValue *r)
+{
+    /* We assume that this is a shorthand for a shift */
+    yyassert(c, locp, l->type == IMMEDIATE && r->imm.value == 2,
+             "Exponentiation is not a left shift!\n");
+    HexValue one = gen_imm_value(c, locp, 1, 32);
+    HexValue shift = gen_bin_op(c, locp, SUB_OP, r, &one);
+    HexValue res = gen_bin_op(c, locp, ASL_OP, l, &shift);
+    rvalue_free(c, locp, &one);
+    rvalue_free(c, locp, &shift);
+    return res;
+}
+
+HexValue gen_rvalue_not(Context *c, YYLTYPE *locp, HexValue *v)
+{
+    const char *bit_suffix = (v->bit_width == 64) ? "i64" : "i32";
+    int bit_width = (v->bit_width == 64) ? 64 : 32;
+    HexValue res;
+    res.is_unsigned = v->is_unsigned;
+    res.is_dotnew = false;
+    res.is_manual = false;
+    if (v->type == IMMEDIATE) {
+        res.type = IMMEDIATE;
+        res.imm.type = QEMU_TMP;
+        res.imm.index = c->inst.qemu_tmp_count;
+        OUT(c, locp, "int", &bit_width, "_t ", &res, " = ~", v, ";\n");
+        c->inst.qemu_tmp_count++;
+    } else {
+        res = gen_tmp(c, locp, bit_width);
+        OUT(c, locp, "tcg_gen_not_", bit_suffix, "(", &res,
+            ", ", v, ");\n");
+        rvalue_free(c, locp, v);
+    }
+    return res;
+}
+
+HexValue gen_rvalue_notl(Context *c, YYLTYPE *locp, HexValue *v)
+{
+    const char *bit_suffix = (v->bit_width == 64) ? "i64" : "i32";
+    int bit_width = (v->bit_width == 64) ? 64 : 32;
+    HexValue res;
+    res.is_unsigned = v->is_unsigned;
+    res.is_dotnew = false;
+    res.is_manual = false;
+    if (v->type == IMMEDIATE) {
+        res.type = IMMEDIATE;
+        res.imm.type = QEMU_TMP;
+        res.imm.index = c->inst.qemu_tmp_count;
+        OUT(c, locp, "int", &bit_width, "_t ", &res, " = !", v, ";\n");
+        c->inst.qemu_tmp_count++;
+    } else {
+        res = gen_tmp(c, locp, bit_width);
+        HexValue zero = gen_tmp_value(c, locp, "0", bit_width);
+        HexValue one = gen_tmp_value(c, locp, "0xff", bit_width);
+        OUT(c, locp, "tcg_gen_movcond_", bit_suffix);
+        OUT(c, locp, "(TCG_COND_EQ, ", &res, ", ", v, ", ", &zero);
+        OUT(c, locp, ", ", &one, ", ", &zero, ");\n");
+        rvalue_free(c, locp, v);
+        rvalue_free(c, locp, &zero);
+        rvalue_free(c, locp, &one);
+    }
+    return res;
+}
+
+HexValue gen_rvalue_sat(Context *c, YYLTYPE *locp, HexSat *sat, HexValue *n,
+                        HexValue *v)
+{
+    if (sat->set_overflow) {
+        yyassert(c, locp, n->imm.value < v->bit_width, "To compute overflow, "
+                 "source width must be greater than saturation width!");
+    }
+    HexValue res = gen_tmp(c, locp, v->bit_width);
+    const char *bit_suffix = (v->bit_width == 64) ? "i64" : "i32";
+    const char *overflow_str = (sat->set_overflow) ? "true" : "false";
+    const char *unsigned_str = (sat->is_unsigned) ? "u" : "";
+    OUT(c, locp, "gen_sat", unsigned_str, "_", bit_suffix, "(", &res, ", ");
+    OUT(c, locp, v, ", ", &n->imm.value, ", ", overflow_str, ");\n");
+    res.is_unsigned = sat->is_unsigned;
+    rvalue_free(c, locp, v);
+    return res;
+}
+
+HexValue gen_rvalue_fscr(Context *c, YYLTYPE *locp, HexValue *v)
+{
+    HexValue key = gen_tmp(c, locp, 64);
+    HexValue res = gen_tmp(c, locp, 64);
+    *v = rvalue_extend(c, locp, v);
+    HexValue frame_key = gen_tmp(c, locp, 32);
+    OUT(c, locp, "READ_REG(", &frame_key, ", HEX_REG_FRAMEKEY);\n");
+    OUT(c, locp, "tcg_gen_concat_i32_i64(",
+        &key, ", ", &frame_key, ", ", &frame_key, ");\n");
+    OUT(c, locp, "tcg_gen_xor_i64(", &res, ", ", v, ", ", &key, ");\n");
+    rvalue_free(c, locp, &key);
+    rvalue_free(c, locp, &frame_key);
+    rvalue_free(c, locp, v);
+    return res;
+}
+
+HexValue gen_rvalue_abs(Context *c, YYLTYPE *locp, HexValue *v)
+{
+    const char *bit_suffix = (v->bit_width == 64) ? "i64" : "i32";
+    int bit_width = (v->bit_width == 64) ? 64 : 32;
+    HexValue res;
+    res.is_unsigned = v->is_unsigned;
+    res.is_dotnew = false;
+    res.is_manual = false;
+    if (v->type == IMMEDIATE) {
+        res.type = IMMEDIATE;
+        res.imm.type = QEMU_TMP;
+        res.imm.index = c->inst.qemu_tmp_count;
+        OUT(c, locp, "int", &bit_width, "_t ", &res, " = abs(", v, ");\n");
+        c->inst.qemu_tmp_count++;
+    } else {
+        res = gen_tmp(c, locp, bit_width);
+        HexValue zero = gen_tmp_value(c, locp, "0", bit_width);
+        OUT(c, locp, "tcg_gen_neg_", bit_suffix, "(", &res, ", ", v, ");\n");
+        OUT(c, locp, "tcg_gen_movcond_i", &bit_width);
+        OUT(c, locp, "(TCG_COND_GT, ", &res, ", ", v, ", ", &zero);
+        OUT(c, locp, ", ", v, ", ", &res, ");\n");
+        rvalue_free(c, locp, &zero);
+        rvalue_free(c, locp, v);
+    }
+    return res;
+}
+
+HexValue gen_rvalue_neg(Context *c, YYLTYPE *locp, HexValue *v)
+{
+    const char *bit_suffix = (v->bit_width == 64) ? "i64" : "i32";
+    int bit_width = (v->bit_width == 64) ? 64 : 32;
+    HexValue res;
+    res.is_unsigned = v->is_unsigned;
+    res.is_dotnew = false;
+    res.is_manual = false;
+    if (v->type == IMMEDIATE) {
+        res.type = IMMEDIATE;
+        res.imm.type = QEMU_TMP;
+        res.imm.index = c->inst.qemu_tmp_count;
+        OUT(c, locp, "int", &bit_width, "_t ", &res, " = -", v, ";\n");
+        c->inst.qemu_tmp_count++;
+    } else {
+        res = gen_tmp(c, locp, bit_width);
+        OUT(c, locp, "tcg_gen_neg_", bit_suffix, "(", &res, ", ", v, ");\n");
+        rvalue_free(c, locp, v);
+    }
+    return res;
+}
+
+HexValue gen_rvalue_brev(Context *c, YYLTYPE *locp, HexValue *v)
+{
+    yyassert(c, locp, v->bit_width <= 32,
+             "fbrev not implemented for 64-bit integers!");
+    HexValue res = gen_tmp(c, locp, v->bit_width);
+    *v = rvalue_materialize(c, locp, v);
+    OUT(c, locp, "gen_fbrev(", &res, ", ", v, ");\n");
+    rvalue_free(c, locp, v);
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
+    case REGISTER:
+        if (arg->reg.type == DOTNEW) {
+            EMIT_SIG(c, ", TCGv N%cN", arg->reg.id);
+        } else {
+            bool is64 = (arg->bit_width == 64);
+            const char *type = is64 ? "TCGv_i64" : "TCGv_i32";
+            char reg_id[5] = { 0 };
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
+            EMIT_SIG(c, ", TCGv P%c%c", arg->pre.id, suffix);
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
+    /* Free the strings */
+    g_string_truncate(c->signature_str, 0);
+    g_string_truncate(c->out_str, 0);
+    g_string_truncate(c->header_str, 0);
+    /* Free strings allocated by the instruction */
+    for (int i = 0; i < c->inst.strings->len; i++) {
+        g_string_free(g_array_index(c->inst.strings, GString*, i), TRUE);
+    }
+    g_array_free(c->inst.strings, TRUE);
+    /* Free INAME token value */
+    g_string_free(c->inst.name, TRUE);
+    /* Free variables and registers */
+    g_array_free(c->inst.allocated, TRUE);
+    g_array_free(c->inst.init_list, TRUE);
+    /* Initialize instruction-specific portion of the context */
+    memset(&(c->inst), 0, sizeof(Inst));
+}
diff --git a/target/hexagon/idef-parser/parser-helpers.h b/target/hexagon/idef-parser/parser-helpers.h
new file mode 100644
index 0000000000..59b66f3943
--- /dev/null
+++ b/target/hexagon/idef-parser/parser-helpers.h
@@ -0,0 +1,344 @@
+/*
+ * Copyright(c) 2019-2021 rev.ng Srls. All Rights Reserved.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
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
+#include "qemu/compiler.h"
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
+#define yyassert(context, locp, condition, msg) \
+    if (!(condition)) { \
+        yyerror(locp, (context)->scanner, (context), (msg)); \
+    }
+#endif
+
+bool is_direct_predicate(HexValue *value);
+
+/* Print functions */
+void str_print(Context *c, YYLTYPE *locp, const char *string);
+
+void uint64_print(Context *c, YYLTYPE *locp, uint64_t *num);
+
+void int_print(Context *c, YYLTYPE *locp, int *num);
+
+void uint_print(Context *c, YYLTYPE *locp, unsigned *num);
+
+void tmp_print(Context *c, YYLTYPE *locp, HexTmp *tmp);
+
+void pre_print(Context *c, YYLTYPE *locp, HexPre *pre, bool is_dotnew);
+
+void reg_compose(Context *c, YYLTYPE *locp, HexReg *reg, char reg_id[5]);
+
+void reg_print(Context *c, YYLTYPE *locp, HexReg *reg);
+
+void imm_print(Context *c, YYLTYPE *locp, HexImm *imm);
+
+void var_print(Context *c, YYLTYPE *locp, HexVar *var);
+
+void rvalue_out(Context *c, YYLTYPE *locp, void *pointer);
+
+void out_assert(Context *c, YYLTYPE *locp, void *dummy);
+
+/* Copy output code buffer into stdout */
+void commit(Context *c);
+
+#define OUT_IMPL(c, locp, x)                    \
+    do {                                        \
+        QEMU_GENERIC(typeof(*x),                \
+            (char,      str_print),             \
+            (uint64_t,  uint64_print),          \
+            (int,       int_print),             \
+            (unsigned,  uint_print),            \
+            (HexValue,  rvalue_out),            \
+            out_assert                          \
+        )(c, locp, x);                          \
+    } while (0);
+
+/* Make a FOREACH macro */
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
+/* Temporary values creation */
+HexValue gen_tmp(Context *c, YYLTYPE *locp, int bit_width);
+
+HexValue gen_tmp_value(Context *c,
+                          YYLTYPE *locp,
+                          const char *value,
+                          int bit_width);
+
+HexValue gen_imm_value(Context *c __attribute__((unused)),
+                          YYLTYPE *locp,
+                          int value,
+                          int bit_width);
+
+void rvalue_free(Context *c, YYLTYPE *locp, HexValue *rvalue);
+
+HexValue rvalue_materialize(Context *c, YYLTYPE *locp, HexValue *rvalue);
+
+HexValue rvalue_extend(Context *c, YYLTYPE *locp, HexValue *rvalue);
+
+HexValue rvalue_truncate(Context *c, YYLTYPE *locp, HexValue *rvalue);
+
+int find_variable(Context *c, YYLTYPE *locp, HexValue *varid);
+
+void varid_allocate(Context *c,
+                    YYLTYPE *locp,
+                    HexValue *varid,
+                    int width,
+                    bool is_unsigned);
+
+void ea_free(Context *c, YYLTYPE *locp);
+
+HexValue gen_bin_cmp(Context *c,
+                     YYLTYPE *locp,
+                     TCGCond type,
+                     HexValue *op1_ptr,
+                     HexValue *op2_ptr);
+
+/* Code generation functions */
+HexValue gen_bin_op(Context *c,
+                       YYLTYPE *locp,
+                       OpType type,
+                       HexValue *operand1,
+                       HexValue *operand2);
+
+HexValue gen_cast_op(Context *c,
+                        YYLTYPE *locp,
+                        HexValue *source,
+                        unsigned target_width);
+
+HexValue gen_extend_op(Context *c,
+                          YYLTYPE *locp,
+                          HexValue *src_width_ptr,
+                          HexValue *dst_width_ptr,
+                          HexValue *value_ptr,
+                          bool is_unsigned);
+
+void gen_rdeposit_op(Context *c,
+                     YYLTYPE *locp,
+                     HexValue *dest,
+                     HexValue *value,
+                     HexValue *begin,
+                     HexValue *width);
+
+void gen_deposit_op(Context *c,
+                           YYLTYPE *locp,
+                           HexValue *dest,
+                           HexValue *value,
+                           HexValue *index,
+                           HexCast *cast);
+
+HexValue gen_rextract_op(Context *c,
+                         YYLTYPE *locp,
+                         HexValue *source,
+                         int begin,
+                         int width);
+
+HexValue gen_extract_op(Context *c,
+                           YYLTYPE *locp,
+                           HexValue *source,
+                           HexValue *index,
+                           HexExtract *extract);
+
+HexValue gen_read_creg(Context *c, YYLTYPE *locp, HexValue *reg);
+
+void gen_write_creg(Context *c,
+                           YYLTYPE *locp,
+                           HexValue *reg,
+                           HexValue *value);
+
+void gen_assign(Context *c,
+                YYLTYPE *locp,
+                HexValue *dest,
+                HexValue *value);
+
+HexValue gen_convround(Context *c,
+                          YYLTYPE *locp,
+                          HexValue *source);
+
+HexValue gen_round(Context *c,
+                   YYLTYPE *locp,
+                   HexValue *source,
+                   HexValue *position);
+
+HexValue gen_convround_n(Context *c,
+                         YYLTYPE *locp,
+                         HexValue *source_ptr,
+                         HexValue *bit_pos_ptr);
+
+/* Circular addressing mode with auto-increment */
+void gen_circ_op(Context *c,
+                 YYLTYPE *locp,
+                 HexValue *addr,
+                 HexValue *increment,
+                 HexValue *modifier);
+
+HexValue gen_locnt_op(Context *c, YYLTYPE *locp, HexValue *source);
+
+HexValue gen_ctpop_op(Context *c, YYLTYPE *locp, HexValue *source);
+
+HexValue gen_fbrev_4(Context *c, YYLTYPE *locp, HexValue *source);
+
+HexValue gen_fbrev_8(Context *c, YYLTYPE *locp, HexValue *source);
+
+HexValue gen_rotl(Context *c, YYLTYPE *locp, HexValue *source, HexValue *n);
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
+void gen_inst(Context *c, GString *iname);
+
+void gen_inst_args(Context *c, YYLTYPE *locp);
+
+void gen_inst_code(Context *c, YYLTYPE *locp);
+
+void gen_pre_assign(Context *c, YYLTYPE *locp, HexValue *l, HexValue *r);
+
+void gen_load(Context *c, YYLTYPE *locp, HexValue *num, HexValue *size,
+              bool is_unsigned, HexValue *ea, HexValue *dst);
+
+void gen_store(Context *c, YYLTYPE *locp, HexValue *num, HexValue *size,
+               HexValue *ea, HexValue *src);
+
+void gen_sethalf(Context *c, YYLTYPE *locp, HexCast *sh, HexValue *n,
+                 HexValue *dst, HexValue *val);
+
+void gen_setbits(Context *c, YYLTYPE *locp, HexValue *hi, HexValue *lo,
+                 HexValue *dst, HexValue *val);
+
+int gen_if_cond(Context *c, YYLTYPE *locp, HexValue *cond);
+
+int gen_if_else(Context *c, YYLTYPE *locp, int index);
+
+HexValue gen_rvalue_pre(Context *c, YYLTYPE *locp, HexValue *pre);
+
+HexValue gen_rvalue_var(Context *c, YYLTYPE *locp, HexValue *var);
+
+HexValue gen_rvalue_mpy(Context *c, YYLTYPE *locp, HexMpy *mpy, HexValue *a,
+                        HexValue *b);
+
+HexValue gen_rvalue_pow(Context *c, YYLTYPE *locp, HexValue *l, HexValue *r);
+
+HexValue gen_rvalue_not(Context *c, YYLTYPE *locp, HexValue *v);
+
+HexValue gen_rvalue_notl(Context *c, YYLTYPE *locp, HexValue *v);
+
+HexValue gen_rvalue_sat(Context *c, YYLTYPE *locp, HexSat *sat, HexValue *n,
+                        HexValue *v);
+
+HexValue gen_rvalue_ternary(Context *c, YYLTYPE *locp, HexValue *cond,
+                            HexValue *t, HexValue *e);
+
+HexValue gen_rvalue_fscr(Context *c, YYLTYPE *locp, HexValue *v);
+
+HexValue gen_rvalue_abs(Context *c, YYLTYPE *locp, HexValue *v);
+
+HexValue gen_rvalue_neg(Context *c, YYLTYPE *locp, HexValue *v);
+
+HexValue gen_rvalue_brev(Context *c, YYLTYPE *locp, HexValue *v);
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
+#endif /* PARSER_HELPERS_h */
diff --git a/target/hexagon/meson.build b/target/hexagon/meson.build
index 5dda04dc29..2b7d6c8c62 100644
--- a/target/hexagon/meson.build
+++ b/target/hexagon/meson.build
@@ -197,7 +197,7 @@ idef_parser_input_generated = custom_target(
     command: [python, '@INPUT@', semantics_generated, attribs_def, gen_tcg_h, '@OUTPUT@'],
 )
 
-idef_parser_input_generated_prep = custom_target(
+preprocessed_idef_parser_input_generated = custom_target(
     'idef_parser_input.preprocessed.h.inc',
     output: 'idef_parser_input.preprocessed.h.inc',
     input: idef_parser_input_generated,
@@ -210,4 +210,28 @@ flex = generator(find_program('flex'),
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
diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
index 1120e8555d..04a85afe3b 100644
--- a/tests/docker/dockerfiles/alpine.docker
+++ b/tests/docker/dockerfiles/alpine.docker
@@ -9,6 +9,7 @@ ENV PACKAGES \
 	alsa-lib-dev \
 	bash \
 	binutils \
+	bison \
 	coreutils \
 	curl-dev \
 	flex \
diff --git a/tests/docker/dockerfiles/centos7.docker b/tests/docker/dockerfiles/centos7.docker
index 95966ea7e6..33c38dc35b 100644
--- a/tests/docker/dockerfiles/centos7.docker
+++ b/tests/docker/dockerfiles/centos7.docker
@@ -5,6 +5,7 @@ RUN yum -y update
 
 # Please keep this list sorted alphabetically
 ENV PACKAGES \
+    bison \
     bzip2 \
     bzip2-devel \
     ccache \
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index 5919aa0697..0d4e07ae29 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -3,6 +3,7 @@ FROM centos:8.3.2011
 RUN dnf -y update
 ENV PACKAGES \
     SDL2-devel \
+    bison \
     bzip2 \
     bzip2-devel \
     dbus-daemon \
diff --git a/tests/docker/dockerfiles/debian10.docker b/tests/docker/dockerfiles/debian10.docker
index 97ec6d5637..bb04ea9f6e 100644
--- a/tests/docker/dockerfiles/debian10.docker
+++ b/tests/docker/dockerfiles/debian10.docker
@@ -17,6 +17,7 @@ RUN apt update && \
     DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
     DEBIAN_FRONTEND=noninteractive eatmydata \
     apt install -y --no-install-recommends \
+        bison \
         bc \
         build-essential \
         ca-certificates \
@@ -27,6 +28,7 @@ RUN apt update && \
         gdb-multiarch \
         gettext \
         git \
+        libglib2.0-dev \
         libncurses5-dev \
         ninja-build \
         pkg-config \
diff --git a/tests/docker/dockerfiles/fedora-i386-cross.docker b/tests/docker/dockerfiles/fedora-i386-cross.docker
index 9703b7ec78..ba8165dc0d 100644
--- a/tests/docker/dockerfiles/fedora-i386-cross.docker
+++ b/tests/docker/dockerfiles/fedora-i386-cross.docker
@@ -1,11 +1,13 @@
 FROM fedora:33
 ENV PACKAGES \
+    bison \
     bzip2 \
     diffutils \
     findutils \
     flex \
     gcc \
     git \
+    glib2-devel \
     libtasn1-devel.i686 \
     libzstd-devel.i686 \
     make \
diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/docker/dockerfiles/fedora-win32-cross.docker
index 2018dcabe5..98b525258b 100644
--- a/tests/docker/dockerfiles/fedora-win32-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
@@ -2,6 +2,7 @@ FROM fedora:33
 
 # Please keep this list sorted alphabetically
 ENV PACKAGES \
+    bison \
     bc \
     bzip2 \
     diffutils \
@@ -10,6 +11,7 @@ ENV PACKAGES \
     gcc \
     gettext \
     git \
+    glib2-devel \
     hostname \
     make \
     meson \
diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
index b05e4cbcc6..f28cc3d02f 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -2,6 +2,7 @@ FROM fedora:33
 
 # Please keep this list sorted alphabetically
 ENV PACKAGES \
+    bison \
     bc \
     bzip2 \
     diffutils \
@@ -9,6 +10,7 @@ ENV PACKAGES \
     flex \
     gcc \
     gettext \
+    glib2-devel \
     git \
     hostname \
     make \
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index 5d3f49936b..a6714ec2e2 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -2,6 +2,7 @@ FROM fedora:33
 
 # Please keep this list sorted alphabetically
 ENV PACKAGES \
+    bison \
     bc \
     brlapi-devel \
     bzip2 \
diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index ce1db959a2..debdb029c1 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -3,6 +3,7 @@ FROM opensuse/leap:15.2
 # Please keep this list sorted alphabetically
 ENV PACKAGES \
     bc \
+    bison \
     brlapi-devel \
     bzip2 \
     cyrus-sasl-devel \
diff --git a/tests/docker/dockerfiles/ubuntu.docker b/tests/docker/dockerfiles/ubuntu.docker
index e2f55eb892..1609af3c4f 100644
--- a/tests/docker/dockerfiles/ubuntu.docker
+++ b/tests/docker/dockerfiles/ubuntu.docker
@@ -11,6 +11,7 @@
 
 FROM ubuntu:20.04
 ENV PACKAGES \
+    bison \
     ccache \
     clang \
     dbus \
@@ -30,6 +31,7 @@ ENV PACKAGES \
     libepoxy-dev \
     libfdt-dev \
     libgbm-dev \
+    libglib2.0-dev \
     libgnutls28-dev \
     libgtk-3-dev \
     libibverbs-dev \
diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dockerfiles/ubuntu1804.docker
index 2068118180..18f9261ad5 100644
--- a/tests/docker/dockerfiles/ubuntu1804.docker
+++ b/tests/docker/dockerfiles/ubuntu1804.docker
@@ -1,5 +1,6 @@
 FROM ubuntu:18.04
 ENV PACKAGES \
+    bison \
     ccache \
     clang \
     flex \
@@ -18,6 +19,7 @@ ENV PACKAGES \
     libepoxy-dev \
     libfdt-dev \
     libgbm-dev \
+    libglib2.0-dev \
     libgtk-3-dev \
     libibverbs-dev \
     libiscsi-dev \
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index 13d43a7b90..4c01e0cbef 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -1,5 +1,6 @@
 FROM ubuntu:20.04
-ENV PACKAGES bison \
+ENV PACKAGES \
+    bison \
     bsdmainutils \
     ccache \
     clang-10\
@@ -21,6 +22,7 @@ ENV PACKAGES bison \
     libepoxy-dev \
     libfdt-dev \
     libgbm-dev \
+    libglib2.0-dev \
     libgtk-3-dev \
     libibverbs-dev \
     libiscsi-dev \
-- 
2.31.1


