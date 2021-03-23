Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C193466FE
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 18:56:59 +0100 (CET)
Received: from localhost ([::1]:56104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOlH0-0005vm-Fu
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 13:56:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <babush@rev.ng>) id 1lOkGm-0005wU-Kk
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:52:40 -0400
Received: from rev.ng ([5.9.113.41]:36785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <babush@rev.ng>) id 1lOkGg-0002OO-Ef
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:52:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
 References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=28igN4kxldyrW0tfNIGjPiHFdsj3YNiYvV0kxXVUx0Y=; b=A8v2uUIB4y4vH7+0pWyCt1FNKF
 eTSkxmDBVA9HuNldKGP6k07FEVWeek5mvX2f4KTtkbMoYI7TtLIntiEWdRBfLmy6W+paQQSY0bzoH
 qD8a9IdjqraoR3SjTwTysuU6UxBeG6mxhgEcjx3JG49JfUMv8zZVTlKf39c9IAA6ETgQ=;
Received: by mail-vk1-f169.google.com with SMTP id 11so4786760vkx.6
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 09:52:25 -0700 (PDT)
X-Gm-Message-State: AOAM531h2uJfhKFlqas/zefzhQaAtZv7zrK+NJgLXzeAf2pN3s1gjvbe
 Wc+PymuXUNWKggOi1kLWgKvprlwRrdjzWWw44g==
X-Google-Smtp-Source: ABdhPJws/7gSp1AORzxY7glkcrIPYJqcrsznv/Uh2zOzWRHte9++vTrOZHHh9F0rAMLV4PasMyZLVVKAxB0iCeXAGzc=
X-Received: by 2002:a1f:1c92:: with SMTP id c140mr4368900vkc.20.1616518339706; 
 Tue, 23 Mar 2021 09:52:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210225151856.3284701-1-ale.qemu@rev.ng>
 <20210225151856.3284701-9-ale.qemu@rev.ng>
 <d4290039-5604-62d3-c8b2-f960d5717059@linaro.org>
In-Reply-To: <d4290039-5604-62d3-c8b2-f960d5717059@linaro.org>
Date: Tue, 23 Mar 2021 17:52:08 +0100
X-Gmail-Original-Message-ID: <CALU5z=N6joYZFatrHRcBKoWqj5_X8ZhhQ=bYtCJrABLqi5XtLw@mail.gmail.com>
Message-ID: <CALU5z=N6joYZFatrHRcBKoWqj5_X8ZhhQ=bYtCJrABLqi5XtLw@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] target/hexagon: import parser for idef-parser
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Alessandro Di Federico <ale.qemu@rev.ng>, qemu-devel@nongnu.org, 
 Taylor Simpson <tsimpson@quicinc.com>, Brian Cain <bcain@quicinc.com>,
 nizzo@rev.ng, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Alessandro Di Federico <ale@rev.ng>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=5.9.113.41; envelope-from=babush@rev.ng;
 helo=rev.ng
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
Reply-to:  Paolo Montesel <babush@rev.ng>
From:  Paolo Montesel via <qemu-devel@nongnu.org>

Thanks for the feedback, it helped us improve the implementation quite a bit.

> > +| rvalue QMARK rvalue COLON rvalue
> > +{
> > +    @1.last_column = @5.last_column;
> > +    bool is_64bit = ($3.bit_width == 64) || ($5.bit_width == 64);
> > +    int bit_width = (is_64bit) ? 64 : 32;
> > +    if (is_64bit) {
> > +        $1 = rvalue_extend(c, &@1, &$1);
> > +        $3 = rvalue_extend(c, &@1, &$3);
> > +        $5 = rvalue_extend(c, &@1, &$5);
> > +    } else {
> > +        $1 = rvalue_truncate(c, &@1, &$1);
> > +    }
> > +    $1 = rvalue_materialize(c, &@1, &$1);
> > +    $3 = rvalue_materialize(c, &@1, &$3);
> > +    $5 = rvalue_materialize(c, &@1, &$5);
> > +    HexValue res = gen_local_tmp(c, &@1, bit_width);
> > +    HexValue zero = gen_tmp_value(c, &@1, "0", bit_width);
> > +    OUT(c, &@1, "tcg_gen_movcond_i", &bit_width);
> > +    OUT(c, &@1, "(TCG_COND_NE, ", &res, ", ", &$1, ", ", &zero);
>
> It would be better if you parsed conditions differently.
> Retain the two arguments and the condition, so that you can fold that into the
> movcond directly.
>
> E.g. instead of
>
>     tcg_gen_setcond_i32(cond, t, x, y)
>     tcg_gen_movcond_i32(TCG_COND_NE, dest, t, zero, src1, src2);
>
> you'd be able to do
>
>     tcg_gen_movcond_i32(cond, dest, x, y, src1, src2);
>
> This would be trivial with a non-terminal "cond", used here and with IF.  You'd
> include cond as an alternative of rvalue, which would perform the reduction to
> boolean with setcond.

This would save us from emitting some tcg ops but would increase the
complexity of the parser, which doesn't seem worth it imho.

> > +    case VALUE:
> > +        EMIT(c, "((int64_t)%" PRIu64 "ULL)", (int64_t)imm->value);
>
> Why are you using ull then casting to signed?  Just use ll.

We have a case in which we would print `-9223372036854775808LL` (64
bit integer with sign bit set) and gcc would complain with `warning:
integer constant is so large that it is unsigned`.
That's the reason for using ULL and then casting.
I'm open to other solutions.

> > +    switch (op_types) {
> > +    case IMM_IMM:
> > +    {
> > +        OUT(c, locp, "tcg_gen_movi_", bit_suffix,
> > +            "(", &res, ", ", &op1, " == ", &op2, ");\n");
> > +        break;
> > +    }
>
> Drop useless braces like this.
>
> Do you really see any IMM_IMM operations?  There are some typos in this
> section, so certainly all operators are not represented.  It might be worth
> folding all of these inside the parser, and not deferring to the C compiler, so
> that you can be certain of having a real value for any IMMEDIATE.  Which will
> help when it comes to shift below.

Maybe not for all bin ops, but we do see IMM_IMM.
I think we can't always fold IMMEDIATES, because they include "normal"
C variables (e.g.: `int32_t uiV` in function arguments) that depend on
instruction bytes at runtime.
That's true also for the IMM_IMM case.

> I'm thinking that this code could really benefit from tcg_constant_{i32,i64}.
> It produces a hashed temp that need not be freed, and it's what many of the
> tcg_gen_fooi functions use in the backend.

We can technically convert all the IMMs to tcg_constant before using
them, but since we can't constant fold in the parser that would
probably decrease performance quite a bit.

> > +static void gen_div_op(Context *c, YYLTYPE *locp, HexValue *res,
> > +                       enum OpTypes op_types, HexValue *op1, HexValue *op2)
> > +{
> > +    switch (op_types) {
> > +    case IMM_IMM:
> > +        OUT(c, locp, "int64_t ", res, " = ", op1, " / ", op2, ";\n");
> > +        break;
> > +    case IMM_REG:
> > +    case REG_IMM:
> > +    case REG_REG:
> > +        OUT(c, locp, res, " = gen_helper_divu("
> > +            "cpu_env, ", op1, ", ", op2, ");\n");
>
> Are we trusting that div-by-zero has already been tested for?

Turns out div is not even used by the instructions we currently
support (: so we can just delete this

~Paolo

