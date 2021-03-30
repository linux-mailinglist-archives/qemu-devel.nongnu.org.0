Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CADD634EAC4
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 16:45:02 +0200 (CEST)
Received: from localhost ([::1]:39524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRFc4-0001v4-AY
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 10:45:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1lRFVm-0003Dq-4k
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 10:38:30 -0400
Received: from rev.ng ([5.9.113.41]:55541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1lRFVa-0004x4-FN
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 10:38:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=z5uH72O4kN211iKfztZ7evlqZ3MCU0PqebyXX7A1wOs=; b=mMSXNkHl2T9/9G6N5srtmcmIXS
 55TbaWxJcU4KVl8oWHoQ9Wt/2yCxq9q6Yv6WMOB/oulXhZ8LYQxELfBRP+9RQ55hQ1bbKz1H0zZAl
 enD85NwvgRA8Pn4JC+ZWr/+vKmuqBT/47ft2h7ERUE6V9YuqaeeUG3oscJLKq011ja6Y=;
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, bcain@quicinc.com, babush@rev.ng, nizzo@rev.ng,
 philmd@redhat.com, richard.henderson@linaro.org,
 Alessandro Di Federico <ale@rev.ng>
Subject: [PATCH v3 09/12] target/hexagon: import lexer for idef-parser
Date: Tue, 30 Mar 2021 16:37:47 +0200
Message-Id: <20210330143750.3037824-10-ale.qemu@rev.ng>
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
 target/hexagon/idef-parser/idef-parser.h      | 240 +++++++
 target/hexagon/idef-parser/idef-parser.lex    | 611 ++++++++++++++++++
 target/hexagon/meson.build                    |   4 +
 tests/docker/dockerfiles/alpine.docker        |   1 +
 tests/docker/dockerfiles/centos7.docker       |   1 +
 tests/docker/dockerfiles/centos8.docker       |   1 +
 tests/docker/dockerfiles/debian10.docker      |   1 +
 .../dockerfiles/fedora-i386-cross.docker      |   1 +
 .../dockerfiles/fedora-win32-cross.docker     |   1 +
 .../dockerfiles/fedora-win64-cross.docker     |   1 +
 tests/docker/dockerfiles/fedora.docker        |   1 +
 tests/docker/dockerfiles/opensuse-leap.docker |   1 +
 tests/docker/dockerfiles/ubuntu.docker        |   1 +
 tests/docker/dockerfiles/ubuntu1804.docker    |   1 +
 tests/docker/dockerfiles/ubuntu2004.docker    |   3 +-
 15 files changed, 868 insertions(+), 1 deletion(-)
 create mode 100644 target/hexagon/idef-parser/idef-parser.h
 create mode 100644 target/hexagon/idef-parser/idef-parser.lex

diff --git a/target/hexagon/idef-parser/idef-parser.h b/target/hexagon/idef-parser/idef-parser.h
new file mode 100644
index 0000000000..ecfa0174e2
--- /dev/null
+++ b/target/hexagon/idef-parser/idef-parser.h
@@ -0,0 +1,240 @@
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
+ * General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef IDEF_PARSER_H
+#define IDEF_PARSER_H
+
+#include <inttypes.h>
+#include <stdio.h>
+#include <stdbool.h>
+#include <glib.h>
+
+#define TCGV_NAME_SIZE 7
+#define MAX_WRITTEN_REGS 32
+#define OFFSET_STR_LEN 32
+#define ALLOC_LIST_LEN 32
+#define ALLOC_NAME_SIZE 32
+#define INIT_LIST_LEN 32
+#define OUT_BUF_LEN (1024 * 1024)
+#define SIGNATURE_BUF_LEN (128 * 1024)
+#define HEADER_BUF_LEN (128 * 1024)
+
+/* Variadic macros to wrap the buffer printing functions */
+#define EMIT(c, ...)                                                 \
+    do {                                                             \
+        g_string_append_printf((c)->out_str, __VA_ARGS__);           \
+    } while (0)
+
+#define EMIT_SIG(c, ...)                                                       \
+    do {                                                                       \
+        g_string_append_printf((c)->signature_str, __VA_ARGS__);               \
+    } while (0)
+
+#define EMIT_HEAD(c, ...)                                                      \
+    do {                                                                       \
+        g_string_append_printf((c)->header_str, __VA_ARGS__);                  \
+    } while (0)
+
+/**
+ * Type of register, assigned to the HexReg.type field
+ */
+typedef enum {GENERAL_PURPOSE, CONTROL, MODIFIER, DOTNEW} RegType;
+
+/**
+ * Types of control registers, assigned to the HexReg.id field
+ */
+typedef enum {SP, FP, LR, GP, LC0, LC1, SA0, SA1} CregType;
+
+/**
+ * Identifier string of the control registers, indexed by the CregType enum
+ */
+extern const char *creg_str[];
+
+/**
+ * Semantic record of the REG tokens, identifying registers
+ */
+typedef struct HexReg {
+    CregType id;            /**< Identifier of the register                  */
+    RegType type;           /**< Type of the register                        */
+    unsigned bit_width;     /**< Bit width of the reg, 32 or 64 bits         */
+} HexReg;
+
+/**
+ * Data structure, identifying a TCGv temporary value
+ */
+typedef struct HexTmp {
+    int index;              /**< Index of the TCGv temporary value    */
+} HexTmp;
+
+/**
+ * Enum of the possible immediated, an immediate is a value which is known
+ * at tinycode generation time, e.g. an integer value, not a TCGv
+ */
+enum ImmUnionTag {I, VARIABLE, VALUE, QEMU_TMP, IMM_PC, IMM_CONSTEXT};
+
+/**
+ * Semantic record of the IMM token, identifying an immediate constant
+ */
+typedef struct HexImm {
+    union {
+        char id;            /**< Identifier of the immediate                 */
+        uint64_t value;     /**< Immediate value (for VALUE type immediates) */
+        uint64_t index;     /**< Index of the immediate (for int temp vars)  */
+    };
+    enum ImmUnionTag type;  /**< Type of the immediate                      */
+} HexImm;
+
+/**
+ * Semantic record of the PRE token, identifying a predicate
+ */
+typedef struct HexPre {
+    char id;                /**< Identifier of the predicate                 */
+} HexPre;
+
+/**
+ * Semantic record of the SAT token, identifying the saturate operator
+ */
+typedef struct HexSat {
+    bool set_overflow;      /**< Set-overflow feature for the sat operator   */
+    bool is_unsigned;       /**< Unsigned flag for the saturate operator     */
+} HexSat;
+
+/**
+ * Semantic record of the CAST token, identifying the cast operator
+ */
+typedef struct HexCast {
+    int bit_width;          /**< Bit width of the cast operator              */
+    bool is_unsigned;       /**< Unsigned flag for the cast operator         */
+} HexCast;
+
+/**
+ * Semantic record of the EXTRACT token, identifying the cast operator
+ */
+typedef struct HexExtract {
+    int bit_width;          /**< Bit width of the extract operator           */
+    int storage_bit_width;  /**< Actual bit width of the extract operator    */
+    bool is_unsigned;       /**< Unsigned flag for the extract operator      */
+} HexExtract;
+
+/**
+ * Semantic record of the MPY token, identifying the fMPY multiplication
+ * operator
+ */
+typedef struct HexMpy {
+    int first_bit_width;    /**< Bit width of the first operand of fMPY op   */
+    int second_bit_width;   /**< Bit width of the second operand of fMPY     */
+    bool first_unsigned;    /**< Unsigned flag for the first operand of fMPY */
+    bool second_unsigned;   /**< Unsigned flag for second operand of fMPY    */
+} HexMpy;
+
+/**
+ * Semantic record of the VARID token, identifying automatic variables
+ * of the input language
+ */
+typedef struct HexVar {
+    GString *name;          /**< Name of the VARID automatic variable        */
+} HexVar;
+
+/**
+ * Data structure uniquely identifying an automatic VARID variable, used for
+ * keeping track of declared variable, so that any variable is declared only
+ * once, and its properties are propagated through all the subsequent instances
+ * of that variable
+ */
+typedef struct Var {
+    GString *name;          /**< Name of the VARID automatic variable        */
+    uint8_t bit_width;      /**< Bit width of the VARID automatic variable   */
+    bool is_unsigned;       /**< Unsigned flag for the VARID automatic var   */
+} Var;
+
+/**
+ * Enum of the possible rvalue types, used in the HexValue.type field
+ */
+typedef enum RvalueUnionTag {
+    REGISTER, TEMP, IMMEDIATE, PREDICATE, VARID
+} RvalueUnionTag;
+
+/**
+ * Semantic record of the rvalue token, identifying any numeric value,
+ * immediate or register based. The rvalue tokens are combined together
+ * through the use of several operators, to encode expressions
+ */
+typedef struct HexValue {
+    union {
+        HexReg reg;      /**< rvalue of register type                     */
+        HexTmp tmp;      /**< rvalue of temporary type                    */
+        HexImm imm;      /**< rvalue of immediate type                    */
+        HexPre pre;      /**< rvalue of predicate type                    */
+        HexVar var;      /**< rvalue of automatic variable type           */
+    };
+    RvalueUnionTag type;    /**< Type of the rvalue                          */
+    unsigned bit_width;     /**< Bit width of the rvalue                     */
+    bool is_unsigned;       /**< Unsigned flag for the rvalue                */
+    bool is_dotnew;         /**< rvalue of predicate type is dotnew?         */
+    bool is_manual;         /**< Opt out of automatic freeing of params      */
+} HexValue;
+
+/**
+ * Operator type, used for referencing the correct operator when calling the
+ * gen_bin_op() function, which in turn will generate the correct code to
+ * execute the operation between the two rvalues
+ */
+typedef enum OpType {
+    ADD_OP, SUB_OP, MUL_OP, ASL_OP, ASR_OP, LSR_OP, ANDB_OP, ORB_OP,
+    XORB_OP, ANDL_OP, MINI_OP, MAXI_OP, MOD_OP
+} OpType;
+
+/**
+ * Data structure including instruction specific information, to be cleared
+ * out after the compilation of each instruction
+ */
+typedef struct Inst {
+    GString *name;                /**< Name of the compiled instruction      */
+    char *code_begin;             /**< Beginning of instruction input code   */
+    char *code_end;               /**< End of instruction input code         */
+    int tmp_count;                /**< Index of the last declared TCGv temp  */
+    int qemu_tmp_count;           /**< Index of the last declared int temp   */
+    int if_count;                 /**< Index of the last declared if label   */
+    int error_count;              /**< Number of generated errors            */
+    GArray *allocated;            /**< Allocated VARID automatic vars        */
+    GArray *init_list;            /**< List of initialized registers         */
+    GArray *strings;              /**< Strings allocated by the instruction  */
+} Inst;
+
+/**
+ * Data structure representing the whole translation context, which in a
+ * reentrant flex/bison parser just like ours is passed between the scanner
+ * and the parser, holding all the necessary information to perform the
+ * parsing, this data structure survives between the compilation of different
+ * instructions
+ *
+ */
+typedef struct Context {
+    void *scanner;                /**< Reentrant parser state pointer        */
+    char *input_buffer;           /**< Buffer containing the input code      */
+    GString *out_str;             /**< String containing the output code     */
+    GString *signature_str;       /**< String containing the signatures code */
+    GString *header_str;          /**< String containing the output code     */
+    FILE *defines_file;           /**< FILE * of the generated header        */
+    FILE *output_file;            /**< FILE * of the C output file           */
+    FILE *enabled_file;           /**< FILE * of the list of enabled inst    */
+    int total_insn;               /**< Number of instructions in input file  */
+    int implemented_insn;         /**< Instruction compiled without errors   */
+    Inst inst;                  /**< Parsing data of the current inst      */
+} Context;
+
+#endif /* IDEF_PARSER_H */
diff --git a/target/hexagon/idef-parser/idef-parser.lex b/target/hexagon/idef-parser/idef-parser.lex
new file mode 100644
index 0000000000..7593c9392b
--- /dev/null
+++ b/target/hexagon/idef-parser/idef-parser.lex
@@ -0,0 +1,611 @@
+%option noyywrap noinput nounput
+%option 8bit reentrant bison-bridge
+%option warn nodefault
+%option bison-locations
+
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
+#include <string.h>
+#include <stdbool.h>
+
+#include "idef-parser.h"
+#include "idef-parser.tab.h"
+
+/* Keep track of scanner position for error message printout */
+#define YY_USER_ACTION yylloc->first_column = yylloc->last_column; \
+    for (int i = 0; yytext[i] != '\0'; i++) {   \
+        yylloc->last_column++;                  \
+    }
+
+/* Global Error Counter */
+int error_count;
+
+%}
+
+/* Definitions */
+DIGIT                    [0-9]
+LOWER_ID                 [a-z]
+UPPER_ID                 [A-Z]
+ID                       LOWER_ID|UPPER_ID
+INST_NAME                [A-Z]+[0-9]_([A-Za-z]|[0-9]|_)+
+HEX_DIGIT                [0-9a-fA-F]
+REG_ID_32                e|s|d|t|u|v|x|y
+REG_ID_64                ee|ss|dd|tt|uu|vv|xx|yy
+SYS_ID_32                s|d
+SYS_ID_64                ss|dd
+LOWER_PRE                d|s|t|u|v|e|x|x
+IMM_ID                   r|s|S|u|U
+VAR_ID                   [a-zA-Z_][a-zA-Z0-9_]*
+SIGN_ID                  s|u
+
+/* Tokens */
+%%
+
+[ \t\f\v]+                { /* Ignore whitespaces. */ }
+[\n\r]+                   { /* Ignore newlines. */ }
+
+{INST_NAME}               { yylval->string = g_string_new(yytext);
+                            return INAME; }
+"fFLOAT"                 |
+"fUNFLOAT"               |
+"fDOUBLE"                |
+"fUNDOUBLE"              |
+"0.0"                    |
+"0x1.0p52"               |
+"0x1.0p-52"              { return FAIL; }
+"R"{REG_ID_32}"V" {
+                           yylval->rvalue.type = REGISTER;
+                           yylval->rvalue.reg.type = GENERAL_PURPOSE;
+                           yylval->rvalue.reg.id = yytext[1];
+                           yylval->rvalue.reg.bit_width = 32;
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.is_dotnew = false;
+                           return REG; }
+"R"{REG_ID_32}"N" {
+                           yylval->rvalue.type = REGISTER;
+                           yylval->rvalue.reg.type = DOTNEW;
+                           yylval->rvalue.reg.id = yytext[1];
+                           yylval->rvalue.reg.bit_width = 32;
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.is_dotnew = true;
+                           return REG; }
+"R"{REG_ID_64}"V" {
+                           yylval->rvalue.type = REGISTER;
+                           yylval->rvalue.reg.type = GENERAL_PURPOSE;
+                           yylval->rvalue.reg.id = yytext[1];
+                           yylval->rvalue.reg.bit_width = 64;
+                           yylval->rvalue.bit_width = 64;
+                           yylval->rvalue.is_dotnew = false;
+                           return REG; }
+"R"{REG_ID_64}"N" {
+                           yylval->rvalue.type = REGISTER;
+                           yylval->rvalue.reg.type = DOTNEW;
+                           yylval->rvalue.reg.id = yytext[1];
+                           yylval->rvalue.reg.bit_width = 64;
+                           yylval->rvalue.bit_width = 64;
+                           yylval->rvalue.is_dotnew = true;
+                           return REG; }
+"MuV" {
+                           yylval->rvalue.type = REGISTER;
+                           yylval->rvalue.reg.type = MODIFIER;
+                           yylval->rvalue.reg.id = 'u';
+                           yylval->rvalue.reg.bit_width = 32;
+                           yylval->rvalue.bit_width = 32;
+                           return REG; }
+"C"{REG_ID_32}"V" {
+                           yylval->rvalue.type = REGISTER;
+                           yylval->rvalue.reg.type = CONTROL;
+                           yylval->rvalue.reg.id = yytext[1];
+                           yylval->rvalue.reg.bit_width = 32;
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.is_dotnew = false;
+                           return REG; }
+"C"{REG_ID_64}"V" {
+                           yylval->rvalue.type = REGISTER;
+                           yylval->rvalue.reg.type = CONTROL;
+                           yylval->rvalue.reg.id = yytext[1];
+                           yylval->rvalue.reg.bit_width = 64;
+                           yylval->rvalue.bit_width = 64;
+                           yylval->rvalue.is_dotnew = false;
+                           return REG; }
+{IMM_ID}"iV" {
+                           yylval->rvalue.type = IMMEDIATE;
+                           yylval->rvalue.is_unsigned = false;
+                           yylval->rvalue.imm.type = VARIABLE;
+                           yylval->rvalue.imm.id = yytext[0];
+                           yylval->rvalue.is_dotnew = false;
+                           return IMM; }
+"P"{LOWER_PRE}"V" {
+                           yylval->rvalue.type = PREDICATE;
+                           yylval->rvalue.pre.id = yytext[1];
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.is_dotnew = false;
+                           return PRE; }
+"P"{LOWER_PRE}"N" {
+                           yylval->rvalue.type = PREDICATE;
+                           yylval->rvalue.pre.id = yytext[1];
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.is_dotnew = true;
+                           return PRE; }
+"in R"{REG_ID_32}"V" {
+                           yylval->rvalue.type = REGISTER;
+                           yylval->rvalue.reg.type = GENERAL_PURPOSE;
+                           yylval->rvalue.reg.id = yytext[4];
+                           yylval->rvalue.reg.bit_width = 32;
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.is_dotnew = false;
+                           return RREG; }
+"in R"{REG_ID_64}"V" {
+                           yylval->rvalue.type = REGISTER;
+                           yylval->rvalue.reg.type = GENERAL_PURPOSE;
+                           yylval->rvalue.reg.id = yytext[4];
+                           yylval->rvalue.reg.bit_width = 64;
+                           yylval->rvalue.bit_width = 64;
+                           yylval->rvalue.is_dotnew = false;
+                           return RREG; }
+"in N"{REG_ID_32}"N" {
+                           yylval->rvalue.type = REGISTER;
+                           yylval->rvalue.reg.type = DOTNEW;
+                           yylval->rvalue.reg.id = yytext[4];
+                           yylval->rvalue.reg.bit_width = 32;
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.is_dotnew = true;
+                           return RREG; }
+"in N"{REG_ID_64}"N" {
+                           yylval->rvalue.type = REGISTER;
+                           yylval->rvalue.reg.type = DOTNEW;
+                           yylval->rvalue.reg.id = yytext[4];
+                           yylval->rvalue.reg.bit_width = 64;
+                           yylval->rvalue.bit_width = 64;
+                           yylval->rvalue.is_dotnew = true;
+                           return RREG; }
+"in P"{LOWER_PRE}"V" {
+                           yylval->rvalue.type = PREDICATE;
+                           yylval->rvalue.pre.id = yytext[4];
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.is_dotnew = false;
+                           return RPRE; }
+"in P"{LOWER_PRE}"N" {
+                           yylval->rvalue.type = PREDICATE;
+                           yylval->rvalue.pre.id = yytext[4];
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.is_dotnew = true;
+                           return RPRE; }
+"in MuV" {
+                           yylval->rvalue.type = REGISTER;
+                           yylval->rvalue.reg.type = MODIFIER;
+                           yylval->rvalue.reg.id = 'u';
+                           yylval->rvalue.reg.bit_width = 32;
+                           yylval->rvalue.bit_width = 32;
+                           return RREG; }
+"in C"{REG_ID_32}"V" {
+                           yylval->rvalue.type = REGISTER;
+                           yylval->rvalue.reg.type = CONTROL;
+                           yylval->rvalue.reg.id = yytext[4];
+                           yylval->rvalue.reg.bit_width = 32;
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.is_dotnew = false;
+                           return RREG; }
+"in C"{REG_ID_64}"V" {
+                           yylval->rvalue.type = REGISTER;
+                           yylval->rvalue.reg.type = CONTROL;
+                           yylval->rvalue.reg.id = yytext[4];
+                           yylval->rvalue.reg.bit_width = 64;
+                           yylval->rvalue.bit_width = 64;
+                           yylval->rvalue.is_dotnew = false;
+                           return RREG; }
+"fGEN_TCG_"{INST_NAME}"(" { return FWRAP; }
+"IV1DEAD()"              |
+"fPAUSE(uiV);"           { return ';'; }
+"**"                     { return POW; }
+"+="                     { return INC; }
+"-="                     { return DEC; }
+"++"                     { return PLUSPLUS; }
+"&="                     { return ANDA; }
+"|="                     { return ORA; }
+"^="                     { return XORA; }
+"<<"                     { return ASL; }
+">>"                     { return ASR; }
+">>>"                    { return LSR; }
+"=="                     { return EQ; }
+"!="                     { return NEQ; }
+"<="                     { return LTE; }
+">="                     { return GTE; }
+"&&"                     { return ANDL; }
+"||"                     { return ORL; }
+"else"                   { return ELSE; }
+"for"                    { return FOR; }
+"fREAD_IREG"             { return ICIRC; }
+"fPART1"                 { return PART1; }
+"if"                     { return IF; }
+"fFRAME_SCRAMBLE"        { return FSCR; }
+"fFRAME_UNSCRAMBLE"      { return FSCR; }
+"fFRAMECHECK"            { return FCHK; }
+"Constant_extended"      { return CONSTEXT; }
+"fCL1_"{DIGIT}           { return LOCNT; }
+"fBREV_8"                { return BREV_8; }
+"fBREV_4"                { return BREV_4; }
+"fbrev"                  { return BREV; }
+"fSXTN"                  { return SXT; }
+"fZXTN"                  { return ZXT; }
+"fDF_MAX"                |
+"fSF_MAX"                |
+"fMAX"                   { return MAX; }
+"fDF_MIN"                |
+"fSF_MIN"                |
+"fMIN"                   { return MIN; }
+"fABS"                   { return ABS; }
+"fRNDN"                  { return ROUND; }
+"fCRND"                  { return CROUND; }
+"fCRNDN"                 { return CROUND; }
+"fPM_CIRI"               { return CIRCADD; }
+"fPM_CIRR"               { return CIRCADD; }
+"fCOUNTONES_"{DIGIT}     { return COUNTONES; }
+"fSATN"                  { yylval->sat.set_overflow = false;
+                           yylval->sat.is_unsigned = false;
+                           return SAT; }
+"fVSATN"                 { yylval->sat.set_overflow = true;
+                           yylval->sat.is_unsigned = false;
+                           return SAT; }
+"fSATUN"                 { yylval->sat.set_overflow = false;
+                           yylval->sat.is_unsigned = true;
+                           return SAT; }
+"fSE32_64"               { yylval->cast.bit_width = 64;
+                           yylval->cast.is_unsigned = false;
+                           return CAST; }
+"fCAST4_4u"              { yylval->cast.bit_width = 32;
+                           yylval->cast.is_unsigned = true;
+                           return CAST; }
+"fCAST4_8s"              { yylval->cast.bit_width = 64;
+                           yylval->cast.is_unsigned = false;
+                           return CAST; }
+"fCAST4_8u"              { return CAST4_8U; }
+"fCAST4u"                { yylval->cast.bit_width = 32;
+                           yylval->cast.is_unsigned = true;
+                           return CAST; }
+"fCAST4s"                { yylval->cast.bit_width = 32;
+                           yylval->cast.is_unsigned = false;
+                           return CAST; }
+"fCAST8_8u"              { yylval->cast.bit_width = 64;
+                           yylval->cast.is_unsigned = true;
+                           return CAST; }
+"fCAST8u"                { yylval->cast.bit_width = 64;
+                           yylval->cast.is_unsigned = true;
+                           return CAST; }
+"fCAST8s"                { yylval->cast.bit_width = 64;
+                           yylval->cast.is_unsigned = false;
+                           return CAST; }
+"fGETBIT"                { yylval->extract.bit_width = 1;
+                           yylval->extract.storage_bit_width = 1;
+                           yylval->extract.is_unsigned = true;
+                           return EXTRACT; }
+"fGETBYTE"               { yylval->extract.bit_width = 8;
+                           yylval->extract.storage_bit_width = 8;
+                           yylval->extract.is_unsigned = false;
+                           return EXTRACT; }
+"fGETUBYTE"              { yylval->extract.bit_width = 8;
+                           yylval->extract.storage_bit_width = 8;
+                           yylval->extract.is_unsigned = true;
+                           return EXTRACT; }
+"fGETHALF"               { yylval->extract.bit_width = 16;
+                           yylval->extract.storage_bit_width = 16;
+                           yylval->extract.is_unsigned = false;
+                           return EXTRACT; }
+"fGETUHALF"              { yylval->extract.bit_width = 16;
+                           yylval->extract.storage_bit_width = 16;
+                           yylval->extract.is_unsigned = true;
+                           return EXTRACT; }
+"fGETWORD"               { yylval->extract.bit_width = 32;
+                           yylval->extract.storage_bit_width = 64;
+                           yylval->extract.is_unsigned = false;
+                           return EXTRACT; }
+"fGETUWORD"              { yylval->extract.bit_width = 32;
+                           yylval->extract.storage_bit_width = 64;
+                           yylval->extract.is_unsigned = true;
+                           return EXTRACT; }
+"fEXTRACTU_BITS"         { return EXTBITS; }
+"fEXTRACTU_RANGE"        { return EXTRANGE; }
+"fSETBIT"                { yylval->cast.bit_width = 1;
+                           yylval->cast.is_unsigned = false;
+                           return DEPOSIT; }
+"fSETBYTE"               { yylval->cast.bit_width = 8;
+                           yylval->cast.is_unsigned = false;
+                           return DEPOSIT; }
+"fSETHALF"               { yylval->cast.bit_width = 16;
+                           yylval->cast.is_unsigned = false;
+                           return SETHALF; }
+"fSETWORD"               { yylval->cast.bit_width = 32;
+                           yylval->cast.is_unsigned = false;
+                           return DEPOSIT; }
+"fINSERT_BITS"           { return INSBITS; }
+"fSETBITS"               { return SETBITS; }
+"fMPY8UU"                { yylval->mpy.first_bit_width = 8;
+                           yylval->mpy.second_bit_width = 8;
+                           yylval->mpy.first_unsigned = true;
+                           yylval->mpy.second_unsigned = true;
+                           return MPY; }
+"fMPY8US"                { yylval->mpy.first_bit_width = 8;
+                           yylval->mpy.second_bit_width = 8;
+                           yylval->mpy.first_unsigned = true;
+                           yylval->mpy.second_unsigned = false;
+                           return MPY; }
+"fMPY8SU"                { yylval->mpy.first_bit_width = 8;
+                           yylval->mpy.second_bit_width = 8;
+                           yylval->mpy.first_unsigned = false;
+                           yylval->mpy.second_unsigned = true;
+                           return MPY; }
+"fMPY8SS"                { yylval->mpy.first_bit_width = 8;
+                           yylval->mpy.second_bit_width = 8;
+                           yylval->mpy.first_unsigned = false;
+                           yylval->mpy.second_unsigned = false;
+                           return MPY; }
+"fMPY16UU"               { yylval->mpy.first_bit_width = 16;
+                           yylval->mpy.second_bit_width = 16;
+                           yylval->mpy.first_unsigned = true;
+                           yylval->mpy.second_unsigned = true;
+                           return MPY; }
+"fMPY16US"               { yylval->mpy.first_bit_width = 16;
+                           yylval->mpy.second_bit_width = 16;
+                           yylval->mpy.first_unsigned = true;
+                           yylval->mpy.second_unsigned = false;
+                           return MPY; }
+"fMPY16SU"               { yylval->mpy.first_bit_width = 16;
+                           yylval->mpy.second_bit_width = 16;
+                           yylval->mpy.first_unsigned = false;
+                           yylval->mpy.second_unsigned = true;
+                           return MPY; }
+"fMPY16SS"               { yylval->mpy.first_bit_width = 16;
+                           yylval->mpy.second_bit_width = 16;
+                           yylval->mpy.first_unsigned = false;
+                           yylval->mpy.second_unsigned = false;
+                           return MPY; }
+"fMPY32UU"               { yylval->mpy.first_bit_width = 32;
+                           yylval->mpy.second_bit_width = 32;
+                           yylval->mpy.first_unsigned = true;
+                           yylval->mpy.second_unsigned = true;
+                           return MPY; }
+"fMPY32US"               { yylval->mpy.first_bit_width = 32;
+                           yylval->mpy.second_bit_width = 32;
+                           yylval->mpy.first_unsigned = true;
+                           yylval->mpy.second_unsigned = false;
+                           return MPY; }
+"fMPY32SU"               { yylval->mpy.first_bit_width = 32;
+                           yylval->mpy.second_bit_width = 32;
+                           yylval->mpy.first_unsigned = false;
+                           yylval->mpy.second_unsigned = true;
+                           return MPY; }
+"fSFMPY"                 |
+"fMPY32SS"               { yylval->mpy.first_bit_width = 32;
+                           yylval->mpy.second_bit_width = 32;
+                           yylval->mpy.first_unsigned = false;
+                           yylval->mpy.second_unsigned = false;
+                           return MPY; }
+"fMPY3216SS"             { yylval->mpy.first_bit_width = 32;
+                           yylval->mpy.second_bit_width = 16;
+                           yylval->mpy.first_unsigned = false;
+                           yylval->mpy.second_unsigned = false;
+                           return MPY; }
+"fMPY3216SU"             { yylval->mpy.first_bit_width = 32;
+                           yylval->mpy.second_bit_width = 16;
+                           yylval->mpy.first_unsigned = false;
+                           yylval->mpy.second_unsigned = true;
+                           return MPY; }
+"fNEWREG"                |
+"fNEWREG_ST"             |
+"fIMMEXT"                |
+"fMUST_IMMEXT"           |
+"fCAST2_2s"              |
+"fCAST2_2u"              |
+"fCAST4_4s"              |
+"fCAST8_8s"              |
+"fZE8_16"                |
+"fSE8_16"                |
+"fZE16_32"               |
+"fSE16_32"               |
+"fZE32_64"               |
+"fPASS"                  |
+"fECHO"                  { return IDENTITY; }
+"(size8"[us]"_t)"        { yylval->cast.bit_width = 8;
+                           yylval->cast.is_unsigned = ((yytext[6]) == 'u');
+                           return CAST; }
+"(size16"[us]"_t)"       { yylval->cast.bit_width = 16;
+                           yylval->cast.is_unsigned = ((yytext[7]) == 'u');
+                           return CAST; }
+"(int)"                  { yylval->cast.bit_width = 32;
+                           yylval->cast.is_unsigned = false;
+                           return CAST; }
+"(unsigned int)"         { yylval->cast.bit_width = 32;
+                           yylval->cast.is_unsigned = true;
+                           return CAST; }
+"fREAD_PC()"             |
+"PC"                     { return PC; }
+"fREAD_NPC()"            |
+"NPC"                    { return NPC; }
+"fGET_LPCFG"             |
+"USR.LPCFG"              { return LPCFG; }
+"LOAD_CANCEL(EA)"        |
+"STORE_CANCEL(EA)"       |
+"CANCEL"                 { return CANCEL; }
+"N"{LOWER_ID}            { yylval->rvalue.type = REGISTER;
+                           yylval->rvalue.reg.type = GENERAL_PURPOSE;
+                           yylval->rvalue.reg.id = yytext[1];
+                           yylval->rvalue.reg.bit_width = 32;
+                           yylval->rvalue.bit_width = 32;
+                           return REG; }
+"N"{LOWER_ID}"N"         { yylval->rvalue.type = REGISTER;
+                           yylval->rvalue.reg.type = DOTNEW;
+                           yylval->rvalue.reg.id = yytext[1];
+                           yylval->rvalue.reg.bit_width = 32;
+                           yylval->rvalue.bit_width = 32;
+                           return REG; }
+[rR]{DIGIT}+             { yylval->rvalue.type = REGISTER;
+                           yylval->rvalue.reg.type = GENERAL_PURPOSE;
+                           yylval->rvalue.reg.id = atoi(yytext + 1);
+                           yylval->rvalue.reg.bit_width = 32;
+                           yylval->rvalue.bit_width = 32;
+                           return REG; }
+"fREAD_SP()"             |
+"SP"                     { yylval->rvalue.type = REGISTER;
+                           yylval->rvalue.reg.type = CONTROL;
+                           yylval->rvalue.reg.id = SP;
+                           yylval->rvalue.reg.bit_width = 32;
+                           yylval->rvalue.bit_width = 32;
+                           return REG; }
+"fREAD_FP()"             |
+"FP"                     { yylval->rvalue.type = REGISTER;
+                           yylval->rvalue.reg.type = CONTROL;
+                           yylval->rvalue.reg.id = FP;
+                           yylval->rvalue.reg.bit_width = 32;
+                           yylval->rvalue.bit_width = 32;
+                           return REG; }
+"fREAD_LR()"             |
+"LR"                     { yylval->rvalue.type = REGISTER;
+                           yylval->rvalue.reg.type = CONTROL;
+                           yylval->rvalue.reg.id = LR;
+                           yylval->rvalue.reg.bit_width = 32;
+                           yylval->rvalue.bit_width = 32;
+                           return REG; }
+"GP"                     { yylval->rvalue.type = REGISTER;
+                           yylval->rvalue.reg.type = CONTROL;
+                           yylval->rvalue.reg.id = GP;
+                           yylval->rvalue.reg.bit_width = 32;
+                           yylval->rvalue.bit_width = 32;
+                           return REG; }
+"fREAD_LC"[01]           { yylval->rvalue.type = REGISTER;
+                           yylval->rvalue.reg.type = CONTROL;
+                           yylval->rvalue.reg.id = LC0 + (yytext[8] - '0');
+                           yylval->rvalue.reg.bit_width = 32;
+                           yylval->rvalue.bit_width = 32;
+                           return REG; }
+"LC"[01]                 { yylval->rvalue.type = REGISTER;
+                           yylval->rvalue.reg.type = CONTROL;
+                           yylval->rvalue.reg.id = LC0 + (yytext[2] - '0');
+                           yylval->rvalue.reg.bit_width = 32;
+                           yylval->rvalue.bit_width = 32;
+                           return REG; }
+"fREAD_SA"[01]           { yylval->rvalue.type = REGISTER;
+                           yylval->rvalue.reg.type = CONTROL;
+                           yylval->rvalue.reg.id = SA0 + (yytext[8] - '0');
+                           yylval->rvalue.reg.bit_width = 32;
+                           yylval->rvalue.bit_width = 32;
+                           return REG; }
+"SA"[01]                 { yylval->rvalue.type = REGISTER;
+                           yylval->rvalue.reg.type = CONTROL;
+                           yylval->rvalue.reg.id = SA0 + (yytext[2] - '0');
+                           yylval->rvalue.reg.bit_width = 32;
+                           yylval->rvalue.bit_width = 32;
+                           return REG; }
+"MuN"                    { return MUN; }
+"fREAD_P0()"             { yylval->rvalue.type = PREDICATE;
+                           yylval->rvalue.pre.id = '0';
+                           yylval->rvalue.bit_width = 32;
+                           return PRE; }
+[pP]{DIGIT}              { yylval->rvalue.type = PREDICATE;
+                           yylval->rvalue.pre.id = yytext[1];
+                           yylval->rvalue.bit_width = 32;
+                           return PRE; }
+"fLSBNEW(P"{LOWER_PRE}"N)" { yylval->rvalue.type = PREDICATE;
+                           yylval->rvalue.pre.id = yytext[9];
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.is_dotnew = true;
+                           return PRE; }
+"fLSBNEW0"               { yylval->rvalue.type = PREDICATE;
+                           yylval->rvalue.pre.id = '0';
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.is_dotnew = true;
+                           return PRE; }
+"fLSBNEW1"               { yylval->rvalue.type = PREDICATE;
+                           yylval->rvalue.pre.id = '1';
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.is_dotnew = true;
+                           return PRE; }
+"fLSBNEW1NOT"            { yylval->rvalue.type = PREDICATE;
+                           yylval->rvalue.pre.id = '1';
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.is_dotnew = true;
+                           return PRE; }
+"N"                      { yylval->rvalue.type = IMMEDIATE;
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.imm.type = VARIABLE;
+                           yylval->rvalue.imm.id = 'N';
+                           return IMM; }
+"i"                      { yylval->rvalue.type = IMMEDIATE;
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.imm.type = I;
+                           return IMM; }
+{SIGN_ID}                { yylval->is_unsigned = (yytext[0] == 'u');
+                           return SIGN;
+                         }
+"fSF_BIAS()"             { yylval->rvalue.type = IMMEDIATE;
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.is_unsigned = false;
+                           yylval->rvalue.imm.type = VALUE;
+                           yylval->rvalue.imm.value = 127;
+                           return IMM; }
+{DIGIT}+                 { yylval->rvalue.type = IMMEDIATE;
+                           yylval->rvalue.bit_width = 64;
+                           yylval->rvalue.is_unsigned = false;
+                           yylval->rvalue.imm.type = VALUE;
+                           yylval->rvalue.imm.value = atoi(yytext);
+                           return IMM; }
+{DIGIT}+"LL"             { yylval->rvalue.type = IMMEDIATE;
+                           yylval->rvalue.bit_width = 64;
+                           yylval->rvalue.is_unsigned = false;
+                           yylval->rvalue.imm.type = VALUE;
+                           yylval->rvalue.imm.value = strtoll(yytext, NULL, 10);
+                           return IMM; }
+"0x"{HEX_DIGIT}+         { yylval->rvalue.type = IMMEDIATE;
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.is_unsigned = false;
+                           yylval->rvalue.imm.type = VALUE;
+                           yylval->rvalue.imm.value = strtoul(yytext, NULL, 16);
+                           return IMM; }
+"0x"{HEX_DIGIT}+"LL"     { yylval->rvalue.type = IMMEDIATE;
+                           yylval->rvalue.bit_width = 64;
+                           yylval->rvalue.is_unsigned = false;
+                           yylval->rvalue.imm.type = VALUE;
+                           yylval->rvalue.imm.value = strtoll(yytext, NULL, 16);
+                           return IMM; }
+"0x"{HEX_DIGIT}+"ULL"    { yylval->rvalue.type = IMMEDIATE;
+                           yylval->rvalue.bit_width = 64;
+                           yylval->rvalue.is_unsigned = true;
+                           yylval->rvalue.imm.type = VALUE;
+                           yylval->rvalue.imm.value = strtoull(yytext,
+                                                               NULL,
+                                                               16);
+                           return IMM; }
+"fCONSTLL"               { return CONSTLL; }
+"fCONSTULL"              { return CONSTULL; }
+"fLOAD"                  { return LOAD; }
+"fSTORE"                 { return STORE; }
+"fROTL"                  { return ROTL; }
+"fSET_OVERFLOW"          { return SETOVF; }
+"fDEINTERLEAVE"          { return DEINTERLEAVE; }
+"fINTERLEAVE"            { return INTERLEAVE; }
+"fCARRY_FROM_ADD"        { return CARRY_FROM_ADD; }
+{VAR_ID}                 { /* Variable name, we adopt the C names convention */
+                           yylval->rvalue.type = VARID;
+                           yylval->rvalue.var.name = g_string_new(yytext);
+                           /* Default types are int */
+                           yylval->rvalue.bit_width = 32;
+                           return VAR; }
+"fHINTJR(RsV)"           { /* Emit no token */ }
+.                        { return yytext[0]; }
+
+%%
diff --git a/target/hexagon/meson.build b/target/hexagon/meson.build
index 2c18edf67a..5dda04dc29 100644
--- a/target/hexagon/meson.build
+++ b/target/hexagon/meson.build
@@ -206,4 +206,8 @@ idef_parser_input_generated_prep = custom_target(
     command: [idef_parser_dir / 'prepare', '@INPUT@', '-I' + idef_parser_dir],
 )
 
+flex = generator(find_program('flex'),
+                 output: ['@BASENAME@.yy.c', '@BASENAME@.yy.h'],
+                 arguments: ['-o', '@OUTPUT0@', '--header-file=@OUTPUT1@', '@INPUT@'])
+
 target_arch += {'hexagon': hexagon_ss}
diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
index d63a269aef..1120e8555d 100644
--- a/tests/docker/dockerfiles/alpine.docker
+++ b/tests/docker/dockerfiles/alpine.docker
@@ -11,6 +11,7 @@ ENV PACKAGES \
 	binutils \
 	coreutils \
 	curl-dev \
+	flex \
 	g++ \
 	gcc \
 	git \
diff --git a/tests/docker/dockerfiles/centos7.docker b/tests/docker/dockerfiles/centos7.docker
index 75fdb53c7c..95966ea7e6 100644
--- a/tests/docker/dockerfiles/centos7.docker
+++ b/tests/docker/dockerfiles/centos7.docker
@@ -10,6 +10,7 @@ ENV PACKAGES \
     ccache \
     csnappy-devel \
     dbus-daemon \
+    flex \
     gcc-c++ \
     gcc \
     gettext \
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index a763d55730..5919aa0697 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -7,6 +7,7 @@ ENV PACKAGES \
     bzip2-devel \
     dbus-daemon \
     diffutils \
+    flex \
     gcc \
     gcc-c++ \
     genisoimage \
diff --git a/tests/docker/dockerfiles/debian10.docker b/tests/docker/dockerfiles/debian10.docker
index d034acbd25..97ec6d5637 100644
--- a/tests/docker/dockerfiles/debian10.docker
+++ b/tests/docker/dockerfiles/debian10.docker
@@ -23,6 +23,7 @@ RUN apt update && \
         ccache \
         clang \
         dbus \
+        flex \
         gdb-multiarch \
         gettext \
         git \
diff --git a/tests/docker/dockerfiles/fedora-i386-cross.docker b/tests/docker/dockerfiles/fedora-i386-cross.docker
index 966072c08e..9703b7ec78 100644
--- a/tests/docker/dockerfiles/fedora-i386-cross.docker
+++ b/tests/docker/dockerfiles/fedora-i386-cross.docker
@@ -3,6 +3,7 @@ ENV PACKAGES \
     bzip2 \
     diffutils \
     findutils \
+    flex \
     gcc \
     git \
     libtasn1-devel.i686 \
diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/docker/dockerfiles/fedora-win32-cross.docker
index 81b5659e9c..2018dcabe5 100644
--- a/tests/docker/dockerfiles/fedora-win32-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
@@ -6,6 +6,7 @@ ENV PACKAGES \
     bzip2 \
     diffutils \
     findutils \
+    flex \
     gcc \
     gettext \
     git \
diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
index bcb428e724..b05e4cbcc6 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -6,6 +6,7 @@ ENV PACKAGES \
     bzip2 \
     diffutils \
     findutils \
+    flex \
     gcc \
     gettext \
     git \
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index 915fdc1845..5d3f49936b 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -14,6 +14,7 @@ ENV PACKAGES \
     device-mapper-multipath-devel \
     diffutils \
     findutils \
+    flex \
     gcc \
     gcc-c++ \
     genisoimage \
diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index 0e64893e4a..ce1db959a2 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -6,6 +6,7 @@ ENV PACKAGES \
     brlapi-devel \
     bzip2 \
     cyrus-sasl-devel \
+    flex \
     gcc \
     gcc-c++ \
     mkisofs \
diff --git a/tests/docker/dockerfiles/ubuntu.docker b/tests/docker/dockerfiles/ubuntu.docker
index b5ef7a8198..e2f55eb892 100644
--- a/tests/docker/dockerfiles/ubuntu.docker
+++ b/tests/docker/dockerfiles/ubuntu.docker
@@ -14,6 +14,7 @@ ENV PACKAGES \
     ccache \
     clang \
     dbus \
+    flex \
     gcc \
     gettext \
     git \
diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dockerfiles/ubuntu1804.docker
index 9b0a19ba5e..2068118180 100644
--- a/tests/docker/dockerfiles/ubuntu1804.docker
+++ b/tests/docker/dockerfiles/ubuntu1804.docker
@@ -2,6 +2,7 @@ FROM ubuntu:18.04
 ENV PACKAGES \
     ccache \
     clang \
+    flex \
     gcc \
     gettext \
     git \
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index 9750016e51..13d43a7b90 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -1,8 +1,9 @@
 FROM ubuntu:20.04
-ENV PACKAGES flex bison \
+ENV PACKAGES bison \
     bsdmainutils \
     ccache \
     clang-10\
+    flex \
     gcc \
     gcovr \
     genisoimage \
-- 
2.31.1


