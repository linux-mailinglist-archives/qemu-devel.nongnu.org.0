Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFF7341A41
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 11:41:48 +0100 (CET)
Received: from localhost ([::1]:49454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNCZf-0001zF-27
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 06:41:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lNCXv-0000uW-OF
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 06:39:59 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:40943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lNCXt-00083E-Us
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 06:39:59 -0400
Received: by mail-ed1-x532.google.com with SMTP id b16so10169550eds.7
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 03:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5Xd9y8/h0n8mRP1lWzgA2xcvgwuyaQks5VOO9ScO+4k=;
 b=yyUCGPdngRxm4X9x2OLb34OLQQmaEkPJrtuBaTUeWnsQHr70PDyUYZWaHKusJpxfXz
 +2Awy6p/6Ef6KXVah2iuPn8BoWkE/e2Kfi1lBP+pNQsy8qOGBk2EO7zalYivlDtPc3UG
 KBPKhhWLnEcBKSFklt9crV55G3uZbYVaim9avaHlSejR5jAsAWuSXE/eNDc6votBSd6Z
 GmuB0L8jRdYOnYYhmb1TPfz0WXwVqtq8K24qQ5lDX48Ap2sBpq9KYeRQyEFqCXKuAq3x
 6Z7ITdtnZJObLUKMVOjM+nObg3WZ6ogcbN/I6hbGWq9b4e10+qxH59ohqBHs//6u70QT
 79SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5Xd9y8/h0n8mRP1lWzgA2xcvgwuyaQks5VOO9ScO+4k=;
 b=aiO++1AOHnwcIceRvgK4sRrMB9Jr9vyB9m06gkzThVVo1t/OtZQblmwHsGgFZyY8w2
 MavxrvQvKoBtnkJcYtha8j0mWAQZl+lo2/olJvcGPz2WmQS1aAX6G63gdHo7lIXCVZ/H
 B2vTNrmyep+azQAzARRCnheVXM7aOwHc6+gpG5qXQjofZzW30gtTj/JDuoRt7ftjaST0
 N/WPrjo3i2RY++n0eEG5T8WSEryFpavwfFpjghLieCjl9iFlatRnV1plfLJwxYPJXvBi
 bdSj3UzL1tkUHlujQGvAosR9yESqFPzUbDE59MzABPYi1HMuU6ef4yCf06rxXag+BACb
 sF+w==
X-Gm-Message-State: AOAM532cLWgxkwdIbT3YpJIE+7hq0DxCQKig8hldoyZTx+viW1bxJmrb
 B4fhxbOXS3CtifxbhhggbrCNTmVfCxoC6fCb8JFCZg==
X-Google-Smtp-Source: ABdhPJwgtHrEx/Up3jvxT676gZhyX2cf/X1qbWmWh6usapeNXOBor7sD0vTR8yQCVUnoyauj4sevA5IiMiMkuDzY6ZQ=
X-Received: by 2002:aa7:d686:: with SMTP id d6mr8860266edr.146.1616150395789; 
 Fri, 19 Mar 2021 03:39:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210311165947.27470-1-peter.maydell@linaro.org>
In-Reply-To: <20210311165947.27470-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Mar 2021 10:39:30 +0000
Message-ID: <CAFEAcA-Q2CY9CMJAgf73yeWqVCHzgH63VCgcVxvi68opHU4TZA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Make number of counters in PMCR follow the CPU
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping for review, testing, opinions on whether this should go into 6.0 ?
I think I would overall prefer it to the just-bump-PMCR_NUM_COUNTERS
patch...

thanks
-- PMM

On Thu, 11 Mar 2021 at 16:59, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Currently we give all the v7-and-up CPUs a PMU with 4 counters.  This
> means that we don't provide the 6 counters that are required by the
> Arm BSA (Base System Architecture) specification if the CPU supports
> the Virtualization extensions.
>
> Instead of having a single PMCR_NUM_COUNTERS, make each CPU type
> specify the PMCR reset value (obtained from the appropriate TRM), and
> use the 'N' field of that value to define the number of counters
> provided.
>
> This means that we now supply 6 counters for Cortex-A53, A57, A72,
> A15 and A9 as well as '-cpu max'; Cortex-A7 and A8 stay at 4; and
> Cortex-R5 goes down to 3.
>
> Note that because we now use the PMCR reset value of the specific
> implementation, we no longer set the LC bit out of reset.  This has
> an UNKNOWN value out of reset for all cores with any AArch32 support,
> so guest software should be setting it anyway if it wants it.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This is pretty much untested (I just checked Linux still boots;
> haven't tried it with KVM either). It's an alternative to
> just bumping PMCR_NUM_COUNTERS to 6.
> ---
>  target/arm/cpu.h     |  1 +
>  target/arm/cpu64.c   |  3 +++
>  target/arm/cpu_tcg.c |  5 +++++
>  target/arm/helper.c  | 29 +++++++++++++++++------------
>  target/arm/kvm64.c   |  2 ++
>  5 files changed, 28 insertions(+), 12 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 193a49ec7fa..fe68f464b3a 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -942,6 +942,7 @@ struct ARMCPU {
>          uint64_t id_aa64mmfr2;
>          uint64_t id_aa64dfr0;
>          uint64_t id_aa64dfr1;
> +        uint64_t reset_pmcr_el0;
>      } isar;
>      uint64_t midr;
>      uint32_t revidr;
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index f0a9e968c9c..5d9d56a33c3 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -141,6 +141,7 @@ static void aarch64_a57_initfn(Object *obj)
>      cpu->gic_num_lrs = 4;
>      cpu->gic_vpribits = 5;
>      cpu->gic_vprebits = 5;
> +    cpu->isar.reset_pmcr_el0 = 0x41013000;
>      define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
>  }
>
> @@ -194,6 +195,7 @@ static void aarch64_a53_initfn(Object *obj)
>      cpu->gic_num_lrs = 4;
>      cpu->gic_vpribits = 5;
>      cpu->gic_vprebits = 5;
> +    cpu->isar.reset_pmcr_el0 = 0x41033000;
>      define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
>  }
>
> @@ -245,6 +247,7 @@ static void aarch64_a72_initfn(Object *obj)
>      cpu->gic_num_lrs = 4;
>      cpu->gic_vpribits = 5;
>      cpu->gic_vprebits = 5;
> +    cpu->isar.reset_pmcr_el0 = 0x41023000;
>      define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
>  }
>
> diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
> index 046e476f65f..8252fd29f90 100644
> --- a/target/arm/cpu_tcg.c
> +++ b/target/arm/cpu_tcg.c
> @@ -301,6 +301,7 @@ static void cortex_a8_initfn(Object *obj)
>      cpu->ccsidr[1] = 0x2007e01a; /* 16k L1 icache. */
>      cpu->ccsidr[2] = 0xf0000000; /* No L2 icache. */
>      cpu->reset_auxcr = 2;
> +    cpu->isar.reset_pmcr_el0 = 0x41002000;
>      define_arm_cp_regs(cpu, cortexa8_cp_reginfo);
>  }
>
> @@ -373,6 +374,7 @@ static void cortex_a9_initfn(Object *obj)
>      cpu->clidr = (1 << 27) | (1 << 24) | 3;
>      cpu->ccsidr[0] = 0xe00fe019; /* 16k L1 dcache. */
>      cpu->ccsidr[1] = 0x200fe019; /* 16k L1 icache. */
> +    cpu->isar.reset_pmcr_el0 = 0x41093000;
>      define_arm_cp_regs(cpu, cortexa9_cp_reginfo);
>  }
>
> @@ -443,6 +445,7 @@ static void cortex_a7_initfn(Object *obj)
>      cpu->ccsidr[0] = 0x701fe00a; /* 32K L1 dcache */
>      cpu->ccsidr[1] = 0x201fe00a; /* 32K L1 icache */
>      cpu->ccsidr[2] = 0x711fe07a; /* 4096K L2 unified cache */
> +    cpu->isar.reset_pmcr_el0 = 0x41072000;
>      define_arm_cp_regs(cpu, cortexa15_cp_reginfo); /* Same as A15 */
>  }
>
> @@ -485,6 +488,7 @@ static void cortex_a15_initfn(Object *obj)
>      cpu->ccsidr[0] = 0x701fe00a; /* 32K L1 dcache */
>      cpu->ccsidr[1] = 0x201fe00a; /* 32K L1 icache */
>      cpu->ccsidr[2] = 0x711fe07a; /* 4096K L2 unified cache */
> +    cpu->isar.reset_pmcr_el0 = 0x410F3000;
>      define_arm_cp_regs(cpu, cortexa15_cp_reginfo);
>  }
>
> @@ -717,6 +721,7 @@ static void cortex_r5_initfn(Object *obj)
>      cpu->isar.id_isar6 = 0x0;
>      cpu->mp_is_up = true;
>      cpu->pmsav7_dregion = 16;
> +    cpu->isar.reset_pmcr_el0 = 0x41151800;
>      define_arm_cp_regs(cpu, cortexr5_cp_reginfo);
>  }
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 904b0927cd2..2f3867cad79 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -38,7 +38,6 @@
>  #endif
>
>  #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
> -#define PMCR_NUM_COUNTERS 4 /* QEMU IMPDEF choice */
>
>  #ifndef CONFIG_USER_ONLY
>
> @@ -1149,7 +1148,9 @@ static const ARMCPRegInfo v6_cp_reginfo[] = {
>
>  static inline uint32_t pmu_num_counters(CPUARMState *env)
>  {
> -  return (env->cp15.c9_pmcr & PMCRN_MASK) >> PMCRN_SHIFT;
> +    ARMCPU *cpu = env_archcpu(env);
> +
> +    return (cpu->isar.reset_pmcr_el0 & PMCRN_MASK) >> PMCRN_SHIFT;
>  }
>
>  /* Bits allowed to be set/cleared for PMCNTEN* and PMINTEN* */
> @@ -5753,13 +5754,6 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
>        .resetvalue = 0,
>        .writefn = gt_hyp_ctl_write, .raw_writefn = raw_write },
>  #endif
> -    /* The only field of MDCR_EL2 that has a defined architectural reset value
> -     * is MDCR_EL2.HPMN which should reset to the value of PMCR_EL0.N.
> -     */
> -    { .name = "MDCR_EL2", .state = ARM_CP_STATE_BOTH,
> -      .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 1,
> -      .access = PL2_RW, .resetvalue = PMCR_NUM_COUNTERS,
> -      .fieldoffset = offsetof(CPUARMState, cp15.mdcr_el2), },
>      { .name = "HPFAR", .state = ARM_CP_STATE_AA32,
>        .cp = 15, .opc1 = 4, .crn = 6, .crm = 0, .opc2 = 4,
>        .access = PL2_RW, .accessfn = access_el3_aa32ns,
> @@ -6689,7 +6683,7 @@ static void define_pmu_regs(ARMCPU *cpu)
>       * field as main ID register, and we implement four counters in
>       * addition to the cycle count register.
>       */
> -    unsigned int i, pmcrn = PMCR_NUM_COUNTERS;
> +    unsigned int i, pmcrn = pmu_num_counters(&cpu->env);
>      ARMCPRegInfo pmcr = {
>          .name = "PMCR", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 0,
>          .access = PL0_RW,
> @@ -6704,10 +6698,10 @@ static void define_pmu_regs(ARMCPU *cpu)
>          .access = PL0_RW, .accessfn = pmreg_access,
>          .type = ARM_CP_IO,
>          .fieldoffset = offsetof(CPUARMState, cp15.c9_pmcr),
> -        .resetvalue = (cpu->midr & 0xff000000) | (pmcrn << PMCRN_SHIFT) |
> -                      PMCRLC,
> +        .resetvalue = cpu->isar.reset_pmcr_el0,
>          .writefn = pmcr_write, .raw_writefn = raw_write,
>      };
> +
>      define_one_arm_cp_reg(cpu, &pmcr);
>      define_one_arm_cp_reg(cpu, &pmcr64);
>      for (i = 0; i < pmcrn; i++) {
> @@ -7825,6 +7819,17 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>                .fieldoffset = offsetof(CPUARMState, cp15.vmpidr_el2) },
>              REGINFO_SENTINEL
>          };
> +        /*
> +         * The only field of MDCR_EL2 that has a defined architectural reset
> +         * value is MDCR_EL2.HPMN which should reset to the value of PMCR_EL0.N.
> +         */
> +        ARMCPRegInfo mdcr_el2 = {
> +            .name = "MDCR_EL2", .state = ARM_CP_STATE_BOTH,
> +            .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 1,
> +            .access = PL2_RW, .resetvalue = pmu_num_counters(env),
> +            .fieldoffset = offsetof(CPUARMState, cp15.mdcr_el2),
> +        };
> +        define_one_arm_cp_reg(cpu, &mdcr_el2);
>          define_arm_cp_regs(cpu, vpidr_regs);
>          define_arm_cp_regs(cpu, el2_cp_reginfo);
>          if (arm_feature(env, ARM_FEATURE_V8)) {
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index dff85f6db94..581335e49d3 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -566,6 +566,8 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>                                ARM64_SYS_REG(3, 0, 0, 7, 1));
>          err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64mmfr2,
>                                ARM64_SYS_REG(3, 0, 0, 7, 2));
> +        err |= read_sys_reg64(fdarray[2], &ahcf->isar.reset_pmcr_el0,
> +                              ARM64_SYS_REG(3, 3, 9, 12, 0));
>
>          /*
>           * Note that if AArch32 support is not present in the host,
> --
> 2.20.1

