Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EE64ED9C5
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 14:41:56 +0200 (CEST)
Received: from localhost ([::1]:60140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZu7e-0003Sg-NT
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 08:41:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nZtv9-0001Lv-OY
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 08:29:00 -0400
Received: from mail.loongson.cn ([114.242.206.163]:40170 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nZtuv-0000cQ-Oc
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 08:28:51 -0400
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxnxNwnkVi9eITAA--.22291S3; 
 Thu, 31 Mar 2022 20:28:32 +0800 (CST)
Subject: Re: [RFC PATCH v7 19/29] hw/intc: Add LoongArch extioi interrupt
 controller(EIOINTC)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220328125749.2918087-1-yangxiaojuan@loongson.cn>
 <20220328125749.2918087-20-yangxiaojuan@loongson.cn>
 <620e7d20-8e6a-0b9e-1f3e-022f405bfa92@linaro.org>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <e258a683-bde3-5ce2-641d-86c7120aab25@loongson.cn>
Date: Thu, 31 Mar 2022 20:28:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <620e7d20-8e6a-0b9e-1f3e-022f405bfa92@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf9DxnxNwnkVi9eITAA--.22291S3
X-Coremail-Antispam: 1UD129KBjvJXoW3Ar18Kry7XFyUAFy5Kw43Awb_yoW7ArW7pF
 1kCr15GFWUJr1xJr1Dtr1UXFy5Jr1rW3WUtF1SqFyrAr1UAr1jg34vqryqgF1UGw4kJryj
 qry5Ww1kur17JrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvS14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s
 026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_
 JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20x
 vEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280
 aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43
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
Cc: mark.cave-ayland@ilande.co.uk, Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2022/3/29 上午6:43, Richard Henderson wrote:
> On 3/28/22 06:57, Xiaojuan Yang wrote:
>> This patch realize the EIOINTC interrupt controller.
>>
>> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>> ---
>>   hw/intc/Kconfig                    |   3 +
>>   hw/intc/loongarch_extioi.c         | 408 +++++++++++++++++++++++++++++
>>   hw/intc/meson.build                |   1 +
>>   hw/intc/trace-events               |  11 +
>>   hw/loongarch/Kconfig               |   1 +
>>   include/hw/intc/loongarch_extioi.h |  77 ++++++
>>   6 files changed, 501 insertions(+)
>>   create mode 100644 hw/intc/loongarch_extioi.c
>>   create mode 100644 include/hw/intc/loongarch_extioi.h
>>
>> diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
>> index 71c04c328e..28bd1f185d 100644
>> --- a/hw/intc/Kconfig
>> +++ b/hw/intc/Kconfig
>> @@ -96,3 +96,6 @@ config LOONGARCH_PCH_MSI
>>       select MSI_NONBROKEN
>>       bool
>>       select UNIMP
>> +
>> +config LOONGARCH_EXTIOI
>> +    bool
>> diff --git a/hw/intc/loongarch_extioi.c b/hw/intc/loongarch_extioi.c
>> new file mode 100644
>> index 0000000000..af28e8d6e9
>> --- /dev/null
>> +++ b/hw/intc/loongarch_extioi.c
>> @@ -0,0 +1,408 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * Loongson 3A5000 ext interrupt controller emulation
>> + *
>> + * Copyright (C) 2021 Loongson Technology Corporation Limited
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "qemu/module.h"
>> +#include "qemu/log.h"
>> +#include "hw/irq.h"
>> +#include "hw/sysbus.h"
>> +#include "hw/loongarch/loongarch.h"
>> +#include "hw/qdev-properties.h"
>> +#include "exec/address-spaces.h"
>> +#include "hw/intc/loongarch_extioi.h"
>> +#include "migration/vmstate.h"
>> +#include "trace.h"
>> +
>> +static void extioi_update_irq(void *opaque, int irq_num, int level)
>> +{
>> +    LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
>
> I think this is not opaque anymore; you've already resolved it in the 
> caller.
> I think level should be 'bool'.
>
OK.
>> +    uint8_t  ipnum, cpu;
>> +    unsigned long found1, found2;
>> +
>> +    ipnum = s->sw_ipmap[irq_num];
>> +    cpu   = s->sw_coremap[irq_num];
>> +    if (level == 1) {
>
> Just if (level).
>
>> +        if (test_bit(irq_num, (void *)s->enable) == false) {
>
> This, and every other cast you're using for bitops.h functions, is 
> wrong.  You would need to declare these bitmaps properly as 'unsigned 
> long name[BITS_TO_LONGS(N)];'.
>
> That said, I would definitely use uint64_t, because that matches up 
> with the description of these registers in the manual.
>
we may not declare these bitmaps as 'unsigned long 
name[BITS_TO_LONGS(N)]. For example， ext_sw_ipisr 
sw_ipisr[MAX_CORES][LS3A_INTC_IP] is a two-dimensional array，
and it has a specific meaning, memregion options also restrict its size
>> +            return;
>> +        }
>> +        bitmap_set((void *)s->coreisr[cpu], irq_num, 1);
>> +        found1 = find_next_bit((void *)&(s->sw_ipisr[cpu][ipnum]),
>> +                               EXTIOI_IRQS, 0);
>
> find_next_bit with offset=0 is find_first_bit...
>
OK.
>> +        bitmap_set((void *)&(s->sw_ipisr[cpu][ipnum]), irq_num, 1);
>> +
>> +        if (found1 >= EXTIOI_IRQS) {
>> +            qemu_set_irq(s->parent_irq[cpu][ipnum], level);
>> +        }
>
> ... but what's the bitmap search doing?  It appears to be checking 
> that there are *no* bits set between 0 and EXTIOI_IRQS, and then 
> raising the irq if no bits set.  That seems wrong.
>
found1 >= EXTIOI_IRQS says there is no interrupt at present, then the 
new interrupt will be sent.
>
>> +    } else {
>> +        bitmap_clear((void *)s->coreisr[cpu], irq_num, 1);
>> +        found1 = find_next_bit((void *)&(s->sw_ipisr[cpu][ipnum]),
>> +                               EXTIOI_IRQS, 0);
>> +        bitmap_clear((void *)&(s->sw_ipisr[cpu][ipnum]), irq_num, 1);
>> +        found2 = find_next_bit((void *)&(s->sw_ipisr[cpu][ipnum]),
>> +                               EXTIOI_IRQS, 0);
>> +
>> +        if ((found1 < EXTIOI_IRQS) && (found2 >= EXTIOI_IRQS)) {
>> +            qemu_set_irq(s->parent_irq[cpu][ipnum], level);
>> +        }
>> +    }
>> +}
>
if ((found1 < EXTIOI_IRQS) && (found2 >= EXTIOI_IRQS)) says if the 
current interrupt number is equal to irq_num, then qemu_set_irq.
> It *seems* like all of this should be
>
>     uint64_t sum = 0;
>
>     s->isr[ipnum / 64] = deposit64(s->isr[ipnum / 64], ipnum % 64, 1, 
> level);
>
>     for (int i = 0; i < ARRAY_SIZE(s->isr); i++) {
>         sum |= s->isr[i] & s->ena[i];
>     }
>     qemu_set_irq(parent, sum != 0);
>
> If that's not the case, you need many more comments.
>
Yes, we need more comments,

Thanks.
Xiaojuan
>
> r~


