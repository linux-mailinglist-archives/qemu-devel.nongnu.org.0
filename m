Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C20BF4AA8B7
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 13:24:52 +0100 (CET)
Received: from localhost ([::1]:37522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGK7X-0003Ia-No
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 07:24:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nGK5J-0002cD-Qm
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 07:22:33 -0500
Received: from [2001:41c9:1:41f::167] (port=48698
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nGK5H-0002v0-Mn
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 07:22:33 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nGK4j-0009PQ-Mk; Sat, 05 Feb 2022 12:22:01 +0000
Message-ID: <8105507d-cd21-da91-9a71-b8cc4fe95025@ilande.co.uk>
Date: Sat, 5 Feb 2022 12:22:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220128034412.1262452-1-yangxiaojuan@loongson.cn>
 <20220128034412.1262452-18-yangxiaojuan@loongson.cn>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220128034412.1262452-18-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC PATCH v5 17/30] hw/loongarch: Add LoongArch ipi interrupt
 support(IPI)
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

On 28/01/2022 03:43, Xiaojuan Yang wrote:

> This patch realize the IPI interrupt controller.
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   hw/intc/Kconfig                 |   3 +
>   hw/intc/loongarch_ipi.c         | 164 ++++++++++++++++++++++++++++++++
>   hw/intc/meson.build             |   1 +
>   hw/intc/trace-events            |   4 +
>   hw/loongarch/Kconfig            |   1 +
>   include/hw/intc/loongarch_ipi.h |  48 ++++++++++
>   6 files changed, 221 insertions(+)
>   create mode 100644 hw/intc/loongarch_ipi.c
>   create mode 100644 include/hw/intc/loongarch_ipi.h
> 
> diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
> index 010ded7eae..9f5aaffb6f 100644
> --- a/hw/intc/Kconfig
> +++ b/hw/intc/Kconfig
> @@ -78,3 +78,6 @@ config GOLDFISH_PIC
>   
>   config M68K_IRQC
>       bool
> +
> +config LOONGARCH_IPI
> +    bool
> diff --git a/hw/intc/loongarch_ipi.c b/hw/intc/loongarch_ipi.c
> new file mode 100644
> index 0000000000..b358ac68e5
> --- /dev/null
> +++ b/hw/intc/loongarch_ipi.c
> @@ -0,0 +1,164 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * LoongArch ipi interrupt support
> + *
> + * Copyright (C) 2021 Loongson Technology Corporation Limited
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/sysbus.h"
> +#include "hw/intc/loongarch_ipi.h"
> +#include "hw/irq.h"
> +#include "qapi/error.h"
> +#include "qemu/log.h"
> +#include "exec/address-spaces.h"
> +#include "hw/loongarch/loongarch.h"
> +#include "migration/vmstate.h"
> +#include "trace.h"
> +
> +static uint64_t loongarch_ipi_readl(void *opaque, hwaddr addr, unsigned size)
> +{
> +    IPICore *s = opaque;
> +    uint64_t ret = 0;
> +    int index = 0;
> +
> +    addr &= 0xff;
> +    switch (addr) {
> +    case CORE_STATUS_OFF:
> +        ret = s->status;
> +        break;
> +    case CORE_EN_OFF:
> +        ret = s->en;
> +        break;
> +    case CORE_SET_OFF:
> +        ret = 0;
> +        break;
> +    case CORE_CLEAR_OFF:
> +        ret = 0;
> +        break;
> +    case CORE_BUF_20 ... CORE_BUF_38 + 4:
> +        index = (addr - CORE_BUF_20) >> 2;
> +        ret = s->buf[index];
> +        break;
> +    case IOCSR_IPI_SEND:
> +        ret = s->status;
> +        break;
> +    default:
> +        qemu_log_mask(LOG_UNIMP, "invalid read: %x", (uint32_t)addr);
> +        break;
> +    }
> +
> +    trace_loongarch_ipi_read(size, (uint64_t)addr, ret);
> +    return ret;
> +}
> +
> +static void loongarch_ipi_writel(void *opaque, hwaddr addr, uint64_t val,
> +                                 unsigned size)
> +{
> +    IPICore *s = opaque;
> +    int index = 0;
> +
> +    addr &= 0xff;
> +    trace_loongarch_ipi_write(size, (uint64_t)addr, val);
> +    switch (addr) {
> +    case CORE_STATUS_OFF:
> +        qemu_log_mask(LOG_GUEST_ERROR, "can not be written");
> +        break;
> +    case CORE_EN_OFF:
> +        s->en = val;
> +        break;
> +    case CORE_SET_OFF:
> +        s->status |= val;
> +        if (s->status != 0) {
> +            qemu_irq_raise(s->irq);
> +        }
> +        break;
> +    case CORE_CLEAR_OFF:
> +        s->status ^= val;
> +        if (s->status == 0) {
> +            qemu_irq_lower(s->irq);
> +        }
> +        break;
> +    case CORE_BUF_20 ... CORE_BUF_38 + 4:
> +        index = (addr - CORE_BUF_20) >> 2;
> +        s->buf[index] = val;
> +        break;
> +    case IOCSR_IPI_SEND:
> +        s->status |= val;
> +        break;
> +    default:
> +        qemu_log_mask(LOG_UNIMP, "invalid write: %x", (uint32_t)addr);
> +        break;
> +    }
> +}
> +
> +static const MemoryRegionOps loongarch_ipi_ops = {
> +    .read = loongarch_ipi_readl,
> +    .write = loongarch_ipi_writel,
> +    .impl.min_access_size = 4,
> +    .impl.max_access_size = 4,
> +    .valid.min_access_size = 4,
> +    .valid.max_access_size = 8,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +};
> +
> +static void loongarch_ipi_init(Object *obj)
> +{
> +    LoongArchIPI *s = LOONGARCH_IPI(obj);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> +    int cpu;
> +
> +    for (cpu = 0; cpu < MACHINE(qdev_get_machine())->smp.cpus; cpu++) {
> +        memory_region_init_io(&s->ipi_mmio[cpu], obj, &loongarch_ipi_ops,
> +                              &s->core[cpu], "loongarch_ipi", 0x100);
> +        sysbus_init_mmio(sbd, &s->ipi_mmio[cpu]);
> +        qdev_init_gpio_out(DEVICE(obj), &s->core[cpu].irq, 1);
> +   }
> +}

Devices shouldn't be accessing the machine directly: looking at the definitions below 
in loongarch_ipi.h, the number of elements is limited to MAX_IPI_CORE_NUM so change 
the for() loop to count from 0 to MAX_IPI_CORE_NUM - 1 and then wire up just the ones 
you need in the board code.

> +static const VMStateDescription vmstate_ipi_core = {
> +    .name = "ipi-single",
> +    .version_id = 0,
> +    .minimum_version_id = 0,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32(status, IPICore),
> +        VMSTATE_UINT32(en, IPICore),
> +        VMSTATE_UINT32(set, IPICore),
> +        VMSTATE_UINT32(clear, IPICore),
> +        VMSTATE_UINT32_ARRAY(buf, IPICore, MAX_IPI_MBX_NUM * 2),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static const VMStateDescription vmstate_loongarch_ipi = {
> +    .name = TYPE_LOONGARCH_IPI,
> +    .version_id = 0,
> +    .minimum_version_id = 0,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_STRUCT_ARRAY(core, LoongArchIPI, MAX_IPI_CORE_NUM, 0,
> +                             vmstate_ipi_core, IPICore),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void loongarch_ipi_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->vmsd = &vmstate_loongarch_ipi;
> +}
> +
> +static const TypeInfo loongarch_ipi_info = {
> +    .name          = TYPE_LOONGARCH_IPI,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(LoongArchIPI),
> +    .instance_init = loongarch_ipi_init,
> +    .class_init    = loongarch_ipi_class_init,
> +};
> +
> +static void loongarch_ipi_register_types(void)
> +{
> +    type_register_static(&loongarch_ipi_info);
> +}
> +
> +type_init(loongarch_ipi_register_types)
> diff --git a/hw/intc/meson.build b/hw/intc/meson.build
> index 70080bc161..14c0834c67 100644
> --- a/hw/intc/meson.build
> +++ b/hw/intc/meson.build
> @@ -60,3 +60,4 @@ specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XIVE'],
>   		if_true: files('spapr_xive_kvm.c'))
>   specific_ss.add(when: 'CONFIG_GOLDFISH_PIC', if_true: files('goldfish_pic.c'))
>   specific_ss.add(when: 'CONFIG_M68K_IRQC', if_true: files('m68k_irqc.c'))
> +specific_ss.add(when: 'CONFIG_LOONGARCH_IPI', if_true: files('loongarch_ipi.c'))
> diff --git a/hw/intc/trace-events b/hw/intc/trace-events
> index 9aba7e3a7a..55f2f3a8b6 100644
> --- a/hw/intc/trace-events
> +++ b/hw/intc/trace-events
> @@ -246,3 +246,7 @@ sh_intc_register(const char *s, int id, unsigned short v, int c, int m) "%s %u -
>   sh_intc_read(unsigned size, uint64_t offset, unsigned long val) "size %u 0x%" PRIx64 " -> 0x%lx"
>   sh_intc_write(unsigned size, uint64_t offset, unsigned long val) "size %u 0x%" PRIx64 " <- 0x%lx"
>   sh_intc_set(int id, int enable) "setting interrupt group %d to %d"
> +
> +# loongarch_ipi.c
> +loongarch_ipi_read(unsigned size, uint64_t addr, unsigned long val) "size: %u addr: 0x%"PRIx64 "val: 0x%"PRIx64
> +loongarch_ipi_write(unsigned size, uint64_t addr, unsigned long val) "size: %u addr: 0x%"PRIx64 "val: 0x%"PRIx64
> diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
> index ae8498de6a..1591574397 100644
> --- a/hw/loongarch/Kconfig
> +++ b/hw/loongarch/Kconfig
> @@ -1,3 +1,4 @@
>   config LOONGSON3_LS7A
>       bool
>       select PCI_EXPRESS_7A
> +    select LOONGARCH_IPI
> diff --git a/include/hw/intc/loongarch_ipi.h b/include/hw/intc/loongarch_ipi.h
> new file mode 100644
> index 0000000000..78e676db2c
> --- /dev/null
> +++ b/include/hw/intc/loongarch_ipi.h
> @@ -0,0 +1,48 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * LoongArch ipi interrupt header files
> + *
> + * Copyright (C) 2021 Loongson Technology Corporation Limited
> + */
> +
> +#ifndef HW_LOONGARCH_IPI_H
> +#define HW_LOONGARCH_IPI_H
> +
> +#include "hw/sysbus.h"
> +
> +/* Mainy used by iocsr read and write */
> +#define SMP_IPI_MAILBOX      0x1000ULL
> +#define CORE_STATUS_OFF       0x0
> +#define CORE_EN_OFF           0x4
> +#define CORE_SET_OFF          0x8
> +#define CORE_CLEAR_OFF        0xc
> +#define CORE_BUF_20           0x20
> +#define CORE_BUF_28           0x28
> +#define CORE_BUF_30           0x30
> +#define CORE_BUF_38           0x38
> +#define IOCSR_IPI_SEND        0x40
> +
> +#define MAX_IPI_CORE_NUM      16
> +#define MAX_IPI_MBX_NUM       4
> +
> +#define TYPE_LOONGARCH_IPI "loongarch_ipi"
> +DECLARE_INSTANCE_CHECKER(struct LoongArchIPI, LOONGARCH_IPI,
> +                         TYPE_LOONGARCH_IPI)
> +
> +typedef struct IPICore {
> +    uint32_t status;
> +    uint32_t en;
> +    uint32_t set;
> +    uint32_t clear;
> +    /* 64bit buf divide into 2 32bit buf */
> +    uint32_t buf[MAX_IPI_MBX_NUM * 2];
> +    qemu_irq irq;
> +} IPICore;
> +
> +typedef struct LoongArchIPI {
> +    SysBusDevice parent_obj;
> +    IPICore core[MAX_IPI_CORE_NUM];
> +    MemoryRegion ipi_mmio[MAX_IPI_CORE_NUM];
> +} LoongArchIPI;
> +
> +#endif


ATB,

Mark.

