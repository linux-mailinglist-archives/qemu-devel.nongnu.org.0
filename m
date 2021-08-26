Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4DB3F8968
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 15:52:51 +0200 (CEST)
Received: from localhost ([::1]:56570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJFo8-0000eB-Ei
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 09:52:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFhh-0007YT-Ed
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:46:01 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:34332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFhf-0008CK-LC
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:46:01 -0400
Received: by mail-ej1-x630.google.com with SMTP id u3so6319368ejz.1
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 06:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KEC4E4LNCJ54uW1RSX/0c6cbVF12aAFz5VvWL801FqI=;
 b=E+Shgu9X2kC+w/0ls4I3pcxUX0QeXgCFwnPb1Cn/tAY4wvwnToGrme2fQ3c+INcOwP
 PWC9Mw1UJBY6ZzKEEDnGMEtbDb2bwDSfgrrEesmtvhFAVmYq6n8dVdvm41cdLW3G5KHj
 RdWBYAJlQO2oR8EqodjZMUBqlavKBP0tFMfJWcKrbUPdSEdJcS9CwtYnNIOuoddFyul+
 X64m6vtwp53O7/SAoKBSFkM0QuqifBJgv1ueg0koSKzbicP89xHxRQLtOuJPo2PzRwFR
 V2UDwklx7ifujO0A4obNwgAvRU0VfPcFAeXsj5wNHkl07zBi9Z01Drz+4r+N7gTCB7Q0
 4Mrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KEC4E4LNCJ54uW1RSX/0c6cbVF12aAFz5VvWL801FqI=;
 b=OsJDWbcgBs3P8uRn+imgD5EO7v27VcyM4PmqblpGEIbzqypsDSLdATcXsWcSqRih11
 bgx5XEWMvOMmCJ8yzDFYFQ+uRMj8lg14i5PEui4v1n98G27UCYd1c+WqcJD9saaHtxlW
 6SELXt82NbGmKuDfg7EmWN3Y57K+4gEzskDtrInjWFn/YmFuUdCwv5H1rQ80aAR3qfF+
 3spWv4B+s1zGXzPGcnRD34gyAyX6ZG5cBWZWkFg97F5FgjVp8yIVXaqw8Jcw6vz7IoY0
 BZWQe7jK3VHFoF6xB8GY8KvaLC5Jnhs9m6xhm8NblNNiHPWvgEwTYI+i/TtKAo8SphyR
 g9OA==
X-Gm-Message-State: AOAM5332S3eyV4Dn/30oEF9lV5rJroHeBrzRX8qMbDichtdt5y1xsDAS
 o9m0849zgIIPkYrb5cDpn8Kjqkl8EhxE09YNgPztsA==
X-Google-Smtp-Source: ABdhPJz4nyLPmFPv3F3PjDIkzCEtUCqcAN6FI2D8wWostPzpO1GCI9sdtNTIvPHHYY/xjwTxO1vy6EDyOkoCdC9Qfgs=
X-Received: by 2002:a17:907:923:: with SMTP id
 au3mr2192295ejc.482.1629985557446; 
 Thu, 26 Aug 2021 06:45:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210821195958.41312-1-richard.henderson@linaro.org>
 <20210821195958.41312-6-richard.henderson@linaro.org>
In-Reply-To: <20210821195958.41312-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Aug 2021 14:45:10 +0100
Message-ID: <CAFEAcA9Eg1gPuNR1DKPB8Yk1VJ=xADTEDim=jrwFN6mhVdV=Nw@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] target/arm: Take an exception if PC is misaligned
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Sat, 21 Aug 2021 at 21:00, Richard Henderson
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
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.h        |  1 +
>  target/arm/syndrome.h      |  5 +++++
>  target/arm/tlb_helper.c    | 24 +++++++++++++++++++++++
>  target/arm/translate-a64.c | 21 ++++++++++++++++++--
>  target/arm/translate.c     | 39 +++++++++++++++++++++++++++++++-------
>  5 files changed, 81 insertions(+), 9 deletions(-)
>
> diff --git a/target/arm/helper.h b/target/arm/helper.h
> index 248569b0cd..d629ee6859 100644
> --- a/target/arm/helper.h
> +++ b/target/arm/helper.h
> @@ -47,6 +47,7 @@ DEF_HELPER_FLAGS_3(sel_flags, TCG_CALL_NO_RWG_SE,
>  DEF_HELPER_2(exception_internal, void, env, i32)
>  DEF_HELPER_4(exception_with_syndrome, void, env, i32, i32, i32)
>  DEF_HELPER_2(exception_bkpt_insn, void, env, i32)
> +DEF_HELPER_2(exception_pc_alignment, noreturn, env, tl)
>  DEF_HELPER_1(setend, void, env)
>  DEF_HELPER_2(wfi, void, env, i32)
>  DEF_HELPER_1(wfe, void, env)
> diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
> index 54d135897b..e9d97fac6e 100644
> --- a/target/arm/syndrome.h
> +++ b/target/arm/syndrome.h
> @@ -275,4 +275,9 @@ static inline uint32_t syn_illegalstate(void)
>      return (EC_ILLEGALSTATE << ARM_EL_EC_SHIFT) | ARM_EL_IL;
>  }
>
> +static inline uint32_t syn_pcalignment(void)
> +{
> +    return (EC_PCALIGNMENT << ARM_EL_EC_SHIFT) | ARM_EL_IL;
> +}
> +
>  #endif /* TARGET_ARM_SYNDROME_H */
> diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
> index 3107f9823e..25c422976e 100644
> --- a/target/arm/tlb_helper.c
> +++ b/target/arm/tlb_helper.c
> @@ -9,6 +9,7 @@
>  #include "cpu.h"
>  #include "internals.h"
>  #include "exec/exec-all.h"
> +#include "exec/helper-proto.h"
>
>  static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
>                                              unsigned int target_el,
> @@ -123,6 +124,29 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
>      arm_deliver_fault(cpu, vaddr, access_type, mmu_idx, &fi);
>  }
>
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

I don't think you should need to special case AArch64 vs AArch32 like this;
you can do
   env->exception.vaddress = pc;
   env->exception.fsr = the_fsr;
   raise_exception(env, EXCP_PREFETCH_ABORT, syn_pcalignment(), target_el);

for both. AArch64/AArch32-Hyp exception entry will ignore exception.fsr,
and AArch32-not-Hyp entry will ignore exception.syndrome.

We could probably do with factoring out the
"if (something) { fsr = arm_fi_to_lfsc(&fi) }  else { fsr =
arm_fi_to_sfsc(&fi); }"
logic which we currently duplicate in arm_deliver_fault() and
do_ats_write() and arm_debug_exception_fsr() and also want here.
(NB I haven't checked these really are doing exactly the same
condition check...)


-- PMM

