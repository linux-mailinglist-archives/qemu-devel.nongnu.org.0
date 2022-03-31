Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2FF4ED125
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 03:01:47 +0200 (CEST)
Received: from localhost ([::1]:49538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZjC5-0002Pw-TF
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 21:01:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nZjAE-0001Wm-8p
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 20:59:50 -0400
Received: from mail.loongson.cn ([114.242.206.163]:60458 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nZjAB-0004yB-Qk
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 20:59:50 -0400
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx3xP6_ERiCI4TAA--.21756S3; 
 Thu, 31 Mar 2022 08:59:39 +0800 (CST)
Subject: Re: [RFC PATCH v7 05/29] target/loongarch: Add constant timer support
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220328125749.2918087-1-yangxiaojuan@loongson.cn>
 <20220328125749.2918087-6-yangxiaojuan@loongson.cn>
 <8a68b039-f34f-4ab3-746e-005663621791@linaro.org>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <6d62d292-013a-dc78-5233-25509b272ad6@loongson.cn>
Date: Thu, 31 Mar 2022 08:59:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <8a68b039-f34f-4ab3-746e-005663621791@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf9Dx3xP6_ERiCI4TAA--.21756S3
X-Coremail-Antispam: 1UD129KBjvJXoWxWF4xtw43XFyUGFWDZw4rGrg_yoW5Gr4xpr
 4kCrW7JryUtrs5X3WUtwn8XFykJr47W3Wjvr18XF4UCFsrZr12g34UWr1qgF17Zr48Xr42
 vr18Xw1DZF17J37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvv14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE
 67vIY487MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
 C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
 wI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
 v20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2
 z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73Uj
 IFyTuYvjfU5WlkUUUUU
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2022/3/29 上午3:46, Richard Henderson wrote:
> On 3/28/22 06:57, Xiaojuan Yang wrote:
>> +void cpu_loongarch_store_constant_timer_config(LoongArchCPU *cpu,
>> +                                               uint64_t value)
>> +{
>> +    CPULoongArchState *env = &cpu->env;
>> +    uint64_t now, next;
>> +
>> +    env->CSR_TCFG = value;
>> +    if (value & CONSTANT_TIMER_ENABLE) {
>> +        now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>> +        next = now + (value & CONSTANT_TIMER_TICK_MASK) * TIMER_PERIOD;
>> +        timer_mod(&cpu->timer, next);
>> +    }
>
> If CONSTANT_TIMER_ENABLE is not set, you need to use timer_del() to 
> turn off any existing timer.
>
OK
>
>> +void loongarch_constant_timer_cb(void *opaque)
>> +{
>> +    LoongArchCPU *cpu  = opaque;
>> +    CPULoongArchState *env = &cpu->env;
>> +    uint64_t now, next;
>> +
>> +    if (FIELD_EX64(env->CSR_TCFG, CSR_TCFG, PERIODIC)) {
>> +        now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>> +        next = now + (env->CSR_TCFG & CONSTANT_TIMER_TICK_MASK) * 
>> TIMER_PERIOD;
>> +        timer_mod(&cpu->timer, next);
>> +    } else {
>> +        env->CSR_TCFG = FIELD_DP64(env->CSR_TCFG, CSR_TCFG, EN, 0);
>> +    }
>> +
>> +    env->CSR_ESTAT |= 1 << IRQ_TIMER;
>> +    cpu_interrupt(CPU(cpu), CPU_INTERRUPT_HARD);
>
> I think this is wrong and you should be using loongarch_cpu_set_irq 
> (which is misplaced for you to be able to do so).
>
reuse loongarch_cpu_set_irq?  like this:
void loongarch_constant_timer_cb(void *opaque)
{
     ...
     if (FIELD_EX64(...)) {
     ...
     } else {
     ...
     }
     loongarch_cpu_set_irq(opaque, IRQ_IMER, 1);
}
>> @@ -297,4 +302,9 @@ enum {
>>   #define LOONGARCH_CPU_TYPE_NAME(model) model LOONGARCH_CPU_TYPE_SUFFIX
>>   #define CPU_RESOLVING_TYPE TYPE_LOONGARCH_CPU
>>   +void loongarch_constant_timer_cb(void *opaque);
>> +uint64_t cpu_loongarch_get_constant_timer_counter(LoongArchCPU *cpu);
>> +uint64_t cpu_loongarch_get_constant_timer_ticks(LoongArchCPU *cpu);
>> +void cpu_loongarch_store_constant_timer_config(LoongArchCPU *cpu,
>> +                                               uint64_t value);
>
> These can go in internals.h.
>
OK

Thanks.
Xiaojuan
>
> r~


