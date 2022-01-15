Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC8448F723
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Jan 2022 14:47:50 +0100 (CET)
Received: from localhost ([::1]:35914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8jPJ-0003GO-2w
	for lists+qemu-devel@lfdr.de; Sat, 15 Jan 2022 08:47:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1n8jJj-0002Nj-3R
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 08:42:04 -0500
Received: from [2001:41c9:1:41f::167] (port=48762
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1n8jJg-0002vv-6p
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 08:42:02 -0500
Received: from [2a00:23c4:8ba0:4900:614:7796:ec2b:4f88]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1n8jJB-00060J-FP; Sat, 15 Jan 2022 13:41:33 +0000
Message-ID: <56506490-9166-15a7-16b5-77f4674f5d74@ilande.co.uk>
Date: Sat, 15 Jan 2022 13:41:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220108091419.2027710-1-yangxiaojuan@loongson.cn>
 <20220108091419.2027710-19-yangxiaojuan@loongson.cn>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220108091419.2027710-19-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:4900:614:7796:ec2b:4f88
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC PATCH v4 18/30] hw/intc: Add LoongArch ls7a interrupt
 controller support(PCH-PIC)
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
Cc: philmd@redhat.com, richard.henderson@linaro.org,
 Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/01/2022 09:14, Xiaojuan Yang wrote:
> This patch realize the PCH-PIC interrupt controller.
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   hw/intc/Kconfig                     |   4 +
>   hw/intc/loongarch_pch_pic.c         | 428 ++++++++++++++++++++++++++++
>   hw/intc/meson.build                 |   1 +
>   hw/intc/trace-events                |   7 +
>   hw/loongarch/Kconfig                |   1 +
>   include/hw/intc/loongarch_pch_pic.h |  74 +++++
>   6 files changed, 515 insertions(+)
>   create mode 100644 hw/intc/loongarch_pch_pic.c
>   create mode 100644 include/hw/intc/loongarch_pch_pic.h
> 
> diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
> index 9f5aaffb6f..928db92bb4 100644
> --- a/hw/intc/Kconfig
> +++ b/hw/intc/Kconfig
> @@ -81,3 +81,7 @@ config M68K_IRQC
>   
>   config LOONGARCH_IPI
>       bool
> +
> +config LOONGARCH_PCH_PIC
> +    bool
> +    select UNIMP
> diff --git a/hw/intc/loongarch_pch_pic.c b/hw/intc/loongarch_pch_pic.c
> new file mode 100644
> index 0000000000..4da78b5bc8
> --- /dev/null
> +++ b/hw/intc/loongarch_pch_pic.c
> @@ -0,0 +1,428 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * QEMU Loongson 7A1000 I/O interrupt controller.
> + *
> + * Copyright (C) 2021 Loongson Technology Corporation Limited
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/sysbus.h"
> +#include "hw/loongarch/loongarch.h"
> +#include "hw/irq.h"
> +#include "hw/intc/loongarch_pch_pic.h"
> +#include "migration/vmstate.h"
> +#include "trace.h"
> +
> +static void pch_pic_update_irq(LoongArchPCHPIC *s, uint32_t mask,
> +                               int level, int hi)
> +{
> +    uint32_t val, irq;
> +
> +    if (level == 1) {
> +        if (hi) {
> +            val = mask & s->intirr_hi & (~s->int_mask_hi);
> +            irq = find_first_bit((void *)&val, 32);
> +            if (irq != 32) {
> +                s->intisr_hi |= 1ULL << irq;
> +                qemu_set_irq(s->parent_irq[s->htmsi_vector[irq + 32]], 1);
> +            }
> +        } else {
> +            val = mask & s->intirr_lo & (~s->int_mask_lo);
> +            irq = find_first_bit((void *)&val, 32);
> +            if (irq != 32) {
> +                s->intisr_lo |= 1ULL << irq;
> +                qemu_set_irq(s->parent_irq[s->htmsi_vector[irq]], 1);
> +            }
> +        }
> +    } else {
> +        if (hi) {
> +            val = mask & s->intisr_hi;
> +            irq = find_first_bit((void *)&val, 32);
> +            if (irq != 32) {
> +                s->intisr_hi &= ~(0x1ULL << irq);
> +                qemu_set_irq(s->parent_irq[s->htmsi_vector[irq + 32]], 0);
> +            }
> +        } else {
> +            val = mask & s->intisr_lo;
> +            irq = find_first_bit((void *)&val, 32);
> +            if (irq != 32) {
> +                s->intisr_lo &= ~(0x1ULL << irq);
> +                qemu_set_irq(s->parent_irq[s->htmsi_vector[irq]], 0);
> +            }
> +        }
> +    }
> +}
> +
> +static void pch_pic_irq_handler(void *opaque, int irq, int level)
> +{
> +    LoongArchPCHPIC *s = LOONGARCH_PCH_PIC(opaque);
> +    int hi = 0;
> +    uint32_t mask;
> +
> +    assert(irq < PCH_PIC_IRQ_NUM);
> +    trace_pch_pic_irq_handler(irq, level);
> +
> +    hi = (irq >= 32) ? 1 : 0;
> +    if (hi) {
> +        irq = irq - 32;
> +    }
> +
> +    mask = 1ULL << irq;
> +
> +    if (hi) {
> +        if (s->intedge_hi & mask) {
> +            /* Edge triggered */
> +            if (level) {
> +                if ((s->last_intirr_hi & mask) == 0) {
> +                    s->intirr_hi |= mask;
> +                }
> +                s->last_intirr_hi |= mask;
> +            } else {
> +                s->last_intirr_hi &= ~mask;
> +            }
> +        } else {
> +            /* Level triggered */
> +            if (level) {
> +                s->intirr_hi |= mask;
> +                s->last_intirr_hi |= mask;
> +            } else {
> +                s->intirr_hi &= ~mask;
> +                s->last_intirr_hi &= ~mask;
> +            }
> +        }
> +    } else {
> +        if (s->intedge_lo & mask) {
> +            /* Edge triggered */
> +            if (level) {
> +                if ((s->last_intirr_lo & mask) == 0) {
> +                    s->intirr_lo |= mask;
> +                }
> +                s->last_intirr_lo |= mask;
> +            } else {
> +                s->last_intirr_lo &= ~mask;
> +            }
> +        } else {
> +            /* Level triggered */
> +            if (level) {
> +                s->intirr_lo |= mask;
> +                s->last_intirr_lo |= mask;
> +            } else {
> +                s->intirr_lo &= ~mask;
> +                s->last_intirr_lo &= ~mask;
> +            }
> +
> +        }
> +    }
> +    pch_pic_update_irq(s, mask, level, hi);
> +}
> +
> +static uint64_t loongarch_pch_pic_readw(void *opaque, hwaddr addr,
> +                                        unsigned size)
> +{
> +    LoongArchPCHPIC *s = LOONGARCH_PCH_PIC(opaque);
> +    uint64_t val = 0;
> +    uint32_t offset = addr & 0xfff;
> +
> +    switch (offset) {
> +    case PCH_PIC_INT_ID_LO:
> +        val = PCH_PIC_INT_ID_VAL;
> +        break;
> +    case PCH_PIC_INT_ID_HI:
> +        val = PCH_PIC_INT_ID_NUM;
> +        break;
> +    case PCH_PIC_INT_MASK_LO:
> +        val = s->int_mask_lo;
> +        break;
> +    case PCH_PIC_INT_MASK_HI:
> +        val = s->int_mask_hi;
> +        break;
> +    case PCH_PIC_INT_STATUS_LO:
> +        val = s->intisr_lo & (~s->int_mask_lo);
> +        break;
> +    case PCH_PIC_INT_STATUS_HI:
> +        val = s->intisr_hi & (~s->int_mask_hi);
> +        break;
> +    case PCH_PIC_INT_EDGE_LO:
> +        val = s->intedge_lo;
> +        break;
> +    case PCH_PIC_INT_EDGE_HI:
> +        val = s->intedge_hi;
> +        break;
> +    case PCH_PIC_INT_POL_LO:
> +        val = s->int_polarity_lo;
> +        break;
> +    case PCH_PIC_INT_POL_HI:
> +        val = s->int_polarity_hi;
> +        break;
> +    case PCH_PIC_HTMSI_EN_LO:
> +        val = s->htmsi_en_lo;
> +        break;
> +    case PCH_PIC_HTMSI_EN_HI:
> +        val = s->htmsi_en_hi;
> +        break;
> +    case PCH_PIC_AUTO_CTRL0_LO:
> +    case PCH_PIC_AUTO_CTRL0_HI:
> +    case PCH_PIC_AUTO_CTRL1_LO:
> +    case PCH_PIC_AUTO_CTRL1_HI:
> +        break;
> +    default:
> +        break;
> +    }
> +
> +    trace_loongarch_pch_pic_readw(size, (uint32_t)addr, val);
> +    return val;
> +}
> +
> +static void loongarch_pch_pic_writew(void *opaque, hwaddr addr,
> +                                     uint64_t data, unsigned size)
> +{
> +    LoongArchPCHPIC *s = LOONGARCH_PCH_PIC(opaque);
> +    uint32_t offset, old;
> +    offset = addr & 0xfff;
> +
> +    trace_loongarch_pch_pic_writew(size, (uint32_t)addr, data);
> +
> +    switch (offset) {
> +    case PCH_PIC_INT_MASK_LO:
> +        old = s->int_mask_lo;
> +        s->int_mask_lo = data;
> +        if (old & ~data) {
> +            pch_pic_update_irq(s, (old & ~data), 1, 0);
> +        } else if (~old & data) {
> +            pch_pic_update_irq(s, (~old & data), 0, 0);
> +        }
> +        break;
> +    case PCH_PIC_INT_MASK_HI:
> +        old = s->int_mask_hi;
> +        s->int_mask_hi = data;
> +        if (old & ~data) {
> +            pch_pic_update_irq(s, (old & ~data), 1, 1);
> +        } else if (~old & data) {
> +            pch_pic_update_irq(s, (~old & data), 0, 1);
> +        }
> +        break;
> +    case PCH_PIC_INT_STATUS_LO:
> +        s->intisr_lo = data;
> +        break;
> +    case PCH_PIC_INT_STATUS_HI:
> +        s->intisr_hi = data;
> +        break;
> +    case PCH_PIC_INT_EDGE_LO:
> +        s->intedge_lo = data;
> +        break;
> +    case PCH_PIC_INT_EDGE_HI:
> +        s->intedge_hi = data;
> +        break;
> +    case PCH_PIC_INT_CLEAR_LO:
> +        if (s->intedge_lo & data) {
> +            s->intirr_lo &= (~data);
> +            pch_pic_update_irq(s, data, 0, 0);
> +            s->intisr_lo &= (~data);
> +        }
> +        break;
> +    case PCH_PIC_INT_CLEAR_HI:
> +        if (s->intedge_hi & data) {
> +            s->intirr_hi &= (~data);
> +            pch_pic_update_irq(s, data, 0, 1);
> +            s->intisr_hi &= (~data);
> +        }
> +        break;
> +    case PCH_PIC_INT_POL_LO:
> +        s->int_polarity_lo = data;
> +        break;
> +    case PCH_PIC_INT_POL_HI:
> +        s->int_polarity_hi = data;
> +        break;
> +    case PCH_PIC_HTMSI_EN_LO:
> +        s->htmsi_en_lo = data;
> +        break;
> +    case PCH_PIC_HTMSI_EN_HI:
> +        s->htmsi_en_hi = data;
> +        break;
> +    case PCH_PIC_AUTO_CTRL0_LO:
> +    case PCH_PIC_AUTO_CTRL0_HI:
> +    case PCH_PIC_AUTO_CTRL1_LO:
> +    case PCH_PIC_AUTO_CTRL1_HI:
> +        break;
> +    default:
> +        break;
> +    }
> +}
> +
> +static uint64_t loongarch_pch_pic_readb(void *opaque, hwaddr addr,
> +                                        unsigned size)
> +{
> +    LoongArchPCHPIC *s = LOONGARCH_PCH_PIC(opaque);
> +    uint64_t val = 0;
> +    uint32_t offset = (addr & 0xfff) + PCH_PIC_ROUTE_ENTRY_OFFSET;
> +    int64_t offset_tmp;
> +
> +    if (offset >= PCH_PIC_HTMSI_VEC_OFFSET) {
> +        offset_tmp = offset - PCH_PIC_HTMSI_VEC_OFFSET;
> +        if (offset_tmp >= 0 && offset_tmp < 64) {
> +            val = s->htmsi_vector[offset_tmp];
> +        }
> +    } else if (offset >= PCH_PIC_ROUTE_ENTRY_OFFSET) {
> +        offset_tmp = offset - PCH_PIC_ROUTE_ENTRY_OFFSET;
> +        if (offset_tmp >= 0 && offset_tmp < 64) {
> +            val = s->route_entry[offset_tmp];
> +        }
> +    }

Can you convert this into a switch() so it is like the others (plus it makes it 
easier to read):

     switch (offset) {
     case PCH_PIC_HTMSI_VEC_OFFSET ... PCH_PIC_HTMSI_VEC_END:
         ....
         break;
     case PCH_PIC_ROUTE_ENTRY_OFFSET ... PCH_PIC_ROUTE_ENTRY_END:
         ....
         break;
     }

> +    trace_loongarch_pch_pic_readb(size, (uint32_t)addr, val);
> +    return val;
> +}
> +
> +static void loongarch_pch_pic_writeb(void *opaque, hwaddr addr,
> +                                     uint64_t data, unsigned size)
> +{
> +    LoongArchPCHPIC *s = LOONGARCH_PCH_PIC(opaque);
> +    int32_t offset_tmp;
> +    uint32_t offset = (addr & 0xfff) + PCH_PIC_ROUTE_ENTRY_OFFSET;
> +
> +    trace_loongarch_pch_pic_writeb(size, (uint32_t)addr, data);
> +
> +    if (offset >= PCH_PIC_HTMSI_VEC_OFFSET) {
> +        offset_tmp = offset - PCH_PIC_HTMSI_VEC_OFFSET;
> +        if (offset_tmp >= 0 && offset_tmp < 64) {
> +            s->htmsi_vector[offset_tmp] = (uint8_t)(data & 0xff);
> +        }
> +    } else if (offset >=  PCH_PIC_ROUTE_ENTRY_OFFSET) {
> +        offset_tmp = offset - PCH_PIC_ROUTE_ENTRY_OFFSET;
> +        if (offset_tmp >= 0 && offset_tmp < 64) {
> +            s->route_entry[offset_tmp] = (uint8_t)(data & 0xff);
> +        }
> +    }
> +}
> +
> +static const MemoryRegionOps loongarch_pch_pic_reg32_ops = {
> +    .read = loongarch_pch_pic_readw,
> +    .write = loongarch_pch_pic_writew,
> +    .valid = {
> +        .min_access_size = 4,
> +        .max_access_size = 8,
> +    },
> +    .impl = {
> +        .min_access_size = 4,
> +        .max_access_size = 4,
> +    },
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +};
> +
> +static const MemoryRegionOps loongarch_pch_pic_reg8_ops = {
> +    .read = loongarch_pch_pic_readb,
> +    .write = loongarch_pch_pic_writeb,
> +    .valid = {
> +        .min_access_size = 1,
> +        .max_access_size = 1,
> +    },
> +    .impl = {
> +        .min_access_size = 1,
> +        .max_access_size = 1,
> +    },
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +};
> +
> +static void loongarch_pch_pic_reset(DeviceState *d)
> +{
> +    LoongArchPCHPIC *s = LOONGARCH_PCH_PIC(d);
> +    int i;
> +
> +    s->int_mask_lo = -1;
> +    s->int_mask_hi = -1;
> +    s->htmsi_en_lo = 0x0;
> +    s->htmsi_en_hi = 0x0;
> +    s->intedge_lo  = 0x0;
> +    s->intedge_hi  = 0x0;
> +    s->intclr_lo   = 0x0;
> +    s->intclr_hi   = 0x0;
> +    s->auto_crtl0_lo = 0x0;
> +    s->auto_crtl0_hi = 0x0;
> +    s->auto_crtl1_lo = 0x0;
> +    s->auto_crtl1_hi = 0x0;
> +    for (i = 0; i < 64; i++) {
> +        s->route_entry[i] = 0x1;
> +        s->htmsi_vector[i] = 0x0;
> +    }
> +    s->intirr_lo = 0x0;
> +    s->intirr_hi = 0x0;
> +    s->intisr_lo = 0x0;
> +    s->intisr_hi = 0x0;
> +    s->last_intirr_lo = 0x0;
> +    s->last_intirr_hi = 0x0;
> +    s->int_polarity_lo = 0x0;
> +    s->int_polarity_hi = 0x0;
> +}
> +
> +static void loongarch_pch_pic_init(Object *obj)
> +{
> +    LoongArchPCHPIC *s = LOONGARCH_PCH_PIC(obj);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> +    int i;
> +
> +    memory_region_init_io(&s->iomem32, obj, &loongarch_pch_pic_reg32_ops,
> +                          s, TYPE_LOONGARCH_PCH_PIC, 0x1000);
> +    memory_region_init_io(&s->iomem8, obj, &loongarch_pch_pic_reg8_ops,
> +                          s, TYPE_LOONGARCH_PCH_PIC, 0x140);
> +    sysbus_init_mmio(sbd, &s->iomem32);
> +    sysbus_init_mmio(sbd, &s->iomem8);
> +
> +    for (i = 0; i < PCH_PIC_IRQ_NUM; i++) {
> +        sysbus_init_irq(sbd, &s->parent_irq[i]);
> +    }
> +    qdev_init_gpio_in(DEVICE(obj), pch_pic_irq_handler, PCH_PIC_IRQ_NUM);
> +}
> +
> +static const VMStateDescription vmstate_loongarch_pch_pic = {
> +    .name = TYPE_LOONGARCH_PCH_PIC,
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32(int_mask_lo, LoongArchPCHPIC),
> +        VMSTATE_UINT32(int_mask_hi, LoongArchPCHPIC),
> +        VMSTATE_UINT32(htmsi_en_lo, LoongArchPCHPIC),
> +        VMSTATE_UINT32(htmsi_en_hi, LoongArchPCHPIC),
> +        VMSTATE_UINT32(intedge_lo, LoongArchPCHPIC),
> +        VMSTATE_UINT32(intedge_hi, LoongArchPCHPIC),
> +        VMSTATE_UINT32(intclr_lo, LoongArchPCHPIC),
> +        VMSTATE_UINT32(intclr_hi, LoongArchPCHPIC),
> +        VMSTATE_UINT32(auto_crtl0_lo, LoongArchPCHPIC),
> +        VMSTATE_UINT32(auto_crtl0_hi, LoongArchPCHPIC),
> +        VMSTATE_UINT32(auto_crtl1_lo, LoongArchPCHPIC),
> +        VMSTATE_UINT32(auto_crtl1_hi, LoongArchPCHPIC),
> +        VMSTATE_UINT8_ARRAY(route_entry, LoongArchPCHPIC, 64),
> +        VMSTATE_UINT8_ARRAY(htmsi_vector, LoongArchPCHPIC, 64),
> +        VMSTATE_UINT32(last_intirr_lo, LoongArchPCHPIC),
> +        VMSTATE_UINT32(last_intirr_hi, LoongArchPCHPIC),
> +        VMSTATE_UINT32(intirr_lo, LoongArchPCHPIC),
> +        VMSTATE_UINT32(intirr_hi, LoongArchPCHPIC),
> +        VMSTATE_UINT32(intisr_lo, LoongArchPCHPIC),
> +        VMSTATE_UINT32(intisr_hi, LoongArchPCHPIC),
> +        VMSTATE_UINT32(int_polarity_lo, LoongArchPCHPIC),
> +        VMSTATE_UINT32(int_polarity_hi, LoongArchPCHPIC),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void loongarch_pch_pic_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->reset = loongarch_pch_pic_reset;
> +    dc->vmsd = &vmstate_loongarch_pch_pic;
> +}
> +
> +static const TypeInfo loongarch_pch_pic_info = {
> +    .name          = TYPE_LOONGARCH_PCH_PIC,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(LoongArchPCHPIC),
> +    .instance_init = loongarch_pch_pic_init,
> +    .class_init    = loongarch_pch_pic_class_init,
> +};
> +
> +static void loongarch_pch_pic_register_types(void)
> +{
> +    type_register_static(&loongarch_pch_pic_info);
> +}
> +
> +type_init(loongarch_pch_pic_register_types)
> diff --git a/hw/intc/meson.build b/hw/intc/meson.build
> index 14c0834c67..cf08816547 100644
> --- a/hw/intc/meson.build
> +++ b/hw/intc/meson.build
> @@ -61,3 +61,4 @@ specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XIVE'],
>   specific_ss.add(when: 'CONFIG_GOLDFISH_PIC', if_true: files('goldfish_pic.c'))
>   specific_ss.add(when: 'CONFIG_M68K_IRQC', if_true: files('m68k_irqc.c'))
>   specific_ss.add(when: 'CONFIG_LOONGARCH_IPI', if_true: files('loongarch_ipi.c'))
> +specific_ss.add(when: 'CONFIG_LOONGARCH_PCH_PIC', if_true: files('loongarch_pch_pic.c'))
> diff --git a/hw/intc/trace-events b/hw/intc/trace-events
> index 55f2f3a8b6..ec42cfd3d5 100644
> --- a/hw/intc/trace-events
> +++ b/hw/intc/trace-events
> @@ -250,3 +250,10 @@ sh_intc_set(int id, int enable) "setting interrupt group %d to %d"
>   # loongarch_ipi.c
>   loongarch_ipi_read(unsigned size, uint64_t addr, unsigned long val) "size: %u addr: 0x%"PRIx64 "val: 0x%"PRIx64
>   loongarch_ipi_write(unsigned size, uint64_t addr, unsigned long val) "size: %u addr: 0x%"PRIx64 "val: 0x%"PRIx64
> +
> +# loongarch_pch_pic.c
> +pch_pic_irq_handler(int irq, int level) "irq %d level %d"
> +loongarch_pch_pic_readw(unsigned size, uint32_t addr, unsigned long val) "size: %u addr: 0x%"PRIx32 "val: 0x%" PRIx64
> +loongarch_pch_pic_writew(unsigned size, uint32_t addr, unsigned long val) "size: %u addr: 0x%"PRIx32 "val: 0x%" PRIx64
> +loongarch_pch_pic_readb(unsigned size, uint32_t addr, unsigned long val) "size: %u addr: 0x%"PRIx32 "val: 0x%" PRIx64
> +loongarch_pch_pic_writeb(unsigned size, uint32_t addr, unsigned long val) "size: %u addr: 0x%"PRIx32 "val: 0x%" PRIx64
> diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
> index 1591574397..c2b8046b94 100644
> --- a/hw/loongarch/Kconfig
> +++ b/hw/loongarch/Kconfig
> @@ -2,3 +2,4 @@ config LOONGSON3_LS7A
>       bool
>       select PCI_EXPRESS_7A
>       select LOONGARCH_IPI
> +    select LOONGARCH_PCH_PIC
> diff --git a/include/hw/intc/loongarch_pch_pic.h b/include/hw/intc/loongarch_pch_pic.h
> new file mode 100644
> index 0000000000..3c2a5ed3eb
> --- /dev/null
> +++ b/include/hw/intc/loongarch_pch_pic.h
> @@ -0,0 +1,74 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * LoongArch 7A1000 I/O interrupt controller definitions
> + *
> + * Copyright (c) 2021 Loongson Technology Corporation Limited
> + */
> +
> +#define TYPE_LOONGARCH_PCH_PIC "loongarch_pch_pic"
> +DECLARE_INSTANCE_CHECKER(struct LoongArchPCHPIC, LOONGARCH_PCH_PIC,
> +                         TYPE_LOONGARCH_PCH_PIC)
> +
> +#define PCH_PIC_IRQ_START               0
> +#define PCH_PIC_IRQ_END                 63
> +#define PCH_PIC_IRQ_NUM                 64
> +#define PCH_PIC_INT_ID_VAL              0x7000000UL
> +#define PCH_PIC_INT_ID_NUM              0x3f0001UL
> +
> +#define PCH_PIC_INT_ID_LO               0x00
> +#define PCH_PIC_INT_ID_HI               0x04
> +#define PCH_PIC_INT_MASK_LO             0x20
> +#define PCH_PIC_INT_MASK_HI             0x24
> +#define PCH_PIC_HTMSI_EN_LO             0x40
> +#define PCH_PIC_HTMSI_EN_HI             0x44
> +#define PCH_PIC_INT_EDGE_LO             0x60
> +#define PCH_PIC_INT_EDGE_HI             0x64
> +#define PCH_PIC_INT_CLEAR_LO            0x80
> +#define PCH_PIC_INT_CLEAR_HI            0x84
> +#define PCH_PIC_AUTO_CTRL0_LO           0xc0
> +#define PCH_PIC_AUTO_CTRL0_HI           0xc4
> +#define PCH_PIC_AUTO_CTRL1_LO           0xe0
> +#define PCH_PIC_AUTO_CTRL1_HI           0xe4
> +#define PCH_PIC_ROUTE_ENTRY_OFFSET      0x100
> +#define PCH_PIC_ROUTE_ENTRY_END         0x13f
> +#define PCH_PIC_HTMSI_VEC_OFFSET        0x200
> +#define PCH_PIC_HTMSI_VEC_END           0x23f
> +#define PCH_PIC_INT_STATUS_LO           0x3a0
> +#define PCH_PIC_INT_STATUS_HI           0x3a4
> +#define PCH_PIC_INT_POL_LO              0x3e0
> +#define PCH_PIC_INT_POL_HI              0x3e4
> +
> +typedef struct LoongArchPCHPIC {
> +    SysBusDevice parent_obj;
> +    qemu_irq parent_irq[64];
> +    uint32_t int_mask_lo; /*0x020 interrupt mask register*/
> +    uint32_t int_mask_hi;
> +    uint32_t htmsi_en_lo; /*0x040 1=msi*/
> +    uint32_t htmsi_en_hi;
> +    uint32_t intedge_lo; /*0x060 edge=1 level  =0*/
> +    uint32_t intedge_hi; /*0x060 edge=1 level  =0*/
> +    uint32_t intclr_lo; /*0x080 for clean edge int,set 1 clean,set 0 is noused*/
> +    uint32_t intclr_hi; /*0x080 for clean edge int,set 1 clean,set 0 is noused*/
> +    uint32_t auto_crtl0_lo; /*0x0c0*/
> +    uint32_t auto_crtl0_hi; /*0x0c0*/
> +    uint32_t auto_crtl1_lo; /*0x0e0*/
> +    uint32_t auto_crtl1_hi; /*0x0e0*/
> +    uint32_t last_intirr_lo;    /* edge detection */
> +    uint32_t last_intirr_hi;    /* edge detection */
> +    uint32_t intirr_lo; /* 0x380 interrupt request register */
> +    uint32_t intirr_hi; /* 0x380 interrupt request register */
> +    uint32_t intisr_lo; /* 0x3a0 interrupt service register */
> +    uint32_t intisr_hi; /* 0x3a0 interrupt service register */
> +    /*
> +     * 0x3e0 interrupt level polarity selection
> +     * register 0 for high level trigger
> +     */
> +    uint32_t int_polarity_lo;
> +    uint32_t int_polarity_hi;
> +
> +    uint8_t route_entry[64]; /*0x100 - 0x138*/
> +    uint8_t htmsi_vector[64]; /*0x200 - 0x238*/
> +
> +    MemoryRegion iomem32;
> +    MemoryRegion iomem8;
> +} LoongArchPCHPIC;


