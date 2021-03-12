Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7813A3396A2
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 19:33:30 +0100 (CET)
Received: from localhost ([::1]:57986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKmbJ-0001aY-G6
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 13:33:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lKlaj-0004F4-In
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:28:49 -0500
Received: from mx2.suse.de ([195.135.220.15]:35212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lKlaV-0002DG-Rh
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:28:49 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7BC08AF4D;
 Fri, 12 Mar 2021 17:28:34 +0000 (UTC)
Subject: Re: [RFC v7 41/42] target/arm: add tcg cpu accel class
To: Paolo Bonzini <pbonzini@redhat.com>
References: <20210312172243.25334-1-cfontana@suse.de>
 <20210312172243.25334-42-cfontana@suse.de>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <c0f3c2f7-ec33-6ac1-0577-2abd5ddc64d2@suse.de>
Date: Fri, 12 Mar 2021 18:28:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210312172243.25334-42-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/12/21 6:22 PM, Claudio Fontana wrote:
> start by moving minimal init and realizefn code.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  target/arm/tcg/tcg-cpu.h        |  4 ++-
>  target/arm/cpu.c                | 38 +++------------------------
>  target/arm/tcg/sysemu/tcg-cpu.c | 27 +++++++++++++++++++
>  target/arm/tcg/tcg-cpu-models.c | 11 +++++---
>  target/arm/tcg/tcg-cpu.c        | 46 +++++++++++++++++++++++++++++++--
>  5 files changed, 85 insertions(+), 41 deletions(-)
> 
> diff --git a/target/arm/tcg/tcg-cpu.h b/target/arm/tcg/tcg-cpu.h
> index d93c6a6749..dd08587949 100644
> --- a/target/arm/tcg/tcg-cpu.h
> +++ b/target/arm/tcg/tcg-cpu.h
> @@ -22,15 +22,17 @@
>  
>  #include "cpu.h"
>  #include "hw/core/tcg-cpu-ops.h"
> +#include "hw/core/accel-cpu.h"
>  
>  void arm_cpu_synchronize_from_tb(CPUState *cs,
>                                   const TranslationBlock *tb);
>  
> -extern struct TCGCPUOps arm_tcg_ops;
> +void tcg_arm_init_accel_cpu(AccelCPUClass *accel_cpu, CPUClass *cc);
>  
>  #ifndef CONFIG_USER_ONLY
>  /* Do semihosting call and set the appropriate return value. */
>  void tcg_handle_semihosting(CPUState *cs);
> +bool tcg_cpu_realizefn(CPUState *cs, Error **errp);
>  
>  #endif /* !CONFIG_USER_ONLY */
>  
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index ac01fa0bae..09c1db604a 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -582,10 +582,6 @@ static void arm_cpu_initfn(Object *obj)
>      cpu->psci_version = 1; /* By default assume PSCI v0.1 */
>      cpu->kvm_target = QEMU_KVM_ARM_TARGET_NONE;
>  
> -    if (tcg_enabled()) {
> -        cpu->psci_version = 2; /* TCG implements PSCI 0.2 */
> -    }
> -
>      /* if required, do accelerator-specific cpu initializations */
>      accel_cpu_instance_init(CPU(obj));
>  }
> @@ -873,34 +869,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>      Error *local_err = NULL;
>      bool no_aa32 = false;
>  
> -    /*
> -     * If we needed to query the host kernel for the CPU features
> -     * then it's possible that might have failed in the initfn, but
> -     * this is the first point where we can report it.
> -     */
> -    if (cpu->host_cpu_probe_failed) {
> -        error_setg(errp, "The 'host' CPU type can only be used with KVM");
> -        return;
> -    }
> -
> -#ifndef CONFIG_USER_ONLY
> -    /* The NVIC and M-profile CPU are two halves of a single piece of
> -     * hardware; trying to use one without the other is a command line
> -     * error and will result in segfaults if not caught here.
> -     */
> -    if (arm_feature(env, ARM_FEATURE_M)) {
> -        if (!env->nvic) {
> -            error_setg(errp, "This board cannot be used with Cortex-M CPUs");
> -            return;
> -        }
> -    } else {
> -        if (env->nvic) {
> -            error_setg(errp, "This board can only be used with Cortex-M CPUs");
> -            return;
> -        }
> -    }
> -
> -#ifdef CONFIG_TCG
> +#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
>      {
>          uint64_t scale;
>  
> @@ -926,8 +895,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>          cpu->gt_timer[GTIMER_HYPVIRT] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
>                                                    arm_gt_hvtimer_cb, cpu);
>      }
> -#endif /* CONFIG_TCG */
> -#endif /* !CONFIG_USER_ONLY */
> +#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
>  
>      cpu_exec_realizefn(cs, &local_err);
>      if (local_err != NULL) {
> @@ -1463,7 +1431,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
>      cc->disas_set_info = arm_disas_set_info;
>  
>  #ifdef CONFIG_TCG
> -    cc->tcg_ops = &arm_tcg_ops;
> +    cc->init_accel_cpu = tcg_arm_init_accel_cpu;
>  #endif /* CONFIG_TCG */
>  
>      arm32_cpu_class_init(oc, data);
> diff --git a/target/arm/tcg/sysemu/tcg-cpu.c b/target/arm/tcg/sysemu/tcg-cpu.c
> index 664a7ee206..c5b8f136ee 100644
> --- a/target/arm/tcg/sysemu/tcg-cpu.c
> +++ b/target/arm/tcg/sysemu/tcg-cpu.c
> @@ -19,10 +19,13 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "qemu/timer.h"
>  #include "cpu.h"
>  #include "hw/semihosting/common-semi.h"
>  #include "qemu/log.h"
>  #include "tcg/tcg-cpu.h"
> +#include "internals.h"
>  
>  /*
>   * Do semihosting call and set the appropriate return value. All the
> @@ -50,3 +53,27 @@ void tcg_handle_semihosting(CPUState *cs)
>          env->regs[15] += env->thumb ? 2 : 4;
>      }
>  }
> +
> +bool tcg_cpu_realizefn(CPUState *cs, Error **errp)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    CPUARMState *env = &cpu->env;
> +
> +    /*
> +     * The NVIC and M-profile CPU are two halves of a single piece of
> +     * hardware; trying to use one without the other is a command line
> +     * error and will result in segfaults if not caught here.
> +     */
> +    if (arm_feature(env, ARM_FEATURE_M)) {
> +        if (!env->nvic) {
> +            error_setg(errp, "This board cannot be used with Cortex-M CPUs");
> +            return false;
> +        }
> +    } else {
> +        if (env->nvic) {
> +            error_setg(errp, "This board can only be used with Cortex-M CPUs");
> +            return false;
> +        }
> +    }
> +    return true;
> +}
> diff --git a/target/arm/tcg/tcg-cpu-models.c b/target/arm/tcg/tcg-cpu-models.c
> index 16ab5d5364..2f44fd1b41 100644
> --- a/target/arm/tcg/tcg-cpu-models.c
> +++ b/target/arm/tcg/tcg-cpu-models.c
> @@ -844,15 +844,20 @@ static struct TCGCPUOps arm_v7m_tcg_ops = {
>  #endif /* !CONFIG_USER_ONLY */
>  };
>  
> +static void arm_v7m_init_accel_cpu(AccelCPUClass *accel_cpu, CPUClass *cc)
> +{
> +    g_assert(object_class_by_name(ACCEL_CPU_NAME("tcg")) == OBJECT_CLASS(accel_cpu));
> +
> +    cc->tcg_ops = &arm_v7m_tcg_ops;
> +}
> +


Hi Paolo,

just to give you a pointer or where/how this stuff currently is used.

Ciao,

Claudio


>  static void arm_v7m_class_init(ObjectClass *oc, void *data)
>  {
>      ARMCPUClass *acc = ARM_CPU_CLASS(oc);
>      CPUClass *cc = CPU_CLASS(oc);
>  
>      acc->info = data;
> -#ifdef CONFIG_TCG
> -    cc->tcg_ops = &arm_v7m_tcg_ops;
> -#endif /* CONFIG_TCG */
> +    cc->init_accel_cpu = arm_v7m_init_accel_cpu;
>  
>      cc->gdb_core_xml_file = "arm-m-profile.xml";
>  }
> diff --git a/target/arm/tcg/tcg-cpu.c b/target/arm/tcg/tcg-cpu.c
> index 9fd996d908..b5e530e7ab 100644
> --- a/target/arm/tcg/tcg-cpu.c
> +++ b/target/arm/tcg/tcg-cpu.c
> @@ -20,8 +20,8 @@
>  
>  #include "qemu/osdep.h"
>  #include "cpu.h"
> +#include "qapi/error.h"
>  #include "tcg-cpu.h"
> -#include "hw/core/tcg-cpu-ops.h"
>  #include "cpregs.h"
>  #include "internals.h"
>  #include "exec/exec-all.h"
> @@ -212,7 +212,7 @@ static bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>      return true;
>  }
>  
> -struct TCGCPUOps arm_tcg_ops = {
> +static struct TCGCPUOps arm_tcg_ops = {
>      .initialize = arm_translate_init,
>      .synchronize_from_tb = arm_cpu_synchronize_from_tb,
>      .cpu_exec_interrupt = arm_cpu_exec_interrupt,
> @@ -227,3 +227,45 @@ struct TCGCPUOps arm_tcg_ops = {
>      .debug_check_watchpoint = arm_debug_check_watchpoint,
>  #endif /* !CONFIG_USER_ONLY */
>  };
> +
> +void tcg_arm_init_accel_cpu(AccelCPUClass *accel_cpu, CPUClass *cc)
> +{
> +    g_assert(object_class_by_name(ACCEL_CPU_NAME("tcg")) == OBJECT_CLASS(accel_cpu));
> +
> +    cc->tcg_ops = &arm_tcg_ops;
> +}
> +
> +static void tcg_cpu_instance_init(CPUState *cs)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +
> +    /*
> +     * this would be the place to move TCG-specific props
> +     * in future refactoring of cpu properties.
> +     */
> +
> +    cpu->psci_version = 2; /* TCG implements PSCI 0.2 */
> +}
> +
> +static void tcg_cpu_accel_class_init(ObjectClass *oc, void *data)
> +{
> +    AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
> +
> +#ifndef CONFIG_USER_ONLY
> +    acc->cpu_realizefn = tcg_cpu_realizefn;
> +#endif /* CONFIG_USER_ONLY */
> +
> +    acc->cpu_instance_init = tcg_cpu_instance_init;
> +}
> +static const TypeInfo tcg_cpu_accel_type_info = {
> +    .name = ACCEL_CPU_NAME("tcg"),
> +
> +    .parent = TYPE_ACCEL_CPU,
> +    .class_init = tcg_cpu_accel_class_init,
> +    .abstract = true,
> +};
> +static void tcg_cpu_accel_register_types(void)
> +{
> +    type_register_static(&tcg_cpu_accel_type_info);
> +}
> +type_init(tcg_cpu_accel_register_types);
> 


