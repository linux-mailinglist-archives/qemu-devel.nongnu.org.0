Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B3E307A14
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 16:54:07 +0100 (CET)
Received: from localhost ([::1]:59566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l59cU-00037b-Hg
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 10:54:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l59b6-00027c-Ie
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 10:52:40 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:40542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l59b3-000820-Fp
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 10:52:40 -0500
Received: by mail-ej1-x635.google.com with SMTP id gx5so8476093ejb.7
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 07:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zF8xeAznwgn4L/OdyBHBQ5UOpYDEsDc3ed21kkQniYI=;
 b=e7dlQYzZ0toMRVoIdrmp0UvbfXFQfD5JzJMR9IanrWoH5id1wVGBdurAHnh9dJsBn9
 2Wzm4wREsis68L7pYX/W4ICKh2XngiTAL3HgnuthK41J92Uy5efHo2kFUNDppBNp/3uo
 9dJVMY7tzgIPA6/eJ0D8MfxDocR1wLkp0zjKCzvPEjNAF2jcIXgIrtJiZSmdC1oTl0Vu
 aTGPG+sVHlIZpNgk0wPh8DHz7LE8cubobVUV7BA6WiA+i2Wq6Q9fNvdLlDRVD59vsSdq
 g1XYBp2oHfUdI/h6KBwx5Cm3/iarPHoVujhMYKrlqdsDxl3s2mQNHHm7wbZv6o6h8V7q
 sRzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zF8xeAznwgn4L/OdyBHBQ5UOpYDEsDc3ed21kkQniYI=;
 b=YzCzceTIovjipx5aCSvyYlj2/Eh3WJLSah+4QQ9IFqneQKBtTFQ1nGoScEjAtEmj+Z
 U7ZsDZe/1cHN/FIR6Q9Yf3QLud/gLF7EQBGhzQm2H4US97shDhBrHk+boyMgh3uHLR03
 JugveZxg0hbcFc3RDilh8en85YPz7H7vkoLwsCj32JLMlBK3FnAME392c/2H3pDVd7Tb
 uTDjcOzE05yDpdL0V4HqpIn9t4r12+w8a7XuJvoKDqSSQZxMWmqr9cXFD1gX3V2rPIxB
 qsdZISIIeHl/402RJ7fR/sg87gUEmOC7y0rEcxBF9UhCJxIJBh8Wyd5imGJ1kwO1de79
 xgog==
X-Gm-Message-State: AOAM530ewAYemZeJ5GLKb8QJDPFBpugET4PdWxyLXDzGxgVvwRihCSbl
 cx4YntTalpbAmvp4Bi4u/q/82epnK/GUnRg+6Fljkw==
X-Google-Smtp-Source: ABdhPJwK/ZZcjNrKUbn+ipl10ut5by/3e2gObX+MQuvFJznvx34fVkLv+HL0ZXv2Z9zRdHV26+ntP643rd5ec1ee1II=
X-Received: by 2002:a17:906:b215:: with SMTP id
 p21mr11571615ejz.407.1611849153114; 
 Thu, 28 Jan 2021 07:52:33 -0800 (PST)
MIME-Version: 1.0
References: <20210120224444.71840-1-agraf@csgraf.de>
 <20210120224444.71840-8-agraf@csgraf.de>
In-Reply-To: <20210120224444.71840-8-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 15:52:21 +0000
Message-ID: <CAFEAcA_-4GYk_+jdczWE720-VH1CLcS+1jVB2LzG=bBBJc8w-g@mail.gmail.com>
Subject: Re: [PATCH v6 07/11] hvf: Add Apple Silicon support
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 20 Jan 2021 at 22:44, Alexander Graf <agraf@csgraf.de> wrote:
>
> With Apple Silicon available to the masses, it's a good time to add support
> for driving its virtualization extensions from QEMU.
>
> This patch adds all necessary architecture specific code to get basic VMs
> working. It's still pretty raw, but definitely functional.
>
> Known limitations:
>
>   - Vtimer acknowledgement is hacky
>   - Should implement more sysregs and fault on invalid ones then
>   - WFI handling is missing, need to marry it with vtimer
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>

> --- a/accel/hvf/hvf-cpus.c
> +++ b/accel/hvf/hvf-cpus.c
> @@ -58,6 +58,10 @@
>  #include "sysemu/runstate.h"
>  #include "qemu/guest-random.h"
>
> +#ifdef __aarch64__
> +#define HV_VM_DEFAULT NULL
> +#endif
>  /* Memory slots */
>
>  struct mac_slot {
> @@ -328,7 +332,11 @@ static int hvf_init_vcpu(CPUState *cpu)
>      pthread_sigmask(SIG_BLOCK, NULL, &set);
>      sigdelset(&set, SIG_IPI);
>
> +#ifdef __aarch64__
> +    r = hv_vcpu_create(&cpu->hvf->fd, (hv_vcpu_exit_t **)&cpu->hvf->exit, NULL);
> +#else
>      r = hv_vcpu_create((hv_vcpuid_t *)&cpu->hvf->fd, HV_VCPU_DEFAULT);
> +#endif
>      cpu->vcpu_dirty = 1;
>      assert_hvf_ok(r);
>
> @@ -399,8 +407,14 @@ static void hvf_start_vcpu_thread(CPUState *cpu)
>                         cpu, QEMU_THREAD_JOINABLE);
>  }
>
> +__attribute__((weak)) void hvf_kick_vcpu_thread(CPUState *cpu)
> +{
> +    cpus_kick_thread(cpu);
> +}
> +
>  static const CpusAccel hvf_cpus = {
>      .create_vcpu_thread = hvf_start_vcpu_thread,
> +    .kick_vcpu_thread = hvf_kick_vcpu_thread,
>
>      .synchronize_post_reset = hvf_cpu_synchronize_post_reset,
>      .synchronize_post_init = hvf_cpu_synchronize_post_init,
> diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
> index 9d3cb53e47..c2ac6c8f97 100644
> --- a/include/sysemu/hvf_int.h
> +++ b/include/sysemu/hvf_int.h
> @@ -11,7 +11,12 @@
>  #ifndef HVF_INT_H
>  #define HVF_INT_H
>
> +#include "qemu/osdep.h"

.h files must never include osdep.h (all .c files do as their first
include line).

> +#ifdef __aarch64__
> +#include <Hypervisor/Hypervisor.h>
> +#else
>  #include <Hypervisor/hv.h>
> +#endif
>
>  /* hvf_slot flags */
>  #define HVF_SLOT_LOG (1 << 0)
> @@ -44,7 +49,8 @@ struct HVFState {
>  extern HVFState *hvf_state;
>
>  struct hvf_vcpu_state {
> -    int fd;
> +    uint64_t fd;

Why the change in the type for 'fd' ?

> +    void *exit;

Can we define this as a "hv_vcpu_exit_t *" so we don't have to
cast it in the call to hv_vcpu_create() ?

>  };
>
>  void assert_hvf_ok(hv_return_t ret);
> @@ -54,5 +60,6 @@ int hvf_arch_init_vcpu(CPUState *cpu);
>  void hvf_arch_vcpu_destroy(CPUState *cpu);
>  int hvf_vcpu_exec(CPUState *cpu);
>  hvf_slot *hvf_find_overlap_slot(uint64_t, uint64_t);
> +void hvf_kick_vcpu_thread(CPUState *cpu);
>
>  #endif
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> new file mode 100644
> index 0000000000..8f18efe856
> --- /dev/null
> +++ b/target/arm/hvf/hvf.c
> @@ -0,0 +1,618 @@
> +/*
> + * QEMU Hypervisor.framework support for Apple Silicon
> +
> + * Copyright 2020 Alexander Graf <agraf@csgraf.de>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu-common.h"
> +#include "qemu/error-report.h"
> +
> +#include "sysemu/runstate.h"
> +#include "sysemu/hvf.h"
> +#include "sysemu/hvf_int.h"
> +#include "sysemu/hw_accel.h"
> +
> +#include "exec/address-spaces.h"
> +#include "hw/irq.h"
> +#include "qemu/main-loop.h"
> +#include "sysemu/accel.h"
> +#include "sysemu/cpus.h"
> +#include "target/arm/cpu.h"
> +#include "target/arm/internals.h"
> +
> +#define HVF_DEBUG 0
> +#define DPRINTF(...)                                        \
> +    if (HVF_DEBUG) {                                        \
> +        fprintf(stderr, "HVF %s:%d ", __func__, __LINE__);  \
> +        fprintf(stderr, __VA_ARGS__);                       \
> +        fprintf(stderr, "\n");                              \
> +    }

No new DPRINTF macros, please. Use tracepoints.

> +
> +#define HVF_SYSREG(crn, crm, op0, op1, op2) \
> +        ENCODE_AA64_CP_REG(CP_REG_ARM64_SYSREG_CP, crn, crm, op0, op1, op2)
> +#define PL1_WRITE_MASK 0x4
> +
> +#define SYSREG(op0, op1, crn, crm, op2) \
> +    ((op0 << 20) | (op2 << 17) | (op1 << 14) | (crn << 10) | (crm << 1))
> +#define SYSREG_MASK           SYSREG(0x3, 0x7, 0xf, 0xf, 0x7)
> +#define SYSREG_CNTPCT_EL0     SYSREG(3, 3, 14, 0, 1)
> +#define SYSREG_PMCCNTR_EL0    SYSREG(3, 3, 9, 13, 0)
> +
> +#define WFX_IS_WFE (1 << 0)



> +static const struct hvf_sreg_match hvf_sreg_match[] = {
> +    { HV_SYS_REG_DBGBVR0_EL1, HVF_SYSREG(0, 0, 14, 0, 4) },
> +    { HV_SYS_REG_DBGBCR0_EL1, HVF_SYSREG(0, 0, 14, 0, 5) },
> +    { HV_SYS_REG_DBGWVR0_EL1, HVF_SYSREG(0, 0, 14, 0, 6) },
> +    { HV_SYS_REG_DBGWCR0_EL1, HVF_SYSREG(0, 0, 14, 0, 7) },

I'm not a huge fan of this big long hardcoded list of registers.
Is there some way to work from either the QEMU cpregs hashtable
or asking the hypervisor framework about what sysregs it has?
(Compare the KVM approach, though I admit it has its own issues,
so if there's a genuinely better way to do something I'm not
ruling it out on principle.)

> +#ifdef SYNC_NO_RAW_REGS

What's this ifdef for?


> +int hvf_get_registers(CPUState *cpu)
> +{
> +    ARMCPU *arm_cpu = ARM_CPU(cpu);
> +    CPUARMState *env = &arm_cpu->env;
> +    hv_return_t ret;
> +    uint64_t val;
> +    int i;
> +
> +    for (i = 0; i < ARRAY_SIZE(hvf_reg_match); i++) {
> +        ret = hv_vcpu_get_reg(cpu->hvf->fd, hvf_reg_match[i].reg, &val);
> +        *(uint64_t *)((void *)env + hvf_reg_match[i].offset) = val;
> +        assert_hvf_ok(ret);
> +    }
> +
> +    val = 0;
> +    ret = hv_vcpu_get_reg(cpu->hvf->fd, HV_REG_FPCR, &val);
> +    assert_hvf_ok(ret);
> +    vfp_set_fpcr(env, val);
> +
> +    val = 0;
> +    ret = hv_vcpu_get_reg(cpu->hvf->fd, HV_REG_FPSR, &val);
> +    assert_hvf_ok(ret);
> +    vfp_set_fpsr(env, val);
> +
> +    ret = hv_vcpu_get_reg(cpu->hvf->fd, HV_REG_CPSR, &val);
> +    assert_hvf_ok(ret);
> +    pstate_write(env, val);
> +
> +    for (i = 0; i < ARRAY_SIZE(hvf_sreg_match); i++) {
> +        ret = hv_vcpu_get_sys_reg(cpu->hvf->fd, hvf_sreg_match[i].reg, &val);
> +        assert_hvf_ok(ret);
> +
> +        arm_cpu->cpreg_values[i] = val;
> +    }
> +    write_list_to_cpustate(arm_cpu);

Have I missed it, or are we not syncing the FPU/vector registers?

> +    return 0;
> +}
> +            if (iswrite) {
> +                val = hvf_get_reg(cpu, srt);
> +                address_space_write(&address_space_memory,
> +                                    hvf_exit->exception.physical_address,
> +                                    MEMTXATTRS_UNSPECIFIED, &val, len);

Does the hvf framework provide a way to report the external-abort
if address_space_write() returns something other than MEMTX_OK ?

> +            break;
> +        case EC_AA64_SMC:
> +            cpu_synchronize_state(cpu);
> +            if (arm_is_psci_call(arm_cpu, EXCP_SMC)) {
> +                arm_handle_psci_call(arm_cpu);

Have you checked that all the PSCI code really can cope
with being called from a non-TCG accelerator? (As an example
the CPU_SUSPEND implementation calls the TCG wfi helper...)

> +            } else {
> +                DPRINTF("unknown SMC! %016llx", env->xregs[0]);
> +                env->xregs[0] = -1;

This should inject an UNDEF exception into the guest. (Compare
the pre_smc helper in target/arm/op_helper.c for TCG.)

> +            }
> +            env->pc += 4;
> +            break;
> +        default:
> +            cpu_synchronize_state(cpu);
> +            DPRINTF("exit: %llx [ec=0x%x pc=0x%llx]", syndrome, ec, env->pc);
> +            error_report("%llx: unhandled exit %llx", env->pc, exit_reason);

Hex values should have leading '0x'.

> +        }
> +
> +        if (advance_pc) {
> +            uint64_t pc;
> +
> +            flush_cpu_state(cpu);
> +
> +            r = hv_vcpu_get_reg(cpu->hvf->fd, HV_REG_PC, &pc);
> +            assert_hvf_ok(r);
> +            pc += 4;
> +            r = hv_vcpu_set_reg(cpu->hvf->fd, HV_REG_PC, pc);
> +            assert_hvf_ok(r);
> +        }
> +    }
> +}

thanks
-- PMM

