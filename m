Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2226150BF5E
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 20:18:07 +0200 (CEST)
Received: from localhost ([::1]:43658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhxr4-0007JU-7Y
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 14:18:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1nhxI4-0008Ly-AL
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 13:41:57 -0400
Received: from rev.ng ([5.9.113.41]:51189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1nhxHz-0006AN-VX
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 13:41:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yQbvzLpwDUWHAQWHWmQ6vId8Gg8g+shRH+/exI3hdDg=; b=xQHwerNSleeKbGvT2fcsxC1v5p
 ilpSm3xakHlT795po+B0xLSTxQBe4DChyEyIcLHJyKnvQ8PVcgME8R3hq+i3FhdLRYronQfaet4SJ
 scFqGaBiz3crH2YhSFV/oDY20BWbfmrso+cPf+hCayB8M76JDejRoL+oROtFzOJ1+UP8=;
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, tsimpson@quicinc.com, bcain@quicinc.com, mlambert@quicinc.com,
 babush@rev.ng, nizzo@rev.ng, richard.henderson@linaro.org
Subject: [PATCH v9 09/12] target/hexagon: import lexer for idef-parser
Date: Fri, 22 Apr 2022 19:40:56 +0200
Message-Id: <20220422174059.4304-10-anjo@rev.ng>
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

From: Paolo Montesel <babush@rev.ng>

Signed-off-by: Alessandro Di Federico <ale@rev.ng>
Signed-off-by: Paolo Montesel <babush@rev.ng>
Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
---
 target/hexagon/idef-parser/idef-parser.h   | 253 +++++++++++
 target/hexagon/idef-parser/idef-parser.lex | 471 +++++++++++++++++++++
 target/hexagon/meson.build                 |   4 +
 3 files changed, 728 insertions(+)
 create mode 100644 target/hexagon/idef-parser/idef-parser.h
 create mode 100644 target/hexagon/idef-parser/idef-parser.lex

diff --git a/target/hexagon/idef-parser/idef-parser.h b/target/hexagon/idef-parser/idef-parser.h
new file mode 100644
index 0000000000..5c49d4da3e
--- /dev/null
+++ b/target/hexagon/idef-parser/idef-parser.h
@@ -0,0 +1,253 @@
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
+#define EMIT(c, ...)                                                           \
+    do {                                                                       \
+        g_string_append_printf((c)->out_str, __VA_ARGS__);                     \
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
+typedef enum { GENERAL_PURPOSE, CONTROL, MODIFIER, DOTNEW } HexRegType;
+
+typedef enum { UNKNOWN_SIGNEDNESS, SIGNED, UNSIGNED } HexSignedness;
+
+/**
+ * Semantic record of the REG tokens, identifying registers
+ */
+typedef struct HexReg {
+    uint8_t id;                 /**< Identifier of the register               */
+    HexRegType type;            /**< Type of the register                     */
+    unsigned bit_width;         /**< Bit width of the reg, 32 or 64 bits      */
+} HexReg;
+
+/**
+ * Data structure, identifying a TCGv temporary value
+ */
+typedef struct HexTmp {
+    unsigned index;             /**< Index of the TCGv temporary value        */
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
+        char id;                /**< Identifier, used when type is VARIABLE   */
+        uint64_t value;         /**< Immediate value, used when type is VALUE */
+        uint64_t index;         /**< Index, used when type is QEMU_TMP        */
+    };
+    enum ImmUnionTag type;      /**< Type of the immediate                    */
+} HexImm;
+
+/**
+ * Semantic record of the PRED token, identifying a predicate
+ */
+typedef struct HexPred {
+    char id;                    /**< Identifier of the predicate              */
+} HexPred;
+
+/**
+ * Semantic record of the SAT token, identifying the saturate operator
+ * Note: All saturates are assumed to implicitly set overflow.
+ */
+typedef struct HexSat {
+    HexSignedness signedness;   /**< Signedness of the sat. op.               */
+} HexSat;
+
+/**
+ * Semantic record of the CAST token, identifying the cast operator
+ */
+typedef struct HexCast {
+    unsigned bit_width;         /**< Bit width of the cast operator           */
+    HexSignedness signedness;   /**< Unsigned flag for the cast operator      */
+} HexCast;
+
+/**
+ * Semantic record of the EXTRACT token, identifying the cast operator
+ */
+typedef struct HexExtract {
+    unsigned bit_width;         /**< Bit width of the extract operator        */
+    unsigned storage_bit_width; /**< Actual bit width of the extract operator */
+    HexSignedness signedness;   /**< Unsigned flag for the extract operator   */
+} HexExtract;
+
+/**
+ * Semantic record of the MPY token, identifying the fMPY multiplication
+ * operator
+ */
+typedef struct HexMpy {
+    unsigned first_bit_width;        /**< Bit width of 1st operand of fMPY    */
+    unsigned second_bit_width;       /**< Bit width of 2nd operand of fMPY    */
+    HexSignedness first_signedness;  /**< Signedness of 1st operand of fMPY   */
+    HexSignedness second_signedness; /**< Signedness of 2nd operand of fMPY   */
+} HexMpy;
+
+/**
+ * Semantic record of the VARID token, identifying declared variables
+ * of the input language
+ */
+typedef struct HexVar {
+    GString *name;              /**< Name of the VARID variable               */
+} HexVar;
+
+/**
+ * Data structure uniquely identifying a declared VARID variable, used for
+ * keeping track of declared variable, so that any variable is declared only
+ * once, and its properties are propagated through all the subsequent instances
+ * of that variable
+ */
+typedef struct Var {
+    GString *name;              /**< Name of the VARID variable               */
+    uint8_t bit_width;          /**< Bit width of the VARID variable          */
+    HexSignedness signedness;   /**< Unsigned flag for the VARID var          */
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
+        HexReg reg;             /**< rvalue of register type                  */
+        HexTmp tmp;             /**< rvalue of temporary type                 */
+        HexImm imm;             /**< rvalue of immediate type                 */
+        HexPred pred;           /**< rvalue of predicate type                 */
+        HexVar var;             /**< rvalue of declared variable type         */
+    };
+    RvalueUnionTag type;        /**< Type of the rvalue                       */
+    unsigned bit_width;         /**< Bit width of the rvalue                  */
+    HexSignedness signedness;   /**< Unsigned flag for the rvalue             */
+    bool is_dotnew;             /**< rvalue of predicate type is dotnew?      */
+    bool is_manual;             /**< Opt out of automatic freeing of params   */
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
+    XORB_OP, ANDL_OP, MINI_OP, MAXI_OP
+} OpType;
+
+/**
+ * Data structure including instruction specific information, to be cleared
+ * out after the compilation of each instruction
+ */
+typedef struct Inst {
+    GString *name;              /**< Name of the compiled instruction         */
+    char *code_begin;           /**< Beginning of instruction input code      */
+    char *code_end;             /**< End of instruction input code            */
+    unsigned tmp_count;         /**< Index of the last declared TCGv temp     */
+    unsigned qemu_tmp_count;    /**< Index of the last declared int temp      */
+    unsigned if_count;          /**< Index of the last declared if label      */
+    unsigned error_count;       /**< Number of generated errors               */
+    GArray *allocated;          /**< Allocated declaredVARID vars             */
+    GArray *init_list;          /**< List of initialized registers            */
+    GArray *strings;            /**< Strings allocated by the instruction     */
+} Inst;
+
+/**
+ * Data structure representing the whole translation context, which in a
+ * reentrant flex/bison parser just like ours is passed between the scanner
+ * and the parser, holding all the necessary information to perform the
+ * parsing, this data structure survives between the compilation of different
+ * instructions
+ */
+typedef struct Context {
+    void *scanner;              /**< Reentrant parser state pointer           */
+    char *input_buffer;         /**< Buffer containing the input code         */
+    GString *out_str;           /**< String containing the output code        */
+    GString *signature_str;     /**< String containing the signatures code    */
+    GString *header_str;        /**< String containing the header code        */
+    FILE *defines_file;         /**< FILE * of the generated header           */
+    FILE *output_file;          /**< FILE * of the C output file              */
+    FILE *enabled_file;         /**< FILE * of the list of enabled inst       */
+    GArray *ternary;            /**< Array to track nesting of ternary ops    */
+    unsigned total_insn;        /**< Number of instructions in input file     */
+    unsigned implemented_insn;  /**< Instruction compiled without errors      */
+    Inst inst;                  /**< Parsing data of the current inst         */
+} Context;
+
+#endif /* IDEF_PARSER_H */
diff --git a/target/hexagon/idef-parser/idef-parser.lex b/target/hexagon/idef-parser/idef-parser.lex
new file mode 100644
index 0000000000..8e7508269e
--- /dev/null
+++ b/target/hexagon/idef-parser/idef-parser.lex
@@ -0,0 +1,471 @@
+%option noyywrap noinput nounput
+%option 8bit reentrant bison-bridge
+%option warn nodefault
+%option bison-locations
+
+%{
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
+PRED_ID                  d|s|t|u|v|e|x|x
+IMM_ID                   r|s|S|u|U
+VAR_ID                   [a-zA-Z_][a-zA-Z0-9_]*
+SIGN_ID                  s|u
+STRING_LIT               \"(\\.|[^"\\])*\"
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
+"in"                     { return IN; }
+"R"{REG_ID_32}"V" {
+                           yylval->rvalue.type = REGISTER_ARG;
+                           yylval->rvalue.reg.type = GENERAL_PURPOSE;
+                           yylval->rvalue.reg.id = yytext[1];
+                           yylval->rvalue.reg.bit_width = 32;
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.is_dotnew = false;
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
+"P"{PRED_ID}"V" {
+                           yylval->rvalue.type = PREDICATE;
+                           yylval->rvalue.pred.id = yytext[1];
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.is_dotnew = false;
+                           yylval->rvalue.signedness = SIGNED;
+                           return PRED; }
+"P"{PRED_ID}"N" {
+                           yylval->rvalue.type = PREDICATE;
+                           yylval->rvalue.pred.id = yytext[1];
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.is_dotnew = true;
+                           yylval->rvalue.signedness = SIGNED;
+                           return PRED; }
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
+"fSATN"                  { yylval->sat.signedness = SIGNED;
+                           return SAT; }
+"fSATUN"                 { yylval->sat.signedness = UNSIGNED;
+                           return SAT; }
+"fCONSTLL"               { yylval->cast.bit_width = 64;
+                           yylval->cast.signedness = SIGNED;
+                           return CAST; }
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
+"fCAST4_4s"              |
+"fCAST4s"                { yylval->cast.bit_width = 32;
+                           yylval->cast.signedness = SIGNED;
+                           return CAST; }
+"fCAST8_8u"              { yylval->cast.bit_width = 64;
+                           yylval->cast.signedness = UNSIGNED;
+                           return CAST; }
+"fCAST8u"                { yylval->cast.bit_width = 64;
+                           yylval->cast.signedness = UNSIGNED;
+                           return CAST; }
+"fCAST8_8s"              |
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
+"fMPY16UU"               { yylval->mpy.first_bit_width = 16;
+                           yylval->mpy.second_bit_width = 16;
+                           yylval->mpy.first_signedness = UNSIGNED;
+                           yylval->mpy.second_signedness = UNSIGNED;
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
+"fPASS"                  |
+"fECHO"                  { return IDENTITY; }
+"(size8u_t)"             { yylval->cast.bit_width = 64;
+                           yylval->cast.signedness = UNSIGNED;
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
+"fREAD_P0()"             { yylval->rvalue.type = PREDICATE;
+                           yylval->rvalue.pred.id = '0';
+                           yylval->rvalue.bit_width = 32;
+                           return PRED; }
+[pP]{DIGIT}              { yylval->rvalue.type = PREDICATE;
+                           yylval->rvalue.pred.id = yytext[1];
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.is_dotnew = false;
+                           return PRED; }
+[pP]{DIGIT}[nN]          { yylval->rvalue.type = PREDICATE;
+                           yylval->rvalue.pred.id = yytext[1];
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.is_dotnew = true;
+                           return PRED; }
+"fLSBNEW"                { return LSBNEW; }
+"N"                      { yylval->rvalue.type = IMMEDIATE;
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.imm.type = VARIABLE;
+                           yylval->rvalue.imm.id = 'N';
+                           return IMM; }
+"i"                      { yylval->rvalue.type = IMMEDIATE;
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.signedness = SIGNED;
+                           yylval->rvalue.imm.type = I;
+                           return IMM; }
+{SIGN_ID}                { if (yytext[0] == 'u') {
+                               yylval->signedness = UNSIGNED;
+                           } else {
+                               yylval->signedness = SIGNED;
+                           }
+                           return SIGN;
+                         }
+"0x"{HEX_DIGIT}+         |
+{DIGIT}+                 { yylval->rvalue.type = IMMEDIATE;
+                           yylval->rvalue.bit_width = 32;
+                           yylval->rvalue.signedness = SIGNED;
+                           yylval->rvalue.imm.type = VALUE;
+                           yylval->rvalue.imm.value = strtoull(yytext, NULL, 0);
+                           return IMM; }
+"0x"{HEX_DIGIT}+"ULL"    |
+{DIGIT}+"ULL"            { yylval->rvalue.type = IMMEDIATE;
+                           yylval->rvalue.bit_width = 64;
+                           yylval->rvalue.signedness = UNSIGNED;
+                           yylval->rvalue.imm.type = VALUE;
+                           yylval->rvalue.imm.value = strtoull(yytext, NULL, 0);
+                           return IMM; }
+"fLOAD"                  { return LOAD; }
+"fSTORE"                 { return STORE; }
+"fROTL"                  { return ROTL; }
+"fCARRY_FROM_ADD"        { return CARRY_FROM_ADD; }
+"fADDSAT64"              { return ADDSAT64; }
+"size"[1248][us]"_t"     { /* Handles "size_t" variants of int types */
+                           const unsigned int bits_per_byte = 8;
+                           const unsigned int bytes = yytext[4] - '0';
+                           yylval->rvalue.bit_width = bits_per_byte * bytes;
+                           if (yytext[5] == 'u') {
+                               yylval->rvalue.signedness = UNSIGNED;
+                           } else {
+                               yylval->rvalue.signedness = SIGNED;
+                           }
+                           return TYPE_SIZE_T; }
+"unsigned"               { return TYPE_UNSIGNED; }
+"long"                   { return TYPE_LONG; }
+"int"                    { return TYPE_INT; }
+"const"                  { /* Emit no token */ }
+{VAR_ID}                 { /* Variable name, we adopt the C names convention */
+                           yylval->rvalue.type = VARID;
+                           yylval->rvalue.var.name = g_string_new(yytext);
+                           /* Default to an unknown signedness and 0 width. */
+                           yylval->rvalue.bit_width = 0;
+                           yylval->rvalue.signedness = UNKNOWN_SIGNEDNESS;
+                           return VAR; }
+"fatal("{STRING_LIT}")"  { /* Emit no token */ }
+"fHINTJR(RsV)"           { /* Emit no token */ }
+.                        { return yytext[0]; }
+
+%%
diff --git a/target/hexagon/meson.build b/target/hexagon/meson.build
index 5945098cc4..63f13e1d21 100644
--- a/target/hexagon/meson.build
+++ b/target/hexagon/meson.build
@@ -196,4 +196,8 @@ preprocessed_idef_parser_input_generated = custom_target(
     command: [idef_parser_dir / 'prepare', '@INPUT@', '-I' + idef_parser_dir, '-o', '@OUTPUT@'],
 )
 
+flex = generator(find_program('flex'),
+                 output: ['@BASENAME@.yy.c', '@BASENAME@.yy.h'],
+                 arguments: ['-o', '@OUTPUT0@', '--header-file=@OUTPUT1@', '@INPUT@'])
+
 target_arch += {'hexagon': hexagon_ss}
-- 
2.35.1


