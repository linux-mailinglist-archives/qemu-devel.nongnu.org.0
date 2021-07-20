Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B58CF3CF9CB
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 14:44:01 +0200 (CEST)
Received: from localhost ([::1]:56938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5p6O-0001sN-Mm
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 08:44:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1m5otq-0004iu-La
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 08:31:02 -0400
Received: from rev.ng ([5.9.113.41]:37539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1m5otk-0004fG-SF
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 08:31:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=B32qJ47FaxuYYLLmDlMxbsXhx2z+96ni+vGIqUdAfpA=; b=GU5OBE2R5LyKjEl7CMFa1Ms0oq
 1L1NtfbvatXGWyP4qFnAt+IStM9831GKYSgx9yaT+bMAs/0+kGncmrWWqmNUOpCBucoO9Gqe+FTw/
 7BLK2M/aDQ9H2cWzR6hcN9JTDCJlMsBnVLOt2aPHyhib+aY8F4xlZTQCOqZxoB19fQ0I=;
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, bcain@quicinc.com, babush@rev.ng, nizzo@rev.ng,
 richard.henderson@linaro.org, Alessandro Di Federico <ale@rev.ng>
Subject: [PATCH v6 08/12] target/hexagon: import lexer for idef-parser
Date: Tue, 20 Jul 2021 14:30:27 +0200
Message-Id: <20210720123031.1101682-9-ale.qemu@rev.ng>
In-Reply-To: <20210720123031.1101682-1-ale.qemu@rev.ng>
References: <20210720123031.1101682-1-ale.qemu@rev.ng>
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
 target/hexagon/idef-parser/idef-parser.h      | 258 +++++++
 target/hexagon/idef-parser/idef-parser.lex    | 642 ++++++++++++++++++
 target/hexagon/meson.build                    |   4 +
 tests/docker/dockerfiles/alpine.docker        |   1 +
 tests/docker/dockerfiles/centos8.docker       |   1 +
 tests/docker/dockerfiles/debian-amd64.docker  |   1 +
 tests/docker/dockerfiles/debian10.docker      |   1 +
 .../dockerfiles/fedora-i386-cross.docker      |   1 +
 .../dockerfiles/fedora-win32-cross.docker     |   1 +
 .../dockerfiles/fedora-win64-cross.docker     |   1 +
 tests/docker/dockerfiles/fedora.docker        |   1 +
 tests/docker/dockerfiles/opensuse-leap.docker |   1 +
 tests/docker/dockerfiles/ubuntu.docker        |   1 +
 tests/docker/dockerfiles/ubuntu1804.docker    |   1 +
 tests/docker/dockerfiles/ubuntu2004.docker    |   2 +
 15 files changed, 917 insertions(+)
 create mode 100644 target/hexagon/idef-parser/idef-parser.h
 create mode 100644 target/hexagon/idef-parser/idef-parser.lex

diff --git a/target/hexagon/idef-parser/idef-parser.h b/target/hexagon/idef-parser/idef-parser.h
new file mode 100644
index 0000000000..f2c07793c6
--- /dev/null
+++ b/target/hexagon/idef-parser/idef-parser.h
@@ -0,0 +1,258 @@
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
+typedef enum { UNKNOWN_SIGNEDNESS, SIGNED, UNSIGNED } HexSignedness;
+
+/**
+ * Semantic record of the REG tokens, identifying registers
+ */
+typedef struct HexReg {
+    uint8_t id;             /**< Identifier of the register                  */
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
+enum ImmUnionTag {
+    I,
+    VARIABLE,
+    VALUE,
+    QEMU_TMP,
+    IMM_PC,
+    IMM_NPC,
+    IMM_CONSTEXT,
+};
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
+    bool set_overflow;       /**< Set-overflow feature for the sat operator  */
+    HexSignedness signedness;/**< Unsigned flag for the saturate operator    */
+} HexSat;
+
+/**
+ * Semantic record of the CAST token, identifying the cast operator
+ */
+typedef struct HexCast {
+    int bit_width;            /**< Bit width of the cast operator             */
+    HexSignedness signedness; /**< Unsigned flag for the cast operator        */
+} HexCast;
+
+/**
+ * Semantic record of the EXTRACT token, identifying the cast operator
+ */
+typedef struct HexExtract {
+    int bit_width;            /**< Bit width of the extract operator          */
+    int storage_bit_width;    /**< Actual bit width of the extract operator   */
+    HexSignedness signedness; /**< Unsigned flag for the extract operator     */
+} HexExtract;
+
+/**
+ * Semantic record of the MPY token, identifying the fMPY multiplication
+ * operator
+ */
+typedef struct HexMpy {
+    /**< Bit width of the first operand of fMPY op */
+    int first_bit_width;
+    /**< Bit width of the second operand of fMPY */
+    int second_bit_width;
+    /**< Signedness flag for the first operand of fMPY */
+    HexSignedness first_signedness;
+    /**< Signedness flag for second operand of fMPY */
+    HexSignedness second_signedness;
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
+    GString *name;            /**< Name of the VARID automatic variable       */
+    uint8_t bit_width;        /**< Bit width of the VARID automatic variable  */
+    HexSignedness signedness; /**< Unsigned flag for the VARID automatic var  */
+} Var;
+
+/**
+ * Enum of the possible rvalue types, used in the HexValue.type field
+ */
+typedef enum RvalueUnionTag {
+    REGISTER, REGISTER_ARG, TEMP, IMMEDIATE, PREDICATE, VARID
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
+    RvalueUnionTag type;      /**< Type of the rvalue                         */
+    unsigned bit_width;       /**< Bit width of the rvalue                    */
+    HexSignedness signedness; /**< Unsigned flag for the rvalue               */
+    bool is_dotnew;           /**< rvalue of predicate type is dotnew?        */
+    bool is_manual;           /**< Opt out of automatic freeing of params     */
+} HexValue;
+
+/**
+ * State of ternary operator
+ */
+typedef enum TernaryState { IN_LEFT, IN_RIGHT } TernaryState;
+
+/**
+ * Data structure used to handle side effects inside ternary operators
+ */
+typedef struct Ternary {
+    TernaryState state;
+    HexValue cond;
+} Ternary;
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
+    GArray *ternary;              /**< Array to track nesting of ternary ops */
+    int total_insn;               /**< Number of instructions in input file  */
+    int implemented_insn;         /**< Instruction compiled without errors   */
+    Inst inst;                  /**< Parsing data of the current inst      */
+} Context;
+
+#endif /* IDEF_PARSER_H */
diff --git a/target/hexagon/idef-parser/idef-parser.lex b/target/hexagon/idef-parser/idef-parser.lex
new file mode 100644
index 0000000000..98486dbaed
--- /dev/null
+++ b/target/hexagon/idef-parser/idef-parser.lex
@@ -0,0 +1,642 @@
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
+#include "hex_regs.h"
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
+^#.*$                     { /* Ignore linemarkers. */ }
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
+                           yylval->rvalue.type = REGISTER_ARG;
+                           yylval->rvalue.reg.type = GENERAL_PURPOSE;
+                           yylval->rvalue.reg.id = yytext[1];
+                           yylval->rvalue.reg.bit_width = 32;
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.is_dotnew = false;
+                           yylval->rvalue.signedness = SIGNED;
+                           return REG; }
+"R"{REG_ID_32}"N" {
+                           yylval->rvalue.type = REGISTER_ARG;
+                           yylval->rvalue.reg.type = DOTNEW;
+                           yylval->rvalue.reg.id = yytext[1];
+                           yylval->rvalue.reg.bit_width = 32;
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.is_dotnew = true;
+                           yylval->rvalue.signedness = SIGNED;
+                           return REG; }
+"R"{REG_ID_64}"V" {
+                           yylval->rvalue.type = REGISTER_ARG;
+                           yylval->rvalue.reg.type = GENERAL_PURPOSE;
+                           yylval->rvalue.reg.id = yytext[1];
+                           yylval->rvalue.reg.bit_width = 64;
+                           yylval->rvalue.bit_width = 64;
+                           yylval->rvalue.is_dotnew = false;
+                           yylval->rvalue.signedness = SIGNED;
+                           return REG; }
+"R"{REG_ID_64}"N" {
+                           yylval->rvalue.type = REGISTER_ARG;
+                           yylval->rvalue.reg.type = DOTNEW;
+                           yylval->rvalue.reg.id = yytext[1];
+                           yylval->rvalue.reg.bit_width = 64;
+                           yylval->rvalue.bit_width = 64;
+                           yylval->rvalue.is_dotnew = true;
+                           yylval->rvalue.signedness = SIGNED;
+                           return REG; }
+"MuV" {
+                           yylval->rvalue.type = REGISTER_ARG;
+                           yylval->rvalue.reg.type = MODIFIER;
+                           yylval->rvalue.reg.id = 'u';
+                           yylval->rvalue.reg.bit_width = 32;
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.signedness = SIGNED;
+                           return REG; }
+"C"{REG_ID_32}"V" {
+                           yylval->rvalue.type = REGISTER_ARG;
+                           yylval->rvalue.reg.type = CONTROL;
+                           yylval->rvalue.reg.id = yytext[1];
+                           yylval->rvalue.reg.bit_width = 32;
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.is_dotnew = false;
+                           yylval->rvalue.signedness = SIGNED;
+                           return REG; }
+"C"{REG_ID_64}"V" {
+                           yylval->rvalue.type = REGISTER_ARG;
+                           yylval->rvalue.reg.type = CONTROL;
+                           yylval->rvalue.reg.id = yytext[1];
+                           yylval->rvalue.reg.bit_width = 64;
+                           yylval->rvalue.bit_width = 64;
+                           yylval->rvalue.is_dotnew = false;
+                           yylval->rvalue.signedness = SIGNED;
+                           return REG; }
+{IMM_ID}"iV" {
+                           yylval->rvalue.type = IMMEDIATE;
+                           yylval->rvalue.signedness = SIGNED;
+                           yylval->rvalue.imm.type = VARIABLE;
+                           yylval->rvalue.imm.id = yytext[0];
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.is_dotnew = false;
+                           return IMM; }
+"P"{LOWER_PRE}"V" {
+                           yylval->rvalue.type = PREDICATE;
+                           yylval->rvalue.pre.id = yytext[1];
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.is_dotnew = false;
+                           yylval->rvalue.signedness = SIGNED;
+                           return PRE; }
+"P"{LOWER_PRE}"N" {
+                           yylval->rvalue.type = PREDICATE;
+                           yylval->rvalue.pre.id = yytext[1];
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.is_dotnew = true;
+                           yylval->rvalue.signedness = SIGNED;
+                           return PRE; }
+"in R"{REG_ID_32}"V" {
+                           yylval->rvalue.type = REGISTER_ARG;
+                           yylval->rvalue.reg.type = GENERAL_PURPOSE;
+                           yylval->rvalue.reg.id = yytext[4];
+                           yylval->rvalue.reg.bit_width = 32;
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.is_dotnew = false;
+                           yylval->rvalue.signedness = SIGNED;
+                           return RREG; }
+"in R"{REG_ID_64}"V" {
+                           yylval->rvalue.type = REGISTER_ARG;
+                           yylval->rvalue.reg.type = GENERAL_PURPOSE;
+                           yylval->rvalue.reg.id = yytext[4];
+                           yylval->rvalue.reg.bit_width = 64;
+                           yylval->rvalue.bit_width = 64;
+                           yylval->rvalue.is_dotnew = false;
+                           yylval->rvalue.signedness = SIGNED;
+                           return RREG; }
+"in N"{REG_ID_32}"N" {
+                           yylval->rvalue.type = REGISTER_ARG;
+                           yylval->rvalue.reg.type = DOTNEW;
+                           yylval->rvalue.reg.id = yytext[4];
+                           yylval->rvalue.reg.bit_width = 32;
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.is_dotnew = true;
+                           yylval->rvalue.signedness = SIGNED;
+                           return RREG; }
+"in N"{REG_ID_64}"N" {
+                           yylval->rvalue.type = REGISTER_ARG;
+                           yylval->rvalue.reg.type = DOTNEW;
+                           yylval->rvalue.reg.id = yytext[4];
+                           yylval->rvalue.reg.bit_width = 64;
+                           yylval->rvalue.bit_width = 64;
+                           yylval->rvalue.is_dotnew = true;
+                           yylval->rvalue.signedness = SIGNED;
+                           return RREG; }
+"in P"{LOWER_PRE}"V" {
+                           yylval->rvalue.type = PREDICATE;
+                           yylval->rvalue.pre.id = yytext[4];
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.is_dotnew = false;
+                           yylval->rvalue.signedness = SIGNED;
+                           return RPRE; }
+"in P"{LOWER_PRE}"N" {
+                           yylval->rvalue.type = PREDICATE;
+                           yylval->rvalue.pre.id = yytext[4];
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.is_dotnew = true;
+                           yylval->rvalue.signedness = SIGNED;
+                           return RPRE; }
+"in MuV" {
+                           yylval->rvalue.type = REGISTER_ARG;
+                           yylval->rvalue.reg.type = MODIFIER;
+                           yylval->rvalue.reg.id = 'u';
+                           yylval->rvalue.reg.bit_width = 32;
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.signedness = SIGNED;
+                           return RREG; }
+"in C"{REG_ID_32}"V" {
+                           yylval->rvalue.type = REGISTER_ARG;
+                           yylval->rvalue.reg.type = CONTROL;
+                           yylval->rvalue.reg.id = yytext[4];
+                           yylval->rvalue.reg.bit_width = 32;
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.is_dotnew = false;
+                           yylval->rvalue.signedness = SIGNED;
+                           return RREG; }
+"in C"{REG_ID_64}"V" {
+                           yylval->rvalue.type = REGISTER_ARG;
+                           yylval->rvalue.reg.type = CONTROL;
+                           yylval->rvalue.reg.id = yytext[4];
+                           yylval->rvalue.reg.bit_width = 64;
+                           yylval->rvalue.bit_width = 64;
+                           yylval->rvalue.is_dotnew = false;
+                           yylval->rvalue.signedness = SIGNED;
+                           return RREG; }
+"fGEN_TCG_"{INST_NAME}"(" { return FWRAP; }
+"IV1DEAD()"              |
+"fPAUSE(uiV);"           { return ';'; }
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
+"fSATN"                  { yylval->sat.set_overflow = true;
+                           yylval->sat.signedness = SIGNED;
+                           return SAT; }
+"fVSATN"                 { yylval->sat.set_overflow = false;
+                           yylval->sat.signedness = SIGNED;
+                           return SAT; }
+"fSATUN"                 { yylval->sat.set_overflow = false;
+                           yylval->sat.signedness = UNSIGNED;
+                           return SAT; }
+"fSE32_64"               { yylval->cast.bit_width = 64;
+                           yylval->cast.signedness = SIGNED;
+                           return CAST; }
+"fCAST4_4u"              { yylval->cast.bit_width = 32;
+                           yylval->cast.signedness = UNSIGNED;
+                           return CAST; }
+"fCAST4_8s"              { yylval->cast.bit_width = 64;
+                           yylval->cast.signedness = SIGNED;
+                           return CAST; }
+"fCAST4_8u"              { return CAST4_8U; }
+"fCAST4u"                { yylval->cast.bit_width = 32;
+                           yylval->cast.signedness = UNSIGNED;
+                           return CAST; }
+"fNEWREG"                |
+"fCAST4s"                { yylval->cast.bit_width = 32;
+                           yylval->cast.signedness = SIGNED;
+                           return CAST; }
+"fCAST8_8u"              { yylval->cast.bit_width = 64;
+                           yylval->cast.signedness = UNSIGNED;
+                           return CAST; }
+"fCAST8u"                { yylval->cast.bit_width = 64;
+                           yylval->cast.signedness = UNSIGNED;
+                           return CAST; }
+"fCAST8s"                { yylval->cast.bit_width = 64;
+                           yylval->cast.signedness = SIGNED;
+                           return CAST; }
+"fGETBIT"                { yylval->extract.bit_width = 1;
+                           yylval->extract.storage_bit_width = 1;
+                           yylval->extract.signedness = UNSIGNED;
+                           return EXTRACT; }
+"fGETBYTE"               { yylval->extract.bit_width = 8;
+                           yylval->extract.storage_bit_width = 8;
+                           yylval->extract.signedness = SIGNED;
+                           return EXTRACT; }
+"fGETUBYTE"              { yylval->extract.bit_width = 8;
+                           yylval->extract.storage_bit_width = 8;
+                           yylval->extract.signedness = UNSIGNED;
+                           return EXTRACT; }
+"fGETHALF"               { yylval->extract.bit_width = 16;
+                           yylval->extract.storage_bit_width = 16;
+                           yylval->extract.signedness = SIGNED;
+                           return EXTRACT; }
+"fGETUHALF"              { yylval->extract.bit_width = 16;
+                           yylval->extract.storage_bit_width = 16;
+                           yylval->extract.signedness = UNSIGNED;
+                           return EXTRACT; }
+"fGETWORD"               { yylval->extract.bit_width = 32;
+                           yylval->extract.storage_bit_width = 64;
+                           yylval->extract.signedness = SIGNED;
+                           return EXTRACT; }
+"fGETUWORD"              { yylval->extract.bit_width = 32;
+                           yylval->extract.storage_bit_width = 64;
+                           yylval->extract.signedness = UNSIGNED;
+                           return EXTRACT; }
+"fEXTRACTU_BITS"         { return EXTBITS; }
+"fEXTRACTU_RANGE"        { return EXTRANGE; }
+"fSETBIT"                { yylval->cast.bit_width = 1;
+                           yylval->cast.signedness = SIGNED;
+                           return DEPOSIT; }
+"fSETBYTE"               { yylval->cast.bit_width = 8;
+                           yylval->cast.signedness = SIGNED;
+                           return DEPOSIT; }
+"fSETHALF"               { yylval->cast.bit_width = 16;
+                           yylval->cast.signedness = SIGNED;
+                           return SETHALF; }
+"fSETWORD"               { yylval->cast.bit_width = 32;
+                           yylval->cast.signedness = SIGNED;
+                           return DEPOSIT; }
+"fINSERT_BITS"           { return INSBITS; }
+"fSETBITS"               { return SETBITS; }
+"fMPY8UU"                { yylval->mpy.first_bit_width = 8;
+                           yylval->mpy.second_bit_width = 8;
+                           yylval->mpy.first_signedness = UNSIGNED;
+                           yylval->mpy.second_signedness = UNSIGNED;
+                           return MPY; }
+"fMPY8US"                { yylval->mpy.first_bit_width = 8;
+                           yylval->mpy.second_bit_width = 8;
+                           yylval->mpy.first_signedness = UNSIGNED;
+                           yylval->mpy.second_signedness = SIGNED;
+                           return MPY; }
+"fMPY8SU"                { yylval->mpy.first_bit_width = 8;
+                           yylval->mpy.second_bit_width = 8;
+                           yylval->mpy.first_signedness = SIGNED;
+                           yylval->mpy.second_signedness = UNSIGNED;
+                           return MPY; }
+"fMPY8SS"                { yylval->mpy.first_bit_width = 8;
+                           yylval->mpy.second_bit_width = 8;
+                           yylval->mpy.first_signedness = SIGNED;
+                           yylval->mpy.second_signedness = SIGNED;
+                           return MPY; }
+"fMPY16UU"               { yylval->mpy.first_bit_width = 16;
+                           yylval->mpy.second_bit_width = 16;
+                           yylval->mpy.first_signedness = UNSIGNED;
+                           yylval->mpy.second_signedness = UNSIGNED;
+                           return MPY; }
+"fMPY16US"               { yylval->mpy.first_bit_width = 16;
+                           yylval->mpy.second_bit_width = 16;
+                           yylval->mpy.first_signedness = UNSIGNED;
+                           yylval->mpy.second_signedness = SIGNED;
+                           return MPY; }
+"fMPY16SU"               { yylval->mpy.first_bit_width = 16;
+                           yylval->mpy.second_bit_width = 16;
+                           yylval->mpy.first_signedness = SIGNED;
+                           yylval->mpy.second_signedness = UNSIGNED;
+                           return MPY; }
+"fMPY16SS"               { yylval->mpy.first_bit_width = 16;
+                           yylval->mpy.second_bit_width = 16;
+                           yylval->mpy.first_signedness = SIGNED;
+                           yylval->mpy.second_signedness = SIGNED;
+                           return MPY; }
+"fMPY32UU"               { yylval->mpy.first_bit_width = 32;
+                           yylval->mpy.second_bit_width = 32;
+                           yylval->mpy.first_signedness = UNSIGNED;
+                           yylval->mpy.second_signedness = UNSIGNED;
+                           return MPY; }
+"fMPY32US"               { yylval->mpy.first_bit_width = 32;
+                           yylval->mpy.second_bit_width = 32;
+                           yylval->mpy.first_signedness = UNSIGNED;
+                           yylval->mpy.second_signedness = SIGNED;
+                           return MPY; }
+"fMPY32SU"               { yylval->mpy.first_bit_width = 32;
+                           yylval->mpy.second_bit_width = 32;
+                           yylval->mpy.first_signedness = SIGNED;
+                           yylval->mpy.second_signedness = UNSIGNED;
+                           return MPY; }
+"fSFMPY"                 |
+"fMPY32SS"               { yylval->mpy.first_bit_width = 32;
+                           yylval->mpy.second_bit_width = 32;
+                           yylval->mpy.first_signedness = SIGNED;
+                           yylval->mpy.second_signedness = SIGNED;
+                           return MPY; }
+"fMPY3216SS"             { yylval->mpy.first_bit_width = 32;
+                           yylval->mpy.second_bit_width = 16;
+                           yylval->mpy.first_signedness = SIGNED;
+                           yylval->mpy.second_signedness = SIGNED;
+                           return MPY; }
+"fMPY3216SU"             { yylval->mpy.first_bit_width = 32;
+                           yylval->mpy.second_bit_width = 16;
+                           yylval->mpy.first_signedness = SIGNED;
+                           yylval->mpy.second_signedness = UNSIGNED;
+                           return MPY; }
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
+"(size8"[us]"_t)"        { yylval->cast.bit_width = 64;
+                           if (yytext[6] == 'u') {
+                               yylval->cast.signedness = UNSIGNED;
+                           } else {
+                               yylval->cast.signedness = SIGNED;
+                           }
+                           return CAST; }
+"(int)"                  { yylval->cast.bit_width = 32;
+                           yylval->cast.signedness = SIGNED;
+                           return CAST; }
+"(unsigned int)"         { yylval->cast.bit_width = 32;
+                           yylval->cast.signedness = UNSIGNED;
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
+"N"{LOWER_ID}            { yylval->rvalue.type = REGISTER_ARG;
+                           yylval->rvalue.reg.type = GENERAL_PURPOSE;
+                           yylval->rvalue.reg.id = yytext[1];
+                           yylval->rvalue.reg.bit_width = 32;
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.signedness = UNSIGNED;
+                           return REG; }
+"N"{LOWER_ID}"N"         { yylval->rvalue.type = REGISTER_ARG;
+                           yylval->rvalue.reg.type = DOTNEW;
+                           yylval->rvalue.reg.id = yytext[1];
+                           yylval->rvalue.reg.bit_width = 32;
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.signedness = UNSIGNED;
+                           return REG; }
+"fREAD_SP()"             |
+"SP"                     { yylval->rvalue.type = REGISTER;
+                           yylval->rvalue.reg.type = GENERAL_PURPOSE;
+                           yylval->rvalue.reg.id = HEX_REG_SP;
+                           yylval->rvalue.reg.bit_width = 32;
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.signedness = UNSIGNED;
+                           return REG; }
+"fREAD_FP()"             |
+"FP"                     { yylval->rvalue.type = REGISTER;
+                           yylval->rvalue.reg.type = GENERAL_PURPOSE;
+                           yylval->rvalue.reg.id = HEX_REG_FP;
+                           yylval->rvalue.reg.bit_width = 32;
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.signedness = UNSIGNED;
+                           return REG; }
+"fREAD_LR()"             |
+"LR"                     { yylval->rvalue.type = REGISTER;
+                           yylval->rvalue.reg.type = GENERAL_PURPOSE;
+                           yylval->rvalue.reg.id = HEX_REG_LR;
+                           yylval->rvalue.reg.bit_width = 32;
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.signedness = UNSIGNED;
+                           return REG; }
+"fREAD_GP()"             |
+"GP"                     { yylval->rvalue.type = REGISTER;
+                           yylval->rvalue.reg.type = CONTROL;
+                           yylval->rvalue.reg.id = HEX_REG_GP;
+                           yylval->rvalue.reg.bit_width = 32;
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.signedness = UNSIGNED;
+                           return REG; }
+"fREAD_LC"[01]           { yylval->rvalue.type = REGISTER;
+                           yylval->rvalue.reg.type = CONTROL;
+                           yylval->rvalue.reg.id = HEX_REG_LC0
+                                                 + (yytext[8] - '0') * 2;
+                           yylval->rvalue.reg.bit_width = 32;
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.signedness = UNSIGNED;
+                           return REG; }
+"LC"[01]                 { yylval->rvalue.type = REGISTER;
+                           yylval->rvalue.reg.type = CONTROL;
+                           yylval->rvalue.reg.id = HEX_REG_LC0
+                                                 + (yytext[2] - '0') * 2;
+                           yylval->rvalue.reg.bit_width = 32;
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.signedness = UNSIGNED;
+                           return REG; }
+"fREAD_SA"[01]           { yylval->rvalue.type = REGISTER;
+                           yylval->rvalue.reg.type = CONTROL;
+                           yylval->rvalue.reg.id = HEX_REG_SA0
+                                                 + (yytext[8] - '0') * 2;
+                           yylval->rvalue.reg.bit_width = 32;
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.signedness = UNSIGNED;
+                           return REG; }
+"SA"[01]                 { yylval->rvalue.type = REGISTER;
+                           yylval->rvalue.reg.type = CONTROL;
+                           yylval->rvalue.reg.id = HEX_REG_SA0
+                                                 + (yytext[2] - '0') * 2;
+                           yylval->rvalue.reg.bit_width = 32;
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.signedness = UNSIGNED;
+                           return REG; }
+"MuN"                    { return MUN; }
+"fREAD_P0()"             { yylval->rvalue.type = PREDICATE;
+                           yylval->rvalue.pre.id = '0';
+                           yylval->rvalue.bit_width = 32;
+                           return PRE; }
+[pP]{DIGIT}              { yylval->rvalue.type = PREDICATE;
+                           yylval->rvalue.pre.id = yytext[1];
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.is_dotnew = false;
+                           return PRE; }
+[pP]{DIGIT}[nN]          { yylval->rvalue.type = PREDICATE;
+                           yylval->rvalue.pre.id = yytext[1];
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.is_dotnew = true;
+                           return PRE; }
+"fLSBNEW"                { return LSBNEW; }
+"N"                      { yylval->rvalue.type = IMMEDIATE;
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.imm.type = VARIABLE;
+                           yylval->rvalue.imm.id = 'N';
+                           return IMM; }
+"i"                      { yylval->rvalue.type = IMMEDIATE;
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.imm.type = I;
+                           return IMM; }
+{SIGN_ID}                { if (yytext[0] == 'u') {
+                               yylval->signedness = UNSIGNED;
+                           } else {
+                               yylval->signedness = SIGNED;
+                           }
+                           return SIGN;
+                         }
+"fSF_BIAS()"             { yylval->rvalue.type = IMMEDIATE;
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.signedness = SIGNED;
+                           yylval->rvalue.imm.type = VALUE;
+                           yylval->rvalue.imm.value = 127;
+                           return IMM; }
+{DIGIT}+                 { yylval->rvalue.type = IMMEDIATE;
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.signedness = SIGNED;
+                           yylval->rvalue.imm.type = VALUE;
+                           yylval->rvalue.imm.value = atoi(yytext);
+                           return IMM; }
+{DIGIT}+"LL"             { yylval->rvalue.type = IMMEDIATE;
+                           yylval->rvalue.bit_width = 64;
+                           yylval->rvalue.signedness = SIGNED;
+                           yylval->rvalue.imm.type = VALUE;
+                           yylval->rvalue.imm.value = strtoll(yytext, NULL, 10);
+                           return IMM; }
+{DIGIT}+"ULL"            { yylval->rvalue.type = IMMEDIATE;
+                           yylval->rvalue.bit_width = 64;
+                           yylval->rvalue.signedness = UNSIGNED;
+                           yylval->rvalue.imm.type = VALUE;
+                           yylval->rvalue.imm.value = strtoull(yytext,
+                                                               NULL,
+                                                               10);
+                           return IMM; }
+"0x"{HEX_DIGIT}+         { yylval->rvalue.type = IMMEDIATE;
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.signedness = SIGNED;
+                           yylval->rvalue.imm.type = VALUE;
+                           yylval->rvalue.imm.value = strtoul(yytext, NULL, 16);
+                           return IMM; }
+"0x"{HEX_DIGIT}+"LL"     { yylval->rvalue.type = IMMEDIATE;
+                           yylval->rvalue.bit_width = 64;
+                           yylval->rvalue.signedness = SIGNED;
+                           yylval->rvalue.imm.type = VALUE;
+                           yylval->rvalue.imm.value = strtoll(yytext, NULL, 16);
+                           return IMM; }
+"0x"{HEX_DIGIT}+"ULL"    { yylval->rvalue.type = IMMEDIATE;
+                           yylval->rvalue.bit_width = 64;
+                           yylval->rvalue.signedness = UNSIGNED;
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
+                           yylval->rvalue.signedness = SIGNED;
+                           return VAR; }
+"fHINTJR(RsV)"           { /* Emit no token */ }
+.                        { return yytext[0]; }
+
+%%
diff --git a/target/hexagon/meson.build b/target/hexagon/meson.build
index a592662c1b..839f965f3c 100644
--- a/target/hexagon/meson.build
+++ b/target/hexagon/meson.build
@@ -191,4 +191,8 @@ idef_parser_input_generated_prep = custom_target(
     command: [idef_parser_dir / 'prepare', '@INPUT@', '-I' + idef_parser_dir, '-o', '@OUTPUT@'],
 )
 
+flex = generator(find_program('flex'),
+                 output: ['@BASENAME@.yy.c', '@BASENAME@.yy.h'],
+                 arguments: ['-o', '@OUTPUT0@', '--header-file=@OUTPUT1@', '@INPUT@'])
+
 target_arch += {'hexagon': hexagon_ss}
diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
index 7e6997e301..a6e593fb49 100644
--- a/tests/docker/dockerfiles/alpine.docker
+++ b/tests/docker/dockerfiles/alpine.docker
@@ -12,6 +12,7 @@ ENV PACKAGES \
 	ccache \
 	coreutils \
 	curl-dev \
+	flex \
 	g++ \
 	gcc \
 	git \
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index 46398c61ee..7d67cc2397 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -19,6 +19,7 @@ ENV PACKAGES \
     device-mapper-multipath-devel \
     diffutils \
     findutils \
+    flex \
     gcc \
     gcc-c++ \
     genisoimage \
diff --git a/tests/docker/dockerfiles/debian-amd64.docker b/tests/docker/dockerfiles/debian-amd64.docker
index ed546edcd6..cd4d8ebe9c 100644
--- a/tests/docker/dockerfiles/debian-amd64.docker
+++ b/tests/docker/dockerfiles/debian-amd64.docker
@@ -17,6 +17,7 @@ RUN apt update && \
         cscope \
         genisoimage \
         exuberant-ctags \
+        flex \
         global \
         libbz2-dev \
         liblzo2-dev \
diff --git a/tests/docker/dockerfiles/debian10.docker b/tests/docker/dockerfiles/debian10.docker
index b414af1b9f..8a0bdf39ea 100644
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
index dbb8195eb1..99b68fbd53 100644
--- a/tests/docker/dockerfiles/fedora-i386-cross.docker
+++ b/tests/docker/dockerfiles/fedora-i386-cross.docker
@@ -4,6 +4,7 @@ ENV PACKAGES \
     ccache \
     diffutils \
     findutils \
+    flex \
     gcc \
     git \
     libffi-devel.i686 \
diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/docker/dockerfiles/fedora-win32-cross.docker
index 5a03e1af43..e5116adbb3 100644
--- a/tests/docker/dockerfiles/fedora-win32-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
@@ -7,6 +7,7 @@ ENV PACKAGES \
     ccache \
     diffutils \
     findutils \
+    flex \
     gcc \
     gettext \
     git \
diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
index ff706040c4..b564811c41 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -7,6 +7,7 @@ ENV PACKAGES \
     ccache \
     diffutils \
     findutils \
+    flex \
     gcc \
     gettext \
     git \
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index eec1add7f6..e35366f33d 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -20,6 +20,7 @@ ENV PACKAGES \
     device-mapper-multipath-devel \
     diffutils \
     findutils \
+    flex \
     gcc \
     gcc-c++ \
     gcovr \
diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index 5a8bee0289..5826260fff 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -15,6 +15,7 @@ ENV PACKAGES \
     dbus-1 \
     diffutils \
     findutils \
+    flex \
     gcc \
     gcc-c++ \
     gcovr \
diff --git a/tests/docker/dockerfiles/ubuntu.docker b/tests/docker/dockerfiles/ubuntu.docker
index f0e0180d21..e1832b4ab3 100644
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
index 0880bf3e29..52dd458e31 100644
--- a/tests/docker/dockerfiles/ubuntu1804.docker
+++ b/tests/docker/dockerfiles/ubuntu1804.docker
@@ -11,6 +11,7 @@ ENV PACKAGES \
     diffutils \
     exuberant-ctags \
     findutils \
+    flex \
     g++ \
     gcc \
     gcovr \
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index 39de63d012..b3ebcffac2 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -1,5 +1,6 @@
 FROM docker.io/library/ubuntu:20.04
 ENV PACKAGES \
+    bison \
     bc \
     bsdmainutils \
     bzip2 \
@@ -11,6 +12,7 @@ ENV PACKAGES \
     diffutils \
     exuberant-ctags \
     findutils \
+    flex \
     g++ \
     gcc \
     gcovr \
-- 
2.32.0


