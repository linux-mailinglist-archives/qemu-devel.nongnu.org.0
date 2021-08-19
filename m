Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C65CC3F1D17
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 17:41:56 +0200 (CEST)
Received: from localhost ([::1]:59728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGkB1-0003XM-KJ
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 11:41:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGk9b-0002kH-9M
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 11:40:27 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:33447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGk9Z-000800-I2
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 11:40:26 -0400
Received: by mail-ej1-x629.google.com with SMTP id x11so13944668ejv.0
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 08:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a6AUrkNyQ4+mFcptGJoA0ajzYpSJmjCuy9TebyAeWic=;
 b=J44xA3W+ZQPX8Yk2eFQbf1TeT4ZWyheuDc45/UzG9g360MOTzi0cDiSI0SqCs82IBi
 0aXXbAjYmtSo0b7o2au+G9K/xjWpEhSZpHtMKlcQuJpVPv+ibVratXoItk+lqZ8xGi8s
 SQU2PUwHweKK594O8iwBsb/45l1sEjMg99a969M5f+/lm2pmF3hDqkusdIUBBP0N+6uM
 NqwQKS3oVJtH0C9L+3ttEf5u1d565KtyHTYwOZmaFwRP6EcOL4qGMqyJmz/7VCzXnwuT
 9yDm+CqmS2RfTi/MWvT/fi4iF5kahjsTOAiqy38E0TaqWSUGDQgam3z2+PMAf4BYA9V/
 hKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a6AUrkNyQ4+mFcptGJoA0ajzYpSJmjCuy9TebyAeWic=;
 b=ukP43wghTlfmFTSKHThwPJ16vAGlxDpnoTAJ5qC8dPShLpCJ/BC7VOtkimFUhSlCBI
 6hc4aSH9DG1QAEWODN1UA17BHdJbGh7gRV7ti1yZyEORg8C+wmxDjdFvvWCnp4J0S0fr
 mduOq1bMvcdkwcgYx+L5HaVFibcKYuiKHu9SKoYP1lovRgXCdfsIFpR7mazN6Svu3CZN
 xUH3EAMvWx+b+PtbhQ4xxV8m0ZmrzgoC4L0eFcwQ65uY2Ib7gPMHug0e/64tZpWV4CD+
 16dNKotib6vg0RSBogL9U/tUSjr94Nyau7oFYhQRx1mnZSeOEipmRTXVV/P0Ru93vlet
 cwNg==
X-Gm-Message-State: AOAM530Ix+al+CtVfhIEO8Zri2VP7DUIhhNm5QWwDsijOhaVxI/qaZBA
 G/ABJQShXYViDjKVZ7J0XCKqSOGLeY5bWsc91frMnQ==
X-Google-Smtp-Source: ABdhPJyhFcd+0f5MpDxcFWEsQG2CN/keeMpIwK+DQkbDz9r+H47yJWozdXkTEnjalMwydkx5lvfekiPMVh81tki8nUM=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr16305741ejy.407.1629387621212; 
 Thu, 19 Aug 2021 08:40:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210818191920.390759-1-richard.henderson@linaro.org>
 <20210818191920.390759-10-richard.henderson@linaro.org>
In-Reply-To: <20210818191920.390759-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 16:39:35 +0100
Message-ID: <CAFEAcA9K6zHfPU0pFYUhcUmDt1mbKduj=K+4DYFV8_+5fam27Q@mail.gmail.com>
Subject: Re: [PATCH v3 09/66] target/ppc: Move SPR_DSISR setting to
 powerpc_excp
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 18 Aug 2021 at 20:24, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> By doing this while sending the exception, we will have already
> done the unwinding, which makes the ppc_cpu_do_unaligned_access
> code a bit cleaner.
>
> Update the comment about the expected instruction format.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/ppc/excp_helper.c | 21 +++++++++------------
>  1 file changed, 9 insertions(+), 12 deletions(-)
>
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index a79a0ed465..0df358f93f 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -478,13 +478,15 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
>          break;
>      }
>      case POWERPC_EXCP_ALIGN:     /* Alignment exception                      */
> -        /* Get rS/rD and rA from faulting opcode */
>          /*
> -         * Note: the opcode fields will not be set properly for a
> -         * direct store load/store, but nobody cares as nobody
> -         * actually uses direct store segments.
> +         * Get rS/rD and rA from faulting opcode.
> +         * Note: We will only invoke ALIGN for atomic operations,
> +         * so all instructions are X-form.
>           */
> -        env->spr[SPR_DSISR] |= (env->error_code & 0x03FF0000) >> 16;
> +        {
> +            uint32_t insn = cpu_ldl_code(env, env->nip);
> +            env->spr[SPR_DSISR] |= (insn & 0x03FF0000) >> 16;
> +        }
>          break;
>      case POWERPC_EXCP_PROGRAM:   /* Program exception                        */
>          switch (env->error_code & ~0xF) {
> @@ -1501,14 +1503,9 @@ void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
>                                   int mmu_idx, uintptr_t retaddr)
>  {
>      CPUPPCState *env = cs->env_ptr;
> -    uint32_t insn;
> -
> -    /* Restore state and reload the insn we executed, for filling in DSISR.  */
> -    cpu_restore_state(cs, retaddr, true);
> -    insn = cpu_ldl_code(env, env->nip);
>
>      cs->exception_index = POWERPC_EXCP_ALIGN;
> -    env->error_code = insn & 0x03FF0000;
> -    cpu_loop_exit(cs);
> +    env->error_code = 0;
> +    cpu_loop_exit_restore(cs, retaddr);

cpu_ldl_code() in the unaligned-access handler is strictly speaking
bogus, because the page might have been unmapped after translation
but before we got round to actually running it. Better would be to
stash the relevant bits of info from the insn in the insn_start param,
the way Arm does with the syndrome info.

But it's the way we currently implement this, so
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

