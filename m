Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C6C4AA90C
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 14:12:21 +0100 (CET)
Received: from localhost ([::1]:39018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGKrT-0008QB-9B
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 08:12:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nGKoS-0007i9-OP
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 08:09:12 -0500
Received: from [2001:41c9:1:41f::167] (port=48734
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nGKoP-0001bm-Ci
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 08:09:12 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nGKnp-0009bS-MA; Sat, 05 Feb 2022 13:08:37 +0000
Message-ID: <b3216ec4-5571-5cf9-c8c9-20bbe1248e28@ilande.co.uk>
Date: Sat, 5 Feb 2022 13:08:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220128034412.1262452-1-yangxiaojuan@loongson.cn>
 <20220128034412.1262452-21-yangxiaojuan@loongson.cn>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220128034412.1262452-21-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC PATCH v5 20/30] hw/intc: Add LoongArch extioi interrupt
 controller(EIOINTC)
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
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 28/01/2022 03:44, Xiaojuan Yang wrote:

> This patch realize the EIOINTC interrupt controller.
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   hw/intc/Kconfig                    |   3 +
>   hw/intc/loongarch_extioi.c         | 409 +++++++++++++++++++++++++++++
>   hw/intc/meson.build                |   1 +
>   hw/intc/trace-events               |  11 +
>   hw/loongarch/Kconfig               |   1 +
>   include/hw/intc/loongarch_extioi.h |  77 ++++++
>   6 files changed, 502 insertions(+)
>   create mode 100644 hw/intc/loongarch_extioi.c
>   create mode 100644 include/hw/intc/loongarch_extioi.h
> 
> diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
> index 727a3bb3e6..ecdf821205 100644
> --- a/hw/intc/Kconfig
> +++ b/hw/intc/Kconfig
> @@ -90,3 +90,6 @@ config LOONGARCH_PCH_MSI
>       select MSI_NONBROKEN
>       bool
>       select UNIMP
> +
> +config LOONGARCH_EXTIOI
> +    bool
> diff --git a/hw/intc/loongarch_extioi.c b/hw/intc/loongarch_extioi.c
> new file mode 100644
> index 0000000000..63b9958b18
> --- /dev/null
> +++ b/hw/intc/loongarch_extioi.c
> @@ -0,0 +1,409 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Loongson 3A5000 ext interrupt controller emulation
> + *
> + * Copyright (C) 2021 Loongson Technology Corporation Limited
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/module.h"
> +#include "qemu/log.h"
> +#include "hw/irq.h"
> +#include "hw/sysbus.h"
> +#include "hw/loongarch/loongarch.h"
> +#include "hw/qdev-properties.h"
> +#include "exec/address-spaces.h"
> +#include "hw/intc/loongarch_extioi.h"
> +#include "migration/vmstate.h"
> +#include "trace.h"
> +
> +static void extioi_update_irq(void *opaque, int irq_num, int level)
> +{
> +    LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
> +    uint8_t  ipnum, cpu;
> +    unsigned long found1, found2;
> +
> +    ipnum = s->sw_ipmap[irq_num];
> +    cpu   = s->sw_coremap[irq_num];
> +    if (level == 1) {
> +        if (test_bit(irq_num, (void *)s->enable) == false) {
> +            return;
> +        }
> +        bitmap_set((void *)s->coreisr[cpu], irq_num, 1);
> +        found1 = find_next_bit((void *)&(s->sw_ipisr[cpu][ipnum]),
> +                               EXTIOI_IRQS, 0);
> +        bitmap_set((void *)&(s->sw_ipisr[cpu][ipnum]), irq_num, 1);
> +
> +        if (found1 >= EXTIOI_IRQS) {
> +            qemu_set_irq(s->parent_irq[cpu][ipnum], level);
> +        }
> +    } else {
> +        bitmap_clear((void *)s->coreisr[cpu], irq_num, 1);
> +        found1 = find_next_bit((void *)&(s->sw_ipisr[cpu][ipnum]),
> +                               EXTIOI_IRQS, 0);
> +        bitmap_clear((void *)&(s->sw_ipisr[cpu][ipnum]), irq_num, 1);
> +        found2 = find_next_bit((void *)&(s->sw_ipisr[cpu][ipnum]),
> +                               EXTIOI_IRQS, 0);
> +
> +        if ((found1 < EXTIOI_IRQS) && (found2 >= EXTIOI_IRQS)) {
> +            qemu_set_irq(s->parent_irq[cpu][ipnum], level);
> +        }
> +    }
> +}
> +
> +static void extioi_setirq(void *opaque, int irq, int level)
> +{
> +    LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
> +    trace_extioi_setirq(irq, level);
> +    extioi_update_irq(s, irq, level);
> +}
> +
> +static uint64_t extioi_nodetype_readw(void *opaque, hwaddr addr, unsigned size)
> +{
> +    LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
> +    unsigned long offset = addr & 0xffff;
> +    uint32_t ret, index;
> +
> +    switch (offset) {
> +    case EXTIOI_NODETYPE_START ... EXTIOI_NODETYPE_END - 1:
> +        index = (offset - EXTIOI_NODETYPE_START) >> 2;
> +        ret = s->nodetype[index];
> +        break;
> +    default:
> +        break;
> +    }
> +
> +    trace_loongarch_extioi_nodetype_readw((uint32_t)addr, ret);
> +    return ret;
> +}
> +
> +static void extioi_nodetype_writew(void *opaque, hwaddr addr,
> +                                   uint64_t val, unsigned size)
> +{
> +    LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
> +    int index;
> +    uint32_t offset;
> +    trace_loongarch_extioi_nodetype_writew(size, (uint32_t)addr, val);
> +
> +    offset = addr & 0xffff;
> +
> +    switch (offset) {
> +    case EXTIOI_NODETYPE_START ... EXTIOI_NODETYPE_END - 1:
> +        index = (offset - EXTIOI_NODETYPE_START) >> 2;
> +        s->nodetype[index] = val;
> +        break;
> +    default:
> +        break;
> +    }
> +}
> +
> +static uint64_t extioi_ipmap_enable_read(void *opaque, hwaddr addr,
> +                                         unsigned size)
> +{
> +    LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
> +    uint8_t ret;
> +
> +    switch (addr) {
> +    case EXTIOI_IPMAP_START ... EXTIOI_IPMAP_END - 1:
> +        ret = s->ipmap[addr];
> +        break;
> +    case EXTIOI_ENABLE_START ... EXTIOI_ENABLE_END - 1:
> +        addr -= EXTIOI_ENABLE_START;
> +        ret = s->enable[addr];
> +        break;
> +    default:
> +        break;
> +    }
> +
> +    trace_loongarch_extioi_ipmap_enable_read((uint8_t)addr, ret);
> +    return ret;
> +}
> +
> +static void extioi_ipmap_enable_write(void *opaque, hwaddr addr,
> +                                      uint64_t value, unsigned size)
> +{
> +    LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
> +    uint8_t old_data, val = value & 0xff;
> +    int i, level, ipnum, irqnum;
> +    trace_loongarch_extioi_ipmap_enable_write(size, (uint8_t)addr, val);
> +
> +    switch (addr) {
> +    case EXTIOI_IPMAP_START ... EXTIOI_IPMAP_END - 1:
> +        s->ipmap[addr] = val;
> +        /* Routing in groups of 32 interrupt */
> +        ipnum = find_first_bit((void *)&val, 4);
> +        for (i = 0; i < 32; i++) {
> +            irqnum = addr * 32 + i;
> +            if (ipnum != 4) {
> +                s->sw_ipmap[irqnum] = ipnum;
> +            } else {
> +                s->sw_ipmap[irqnum] = 0;
> +            }
> +        }
> +        break;
> +    case EXTIOI_ENABLE_START ... EXTIOI_ENABLE_END - 1:
> +        addr -= EXTIOI_ENABLE_START;
> +        old_data = s->enable[addr];
> +        if (old_data != val) {
> +            s->enable[addr] = val;
> +            old_data = old_data ^ val;
> +
> +            while ((i = find_first_bit((void *)&old_data, 8)) != 8) {
> +                level = test_bit(i, (unsigned long *)&val);
> +                extioi_update_irq(s, i + addr * 8, level);
> +                clear_bit(i, (void *)&old_data);
> +            }
> +        }
> +        break;
> +    default:
> +        break;
> +    }
> +}
> +
> +static uint64_t extioi_bounce_coreisr_readw(void *opaque, hwaddr addr,
> +                                            unsigned size)
> +{
> +    LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
> +    unsigned long offset = addr & 0xffff;
> +    uint32_t ret, index;
> +    int cpu;
> +
> +    switch (offset) {
> +    case EXTIOI_BOUNCE_START ... EXTIOI_BOUNCE_END - 1:
> +        index = (offset - EXTIOI_BOUNCE_START) >> 2;
> +        ret = s->bounce[index];
> +        break;
> +    case EXTIOI_COREISR_START ... EXTIOI_COREISR_END - 1:
> +        index = ((offset - EXTIOI_COREISR_START) & 0x1f) >> 2;
> +        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
> +        ret = s->coreisr[cpu][index];
> +        break;
> +    default:
> +        break;
> +    }
> +
> +    trace_loongarch_extioi_bounce_coreisr_readw((uint32_t)addr, ret);
> +    return ret;
> +}
> +
> +static void extioi_bounce_coreisr_writew(void *opaque, hwaddr addr,
> +                                         uint64_t val, unsigned size)
> +{
> +    LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
> +    int cpu, index;
> +    uint32_t offset, old_data, i, j, bits;
> +
> +    offset = addr & 0xffff;
> +    trace_loongarch_extioi_bounce_coreisr_writew(size, (uint32_t)addr, val);
> +    switch (offset) {
> +    case EXTIOI_BOUNCE_START ... EXTIOI_BOUNCE_END - 1:
> +        index = (offset - EXTIOI_BOUNCE_START) >> 2;
> +        s->bounce[index] = val;
> +        break;
> +    case EXTIOI_COREISR_START ... EXTIOI_COREISR_END - 1:
> +        index = ((offset - EXTIOI_COREISR_START) & 0x1f) >> 2;
> +        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
> +        old_data = s->coreisr[cpu][index];
> +        s->coreisr[cpu][index] = old_data & ~val;
> +        if (old_data != s->coreisr[cpu][index]) {
> +            bits = size * 8;
> +            while ((i = find_first_bit((void *)&val, bits)) != bits) {
> +                j = test_bit(i, (unsigned long *)&old_data);
> +                if (j) {
> +                    extioi_update_irq(s, i + index * 32, 0);
> +                }
> +                clear_bit(i, (void *)&val);
> +            }
> +        }
> +        break;
> +    default:
> +        break;
> +    }
> +}
> +
> +static uint64_t extioi_coremap_read(void *opaque, hwaddr addr, unsigned size)
> +{
> +    LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
> +    uint8_t ret;
> +
> +    switch (addr) {
> +    case EXTIOI_COREMAP_START ... EXTIOI_COREMAP_END - 1:
> +        ret = s->coremap[addr];
> +        break;
> +    default:
> +        break;
> +    }
> +
> +    trace_loongarch_extioi_coremap_read((uint8_t)addr, ret);
> +    return ret;
> +}
> +
> +static void extioi_coremap_write(void *opaque, hwaddr addr,
> +                                 uint64_t value, unsigned size)
> +{
> +    LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
> +    uint8_t val = value & 0xff;
> +    int cpu;
> +
> +    trace_loongarch_extioi_coremap_write(size, (uint8_t)addr, val);
> +    switch (addr) {
> +    case EXTIOI_COREMAP_START ... EXTIOI_COREMAP_END - 1:
> +        s->coremap[addr] = val;
> +
> +        /* Only support 1 node now only handle the core map*/
> +        if (val) {
> +            cpu = find_first_bit((void *)&val, 4);
> +            if (cpu != 4) {
> +                s->sw_coremap[addr] = cpu;
> +            }
> +        }
> +        break;
> +    default:
> +        break;
> +    }
> +}
> +
> +static const MemoryRegionOps extioi_nodetype_ops = {
> +    .read = extioi_nodetype_readw,
> +    .write = extioi_nodetype_writew,
> +    .impl.min_access_size = 4,
> +    .impl.max_access_size = 4,
> +    .valid.min_access_size = 4,
> +    .valid.max_access_size = 8,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +};
> +
> +static const MemoryRegionOps extioi_ipmap_enable_ops = {
> +    .read = extioi_ipmap_enable_read,
> +    .write = extioi_ipmap_enable_write,
> +    .impl.min_access_size = 1,
> +    .impl.max_access_size = 1,
> +    .valid.min_access_size = 1,
> +    .valid.max_access_size = 8,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +};
> +
> +static const MemoryRegionOps extioi_bounce_coreisr_ops = {
> +    .read = extioi_bounce_coreisr_readw,
> +    .write = extioi_bounce_coreisr_writew,
> +    .impl.min_access_size = 4,
> +    .impl.max_access_size = 4,
> +    .valid.min_access_size = 4,
> +    .valid.max_access_size = 8,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +};
> +
> +static const MemoryRegionOps extioi_coremap_ops = {
> +    .read = extioi_coremap_read,
> +    .write = extioi_coremap_write,
> +    .impl.min_access_size = 1,
> +    .impl.max_access_size = 1,
> +    .valid.min_access_size = 1,
> +    .valid.max_access_size = 8,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +};
> +
> +static void loongarch_extioi_realize(DeviceState *dev, Error **errp)
> +{
> +    LoongArchExtIOI *s = LOONGARCH_EXTIOI(dev);
> +    MachineState *ms = MACHINE(qdev_get_machine());
> +    int cpu;
> +
> +    for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
> +        memory_region_init_io(&s->mmio_nodetype[cpu], OBJECT(s),
> +                              &extioi_nodetype_ops, s,
> +                              EXTIOI_LINKNAME(.nodetype),
> +                              IPMAP_OFFSET - APIC_BASE);
> +        memory_region_init_io(&s->mmio_ipmap_enable[cpu], OBJECT(s),
> +                              &extioi_ipmap_enable_ops, s,
> +                              EXTIOI_LINKNAME(.ipmap_enable),
> +                              BOUNCE_OFFSET - IPMAP_OFFSET);
> +        memory_region_init_io(&s->mmio_bounce_coreisr[cpu], OBJECT(s),
> +                              &extioi_bounce_coreisr_ops, s,
> +                              EXTIOI_LINKNAME(.bounce_coreisr),
> +                              COREMAP_OFFSET - BOUNCE_OFFSET);
> +        memory_region_init_io(&s->mmio_coremap[cpu], OBJECT(s),
> +                              &extioi_coremap_ops, s,
> +                              EXTIOI_LINKNAME(.coremap),
> +                              EXTIOI_COREMAP_END);
> +    }
> +}

Once again devices shouldn't be accessing the machine directly: according to 
loongarch_extioi.h you can change the for() loop to use MAX_CORES instead, and wire 
up the ones you need at the board level.

Also you can simplify the mapping of the memory regions for this device by using a 
single container region:

     memory_region_init(&s->mmio[cpu], OBJECT(s), "loongarch_extioi", size);

     memory_region_init_io(&s->mmio_nodetype[cpu], OBJECT(s),
                           &extioi_nodetype_ops, s,
                           EXTIOI_LINKNAME(.nodetype),
                           IPMAP_OFFSET - APIC_BASE);
     memory_region_add_subregion(&s->mmio[cpu], IPMAP_OFFSET - APIC_BASE,
                                 &s->mmio_nodetype[cpu]);

     ...
     etc.

which helps below...

> +static const VMStateDescription vmstate_ext_sw_ipisr = {
> +    .name = "ext_sw_ipisr",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT8_ARRAY(irq, ext_sw_ipisr, EXTIOI_IRQS),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static const VMStateDescription vmstate_loongarch_extioi = {
> +    .name = TYPE_LOONGARCH_EXTIOI,
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32_ARRAY(bounce, LoongArchExtIOI, EXTIOI_IRQS_GROUP_COUNT),
> +        VMSTATE_UINT32_2DARRAY(coreisr, LoongArchExtIOI, MAX_CORES,
> +                               EXTIOI_IRQS_GROUP_COUNT),
> +        VMSTATE_UINT32_ARRAY(nodetype, LoongArchExtIOI,
> +                             EXTIOI_IRQS_NODETYPE_COUNT / 2),
> +        VMSTATE_UINT8_ARRAY(enable, LoongArchExtIOI, EXTIOI_IRQS / 8),
> +        VMSTATE_UINT8_ARRAY(ipmap, LoongArchExtIOI, 8),
> +        VMSTATE_UINT8_ARRAY(coremap, LoongArchExtIOI, EXTIOI_IRQS),
> +        VMSTATE_UINT8_ARRAY(sw_ipmap, LoongArchExtIOI, EXTIOI_IRQS),
> +        VMSTATE_UINT8_ARRAY(sw_coremap, LoongArchExtIOI, EXTIOI_IRQS),
> +        VMSTATE_STRUCT_2DARRAY(sw_ipisr, LoongArchExtIOI, MAX_CORES,
> +                               LS3A_INTC_IP, 1, vmstate_ext_sw_ipisr,
> +                               ext_sw_ipisr),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void loongarch_extioi_instance_init(Object *obj)
> +{
> +    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
> +    LoongArchExtIOI *s = LOONGARCH_EXTIOI(obj);
> +    MachineState *ms = MACHINE(qdev_get_machine());
> +    int i, cpu, pin;
> +
> +    for (i = 0; i < EXTIOI_IRQS; i++) {
> +        sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq[i]);
> +    }
> +
> +    qdev_init_gpio_in(DEVICE(obj), extioi_setirq, EXTIOI_IRQS);
> +
> +    for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
> +        sysbus_init_mmio(dev, &s->mmio_nodetype[cpu]);
> +        sysbus_init_mmio(dev, &s->mmio_ipmap_enable[cpu]);
> +        sysbus_init_mmio(dev, &s->mmio_bounce_coreisr[cpu]);
> +        sysbus_init_mmio(dev, &s->mmio_coremap[cpu]);

... with a container memory region you then only need a single sysbus_init_mmio() here.

> +        for (pin = 0; pin < LS3A_INTC_IP; pin++) {
> +            qdev_init_gpio_out(DEVICE(obj), &s->parent_irq[cpu][pin], 1);
> +        }
> +    }

Same comment as above regarding accessing the machine for this loop too: presumably 
this should be using MAX_CORES?

> +}
> +
> +static void loongarch_extioi_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->vmsd = &vmstate_loongarch_extioi;
> +    dc->realize = loongarch_extioi_realize;
> +}
> +
> +static const TypeInfo loongarch_extioi_info = {
> +    .name          = TYPE_LOONGARCH_EXTIOI,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_init = loongarch_extioi_instance_init,
> +    .instance_size = sizeof(struct LoongArchExtIOI),
> +    .class_init    = loongarch_extioi_class_init,
> +};
> +
> +static void loongarch_extioi_register_types(void)
> +{
> +    type_register_static(&loongarch_extioi_info);
> +}
> +
> +type_init(loongarch_extioi_register_types)
> diff --git a/hw/intc/meson.build b/hw/intc/meson.build
> index c679223420..d09eb6b81d 100644
> --- a/hw/intc/meson.build
> +++ b/hw/intc/meson.build
> @@ -63,3 +63,4 @@ specific_ss.add(when: 'CONFIG_M68K_IRQC', if_true: files('m68k_irqc.c'))
>   specific_ss.add(when: 'CONFIG_LOONGARCH_IPI', if_true: files('loongarch_ipi.c'))
>   specific_ss.add(when: 'CONFIG_LOONGARCH_PCH_PIC', if_true: files('loongarch_pch_pic.c'))
>   specific_ss.add(when: 'CONFIG_LOONGARCH_PCH_MSI', if_true: files('loongarch_pch_msi.c'))
> +specific_ss.add(when: 'CONFIG_LOONGARCH_EXTIOI', if_true: files('loongarch_extioi.c'))
> diff --git a/hw/intc/trace-events b/hw/intc/trace-events
> index 46a0bf20dd..fa1a6df01e 100644
> --- a/hw/intc/trace-events
> +++ b/hw/intc/trace-events
> @@ -262,3 +262,14 @@ loongarch_pch_pic_writeb(unsigned size, uint32_t addr, unsigned long val) "size:
>   
>   # loongarch_pch_msi.c
>   loongarch_msi_set_irq(int irq_num) "set msi irq %d"
> +
> +# loongarch_extioi.c
> +extioi_setirq(int irq, int level) "set extirq irq %d level %d"
> +loongarch_extioi_nodetype_readw(uint32_t addr, uint32_t val) "addr: 0x%"PRIx32 "val: 0x%" PRIx32
> +loongarch_extioi_nodetype_writew(unsigned size, uint32_t addr, uint32_t val) "size: %u addr: 0x%"PRIx32 "val: 0x%" PRIx32
> +loongarch_extioi_ipmap_enable_read(uint8_t addr, uint8_t val) "addr: 0x%"PRIu8 "val: 0x%" PRIu8
> +loongarch_extioi_ipmap_enable_write(unsigned size, uint8_t addr, uint8_t val) "size: %u addr: 0x%"PRIu8 "val: 0x%" PRIu8
> +loongarch_extioi_bounce_coreisr_readw(uint32_t addr, uint32_t val) "addr: 0x%"PRIx32 "val: 0x%" PRIx32
> +loongarch_extioi_bounce_coreisr_writew(unsigned size, uint32_t addr, uint32_t val) "size: %u addr: 0x%"PRIx32 "val: 0x%" PRIx32
> +loongarch_extioi_coremap_read(uint8_t addr, uint8_t val) "addr: 0x%"PRIu8 "val: 0x%" PRIu8
> +loongarch_extioi_coremap_write(unsigned size, uint8_t addr, uint8_t val) "size: %u addr: 0x%"PRIu8 "val: 0x%" PRIu8
> diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
> index cd38d03a19..468e3acc74 100644
> --- a/hw/loongarch/Kconfig
> +++ b/hw/loongarch/Kconfig
> @@ -4,3 +4,4 @@ config LOONGSON3_LS7A
>       select LOONGARCH_IPI
>       select LOONGARCH_PCH_PIC
>       select LOONGARCH_PCH_MSI
> +    select LOONGARCH_EXTIOI
> diff --git a/include/hw/intc/loongarch_extioi.h b/include/hw/intc/loongarch_extioi.h
> new file mode 100644
> index 0000000000..a61ddd1919
> --- /dev/null
> +++ b/include/hw/intc/loongarch_extioi.h
> @@ -0,0 +1,77 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * LoongArch 3A5000 ext interrupt controller definitions
> + *
> + * Copyright (C) 2021 Loongson Technology Corporation Limited
> + */
> +
> +#include "hw/sysbus.h"
> +#include "hw/loongarch/loongarch.h"
> +
> +#ifndef LOONGARCH_EXTIOI_H
> +#define LOONGARCH_EXTIOI_H
> +
> +#define LS3A_INTC_IP                 8
> +#define MAX_CORES                    LOONGARCH_MAX_VCPUS
> +#define EXTIOI_IRQS                  (256)
> +/* 32 irqs belong to a group */
> +#define EXTIOI_IRQS_GROUP_COUNT      (256 / 32)
> +/* map to ipnum per 32 irqs */
> +#define EXTIOI_IRQS_NODETYPE_COUNT   16
> +
> +#define APIC_BASE                    0x1400
> +#define ENABLE_OFFSET                0x1600
> +#define IPMAP_OFFSET                 0x14c0
> +#define COREMAP_OFFSET               0x1c00
> +#define NODETYPE_OFFSET              0x14a0
> +#define BOUNCE_OFFSET                0x1680
> +#define COREISR_OFFSET               0x1800
> +
> +#define EXTIOI_NODETYPE_START        (0x14a0 - APIC_BASE)
> +#define EXTIOI_NODETYPE_END          (0x14c0 - APIC_BASE)
> +#define EXTIOI_BOUNCE_START          0
> +#define EXTIOI_BOUNCE_END            (0x16a0 - BOUNCE_OFFSET)
> +#define EXTIOI_COREISR_START         (0x1800 - BOUNCE_OFFSET)
> +#define EXTIOI_COREISR_END           (0x1B20 - BOUNCE_OFFSET)
> +
> +#define EXTIOI_IPMAP_START           0
> +#define EXTIOI_IPMAP_END             (0x14c8 - IPMAP_OFFSET)
> +#define EXTIOI_ENABLE_START          (0x1600 - IPMAP_OFFSET)
> +#define EXTIOI_ENABLE_END            (0x1618 - IPMAP_OFFSET)
> +
> +#define EXTIOI_COREMAP_START         0
> +#define EXTIOI_COREMAP_END           (0x1d00 - COREMAP_OFFSET)
> +
> +#define TYPE_LOONGARCH_EXTIOI "loongarch_extioi"
> +#define EXTIOI_LINKNAME(name) TYPE_LOONGARCH_EXTIOI#name
> +DECLARE_INSTANCE_CHECKER(struct LoongArchExtIOI, LOONGARCH_EXTIOI,
> +                         TYPE_LOONGARCH_EXTIOI)
> +
> +typedef struct ext_sw_ipisr {
> +    uint8_t irq[EXTIOI_IRQS];
> +} ext_sw_ipisr;
> +
> +typedef struct LoongArchExtIOI {
> +    SysBusDevice parent_obj;
> +    /* hardware state */
> +    uint32_t nodetype[EXTIOI_IRQS_NODETYPE_COUNT / 2];
> +    uint32_t bounce[EXTIOI_IRQS_GROUP_COUNT];
> +    uint32_t coreisr[MAX_CORES][EXTIOI_IRQS_GROUP_COUNT];
> +
> +    uint8_t enable[EXTIOI_IRQS / 8];
> +    uint8_t ipmap[8];
> +    uint8_t coremap[EXTIOI_IRQS];
> +    /*software state */
> +    uint8_t sw_ipmap[EXTIOI_IRQS];
> +    uint8_t sw_coremap[EXTIOI_IRQS];
> +    ext_sw_ipisr sw_ipisr[MAX_CORES][LS3A_INTC_IP];
> +
> +    qemu_irq parent_irq[MAX_CORES][LS3A_INTC_IP];
> +    qemu_irq irq[EXTIOI_IRQS];
> +    MemoryRegion mmio_nodetype[MAX_CORES];
> +    MemoryRegion mmio_ipmap_enable[MAX_CORES];
> +    MemoryRegion mmio_bounce_coreisr[MAX_CORES];
> +    MemoryRegion mmio_coremap[MAX_CORES];
> +} LoongArchExtIOI;
> +
> +#endif /* LOONGARCH_EXTIOI_H */


ATB,

Mark.

