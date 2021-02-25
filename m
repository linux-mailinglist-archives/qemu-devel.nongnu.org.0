Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6251632599A
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 23:25:35 +0100 (CET)
Received: from localhost ([::1]:60670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFP4f-0001eg-Te
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 17:25:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lFP3Z-0001Ex-KD
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 17:24:25 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:40896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lFP3U-0005jz-MS
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 17:24:25 -0500
Received: by mail-pl1-x633.google.com with SMTP id z7so3990789plk.7
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 14:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dXKn+tCGcUwfJTSh35k8Xxt+xyvqKCj8DVZOdIPQ5l0=;
 b=f8iXkBgXguj06JzFYL+fwQ7rmQrZH9ILcHlqoXisfkEJG9/LFgV7d03/nBW4pQtXa5
 gvl22NVnX5bzTNyeUHlI/xAztaies4Qc0A/ZSlmtFN/HiYYTZ2bMyzSkln3bOke0oRFm
 Is82o0lwPa6ed1o1rHXkDCoPvTOThCla4xG3fgUfShBbNcphuICOeRyISppCFGFXIsas
 OSIU4ejQmOH0asnaY9cnWIm1VBk8rlmX3tbB3ljCnmGTFySBnkZnJ1+TuwQ4ZjcJSO6s
 BFhx/wxpx5rZ3R5DksMaJYj10W4VUXwhMyCzHOgPEEwIgF1Wnu/NPsdgahDYCOHnaNRI
 78iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dXKn+tCGcUwfJTSh35k8Xxt+xyvqKCj8DVZOdIPQ5l0=;
 b=OnfTOZrJu5pu0uIvOVAAHXZdVRtfAjwp/Erm8U+utAYg0vdcYIzuWxxlnkn0UJ65qE
 gu72c2XJqgwwZuFS+cWYgiC2yRJ8r0vsqpXYZnFYWe6hBogct4wupZ/OMY3dtqT/pizD
 PG6T29b/QwkPRM5TFjDFiP1i+FnrnucUC8e6Vp5cOWzPHpc9JXsuyXoGH9Dh7Ir8chtK
 LMA+2FDXFOGsWRSr8+DFQxb3SETkdz1HLweyMA7c4cNez3zrJAZkHCJ5baJ1iY/7v0ra
 JL3YjDdC18IHib8tinM+AQRDuhfCgIygYkToJb9yp+44FkRiwPgZAL9QulqQh2R2jDho
 pk0w==
X-Gm-Message-State: AOAM530xznbwWT5f9+Wtt4hFORrPNFAwx/fMfRafeoA548qAd3E3GacL
 xI1j/C3e4EbNJB6j0bDt8In3vA==
X-Google-Smtp-Source: ABdhPJyHj1X2ExAWdGeu9HCbrXfjFELVKgobFB0zTu4/8GoLTUJEELjHMGm7A/qSUI0IZd0o62OscQ==
X-Received: by 2002:a17:90a:62c1:: with SMTP id k1mr62872pjs.79.1614291858507; 
 Thu, 25 Feb 2021 14:24:18 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id x1sm2895025pje.40.2021.02.25.14.24.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Feb 2021 14:24:18 -0800 (PST)
Subject: Re: [PATCH v2 07/10] target/hexagon: import lexer for idef-parser
To: Alessandro Di Federico <ale.qemu@rev.ng>, qemu-devel@nongnu.org
References: <20210225151856.3284701-1-ale.qemu@rev.ng>
 <20210225151856.3284701-8-ale.qemu@rev.ng>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3bfa70a4-9eff-9500-185c-831e64c103f6@linaro.org>
Date: Thu, 25 Feb 2021 14:24:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210225151856.3284701-8-ale.qemu@rev.ng>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.435,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Alessandro Di Federico <ale@rev.ng>, bcain@quicinc.com, babush@rev.ng,
 tsimpson@quicinc.com, nizzo@rev.ng, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/25/21 7:18 AM, Alessandro Di Federico wrote:
> From: Paolo Montesel <babush@rev.ng>
> 
> Signed-off-by: Alessandro Di Federico <ale@rev.ng>
> Signed-off-by: Paolo Montesel <babush@rev.ng>
> ---
>  target/hexagon/idef-parser/idef-parser.h      | 245 +++++++
>  target/hexagon/idef-parser/idef-parser.lex    | 647 ++++++++++++++++++
>  target/hexagon/meson.build                    |   4 +
>  tests/docker/dockerfiles/alpine.docker        |   1 +
>  tests/docker/dockerfiles/centos7.docker       |   1 +
>  tests/docker/dockerfiles/centos8.docker       |   1 +
>  tests/docker/dockerfiles/debian10.docker      |   1 +
>  .../dockerfiles/fedora-i386-cross.docker      |   1 +
>  .../dockerfiles/fedora-win32-cross.docker     |   1 +
>  .../dockerfiles/fedora-win64-cross.docker     |   1 +
>  tests/docker/dockerfiles/fedora.docker        |   1 +
>  tests/docker/dockerfiles/opensuse-leap.docker |   1 +
>  tests/docker/dockerfiles/ubuntu.docker        |   1 +
>  tests/docker/dockerfiles/ubuntu1804.docker    |   1 +
>  tests/docker/dockerfiles/ubuntu2004.docker    |   3 +-
>  15 files changed, 909 insertions(+), 1 deletion(-)
>  create mode 100644 target/hexagon/idef-parser/idef-parser.h
>  create mode 100644 target/hexagon/idef-parser/idef-parser.lex
> 
> diff --git a/target/hexagon/idef-parser/idef-parser.h b/target/hexagon/idef-parser/idef-parser.h
> new file mode 100644
> index 0000000000..d08b9c80ea
> --- /dev/null
> +++ b/target/hexagon/idef-parser/idef-parser.h
> @@ -0,0 +1,245 @@
> +/*
> + * Copyright(c) 2019-2020 rev.ng Srls. All Rights Reserved.
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef IDEF_PARSER_H
> +#define IDEF_PARSER_H
> +
> +#include <inttypes.h>
> +#include <stdio.h>
> +#include <stdbool.h>
> +
> +#define TCGV_NAME_SIZE 7
> +#define MAX_WRITTEN_REGS 32
> +#define OFFSET_STR_LEN 32
> +#define ALLOC_LIST_LEN 32
> +#define ALLOC_NAME_SIZE 32
> +#define INIT_LIST_LEN 32
> +#define OUT_BUF_LEN (1024 * 1024)

Uh, right.  Let's not be declaring statically sized 1MB buffers, thanks.

> +#define SIGNATURE_BUF_LEN (128 * 1024)
> +#define HEADER_BUF_LEN (128 * 1024)

Nor 128k buffers.

> +/* Variadic macros to wrap the buffer printing functions */
> +#define EMIT(c, ...)                                                 \
> +    do {                                                             \
> +        (c)->out_c += snprintf((c)->out_buffer + (c)->out_c,         \
> +                               OUT_BUF_LEN - (c)->out_c,             \
> +                               __VA_ARGS__);                         \

There's nothing here that can't be better done with glib GString, with no
pre-determined buffer sizes.

E.g.

  g_string_append_printf((c)->out_str, __VA_ARGS__)

which seems simple enough to drop the macros entirely.

> +/**
> + * Semantic record of the EXTRACT token, identifying the cast operator
> + */
> +typedef struct HexExtract {
> +    int bit_width;          /**< Bit width of the extract operator           */
> +    int storage_bit_width;  /**< Actual bit width of the extract operator    */
> +    bool is_unsigned;       /**< Unsigned flag for the extract operator      */
> +} HexExtract;

All extracts begin at the lsb?

> +/**
> + * Enum of the possible rvalue types, used in the HexValue.type field
> + */
> +enum RvalueUnionTag {REGISTER, TEMP, IMMEDIATE, PREDICATE, VARID};

Typedef this.

> +    enum RvalueUnionTag type; /**< Type of the rvalue                        */

so you can drop the enum here.

> +enum OpType {ADD_OP, SUB_OP, MUL_OP, DIV_OP, ASL_OP, ASR_OP, LSR_OP, ANDB_OP,
> +             ORB_OP, XORB_OP, ANDL_OP, MINI_OP, MAXI_OP, MOD_OP};

Likewise.

> +/**
> + * Data structure including instruction specific information, to be cleared
> + * out after the compilation of each instruction
> + */
> +typedef struct Inst {
> +    char *name;                   /**< Name of the compiled instruction      */
> +    char *code_begin;             /**< Beginning of instruction input code   */
> +    char *code_end;               /**< End of instruction input code         */
> +    int tmp_count;                /**< Index of the last declared TCGv temp  */
> +    int qemu_tmp_count;           /**< Index of the last declared int temp   */
> +    int if_count;                 /**< Index of the last declared if label   */
> +    int error_count;              /**< Number of generated errors            */
> +    Var allocated[ALLOC_LIST_LEN]; /**< Allocated VARID automatic vars       */
> +    int allocated_count;          /**< Elements contained in allocated[]     */
> +    HexValue init_list[INIT_LIST_LEN]; /**< List of initialized registers    */
> +    int init_count;               /**< Number of members of init_list        */
> +} Inst;
> +
> +/**
> + * Data structure representing the whole translation context, which in a
> + * reentrant flex/bison parser just like ours is passed between the scanner
> + * and the parser, holding all the necessary information to perform the
> + * parsing, this data structure survives between the compilation of different
> + * instructions
> + *
> + */
> +typedef struct Context {
> +    void *scanner;                /**< Reentrant parser state pointer        */
> +    char *input_buffer;           /**< Buffer containing the input code      */
> +    char *out_buffer;             /**< Buffer containing the output code     */
> +    int out_c;                    /**< Characters emitted into out_buffer    */
> +    char *signature_buffer;       /**< Buffer containing the signatures code */
> +    int signature_c;              /**< Characters emitted into sig..._buffer */
> +    char *header_buffer;          /**< Buffer containing the output code     */
> +    int header_c;                 /**< Characters emitted into header buffer */
> +    FILE *defines_file;           /**< FILE * of the generated header        */
> +    FILE *output_file;            /**< FILE * of the C output file           */
> +    FILE *enabled_file;           /**< FILE * of the list of enabled inst    */
> +    int total_insn;               /**< Number of instructions in input file  */
> +    int implemented_insn;         /**< Instruction compiled without errors   */
> +    Inst inst;                  /**< Parsing data of the current inst      */
> +} Context;

I have a notion that every "char *" should be "GString *".


> +"(unsigned int)"         { /* Skip c-style casts */ }

Why is this not treated like

> +"(size8"[us]"_t)"        { yylval->cast.bit_width = 8;
> +                           yylval->cast.is_unsigned = ((yytext[6]) == 'u');
> +                           return CAST; }
> +"(size16"[us]"_t)"       { yylval->cast.bit_width = 16;
> +                           yylval->cast.is_unsigned = ((yytext[7]) == 'u');
> +                           return CAST; }
> +"(int)"                  { yylval->cast.bit_width = 32;
> +                           yylval->cast.is_unsigned = false;
> +                           return CAST; }

these?  Certainly it should be placed nearby.

> +"CANCEL"                 { return CANC; }

Any reason not to spell out CANCEL?

> +"fREAD_LC"{ZERO_ONE}     { yylval->rvalue.type = REGISTER;
> +                           yylval->rvalue.reg.type = CONTROL;
> +                           yylval->rvalue.reg.id = LC0 + atoi(yytext + 8);

Why atoi and not yytext[8] - '0'?
While we're at it, {ZERO_ONE} seems unnecessary obfuscation over [01].

> +{DIGIT}+                 { yylval->rvalue.type = IMMEDIATE;
> +                           yylval->rvalue.bit_width = 64;
> +                           yylval->rvalue.is_unsigned = false;
> +                           yylval->rvalue.imm.type = VALUE;
> +                           yylval->rvalue.imm.value = atoi(yytext);
> +                           return IMM; }
> +{DIGIT}+"LL"             { yylval->rvalue.type = IMMEDIATE;
> +                           yylval->rvalue.bit_width = 64;
> +                           yylval->rvalue.is_unsigned = false;
> +                           yylval->rvalue.imm.type = VALUE;
> +                           yylval->rvalue.imm.value = atoi(yytext);

I assume "LL" means it's supposed to be producing a 64-bit result, which atoi
will not do.  You need to be using strtoll.

> +"0x"{HEX_DIGIT}+"ULL"    { yylval->rvalue.type = IMMEDIATE;
> +                           yylval->rvalue.bit_width = 64;
> +                           yylval->rvalue.is_unsigned = true;
> +                           yylval->rvalue.imm.type = VALUE;
> +                           yylval->rvalue.imm.value = strtoul(yytext, NULL, 16);

And of course here, strtoull.

> +{VAR_ID}                 { /* Variable name, we adopt the C names convention */
> +                           yylval->rvalue.type = VARID;
> +                           yylval->rvalue.var.name = strndup(yytext,
> +                                                             ALLOC_NAME_SIZE);
> +                           /* Default types are int */
> +                           yylval->rvalue.bit_width = 32;
> +                           if (yylval->rvalue.var.name == NULL) {

This is the sort of check you need not be doing, by using the correct
functions.  In this case, g_string_new(yytext).

Glib generally asserts on memory allocation failure -- you have to explicitly
use a "*_try_*" function if you want to manage failure yourself.  Which of
course we don't.


r~

