Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 933CE3CC513
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 19:53:37 +0200 (CEST)
Received: from localhost ([::1]:45320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4oVM-0007p2-LH
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 13:53:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4oUe-00079Q-87
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 13:52:52 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:34653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4oUc-0000iQ-Ip
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 13:52:52 -0400
Received: by mail-ed1-x531.google.com with SMTP id ec55so17302348edb.1
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 10:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bo/7DHEC+Jh6hVKTn2HKVOnqGrN+r2zSsv6jF3eZXv0=;
 b=eqjgCk3qc04UoDBTH2u3SG5Ox/4I5H1KzKfU+Bp6y0PFvVjL/t86h1BDKlS98Uwy90
 oTAX6AyoTNyqlpOm4VZWFnl2Eo3tzWRNC51Wxc9XfsUgrp9mDnOG9ngc6SU14D90oMHm
 XRq0wrVQK5t6+XXiFOzE+HeFrt7LyVQpUMPpOhiokqF2GLEJFgxjHijRZaBzLL9HX2Gc
 88gTtrDC0oJ+bqfCMGj/NpP0FTDVwZQZsNVDFsay6MeLO6JvQ1/rHOzMUbow8lRky2GH
 061r+4+fOTPVgt6mZhBrUpKYo0xt/B2yXnK0qJJu+RdPdRkiFPqt4+36X1apdxp+tPAy
 Qjmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bo/7DHEC+Jh6hVKTn2HKVOnqGrN+r2zSsv6jF3eZXv0=;
 b=TxqA3OPwi1X1t8bxjqS5m6IcZYXJpL+S7tsqpJoe3CMw07R5VP56S79JuUD19VzUsm
 29cNwqhmICjCY3/rdgRAJyd/VJDE6ZDchjSD4JgP2MmY1olqQgzsXRssHsdCki4IH5dT
 8adcI1Ii8lE0LGR66WI5I/bT6s1cU8aaZDDZnnhvDVLtRmUwDu3Os0pW+F29lq7KT9cX
 hJi/PmqZRwkWl/+r1yP3xWACLwTWX2dgVVNYsqMs91vnW8RuP5/WgrBajsN3HDRfKiXy
 /QNJcDNpYazn5a+xJVuCTLlbGGrGt4L210I5hg7oDDfiZboDppa9JU38TFA6iilRTXR7
 0T9A==
X-Gm-Message-State: AOAM531Arluh+XWkzYY4tKBoK9DL56k5iXXs9yP3IotnfQj3Sr7eT4L7
 UOB1QJTO6K8kilRfNpaCk5wHwqrtA+HeuFhIikZwjw==
X-Google-Smtp-Source: ABdhPJy4H+LJZzuUJaaLswhVKletxLVmoD1au+yKatXlYieggozP17vM1kyqbSHEy4qJ+KDagFV1q0PMHHbI4MHjCxs=
X-Received: by 2002:a05:6402:697:: with SMTP id
 f23mr22833897edy.44.1626544368787; 
 Sat, 17 Jul 2021 10:52:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210712154004.1410832-1-richard.henderson@linaro.org>
 <20210712154004.1410832-9-richard.henderson@linaro.org>
In-Reply-To: <20210712154004.1410832-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 17 Jul 2021 18:52:08 +0100
Message-ID: <CAFEAcA-nOTG5tPjFKAhSG9VsQFWSjUzd_=yAKt=L8MSK_dacJQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] accel/tcg: Adjust interface of
 TranslatorOps.breakpoint_check
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 12 Jul 2021 at 16:48, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We don't need the whole CPUBreakpoint structure in the check,
> only the flags.  Return the instruction length to consolidate
> the adjustment of db->pc_next.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


> diff --git a/target/avr/translate.c b/target/avr/translate.c
> index 8237a03c23..73ff467926 100644
> --- a/target/avr/translate.c
> +++ b/target/avr/translate.c
> @@ -2944,13 +2944,13 @@ static void avr_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
>      tcg_gen_insn_start(ctx->npc);
>  }
>
> -static bool avr_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
> -                                    const CPUBreakpoint *bp)
> +static int avr_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
> +                                   int bp_flags)
>  {
>      DisasContext *ctx = container_of(dcbase, DisasContext, base);
>
>      gen_breakpoint(ctx);
> -    return true;
> +    return 2; /* minimum instruction length */

Here we weren't advancing pc_next at all, and now we do.

> diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
> index 47c967acbf..c7b9d813c2 100644
> --- a/target/mips/tcg/translate.c
> +++ b/target/mips/tcg/translate.c
> @@ -16190,22 +16190,16 @@ static void mips_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
>                         ctx->btarget);
>  }
>
> -static bool mips_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
> -                                     const CPUBreakpoint *bp)
> +static int mips_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
> +                                    int bp_flags)
>  {
>      DisasContext *ctx = container_of(dcbase, DisasContext, base);
>
>      save_cpu_state(ctx, 1);
>      ctx->base.is_jmp = DISAS_NORETURN;
>      gen_helper_raise_exception_debug(cpu_env);
> -    /*
> -     * The address covered by the breakpoint must be included in
> -     * [tb->pc, tb->pc + tb->size) in order to for it to be
> -     * properly cleared -- thus we increment the PC here so that
> -     * the logic setting tb->size below does the right thing.
> -     */
> -    ctx->base.pc_next += 4;
> -    return true;
> +
> +    return 2; /* minimum instruction length */
>  }

Here we were advancing by 4 and now advance by 2.

> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index deda0c8a44..8a6bc58572 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -961,20 +961,15 @@ static void riscv_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
>      tcg_gen_insn_start(ctx->base.pc_next);
>  }
>
> -static bool riscv_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
> -                                      const CPUBreakpoint *bp)
> +static int riscv_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
> +                                     int bp_flags)
>  {
>      DisasContext *ctx = container_of(dcbase, DisasContext, base);
>
>      tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
>      ctx->base.is_jmp = DISAS_NORETURN;
>      gen_exception_debug();
> -    /* The address covered by the breakpoint must be included in
> -       [tb->pc, tb->pc + tb->size) in order to for it to be
> -       properly cleared -- thus we increment the PC here so that
> -       the logic setting tb->size below does the right thing.  */
> -    ctx->base.pc_next += 4;
> -    return true;
> +    return 2; /* minimum instruction length */
>  }

Ditto.

If these are intentional changes (are they bugfixes?) they should be in a
separate patch.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

