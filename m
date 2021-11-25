Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6FD45D62F
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 09:29:21 +0100 (CET)
Received: from localhost ([::1]:54316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqA89-0007va-3G
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 03:29:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mq9zr-0005rg-RA
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 03:20:47 -0500
Received: from mail.loongson.cn ([114.242.206.163]:48472 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mq9zm-0004AL-AK
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 03:20:47 -0500
Received: from localhost.localdomain (unknown [10.20.42.11])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx79NPR59h20sBAA--.5754S3;
 Thu, 25 Nov 2021 16:20:32 +0800 (CST)
Subject: Re: [RFC PATCH v2 21/30] hw/intc: Add LoongArch extioi interrupt
 controller(EIOINTC)
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
 <1636594528-8175-22-git-send-email-yangxiaojuan@loongson.cn>
 <afeb4ef4-0ed4-bd12-0d45-7cc4782cdaf0@ilande.co.uk>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <fac6802c-1a85-fd35-c54f-92b7dabe9e2e@loongson.cn>
Date: Thu, 25 Nov 2021 16:20:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <afeb4ef4-0ed4-bd12-0d45-7cc4782cdaf0@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dx79NPR59h20sBAA--.5754S3
X-Coremail-Antispam: 1UD129KBjvAXoW3CFWruw4Dtr45Zry7CFW3Jrb_yoW8Cr1Uuo
 Z8tr4Yqr4ayry7Cr40vr9rt34UGw1qvrW7AayrJw43Ca1aya15ua9xtw45Cr4kJFs0ga4U
 JFZxurWDua4Fqa1rn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjp_UUUYl7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xva
 j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
 x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWx
 JVW8Jr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
 xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 64x0Y40En7xvr7AKxVWUJVW8JwAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI
 0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8v
 x2IErcIFxwCYjI0SjxkI62AI1cAE67vIY487MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrw
 CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
 14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
 IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxK
 x2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
 AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfU173vUUUUU
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.1,
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
Cc: Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Mark,

On 11/11/2021 10:49 PM, Mark Cave-Ayland wrote:
> On 11/11/2021 01:35, Xiaojuan Yang wrote:
> 
>> This patch realize the EIOINTC interrupt controller.
>>
>> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>> ---
>>   hw/intc/Kconfig                    |   3 +
>>   hw/intc/loongarch_extioi.c         | 570 +++++++++++++++++++++++++++++
>>   hw/intc/meson.build                |   1 +
>>   hw/loongarch/Kconfig               |   1 +
>>   include/hw/intc/loongarch_extioi.h |  99 +++++
>>   include/hw/loongarch/loongarch.h   |   1 +
>>   6 files changed, 675 insertions(+)
>>   create mode 100644 hw/intc/loongarch_extioi.c
>>   create mode 100644 include/hw/intc/loongarch_extioi.h
>>
>> diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
>> index c0dc12dfa0..a2d9efd5aa 100644
>> --- a/hw/intc/Kconfig
>> +++ b/hw/intc/Kconfig
>> @@ -82,3 +82,6 @@ config LOONGARCH_PCH_MSI
>>       select MSI_NONBROKEN
>>       bool
>>       select UNIMP
>> +
>> +config LOONGARCH_EXTIOI
>> +    bool
>> diff --git a/hw/intc/loongarch_extioi.c b/hw/intc/loongarch_extioi.c
>> new file mode 100644
>> index 0000000000..592cd8d1e2
>> --- /dev/null
>> +++ b/hw/intc/loongarch_extioi.c
>> @@ -0,0 +1,570 @@
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
>> +
>> +#define DEBUG_APIC 0
>> +
>> +#define DPRINTF(fmt, ...) \
>> +do { \
>> +    if (DEBUG_APIC) { \
>> +        fprintf(stderr, "APIC: " fmt , ## __VA_ARGS__); \
>> +    } \
>> +} while (0)
> 
> Again please use trace-events insead of DPRINTF().
> 
>> +static void extioi_update_irq(void *opaque, int irq_num, int level)
>> +{
>> +    loongarch_extioi *s = opaque;
>> +    uint8_t  ipnum, cpu;
>> +    unsigned long found1, found2;
>> +
>> +    ipnum = s->sw_ipmap[irq_num];
>> +    cpu   = s->sw_coremap[irq_num];
>> +    if (level == 1) {
>> +        if (test_bit(irq_num, (void *)s->en_reg8) == false) {
>> +            return;
>> +        }
>> +        bitmap_set((void *)s->coreisr_reg8[cpu], irq_num, 1);
>> +        found1 = find_next_bit((void *)&(s->sw_ipisr[cpu][ipnum]),
>> +                               EXTIOI_IRQS, 0);
>> +        bitmap_set((void *)&(s->sw_ipisr[cpu][ipnum]), irq_num, 1);
>> +
>> +        if (found1 >= EXTIOI_IRQS) {
>> +            qemu_set_irq(s->parent_irq[cpu][ipnum], level);
>> +        }
>> +    } else {
>> +        bitmap_clear((void *)s->coreisr_reg8[cpu], irq_num, 1);
>> +        found1 = find_next_bit((void *)&(s->sw_ipisr[cpu][ipnum]),
>> +                               EXTIOI_IRQS, 0);
>> +        bitmap_clear((void *)&(s->sw_ipisr[cpu][ipnum]), irq_num, 1);
>> +        found2 = find_next_bit((void *)&(s->sw_ipisr[cpu][ipnum]),
>> +                               EXTIOI_IRQS, 0);
>> +
>> +        if ((found1 < EXTIOI_IRQS) && (found2 >= EXTIOI_IRQS)) {
>> +            qemu_set_irq(s->parent_irq[cpu][ipnum], level);
>> +        }
>> +    }
>> +}
>> +
>> +static void extioi_setirq(void *opaque, int irq, int level)
>> +{
>> +    loongarch_extioi *s = opaque;
>> +    extioi_update_irq(s, irq, level);
>> +}
>> +
>> +static void extioi_handler(void *opaque, int irq, int level)
>> +{
>> +    loongarch_extioi *extioi = (loongarch_extioi *)opaque;
>> +
>> +    qemu_set_irq(extioi->irq[irq], level);
>> +}
>> +
>> +static uint32_t extioi_readb(void *opaque, hwaddr addr)
>> +{
>> +    loongarch_extioi *state = opaque;
> 
> Add a QOM cast here.
> 
>> +    unsigned long offset, reg_count;
>> +    uint8_t ret;
>> +    int cpu;
>> +
>> +    offset = addr & 0xffff;
>> +
>> +    if ((offset >= EXTIOI_ENABLE_START) && (offset < EXTIOI_ENABLE_END)) {
>> +        reg_count = (offset - EXTIOI_ENABLE_START);
>> +        ret = state->en_reg8[reg_count];
>> +    } else if ((offset >= EXTIOI_BOUNCE_START) &&
>> +               (offset < EXTIOI_BOUNCE_END)) {
>> +        reg_count = (offset - EXTIOI_BOUNCE_START);
>> +        ret = state->bounce_reg8[reg_count];
>> +    } else if ((offset >= EXTIOI_COREISR_START) &&
>> +               (offset < EXTIOI_COREISR_END)) {
>> +        reg_count = ((offset - EXTIOI_COREISR_START) & 0x1f);
>> +        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
>> +        ret = state->coreisr_reg8[cpu][reg_count];
>> +    } else if ((offset >= EXTIOI_IPMAP_START) &&
>> +               (offset < EXTIOI_IPMAP_END)) {
>> +        reg_count = (offset - EXTIOI_IPMAP_START);
>> +        ret = state->ipmap_reg8[reg_count];
>> +    } else if ((offset >= EXTIOI_COREMAP_START) &&
>> +               (offset < EXTIOI_COREMAP_END)) {
>> +        reg_count = (offset - EXTIOI_COREMAP_START);
>> +        ret = state->coremap_reg8[reg_count];
>> +    } else if ((offset >= EXTIOI_NODETYPE_START) &&
>> +               (offset < EXTIOI_NODETYPE_END)) {
>> +        reg_count = (offset - EXTIOI_NODETYPE_START);
>> +        ret = state->nodetype_reg8[reg_count];
>> +    }
>> +
>> +    DPRINTF("readb reg 0x" TARGET_FMT_plx " = %x\n", addr, ret);
>> +    return ret;
>> +}
>> +
>> +static uint32_t extioi_readw(void *opaque, hwaddr addr)
>> +{
>> +    loongarch_extioi *state = opaque;
> 
> And also a QOM cast here.
> 
>> +    unsigned long offset, reg_count;
>> +    uint32_t ret;
>> +    int cpu;
>> +
>> +    offset = addr & 0xffff;
>> +
>> +    if ((offset >= EXTIOI_ENABLE_START) && (offset < EXTIOI_ENABLE_END)) {
>> +        reg_count = (offset - EXTIOI_ENABLE_START) / 4;
>> +        ret = state->en_reg32[reg_count];
>> +    } else if ((offset >= EXTIOI_BOUNCE_START) &&
>> +               (offset < EXTIOI_BOUNCE_END)) {
>> +        reg_count = (offset - EXTIOI_BOUNCE_START) / 4;
>> +        ret = state->bounce_reg32[reg_count];
>> +    } else if ((offset >= EXTIOI_COREISR_START) &&
>> +               (offset < EXTIOI_COREISR_END)) {
>> +        reg_count = ((offset - EXTIOI_COREISR_START) & 0x1f) / 4;
>> +        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
>> +        ret = state->coreisr_reg32[cpu][reg_count];
>> +    } else if ((offset >= EXTIOI_IPMAP_START) &&
>> +               (offset < EXTIOI_IPMAP_END)) {
>> +        reg_count = (offset - EXTIOI_IPMAP_START) / 4;
>> +        ret = state->ipmap_reg32[reg_count];
>> +    } else if ((offset >= EXTIOI_COREMAP_START) &&
>> +               (offset < EXTIOI_COREMAP_END)) {
>> +        reg_count = (offset - EXTIOI_COREMAP_START) / 4;
>> +        ret = state->coremap_reg32[reg_count];
>> +    } else if ((offset >= EXTIOI_NODETYPE_START) &&
>> +               (offset < EXTIOI_NODETYPE_END)) {
>> +        reg_count = (offset - EXTIOI_NODETYPE_START) / 4;
>> +        ret = state->nodetype_reg32[reg_count];
>> +    }
>> +
>> +    DPRINTF("readw reg 0x" TARGET_FMT_plx " = %x\n", addr, ret);
>> +    return ret;
>> +}
>> +
>> +static uint64_t extioi_readl(void *opaque, hwaddr addr)
>> +{
>> +    loongarch_extioi *state = opaque;
> 
> A QOM cast here too.
> 
>> +    unsigned long offset, reg_count;
>> +    uint64_t ret;
>> +    int cpu;
>> +
>> +    offset = addr & 0xffff;
>> +
>> +    if ((offset >= EXTIOI_ENABLE_START) && (offset < EXTIOI_ENABLE_END)) {
>> +        reg_count = (offset - EXTIOI_ENABLE_START) / 8;
>> +        ret = state->en_reg64[reg_count];
>> +    } else if ((offset >= EXTIOI_BOUNCE_START) &&
>> +               (offset < EXTIOI_BOUNCE_END)) {
>> +        reg_count = (offset - EXTIOI_BOUNCE_START) / 8;
>> +        ret = state->bounce_reg64[reg_count];
>> +    } else if ((offset >= EXTIOI_COREISR_START) &&
>> +               (offset < EXTIOI_COREISR_END)) {
>> +        reg_count = ((offset - EXTIOI_COREISR_START) & 0x1f) / 8;
>> +        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
>> +        ret = state->coreisr_reg64[cpu][reg_count];
>> +    } else if ((offset >= EXTIOI_IPMAP_START) &&
>> +               (offset < EXTIOI_IPMAP_END)) {
>> +        ret = state->ipmap_reg64;
>> +    } else if ((offset >= EXTIOI_COREMAP_START) &&
>> +               (offset < EXTIOI_COREMAP_END)) {
>> +        reg_count = (offset - EXTIOI_COREMAP_START) / 8;
>> +        ret = state->coremap_reg64[reg_count];
>> +    } else if ((offset >= EXTIOI_NODETYPE_START) &&
>> +               (offset < EXTIOI_NODETYPE_END)) {
>> +        reg_count = (offset - EXTIOI_NODETYPE_START) / 8;
>> +        ret = state->nodetype_reg64[reg_count];
>> +    }
>> +
>> +    DPRINTF("readl reg 0x" TARGET_FMT_plx " = %lx\n", addr, ret);
>> +    return ret;
>> +}
>> +
>> +static void extioi_writeb(void *opaque, hwaddr addr, uint32_t val)
>> +{
>> +    loongarch_extioi *state = opaque;
> 
> And another cast.
> 
>> +    unsigned long offset, reg_count;
>> +    uint8_t old_data_u8;
>> +    int cpu, i, ipnum, level, mask, irqnum;
>> +
>> +    offset = addr & 0xffff;
>> +    val = val & 0xffUL;
>> +
>> +    if ((offset >= EXTIOI_ENABLE_START) && (offset < EXTIOI_ENABLE_END)) {
>> +        reg_count = (offset - EXTIOI_ENABLE_START);
>> +        old_data_u8 = state->en_reg8[reg_count];
>> +        if (old_data_u8 != val) {
>> +            state->en_reg8[reg_count] = val;
>> +            old_data_u8 = old_data_u8 ^ val;
>> +            mask = 0x1;
>> +
>> +            for (i = 0; i < 8; i++) {
>> +                if (old_data_u8 & mask) {
>> +                    level = !!(val & (0x1 << i));
>> +                    extioi_update_irq(state, i + reg_count * 8, level);
>> +                }
>> +                mask = mask << 1;
>> +            }
>> +        }
>> +    } else if ((offset >= EXTIOI_BOUNCE_START) &&
>> +               (offset < EXTIOI_BOUNCE_END)) {
>> +        reg_count = (offset - EXTIOI_BOUNCE_START);
>> +        state->bounce_reg8[reg_count] = val;
>> +    } else if ((offset >= EXTIOI_ISR_START) && (offset < EXTIOI_ISR_END)) {
>> +        /* Can not be writen */
>> +        reg_count = (offset - EXTIOI_ISR_START) & 0x1f;
>> +        old_data_u8 = state->isr_reg8[reg_count];
>> +        state->isr_reg8[reg_count] = old_data_u8 & (~val);
>> +
>> +        mask = 0x1;
>> +        for (i = 0; i < 8; i++) {
>> +            if ((old_data_u8 & mask) && (val & mask)) {
>> +                extioi_update_irq(state, i + reg_count * 8, 0);
>> +            }
>> +            mask = mask << 1;
>> +        }
>> +    } else if ((offset >= EXTIOI_COREISR_START) &&
>> +               (offset < EXTIOI_COREISR_END)) {
>> +        reg_count = (offset - EXTIOI_COREISR_START) & 0x1f;
>> +        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
>> +
>> +        /* ext_isr */
>> +        old_data_u8 = state->isr_reg8[reg_count];
>> +        state->isr_reg8[reg_count] = old_data_u8 & (~val);
>> +
>> +        old_data_u8 = state->coreisr_reg8[cpu][reg_count];
>> +        state->coreisr_reg8[cpu][reg_count] = old_data_u8 & (~val);
>> +
>> +        if (old_data_u8 != state->coreisr_reg8[cpu][reg_count]) {
>> +            mask = 0x1;
>> +            for (i = 0; i < 8; i++) {
>> +                if ((old_data_u8 & mask) && (val & mask)) {
>> +                    extioi_update_irq(state, i + reg_count * 8, 0);
>> +                }
>> +                mask = mask << 1;
>> +            }
>> +        }
>> +    } else if ((offset >= EXTIOI_IPMAP_START) && (offset < EXTIOI_IPMAP_END)) {
>> +        /* Drop arch.core_ip_mask use state->ipmap */
>> +        reg_count = (offset - EXTIOI_IPMAP_START);
>> +        state->ipmap_reg8[reg_count] = val;
>> +
>> +        ipnum = 0;
>> +        for (i = 0; i < 4; i++) {
>> +            if (val & (0x1 << i)) {
>> +                ipnum = i;
>> +                break;
>> +            }
>> +        }
>> +
>> +        if (val) {
>> +            for (i = 0; i < 32; i++) {
>> +                irqnum = reg_count * 32 + i;
>> +                state->sw_ipmap[irqnum] = ipnum;
>> +            }
>> +        } else {
>> +            for (i = 0; i < 32; i++) {
>> +                irqnum = reg_count * 32 + i;
>> +                state->sw_ipmap[irqnum] = 0;
>> +            }
>> +        }
>> +    } else if ((offset >= EXTIOI_COREMAP_START) &&
>> +               (offset < EXTIOI_COREMAP_END)) {
>> +        reg_count = (offset - EXTIOI_COREMAP_START);
>> +        cpu = val & 0xf;
>> +
>> +        /* Node map different from kernel */
>> +        if (cpu) {
>> +            cpu = ctz32(cpu);
>> +            state->coremap_reg8[reg_count] = val;
>> +            state->sw_coremap[reg_count] = cpu;
>> +        }
>> +    } else if ((offset >= EXTIOI_NODETYPE_START) &&
>> +               (offset < EXTIOI_NODETYPE_END)) {
>> +        reg_count = (offset - EXTIOI_NODETYPE_START);
>> +        state->nodetype_reg8[reg_count] = val;
>> +    }
>> +
>> +    DPRINTF("writeb reg 0x" TARGET_FMT_plx " = %x\n", addr, val);
>> +}
>> +
>> +static void extioi_writew(void *opaque, hwaddr addr, uint32_t val)
>> +{
>> +    loongarch_extioi *state = opaque;
> 
> And a QOM cast here.
> 
>> +    int cpu, level;
>> +    uint32_t offset, old_data_u32, reg_count, mask, i;
>> +
>> +    offset = addr & 0xffff;
>> +
>> +    if ((offset >= EXTIOI_ENABLE_START) && (offset < EXTIOI_ENABLE_END)) {
>> +        reg_count = (offset - EXTIOI_ENABLE_START) / 4;
>> +        old_data_u32 = state->en_reg32[reg_count];
>> +        if (old_data_u32 != val) {
>> +            state->en_reg32[reg_count] = val;
>> +            old_data_u32 = old_data_u32 ^ val;
>> +
>> +            mask = 0x1;
>> +            for (i = 0; i < 8 * sizeof(old_data_u32); i++) {
>> +                if (old_data_u32 & mask) {
>> +                    level = !!(val & (0x1 << i));
>> +                    extioi_update_irq(state, i + reg_count * 32, level);
>> +                }
>> +                mask = mask << 1;
>> +            }
>> +        }
>> +    } else if ((offset >= EXTIOI_BOUNCE_START) &&
>> +               (offset < EXTIOI_BOUNCE_END)) {
>> +        reg_count = (offset - EXTIOI_BOUNCE_START) / 4;
>> +        state->bounce_reg32[reg_count] = val;
>> +    } else if ((offset >= EXTIOI_COREISR_START) &&
>> +               (offset < EXTIOI_COREISR_END)) {
>> +        reg_count = ((offset - EXTIOI_COREISR_START) & 0x1f) / 4;
>> +        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
>> +
>> +        /* Ext_isr */
>> +        old_data_u32 = state->isr_reg32[reg_count];
>> +        state->isr_reg32[reg_count] = old_data_u32 & (~val);
>> +
>> +        /* Ext_core_ioisr */
>> +        old_data_u32 = state->coreisr_reg32[cpu][reg_count];
>> +        state->coreisr_reg32[cpu][reg_count] = old_data_u32 & (~val);
>> +
>> +        if (old_data_u32 != state->coreisr_reg32[cpu][reg_count]) {
>> +            mask = 0x1;
>> +            for (i = 0; i < 8 * sizeof(old_data_u32); i++) {
>> +                if ((old_data_u32 & mask) && (val & mask)) {
>> +                    extioi_update_irq(state, i + reg_count * 8, 0);
>> +                }
>> +                mask = mask << 1;
>> +            }
>> +        }
>> +    } else if ((offset >= EXTIOI_IPMAP_START) &&
>> +               (offset < EXTIOI_IPMAP_END)) {
>> +        extioi_writeb(opaque, addr, (val) & 0xff);
>> +        extioi_writeb(opaque, addr + 1, (val >> 8) & 0xff);
>> +        extioi_writeb(opaque, addr + 2, (val >> 16) & 0xff);
>> +        extioi_writeb(opaque, addr + 3, (val >> 24) & 0xff);
>> +    } else if ((offset >= EXTIOI_COREMAP_START) &&
>> +               (offset < EXTIOI_COREMAP_END)) {
>> +        extioi_writeb(opaque, addr, (val) & 0xff);
>> +        extioi_writeb(opaque, addr + 1, (val >> 8) & 0xff);
>> +        extioi_writeb(opaque, addr + 2, (val >> 16) & 0xff);
>> +        extioi_writeb(opaque, addr + 3, (val >> 24) & 0xff);
>> +    } else if ((offset >= EXTIOI_NODETYPE_START) &&
>> +               (offset < EXTIOI_NODETYPE_END)) {
>> +        reg_count = (offset - EXTIOI_NODETYPE_START) / 4;
>> +        state->nodetype_reg32[reg_count] = val;
>> +    }
>> +
>> +    DPRINTF("writew reg 0x" TARGET_FMT_plx " = %x\n", addr, val);
>> +}
>> +
>> +static void extioi_writel(void *opaque, hwaddr addr, uint64_t val)
>> +{
>> +    loongarch_extioi *state = (loongarch_extioi *)opaque;
> 
> And a QOM cast here.
> 
>> +    int cpu, level;
>> +    uint64_t offset, old_data_u64, reg_count, mask, i;
>> +
>> +    offset = addr & 0xffff;
>> +
>> +    if ((offset >= EXTIOI_ENABLE_START) && (offset < EXTIOI_ENABLE_END)) {
>> +        reg_count = (offset - EXTIOI_ENABLE_START) / 8;
>> +        old_data_u64 = state->en_reg64[reg_count];
>> +        if (old_data_u64 != val) {
>> +            state->en_reg64[reg_count] = val;
>> +            old_data_u64 = old_data_u64 ^ val;
>> +            mask = 0x1;
>> +            for (i = 0; i < 8 * sizeof(old_data_u64); i++) {
>> +                if (old_data_u64 & mask) {
>> +                    level = !!(val & (0x1 << i));
>> +                    extioi_update_irq(state, i + reg_count * 64, level);
>> +                }
>> +                mask = mask << 1;
>> +            }
>> +        }
>> +    } else if ((offset >= EXTIOI_BOUNCE_START) &&
>> +               (offset < EXTIOI_BOUNCE_END)) {
>> +        reg_count = (offset - EXTIOI_BOUNCE_START) / 8;
>> +        state->bounce_reg64[reg_count] = val;
>> +    } else if ((offset >= EXTIOI_COREISR_START) &&
>> +               (offset < EXTIOI_COREISR_END)) {
>> +        reg_count = ((offset - EXTIOI_COREISR_START) & 0x1f) / 8;
>> +        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
>> +
>> +        /* core_ext_ioisr */
>> +        old_data_u64 = state->coreisr_reg64[cpu][reg_count];
>> +        state->coreisr_reg64[cpu][reg_count] = old_data_u64 & (~val);
>> +
>> +        if (old_data_u64 != state->coreisr_reg64[cpu][reg_count]) {
>> +            mask = 0x1;
>> +            for (i = 0; i < 8 * sizeof(old_data_u64); i++) {
>> +                if ((old_data_u64 & mask) && (val & mask)) {
>> +                    extioi_update_irq(state, i + reg_count * 64, 0);
>> +                }
>> +                mask = mask << 1;
>> +            }
>> +        }
>> +    } else if ((offset >= EXTIOI_IPMAP_START) &&
>> +               (offset < EXTIOI_IPMAP_END)) {
>> +        extioi_writeb(opaque, addr, (val) & 0xff);
>> +        extioi_writeb(opaque, addr + 1, (val >> 8) & 0xff);
>> +        extioi_writeb(opaque, addr + 2, (val >> 16) & 0xff);
>> +        extioi_writeb(opaque, addr + 3, (val >> 24) & 0xff);
>> +        extioi_writeb(opaque, addr + 4, (val >> 32) & 0xff);
>> +        extioi_writeb(opaque, addr + 5, (val >> 40) & 0xff);
>> +        extioi_writeb(opaque, addr + 6, (val >> 48) & 0xff);
>> +        extioi_writeb(opaque, addr + 7, (val >> 56) & 0xff);
>> +    } else if ((offset >= EXTIOI_COREMAP_START) &&
>> +               (offset < EXTIOI_COREMAP_END)) {
>> +        extioi_writeb(opaque, addr, (val) & 0xff);
>> +        extioi_writeb(opaque, addr + 1, (val >> 8) & 0xff);
>> +        extioi_writeb(opaque, addr + 2, (val >> 16) & 0xff);
>> +        extioi_writeb(opaque, addr + 3, (val >> 24) & 0xff);
>> +        extioi_writeb(opaque, addr + 4, (val >> 32) & 0xff);
>> +        extioi_writeb(opaque, addr + 5, (val >> 40) & 0xff);
>> +        extioi_writeb(opaque, addr + 6, (val >> 48) & 0xff);
>> +        extioi_writeb(opaque, addr + 7, (val >> 56) & 0xff);
>> +    } else if ((offset >= EXTIOI_NODETYPE_START) &&
>> +               (offset < EXTIOI_NODETYPE_END)) {
>> +        reg_count = (offset - EXTIOI_NODETYPE_START) / 8;
>> +        state->nodetype_reg64[reg_count] = val;
>> +    }
>> +
>> +    DPRINTF("writel reg 0x" TARGET_FMT_plx " = %lx\n", addr, val);
>> +}
>> +
>> +static uint64_t extioi_readfn(void *opaque, hwaddr addr, unsigned size)
>> +{
>> +    switch (size) {
>> +    case 1:
>> +        return extioi_readb(opaque, addr);
>> +    case 4:
>> +        return extioi_readw(opaque, addr);
>> +    case 8:
>> +        return extioi_readl(opaque, addr);
>> +    default:
>> +        g_assert_not_reached();
>> +    }
>> +}
>> +
>> +static void extioi_writefn(void *opaque, hwaddr addr,
>> +                           uint64_t value, unsigned size)
>> +{
>> +    switch (size) {
>> +    case 1:
>> +        extioi_writeb(opaque, addr, value);
>> +        break;
>> +    case 4:
>> +        extioi_writew(opaque, addr, value);
>> +        break;
>> +    case 8:
>> +        extioi_writel(opaque, addr, value);
>> +        break;
>> +    default:
>> +        g_assert_not_reached();
>> +    }
>> +}
> 
> Ooof. This pattern of using separate functions for different size accesses generally hasn't been needed since the memory API was introduced about 10 years ago. I suspect using a single function each for read and write would help simplify things enormously.
> 

 Thank you for your advice, Most of them have been modified. But for different size access I haven't thought of a good way yet. 
 Can we just define the readb/writeb and use Multiple readb/writeb or use if (size == 1/4/8) to handle separately in a big read/write func?

Thanks,
Xiaojuan


