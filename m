Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53ACD47B916
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 04:45:09 +0100 (CET)
Received: from localhost ([::1]:46994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzW5L-0001JJ-O4
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 22:45:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mzW4O-0000eC-Uv
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 22:44:08 -0500
Received: from mail.loongson.cn ([114.242.206.163]:45212 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mzW4M-0005ps-Fc
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 22:44:08 -0500
Received: from localhost.localdomain (unknown [10.20.42.11])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxKZZ5TcFh9cMCAA--.1455S3;
 Tue, 21 Dec 2021 11:43:54 +0800 (CST)
Subject: Re: [RFC PATCH v3 16/27] hw/loongarch: Add LoongArch cpu interrupt
 support(CPUINTC)
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <1638619645-11283-1-git-send-email-yangxiaojuan@loongson.cn>
 <1638619645-11283-17-git-send-email-yangxiaojuan@loongson.cn>
 <5ac28dd9-ce5a-e68e-fbf4-e3cdf44f4b35@ilande.co.uk>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <add4da61-4ef7-6674-da48-88f79fbd490b@loongson.cn>
Date: Tue, 21 Dec 2021 11:43:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <5ac28dd9-ce5a-e68e-fbf4-e3cdf44f4b35@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9DxKZZ5TcFh9cMCAA--.1455S3
X-Coremail-Antispam: 1UD129KBjvJXoWxGrW5ZF45Jr1kCw4UtFyxKrg_yoW5Cr45pr
 yfCF1agF4UJF98X3Z3Jw45Wrn8Xr1fK3W2ya1xKry8uF1DZr1qqw1vqr93WFyDCry8XFW2
 vFy8t34UWF18JaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUP214x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
 xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 64x0Y40En7xvr7AKxVWUJVW8JwAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI
 0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8v
 x2IErcIFxwACI402YVCY1x02628vn2kIc2xKxwCYjI0SjxkI62AI1cAE67vIY487MxkIec
 xEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
 14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIx
 kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
 wI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr
 0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjtf
 HUUUUUU==
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.608,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, philmd@redhat.com,
 i.qemu@xen0n.name, richard.henderson@linaro.org, laurent@vivier.eu,
 peterx@redhat.com, f4bug@amsat.org, alistair.francis@wdc.com,
 maobibo@loongson.cn, pbonzini@redhat.com, chenhuacai@loongson.cn,
 alex.bennee@linaro.org, gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,Mark

On 12/18/2021 07:54 AM, Mark Cave-Ayland wrote:
> On 04/12/2021 12:07, Xiaojuan Yang wrote:
> 
>> Loongson-3A5000 support 14 interrupts from 64 - 77(Timer->75 IPI->76)
>> Loongson-3A5000 and ls7a form a legacy model and extended model irq
>> hierarchy.Tcg mode emulate a simplified extended model which
>> has no Legacy I/O Interrupt Controller(LIOINTC) and LPC.
>> e.g:
>>
>>   |    +-----+    +---------+     +-------+             |
>>   |    | IPI |--> | CPUINTC | <-- | Timer |             |
>>   |    +-----+    +---------+     +-------+             |
>>   |                    ^                                |
>>   |                    |                                |
>>   |               +---------+
>>   |               | EIOINTC |
>>   |               +---------+
>>   |                ^       ^                            |
>>   |                |       |                            |
>>   |         +---------+ +---------+                     |
>>   |         | PCH-PIC | | PCH-MSI |                     |
>>   |         +---------+ +---------+                     |
>>   |           ^     ^           ^                       |
>>   |           |     |           |                       |
>>   |   +---------+ +---------+ +---------+               |
>>   |   | UARTs | | Devices | | Devices |                 |
>>   |   +---------+ +---------+ +---------+               |
>>   |        ^                                            |
>>
>> The following series patch will realize the interrupt
>> controller in this model.
>>
>> More detailed info can be found at the kernel doc or manual
>> 1.https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/
>> linux-loongson.git/tree/Documentation/loongarch?h=loongarch-next
>> 2.https://github.com/loongson/LoongArch-Documentation
>>
>> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>> ---
>>   target/loongarch/cpu.c | 28 ++++++++++++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>
>> diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
>> index 62c2a4d813..afa550c950 100644
>> --- a/target/loongarch/cpu.c
>> +++ b/target/loongarch/cpu.c
>> @@ -504,11 +504,39 @@ static void loongarch_cpu_realizefn(DeviceState *dev, Error **errp)
>>       lacc->parent_realize(dev, errp);
>>   }
>>   +#ifndef CONFIG_USER_ONLY
>> +static void loongarch_cpu_set_irq(void *opaque, int irq, int level)
>> +{
>> +    LoongArchCPU *cpu = opaque;
>> +    CPULoongArchState *env = &cpu->env;
>> +    CPUState *cs = CPU(cpu);
>> +
>> +    if (irq < 0 || irq > N_IRQS) {
>> +        return;
>> +    }
>> +
>> +    if (level) {
>> +        env->CSR_ESTAT |= 1 << irq;
>> +    } else {
>> +        env->CSR_ESTAT &= ~(1 << irq);
>> +    }
>> +
>> +    if (FIELD_EX64(env->CSR_ESTAT, CSR_ESTAT, IS)) {
>> +        cpu_interrupt(cs, CPU_INTERRUPT_HARD);
>> +    } else {
>> +        cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
>> +    }
>> +}
>> +#endif
>> +
>>   static void loongarch_cpu_initfn(Object *obj)
>>   {
>>       LoongArchCPU *cpu = LOONGARCH_CPU(obj);
>>         cpu_set_cpustate_pointers(cpu);
>> +#ifndef CONFIG_USER_ONLY
>> +    qdev_init_gpio_in(DEVICE(cpu), loongarch_cpu_set_irq, N_IRQS);
>> +#endif
>>   }
>>     static ObjectClass *loongarch_cpu_class_by_name(const char *cpu_model)
> 
> Rather than use defines to split out user mode, I would suggest using a separate function in a similar way to sparc64_cpu_devinit() in hw/sparc64/sparc64.c to set up the parts of the CPU that are only required in system mode. This function can then be called as part of the board setup.
> 
yes, put the code to the board setup stage is more suitable, thank you!
> 
> ATB,
> 
> Mark.


