Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2988B488892
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 10:48:16 +0100 (CET)
Received: from localhost ([::1]:33150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6UoB-0005hB-A5
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 04:48:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1n6UTp-0005QS-Td
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 04:27:13 -0500
Received: from mail.xen0n.name ([115.28.160.31]:55754
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1n6UTm-0006LO-NK
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 04:27:13 -0500
Received: from [192.168.9.172] (unknown [101.88.31.179])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id BF6B162E7D;
 Sun,  9 Jan 2022 17:26:47 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1641720407; bh=YsGOzP9i+oL0P2/5FgHtwoqzhB8c0FsLTD690Uf+8Ps=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=jh/jMAU/SZH+mBIZnpNxT4HnlBJE1hkN40VbTwHS2i9EtgHxJJfKzJT7clRAr2pP2
 rYujOYWlZ4gpiNFVh5tQzfE6iSgOkSzRuWGgKVNoGq0rtIbCEifjj+ya0IS/dzEJdq
 g094xPdCyDi2Auem60qujOqbJMXvsE++X9RQo+Zw=
Message-ID: <723016f8-a122-797b-a9a3-dbaf21bc2048@xen0n.name>
Date: Sun, 9 Jan 2022 17:25:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:97.0) Gecko/20100101
 Thunderbird/97.0a1
From: WANG Xuerui <i.qemu@xen0n.name>
Subject: Re: [RFC PATCH v4 05/30] target/loongarch: Add constant timer support
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220108091419.2027710-1-yangxiaojuan@loongson.cn>
 <20220108091419.2027710-6-yangxiaojuan@loongson.cn>
Content-Language: en-US
In-Reply-To: <20220108091419.2027710-6-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: mark.cave-ayland@ilande.co.uk, richard.henderson@linaro.org,
 philmd@redhat.com, Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 1/8/22 17:13, Xiaojuan Yang wrote:
> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   target/loongarch/constant_timer.c | 63 +++++++++++++++++++++++++++++++
>   target/loongarch/cpu.c            |  9 +++++
>   target/loongarch/cpu.h            | 10 +++++
>   target/loongarch/meson.build      |  1 +
>   4 files changed, 83 insertions(+)
>   create mode 100644 target/loongarch/constant_timer.c
>
> diff --git a/target/loongarch/constant_timer.c b/target/loongarch/constant_timer.c
> new file mode 100644
> index 0000000000..e7d0f5ffe7
> --- /dev/null
> +++ b/target/loongarch/constant_timer.c
> @@ -0,0 +1,63 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * QEMU LoongArch constant timer support
> + *
> + * Copyright (c) 2021 Loongson Technology Corporation Limited
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/loongarch/loongarch.h"
> +#include "qemu/timer.h"
> +#include "cpu.h"
> +
> +#define TIMER_PERIOD                10 /* 10 ns period for 100 Mhz frequency */
"MHz"
> +#define CONSTANT_TIMER_TICK_MASK    0xfffffffffffcUL
> +#define CONSTANT_TIMER_ENABLE       0x1UL
> +
> +/* LoongArch timer */
Looks like this comment is for some type definitions, but the function 
below is just an accessor, so remove it? The whole file is about the 
"LoongArch timer" after all.
> +uint64_t cpu_loongarch_get_constant_timer_counter(LoongArchCPU *cpu)
> +{
> +    return qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) / TIMER_PERIOD;
> +}
> +
> +uint64_t cpu_loongarch_get_constant_timer_ticks(LoongArchCPU *cpu)
> +{
> +    uint64_t now, expire;
> +
> +    now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +    expire = timer_expire_time_ns(&cpu->timer);
> +
> +    return (expire - now) / TIMER_PERIOD;
> +}
> +
> +void cpu_loongarch_store_constant_timer_config(LoongArchCPU *cpu,
> +                                               uint64_t value)
> +{
> +    CPULoongArchState *env = &cpu->env;
> +    uint64_t now, next;
> +
> +    env->CSR_TCFG = value;
> +    if (value & CONSTANT_TIMER_ENABLE) {
> +        now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +        next = now + (value & CONSTANT_TIMER_TICK_MASK) * TIMER_PERIOD;
> +        timer_mod(&cpu->timer, next);
> +    }
> +}
> +
> +void loongarch_constant_timer_cb(void *opaque)
> +{
> +    LoongArchCPU *cpu  = opaque;
> +    CPULoongArchState *env = &cpu->env;
> +    uint64_t now, next;
> +
> +    if (FIELD_EX64(env->CSR_TCFG, CSR_TCFG, PERIODIC)) {
> +        now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +        next = now + (env->CSR_TCFG & CONSTANT_TIMER_TICK_MASK) * TIMER_PERIOD;
> +        timer_mod(&cpu->timer, next);
> +    } else {
> +        env->CSR_TCFG = FIELD_DP64(env->CSR_TCFG, CSR_TCFG, EN, 0);
> +    }
> +
> +    env->CSR_ESTAT |= 1 << IRQ_TIMER;
> +    cpu_interrupt(CPU(cpu), CPU_INTERRUPT_HARD);
> +}
> diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
> index 690eeea2e6..823951dddd 100644
> --- a/target/loongarch/cpu.c
> +++ b/target/loongarch/cpu.c
> @@ -235,12 +235,21 @@ static void loongarch_cpu_realizefn(DeviceState *dev, Error **errp)
>       LoongArchCPUClass *lacc = LOONGARCH_CPU_GET_CLASS(dev);
>       Error *local_err = NULL;
>   
> +#ifndef CONFIG_USER_ONLY
> +    LoongArchCPU *cpu = LOONGARCH_CPU(dev);
> +#endif
> +
>       cpu_exec_realizefn(cs, &local_err);
>       if (local_err != NULL) {
>           error_propagate(errp, local_err);
>           return;
>       }
>   
> +#ifndef CONFIG_USER_ONLY
> +    timer_init_ns(&cpu->timer, QEMU_CLOCK_VIRTUAL,
> +                  &loongarch_constant_timer_cb, cpu);
> +#endif
> +
>       cpu_reset(cs);
>       qemu_init_vcpu(cs);
>   
> diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
> index cf7fc46f72..ef84584678 100644
> --- a/target/loongarch/cpu.h
> +++ b/target/loongarch/cpu.h
> @@ -12,6 +12,7 @@
>   #include "fpu/softfloat-types.h"
>   #include "hw/registerfields.h"
>   #include "cpu-csr.h"
> +#include "qemu/timer.h"
>   
>   #define TCG_GUEST_DEFAULT_MO (0)
>   
> @@ -148,6 +149,9 @@ FIELD(CPUCFG20, L3IU_SIZE, 24, 7)
>   extern const char * const regnames[32];
>   extern const char * const fregnames[32];
>   
> +#define N_IRQS      14
> +#define IRQ_TIMER   11
> +
>   typedef struct CPULoongArchState CPULoongArchState;
>   struct CPULoongArchState {
>       uint64_t gpr[32];
> @@ -242,6 +246,7 @@ struct LoongArchCPU {
>   
>       CPUNegativeOffsetState neg;
>       CPULoongArchState env;
> +    QEMUTimer timer; /* Internal timer */
What do you mean by "internal", is there any "external" counterpart? If 
there isn't one, I think you may be referring to the "architectural" 
timer instead (as is defined by LoongArch, instead of any concrete 
implementation), and this would have to be changed accordingly.
>   };
>   
>   #define TYPE_LOONGARCH_CPU "loongarch-cpu"
> @@ -306,4 +311,9 @@ enum {
>   #define LOONGARCH_CPU_TYPE_NAME(model) model LOONGARCH_CPU_TYPE_SUFFIX
>   #define CPU_RESOLVING_TYPE TYPE_LOONGARCH_CPU
>   
> +void loongarch_constant_timer_cb(void *opaque);
> +uint64_t cpu_loongarch_get_constant_timer_counter(LoongArchCPU *cpu);
> +uint64_t cpu_loongarch_get_constant_timer_ticks(LoongArchCPU *cpu);
> +void cpu_loongarch_store_constant_timer_config(LoongArchCPU *cpu,
> +                                               uint64_t value);
>   #endif /* LOONGARCH_CPU_H */
> diff --git a/target/loongarch/meson.build b/target/loongarch/meson.build
> index 103f36ee15..6168e910a0 100644
> --- a/target/loongarch/meson.build
> +++ b/target/loongarch/meson.build
> @@ -17,6 +17,7 @@ loongarch_tcg_ss.add(zlib)
>   loongarch_softmmu_ss = ss.source_set()
>   loongarch_softmmu_ss.add(files(
>     'machine.c',
> +  'constant_timer.c',
Why not alphabetical order? Is there any requirement for ordering here? 
I don't think there is one.
>   ))
>   
>   loongarch_ss.add_all(when: 'CONFIG_TCG', if_true: [loongarch_tcg_ss])

