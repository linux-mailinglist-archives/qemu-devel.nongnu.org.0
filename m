Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD7751F85A
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 11:41:56 +0200 (CEST)
Received: from localhost ([::1]:44568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnztr-0005SC-El
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 05:41:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nnzqR-0002iO-26
 for qemu-devel@nongnu.org; Mon, 09 May 2022 05:38:23 -0400
Received: from mail.loongson.cn ([114.242.206.163]:57704 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nnzqN-0002f3-Vv
 for qemu-devel@nongnu.org; Mon, 09 May 2022 05:38:22 -0400
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxitgA4Xhid8gOAA--.37816S3; 
 Mon, 09 May 2022 17:38:08 +0800 (CST)
Subject: Re: [PATCH v3 34/43] hw/intc: Add LoongArch extioi interrupt
 controller(EIOINTC)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, mark.cave-ayland@ilande.co.uk
References: <20220429100729.1572481-1-yangxiaojuan@loongson.cn>
 <20220429100729.1572481-35-yangxiaojuan@loongson.cn>
 <c6b58ba0-38c4-6542-86d1-eb1f14a12121@linaro.org>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <707db6c2-49f2-2ca2-7025-0cf401f11c60@loongson.cn>
Date: Mon, 9 May 2022 17:38:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <c6b58ba0-38c4-6542-86d1-eb1f14a12121@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf9AxitgA4Xhid8gOAA--.37816S3
X-Coremail-Antispam: 1UD129KBjvJXoWxKrWkCFW5JFy7Ww4rCFy3urg_yoWxJw4rpr
 1kGryUJryUGr1rJw1UG3WUAryrJr1DJw1UAr10qF1UAryUtr10gw10qF1q9r1UGr48AF1U
 JF1rXw17uF1UJrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvS14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAY
 IcxG8wCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2
 IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v2
 6r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2
 IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2
 jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43
 ZEXa7VUbrMaUUUUUU==
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

On 2022/5/7 下午11:31, Richard Henderson wrote:
> On 4/29/22 05:07, Xiaojuan Yang wrote:
>> +    int ipmap_mask = 0xff << ipmap_offset;
> ...
>> +    int cpu_mask = 0xff << ipmap_offset;
>
> These two masks are redundant with
>
>> +    ipnum = ((s->ipmap[ipmap_index] & ipmap_mask) >> ipmap_offset) & 
>> 0xf;
> ...
>> +    cpu = ((s->coremap[cpu_index] & cpu_mask) >> cpu_offset) & 0xf;
>
> the 0xf masking here.
>
>> +    cpu = ctz32(cpu);
>> +    cpu = (cpu >= 4) ? 0 : cpu;
>
> You are not considering CSR[0x420][49], which changes the format of 
> this mapping.
>
Thanks very much, I will consider the mapping format by read 
iocsr[0x420][49] like this:
static uint64_t map_format(void)
{
     LoongArchCPU *cpu;
     CPULoongArchState *env;
     uint64_t val;

     cpu = LOONGARCH_CPU(current_cpu);
     env = &(cpu->env);

     val = address_space_ldq(&env->address_space_iocsr, 0x420,
                              MEMTXATTRS_UNSPECIFIED, NULL);
     val &= 1 << 49;
     return val;
}
...
if (!map_format()) {
     cpu = ctz32(cpu);
     cpu = (cpu >= 4) ? 0 : cpu;
}
...
> I think this function is wrong because you maintain an unmapped enable 
> bitmap, but you do not maintain an unmapped status bitmap, which 
> *should* be readable from EXTIOI_ISR_{START,END}, but is not present 
> in extioi_readw.
>
> I think that only extioi_setirq should actually change the unmapped 
> status bitmap, and that extioi_update_irq should only evaluate the 
> mapping to apply changes to the cpus.
>
Ok, there should be ISR registers(the status bitmap), i will add it to 
the LoongArchExtIOI, like this:
struct LoongArchExtIOI {
...
+    uint32_t isr[EXTIOI_IRQS / 32]
...
}

when extioi_setirq, update the isr filed.
static void extioi_setirq(void *opaque, int irq, int level)
{
     LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
     trace_loongarch_extioi_setirq(irq, level);
     s->isr[irq / 32] |= 1 << irq % 32;
     extioi_update_irq(s, irq, level);
}

and add ISR_START ... ISR_END to extioi_readw, like this
...
     case EXTIOI_ISR_START ... EXTIOI_ISR_END - 1:
         index = ((offset - EXTIOI_ISR_START) >> 2;
         ret = s->isr[index];
         break;
...

>
> This final bit, updating the cpu irq is also wrong, in that it should 
> be unconditional. This is the only way that it will work for the usage 
> in updating the enable mask.
>
> I think you are not considering when the MAP registers overlap 
> outputs.  For instance, if all 256 bits of EXT_IOIMap contain 0, then 
> all of EXT_IOI[n*32+31 : n*32] overlap.  When that happens, you cannot 
> lower the level of the cpu pin until all of the matching ioi 
> interrupts are low.
>
> Or, perhaps I don't understand how this is supposed to work?
> The documentation is very weak.
>
>
>> +static void extioi_writew(void *opaque, hwaddr addr,
>> +                                   uint64_t val, unsigned size)
>> +{
>> +    LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
>> +    int cpu, index, old_data, data_offset;
>> +    uint32_t offset;
>> +    trace_loongarch_extioi_writew(size, (uint32_t)addr, val);
>> +
>> +    offset = addr & 0xffff;
>> +
>> +    switch (offset) {
>> +    case EXTIOI_NODETYPE_START ... EXTIOI_NODETYPE_END - 1:
>> +        index = (offset - EXTIOI_NODETYPE_START) >> 2;
>> +        s->nodetype[index] = val;
>> +        break;
>> +    case EXTIOI_IPMAP_START ... EXTIOI_IPMAP_END - 1:
>> +        index = (offset - EXTIOI_IPMAP_START) >> 2;
>> +        s->ipmap[index] = val;
>> +        break;
>
> Do you need to recompute the entire interrupt map when ipmap changes?
>
Sorry, could you explain it in more detail? i can not understand the 
meanning of 'the entire interrupt map'?
we only have ipmap and coremap registers in the LoongArchExtIOI, should 
we add an entire interrupt map?
>> +    case EXTIOI_ENABLE_START ... EXTIOI_ENABLE_END - 1:
>> +        index = (offset - EXTIOI_ENABLE_START) >> 2;
>> +        old_data = s->enable[index];
>> +        if (old_data != (int)val) {
>> +            s->enable[index] = val;
>> +            old_data = old_data ^ val;
>> +            data_offset = ctz32(old_data);
>> +            while (data_offset != 32) {
>> +                if (!(val & (1 << data_offset))) {
>> +                    extioi_update_irq(s, data_offset + index * 32, 0);
>
> This is not correct -- you're unconditionally setting level=0, 
> corrupting the old value of coreisr[cpu][index].  You need to 
> recompute *without* changning those levels.
>
Thanks, i will add a condition to judge coreisr[cpu][index], excute 
extioi_update_irq when the coreisr val is 1, like this:

static int get_coremap(int irq_num)
{
     int cpu;
     int cpu_index = irq_num / 4;
     int cpu_offset = irq_num & 0x3;
     int cpu_mask = 0xf << cpu_offset;

     cpu = (s->coremap[cpu_index] & cpu_mask) >> cpu_offset;
     if (!map_format()) {
         cpu = ctz32(cpu);
         cpu = (cpu >= 4) ? 0 : cpu;
     }
     return cpu;
}

static int coreisr_level(LoongArchExtIOI *s, int irq_num)
{
     int cpu = get_coremap(irq_num);
     return s->coreisr[cpu][irq_num / 32];
}

...
              while (data_offset != 32) {
                  if (!(val & (1 << data_offset))) {
                     if (coreisr_level(s, data_offset + index * 32)) {
                         extioi_update_irq(s, data_offset + index * 32, 0);
                     }
                  }
...

BTW,  Could you help us to review  the patch [1]  or add some other 
reviewers ?

[1] :
[PATCH v3 40/43] hw/loongarch: Add LoongArch ls7a acpi device support

Thanks.
Xiaojuan


