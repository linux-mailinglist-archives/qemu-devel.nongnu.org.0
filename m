Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A22341A81
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 11:55:59 +0100 (CET)
Received: from localhost ([::1]:40508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNCnO-0001sv-Kp
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 06:55:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1lNClu-0001AM-5A
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 06:54:26 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:42597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1lNCls-0008Hj-4w
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 06:54:25 -0400
Received: by mail-wr1-x434.google.com with SMTP id x13so8632915wrs.9
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 03:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0oxdRjuzuw9R6FB2JfcLxKEbkbYe6BeodeACDKL0jzY=;
 b=FQmkF+q7UH7UR7TVNwmJ0wQF7STR4cFQt7ERdr6RpXbaHEteSe1ayIL785lSIeRP23
 KKpYkFvfwVUaXDcAIkSEiBtTGSMtxifYMIxxTAXXmkUS8YFbuKePJ8WLm1/BJPXjee3O
 YiTo6EGnNiiQCEafzp40NV3OYweHglSkLQUP7iYbLQJo60H/4oV/eKJHw4Q9KP6YLm6U
 DoGfkjjF4mLxA+lfdy8ngTSkiTP2VB+keCEscvj/3wcetHxQRo/rP6vGXT/PFbEX3LnW
 7tML1bX9/7KTXiEDmDchCvyNAqmlPMIOjvb3d7P0O+C201a5Z0lQq0S3omA/mSiSEo4X
 cItQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=0oxdRjuzuw9R6FB2JfcLxKEbkbYe6BeodeACDKL0jzY=;
 b=NzIAPz5LfW8sAR+qnbG7dSLpoNe6ThFRTahW+wUTjr63LiJx5uvFr5ixkaYDZuCZVz
 Pf2F8Mku+ZFQ0HKWitRwRR8AzAXtX4SKi5mkDYwxPfz2UPZE3lg25fLUxJL2MB80AWRy
 LPkaekw0b5MVXPf7kkTz/spZX1B2CE5k6cVpETHL7s3jwMGtDnwpk7NSKt9Bm7y18PbD
 MLuHplq+fbujQmhD5nROeQ+gylTbPQenltM82grLm2huKberJP9ol/ccJtwlBWOLtII5
 os6YxGH4y1wz2lKYcrcRKkJWuKtaO31m7GdlIyMFFstIy5fKIwg0N8kXcX5oN99mHYwk
 KqnQ==
X-Gm-Message-State: AOAM531/6/lUhM/mYOTEBrj7IlcRnCE1Y9AmdG8oxUdTVcYJGIHNEPBA
 S//coh0QZpO0mvyFNd2HrBqauw==
X-Google-Smtp-Source: ABdhPJwxL+SFqMdNzcTwdK0osxZmBfZfXzx29a2t5LuKsk7frDqmAnBykhEGWCqmEmC0KfKZLVxzTg==
X-Received: by 2002:a5d:4e52:: with SMTP id r18mr4100572wrt.28.1616151261720; 
 Fri, 19 Mar 2021 03:54:21 -0700 (PDT)
Received: from puchatek.local (89-67-26-161.dynamic.chello.pl. [89.67.26.161])
 by smtp.gmail.com with ESMTPSA id
 u8sm7371475wrr.42.2021.03.19.03.54.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Mar 2021 03:54:20 -0700 (PDT)
Subject: Re: [PATCH] target/arm: Make number of counters in PMCR follow the CPU
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210311165947.27470-1-peter.maydell@linaro.org>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
Message-ID: <db6fc717-e233-8ce5-95fc-22a40c416623@linaro.org>
Date: Fri, 19 Mar 2021 11:54:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311165947.27470-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

W dniu 11.03.2021 o 17:59, Peter Maydell pisze:
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

I checked on A57/A72/max with sbsa-ref machine. Each of them got 7 PMU 
counters reported by both SBSA ACS and Linux 5.3 kernel.

Tested-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

> ---
> This is pretty much untested (I just checked Linux still boots;
> haven't tried it with KVM either). It's an alternative to
> just bumping PMCR_NUM_COUNTERS to 6.
> ---
>   target/arm/cpu.h     |  1 +
>   target/arm/cpu64.c   |  3 +++
>   target/arm/cpu_tcg.c |  5 +++++
>   target/arm/helper.c  | 29 +++++++++++++++++------------
>   target/arm/kvm64.c   |  2 ++
>   5 files changed, 28 insertions(+), 12 deletions(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 193a49ec7fa..fe68f464b3a 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -942,6 +942,7 @@ struct ARMCPU {
>           uint64_t id_aa64mmfr2;
>           uint64_t id_aa64dfr0;
>           uint64_t id_aa64dfr1;
> +        uint64_t reset_pmcr_el0;
>       } isar;
>       uint64_t midr;
>       uint32_t revidr;
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index f0a9e968c9c..5d9d56a33c3 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -141,6 +141,7 @@ static void aarch64_a57_initfn(Object *obj)
>       cpu->gic_num_lrs = 4;
>       cpu->gic_vpribits = 5;
>       cpu->gic_vprebits = 5;
> +    cpu->isar.reset_pmcr_el0 = 0x41013000;
>       define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
>   }
>   
> @@ -194,6 +195,7 @@ static void aarch64_a53_initfn(Object *obj)
>       cpu->gic_num_lrs = 4;
>       cpu->gic_vpribits = 5;
>       cpu->gic_vprebits = 5;
> +    cpu->isar.reset_pmcr_el0 = 0x41033000;
>       define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
>   }
>   
> @@ -245,6 +247,7 @@ static void aarch64_a72_initfn(Object *obj)
>       cpu->gic_num_lrs = 4;
>       cpu->gic_vpribits = 5;
>       cpu->gic_vprebits = 5;
> +    cpu->isar.reset_pmcr_el0 = 0x41023000;
>       define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
>   }
>   
> diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
> index 046e476f65f..8252fd29f90 100644
> --- a/target/arm/cpu_tcg.c
> +++ b/target/arm/cpu_tcg.c
> @@ -301,6 +301,7 @@ static void cortex_a8_initfn(Object *obj)
>       cpu->ccsidr[1] = 0x2007e01a; /* 16k L1 icache. */
>       cpu->ccsidr[2] = 0xf0000000; /* No L2 icache. */
>       cpu->reset_auxcr = 2;
> +    cpu->isar.reset_pmcr_el0 = 0x41002000;
>       define_arm_cp_regs(cpu, cortexa8_cp_reginfo);
>   }
>   
> @@ -373,6 +374,7 @@ static void cortex_a9_initfn(Object *obj)
>       cpu->clidr = (1 << 27) | (1 << 24) | 3;
>       cpu->ccsidr[0] = 0xe00fe019; /* 16k L1 dcache. */
>       cpu->ccsidr[1] = 0x200fe019; /* 16k L1 icache. */
> +    cpu->isar.reset_pmcr_el0 = 0x41093000;
>       define_arm_cp_regs(cpu, cortexa9_cp_reginfo);
>   }
>   
> @@ -443,6 +445,7 @@ static void cortex_a7_initfn(Object *obj)
>       cpu->ccsidr[0] = 0x701fe00a; /* 32K L1 dcache */
>       cpu->ccsidr[1] = 0x201fe00a; /* 32K L1 icache */
>       cpu->ccsidr[2] = 0x711fe07a; /* 4096K L2 unified cache */
> +    cpu->isar.reset_pmcr_el0 = 0x41072000;
>       define_arm_cp_regs(cpu, cortexa15_cp_reginfo); /* Same as A15 */
>   }
>   
> @@ -485,6 +488,7 @@ static void cortex_a15_initfn(Object *obj)
>       cpu->ccsidr[0] = 0x701fe00a; /* 32K L1 dcache */
>       cpu->ccsidr[1] = 0x201fe00a; /* 32K L1 icache */
>       cpu->ccsidr[2] = 0x711fe07a; /* 4096K L2 unified cache */
> +    cpu->isar.reset_pmcr_el0 = 0x410F3000;
>       define_arm_cp_regs(cpu, cortexa15_cp_reginfo);
>   }
>   
> @@ -717,6 +721,7 @@ static void cortex_r5_initfn(Object *obj)
>       cpu->isar.id_isar6 = 0x0;
>       cpu->mp_is_up = true;
>       cpu->pmsav7_dregion = 16;
> +    cpu->isar.reset_pmcr_el0 = 0x41151800;
>       define_arm_cp_regs(cpu, cortexr5_cp_reginfo);
>   }
>   
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 904b0927cd2..2f3867cad79 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -38,7 +38,6 @@
>   #endif
>   
>   #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
> -#define PMCR_NUM_COUNTERS 4 /* QEMU IMPDEF choice */
>   
>   #ifndef CONFIG_USER_ONLY
>   
> @@ -1149,7 +1148,9 @@ static const ARMCPRegInfo v6_cp_reginfo[] = {
>   
>   static inline uint32_t pmu_num_counters(CPUARMState *env)
>   {
> -  return (env->cp15.c9_pmcr & PMCRN_MASK) >> PMCRN_SHIFT;
> +    ARMCPU *cpu = env_archcpu(env);
> +
> +    return (cpu->isar.reset_pmcr_el0 & PMCRN_MASK) >> PMCRN_SHIFT;
>   }
>   
>   /* Bits allowed to be set/cleared for PMCNTEN* and PMINTEN* */
> @@ -5753,13 +5754,6 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
>         .resetvalue = 0,
>         .writefn = gt_hyp_ctl_write, .raw_writefn = raw_write },
>   #endif
> -    /* The only field of MDCR_EL2 that has a defined architectural reset value
> -     * is MDCR_EL2.HPMN which should reset to the value of PMCR_EL0.N.
> -     */
> -    { .name = "MDCR_EL2", .state = ARM_CP_STATE_BOTH,
> -      .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 1,
> -      .access = PL2_RW, .resetvalue = PMCR_NUM_COUNTERS,
> -      .fieldoffset = offsetof(CPUARMState, cp15.mdcr_el2), },
>       { .name = "HPFAR", .state = ARM_CP_STATE_AA32,
>         .cp = 15, .opc1 = 4, .crn = 6, .crm = 0, .opc2 = 4,
>         .access = PL2_RW, .accessfn = access_el3_aa32ns,
> @@ -6689,7 +6683,7 @@ static void define_pmu_regs(ARMCPU *cpu)
>        * field as main ID register, and we implement four counters in
>        * addition to the cycle count register.
>        */
> -    unsigned int i, pmcrn = PMCR_NUM_COUNTERS;
> +    unsigned int i, pmcrn = pmu_num_counters(&cpu->env);
>       ARMCPRegInfo pmcr = {
>           .name = "PMCR", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 0,
>           .access = PL0_RW,
> @@ -6704,10 +6698,10 @@ static void define_pmu_regs(ARMCPU *cpu)
>           .access = PL0_RW, .accessfn = pmreg_access,
>           .type = ARM_CP_IO,
>           .fieldoffset = offsetof(CPUARMState, cp15.c9_pmcr),
> -        .resetvalue = (cpu->midr & 0xff000000) | (pmcrn << PMCRN_SHIFT) |
> -                      PMCRLC,
> +        .resetvalue = cpu->isar.reset_pmcr_el0,
>           .writefn = pmcr_write, .raw_writefn = raw_write,
>       };
> +
>       define_one_arm_cp_reg(cpu, &pmcr);
>       define_one_arm_cp_reg(cpu, &pmcr64);
>       for (i = 0; i < pmcrn; i++) {
> @@ -7825,6 +7819,17 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>                 .fieldoffset = offsetof(CPUARMState, cp15.vmpidr_el2) },
>               REGINFO_SENTINEL
>           };
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
>           define_arm_cp_regs(cpu, vpidr_regs);
>           define_arm_cp_regs(cpu, el2_cp_reginfo);
>           if (arm_feature(env, ARM_FEATURE_V8)) {
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index dff85f6db94..581335e49d3 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -566,6 +566,8 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>                                 ARM64_SYS_REG(3, 0, 0, 7, 1));
>           err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64mmfr2,
>                                 ARM64_SYS_REG(3, 0, 0, 7, 2));
> +        err |= read_sys_reg64(fdarray[2], &ahcf->isar.reset_pmcr_el0,
> +                              ARM64_SYS_REG(3, 3, 9, 12, 0));
>   
>           /*
>            * Note that if AArch32 support is not present in the host,
> 


