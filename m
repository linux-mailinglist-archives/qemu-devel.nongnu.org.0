Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 062DA325C69
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 05:13:44 +0100 (CET)
Received: from localhost ([::1]:56850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFUVb-0002S1-0t
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 23:13:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lFTpi-0008K3-Jz
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:30:30 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:39563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lFTpb-00058V-1Q
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:30:26 -0500
Received: by mail-pl1-x631.google.com with SMTP id k22so4564411pll.6
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 19:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=w/Mr4jZFBh9jQiK1/AZghj0nfV8wCwySKwMuMLqFu6I=;
 b=laPY7BRgXkGcTUUov8J9CejmdNsub/jSxPRfJSr3mueRNIKJkec+I+iuKWAQPd8UVC
 VdJ5egF7Ty7GKjzNcnI14zAvUtbkSnIFbB3xb7il8Z1qb7WRs9V9dMaTrYJ1nLv94iPi
 B0d4bgo4dQdZKYAMAcW4XgssXE0s2ZurKExp2VVJkIHKfbAQiWdl4Es+xrlyzMXqaw/z
 5K6ZJeECkxSd+CZMx1VMR6Ycy/V4pXj6IvQOlVFcly3nm3KRVsXs2QTp7JN3k/C28lzr
 vGL1nufELfHTV2igEBc3tg7ihp5Wsoo3RcE8QRryC2eO3p5xX5nphEibzBQi6ZzvJXz4
 W+EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w/Mr4jZFBh9jQiK1/AZghj0nfV8wCwySKwMuMLqFu6I=;
 b=c5DeJvkmvETcfei57E17302v8YAcWcKJUch1oNJsz2pvX/inPU1PD3w0+r4Yk+KgaL
 0rbOeymGHf5TSjn7ycT+oz4g2GVafADg9xdgZ7527vw3CjWOh878IfmCFeOvGfsS+57O
 win0P9TkDXaHJN7FOTXIsxCLGa7UvC1cBEkTToNFzWnyf+/pG8k0r5W8tQzO3tf01Mnk
 TRrT5uEOnj+TIIBJqktBTYkCpYB0Ht2CLQmWOuFDq7qjA7Ysdt8UgjZJYKyAG4K6BmvL
 uUWwTcDauSR/TV0i4Bix/1PFjL0vs5nrdeS+a835c2S/EPVQ23sy7EyFi7EpuAEaf1mG
 KBWw==
X-Gm-Message-State: AOAM530l2G57hBDPUkMLGSdgWtLPzWotw26cubwhnIKneu3a1PejxTzG
 f+B2hb7U9AU+dz7YKzCemN/A5Q==
X-Google-Smtp-Source: ABdhPJxoJfm1R/mT7L6HkO8K7iEjeHUgAL9UFbmVuVq7nUvkVKSBfjNBcAEfLwX8YHDTfYk5eagEjA==
X-Received: by 2002:a17:90a:4708:: with SMTP id
 h8mr1258168pjg.75.1614310216850; 
 Thu, 25 Feb 2021 19:30:16 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id x1sm7261147pgc.71.2021.02.25.19.30.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Feb 2021 19:30:16 -0800 (PST)
Subject: Re: [PATCH v2 08/10] target/hexagon: import parser for idef-parser
To: Alessandro Di Federico <ale.qemu@rev.ng>, qemu-devel@nongnu.org
References: <20210225151856.3284701-1-ale.qemu@rev.ng>
 <20210225151856.3284701-9-ale.qemu@rev.ng>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d4290039-5604-62d3-c8b2-f960d5717059@linaro.org>
Date: Thu, 25 Feb 2021 19:30:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210225151856.3284701-9-ale.qemu@rev.ng>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
> +instructions : instruction instructions
> +| %empty
> +;

I have never seen bison written flush-left like this, and I find it really hard
to read, especially with some of the larger non-terminals.

I'm also not a fan of large blocks of code within non-terminals.  IMO they
should pretty much be limited to calling a function, the result of which is
assigned to $$ as needed.

> +instruction : INAME
> +{
> +    /* Early-free if the parser failed on the previous instruction */
> +    free_instruction(c);

Surely this belongs in the error alternative.

> +    for (int i = 0; i < c->inst.init_count; i++) {
> +        bool is64 = c->inst.init_list[i].bit_width == 64;
> +        const char *type = is64 ? "i64" : "i32";

Why would you not use "i%d" in the printf format.

> +        if (c->inst.init_list[i].type == REGISTER) {
> +            OUT(c, &@1, "tcg_gen_movi_", type,
> +                "(", &(c->inst.init_list[i]), ", 0);\n");
> +        } else if (c->inst.init_list[i].type == PREDICATE) {
> +            OUT(c, &@1, "tcg_gen_movi_", type,
> +                "(", &(c->inst.init_list[i]), ", 0);\n");
> +        }

These are identical.

> +    }
> +}
> +code
> +{
> +    if (c->inst.error_count != 0) {
> +        fprintf(stderr,
> +                "Parsing of instruction %s generated %d errors!\n",
> +                c->inst.name,
> +                c->inst.error_count);
> +        EMIT(c, "assert(false && \"This instruction is not implemented!\");");

What's the point of assert(false) above abort()?

Is there any point in emitting anything at all, since I assume the idef-parser
program itself will exit with error, stopping the build process?

> +arguments : LPAR RPAR

Is there any reason you're not spelling these '(' and ')'?
The same goes for every other single-character token.

> +decl : REG
> +{
> +    emit_arg(c, &@1, &$1);
> +    /* Enqueue register into initialization list */
> +    yyassert(c, &@1, c->inst.init_count < INIT_LIST_LEN,
> +             "init_count overflow");

Use a data structure that grows.  There are plenty to choose from.

> +| pre ASSIGN rvalue
> +{
> +    @1.last_column = @3.last_column;

Do you really find any value in this column manipulation, given that the input
is not the original file, but the output of cpp?

IMO this is another reason to *not* preprocess with macros.inc, nor sed the
output as a workaround for your parsing troubles.

> +| SETBITS LPAR rvalue COMMA rvalue COMMA rvalue COMMA rvalue RPAR
> +{
> +    @1.last_column = @10.last_column;
> +    yyassert(c, &@1, $3.type == IMMEDIATE &&
> +             $3.imm.type == VALUE &&
> +             $5.type == IMMEDIATE &&
> +             $5.imm.type == VALUE,
> +             "Range deposit needs immediate values!\n");
> +    int i;
> +    $9 = rvalue_truncate(c, &@1, &$9);
> +    for (i = $5.imm.value; i <= $3.imm.value; ++i) {
> +        OUT(c, &@1, "gen_set_bit(", &i, ", ", &$7, ", ", &$9, ");\n");

A loop, really?  Surely this is just

  deposit($7, $7, -$9, $5, $3 - $5 + 1)

> +control_statement : frame_check          { /* does nothing */ }
> +| cancel_statement     { /* does nothing */ }
> +| if_statement         { /* does nothing */ }
> +| for_statement        { /* does nothing */ }
> +| fpart1_statement     { /* does nothing */ }
> +;

You can drop all the empty code blocks.

> +frame_check : FCHK LPAR rvalue COMMA rvalue RPAR SEMI  {

Do not start code blocks on the previous line like this.
What goes for our C coding style does not apply to yacc grammar.  ;-)

> +for_statement : FOR LPAR IMM ASSIGN IMM SEMI IMM LT IMM SEMI IMM PLUSPLUS RPAR
> +{
> +    @1.last_column = @13.last_column;
> +    OUT(c, &@1, "for (int ", &$3, " = ", &$5, "; ", &$7, " < ", &$9);
> +    OUT(c, &@1, "; ", &$11, "++) {\n");
> +}
> +code_block
> +{
> +    OUT(c, &@1, "}\n");
> +}
> +;
> +
> +for_statement : FOR LPAR IMM ASSIGN IMM SEMI IMM LT IMM SEMI IMM INC IMM RPAR

Why separate these productions, and not use |?

> +if_stmt : IF
> +{
> +    /* Generate an end label, if false branch to that label */
> +    OUT(c, &@1, "TCGLabel *if_label_", &c->inst.if_count,
> +        " = gen_new_label();\n");
> +}

Do you actually use the label before...

> +LPAR rvalue RPAR
> +{
> +    @1.last_column = @3.last_column;
> +    $4 = rvalue_materialize(c, &@1, &$4);
> +    const char *bit_suffix = ($4.bit_width == 64) ? "i64" : "i32";
> +    OUT(c, &@1, "tcg_gen_brcondi_", bit_suffix, "(TCG_COND_EQ, ", &$4,
> +        ", 0, if_label_", &c->inst.if_count, ");\n");

... here?  I don't see why you need to create it early.


> +rvalue : FAIL
> +{
> +    @1.last_column = @1.last_column;

Useless assignment.

> +| PC
> +{
> +    /* Read PC from the CR */
> +    $$ = gen_tmp(c, &@1, 32);
> +    OUT(c, &@1, "tcg_gen_mov_i32(", &$$, ", hex_gpr[HEX_REG_PC]);\n");
> +}
> +| NPC
> +{
> +    /* NPC is only read from CALLs, so we can hardcode it at translation time */
> +    $$ = gen_tmp(c, &@1, 32);
> +    OUT(c, &@1, "tcg_gen_movi_i32(", &$$, ", ctx->npc);\n");
> +}

If you can hardcode NPC, you can also hardcode PC.
Which makes total sense the way tcg translation works.

> +| MAX LPAR rvalue COMMA rvalue RPAR
> +{
> +    @1.last_column = @3.last_column;
> +    $$ = gen_bin_op(c, &@1, MAXI_OP, &$3, &$5);
> +}
> +| NOT rvalue
> +{
> +    @1.last_column = @2.last_column;

Why no gen_unary_op()?

> +| rvalue LSQ rvalue RSQ
> +{
> +    @1.last_column = @4.last_column;
> +    HexValue one = gen_imm_value(c, &@1, 1, $3.bit_width);
> +    HexValue tmp = gen_bin_op(c, &@1, ASR_OP, &$1, &$3);
> +    $$ = gen_bin_op(c, &@1, ANDB_OP, &tmp, &one);

Should be an extract operation, at least when $3 is immediate.

> +| rvalue QMARK rvalue COLON rvalue
> +{
> +    @1.last_column = @5.last_column;
> +    bool is_64bit = ($3.bit_width == 64) || ($5.bit_width == 64);
> +    int bit_width = (is_64bit) ? 64 : 32;
> +    if (is_64bit) {
> +        $1 = rvalue_extend(c, &@1, &$1);
> +        $3 = rvalue_extend(c, &@1, &$3);
> +        $5 = rvalue_extend(c, &@1, &$5);
> +    } else {
> +        $1 = rvalue_truncate(c, &@1, &$1);
> +    }
> +    $1 = rvalue_materialize(c, &@1, &$1);
> +    $3 = rvalue_materialize(c, &@1, &$3);
> +    $5 = rvalue_materialize(c, &@1, &$5);
> +    HexValue res = gen_local_tmp(c, &@1, bit_width);
> +    HexValue zero = gen_tmp_value(c, &@1, "0", bit_width);
> +    OUT(c, &@1, "tcg_gen_movcond_i", &bit_width);
> +    OUT(c, &@1, "(TCG_COND_NE, ", &res, ", ", &$1, ", ", &zero);

It would be better if you parsed conditions differently.
Retain the two arguments and the condition, so that you can fold that into the
movcond directly.

E.g. instead of

    tcg_gen_setcond_i32(cond, t, x, y)
    tcg_gen_movcond_i32(TCG_COND_NE, dest, t, zero, src1, src2);

you'd be able to do

    tcg_gen_movcond_i32(cond, dest, x, y, src1, src2);

This would be trivial with a non-terminal "cond", used here and with IF.  You'd
include cond as an alternative of rvalue, which would perform the reduction to
boolean with setcond.

> +| ABS rvalue
> +{
> +    @1.last_column = @2.last_column;
> +    const char *bit_suffix = ($2.bit_width == 64) ? "i64" : "i32";
> +    int bit_width = ($2.bit_width == 64) ? 64 : 32;
> +    HexValue res;
> +    res.is_unsigned = $2.is_unsigned;
> +    res.is_dotnew = false;
> +    res.is_manual = false;
> +    if ($2.type == IMMEDIATE) {
> +        res.type = IMMEDIATE;
> +        res.imm.type = QEMU_TMP;
> +        res.imm.index = c->inst.qemu_tmp_count;
> +        OUT(c, &@1, "int", &bit_width, "_t ", &res, " = abs(", &$2, ");\n");
> +        c->inst.qemu_tmp_count++;
> +        $$ = res;
> +    } else {
> +        res = gen_tmp(c, &@1, bit_width);
> +        HexValue zero = gen_tmp_value(c, &@1, "0", bit_width);
> +        OUT(c, &@1, "tcg_gen_neg_", bit_suffix, "(", &res, ", ",
> +            &$2, ");\n");
> +        OUT(c, &@1, "tcg_gen_movcond_i", &bit_width);
> +        OUT(c, &@1, "(TCG_COND_GT, ", &res, ", ", &$2, ", ", &zero);

tcg_gen_abs, surely via gen_unary_op.

> +pre : PRE
> +{
> +    $$ = $1;
> +}
> +| pre NEW

Surely PRE NEW.  You don't want PRE NEW NEW NEW to be a valid parse.

Also, I don't see NEW being generated from the lexer?  I do see
"P"{lower_pre}"N", so I suppose this production is entirely left-over, and pre
can be dropped in favor of PRE globally.

> +void tmp_print(Context *c, YYLTYPE *locp, HexTmp *tmp)
> +{
> +    EMIT(c, "tmp_");
> +    EMIT(c, "%d", tmp->index);

Merge to a single printf.

> +    case VALUE:
> +        EMIT(c, "((int64_t)%" PRIu64 "ULL)", (int64_t)imm->value);

Why are you using ull then casting to signed?  Just use ll.

> +const char *cmp_swap(Context *c, YYLTYPE *locp, const char *type)
> +{
> +    if (type == COND_EQ) {
> +        return COND_EQ;
> +    } else if (type == COND_NE) {
> +        return COND_NE;
> +    } else if (type == COND_GT) {
> +        return COND_LT;
> +    } else if (type == COND_LT) {
> +        return COND_GT;
> +    } else if (type == COND_GE) {
> +        return COND_LE;
> +    } else if (type == COND_LE) {
> +        return COND_GE;
> +    } else if (type == COND_GTU) {
> +        return COND_LTU;
> +    } else if (type == COND_LTU) {
> +        return COND_GTU;
> +    } else if (type == COND_GEU) {
> +        return COND_LEU;
> +    } else if (type == COND_LEU) {
> +        return COND_GEU;
> +    } else {
> +        yyassert(c, locp, false, "Unhandled comparison swap!");
> +        return NULL;
> +    }

Eww.  It looks like it might be worthwhile pulling out TCGCond from tcg/tcg.h
into its own file, so that you can use tcg_swap_cond(), is_unsigned_cond(), etc.

> +/* Temporary values creation */
> +static inline HexValue gen_tmp_impl(Context *c,

Drop all inline markup and let the compiler decide.

> +    switch (op_types) {
> +    case IMM_IMM:
> +    {
> +        OUT(c, locp, "tcg_gen_movi_", bit_suffix,
> +            "(", &res, ", ", &op1, " == ", &op2, ");\n");
> +        break;
> +    }

Drop useless braces like this.

Do you really see any IMM_IMM operations?  There are some typos in this
section, so certainly all operators are not represented.  It might be worth
folding all of these inside the parser, and not deferring to the C compiler, so
that you can be certain of having a real value for any IMMEDIATE.  Which will
help when it comes to shift below.

I'm thinking that this code could really benefit from tcg_constant_{i32,i64}.
It produces a hashed temp that need not be freed, and it's what many of the
tcg_gen_fooi functions use in the backend.

Then you don't need any of the complication of

> +    case IMM_REG:
> +    {
> +        HexValue swp = op2;
> +        op2 = op1;
> +        op1 = swp;
> +        /* Swap comparison direction */
> +        type = cmp_swap(c, locp, type);
> +    }
> +    /* fallthrough */
> +    case REG_IMM:
> +    {
> +        OUT(c, locp, "tcg_gen_setcondi_", bit_suffix, "(");
> +        OUT(c, locp, type, ", ", &res, ", ", &op1, ", ", &op2, ");\n");
> +        break;
> +    }

this, you'd only have

> +    case REG_REG:
> +    {
> +        OUT(c, locp, "tcg_gen_setcond_", bit_suffix, "(");
> +        OUT(c, locp, type, ", ", &res, ", ", &op1, ", ", &op2, ");\n");
> +        break;
> +    }

this.

> +static void gen_add_op(Context *c, YYLTYPE *locp, unsigned bit_width,
> +                       const char *bit_suffix, HexValue *res,
> +                       enum OpTypes op_types, HexValue *op1, HexValue *op2)

You really need a helper to avoid replication of code...

> +static void gen_sub_op(Context *c, YYLTYPE *locp, unsigned bit_width,
> +                       const char *bit_suffix, HexValue *res,
> +                       enum OpTypes op_types, HexValue *op1, HexValue *op2)
...
> +static void gen_mul_op(Context *c, YYLTYPE *locp,
> +                       const char *bit_suffix, HexValue *res,
> +                       enum OpTypes op_types, HexValue *op1, HexValue *op2)

here, and so forth.

> +static void gen_div_op(Context *c, YYLTYPE *locp, HexValue *res,
> +                       enum OpTypes op_types, HexValue *op1, HexValue *op2)
> +{
> +    switch (op_types) {
> +    case IMM_IMM:
> +        OUT(c, locp, "int64_t ", res, " = ", op1, " / ", op2, ";\n");
> +        break;
> +    case IMM_REG:
> +    case REG_IMM:
> +    case REG_REG:
> +        OUT(c, locp, res, " = gen_helper_divu("
> +            "cpu_env, ", op1, ", ", op2, ");\n");

Are we trusting that div-by-zero has already been tested for?

> +    switch (op_types) {
> +    case IMM_IMM:
> +        OUT(c, locp, "int", &bit_width, "_t ", res,
> +            " = ", &op1, " << ", &op2, ";\n");
> +        break;
> +    case REG_IMM:
> +        {
> +            /* Need to work around assert(op2 < 64) in tcg_gen_shli */
> +            if (op_is64bit) {
> +                op2 = rvalue_extend(c, locp, &op2);
> +            }
> +            op2 = rvalue_materialize(c, locp, &op2);
> +            const char *mask = op_is64bit ? "0xffffffffffffffc0"
> +                                          : "0xffffffc0";
> +            HexValue zero = gen_tmp_value(c, locp, "0", bit_width);
> +            HexValue tmp = gen_tmp(c, locp, bit_width);
> +            OUT(c, locp, "tcg_gen_andi_", bit_suffix,
> +                "(", &tmp, ", ", &op2, ", ", mask, ");\n");
> +            OUT(c, locp, "tcg_gen_movcond_i", &bit_width);
> +            OUT(c, locp, "(TCG_COND_EQ, ", &tmp, ", ", &tmp, ", ", &zero);
> +            OUT(c, locp, ", ", &op2, ", ", &zero, ");\n");
> +            OUT(c, locp, "tcg_gen_shl_", bit_suffix,
> +                "(", res, ", ", &op1, ", ", &tmp, ");\n");

Er... this is

    tmp = op2 & -64;
    tmp = tmp == 0 ? op2 : 0;
    res = op1 << tmp;

This is quite surprising semantics for an out-of-range shift.
It's also broken for 32-bit operations, where you're still checking for 64,
when 32 is more relevance.

What semantics are you actually after?

You should also recall that you have the immediate and there's little point in
generating all of this code when a simple comparison now would be sufficient.

> +    if (op_types != IMM_IMM) {
> +        /* Handle left shift by 64 which hexagon-sim expects to clear out */
> +        /* register */

Oh, I see.  Really only 64, or any out-of-range shift?  Bearing in mind that 32
is also an out-of-range shift for !op_is64bit.

> +        if (op_types == REG_REG || op_types == IMM_REG) {
> +            OUT(c, locp, "(TCG_COND_EQ, ", res, ", ", &op2, ", ", &edge);
> +        } else {
> +            OUT(c, locp, "(TCG_COND_EQ, ", res, ", ", &op2, ", ", &edge);

These are identical, and in fact the else isn't reachable.

I strongly suggest TCG_COND_GEU.

> +static void gen_asr_op(Context *c, YYLTYPE *locp, unsigned bit_width,
> +                       const char *bit_suffix, HexValue *res,
> +                       enum OpTypes op_types, HexValue *op1, HexValue *op2)
> +{
> +    switch (op_types) {
> +    case IMM_IMM:
> +        OUT(c, locp, "int", &bit_width, "_t ", res,
> +            " = ", op1, " >> ", op2, ";\n");
> +        break;
> +    case REG_IMM:
> +        OUT(c, locp, "tcg_gen_sari_", bit_suffix,
> +            "(", res, ", ", op1, ", ", op2, ");\n");
> +        break;
> +    case IMM_REG:
> +        rvalue_materialize(c, locp, op1);
> +        /* Fallthrough */
> +    case REG_REG:
> +        OUT(c, locp, "tcg_gen_sar_", bit_suffix,
> +            "(", res, ", ", op1, ", ", op2, ");\n");

No out-of-range shift problems for ASR and LSR?

> +static void gen_orb_op(Context *c, YYLTYPE *locp, unsigned bit_width,
> +                       const char *bit_suffix, HexValue *res,
> +                       enum OpTypes op_types, HexValue *op1, HexValue *op2)
> +{
> +    switch (op_types) {
> +    case IMM_IMM:
> +        OUT(c, locp, "int", &bit_width, "_t ",
> +            res, " = ", op1, " & ", op2, ";\n");

cut-and-paste error

> +static void gen_xorb_op(Context *c, YYLTYPE *locp, unsigned bit_width,
> +                        const char *bit_suffix, HexValue *res,
> +                        enum OpTypes op_types, HexValue *op1, HexValue *op2)
> +{
> +    switch (op_types) {
> +    case IMM_IMM:
> +        OUT(c, locp, "int", &bit_width, "_t ",
> +            res, " = ", op1, " & ", op2, ";\n");

and again.

> +static void gen_mini_op(Context *c, YYLTYPE *locp, unsigned bit_width,
> +                        HexValue *res, enum OpTypes op_types,
> +                        HexValue *op1_ptr, HexValue *op2_ptr)
> +{
> +    HexValue op1 = *op1_ptr;
> +    HexValue op2 = *op2_ptr;
> +    const char *comparison = res->is_unsigned
> +                             ? "TCG_COND_LEU"
> +                             : "TCG_COND_LE";

tcg_gen_smin
tcg_gen_umin

> +static void gen_maxi_op(Context *c, YYLTYPE *locp, unsigned bit_width,
> +                        HexValue *res, enum OpTypes op_types,
> +                        HexValue *op1_ptr, HexValue *op2_ptr)
> +{
> +    HexValue op1 = *op1_ptr;
> +    HexValue op2 = *op2_ptr;
> +    const char *comparison = res->is_unsigned
> +                             ? "TCG_COND_LEU"
> +                             : "TCG_COND_LE";

tcg_gen_smax
tcg_gen_umax

> +    /* Find bit width of the two operands, if at least one is 64 bit use a */
> +    /* 64bit operation, eventually extend 32bit operands. */
> +    bool op_is64bit = op1.bit_width == 64 || op2.bit_width == 64;
> +    /* Shift greater than 32 are 64 bits wide */
> +    if (type == ASL_OP && op2.type == IMMEDIATE &&
> +        op2.imm.type == VALUE && op2.imm.value >= 32)
> +        op_is64bit = true;

Ah that explains the focus on 64 above.  And reinforces that we need to have
completely evaluated op2.imm.value, and can leave none of it to the generated code.

> +HexValue gen_fbrev_4(Context *c, YYLTYPE *locp, HexValue *source)
> +{
> +    HexValue source_m = *source;
> +
> +    HexValue res = gen_tmp(c, locp, 32);
> +    HexValue tmp1 = gen_tmp(c, locp, 32);
> +    HexValue tmp2 = gen_tmp(c, locp, 32);
> +
> +    source_m = rvalue_materialize(c, locp, &source_m);
> +    source_m = rvalue_truncate(c, locp, &source_m);
> +
> +    OUT(c, locp, "tcg_gen_mov_tl(", &res, ", ", &source_m, ");\n");
> +    OUT(c, locp, "tcg_gen_andi_tl(", &tmp1, ", ", &res, ", 0xaaaaaaaa);\n");
> +    OUT(c, locp, "tcg_gen_shri_tl(", &tmp1, ", ", &tmp1, ", 1);\n");
> +    OUT(c, locp, "tcg_gen_andi_tl(", &tmp2, ", ", &res, ", 0x55555555);\n");
> +    OUT(c, locp, "tcg_gen_shli_tl(", &tmp2, ", ", &tmp2, ", 1);\n");
> +    OUT(c, locp, "tcg_gen_or_tl(", &res, ", ", &tmp1, ", ", &tmp2, ");\n");
> +    OUT(c, locp, "tcg_gen_andi_tl(", &tmp1, ", ", &res, ", 0xcccccccc);\n");
> +    OUT(c, locp, "tcg_gen_shri_tl(", &tmp1, ", ", &tmp1, ", 2);\n");
> +    OUT(c, locp, "tcg_gen_andi_tl(", &tmp2, ", ", &res, ", 0x33333333);\n");
> +    OUT(c, locp, "tcg_gen_shli_tl(", &tmp2, ", ", &tmp2, ", 2);\n");
> +    OUT(c, locp, "tcg_gen_or_tl(", &res, ", ", &tmp1, ", ", &tmp2, ");\n");
> +    OUT(c, locp, "tcg_gen_andi_tl(", &tmp1, ", ", &res, ", 0xf0f0f0f0);\n");
> +    OUT(c, locp, "tcg_gen_shri_tl(", &tmp1, ", ", &tmp1, ", 4);\n");
> +    OUT(c, locp, "tcg_gen_andi_tl(", &tmp2, ", ", &res, ", 0x0f0f0f0f);\n");
> +    OUT(c, locp, "tcg_gen_shli_tl(", &tmp2, ", ", &tmp2, ", 4);\n");
> +    OUT(c, locp, "tcg_gen_or_tl(", &res, ", ", &tmp1, ", ", &tmp2, ");\n");
> +    OUT(c, locp, "tcg_gen_andi_tl(", &tmp1, ", ", &res, ", 0xff00ff00);\n");

>From here is

> +    OUT(c, locp, "tcg_gen_shri_tl(", &tmp1, ", ", &tmp1, ", 8);\n");
> +    OUT(c, locp, "tcg_gen_andi_tl(", &tmp2, ", ", &res, ", 0x00ff00ff);\n");
> +    OUT(c, locp, "tcg_gen_shli_tl(", &tmp2, ", ", &tmp2, ", 8);\n");
> +    OUT(c, locp, "tcg_gen_or_tl(", &res, ", ", &tmp1, ", ", &tmp2, ");\n");
> +    OUT(c, locp, "tcg_gen_shri_tl(", &tmp1, ", ", &res, ", 16);\n");
> +    OUT(c, locp, "tcg_gen_shli_tl(", &tmp2, ", ", &res, ", 16);\n");
> +    OUT(c, locp, "tcg_gen_or_tl(", &res, ", ", &tmp1, ", ", &tmp2, ");\n");

tcg_gen_bswap32

But I think you should question whether you want to use a helper, especially for

> +HexValue gen_fbrev_8(Context *c, YYLTYPE *locp, HexValue *source)

this one.

> +HexValue gen_rotl(Context *c, YYLTYPE *locp, HexValue *source, HexValue *n)

tcg_gen_rotl

> +bool reg_equal(HexReg *r1, HexReg *r2)
> +{
> +    return !memcmp(r1, r2, sizeof(HexReg));
> +}

I don't see these structures being zeroed on creation, so you're relying on
there being no embedded padding.  Without the zeroing, I think you're better
off with an element-by-element compare.

> +bool rvalue_equal(HexValue *v1, HexValue *v2)
> +{
> +    if (v1->is_dotnew != v2->is_dotnew) {
> +        return false;
> +    } else if (v1->type == REGISTER && v2->type == REGISTER) {
> +        return reg_equal(&(v1->reg), &(v2->reg));
> +    } else if (v1->type == PREDICATE && v2->type == PREDICATE) {
> +        return pre_equal(&(v1->pre), &(v2->pre));
> +    } else {
> +        return false;

IMMEDIATEs are never equal?

> +void emit_header(Context *c)
> +{
> +    EMIT_SIG(c, START_COMMENT " %s " END_COMMENT "\n", c->inst.name);
> +    EMIT_SIG(c, "void emit_%s(DisasContext *ctx, Insn *insn, Packet *pkt",
> +             c->inst.name);

The comment seems redundant, given that it says nothing that the function name
does not.

> +#define OUT_IMPL(c, locp, x)                                            \
> +    do {                                                                \
> +        if (__builtin_types_compatible_p(typeof(*x), char)) {           \
> +            str_print((c), (locp), (char *) x);                         \
> +        } else if (__builtin_types_compatible_p(typeof(*x), uint64_t)) { \
> +            uint64_print((c), (locp), (uint64_t *) x);                  \
> +        } else if (__builtin_types_compatible_p(typeof(*x), int)) {     \
> +            int_print((c), (locp), (int *) x);                          \
> +        } else if (__builtin_types_compatible_p(typeof(*x), unsigned)) { \
> +            uint_print((c), (locp), (unsigned *) x);                    \
> +        } else if (__builtin_types_compatible_p(typeof(*x), HexValue)) { \
> +            rvalue_out((c), (locp), (HexValue *) x);                 \
> +        } else {                                                        \
> +            yyassert(c, locp, false, "Unhandled print type!");          \
> +        }                                                               \

FWIW, the supporting macros here are re-impleenting QEMU_GENERIC.


r~

