Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 534A748F6F6
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Jan 2022 14:08:07 +0100 (CET)
Received: from localhost ([::1]:47160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8ims-00044r-Ei
	for lists+qemu-devel@lfdr.de; Sat, 15 Jan 2022 08:08:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1n8ihU-0001DZ-Re
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 08:02:32 -0500
Received: from [2001:41c9:1:41f::167] (port=48726
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1n8ihS-0002Eo-R5
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 08:02:32 -0500
Received: from [2a00:23c4:8ba0:4900:614:7796:ec2b:4f88]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1n8igz-0005tc-0v; Sat, 15 Jan 2022 13:02:05 +0000
Message-ID: <b408d809-9f4c-a524-eeb9-ac7fed9db504@ilande.co.uk>
Date: Sat, 15 Jan 2022 13:02:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220108091419.2027710-1-yangxiaojuan@loongson.cn>
 <20220108091419.2027710-6-yangxiaojuan@loongson.cn>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220108091419.2027710-6-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:4900:614:7796:ec2b:4f88
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC PATCH v4 05/30] target/loongarch: Add constant timer support
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org, philmd@redhat.com,
 Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/01/2022 09:13, Xiaojuan Yang wrote:

> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
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
> +#define CONSTANT_TIMER_TICK_MASK    0xfffffffffffcUL
> +#define CONSTANT_TIMER_ENABLE       0x1UL
> +
> +/* LoongArch timer */
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

As I mentioned previously, I'm not convinced that adding the CONFIG_USER_ONLY guards 
is the right thing to do here.

For SPARC64 there is a separate sparc64_cpu_devinit() function that is only called in 
sysemu mode (via the machine init() function) which sets up the timers. Have a look 
at hw/sparc64/sparc64.c and hw/sparc64/sun4u.c for an existing reference as to how 
this is done.

This suggests that a similar function would need to exist in hw/loongarch/loongson3.c.

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
>   ))
>   
>   loongarch_ss.add_all(when: 'CONFIG_TCG', if_true: [loongarch_tcg_ss])


ATB,

Mark.

