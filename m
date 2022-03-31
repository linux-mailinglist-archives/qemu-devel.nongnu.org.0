Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 702D94ED14E
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 03:27:41 +0200 (CEST)
Received: from localhost ([::1]:35576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZjbA-0005j8-9r
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 21:27:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nZjYx-00042N-EA
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 21:25:26 -0400
Received: from mail.loongson.cn ([114.242.206.163]:41552 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nZjYs-00046q-Ag
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 21:25:22 -0400
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx3xP4AkVicZATAA--.21778S3; 
 Thu, 31 Mar 2022 09:25:12 +0800 (CST)
Subject: Re: [RFC PATCH v7 17/29] hw/intc: Add LoongArch ls7a interrupt
 controller support(PCH-PIC)
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20220328125749.2918087-1-yangxiaojuan@loongson.cn>
 <20220328125749.2918087-18-yangxiaojuan@loongson.cn>
 <6d49954d-66c7-ddfb-f4f8-b53122bcf591@ilande.co.uk>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <895d808a-6ee3-2ac1-bed7-5ec281440d82@loongson.cn>
Date: Thu, 31 Mar 2022 09:25:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <6d49954d-66c7-ddfb-f4f8-b53122bcf591@ilande.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf9Dx3xP4AkVicZATAA--.21778S3
X-Coremail-Antispam: 1UD129KBjvAXoWfXF1Utr45WF48Kr4kWr4kJFb_yoW5WFW3Ao
 WUKr1rJr15Jr1jgryUJr15Xr13JF1UArnrtrWUW347Jr18AF1UG3yUJryUt3yUJr48Gr1U
 Jr1UJrW0yFyUAr15n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjp_UUUYa7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xva
 j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
 x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWx
 JVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
 WxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
 Yx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
 WUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07Al
 zVAYIcxG8wCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
 1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
 14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
 IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVW3JVWrJr1lIxAIcVC2
 z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
 UI43ZEXa7VUb3rc3UUUUU==
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
Cc: richard.henderson@linaro.org, Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2022/3/29 上午4:18, Mark Cave-Ayland wrote:
> On 28/03/2022 13:57, Xiaojuan Yang wrote:
>> This patch realize the PCH-PIC interrupt controller.
>>
>> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>> ---
>>   hw/intc/Kconfig                     |   4 +
>>   hw/intc/loongarch_pch_pic.c         | 488 ++++++++++++++++++++++++++++
>>   hw/intc/meson.build                 |   1 +
>>   hw/intc/trace-events                |   9 +
>>   hw/loongarch/Kconfig                |   1 +
>>   include/hw/intc/loongarch_pch_pic.h |  80 +++++
>>   6 files changed, 583 insertions(+)
>>   create mode 100644 hw/intc/loongarch_pch_pic.c
>>   create mode 100644 include/hw/intc/loongarch_pch_pic.h
>>
>> diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
>> index 6c7e82da64..1fbba2e728 100644
>> --- a/hw/intc/Kconfig
>> +++ b/hw/intc/Kconfig
>> @@ -87,3 +87,7 @@ config M68K_IRQC
>>     config LOONGARCH_IPI
>>       bool
>> +
>> +config LOONGARCH_PCH_PIC
>> +    bool
>> +    select UNIMP
>> diff --git a/hw/intc/loongarch_pch_pic.c b/hw/intc/loongarch_pch_pic.c
>> new file mode 100644
>> index 0000000000..04b9bdce36
>> --- /dev/null
>> +++ b/hw/intc/loongarch_pch_pic.c
>> @@ -0,0 +1,488 @@
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
>> +static void pch_pic_update_irq(LoongArchPCHPIC *s, uint32_t mask,
>> +                               int level, int hi)
>> +{
>> +    uint32_t val, irq;
>> +
>> +    if (level == 1) {
>> +        if (hi) {
>> +            val = mask & s->intirr_hi & (~s->int_mask_hi);
>> +            irq = find_first_bit((void *)&val, 32);
>> +            if (irq != 32) {
>> +                s->intisr_hi |= 1ULL << irq;
>> + qemu_set_irq(s->parent_irq[s->htmsi_vector[irq + 32]], 1);
>> +            }
>> +        } else {
>> +            val = mask & s->intirr_lo & (~s->int_mask_lo);
>> +            irq = find_first_bit((void *)&val, 32);
>> +            if (irq != 32) {
>> +                s->intisr_lo |= 1ULL << irq;
>> + qemu_set_irq(s->parent_irq[s->htmsi_vector[irq]], 1);
>> +            }
>> +        }
>> +    } else {
>> +        if (hi) {
>> +            val = mask & s->intisr_hi;
>> +            irq = find_first_bit((void *)&val, 32);
>> +            if (irq != 32) {
>> +                s->intisr_hi &= ~(0x1ULL << irq);
>> + qemu_set_irq(s->parent_irq[s->htmsi_vector[irq + 32]], 0);
>> +            }
>> +        } else {
>> +            val = mask & s->intisr_lo;
>> +            irq = find_first_bit((void *)&val, 32);
>> +            if (irq != 32) {
>> +                s->intisr_lo &= ~(0x1ULL << irq);
>> + qemu_set_irq(s->parent_irq[s->htmsi_vector[irq]], 0);
>> +            }
>> +        }
>> +    }
>> +}
>> +
>> +static void pch_pic_irq_handler(void *opaque, int irq, int level)
>> +{
>> +    LoongArchPCHPIC *s = LOONGARCH_PCH_PIC(opaque);
>> +    int hi = 0;
>> +    uint32_t mask;
>> +
>> +    assert(irq < PCH_PIC_IRQ_NUM);
>> +    trace_pch_pic_irq_handler(irq, level);
>> +
>> +    hi = (irq >= 32) ? 1 : 0;
>> +    if (hi) {
>> +        irq = irq - 32;
>> +    }
>> +
>> +    mask = 1ULL << irq;
>> +
>> +    if (hi) {
>> +        if (s->intedge_hi & mask) {
>> +            /* Edge triggered */
>> +            if (level) {
>> +                if ((s->last_intirr_hi & mask) == 0) {
>> +                    s->intirr_hi |= mask;
>> +                }
>> +                s->last_intirr_hi |= mask;
>> +            } else {
>> +                s->last_intirr_hi &= ~mask;
>> +            }
>> +        } else {
>> +            /* Level triggered */
>> +            if (level) {
>> +                s->intirr_hi |= mask;
>> +                s->last_intirr_hi |= mask;
>> +            } else {
>> +                s->intirr_hi &= ~mask;
>> +                s->last_intirr_hi &= ~mask;
>> +            }
>> +        }
>> +    } else {
>> +        if (s->intedge_lo & mask) {
>> +            /* Edge triggered */
>> +            if (level) {
>> +                if ((s->last_intirr_lo & mask) == 0) {
>> +                    s->intirr_lo |= mask;
>> +                }
>> +                s->last_intirr_lo |= mask;
>> +            } else {
>> +                s->last_intirr_lo &= ~mask;
>> +            }
>> +        } else {
>> +            /* Level triggered */
>> +            if (level) {
>> +                s->intirr_lo |= mask;
>> +                s->last_intirr_lo |= mask;
>> +            } else {
>> +                s->intirr_lo &= ~mask;
>> +                s->last_intirr_lo &= ~mask;
>> +            }
>> +
>> +        }
>> +    }
>> +    pch_pic_update_irq(s, mask, level, hi);
>> +}
>> +
>> +static uint64_t loongarch_pch_pic_low_readw(void *opaque, hwaddr addr,
>> +                                            unsigned size)
>> +{
>> +    LoongArchPCHPIC *s = LOONGARCH_PCH_PIC(opaque);
>> +    uint64_t val = 0;
>> +    uint32_t offset = addr & 0xfff;
>> +
>> +    switch (offset) {
>> +    case PCH_PIC_INT_ID_LO:
>> +        val = PCH_PIC_INT_ID_VAL;
>> +        break;
>> +    case PCH_PIC_INT_ID_HI:
>> +        val = PCH_PIC_INT_ID_NUM;
>> +        break;
>> +    case PCH_PIC_INT_MASK_LO:
>> +        val = s->int_mask_lo;
>> +        break;
>> +    case PCH_PIC_INT_MASK_HI:
>> +        val = s->int_mask_hi;
>> +        break;
>> +    case PCH_PIC_INT_EDGE_LO:
>> +        val = s->intedge_lo;
>> +        break;
>> +    case PCH_PIC_INT_EDGE_HI:
>> +        val = s->intedge_hi;
>> +        break;
>> +    case PCH_PIC_HTMSI_EN_LO:
>> +        val = s->htmsi_en_lo;
>> +        break;
>> +    case PCH_PIC_HTMSI_EN_HI:
>> +        val = s->htmsi_en_hi;
>> +        break;
>> +    case PCH_PIC_AUTO_CTRL0_LO:
>> +    case PCH_PIC_AUTO_CTRL0_HI:
>> +    case PCH_PIC_AUTO_CTRL1_LO:
>> +    case PCH_PIC_AUTO_CTRL1_HI:
>> +        break;
>> +    default:
>> +        break;
>> +    }
>> +
>> +    trace_loongarch_pch_pic_low_readw(size, (uint32_t)addr, val);
>> +    return val;
>> +}
>> +
>> +static void loongarch_pch_pic_low_writew(void *opaque, hwaddr addr,
>> +                                         uint64_t data, unsigned size)
>> +{
>> +    LoongArchPCHPIC *s = LOONGARCH_PCH_PIC(opaque);
>> +    uint32_t offset, old;
>> +    offset = addr & 0xfff;
>> +
>> +    trace_loongarch_pch_pic_low_writew(size, (uint32_t)addr, data);
>> +
>> +    switch (offset) {
>> +    case PCH_PIC_INT_MASK_LO:
>> +        old = s->int_mask_lo;
>> +        s->int_mask_lo = data;
>> +        if (old & ~data) {
>> +            pch_pic_update_irq(s, (old & ~data), 1, 0);
>> +        } else if (~old & data) {
>> +            pch_pic_update_irq(s, (~old & data), 0, 0);
>> +        }
>> +        break;
>> +    case PCH_PIC_INT_MASK_HI:
>> +        old = s->int_mask_hi;
>> +        s->int_mask_hi = data;
>> +        if (old & ~data) {
>> +            pch_pic_update_irq(s, (old & ~data), 1, 1);
>> +        } else if (~old & data) {
>> +            pch_pic_update_irq(s, (~old & data), 0, 1);
>> +        }
>> +        break;
>> +    case PCH_PIC_INT_EDGE_LO:
>> +        s->intedge_lo = data;
>> +        break;
>> +    case PCH_PIC_INT_EDGE_HI:
>> +        s->intedge_hi = data;
>> +        break;
>> +    case PCH_PIC_INT_CLEAR_LO:
>> +        if (s->intedge_lo & data) {
>> +            s->intirr_lo &= (~data);
>> +            pch_pic_update_irq(s, data, 0, 0);
>> +            s->intisr_lo &= (~data);
>> +        }
>> +        break;
>> +    case PCH_PIC_INT_CLEAR_HI:
>> +        if (s->intedge_hi & data) {
>> +            s->intirr_hi &= (~data);
>> +            pch_pic_update_irq(s, data, 0, 1);
>> +            s->intisr_hi &= (~data);
>> +        }
>> +        break;
>> +    case PCH_PIC_HTMSI_EN_LO:
>> +        s->htmsi_en_lo = data;
>> +        break;
>> +    case PCH_PIC_HTMSI_EN_HI:
>> +        s->htmsi_en_hi = data;
>> +        break;
>> +    case PCH_PIC_AUTO_CTRL0_LO:
>> +    case PCH_PIC_AUTO_CTRL0_HI:
>> +    case PCH_PIC_AUTO_CTRL1_LO:
>> +    case PCH_PIC_AUTO_CTRL1_HI:
>> +        break;
>> +    default:
>> +        break;
>> +    }
>> +}
>> +
>> +static uint64_t loongarch_pch_pic_high_readw(void *opaque, hwaddr addr,
>> +                                        unsigned size)
>> +{
>> +    LoongArchPCHPIC *s = LOONGARCH_PCH_PIC(opaque);
>> +    uint64_t val = 0;
>> +    uint32_t offset = addr & 0xfff;
>> +
>> +    switch (offset) {
>> +    case STATUS_LO_START:
>> +        val = s->intisr_lo & (~s->int_mask_lo);
>> +        break;
>> +    case STATUS_HI_START:
>> +        val = s->intisr_hi & (~s->int_mask_hi);
>> +        break;
>> +    case POL_LO_START:
>> +        val = s->int_polarity_lo;
>> +        break;
>> +    case POL_HI_START:
>> +        val = s->int_polarity_hi;
>> +        break;
>> +    default:
>> +        break;
>> +    }
>> +
>> +    trace_loongarch_pch_pic_high_readw(size, (uint32_t)addr, val);
>> +    return val;
>> +}
>> +
>> +static void loongarch_pch_pic_high_writew(void *opaque, hwaddr addr,
>> +                                     uint64_t data, unsigned size)
>> +{
>> +    LoongArchPCHPIC *s = LOONGARCH_PCH_PIC(opaque);
>> +    uint32_t offset;
>> +    offset = addr & 0xfff;
>> +
>> +    trace_loongarch_pch_pic_high_writew(size, (uint32_t)addr, data);
>> +
>> +    switch (offset) {
>> +    case STATUS_LO_START:
>> +        s->intisr_lo = data;
>> +        break;
>> +    case STATUS_HI_START:
>> +        s->intisr_hi = data;
>> +        break;
>> +    case POL_LO_START:
>> +        s->int_polarity_lo = data;
>> +        break;
>> +    case POL_HI_START:
>> +        s->int_polarity_hi = data;
>> +        break;
>> +    default:
>> +        break;
>> +    }
>> +}
>> +
>> +static uint64_t loongarch_pch_pic_readb(void *opaque, hwaddr addr,
>> +                                        unsigned size)
>> +{
>> +    LoongArchPCHPIC *s = LOONGARCH_PCH_PIC(opaque);
>> +    uint64_t val = 0;
>> +    uint32_t offset = (addr & 0xfff) + PCH_PIC_ROUTE_ENTRY_OFFSET;
>> +    int64_t offset_tmp;
>> +
>> +    switch (offset) {
>> +    case PCH_PIC_HTMSI_VEC_OFFSET ... PCH_PIC_HTMSI_VEC_END:
>> +        offset_tmp = offset - PCH_PIC_HTMSI_VEC_OFFSET;
>> +        if (offset_tmp >= 0 && offset_tmp < 64) {
>> +            val = s->htmsi_vector[offset_tmp];
>> +        }
>> +        break;
>> +    case PCH_PIC_ROUTE_ENTRY_OFFSET ... PCH_PIC_ROUTE_ENTRY_END:
>> +        offset_tmp = offset - PCH_PIC_ROUTE_ENTRY_OFFSET;
>> +        if (offset_tmp >= 0 && offset_tmp < 64) {
>> +            val = s->route_entry[offset_tmp];
>> +        }
>> +        break;
>> +    default:
>> +        break;
>> +    }
>> +
>> +    trace_loongarch_pch_pic_readb(size, (uint32_t)addr, val);
>> +    return val;
>> +}
>> +
>> +static void loongarch_pch_pic_writeb(void *opaque, hwaddr addr,
>> +                                     uint64_t data, unsigned size)
>> +{
>> +    LoongArchPCHPIC *s = LOONGARCH_PCH_PIC(opaque);
>> +    int32_t offset_tmp;
>> +    uint32_t offset = (addr & 0xfff) + PCH_PIC_ROUTE_ENTRY_OFFSET;
>> +
>> +    trace_loongarch_pch_pic_writeb(size, (uint32_t)addr, data);
>> +
>> +    switch (offset) {
>> +    case PCH_PIC_HTMSI_VEC_OFFSET ... PCH_PIC_HTMSI_VEC_END:
>> +        offset_tmp = offset - PCH_PIC_HTMSI_VEC_OFFSET;
>> +        if (offset_tmp >= 0 && offset_tmp < 64) {
>> +            s->htmsi_vector[offset_tmp] = (uint8_t)(data & 0xff);
>> +        }
>> +        break;
>> +    case PCH_PIC_ROUTE_ENTRY_OFFSET ... PCH_PIC_ROUTE_ENTRY_END:
>> +        offset_tmp = offset - PCH_PIC_ROUTE_ENTRY_OFFSET;
>> +        if (offset_tmp >= 0 && offset_tmp < 64) {
>> +            s->route_entry[offset_tmp] = (uint8_t)(data & 0xff);
>> +        }
>> +        break;
>> +    default:
>> +        break;
>> +    }
>> +}
>> +
>> +static const MemoryRegionOps loongarch_pch_pic_reg32_low_ops = {
>> +    .read = loongarch_pch_pic_low_readw,
>> +    .write = loongarch_pch_pic_low_writew,
>> +    .valid = {
>> +        .min_access_size = 4,
>> +        .max_access_size = 8,
>> +    },
>> +    .impl = {
>> +        .min_access_size = 4,
>> +        .max_access_size = 4,
>> +    },
>> +    .endianness = DEVICE_LITTLE_ENDIAN,
>> +};
>> +
>> +static const MemoryRegionOps loongarch_pch_pic_reg32_high_ops = {
>> +    .read = loongarch_pch_pic_high_readw,
>> +    .write = loongarch_pch_pic_high_writew,
>> +    .valid = {
>> +        .min_access_size = 4,
>> +        .max_access_size = 8,
>> +    },
>> +    .impl = {
>> +        .min_access_size = 4,
>> +        .max_access_size = 4,
>> +    },
>> +    .endianness = DEVICE_LITTLE_ENDIAN,
>> +};
>> +
>> +static const MemoryRegionOps loongarch_pch_pic_reg8_ops = {
>> +    .read = loongarch_pch_pic_readb,
>> +    .write = loongarch_pch_pic_writeb,
>> +    .valid = {
>> +        .min_access_size = 1,
>> +        .max_access_size = 1,
>> +    },
>> +    .impl = {
>> +        .min_access_size = 1,
>> +        .max_access_size = 1,
>> +    },
>> +    .endianness = DEVICE_LITTLE_ENDIAN,
>> +};
>> +
>> +static void loongarch_pch_pic_reset(DeviceState *d)
>> +{
>> +    LoongArchPCHPIC *s = LOONGARCH_PCH_PIC(d);
>> +    int i;
>> +
>> +    s->int_mask_lo = -1;
>> +    s->int_mask_hi = -1;
>> +    s->htmsi_en_lo = 0x0;
>> +    s->htmsi_en_hi = 0x0;
>> +    s->intedge_lo  = 0x0;
>> +    s->intedge_hi  = 0x0;
>> +    s->intclr_lo   = 0x0;
>> +    s->intclr_hi   = 0x0;
>> +    s->auto_crtl0_lo = 0x0;
>> +    s->auto_crtl0_hi = 0x0;
>> +    s->auto_crtl1_lo = 0x0;
>> +    s->auto_crtl1_hi = 0x0;
>> +    for (i = 0; i < 64; i++) {
>> +        s->route_entry[i] = 0x1;
>> +        s->htmsi_vector[i] = 0x0;
>> +    }
>> +    s->intirr_lo = 0x0;
>> +    s->intirr_hi = 0x0;
>> +    s->intisr_lo = 0x0;
>> +    s->intisr_hi = 0x0;
>> +    s->last_intirr_lo = 0x0;
>> +    s->last_intirr_hi = 0x0;
>> +    s->int_polarity_lo = 0x0;
>> +    s->int_polarity_hi = 0x0;
>> +}
>> +
>> +static void loongarch_pch_pic_init(Object *obj)
>> +{
>> +    LoongArchPCHPIC *s = LOONGARCH_PCH_PIC(obj);
>> +    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
>> +    int i;
>> +
>> +    memory_region_init_io(&s->iomem32_low, obj,
>> +                          &loongarch_pch_pic_reg32_low_ops,
>> +                          s, PCH_PIC_NAME(.reg32_part1), 0x100);
>> +    memory_region_init_io(&s->iomem8, obj, &loongarch_pch_pic_reg8_ops,
>> +                          s, PCH_PIC_NAME(.reg8), 0x2a0);
>> +    memory_region_init_io(&s->iomem32_high, obj,
>> + &loongarch_pch_pic_reg32_high_ops,
>> +                          s, PCH_PIC_NAME(.reg32_part2), 0xc60);
>> +    sysbus_init_mmio(sbd, &s->iomem32_low);
>> +    sysbus_init_mmio(sbd, &s->iomem8);
>> +    sysbus_init_mmio(sbd, &s->iomem32_high);
>> +
>> +    for (i = 0; i < PCH_PIC_IRQ_NUM; i++) {
>> +        sysbus_init_irq(sbd, &s->parent_irq[i]);
>> +    }
>> +    qdev_init_gpio_in(DEVICE(obj), pch_pic_irq_handler, 
>> PCH_PIC_IRQ_NUM);
>> +}
>> +
>> +static const VMStateDescription vmstate_loongarch_pch_pic = {
>> +    .name = TYPE_LOONGARCH_PCH_PIC,
>> +    .version_id = 1,
>> +    .minimum_version_id = 1,
>> +    .fields = (VMStateField[]) {
>> +        VMSTATE_UINT32(int_mask_lo, LoongArchPCHPIC),
>> +        VMSTATE_UINT32(int_mask_hi, LoongArchPCHPIC),
>> +        VMSTATE_UINT32(htmsi_en_lo, LoongArchPCHPIC),
>> +        VMSTATE_UINT32(htmsi_en_hi, LoongArchPCHPIC),
>> +        VMSTATE_UINT32(intedge_lo, LoongArchPCHPIC),
>> +        VMSTATE_UINT32(intedge_hi, LoongArchPCHPIC),
>> +        VMSTATE_UINT32(intclr_lo, LoongArchPCHPIC),
>> +        VMSTATE_UINT32(intclr_hi, LoongArchPCHPIC),
>> +        VMSTATE_UINT32(auto_crtl0_lo, LoongArchPCHPIC),
>> +        VMSTATE_UINT32(auto_crtl0_hi, LoongArchPCHPIC),
>> +        VMSTATE_UINT32(auto_crtl1_lo, LoongArchPCHPIC),
>> +        VMSTATE_UINT32(auto_crtl1_hi, LoongArchPCHPIC),
>> +        VMSTATE_UINT8_ARRAY(route_entry, LoongArchPCHPIC, 64),
>> +        VMSTATE_UINT8_ARRAY(htmsi_vector, LoongArchPCHPIC, 64),
>> +        VMSTATE_UINT32(last_intirr_lo, LoongArchPCHPIC),
>> +        VMSTATE_UINT32(last_intirr_hi, LoongArchPCHPIC),
>> +        VMSTATE_UINT32(intirr_lo, LoongArchPCHPIC),
>> +        VMSTATE_UINT32(intirr_hi, LoongArchPCHPIC),
>> +        VMSTATE_UINT32(intisr_lo, LoongArchPCHPIC),
>> +        VMSTATE_UINT32(intisr_hi, LoongArchPCHPIC),
>> +        VMSTATE_UINT32(int_polarity_lo, LoongArchPCHPIC),
>> +        VMSTATE_UINT32(int_polarity_hi, LoongArchPCHPIC),
>> +        VMSTATE_END_OF_LIST()
>> +    }
>> +};
>> +
>> +static void loongarch_pch_pic_class_init(ObjectClass *klass, void 
>> *data)
>> +{
>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>> +
>> +    dc->reset = loongarch_pch_pic_reset;
>> +    dc->vmsd = &vmstate_loongarch_pch_pic;
>> +}
>> +
>> +static const TypeInfo loongarch_pch_pic_info = {
>> +    .name          = TYPE_LOONGARCH_PCH_PIC,
>> +    .parent        = TYPE_SYS_BUS_DEVICE,
>> +    .instance_size = sizeof(LoongArchPCHPIC),
>> +    .instance_init = loongarch_pch_pic_init,
>> +    .class_init    = loongarch_pch_pic_class_init,
>> +};
>> +
>> +static void loongarch_pch_pic_register_types(void)
>> +{
>> +    type_register_static(&loongarch_pch_pic_info);
>> +}
>> +
>> +type_init(loongarch_pch_pic_register_types)
>> diff --git a/hw/intc/meson.build b/hw/intc/meson.build
>> index bf5ab44a78..960ce81a92 100644
>> --- a/hw/intc/meson.build
>> +++ b/hw/intc/meson.build
>> @@ -63,3 +63,4 @@ specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XIVE'],
>>   specific_ss.add(when: 'CONFIG_GOLDFISH_PIC', if_true: 
>> files('goldfish_pic.c'))
>>   specific_ss.add(when: 'CONFIG_M68K_IRQC', if_true: 
>> files('m68k_irqc.c'))
>>   specific_ss.add(when: 'CONFIG_LOONGARCH_IPI', if_true: 
>> files('loongarch_ipi.c'))
>> +specific_ss.add(when: 'CONFIG_LOONGARCH_PCH_PIC', if_true: 
>> files('loongarch_pch_pic.c'))
>> diff --git a/hw/intc/trace-events b/hw/intc/trace-events
>> index 6ae8917d99..8c12bdd89f 100644
>> --- a/hw/intc/trace-events
>> +++ b/hw/intc/trace-events
>> @@ -279,3 +279,12 @@ sh_intc_set(int id, int enable) "setting 
>> interrupt group %d to %d"
>>   # loongarch_ipi.c
>>   loongarch_ipi_read(unsigned size, uint64_t addr, unsigned long val) 
>> "size: %u addr: 0x%"PRIx64 "val: 0x%"PRIx64
>>   loongarch_ipi_write(unsigned size, uint64_t addr, unsigned long 
>> val) "size: %u addr: 0x%"PRIx64 "val: 0x%"PRIx64
>> +
>> +# loongarch_pch_pic.c
>> +pch_pic_irq_handler(int irq, int level) "irq %d level %d"
>> +loongarch_pch_pic_low_readw(unsigned size, uint32_t addr, unsigned 
>> long val) "size: %u addr: 0x%"PRIx32 "val: 0x%" PRIx64
>> +loongarch_pch_pic_low_writew(unsigned size, uint32_t addr, unsigned 
>> long val) "size: %u addr: 0x%"PRIx32 "val: 0x%" PRIx64
>> +loongarch_pch_pic_high_readw(unsigned size, uint32_t addr, unsigned 
>> long val) "size: %u addr: 0x%"PRIx32 "val: 0x%" PRIx64
>> +loongarch_pch_pic_high_writew(unsigned size, uint32_t addr, unsigned 
>> long val) "size: %u addr: 0x%"PRIx32 "val: 0x%" PRIx64
>> +loongarch_pch_pic_readb(unsigned size, uint32_t addr, unsigned long 
>> val) "size: %u addr: 0x%"PRIx32 "val: 0x%" PRIx64
>> +loongarch_pch_pic_writeb(unsigned size, uint32_t addr, unsigned long 
>> val) "size: %u addr: 0x%"PRIx32 "val: 0x%" PRIx64
>> diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
>> index f0dad3329a..2df45f7e8f 100644
>> --- a/hw/loongarch/Kconfig
>> +++ b/hw/loongarch/Kconfig
>> @@ -3,3 +3,4 @@ config LOONGARCH_VIRT
>>       select PCI
>>       select PCI_EXPRESS_GENERIC_BRIDGE
>>       select LOONGARCH_IPI
>> +    select LOONGARCH_PCH_PIC
>> diff --git a/include/hw/intc/loongarch_pch_pic.h 
>> b/include/hw/intc/loongarch_pch_pic.h
>> new file mode 100644
>> index 0000000000..8ca044be33
>> --- /dev/null
>> +++ b/include/hw/intc/loongarch_pch_pic.h
>> @@ -0,0 +1,80 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * LoongArch 7A1000 I/O interrupt controller definitions
>> + *
>> + * Copyright (c) 2021 Loongson Technology Corporation Limited
>> + */
>> +
>> +#define TYPE_LOONGARCH_PCH_PIC "loongarch_pch_pic"
>> +#define PCH_PIC_NAME(name) TYPE_LOONGARCH_PCH_PIC#name
>> +OBJECT_DECLARE_SIMPLE_TYPE(LoongArchPCHPIC, LOONGARCH_PCH_PIC)
>> +
>> +#define PCH_PIC_IRQ_START               0
>> +#define PCH_PIC_IRQ_END                 63
>> +#define PCH_PIC_IRQ_NUM                 64
>> +#define PCH_PIC_INT_ID_VAL              0x7000000UL
>> +#define PCH_PIC_INT_ID_NUM              0x3f0001UL
>> +
>> +#define PCH_PIC_INT_ID_LO               0x00
>> +#define PCH_PIC_INT_ID_HI               0x04
>> +#define PCH_PIC_INT_MASK_LO             0x20
>> +#define PCH_PIC_INT_MASK_HI             0x24
>> +#define PCH_PIC_HTMSI_EN_LO             0x40
>> +#define PCH_PIC_HTMSI_EN_HI             0x44
>> +#define PCH_PIC_INT_EDGE_LO             0x60
>> +#define PCH_PIC_INT_EDGE_HI             0x64
>> +#define PCH_PIC_INT_CLEAR_LO            0x80
>> +#define PCH_PIC_INT_CLEAR_HI            0x84
>> +#define PCH_PIC_AUTO_CTRL0_LO           0xc0
>> +#define PCH_PIC_AUTO_CTRL0_HI           0xc4
>> +#define PCH_PIC_AUTO_CTRL1_LO           0xe0
>> +#define PCH_PIC_AUTO_CTRL1_HI           0xe4
>> +#define PCH_PIC_ROUTE_ENTRY_OFFSET      0x100
>> +#define PCH_PIC_ROUTE_ENTRY_END         0x13f
>> +#define PCH_PIC_HTMSI_VEC_OFFSET        0x200
>> +#define PCH_PIC_HTMSI_VEC_END           0x23f
>> +#define PCH_PIC_INT_STATUS_LO           0x3a0
>> +#define PCH_PIC_INT_STATUS_HI           0x3a4
>> +#define PCH_PIC_INT_POL_LO              0x3e0
>> +#define PCH_PIC_INT_POL_HI              0x3e4
>> +
>> +#define STATUS_LO_START                 0
>> +#define STATUS_HI_START                 0x4
>> +#define POL_LO_START                    0x40
>> +#define POL_HI_START                    0x44
>> +
>> +typedef struct LoongArchPCHPIC {
>> +    SysBusDevice parent_obj;
>> +    qemu_irq parent_irq[64];
>> +    uint32_t int_mask_lo; /*0x020 interrupt mask register*/
>> +    uint32_t int_mask_hi;
>> +    uint32_t htmsi_en_lo; /*0x040 1=msi*/
>> +    uint32_t htmsi_en_hi;
>> +    uint32_t intedge_lo; /*0x060 edge=1 level  =0*/
>> +    uint32_t intedge_hi; /*0x060 edge=1 level  =0*/
>> +    uint32_t intclr_lo; /*0x080 for clean edge int,set 1 clean,set 0 
>> is noused*/
>> +    uint32_t intclr_hi; /*0x080 for clean edge int,set 1 clean,set 0 
>> is noused*/
>> +    uint32_t auto_crtl0_lo; /*0x0c0*/
>> +    uint32_t auto_crtl0_hi; /*0x0c0*/
>> +    uint32_t auto_crtl1_lo; /*0x0e0*/
>> +    uint32_t auto_crtl1_hi; /*0x0e0*/
>> +    uint32_t last_intirr_lo;    /* edge detection */
>> +    uint32_t last_intirr_hi;    /* edge detection */
>> +    uint32_t intirr_lo; /* 0x380 interrupt request register */
>> +    uint32_t intirr_hi; /* 0x380 interrupt request register */
>> +    uint32_t intisr_lo; /* 0x3a0 interrupt service register */
>> +    uint32_t intisr_hi; /* 0x3a0 interrupt service register */
>> +    /*
>> +     * 0x3e0 interrupt level polarity selection
>> +     * register 0 for high level trigger
>> +     */
>> +    uint32_t int_polarity_lo;
>> +    uint32_t int_polarity_hi;
>> +
>> +    uint8_t route_entry[64]; /*0x100 - 0x138*/
>> +    uint8_t htmsi_vector[64]; /*0x200 - 0x238*/
>> +
>> +    MemoryRegion iomem32_low;
>> +    MemoryRegion iomem32_high;
>> +    MemoryRegion iomem8;
>> +} LoongArchPCHPIC;
>
> Same comment here about dropping the typedef for the QOM type.
>
OK, I will correct it.

Thanks.
Xiaojuan
>
> ATB,
>
> Mark.


