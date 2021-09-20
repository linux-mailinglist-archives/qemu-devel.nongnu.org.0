Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4384111AB
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 11:07:51 +0200 (CEST)
Received: from localhost ([::1]:49898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSFHC-00017f-4d
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 05:07:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSFFh-0007vi-JZ
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 05:06:17 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:41818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSFFf-0000yy-Fy
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 05:06:17 -0400
Received: by mail-wr1-x432.google.com with SMTP id w29so27557310wra.8
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 02:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XWAOERrqt8II32RW94iJfQH2Z0r2B9A+v2EpDOWpHlY=;
 b=H2NfGtFEqRGBmQaL4PNfmpfG6YVS/PtKtj0AdHEYaDck8J+K/YMfrCqpT+az260a4S
 wpn59qN4AKEVjOfNOVMxXr2ATicn9LXVuP8oo6ijqFO+e28Vdq+wdaxitd6fa4djjfhk
 xGNjUANtzNsabHQFgNdgUHOLllAfDmi7nWzFPMyKe5zzc09TBjtR8JaFGDwPjM8jDca2
 +cpQoSZ8JTksJcP2SGKZ21IgLyz58gjvuIOLdw+5M2iat0Kj51MMTrko02IoY+8dSXut
 mxWujGI8dSSOvJR7eYfkNR/xHWB2a1hncAIfXPoLx1LrjoiEUaBsWEuWtU7LDIYZhPot
 T9hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XWAOERrqt8II32RW94iJfQH2Z0r2B9A+v2EpDOWpHlY=;
 b=JHWS72knbvUNeQGVbukZfL2gzwUYqaWKlx/um8fYNQfYdwyDQCpFQXD3eGtiPTgWeN
 so0hf8GvEoS2iEmy5akxoLdY1OieWpuIik2xKCvjk9gJfVOjAsIGbfSLnDzkGSNhcFQw
 5S3kRZGvAIiUbaO7ssJ14l3Phcnxj1xRjC3l0h7nJXkwOCRZwEaC8zYECwXHHaZaFbl/
 0jGOlbNR+ph8prFD7RUvjMWieIPiEg4exnw3WnVKyBM9TeJLdXT7WoPPjsFCLIuVXjNm
 DYG7VOu9q6tIzuWOpYxB9BPqGfOt+JIql7zzNq99sXgQgcZBlsq04ziFGbPr2Yq4xbc6
 4tug==
X-Gm-Message-State: AOAM533SEhvQ9/SDPuTiGNhDunEFD0fp28XivrVmG6T3go3n3+IeF7df
 T3aX9unZnZ52+tRVX+Y+Sru4lDaDSjH8Qf0fbMTUAQ==
X-Google-Smtp-Source: ABdhPJyz/iJouhotCKuE7MixsBz3vUg/fXlz+h8zYc5WId1gUlZjHrc/tvbiRpPO1MsppO5kkoKT6rlsUSZrVFgoWj0=
X-Received: by 2002:adf:f185:: with SMTP id h5mr27539771wro.302.1632128773725; 
 Mon, 20 Sep 2021 02:06:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210920024504.625965-1-richard.henderson@linaro.org>
 <20210920024504.625965-4-richard.henderson@linaro.org>
In-Reply-To: <20210920024504.625965-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Sep 2021 10:05:21 +0100
Message-ID: <CAFEAcA_NPSnXQYTNcT56xs-37gys-biF-Ra8sbXzmRkmwR34Dg@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] target/arm: Take an exception if PC is misaligned
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 20 Sept 2021 at 03:48, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> For A64, any input to an indirect branch can cause this.
>
> For A32, many indirect branch paths force the branch to be aligned,
> but BXWritePC does not.  This includes the BX instruction but also
> other interworking changes to PC.  Prior to v8, this case is UNDEFINED.
> With v8, this is CONSTRAINED UNPREDICTABLE and may either raise an
> exception or force align the PC.
>
> We choose to raise an exception because we have the infrastructure,
> it makes the generated code for gen_bx simpler, and it has the
> possibility of catching more guest bugs.

> +void helper_exception_pc_alignment(CPUARMState *env, target_ulong pc)
> +{
> +    int target_el = exception_target_el(env);
> +
> +    if (target_el == 2 || arm_el_is_aa64(env, target_el)) {
> +        /*
> +         * To aarch64 and aarch32 el2, pc alignment has a
> +         * special exception class.
> +         */
> +        env->exception.vaddress = pc;
> +        env->exception.fsr = 0;
> +        raise_exception(env, EXCP_PREFETCH_ABORT, syn_pcalignment(), target_el);
> +    } else {
> +        /*
> +         * To aarch32 el1, pc alignment is like data alignment
> +         * except with a prefetch abort.
> +         */
> +        ARMMMUFaultInfo fi = { .type = ARMFault_Alignment };
> +        arm_deliver_fault(env_archcpu(env), pc, MMU_INST_FETCH,
> +                          cpu_mmu_index(env, true), &fi);
> +    }

I still don't believe that you need to special case AArch32-non-Hyp
like this. Can you expand on what you think the difference is?

> +}
> +
>  #if !defined(CONFIG_USER_ONLY)
>
>  /*
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index ab6b346e35..8c72e37de3 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -14752,8 +14752,10 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>  {
>      DisasContext *s = container_of(dcbase, DisasContext, base);
>      CPUARMState *env = cpu->env_ptr;
> +    uint64_t pc = s->base.pc_next;
>      uint32_t insn;
>
> +    /* Singlestep exceptions have the highest priority. */
>      if (s->ss_active && !s->pstate_ss) {
>          /* Singlestep state is Active-pending.
>           * If we're in this state at the start of a TB then either
> @@ -14768,13 +14770,28 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>          assert(s->base.num_insns == 1);
>          gen_swstep_exception(s, 0, 0);
>          s->base.is_jmp = DISAS_NORETURN;
> +        s->base.pc_next = pc + 4;

Why are we adding this in this patch? Isn't this a separate
bugfix ?

>          return;
>      }

thanks
-- PMM

