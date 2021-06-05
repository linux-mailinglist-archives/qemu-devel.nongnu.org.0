Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4039639C61C
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 07:57:33 +0200 (CEST)
Received: from localhost ([::1]:36648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpPJL-0000xj-NU
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 01:57:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpPIS-0008WC-GV
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 01:56:36 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:41684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpPIN-0005N5-S6
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 01:56:36 -0400
Received: by mail-pg1-x529.google.com with SMTP id r1so9520731pgk.8
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 22:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=t+F3/w2ZSsY50n+05+z/MHApg32YL31VuVl7CMIxHvc=;
 b=yoZ3JAQZ3guMGgnXpEof83iYy1G8HSaR3svzJuMoscN/M8ESgThsDEY7fCMFog3FMz
 12xHINQOcNxOQm/CcRsGuyjYoToNSbj0zw0gNC0ooDrXG0UfIaUDW1pjxyT2vR7BmANp
 +DQn+QZE2IM3xG8UBiVp1T5BjKYXQMG59zJn/uoq5KNkk+DXNIJDyIgl2o7jhFIZdnls
 JSTQOLY0jWhPyDUFE8TJ+FSl6h9WGbLT6AOh0Kg9mlRU5/3SskZ9zOGNbtUeF0hrsamZ
 c6XXIbgE7Ozf3x5kAFcnd/gynHep/mSgGc7CM4yH0HwVp0SrV9cNPh2nxmnbKCUoxhYj
 K1bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=t+F3/w2ZSsY50n+05+z/MHApg32YL31VuVl7CMIxHvc=;
 b=ZRVUtrNrtN8CK+ocSv1anEHwDwYETXQ27ZrHsdgXt95oMsW0vBTCAmH13ZrgFtHl+/
 fjgwQk71c2vWjYT/Q9Qqqsf0Xk3Y2cirvbGn5CQpabNa4I9rmokHQMmtDyK9R86kJhT6
 rfmk0vzz3OHHi7pZ9IeuxEikIglVnbmDRpA79hKKwS2K5+fWVhp6ctRblat9dcg+Kmim
 R+7m3VM+hOcMYvmPkGbJUwfncIObImCoIk1GaZaZTi1dk1icyw4iWbkI9+2OQErwUKD9
 M6/LsZXEPEVZGzi4adt/JXVE/MutxVqSpapJqI9sA2fXgDqKpyQK6UiBQB4nI+ZZY0fr
 eETg==
X-Gm-Message-State: AOAM533Re68JoeuiMijnN8UzD1pHJCaYZ1ZXjou+86F0zAGs3WaK2cV/
 bmduAHTKy3T7tyNADlkNOaFitw==
X-Google-Smtp-Source: ABdhPJyvSWh7Z+eMGS57M9tfYr0TwBbZHYwwEEovGsrQu4s4gXwLHqMM0zk6LuAJu6evc5eoNzCoNw==
X-Received: by 2002:a62:ab16:0:b029:2ed:8599:7df8 with SMTP id
 p22-20020a62ab160000b02902ed85997df8mr359690pff.31.1622872589331; 
 Fri, 04 Jun 2021 22:56:29 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 c21sm3114530pfi.44.2021.06.04.22.56.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 22:56:28 -0700 (PDT)
Subject: Re: [PATCH v16 51/99] target/arm: move exception code out of
 tcg/helper.c
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-52-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9c9d6785-9411-e901-d7d7-f1fc9cac8768@linaro.org>
Date: Fri, 4 Jun 2021 22:56:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-52-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URI_NOVOWEL=0.5 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana <cfontana@suse.de>
> 
> cpu-sysemu.c:
> 
> we need this sysemu code for KVM too, so we move the code to
> cpu-sysemu.c so we can reach a builable state.
> 
> There will be further split later on in dedicated
> exception modules for 32 and 64bit, after we make more
> necessary changes to be able to split TARGET_AARCH64-only code.
> 
> tcg/sysemu/tcg-cpu.c:
> 
> the TCG-specific code we put in tcg/sysemu/, in preparation
> for the addition of the tcg-cpu accel-cpu ARM subclass.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   target/arm/tcg/tcg-cpu.h          |  31 ++
>   target/arm/cpu-sysemu.c           | 670 +++++++++++++++++++++++++++
>   target/arm/tcg/helper.c           | 734 ------------------------------
>   target/arm/tcg/sysemu/tcg-cpu.c   |  73 +++
>   target/arm/tcg/sysemu/meson.build |   1 +
>   5 files changed, 775 insertions(+), 734 deletions(-)
>   create mode 100644 target/arm/tcg/tcg-cpu.h
>   create mode 100644 target/arm/tcg/sysemu/tcg-cpu.c
> 
> diff --git a/target/arm/tcg/tcg-cpu.h b/target/arm/tcg/tcg-cpu.h
> new file mode 100644
> index 0000000000..0ee8ba073b
> --- /dev/null
> +++ b/target/arm/tcg/tcg-cpu.h
> @@ -0,0 +1,31 @@
> +/*
> + * QEMU ARM CPU
> + *
> + * Copyright (c) 2012 SUSE LINUX Products GmbH
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version 2
> + * of the License, or (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, see
> + * <http://www.gnu.org/licenses/gpl-2.0.html>
> + */
> +#ifndef ARM_TCG_CPU_H
> +#define ARM_TCG_CPU_H
> +
> +#include "cpu.h"

I presume there's something later that requires this include?

> +
> +#ifndef CONFIG_USER_ONLY
> +/* Do semihosting call and set the appropriate return value. */
> +void handle_semihosting(CPUState *cs);

... because at present this typedef is already present, via "qemu/typedefs.h" 
via "qemu/osdep.h", which is always included first.

r`




> +
> +#endif /* !CONFIG_USER_ONLY */
> +
> +#endif /* ARM_TCG_CPU_H */
> diff --git a/target/arm/cpu-sysemu.c b/target/arm/cpu-sysemu.c
> index 0d80a0161c..0e872b2e55 100644
> --- a/target/arm/cpu-sysemu.c
> +++ b/target/arm/cpu-sysemu.c
> @@ -19,10 +19,14 @@
>    */
>   
>   #include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "qemu/main-loop.h"
>   #include "cpu.h"
>   #include "internals.h"
>   #include "sysemu/hw_accel.h"
>   #include "kvm_arm.h"
> +#include "sysemu/tcg.h"
> +#include "tcg/tcg-cpu.h"
>   
>   void arm_cpu_set_irq(void *opaque, int irq, int level)
>   {
> @@ -508,3 +512,669 @@ int fp_exception_el(CPUARMState *env, int cur_el)
>       }
>       return 0;
>   }
> +
> +static void take_aarch32_exception(CPUARMState *env, int new_mode,
> +                                   uint32_t mask, uint32_t offset,
> +                                   uint32_t newpc)
> +{
> +    int new_el;
> +
> +    /* Change the CPU state so as to actually take the exception. */
> +    switch_mode(env, new_mode);
> +
> +    /*
> +     * For exceptions taken to AArch32 we must clear the SS bit in both
> +     * PSTATE and in the old-state value we save to SPSR_<mode>, so zero it now.
> +     */
> +    env->pstate &= ~PSTATE_SS;
> +    env->spsr = cpsr_read(env);
> +    /* Clear IT bits.  */
> +    env->condexec_bits = 0;
> +    /* Switch to the new mode, and to the correct instruction set.  */
> +    env->uncached_cpsr = (env->uncached_cpsr & ~CPSR_M) | new_mode;
> +
> +    /* This must be after mode switching. */
> +    new_el = arm_current_el(env);
> +
> +    /* Set new mode endianness */
> +    env->uncached_cpsr &= ~CPSR_E;
> +    if (env->cp15.sctlr_el[new_el] & SCTLR_EE) {
> +        env->uncached_cpsr |= CPSR_E;
> +    }
> +    /* J and IL must always be cleared for exception entry */
> +    env->uncached_cpsr &= ~(CPSR_IL | CPSR_J);
> +    env->daif |= mask;
> +
> +    if (new_mode == ARM_CPU_MODE_HYP) {
> +        env->thumb = (env->cp15.sctlr_el[2] & SCTLR_TE) != 0;
> +        env->elr_el[2] = env->regs[15];
> +    } else {
> +        /* CPSR.PAN is normally preserved preserved unless...  */
> +        if (cpu_isar_feature(aa32_pan, env_archcpu(env))) {
> +            switch (new_el) {
> +            case 3:
> +                if (!arm_is_secure_below_el3(env)) {
> +                    /* ... the target is EL3, from non-secure state.  */
> +                    env->uncached_cpsr &= ~CPSR_PAN;
> +                    break;
> +                }
> +                /* ... the target is EL3, from secure state ... */
> +                /* fall through */
> +            case 1:
> +                /* ... the target is EL1 and SCTLR.SPAN is 0.  */
> +                if (!(env->cp15.sctlr_el[new_el] & SCTLR_SPAN)) {
> +                    env->uncached_cpsr |= CPSR_PAN;
> +                }
> +                break;
> +            }
> +        }
> +        /*
> +         * this is a lie, as there was no c1_sys on V4T/V5, but who cares
> +         * and we should just guard the thumb mode on V4
> +         */
> +        if (arm_feature(env, ARM_FEATURE_V4T)) {
> +            env->thumb =
> +                (A32_BANKED_CURRENT_REG_GET(env, sctlr) & SCTLR_TE) != 0;
> +        }
> +        env->regs[14] = env->regs[15] + offset;
> +    }
> +    env->regs[15] = newpc;
> +    if (tcg_enabled()) {
> +        arm_rebuild_hflags(env);
> +    }
> +}
> +
> +static void arm_cpu_do_interrupt_aarch32_hyp(CPUState *cs)
> +{
> +    /*
> +     * Handle exception entry to Hyp mode; this is sufficiently
> +     * different to entry to other AArch32 modes that we handle it
> +     * separately here.
> +     *
> +     * The vector table entry used is always the 0x14 Hyp mode entry point,
> +     * unless this is an UNDEF/HVC/abort taken from Hyp to Hyp.
> +     * The offset applied to the preferred return address is always zero
> +     * (see DDI0487C.a section G1.12.3).
> +     * PSTATE A/I/F masks are set based only on the SCR.EA/IRQ/FIQ values.
> +     */
> +    uint32_t addr, mask;
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    CPUARMState *env = &cpu->env;
> +
> +    switch (cs->exception_index) {
> +    case EXCP_UDEF:
> +        addr = 0x04;
> +        break;
> +    case EXCP_SWI:
> +        addr = 0x14;
> +        break;
> +    case EXCP_BKPT:
> +        /* Fall through to prefetch abort.  */
> +    case EXCP_PREFETCH_ABORT:
> +        env->cp15.ifar_s = env->exception.vaddress;
> +        qemu_log_mask(CPU_LOG_INT, "...with HIFAR 0x%x\n",
> +                      (uint32_t)env->exception.vaddress);
> +        addr = 0x0c;
> +        break;
> +    case EXCP_DATA_ABORT:
> +        env->cp15.dfar_s = env->exception.vaddress;
> +        qemu_log_mask(CPU_LOG_INT, "...with HDFAR 0x%x\n",
> +                      (uint32_t)env->exception.vaddress);
> +        addr = 0x10;
> +        break;
> +    case EXCP_IRQ:
> +        addr = 0x18;
> +        break;
> +    case EXCP_FIQ:
> +        addr = 0x1c;
> +        break;
> +    case EXCP_HVC:
> +        addr = 0x08;
> +        break;
> +    case EXCP_HYP_TRAP:
> +        addr = 0x14;
> +        break;
> +    default:
> +        cpu_abort(cs, "Unhandled exception 0x%x\n", cs->exception_index);
> +    }
> +
> +    if (cs->exception_index != EXCP_IRQ && cs->exception_index != EXCP_FIQ) {
> +        if (!arm_feature(env, ARM_FEATURE_V8)) {
> +            /*
> +             * QEMU syndrome values are v8-style. v7 has the IL bit
> +             * UNK/SBZP for "field not valid" cases, where v8 uses RES1.
> +             * If this is a v7 CPU, squash the IL bit in those cases.
> +             */
> +            if (cs->exception_index == EXCP_PREFETCH_ABORT ||
> +                (cs->exception_index == EXCP_DATA_ABORT &&
> +                 !(env->exception.syndrome & ARM_EL_ISV)) ||
> +                syn_get_ec(env->exception.syndrome) == EC_UNCATEGORIZED) {
> +                env->exception.syndrome &= ~ARM_EL_IL;
> +            }
> +        }
> +        env->cp15.esr_el[2] = env->exception.syndrome;
> +    }
> +
> +    if (arm_current_el(env) != 2 && addr < 0x14) {
> +        addr = 0x14;
> +    }
> +
> +    mask = 0;
> +    if (!(env->cp15.scr_el3 & SCR_EA)) {
> +        mask |= CPSR_A;
> +    }
> +    if (!(env->cp15.scr_el3 & SCR_IRQ)) {
> +        mask |= CPSR_I;
> +    }
> +    if (!(env->cp15.scr_el3 & SCR_FIQ)) {
> +        mask |= CPSR_F;
> +    }
> +
> +    addr += env->cp15.hvbar;
> +
> +    take_aarch32_exception(env, ARM_CPU_MODE_HYP, mask, 0, addr);
> +}
> +
> +static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    CPUARMState *env = &cpu->env;
> +    uint32_t addr;
> +    uint32_t mask;
> +    int new_mode;
> +    uint32_t offset;
> +    uint32_t moe;
> +
> +    /* If this is a debug exception we must update the DBGDSCR.MOE bits */
> +    switch (syn_get_ec(env->exception.syndrome)) {
> +    case EC_BREAKPOINT:
> +    case EC_BREAKPOINT_SAME_EL:
> +        moe = 1;
> +        break;
> +    case EC_WATCHPOINT:
> +    case EC_WATCHPOINT_SAME_EL:
> +        moe = 10;
> +        break;
> +    case EC_AA32_BKPT:
> +        moe = 3;
> +        break;
> +    case EC_VECTORCATCH:
> +        moe = 5;
> +        break;
> +    default:
> +        moe = 0;
> +        break;
> +    }
> +
> +    if (moe) {
> +        env->cp15.mdscr_el1 = deposit64(env->cp15.mdscr_el1, 2, 4, moe);
> +    }
> +
> +    if (env->exception.target_el == 2) {
> +        arm_cpu_do_interrupt_aarch32_hyp(cs);
> +        return;
> +    }
> +
> +    switch (cs->exception_index) {
> +    case EXCP_UDEF:
> +        new_mode = ARM_CPU_MODE_UND;
> +        addr = 0x04;
> +        mask = CPSR_I;
> +        if (env->thumb) {
> +            offset = 2;
> +        } else {
> +            offset = 4;
> +        }
> +        break;
> +    case EXCP_SWI:
> +        new_mode = ARM_CPU_MODE_SVC;
> +        addr = 0x08;
> +        mask = CPSR_I;
> +        /* The PC already points to the next instruction.  */
> +        offset = 0;
> +        break;
> +    case EXCP_BKPT:
> +        /* Fall through to prefetch abort.  */
> +    case EXCP_PREFETCH_ABORT:
> +        A32_BANKED_CURRENT_REG_SET(env, ifsr, env->exception.fsr);
> +        A32_BANKED_CURRENT_REG_SET(env, ifar, env->exception.vaddress);
> +        qemu_log_mask(CPU_LOG_INT, "...with IFSR 0x%x IFAR 0x%x\n",
> +                      env->exception.fsr, (uint32_t)env->exception.vaddress);
> +        new_mode = ARM_CPU_MODE_ABT;
> +        addr = 0x0c;
> +        mask = CPSR_A | CPSR_I;
> +        offset = 4;
> +        break;
> +    case EXCP_DATA_ABORT:
> +        A32_BANKED_CURRENT_REG_SET(env, dfsr, env->exception.fsr);
> +        A32_BANKED_CURRENT_REG_SET(env, dfar, env->exception.vaddress);
> +        qemu_log_mask(CPU_LOG_INT, "...with DFSR 0x%x DFAR 0x%x\n",
> +                      env->exception.fsr,
> +                      (uint32_t)env->exception.vaddress);
> +        new_mode = ARM_CPU_MODE_ABT;
> +        addr = 0x10;
> +        mask = CPSR_A | CPSR_I;
> +        offset = 8;
> +        break;
> +    case EXCP_IRQ:
> +        new_mode = ARM_CPU_MODE_IRQ;
> +        addr = 0x18;
> +        /* Disable IRQ and imprecise data aborts.  */
> +        mask = CPSR_A | CPSR_I;
> +        offset = 4;
> +        if (env->cp15.scr_el3 & SCR_IRQ) {
> +            /* IRQ routed to monitor mode */
> +            new_mode = ARM_CPU_MODE_MON;
> +            mask |= CPSR_F;
> +        }
> +        break;
> +    case EXCP_FIQ:
> +        new_mode = ARM_CPU_MODE_FIQ;
> +        addr = 0x1c;
> +        /* Disable FIQ, IRQ and imprecise data aborts.  */
> +        mask = CPSR_A | CPSR_I | CPSR_F;
> +        if (env->cp15.scr_el3 & SCR_FIQ) {
> +            /* FIQ routed to monitor mode */
> +            new_mode = ARM_CPU_MODE_MON;
> +        }
> +        offset = 4;
> +        break;
> +    case EXCP_VIRQ:
> +        new_mode = ARM_CPU_MODE_IRQ;
> +        addr = 0x18;
> +        /* Disable IRQ and imprecise data aborts.  */
> +        mask = CPSR_A | CPSR_I;
> +        offset = 4;
> +        break;
> +    case EXCP_VFIQ:
> +        new_mode = ARM_CPU_MODE_FIQ;
> +        addr = 0x1c;
> +        /* Disable FIQ, IRQ and imprecise data aborts.  */
> +        mask = CPSR_A | CPSR_I | CPSR_F;
> +        offset = 4;
> +        break;
> +    case EXCP_SMC:
> +        new_mode = ARM_CPU_MODE_MON;
> +        addr = 0x08;
> +        mask = CPSR_A | CPSR_I | CPSR_F;
> +        offset = 0;
> +        break;
> +    default:
> +        cpu_abort(cs, "Unhandled exception 0x%x\n", cs->exception_index);
> +        return; /* Never happens.  Keep compiler happy.  */
> +    }
> +
> +    if (new_mode == ARM_CPU_MODE_MON) {
> +        addr += env->cp15.mvbar;
> +    } else if (A32_BANKED_CURRENT_REG_GET(env, sctlr) & SCTLR_V) {
> +        /* High vectors. When enabled, base address cannot be remapped. */
> +        addr += 0xffff0000;
> +    } else {
> +        /*
> +         * ARM v7 architectures provide a vector base address register to remap
> +         * the interrupt vector table.
> +         * This register is only followed in non-monitor mode, and is banked.
> +         * Note: only bits 31:5 are valid.
> +         */
> +        addr += A32_BANKED_CURRENT_REG_GET(env, vbar);
> +    }
> +
> +    if ((env->uncached_cpsr & CPSR_M) == ARM_CPU_MODE_MON) {
> +        env->cp15.scr_el3 &= ~SCR_NS;
> +    }
> +
> +    take_aarch32_exception(env, new_mode, mask, offset, addr);
> +}
> +
> +static int aarch64_regnum(CPUARMState *env, int aarch32_reg)
> +{
> +    /*
> +     * Return the register number of the AArch64 view of the AArch32
> +     * register @aarch32_reg. The CPUARMState CPSR is assumed to still
> +     * be that of the AArch32 mode the exception came from.
> +     */
> +    int mode = env->uncached_cpsr & CPSR_M;
> +
> +    switch (aarch32_reg) {
> +    case 0 ... 7:
> +        return aarch32_reg;
> +    case 8 ... 12:
> +        return mode == ARM_CPU_MODE_FIQ ? aarch32_reg + 16 : aarch32_reg;
> +    case 13:
> +        switch (mode) {
> +        case ARM_CPU_MODE_USR:
> +        case ARM_CPU_MODE_SYS:
> +            return 13;
> +        case ARM_CPU_MODE_HYP:
> +            return 15;
> +        case ARM_CPU_MODE_IRQ:
> +            return 17;
> +        case ARM_CPU_MODE_SVC:
> +            return 19;
> +        case ARM_CPU_MODE_ABT:
> +            return 21;
> +        case ARM_CPU_MODE_UND:
> +            return 23;
> +        case ARM_CPU_MODE_FIQ:
> +            return 29;
> +        default:
> +            g_assert_not_reached();
> +        }
> +    case 14:
> +        switch (mode) {
> +        case ARM_CPU_MODE_USR:
> +        case ARM_CPU_MODE_SYS:
> +        case ARM_CPU_MODE_HYP:
> +            return 14;
> +        case ARM_CPU_MODE_IRQ:
> +            return 16;
> +        case ARM_CPU_MODE_SVC:
> +            return 18;
> +        case ARM_CPU_MODE_ABT:
> +            return 20;
> +        case ARM_CPU_MODE_UND:
> +            return 22;
> +        case ARM_CPU_MODE_FIQ:
> +            return 30;
> +        default:
> +            g_assert_not_reached();
> +        }
> +    case 15:
> +        return 31;
> +    default:
> +        g_assert_not_reached();
> +    }
> +}
> +
> +static uint32_t cpsr_read_for_spsr_elx(CPUARMState *env)
> +{
> +    uint32_t ret = cpsr_read(env);
> +
> +    /* Move DIT to the correct location for SPSR_ELx */
> +    if (ret & CPSR_DIT) {
> +        ret &= ~CPSR_DIT;
> +        ret |= PSTATE_DIT;
> +    }
> +    /* Merge PSTATE.SS into SPSR_ELx */
> +    ret |= env->pstate & PSTATE_SS;
> +
> +    return ret;
> +}
> +
> +/* Handle exception entry to a target EL which is using AArch64 */
> +static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    CPUARMState *env = &cpu->env;
> +    unsigned int new_el = env->exception.target_el;
> +    target_ulong addr = env->cp15.vbar_el[new_el];
> +    unsigned int new_mode = aarch64_pstate_mode(new_el, true);
> +    unsigned int old_mode;
> +    unsigned int cur_el = arm_current_el(env);
> +    int rt;
> +
> +    /*
> +     * Note that new_el can never be 0.  If cur_el is 0, then
> +     * el0_a64 is is_a64(), else el0_a64 is ignored.
> +     */
> +    aarch64_sve_change_el(env, cur_el, new_el, is_a64(env));
> +
> +    if (cur_el < new_el) {
> +        /*
> +         * Entry vector offset depends on whether the implemented EL
> +         * immediately lower than the target level is using AArch32 or AArch64
> +         */
> +        bool is_aa64;
> +        uint64_t hcr;
> +
> +        switch (new_el) {
> +        case 3:
> +            is_aa64 = (env->cp15.scr_el3 & SCR_RW) != 0;
> +            break;
> +        case 2:
> +            hcr = arm_hcr_el2_eff(env);
> +            if ((hcr & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
> +                is_aa64 = (hcr & HCR_RW) != 0;
> +                break;
> +            }
> +            /* fall through */
> +        case 1:
> +            is_aa64 = is_a64(env);
> +            break;
> +        default:
> +            g_assert_not_reached();
> +        }
> +
> +        if (is_aa64) {
> +            addr += 0x400;
> +        } else {
> +            addr += 0x600;
> +        }
> +    } else if (pstate_read(env) & PSTATE_SP) {
> +        addr += 0x200;
> +    }
> +
> +    switch (cs->exception_index) {
> +    case EXCP_PREFETCH_ABORT:
> +    case EXCP_DATA_ABORT:
> +        env->cp15.far_el[new_el] = env->exception.vaddress;
> +        qemu_log_mask(CPU_LOG_INT, "...with FAR 0x%" PRIx64 "\n",
> +                      env->cp15.far_el[new_el]);
> +        /* fall through */
> +    case EXCP_BKPT:
> +    case EXCP_UDEF:
> +    case EXCP_SWI:
> +    case EXCP_HVC:
> +    case EXCP_HYP_TRAP:
> +    case EXCP_SMC:
> +        switch (syn_get_ec(env->exception.syndrome)) {
> +        case EC_ADVSIMDFPACCESSTRAP:
> +            /*
> +             * QEMU internal FP/SIMD syndromes from AArch32 include the
> +             * TA and coproc fields which are only exposed if the exception
> +             * is taken to AArch32 Hyp mode. Mask them out to get a valid
> +             * AArch64 format syndrome.
> +             */
> +            env->exception.syndrome &= ~MAKE_64BIT_MASK(0, 20);
> +            break;
> +        case EC_CP14RTTRAP:
> +        case EC_CP15RTTRAP:
> +        case EC_CP14DTTRAP:
> +            /*
> +             * For a trap on AArch32 MRC/MCR/LDC/STC the Rt field is currently
> +             * the raw register field from the insn; when taking this to
> +             * AArch64 we must convert it to the AArch64 view of the register
> +             * number. Notice that we read a 4-bit AArch32 register number and
> +             * write back a 5-bit AArch64 one.
> +             */
> +            rt = extract32(env->exception.syndrome, 5, 4);
> +            rt = aarch64_regnum(env, rt);
> +            env->exception.syndrome = deposit32(env->exception.syndrome,
> +                                                5, 5, rt);
> +            break;
> +        case EC_CP15RRTTRAP:
> +        case EC_CP14RRTTRAP:
> +            /* Similarly for MRRC/MCRR traps for Rt and Rt2 fields */
> +            rt = extract32(env->exception.syndrome, 5, 4);
> +            rt = aarch64_regnum(env, rt);
> +            env->exception.syndrome = deposit32(env->exception.syndrome,
> +                                                5, 5, rt);
> +            rt = extract32(env->exception.syndrome, 10, 4);
> +            rt = aarch64_regnum(env, rt);
> +            env->exception.syndrome = deposit32(env->exception.syndrome,
> +                                                10, 5, rt);
> +            break;
> +        }
> +        env->cp15.esr_el[new_el] = env->exception.syndrome;
> +        break;
> +    case EXCP_IRQ:
> +    case EXCP_VIRQ:
> +        addr += 0x80;
> +        break;
> +    case EXCP_FIQ:
> +    case EXCP_VFIQ:
> +        addr += 0x100;
> +        break;
> +    default:
> +        cpu_abort(cs, "Unhandled exception 0x%x\n", cs->exception_index);
> +    }
> +
> +    if (is_a64(env)) {
> +        old_mode = pstate_read(env);
> +        aarch64_save_sp(env, arm_current_el(env));
> +        env->elr_el[new_el] = env->pc;
> +    } else {
> +        old_mode = cpsr_read_for_spsr_elx(env);
> +        env->elr_el[new_el] = env->regs[15];
> +
> +        aarch64_sync_32_to_64(env);
> +
> +        env->condexec_bits = 0;
> +    }
> +    env->banked_spsr[aarch64_banked_spsr_index(new_el)] = old_mode;
> +
> +    qemu_log_mask(CPU_LOG_INT, "...with ELR 0x%" PRIx64 "\n",
> +                  env->elr_el[new_el]);
> +
> +    if (cpu_isar_feature(aa64_pan, cpu)) {
> +        /* The value of PSTATE.PAN is normally preserved, except when ... */
> +        new_mode |= old_mode & PSTATE_PAN;
> +        switch (new_el) {
> +        case 2:
> +            /* ... the target is EL2 with HCR_EL2.{E2H,TGE} == '11' ...  */
> +            if ((arm_hcr_el2_eff(env) & (HCR_E2H | HCR_TGE))
> +                != (HCR_E2H | HCR_TGE)) {
> +                break;
> +            }
> +            /* fall through */
> +        case 1:
> +            /* ... the target is EL1 ... */
> +            /* ... and SCTLR_ELx.SPAN == 0, then set to 1.  */
> +            if ((env->cp15.sctlr_el[new_el] & SCTLR_SPAN) == 0) {
> +                new_mode |= PSTATE_PAN;
> +            }
> +            break;
> +        }
> +    }
> +    if (cpu_isar_feature(aa64_mte, cpu)) {
> +        new_mode |= PSTATE_TCO;
> +    }
> +
> +    pstate_write(env, PSTATE_DAIF | new_mode);
> +    env->aarch64 = 1;
> +    aarch64_restore_sp(env, new_el);
> +
> +    if (tcg_enabled()) {
> +        /* pstate already written, so we can use arm_rebuild_hflags here */
> +        arm_rebuild_hflags(env);
> +    }
> +
> +    env->pc = addr;
> +
> +    qemu_log_mask(CPU_LOG_INT, "...to EL%d PC 0x%" PRIx64 " PSTATE 0x%x\n",
> +                  new_el, env->pc, pstate_read(env));
> +}
> +
> +void arm_log_exception(int idx)
> +{
> +    if (qemu_loglevel_mask(CPU_LOG_INT)) {
> +        const char *exc = NULL;
> +        static const char * const excnames[] = {
> +            [EXCP_UDEF] = "Undefined Instruction",
> +            [EXCP_SWI] = "SVC",
> +            [EXCP_PREFETCH_ABORT] = "Prefetch Abort",
> +            [EXCP_DATA_ABORT] = "Data Abort",
> +            [EXCP_IRQ] = "IRQ",
> +            [EXCP_FIQ] = "FIQ",
> +            [EXCP_BKPT] = "Breakpoint",
> +            [EXCP_EXCEPTION_EXIT] = "QEMU v7M exception exit",
> +            [EXCP_KERNEL_TRAP] = "QEMU intercept of kernel commpage",
> +            [EXCP_HVC] = "Hypervisor Call",
> +            [EXCP_HYP_TRAP] = "Hypervisor Trap",
> +            [EXCP_SMC] = "Secure Monitor Call",
> +            [EXCP_VIRQ] = "Virtual IRQ",
> +            [EXCP_VFIQ] = "Virtual FIQ",
> +            [EXCP_SEMIHOST] = "Semihosting call",
> +            [EXCP_NOCP] = "v7M NOCP UsageFault",
> +            [EXCP_INVSTATE] = "v7M INVSTATE UsageFault",
> +            [EXCP_STKOF] = "v8M STKOF UsageFault",
> +            [EXCP_LAZYFP] = "v7M exception during lazy FP stacking",
> +            [EXCP_LSERR] = "v8M LSERR UsageFault",
> +            [EXCP_UNALIGNED] = "v7M UNALIGNED UsageFault",
> +        };
> +
> +        if (idx >= 0 && idx < ARRAY_SIZE(excnames)) {
> +            exc = excnames[idx];
> +        }
> +        if (!exc) {
> +            exc = "unknown";
> +        }
> +        qemu_log_mask(CPU_LOG_INT, "Taking exception %d [%s]\n", idx, exc);
> +    }
> +}
> +
> +/*
> + * Handle a CPU exception for A and R profile CPUs.
> + * Do any appropriate logging, handle PSCI calls, and then hand off
> + * to the AArch64-entry or AArch32-entry function depending on the
> + * target exception level's register width.
> + *
> + * Note: this is used for both TCG (as the do_interrupt tcg op),
> + *       and KVM to re-inject guest debug exceptions, and to
> + *       inject a Synchronous-External-Abort.
> + */
> +void arm_cpu_do_interrupt(CPUState *cs)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    CPUARMState *env = &cpu->env;
> +    unsigned int new_el = env->exception.target_el;
> +
> +    assert(!arm_feature(env, ARM_FEATURE_M));
> +
> +    arm_log_exception(cs->exception_index);
> +    qemu_log_mask(CPU_LOG_INT, "...from EL%d to EL%d\n", arm_current_el(env),
> +                  new_el);
> +    if (qemu_loglevel_mask(CPU_LOG_INT)
> +        && !excp_is_internal(cs->exception_index)) {
> +        qemu_log_mask(CPU_LOG_INT, "...with ESR 0x%x/0x%" PRIx32 "\n",
> +                      syn_get_ec(env->exception.syndrome),
> +                      env->exception.syndrome);
> +    }
> +
> +#ifdef CONFIG_TCG
> +    if (arm_is_psci_call(cpu, cs->exception_index)) {
> +        arm_handle_psci_call(cpu);
> +        qemu_log_mask(CPU_LOG_INT, "...handled as PSCI call\n");
> +        return;
> +    }
> +    /*
> +     * Semihosting semantics depend on the register width of the code
> +     * that caused the exception, not the target exception level, so
> +     * must be handled here.
> +     */
> +    if (cs->exception_index == EXCP_SEMIHOST) {
> +        handle_semihosting(cs);
> +        return;
> +    }
> +#endif /* CONFIG_TCG */
> +    /*
> +     * Hooks may change global state so BQL should be held, also the
> +     * BQL needs to be held for any modification of
> +     * cs->interrupt_request.
> +     */
> +    g_assert(qemu_mutex_iothread_locked());
> +    arm_call_pre_el_change_hook(cpu);
> +
> +    assert(!excp_is_internal(cs->exception_index));
> +    if (arm_el_is_aa64(env, new_el)) {
> +        arm_cpu_do_interrupt_aarch64(cs);
> +    } else {
> +        arm_cpu_do_interrupt_aarch32(cs);
> +    }
> +
> +    arm_call_el_change_hook(cpu);
> +
> +    if (tcg_enabled()) {
> +        cs->interrupt_request |= CPU_INTERRUPT_EXITTB;
> +    }
> +}
> diff --git a/target/arm/tcg/helper.c b/target/arm/tcg/helper.c
> index 5b32329895..a8b1efdb36 100644
> --- a/target/arm/tcg/helper.c
> +++ b/target/arm/tcg/helper.c
> @@ -7,34 +7,13 @@
>    */
>   
>   #include "qemu/osdep.h"
> -#include "qemu/units.h"
> -#include "target/arm/idau.h"
> -#include "trace.h"
>   #include "cpu.h"
>   #include "internals.h"
>   #include "exec/gdbstub.h"
>   #include "exec/helper-proto.h"
> -#include "qemu/host-utils.h"
> -#include "qemu/main-loop.h"
> -#include "qemu/bitops.h"
>   #include "qemu/crc32c.h"
> -#include "qemu/qemu-print.h"
> -#include "exec/exec-all.h"
>   #include <zlib.h> /* For crc32 */
> -#include "hw/irq.h"
> -#include "semihosting/semihost.h"
> -#include "sysemu/cpus.h"
> -#include "sysemu/cpu-timers.h"
> -#include "sysemu/kvm.h"
> -#include "sysemu/tcg.h"
> -#include "qemu/range.h"
> -#include "qapi/error.h"
> -#include "qemu/guest-random.h"
> -#ifdef CONFIG_TCG
>   #include "arm_ldst.h"
> -#include "exec/cpu_ldst.h"
> -#include "semihosting/common-semi.h"
> -#endif
>   #include "cpu-mmu.h"
>   #include "cpregs.h"
>   
> @@ -643,719 +622,6 @@ uint32_t arm_phys_excp_target_el(CPUState *cs, uint32_t excp_idx,
>       return target_el;
>   }
>   
> -void arm_log_exception(int idx)
> -{
> -    if (qemu_loglevel_mask(CPU_LOG_INT)) {
> -        const char *exc = NULL;
> -        static const char * const excnames[] = {
> -            [EXCP_UDEF] = "Undefined Instruction",
> -            [EXCP_SWI] = "SVC",
> -            [EXCP_PREFETCH_ABORT] = "Prefetch Abort",
> -            [EXCP_DATA_ABORT] = "Data Abort",
> -            [EXCP_IRQ] = "IRQ",
> -            [EXCP_FIQ] = "FIQ",
> -            [EXCP_BKPT] = "Breakpoint",
> -            [EXCP_EXCEPTION_EXIT] = "QEMU v7M exception exit",
> -            [EXCP_KERNEL_TRAP] = "QEMU intercept of kernel commpage",
> -            [EXCP_HVC] = "Hypervisor Call",
> -            [EXCP_HYP_TRAP] = "Hypervisor Trap",
> -            [EXCP_SMC] = "Secure Monitor Call",
> -            [EXCP_VIRQ] = "Virtual IRQ",
> -            [EXCP_VFIQ] = "Virtual FIQ",
> -            [EXCP_SEMIHOST] = "Semihosting call",
> -            [EXCP_NOCP] = "v7M NOCP UsageFault",
> -            [EXCP_INVSTATE] = "v7M INVSTATE UsageFault",
> -            [EXCP_STKOF] = "v8M STKOF UsageFault",
> -            [EXCP_LAZYFP] = "v7M exception during lazy FP stacking",
> -            [EXCP_LSERR] = "v8M LSERR UsageFault",
> -            [EXCP_UNALIGNED] = "v7M UNALIGNED UsageFault",
> -        };
> -
> -        if (idx >= 0 && idx < ARRAY_SIZE(excnames)) {
> -            exc = excnames[idx];
> -        }
> -        if (!exc) {
> -            exc = "unknown";
> -        }
> -        qemu_log_mask(CPU_LOG_INT, "Taking exception %d [%s]\n", idx, exc);
> -    }
> -}
> -
> -static void take_aarch32_exception(CPUARMState *env, int new_mode,
> -                                   uint32_t mask, uint32_t offset,
> -                                   uint32_t newpc)
> -{
> -    int new_el;
> -
> -    /* Change the CPU state so as to actually take the exception. */
> -    switch_mode(env, new_mode);
> -
> -    /*
> -     * For exceptions taken to AArch32 we must clear the SS bit in both
> -     * PSTATE and in the old-state value we save to SPSR_<mode>, so zero it now.
> -     */
> -    env->pstate &= ~PSTATE_SS;
> -    env->spsr = cpsr_read(env);
> -    /* Clear IT bits.  */
> -    env->condexec_bits = 0;
> -    /* Switch to the new mode, and to the correct instruction set.  */
> -    env->uncached_cpsr = (env->uncached_cpsr & ~CPSR_M) | new_mode;
> -
> -    /* This must be after mode switching. */
> -    new_el = arm_current_el(env);
> -
> -    /* Set new mode endianness */
> -    env->uncached_cpsr &= ~CPSR_E;
> -    if (env->cp15.sctlr_el[new_el] & SCTLR_EE) {
> -        env->uncached_cpsr |= CPSR_E;
> -    }
> -    /* J and IL must always be cleared for exception entry */
> -    env->uncached_cpsr &= ~(CPSR_IL | CPSR_J);
> -    env->daif |= mask;
> -
> -    if (cpu_isar_feature(aa32_ssbs, env_archcpu(env))) {
> -        if (env->cp15.sctlr_el[new_el] & SCTLR_DSSBS_32) {
> -            env->uncached_cpsr |= CPSR_SSBS;
> -        } else {
> -            env->uncached_cpsr &= ~CPSR_SSBS;
> -        }
> -    }
> -
> -    if (new_mode == ARM_CPU_MODE_HYP) {
> -        env->thumb = (env->cp15.sctlr_el[2] & SCTLR_TE) != 0;
> -        env->elr_el[2] = env->regs[15];
> -    } else {
> -        /* CPSR.PAN is normally preserved preserved unless...  */
> -        if (cpu_isar_feature(aa32_pan, env_archcpu(env))) {
> -            switch (new_el) {
> -            case 3:
> -                if (!arm_is_secure_below_el3(env)) {
> -                    /* ... the target is EL3, from non-secure state.  */
> -                    env->uncached_cpsr &= ~CPSR_PAN;
> -                    break;
> -                }
> -                /* ... the target is EL3, from secure state ... */
> -                /* fall through */
> -            case 1:
> -                /* ... the target is EL1 and SCTLR.SPAN is 0.  */
> -                if (!(env->cp15.sctlr_el[new_el] & SCTLR_SPAN)) {
> -                    env->uncached_cpsr |= CPSR_PAN;
> -                }
> -                break;
> -            }
> -        }
> -        /*
> -         * this is a lie, as there was no c1_sys on V4T/V5, but who cares
> -         * and we should just guard the thumb mode on V4
> -         */
> -        if (arm_feature(env, ARM_FEATURE_V4T)) {
> -            env->thumb =
> -                (A32_BANKED_CURRENT_REG_GET(env, sctlr) & SCTLR_TE) != 0;
> -        }
> -        env->regs[14] = env->regs[15] + offset;
> -    }
> -    env->regs[15] = newpc;
> -    if (tcg_enabled()) {
> -        arm_rebuild_hflags(env);
> -    }
> -}
> -
> -static void arm_cpu_do_interrupt_aarch32_hyp(CPUState *cs)
> -{
> -    /*
> -     * Handle exception entry to Hyp mode; this is sufficiently
> -     * different to entry to other AArch32 modes that we handle it
> -     * separately here.
> -     *
> -     * The vector table entry used is always the 0x14 Hyp mode entry point,
> -     * unless this is an UNDEF/HVC/abort taken from Hyp to Hyp.
> -     * The offset applied to the preferred return address is always zero
> -     * (see DDI0487C.a section G1.12.3).
> -     * PSTATE A/I/F masks are set based only on the SCR.EA/IRQ/FIQ values.
> -     */
> -    uint32_t addr, mask;
> -    ARMCPU *cpu = ARM_CPU(cs);
> -    CPUARMState *env = &cpu->env;
> -
> -    switch (cs->exception_index) {
> -    case EXCP_UDEF:
> -        addr = 0x04;
> -        break;
> -    case EXCP_SWI:
> -        addr = 0x14;
> -        break;
> -    case EXCP_BKPT:
> -        /* Fall through to prefetch abort.  */
> -    case EXCP_PREFETCH_ABORT:
> -        env->cp15.ifar_s = env->exception.vaddress;
> -        qemu_log_mask(CPU_LOG_INT, "...with HIFAR 0x%x\n",
> -                      (uint32_t)env->exception.vaddress);
> -        addr = 0x0c;
> -        break;
> -    case EXCP_DATA_ABORT:
> -        env->cp15.dfar_s = env->exception.vaddress;
> -        qemu_log_mask(CPU_LOG_INT, "...with HDFAR 0x%x\n",
> -                      (uint32_t)env->exception.vaddress);
> -        addr = 0x10;
> -        break;
> -    case EXCP_IRQ:
> -        addr = 0x18;
> -        break;
> -    case EXCP_FIQ:
> -        addr = 0x1c;
> -        break;
> -    case EXCP_HVC:
> -        addr = 0x08;
> -        break;
> -    case EXCP_HYP_TRAP:
> -        addr = 0x14;
> -        break;
> -    default:
> -        cpu_abort(cs, "Unhandled exception 0x%x\n", cs->exception_index);
> -    }
> -
> -    if (cs->exception_index != EXCP_IRQ && cs->exception_index != EXCP_FIQ) {
> -        if (!arm_feature(env, ARM_FEATURE_V8)) {
> -            /*
> -             * QEMU syndrome values are v8-style. v7 has the IL bit
> -             * UNK/SBZP for "field not valid" cases, where v8 uses RES1.
> -             * If this is a v7 CPU, squash the IL bit in those cases.
> -             */
> -            if (cs->exception_index == EXCP_PREFETCH_ABORT ||
> -                (cs->exception_index == EXCP_DATA_ABORT &&
> -                 !(env->exception.syndrome & ARM_EL_ISV)) ||
> -                syn_get_ec(env->exception.syndrome) == EC_UNCATEGORIZED) {
> -                env->exception.syndrome &= ~ARM_EL_IL;
> -            }
> -        }
> -        env->cp15.esr_el[2] = env->exception.syndrome;
> -    }
> -
> -    if (arm_current_el(env) != 2 && addr < 0x14) {
> -        addr = 0x14;
> -    }
> -
> -    mask = 0;
> -    if (!(env->cp15.scr_el3 & SCR_EA)) {
> -        mask |= CPSR_A;
> -    }
> -    if (!(env->cp15.scr_el3 & SCR_IRQ)) {
> -        mask |= CPSR_I;
> -    }
> -    if (!(env->cp15.scr_el3 & SCR_FIQ)) {
> -        mask |= CPSR_F;
> -    }
> -
> -    addr += env->cp15.hvbar;
> -
> -    take_aarch32_exception(env, ARM_CPU_MODE_HYP, mask, 0, addr);
> -}
> -
> -static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
> -{
> -    ARMCPU *cpu = ARM_CPU(cs);
> -    CPUARMState *env = &cpu->env;
> -    uint32_t addr;
> -    uint32_t mask;
> -    int new_mode;
> -    uint32_t offset;
> -    uint32_t moe;
> -
> -    /* If this is a debug exception we must update the DBGDSCR.MOE bits */
> -    switch (syn_get_ec(env->exception.syndrome)) {
> -    case EC_BREAKPOINT:
> -    case EC_BREAKPOINT_SAME_EL:
> -        moe = 1;
> -        break;
> -    case EC_WATCHPOINT:
> -    case EC_WATCHPOINT_SAME_EL:
> -        moe = 10;
> -        break;
> -    case EC_AA32_BKPT:
> -        moe = 3;
> -        break;
> -    case EC_VECTORCATCH:
> -        moe = 5;
> -        break;
> -    default:
> -        moe = 0;
> -        break;
> -    }
> -
> -    if (moe) {
> -        env->cp15.mdscr_el1 = deposit64(env->cp15.mdscr_el1, 2, 4, moe);
> -    }
> -
> -    if (env->exception.target_el == 2) {
> -        arm_cpu_do_interrupt_aarch32_hyp(cs);
> -        return;
> -    }
> -
> -    switch (cs->exception_index) {
> -    case EXCP_UDEF:
> -        new_mode = ARM_CPU_MODE_UND;
> -        addr = 0x04;
> -        mask = CPSR_I;
> -        if (env->thumb) {
> -            offset = 2;
> -        } else {
> -            offset = 4;
> -        }
> -        break;
> -    case EXCP_SWI:
> -        new_mode = ARM_CPU_MODE_SVC;
> -        addr = 0x08;
> -        mask = CPSR_I;
> -        /* The PC already points to the next instruction.  */
> -        offset = 0;
> -        break;
> -    case EXCP_BKPT:
> -        /* Fall through to prefetch abort.  */
> -    case EXCP_PREFETCH_ABORT:
> -        A32_BANKED_CURRENT_REG_SET(env, ifsr, env->exception.fsr);
> -        A32_BANKED_CURRENT_REG_SET(env, ifar, env->exception.vaddress);
> -        qemu_log_mask(CPU_LOG_INT, "...with IFSR 0x%x IFAR 0x%x\n",
> -                      env->exception.fsr, (uint32_t)env->exception.vaddress);
> -        new_mode = ARM_CPU_MODE_ABT;
> -        addr = 0x0c;
> -        mask = CPSR_A | CPSR_I;
> -        offset = 4;
> -        break;
> -    case EXCP_DATA_ABORT:
> -        A32_BANKED_CURRENT_REG_SET(env, dfsr, env->exception.fsr);
> -        A32_BANKED_CURRENT_REG_SET(env, dfar, env->exception.vaddress);
> -        qemu_log_mask(CPU_LOG_INT, "...with DFSR 0x%x DFAR 0x%x\n",
> -                      env->exception.fsr,
> -                      (uint32_t)env->exception.vaddress);
> -        new_mode = ARM_CPU_MODE_ABT;
> -        addr = 0x10;
> -        mask = CPSR_A | CPSR_I;
> -        offset = 8;
> -        break;
> -    case EXCP_IRQ:
> -        new_mode = ARM_CPU_MODE_IRQ;
> -        addr = 0x18;
> -        /* Disable IRQ and imprecise data aborts.  */
> -        mask = CPSR_A | CPSR_I;
> -        offset = 4;
> -        if (env->cp15.scr_el3 & SCR_IRQ) {
> -            /* IRQ routed to monitor mode */
> -            new_mode = ARM_CPU_MODE_MON;
> -            mask |= CPSR_F;
> -        }
> -        break;
> -    case EXCP_FIQ:
> -        new_mode = ARM_CPU_MODE_FIQ;
> -        addr = 0x1c;
> -        /* Disable FIQ, IRQ and imprecise data aborts.  */
> -        mask = CPSR_A | CPSR_I | CPSR_F;
> -        if (env->cp15.scr_el3 & SCR_FIQ) {
> -            /* FIQ routed to monitor mode */
> -            new_mode = ARM_CPU_MODE_MON;
> -        }
> -        offset = 4;
> -        break;
> -    case EXCP_VIRQ:
> -        new_mode = ARM_CPU_MODE_IRQ;
> -        addr = 0x18;
> -        /* Disable IRQ and imprecise data aborts.  */
> -        mask = CPSR_A | CPSR_I;
> -        offset = 4;
> -        break;
> -    case EXCP_VFIQ:
> -        new_mode = ARM_CPU_MODE_FIQ;
> -        addr = 0x1c;
> -        /* Disable FIQ, IRQ and imprecise data aborts.  */
> -        mask = CPSR_A | CPSR_I | CPSR_F;
> -        offset = 4;
> -        break;
> -    case EXCP_SMC:
> -        new_mode = ARM_CPU_MODE_MON;
> -        addr = 0x08;
> -        mask = CPSR_A | CPSR_I | CPSR_F;
> -        offset = 0;
> -        break;
> -    default:
> -        cpu_abort(cs, "Unhandled exception 0x%x\n", cs->exception_index);
> -        return; /* Never happens.  Keep compiler happy.  */
> -    }
> -
> -    if (new_mode == ARM_CPU_MODE_MON) {
> -        addr += env->cp15.mvbar;
> -    } else if (A32_BANKED_CURRENT_REG_GET(env, sctlr) & SCTLR_V) {
> -        /* High vectors. When enabled, base address cannot be remapped. */
> -        addr += 0xffff0000;
> -    } else {
> -        /*
> -         * ARM v7 architectures provide a vector base address register to remap
> -         * the interrupt vector table.
> -         * This register is only followed in non-monitor mode, and is banked.
> -         * Note: only bits 31:5 are valid.
> -         */
> -        addr += A32_BANKED_CURRENT_REG_GET(env, vbar);
> -    }
> -
> -    if ((env->uncached_cpsr & CPSR_M) == ARM_CPU_MODE_MON) {
> -        env->cp15.scr_el3 &= ~SCR_NS;
> -    }
> -
> -    take_aarch32_exception(env, new_mode, mask, offset, addr);
> -}
> -
> -static int aarch64_regnum(CPUARMState *env, int aarch32_reg)
> -{
> -    /*
> -     * Return the register number of the AArch64 view of the AArch32
> -     * register @aarch32_reg. The CPUARMState CPSR is assumed to still
> -     * be that of the AArch32 mode the exception came from.
> -     */
> -    int mode = env->uncached_cpsr & CPSR_M;
> -
> -    switch (aarch32_reg) {
> -    case 0 ... 7:
> -        return aarch32_reg;
> -    case 8 ... 12:
> -        return mode == ARM_CPU_MODE_FIQ ? aarch32_reg + 16 : aarch32_reg;
> -    case 13:
> -        switch (mode) {
> -        case ARM_CPU_MODE_USR:
> -        case ARM_CPU_MODE_SYS:
> -            return 13;
> -        case ARM_CPU_MODE_HYP:
> -            return 15;
> -        case ARM_CPU_MODE_IRQ:
> -            return 17;
> -        case ARM_CPU_MODE_SVC:
> -            return 19;
> -        case ARM_CPU_MODE_ABT:
> -            return 21;
> -        case ARM_CPU_MODE_UND:
> -            return 23;
> -        case ARM_CPU_MODE_FIQ:
> -            return 29;
> -        default:
> -            g_assert_not_reached();
> -        }
> -    case 14:
> -        switch (mode) {
> -        case ARM_CPU_MODE_USR:
> -        case ARM_CPU_MODE_SYS:
> -        case ARM_CPU_MODE_HYP:
> -            return 14;
> -        case ARM_CPU_MODE_IRQ:
> -            return 16;
> -        case ARM_CPU_MODE_SVC:
> -            return 18;
> -        case ARM_CPU_MODE_ABT:
> -            return 20;
> -        case ARM_CPU_MODE_UND:
> -            return 22;
> -        case ARM_CPU_MODE_FIQ:
> -            return 30;
> -        default:
> -            g_assert_not_reached();
> -        }
> -    case 15:
> -        return 31;
> -    default:
> -        g_assert_not_reached();
> -    }
> -}
> -
> -static uint32_t cpsr_read_for_spsr_elx(CPUARMState *env)
> -{
> -    uint32_t ret = cpsr_read(env);
> -
> -    /* Move DIT to the correct location for SPSR_ELx */
> -    if (ret & CPSR_DIT) {
> -        ret &= ~CPSR_DIT;
> -        ret |= PSTATE_DIT;
> -    }
> -    /* Merge PSTATE.SS into SPSR_ELx */
> -    ret |= env->pstate & PSTATE_SS;
> -
> -    return ret;
> -}
> -
> -/* Handle exception entry to a target EL which is using AArch64 */
> -static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
> -{
> -    ARMCPU *cpu = ARM_CPU(cs);
> -    CPUARMState *env = &cpu->env;
> -    unsigned int new_el = env->exception.target_el;
> -    target_ulong addr = env->cp15.vbar_el[new_el];
> -    unsigned int new_mode = aarch64_pstate_mode(new_el, true);
> -    unsigned int old_mode;
> -    unsigned int cur_el = arm_current_el(env);
> -    int rt;
> -
> -    /*
> -     * Note that new_el can never be 0.  If cur_el is 0, then
> -     * el0_a64 is is_a64(), else el0_a64 is ignored.
> -     */
> -    aarch64_sve_change_el(env, cur_el, new_el, is_a64(env));
> -
> -    if (cur_el < new_el) {
> -        /*
> -         * Entry vector offset depends on whether the implemented EL
> -         * immediately lower than the target level is using AArch32 or AArch64
> -         */
> -        bool is_aa64;
> -        uint64_t hcr;
> -
> -        switch (new_el) {
> -        case 3:
> -            is_aa64 = (env->cp15.scr_el3 & SCR_RW) != 0;
> -            break;
> -        case 2:
> -            hcr = arm_hcr_el2_eff(env);
> -            if ((hcr & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
> -                is_aa64 = (hcr & HCR_RW) != 0;
> -                break;
> -            }
> -            /* fall through */
> -        case 1:
> -            is_aa64 = is_a64(env);
> -            break;
> -        default:
> -            g_assert_not_reached();
> -        }
> -
> -        if (is_aa64) {
> -            addr += 0x400;
> -        } else {
> -            addr += 0x600;
> -        }
> -    } else if (pstate_read(env) & PSTATE_SP) {
> -        addr += 0x200;
> -    }
> -
> -    switch (cs->exception_index) {
> -    case EXCP_PREFETCH_ABORT:
> -    case EXCP_DATA_ABORT:
> -        env->cp15.far_el[new_el] = env->exception.vaddress;
> -        qemu_log_mask(CPU_LOG_INT, "...with FAR 0x%" PRIx64 "\n",
> -                      env->cp15.far_el[new_el]);
> -        /* fall through */
> -    case EXCP_BKPT:
> -    case EXCP_UDEF:
> -    case EXCP_SWI:
> -    case EXCP_HVC:
> -    case EXCP_HYP_TRAP:
> -    case EXCP_SMC:
> -        switch (syn_get_ec(env->exception.syndrome)) {
> -        case EC_ADVSIMDFPACCESSTRAP:
> -            /*
> -             * QEMU internal FP/SIMD syndromes from AArch32 include the
> -             * TA and coproc fields which are only exposed if the exception
> -             * is taken to AArch32 Hyp mode. Mask them out to get a valid
> -             * AArch64 format syndrome.
> -             */
> -            env->exception.syndrome &= ~MAKE_64BIT_MASK(0, 20);
> -            break;
> -        case EC_CP14RTTRAP:
> -        case EC_CP15RTTRAP:
> -        case EC_CP14DTTRAP:
> -            /*
> -             * For a trap on AArch32 MRC/MCR/LDC/STC the Rt field is currently
> -             * the raw register field from the insn; when taking this to
> -             * AArch64 we must convert it to the AArch64 view of the register
> -             * number. Notice that we read a 4-bit AArch32 register number and
> -             * write back a 5-bit AArch64 one.
> -             */
> -            rt = extract32(env->exception.syndrome, 5, 4);
> -            rt = aarch64_regnum(env, rt);
> -            env->exception.syndrome = deposit32(env->exception.syndrome,
> -                                                5, 5, rt);
> -            break;
> -        case EC_CP15RRTTRAP:
> -        case EC_CP14RRTTRAP:
> -            /* Similarly for MRRC/MCRR traps for Rt and Rt2 fields */
> -            rt = extract32(env->exception.syndrome, 5, 4);
> -            rt = aarch64_regnum(env, rt);
> -            env->exception.syndrome = deposit32(env->exception.syndrome,
> -                                                5, 5, rt);
> -            rt = extract32(env->exception.syndrome, 10, 4);
> -            rt = aarch64_regnum(env, rt);
> -            env->exception.syndrome = deposit32(env->exception.syndrome,
> -                                                10, 5, rt);
> -            break;
> -        }
> -        env->cp15.esr_el[new_el] = env->exception.syndrome;
> -        break;
> -    case EXCP_IRQ:
> -    case EXCP_VIRQ:
> -        addr += 0x80;
> -        break;
> -    case EXCP_FIQ:
> -    case EXCP_VFIQ:
> -        addr += 0x100;
> -        break;
> -    default:
> -        cpu_abort(cs, "Unhandled exception 0x%x\n", cs->exception_index);
> -    }
> -
> -    if (is_a64(env)) {
> -        old_mode = pstate_read(env);
> -        aarch64_save_sp(env, arm_current_el(env));
> -        env->elr_el[new_el] = env->pc;
> -    } else {
> -        old_mode = cpsr_read_for_spsr_elx(env);
> -        env->elr_el[new_el] = env->regs[15];
> -
> -        aarch64_sync_32_to_64(env);
> -
> -        env->condexec_bits = 0;
> -    }
> -    env->banked_spsr[aarch64_banked_spsr_index(new_el)] = old_mode;
> -
> -    qemu_log_mask(CPU_LOG_INT, "...with ELR 0x%" PRIx64 "\n",
> -                  env->elr_el[new_el]);
> -
> -    if (cpu_isar_feature(aa64_pan, cpu)) {
> -        /* The value of PSTATE.PAN is normally preserved, except when ... */
> -        new_mode |= old_mode & PSTATE_PAN;
> -        switch (new_el) {
> -        case 2:
> -            /* ... the target is EL2 with HCR_EL2.{E2H,TGE} == '11' ...  */
> -            if ((arm_hcr_el2_eff(env) & (HCR_E2H | HCR_TGE))
> -                != (HCR_E2H | HCR_TGE)) {
> -                break;
> -            }
> -            /* fall through */
> -        case 1:
> -            /* ... the target is EL1 ... */
> -            /* ... and SCTLR_ELx.SPAN == 0, then set to 1.  */
> -            if ((env->cp15.sctlr_el[new_el] & SCTLR_SPAN) == 0) {
> -                new_mode |= PSTATE_PAN;
> -            }
> -            break;
> -        }
> -    }
> -    if (cpu_isar_feature(aa64_mte, cpu)) {
> -        new_mode |= PSTATE_TCO;
> -    }
> -
> -    if (cpu_isar_feature(aa64_ssbs, cpu)) {
> -        if (env->cp15.sctlr_el[new_el] & SCTLR_DSSBS_64) {
> -            new_mode |= PSTATE_SSBS;
> -        } else {
> -            new_mode &= ~PSTATE_SSBS;
> -        }
> -    }
> -
> -    pstate_write(env, PSTATE_DAIF | new_mode);
> -    env->aarch64 = 1;
> -    aarch64_restore_sp(env, new_el);
> -
> -    if (tcg_enabled()) {
> -        /* pstate already written, so we can use arm_rebuild_hflags here */
> -        arm_rebuild_hflags(env);
> -    }
> -
> -    env->pc = addr;
> -
> -    qemu_log_mask(CPU_LOG_INT, "...to EL%d PC 0x%" PRIx64 " PSTATE 0x%x\n",
> -                  new_el, env->pc, pstate_read(env));
> -}
> -
> -/*
> - * Do semihosting call and set the appropriate return value. All the
> - * permission and validity checks have been done at translate time.
> - *
> - * We only see semihosting exceptions in TCG only as they are not
> - * trapped to the hypervisor in KVM.
> - */
> -#ifdef CONFIG_TCG
> -static void handle_semihosting(CPUState *cs)
> -{
> -    ARMCPU *cpu = ARM_CPU(cs);
> -    CPUARMState *env = &cpu->env;
> -
> -    if (is_a64(env)) {
> -        qemu_log_mask(CPU_LOG_INT,
> -                      "...handling as semihosting call 0x%" PRIx64 "\n",
> -                      env->xregs[0]);
> -        env->xregs[0] = do_common_semihosting(cs);
> -        env->pc += 4;
> -    } else {
> -        qemu_log_mask(CPU_LOG_INT,
> -                      "...handling as semihosting call 0x%x\n",
> -                      env->regs[0]);
> -        env->regs[0] = do_common_semihosting(cs);
> -        env->regs[15] += env->thumb ? 2 : 4;
> -    }
> -}
> -#endif
> -
> -/*
> - * Handle a CPU exception for A and R profile CPUs.
> - * Do any appropriate logging, handle PSCI calls, and then hand off
> - * to the AArch64-entry or AArch32-entry function depending on the
> - * target exception level's register width.
> - *
> - * Note: this is used for both TCG (as the do_interrupt tcg op),
> - *       and KVM to re-inject guest debug exceptions, and to
> - *       inject a Synchronous-External-Abort.
> - */
> -void arm_cpu_do_interrupt(CPUState *cs)
> -{
> -    ARMCPU *cpu = ARM_CPU(cs);
> -    CPUARMState *env = &cpu->env;
> -    unsigned int new_el = env->exception.target_el;
> -
> -    assert(!arm_feature(env, ARM_FEATURE_M));
> -
> -    arm_log_exception(cs->exception_index);
> -    qemu_log_mask(CPU_LOG_INT, "...from EL%d to EL%d\n", arm_current_el(env),
> -                  new_el);
> -    if (qemu_loglevel_mask(CPU_LOG_INT)
> -        && !excp_is_internal(cs->exception_index)) {
> -        qemu_log_mask(CPU_LOG_INT, "...with ESR 0x%x/0x%" PRIx32 "\n",
> -                      syn_get_ec(env->exception.syndrome),
> -                      env->exception.syndrome);
> -    }
> -
> -#ifdef CONFIG_TCG
> -    if (arm_is_psci_call(cpu, cs->exception_index)) {
> -        arm_handle_psci_call(cpu);
> -        qemu_log_mask(CPU_LOG_INT, "...handled as PSCI call\n");
> -        return;
> -    }
> -
> -    /*
> -     * Semihosting semantics depend on the register width of the code
> -     * that caused the exception, not the target exception level, so
> -     * must be handled here.
> -     */
> -    if (cs->exception_index == EXCP_SEMIHOST) {
> -        handle_semihosting(cs);
> -        return;
> -    }
> -#endif
> -
> -    /*
> -     * Hooks may change global state so BQL should be held, also the
> -     * BQL needs to be held for any modification of
> -     * cs->interrupt_request.
> -     */
> -    g_assert(qemu_mutex_iothread_locked());
> -
> -    arm_call_pre_el_change_hook(cpu);
> -
> -    assert(!excp_is_internal(cs->exception_index));
> -    if (arm_el_is_aa64(env, new_el)) {
> -        arm_cpu_do_interrupt_aarch64(cs);
> -    } else {
> -        arm_cpu_do_interrupt_aarch32(cs);
> -    }
> -
> -    arm_call_el_change_hook(cpu);
> -
> -    if (!kvm_enabled()) {
> -        cs->interrupt_request |= CPU_INTERRUPT_EXITTB;
> -    }
> -}
>   #endif /* !CONFIG_USER_ONLY */
>   
>   /* Returns true if the stage 1 translation regime is using LPAE format page
> diff --git a/target/arm/tcg/sysemu/tcg-cpu.c b/target/arm/tcg/sysemu/tcg-cpu.c
> new file mode 100644
> index 0000000000..af9d3905d7
> --- /dev/null
> +++ b/target/arm/tcg/sysemu/tcg-cpu.c
> @@ -0,0 +1,73 @@
> +/*
> + * QEMU ARM TCG CPU (sysemu code)
> + *
> + * Copyright (c) 2012 SUSE LINUX Products GmbH
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version 2
> + * of the License, or (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, see
> + * <http://www.gnu.org/licenses/gpl-2.0.html>
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/qemu-print.h"
> +#include "qemu-common.h"
> +#include "target/arm/idau.h"
> +#include "qemu/module.h"
> +#include "qapi/error.h"
> +#include "qapi/visitor.h"
> +#include "cpu.h"
> +#include "hw/core/tcg-cpu-ops.h"
> +#include "semihosting/common-semi.h"
> +#include "cpregs.h"
> +#include "internals.h"
> +#include "exec/exec-all.h"
> +#include "hw/qdev-properties.h"
> +#if !defined(CONFIG_USER_ONLY)
> +#include "hw/loader.h"
> +#include "hw/boards.h"
> +#endif
> +#include "sysemu/sysemu.h"
> +#include "sysemu/tcg.h"
> +#include "sysemu/hw_accel.h"
> +#include "kvm_arm.h"
> +#include "disas/capstone.h"
> +#include "fpu/softfloat.h"
> +#include "cpu-mmu.h"
> +#include "tcg/tcg-cpu.h"
> +
> +/*
> + * Do semihosting call and set the appropriate return value. All the
> + * permission and validity checks have been done at translate time.
> + *
> + * We only see semihosting exceptions in TCG only as they are not
> + * trapped to the hypervisor in KVM.
> + */
> +void handle_semihosting(CPUState *cs)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    CPUARMState *env = &cpu->env;
> +
> +    if (is_a64(env)) {
> +        qemu_log_mask(CPU_LOG_INT,
> +                      "...handling as semihosting call 0x%" PRIx64 "\n",
> +                      env->xregs[0]);
> +        env->xregs[0] = do_common_semihosting(cs);
> +        env->pc += 4;
> +    } else {
> +        qemu_log_mask(CPU_LOG_INT,
> +                      "...handling as semihosting call 0x%x\n",
> +                      env->regs[0]);
> +        env->regs[0] = do_common_semihosting(cs);
> +        env->regs[15] += env->thumb ? 2 : 4;
> +    }
> +}
> diff --git a/target/arm/tcg/sysemu/meson.build b/target/arm/tcg/sysemu/meson.build
> index 26014851bd..56e4b5ccea 100644
> --- a/target/arm/tcg/sysemu/meson.build
> +++ b/target/arm/tcg/sysemu/meson.build
> @@ -2,5 +2,6 @@ arm_softmmu_ss.add(when: 'CONFIG_TCG', if_true: files(
>     'debug_helper.c',
>     'm_helper.c',
>     'mte_helper.c',
> +  'tcg-cpu.c',
>     'tlb_helper.c',
>   ))
> 


