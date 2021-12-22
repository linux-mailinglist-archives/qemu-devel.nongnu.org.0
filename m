Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5D947CB64
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 03:40:28 +0100 (CET)
Received: from localhost ([::1]:44994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzrYI-0001RU-Us
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 21:40:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mzrWc-0000je-BF
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 21:38:42 -0500
Received: from mail.loongson.cn ([114.242.206.163]:33572 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mzrWU-0004Op-AK
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 21:38:37 -0500
Received: from localhost.localdomain (unknown [10.20.42.11])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxWZSTj8JhQhgDAA--.372S3;
 Wed, 22 Dec 2021 10:38:12 +0800 (CST)
Subject: Re: [RFC PATCH v3 18/27] hw/intc: Add LoongArch ls7a interrupt
 controller support(PCH-PIC)
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <1638619645-11283-1-git-send-email-yangxiaojuan@loongson.cn>
 <1638619645-11283-19-git-send-email-yangxiaojuan@loongson.cn>
 <411fab70-0e0e-3d3d-55ce-cc6d00f4df9a@ilande.co.uk>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <a00a4d13-05ed-7625-4f3f-b1e3eeb39432@loongson.cn>
Date: Wed, 22 Dec 2021 10:38:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <411fab70-0e0e-3d3d-55ce-cc6d00f4df9a@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9DxWZSTj8JhQhgDAA--.372S3
X-Coremail-Antispam: 1UD129KBjvAXoW3Zr4xtFW5uF1DGr4kCry3Arb_yoW8AFWfXo
 WrtF1av3Wxtr1rArW0kF98XF12kw129F45Aa92vwsxJF4S9F15Kr9rKw4Yyr43Ja1qyr15
 Ja4Sqr4fZa9rAw43n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjp_UUUOn7AC8VAFwI0_Xr0_Wr1l1xkIjI8I6I8E6xAIw20EY4v20xva
 j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
 x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8
 Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI
 0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xf
 McIj64x0Y40En7xvr7AKxVWUJVW8JwAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aV
 AFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CE
 Vc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2xKxwCYjI0SjxkI62AI1cAE67vIY487Mx
 kIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
 F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_Wr
 ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
 xVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI
 0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7V
 UjtfHUUUUUU==
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.012,
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
 richard.henderson@linaro.org, laurent@vivier.eu, peterx@redhat.com,
 f4bug@amsat.org, alex.bennee@linaro.org, alistair.francis@wdc.com,
 maobibo@loongson.cn, gaosong@loongson.cn, pbonzini@redhat.com,
 i.qemu@xen0n.name, chenhuacai@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Mark

On 12/18/2021 08:33 AM, Mark Cave-Ayland wrote:
> On 04/12/2021 12:07, Xiaojuan Yang wrote:
> 
>> This patch realize the PCH-PIC interrupt controller.
>>
>> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>> ---
>>   hw/intc/Kconfig                     |   4 +
>>   hw/intc/loongarch_pch_pic.c         | 357 ++++++++++++++++++++++++++++
>>   hw/intc/meson.build                 |   1 +
>>   hw/intc/trace-events                |   5 +
>>   hw/loongarch/Kconfig                |   1 +
>>   include/hw/intc/loongarch_pch_pic.h |  61 +++++
>>   6 files changed, 429 insertions(+)
>>   create mode 100644 hw/intc/loongarch_pch_pic.c
>>   create mode 100644 include/hw/intc/loongarch_pch_pic.h
>>
>> diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
>> index 511dcac537..96da13ad1d 100644
>> --- a/hw/intc/Kconfig
>> +++ b/hw/intc/Kconfig
>> @@ -76,3 +76,7 @@ config M68K_IRQC
>>     config LOONGARCH_IPI
>>       bool
>> +
>> +config LOONGARCH_PCH_PIC
>> +    bool
>> +    select UNIMP
>> diff --git a/hw/intc/loongarch_pch_pic.c b/hw/intc/loongarch_pch_pic.c
>> new file mode 100644
>> index 0000000000..2ede29ceb0
>> --- /dev/null
>> +++ b/hw/intc/loongarch_pch_pic.c
>> @@ -0,0 +1,357 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * QEMU Loongson 7A1000 I/O interrupt controller.
>> + *
>> + * Copyright (C) 2021 Loongson Technology Corporation Limited
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "hw/sysbus.h"
>> +#include "hw/loongarch/loongarch.h"
>> +#include "hw/irq.h"
>> +#include "hw/intc/loongarch_pch_pic.h"
>> +#include "migration/vmstate.h"
>> +#include "trace.h"
>> +
>> +#define for_each_set_bit(bit, addr, size) \
>> +         for ((bit) = find_first_bit((addr), (size));            \
>> +              (bit) < (size);                                    \
>> +              (bit) = find_next_bit((addr), (size), (bit) + 1))
>> +
>> +static void pch_pic_update_irq(loongarch_pch_pic *s, uint64_t mask, int level)
>> +{
>> +    int i;
>> +    uint64_t val;
>> +    val = mask & s->intirr & (~s->int_mask);
>> +
>> +    for_each_set_bit(i, &val, 64) {
>> +        if (level == 1) {
>> +            if ((s->intisr & (0x1ULL << i)) == 0) {
>> +                s->intisr |= 1ULL << i;
>> +                qemu_set_irq(s->parent_irq[s->htmsi_vector[i]], 1);
>> +            }
>> +        } else if (level == 0) {
>> +            if (s->intisr & (0x1ULL << i)) {
>> +                s->intisr &= ~(0x1ULL << i);
>> +                qemu_set_irq(s->parent_irq[s->htmsi_vector[i]], 0);
>> +            }
>> +        }
>> +    }
>> +}
> 
> The normal pattern would be to use something like:
> 
> for (i = 0; i < 64; i++) {
>     if (level) {
>         s->intisr |= 1ULL << i;
>     } else {
>         s->intisr &= ~(0x1ULL << i);
>     }
> 
>     qemu_set_irq(s->parent_irq[s->htmsi_vector[i]], level);
> }
> 
> Why is it necessary to check the previous value of (s->intisr & (0x1ULL << i)) here?

Here check the previous value to avoid Unnecessary write. It seems make things more complicated. I will modify

> 
>> +static void pch_pic_irq_handler(void *opaque, int irq, int level)
>> +{
>> +    loongarch_pch_pic *s = LOONGARCH_PCH_PIC(opaque);
>> +
>> +    assert(irq < PCH_PIC_IRQ_NUM);
>> +    uint64_t mask = 1ULL << irq;
>> +
>> +    trace_pch_pic_irq_handler(s->intedge, irq, level);
>> +
>> +    if (s->intedge & mask) {
>> +        /* Edge triggered */
>> +        if (level) {
>> +            if ((s->last_intirr & mask) == 0) {
>> +                s->intirr |= mask;
>> +            }
>> +            s->last_intirr |= mask;
>> +        } else {
>> +            s->last_intirr &= ~mask;
>> +        }
>> +    } else {
>> +        /* Level triggered */
>> +        if (level) {
>> +            s->intirr |= mask;
>> +            s->last_intirr |= mask;
>> +        } else {
>> +            s->intirr &= ~mask;
>> +            s->last_intirr &= ~mask;
>> +        }
>> +
>> +    }
>> +    pch_pic_update_irq(s, mask, level);
>> +}
>> +
>> +static uint64_t loongarch_pch_pic_reg_read(void *opaque, hwaddr addr,
>> +                                           unsigned size)
>> +{
>> +    loongarch_pch_pic *s = LOONGARCH_PCH_PIC(opaque);
>> +    uint64_t val = 0;
>> +    uint32_t offset = addr & 0xfff;
>> +    int64_t offset_tmp;
>> +
>> +    if (size == 8) {
>> +        switch (offset) {
>> +        case PCH_PIC_INT_ID_OFFSET:
>> +            val = (PCH_PIC_INT_ID_NUM << 32) | PCH_PIC_INT_ID_VAL;
>> +            break;
>> +        case PCH_PIC_INT_MASK_OFFSET:
>> +            val =  s->int_mask;
>> +            break;
>> +        case PCH_PIC_INT_STATUS_OFFSET:
>> +            val = s->intisr & (~s->int_mask);
>> +            break;
>> +        case PCH_PIC_INT_EDGE_OFFSET:
>> +            val = s->intedge;
>> +            break;
>> +        case PCH_PIC_INT_POL_OFFSET:
>> +            val = s->int_polarity;
>> +            break;
>> +        case PCH_PIC_HTMSI_EN_OFFSET...PCH_PIC_HTMSI_EN_END:
>> +            val = s->htmsi_en;
>> +            break;
>> +        case PCH_PIC_AUTO_CTRL0_OFFSET...PCH_PIC_AUTO_CTRL0_END:
>> +        case PCH_PIC_AUTO_CTRL1_OFFSET...PCH_PIC_AUTO_CTRL1_END:
>> +            break;
>> +        default:
>> +            break;
>> +        }
>> +    } else if (size == 4) {
>> +        switch (offset) {
>> +        case PCH_PIC_INT_ID_OFFSET:
>> +            val = PCH_PIC_INT_ID_VAL;
>> +            break;
>> +        case PCH_PIC_INT_ID_OFFSET + 4:
>> +            val = PCH_PIC_INT_ID_NUM;
>> +            break;
>> +        case PCH_PIC_INT_MASK_OFFSET...PCH_PIC_INT_MASK_END:
>> +            val = ldl_p((void *)&s->int_mask +
>> +                        (offset - PCH_PIC_INT_MASK_OFFSET));
>> +            break;
>> +        case PCH_PIC_INT_STATUS_OFFSET...PCH_PIC_INT_STATUS_END:
>> +            val = ldl_p((void *)&s->intisr +
>> +                        (offset - PCH_PIC_INT_STATUS_OFFSET)) & (~s->int_mask);
>> +            break;
>> +        case PCH_PIC_INT_EDGE_OFFSET...PCH_PIC_INT_EDGE_END:
>> +            val = ldl_p((void *)&s->intedge +
>> +                        (offset - PCH_PIC_INT_EDGE_OFFSET));
>> +            break;
>> +        case PCH_PIC_INT_POL_OFFSET...PCH_PIC_INT_POL_END:
>> +            val = ldl_p((void *)&s->int_polarity +
>> +                        (offset - PCH_PIC_INT_POL_OFFSET));
>> +            break;
>> +        case PCH_PIC_HTMSI_EN_OFFSET...PCH_PIC_HTMSI_EN_END:
>> +            val = ldl_p((void *)&s->htmsi_en +
>> +                        (offset - PCH_PIC_HTMSI_EN_OFFSET));
>> +            break;
>> +        case PCH_PIC_AUTO_CTRL0_OFFSET...PCH_PIC_AUTO_CTRL0_END:
>> +        case PCH_PIC_AUTO_CTRL1_OFFSET...PCH_PIC_AUTO_CTRL1_END:
>> +            break;
>> +        default:
>> +            break;
>> +        }
>> +    } else if (size == 1) {
>> +        if (offset >= PCH_PIC_HTMSI_VEC_OFFSET) {
>> +            offset_tmp = offset - PCH_PIC_HTMSI_VEC_OFFSET;
>> +            if (offset_tmp >= 0 && offset_tmp < 64) {
>> +                val = s->htmsi_vector[offset_tmp];
>> +            }
>> +        } else if (offset >=  PCH_PIC_ROUTE_ENTRY_OFFSET) {
>> +            offset_tmp = offset - PCH_PIC_ROUTE_ENTRY_OFFSET;
>> +            if (offset_tmp >= 0 && offset_tmp < 64) {
>> +                val = s->route_entry[offset_tmp];
>> +            }
>> +        }
>> +    }
>> +
>> +    trace_loongarch_pch_pic_read(size, (uint32_t)addr, val);
>> +    return val;
>> +}
>> +
>> +static void loongarch_pch_pic_reg_write(void *opaque, hwaddr addr,
>> +                                        uint64_t data, unsigned size)
>> +{
>> +    loongarch_pch_pic *s = LOONGARCH_PCH_PIC(opaque);
> 
> Perhaps use LoongArchPCHPIC for the camel case version?

OK, all interrupt controller will use the camel case. 

> 
>> +    int32_t offset_tmp;
>> +    uint32_t offset, old;
>> +    offset = addr & 0xfff;
>> +
>> +    trace_loongarch_pch_pic_write(size, (uint32_t)addr, data);
>> +
>> +    if (size == 8) {
>> +        switch (offset) {
>> +        case PCH_PIC_INT_MASK_OFFSET:
>> +            old = s->int_mask;
>> +            s->int_mask = data;
>> +            if (old & ~data) {
>> +                pch_pic_update_irq(s, (old & ~data), 1);
>> +            } else if (~old & data) {
>> +                pch_pic_update_irq(s, (~old & data), 0);
>> +            }
>> +            break;
>> +        case PCH_PIC_INT_STATUS_OFFSET:
>> +            s->intisr = data;
>> +            break;
>> +        case PCH_PIC_INT_EDGE_OFFSET:
>> +            s->intedge = data;
>> +            break;
>> +        case PCH_PIC_INT_CLEAR_OFFSET:
>> +            s->intirr &= (~(data & s->intedge));
>> +            pch_pic_update_irq(s, data, 0);
>> +            s->intisr &= (~data);
>> +            break;
>> +        case PCH_PIC_INT_POL_OFFSET:
>> +            s->int_polarity = data;
>> +            break;
>> +        case PCH_PIC_HTMSI_EN_OFFSET:
>> +            s->htmsi_en = data;
>> +            break;
>> +        case PCH_PIC_AUTO_CTRL0_OFFSET:
>> +        case PCH_PIC_AUTO_CTRL1_OFFSET:
>> +            break;
>> +        default:
>> +            break;
>> +        }
>> +    } else if (size == 4) {
>> +        switch (offset) {
>> +        case PCH_PIC_INT_MASK_OFFSET...PCH_PIC_INT_MASK_END:
>> +            offset -= PCH_PIC_INT_MASK_OFFSET;
>> +            old = ldl_p((void *)&s->int_mask + offset);
>> +            stl_p((void *)&s->int_mask + offset, data);
>> +
>> +            if (old & ~data) {
>> +                pch_pic_update_irq(s, (old & ~data), 1);
>> +            } else if (~old & data) {
>> +                pch_pic_update_irq(s, (~old & data), 0);
>> +            }
>> +            break;
>> +        case PCH_PIC_INT_STATUS_OFFSET...PCH_PIC_INT_STATUS_END:
>> +            stl_p((void *)&s->intisr + (offset - PCH_PIC_INT_STATUS_OFFSET),
>> +                  data);
>> +            break;
>> +        case PCH_PIC_INT_EDGE_OFFSET...PCH_PIC_INT_EDGE_END:
>> +            stl_p((void *)&s->intedge + (offset - PCH_PIC_INT_EDGE_OFFSET),
>> +                  data);
>> +            break;
>> +        case PCH_PIC_INT_CLEAR_OFFSET...PCH_PIC_INT_CLEAR_END:
>> +            old = s->intirr & (~(data & s->intedge));
>> +            stl_p((void *)&s->intirr + (offset - PCH_PIC_INT_CLEAR_OFFSET),
>> +                  old);
>> +            pch_pic_update_irq(s, data, 0);
>> +            old = s->intisr & (~data);
>> +            stl_p((void *)&s->intisr + (offset - PCH_PIC_INT_CLEAR_OFFSET),
>> +                  old);
>> +            break;
>> +        case PCH_PIC_INT_POL_OFFSET...PCH_PIC_INT_POL_END:
>> +            stl_p((void *)&s->int_polarity + (offset - PCH_PIC_INT_POL_OFFSET),
>> +                  data);
>> +            break;
>> +        case PCH_PIC_HTMSI_EN_OFFSET...PCH_PIC_HTMSI_EN_END:
>> +            stl_p((void *)&s->htmsi_en + (offset - PCH_PIC_HTMSI_EN_OFFSET),
>> +                  data);
>> +            break;
>> +        case PCH_PIC_AUTO_CTRL0_OFFSET...PCH_PIC_AUTO_CTRL0_END:
>> +        case PCH_PIC_AUTO_CTRL1_OFFSET...PCH_PIC_AUTO_CTRL1_END:
>> +            break;
>> +        default:
>> +            break;
>> +        }
>> +    } else if (size == 1) {
>> +        if (offset >= PCH_PIC_HTMSI_VEC_OFFSET) {
>> +            offset_tmp = offset - PCH_PIC_HTMSI_VEC_OFFSET;
>> +            if (offset_tmp >= 0 && offset_tmp < 64) {
>> +                s->htmsi_vector[offset_tmp] = (uint8_t)(data & 0xff);
>> +            }
>> +        } else if (offset >=  PCH_PIC_ROUTE_ENTRY_OFFSET) {
>> +            offset_tmp = offset - PCH_PIC_ROUTE_ENTRY_OFFSET;
>> +            if (offset_tmp >= 0 && offset_tmp < 64) {
>> +                s->route_entry[offset_tmp] = (uint8_t)(data & 0xff);
>> +            }
>> +        }
>> +    }
>> +}
>> +
>> +static const MemoryRegionOps loongarch_pch_pic_ops = {
>> +    .read = loongarch_pch_pic_reg_read,
>> +    .write = loongarch_pch_pic_reg_write,
>> +    .valid = {
>> +        .min_access_size = 1,
>> +        .max_access_size = 8,
>> +    },
>> +    .impl = {
>> +        .min_access_size = 1,
>> +        .max_access_size = 8,
>> +    },
>> +    .endianness = DEVICE_LITTLE_ENDIAN,
>> +};
> 
> It feels like this should be split into 2 separate memory regions: as per before set .min_access_size = 4 for PCH_PIC_INT_MASK_OFFSET ... PCH_PIC_AUTO_CTRL1_END and use uint32_t for the underlying types in loongarch_pch_pic.
> 
> This leaves a separate memory region for accesses > PCH_PIC_HTMSI_VEC_OFFSET which can be set with .min_access_size = 1 which maps nicely to the underlying uint8_t types. Which means you should be able to access the arrays directly instead of having to use ldl_p() and stl_p().
> 

yeah, here the PCH_PIC_HTMSI_VEC_OFFSET region is right in the middle, I want to use a separate memory region to overlap the pch-pic region, is it ok to do like this? Thanks

> +static void loongarch_pch_pic_reset(DeviceState *d)
>> +{
>> +    loongarch_pch_pic *s = LOONGARCH_PCH_PIC(d);
>> +    int i;
>> +
>> +    s->int_mask = -1ULL;
>> +    s->htmsi_en = 0x0;
>> +    s->intedge  = 0x0;
>> +    s->intclr   = 0x0;
>> +    s->auto_crtl0 = 0x0;
>> +    s->auto_crtl1 = 0x0;
>> +    for (i = 0; i < 64; i++) {
>> +        s->route_entry[i] = 0x1;
>> +        s->htmsi_vector[i] = 0x0;
>> +    }
>> +    s->intirr = 0x0;
>> +    s->intisr = 0x0;
>> +    s->last_intirr = 0x0;
>> +    s->int_polarity = 0x0;
>> +}
>> +
>> +static void loongarch_pch_pic_init(Object *obj)
>> +{
>> +    loongarch_pch_pic *s = LOONGARCH_PCH_PIC(obj);
>> +    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
>> +    int i;
>> +
>> +    memory_region_init_io(&s->iomem, obj, &loongarch_pch_pic_ops,
>> +                          s, TYPE_LOONGARCH_PCH_PIC, 0x1000);
>> +    sysbus_init_mmio(sbd, &s->iomem);
>> +
>> +    for (i = 0; i < PCH_PIC_IRQ_NUM; i++) {
>> +        sysbus_init_irq(sbd, &s->parent_irq[i]);
>> +    }
>> +    qdev_init_gpio_in(DEVICE(obj), pch_pic_irq_handler, PCH_PIC_IRQ_NUM);
>> +}
>> +
>> +static const VMStateDescription vmstate_loongarch_pch_pic = {
>> +    .name = TYPE_LOONGARCH_PCH_PIC,
>> +    .version_id = 1,
>> +    .minimum_version_id = 1,
>> +    .fields = (VMStateField[]) {
>> +        VMSTATE_UINT64(int_mask, loongarch_pch_pic),
>> +        VMSTATE_UINT64(htmsi_en, loongarch_pch_pic),
>> +        VMSTATE_UINT64(intedge, loongarch_pch_pic),
>> +        VMSTATE_UINT64(intclr, loongarch_pch_pic),
>> +        VMSTATE_UINT64(auto_crtl0, loongarch_pch_pic),
>> +        VMSTATE_UINT64(auto_crtl1, loongarch_pch_pic),
>> +        VMSTATE_UINT8_ARRAY(route_entry, loongarch_pch_pic, 64),
>> +        VMSTATE_UINT8_ARRAY(htmsi_vector, loongarch_pch_pic, 64),
>> +        VMSTATE_UINT64(last_intirr, loongarch_pch_pic),
>> +        VMSTATE_UINT64(intirr, loongarch_pch_pic),
>> +        VMSTATE_UINT64(intisr, loongarch_pch_pic),
>> +        VMSTATE_UINT64(int_polarity, loongarch_pch_pic),
>> +        VMSTATE_END_OF_LIST()
>> +    }
>> +};
>> +
>> +static void loongarch_pch_pic_class_init(ObjectClass *klass, void *data)
>> +{
>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>> +
>> +    dc->reset = loongarch_pch_pic_reset;
>> +    dc->vmsd = &vmstate_loongarch_pch_pic;
>> +}
>> +
>> +static const TypeInfo loongarch_pch_pic_info = {
>> +    .name          = TYPE_LOONGARCH_PCH_PIC,
>> +    .parent        = TYPE_SYS_BUS_DEVICE,
>> +    .instance_size = sizeof(loongarch_pch_pic),
>> +    .instance_init = loongarch_pch_pic_init,
>> +    .class_init    = loongarch_pch_pic_class_init,
>> +};
>> +
>> +static void loongarch_pch_pic_register_types(void)
>> +{
>> +    type_register_static(&loongarch_pch_pic_info);
>> +}
>> +
>> +type_init(loongarch_pch_pic_register_types)
>> diff --git a/hw/intc/meson.build b/hw/intc/meson.build
>> index 51f0c3988a..33ba63266e 100644
>> --- a/hw/intc/meson.build
>> +++ b/hw/intc/meson.build
>> @@ -58,3 +58,4 @@ specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XIVE'],
>>   specific_ss.add(when: 'CONFIG_GOLDFISH_PIC', if_true: files('goldfish_pic.c'))
>>   specific_ss.add(when: 'CONFIG_M68K_IRQC', if_true: files('m68k_irqc.c'))
>>   specific_ss.add(when: 'CONFIG_LOONGARCH_IPI', if_true: files('loongarch_ipi.c'))
>> +specific_ss.add(when: 'CONFIG_LOONGARCH_PCH_PIC', if_true: files('loongarch_pch_pic.c'))
>> diff --git a/hw/intc/trace-events b/hw/intc/trace-events
>> index 124608e51f..52fedf82be 100644
>> --- a/hw/intc/trace-events
>> +++ b/hw/intc/trace-events
>> @@ -250,3 +250,8 @@ sh_intc_set(int id, int enable) "setting interrupt group %d to %d"
>>   # loongarch_ipi.c
>>   loongarch_ipi_read(unsigned size, uint32_t addr, unsigned long val) "size: %u addr: 0x%"PRIx32 "val: 0x%"PRIx64
>>   loongarch_ipi_write(unsigned size, uint32_t addr, unsigned long val) "size: %u addr: 0x%"PRIx32 "val: 0x%"PRIx64
>> +
>> +# loongarch_pch_pic.c
>> +pch_pic_irq_handler(uint32_t edge, int irq, int level) "edge 0x%02x irq %d level %d"
>> +loongarch_pch_pic_read(unsigned size, uint32_t addr, unsigned long val) "size: %u addr: 0x%"PRIx32 "val: 0x%" PRIx64
>> +loongarch_pch_pic_write(unsigned size, uint32_t addr, unsigned long val) "size: %u addr: 0x%"PRIx32 "val: 0x%" PRIx64
>> diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
>> index 1591574397..c2b8046b94 100644
>> --- a/hw/loongarch/Kconfig
>> +++ b/hw/loongarch/Kconfig
>> @@ -2,3 +2,4 @@ config LOONGSON3_LS7A
>>       bool
>>       select PCI_EXPRESS_7A
>>       select LOONGARCH_IPI
>> +    select LOONGARCH_PCH_PIC
>> diff --git a/include/hw/intc/loongarch_pch_pic.h b/include/hw/intc/loongarch_pch_pic.h
>> new file mode 100644
>> index 0000000000..bc04ed28ef
>> --- /dev/null
>> +++ b/include/hw/intc/loongarch_pch_pic.h
>> @@ -0,0 +1,61 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * LoongArch 7A1000 I/O interrupt controller definitions
>> + *
>> + * Copyright (c) 2021 Loongson Technology Corporation Limited
>> + */
>> +
>> +#define TYPE_LOONGARCH_PCH_PIC "loongarch_pch_pic"
>> +DECLARE_INSTANCE_CHECKER(struct loongarch_pch_pic, LOONGARCH_PCH_PIC,
>> +                         TYPE_LOONGARCH_PCH_PIC)
>> +
>> +#define PCH_PIC_IRQ_START               0
>> +#define PCH_PIC_IRQ_END                 63
>> +#define PCH_PIC_IRQ_NUM                 64
>> +#define PCH_PIC_INT_ID_VAL              0x7000000UL
>> +#define PCH_PIC_INT_ID_NUM              0x3f0001UL
>> +
>> +#define PCH_PIC_INT_ID_OFFSET           0x00
>> +#define PCH_PIC_INT_ID_END              0x07
>> +#define PCH_PIC_INT_MASK_OFFSET         0x20
>> +#define PCH_PIC_INT_MASK_END            0x27
>> +#define PCH_PIC_HTMSI_EN_OFFSET         0x40
>> +#define PCH_PIC_HTMSI_EN_END            0x47
>> +#define PCH_PIC_INT_EDGE_OFFSET         0x60
>> +#define PCH_PIC_INT_EDGE_END            0x67
>> +#define PCH_PIC_INT_CLEAR_OFFSET        0x80
>> +#define PCH_PIC_INT_CLEAR_END           0x87
>> +#define PCH_PIC_AUTO_CTRL0_OFFSET       0xc0
>> +#define PCH_PIC_AUTO_CTRL0_END          0xc7
>> +#define PCH_PIC_AUTO_CTRL1_OFFSET       0xe0
>> +#define PCH_PIC_AUTO_CTRL1_END          0xe8
>> +#define PCH_PIC_ROUTE_ENTRY_OFFSET      0x100
>> +#define PCH_PIC_ROUTE_ENTRY_END         0x13f
>> +#define PCH_PIC_HTMSI_VEC_OFFSET        0x200
>> +#define PCH_PIC_HTMSI_VEC_END           0x23f
>> +#define PCH_PIC_INT_STATUS_OFFSET       0x3a0
>> +#define PCH_PIC_INT_STATUS_END          0x3a7
>> +#define PCH_PIC_INT_POL_OFFSET          0x3e0
>> +#define PCH_PIC_INT_POL_END             0x3e7
>> +
>> +typedef struct loongarch_pch_pic {
>> +    SysBusDevice parent_obj;
>> +    qemu_irq parent_irq[64];
>> +    uint64_t int_mask; /*0x020 interrupt mask register*/
>> +    uint64_t htmsi_en;/*0x040 1=msi*/
>> +    uint64_t intedge; /*0x060 edge=1 level  =0*/
>> +    uint64_t intclr; /*0x080 for clean edge int,set 1 clean,set 0 is noused*/
>> +    uint64_t auto_crtl0; /*0x0c0*/
>> +    uint64_t auto_crtl1; /*0x0e0*/
>> +    uint8_t route_entry[64]; /*0x100 - 0x138*/
>> +    uint8_t htmsi_vector[64]; /*0x200 - 0x238*/
>> +    uint64_t last_intirr;    /* edge detection */
>> +    uint64_t intirr; /* 0x380 interrupt request register */
>> +    uint64_t intisr; /* 0x3a0 interrupt service register */
>> +    /*
>> +     * 0x3e0 interrupt level polarity selection
>> +     * register 0 for high level trigger
>> +     */
>> +    uint64_t int_polarity;
>> +    MemoryRegion iomem;
>> +} loongarch_pch_pic;
> 
> 
> ATB,
> 
> Mark.


