Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 327BD46B35D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 08:06:36 +0100 (CET)
Received: from localhost ([::1]:46768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muUYc-0001CI-PN
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 02:06:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maobibo@loongson.cn>)
 id 1muUXY-0000Xb-5F
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 02:05:28 -0500
Received: from mail.loongson.cn ([114.242.206.163]:42124 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maobibo@loongson.cn>) id 1muUXU-0008HH-9Z
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 02:05:27 -0500
Received: from [10.20.42.25] (unknown [10.20.42.25])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxisiYB69h8iIEAA--.8562S3;
 Tue, 07 Dec 2021 15:04:57 +0800 (CST)
Subject: Re: [RFC PATCH v3 05/27] target/loongarch: Add stabletimer support
To: chen huacai <zltjiangshi@gmail.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>
References: <1638619645-11283-1-git-send-email-yangxiaojuan@loongson.cn>
 <1638619645-11283-6-git-send-email-yangxiaojuan@loongson.cn>
 <CABDp7Vr5b_gpE3d3U1NL1VMw4xoZMEqtnOiiVe=j-5ODerefng@mail.gmail.com>
From: maobibo <maobibo@loongson.cn>
Message-ID: <501fdbf2-e586-02e3-c091-406253b05ec4@loongson.cn>
Date: Tue, 7 Dec 2021 15:04:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CABDp7Vr5b_gpE3d3U1NL1VMw4xoZMEqtnOiiVe=j-5ODerefng@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9AxisiYB69h8iIEAA--.8562S3
X-Coremail-Antispam: 1UD129KBjvJXoW3Gw48ZF48Aw18CF48KrWDCFg_yoW7uF4DpF
 Z7CF9xKF4UtrZrJwn7tas0qF1DXr4xGr129a1fKFW8CwsFvwn7Xa40g39ruFy7Z3WF9rWI
 vF10vw1Y9F48J37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9C14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
 0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I
 8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
 xVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
 AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8I
 cIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI
 0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUQvtAUUUUU=
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=maobibo@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.44,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 chenhuacai@loongson.cn, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 i.qemu@xen0n.name, mark.cave-ayland@ilande.co.uk,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, peterx@redhat.com,
 qemu-level <qemu-devel@nongnu.org>, alistair.francis@wdc.com,
 Song Gao <gaosong@loongson.cn>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/06/2021 12:38 PM, chen huacai wrote:
> Hi, Xiaojuan,
> 
> Maybe it is better to use "constant timer" instead of "stable timer",
> which is more "native" in English.

Yeap, maybe we need more investigation. On arm platform its name is ArchTimer
rather than "constant timer" in x86. And we will investigate the timer name
across different architecture.

regards
bibo, mao

> 
> Huacai
> 
> On Sat, Dec 4, 2021 at 8:11 PM Xiaojuan Yang <yangxiaojuan@loongson.cn> wrote:
>>
>> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>> ---
>>  target/loongarch/cpu.c         |  9 +++++
>>  target/loongarch/cpu.h         | 10 ++++++
>>  target/loongarch/meson.build   |  1 +
>>  target/loongarch/stabletimer.c | 63 ++++++++++++++++++++++++++++++++++
>>  4 files changed, 83 insertions(+)
>>  create mode 100644 target/loongarch/stabletimer.c
>>
>> diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
>> index 343632c644..f34e9763af 100644
>> --- a/target/loongarch/cpu.c
>> +++ b/target/loongarch/cpu.c
>> @@ -234,12 +234,21 @@ static void loongarch_cpu_realizefn(DeviceState *dev, Error **errp)
>>      LoongArchCPUClass *lacc = LOONGARCH_CPU_GET_CLASS(dev);
>>      Error *local_err = NULL;
>>
>> +#ifndef CONFIG_USER_ONLY
>> +    LoongArchCPU *cpu = LOONGARCH_CPU(dev);
>> +#endif
>> +
>>      cpu_exec_realizefn(cs, &local_err);
>>      if (local_err != NULL) {
>>          error_propagate(errp, local_err);
>>          return;
>>      }
>>
>> +#ifndef CONFIG_USER_ONLY
>> +    timer_init_ns(&cpu->timer, QEMU_CLOCK_VIRTUAL,
>> +                  &loongarch_stable_timer_cb, cpu);
>> +#endif
>> +
>>      cpu_reset(cs);
>>      qemu_init_vcpu(cs);
>>
>> diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
>> index a4acd3b285..aeb8a5d397 100644
>> --- a/target/loongarch/cpu.h
>> +++ b/target/loongarch/cpu.h
>> @@ -12,6 +12,7 @@
>>  #include "fpu/softfloat-types.h"
>>  #include "hw/registerfields.h"
>>  #include "cpu-csr.h"
>> +#include "qemu/timer.h"
>>
>>  #define TCG_GUEST_DEFAULT_MO (0)
>>
>> @@ -148,6 +149,9 @@ FIELD(CPUCFG20, L3IU_SIZE, 24, 7)
>>  extern const char * const regnames[];
>>  extern const char * const fregnames[];
>>
>> +#define N_IRQS      14
>> +#define IRQ_TIMER   11
>> +
>>  typedef struct CPULoongArchState CPULoongArchState;
>>  struct CPULoongArchState {
>>      uint64_t gpr[32];
>> @@ -242,6 +246,7 @@ struct LoongArchCPU {
>>
>>      CPUNegativeOffsetState neg;
>>      CPULoongArchState env;
>> +    QEMUTimer timer; /* Internal timer */
>>  };
>>
>>  #define TYPE_LOONGARCH_CPU "loongarch-cpu"
>> @@ -306,4 +311,9 @@ enum {
>>  #define LOONGARCH_CPU_TYPE_NAME(model) model LOONGARCH_CPU_TYPE_SUFFIX
>>  #define CPU_RESOLVING_TYPE TYPE_LOONGARCH_CPU
>>
>> +void loongarch_stable_timer_cb(void *opaque);
>> +uint64_t cpu_loongarch_get_stable_counter(LoongArchCPU *cpu);
>> +uint64_t cpu_loongarch_get_stable_timer_ticks(LoongArchCPU *cpu);
>> +void cpu_loongarch_store_stable_timer_config(LoongArchCPU *cpu,
>> +                                             uint64_t value);
>>  #endif /* LOONGARCH_CPU_H */
>> diff --git a/target/loongarch/meson.build b/target/loongarch/meson.build
>> index 103f36ee15..bda9f47ae4 100644
>> --- a/target/loongarch/meson.build
>> +++ b/target/loongarch/meson.build
>> @@ -17,6 +17,7 @@ loongarch_tcg_ss.add(zlib)
>>  loongarch_softmmu_ss = ss.source_set()
>>  loongarch_softmmu_ss.add(files(
>>    'machine.c',
>> +  'stabletimer.c',
>>  ))
>>
>>  loongarch_ss.add_all(when: 'CONFIG_TCG', if_true: [loongarch_tcg_ss])
>> diff --git a/target/loongarch/stabletimer.c b/target/loongarch/stabletimer.c
>> new file mode 100644
>> index 0000000000..151f5073f5
>> --- /dev/null
>> +++ b/target/loongarch/stabletimer.c
>> @@ -0,0 +1,63 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * QEMU LoongArch timer support
>> + *
>> + * Copyright (c) 2021 Loongson Technology Corporation Limited
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "hw/loongarch/loongarch.h"
>> +#include "qemu/timer.h"
>> +#include "cpu.h"
>> +
>> +#define TIMER_PERIOD                10 /* 10 ns period for 100 Mhz frequency */
>> +#define STABLETIMER_TICK_MASK       0xfffffffffffcUL
>> +#define STABLETIMER_ENABLE          0x1UL
>> +
>> +/* LoongArch timer */
>> +uint64_t cpu_loongarch_get_stable_counter(LoongArchCPU *cpu)
>> +{
>> +    return qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) / TIMER_PERIOD;
>> +}
>> +
>> +uint64_t cpu_loongarch_get_stable_timer_ticks(LoongArchCPU *cpu)
>> +{
>> +    uint64_t now, expire;
>> +
>> +    now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>> +    expire = timer_expire_time_ns(&cpu->timer);
>> +
>> +    return (expire - now) / TIMER_PERIOD;
>> +}
>> +
>> +void cpu_loongarch_store_stable_timer_config(LoongArchCPU *cpu,
>> +                                             uint64_t value)
>> +{
>> +    CPULoongArchState *env = &cpu->env;
>> +    uint64_t now, next;
>> +
>> +    env->CSR_TCFG = value;
>> +    if (value & STABLETIMER_ENABLE) {
>> +        now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>> +        next = now + (value & STABLETIMER_TICK_MASK) * TIMER_PERIOD;
>> +        timer_mod(&cpu->timer, next);
>> +    }
>> +}
>> +
>> +void loongarch_stable_timer_cb(void *opaque)
>> +{
>> +    LoongArchCPU *cpu  = opaque;
>> +    CPULoongArchState *env = &cpu->env;
>> +    uint64_t now, next;
>> +
>> +    if (FIELD_EX64(env->CSR_TCFG, CSR_TCFG, PERIODIC)) {
>> +        now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>> +        next = now + (env->CSR_TCFG & STABLETIMER_TICK_MASK) * TIMER_PERIOD;
>> +        timer_mod(&cpu->timer, next);
>> +    } else {
>> +        env->CSR_TCFG = FIELD_DP64(env->CSR_TCFG, CSR_TCFG, EN, 0);
>> +    }
>> +
>> +    env->CSR_ESTAT |= 1 << IRQ_TIMER;
>> +    cpu_interrupt(CPU(cpu), CPU_INTERRUPT_HARD);
>> +}
>> --
>> 2.27.0
>>
>>
> 
> 


