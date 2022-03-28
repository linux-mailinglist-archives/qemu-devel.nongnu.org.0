Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E54F44EA18D
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 22:34:27 +0200 (CEST)
Received: from localhost ([::1]:40082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYw4I-0004kQ-Ew
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 16:34:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nYvmc-0004CX-2E
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 16:16:12 -0400
Received: from [2001:41c9:1:41f::167] (port=58844
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nYvmX-0003U1-49
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 16:16:09 -0400
Received: from [2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nYvlh-00093k-V7; Mon, 28 Mar 2022 21:15:17 +0100
Message-ID: <939fafbb-eae3-7f89-0969-287b48d3d270@ilande.co.uk>
Date: Mon, 28 Mar 2022 21:15:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220328125749.2918087-1-yangxiaojuan@loongson.cn>
 <20220328125749.2918087-17-yangxiaojuan@loongson.cn>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220328125749.2918087-17-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC PATCH v7 16/29] hw/loongarch: Add LoongArch ipi interrupt
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

On 28/03/2022 13:57, Xiaojuan Yang wrote:

> This patch realize the IPI interrupt controller.
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   MAINTAINERS                     |   2 +
>   hw/intc/Kconfig                 |   3 +
>   hw/intc/loongarch_ipi.c         | 164 ++++++++++++++++++++++++++++++++
>   hw/intc/meson.build             |   1 +
>   hw/intc/trace-events            |   4 +
>   hw/loongarch/Kconfig            |   1 +
>   include/hw/intc/loongarch_ipi.h |  47 +++++++++
>   7 files changed, 222 insertions(+)
>   create mode 100644 hw/intc/loongarch_ipi.c
>   create mode 100644 include/hw/intc/loongarch_ipi.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a794f41913..d83b90b5c5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1133,6 +1133,8 @@ F: configs/devices/loongarch64-softmmu/default.mak
>   F: gdb-xml/loongarch*.xml
>   F: hw/loongarch/
>   F: include/hw/loongarch/loongarch.h
> +F: include/hw/intc/loongarch_*.h
> +F: hw/intc/loongarch_*.c
>   
>   M68K Machines
>   -------------
> diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
> index a7cf301eab..6c7e82da64 100644
> --- a/hw/intc/Kconfig
> +++ b/hw/intc/Kconfig
> @@ -84,3 +84,6 @@ config GOLDFISH_PIC
>   
>   config M68K_IRQC
>       bool
> +
> +config LOONGARCH_IPI
> +    bool
> diff --git a/hw/intc/loongarch_ipi.c b/hw/intc/loongarch_ipi.c
> new file mode 100644
> index 0000000000..89e9019112
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
> +    for (cpu = 0; cpu < MAX_IPI_CORE_NUM; cpu++) {
> +        memory_region_init_io(&s->ipi_mmio[cpu], obj, &loongarch_ipi_ops,
> +                              &s->core[cpu], "loongarch_ipi", 0x100);
> +        sysbus_init_mmio(sbd, &s->ipi_mmio[cpu]);
> +        qdev_init_gpio_out(DEVICE(obj), &s->core[cpu].irq, 1);
> +   }
> +}
> +
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
> index d6d012fb26..bf5ab44a78 100644
> --- a/hw/intc/meson.build
> +++ b/hw/intc/meson.build
> @@ -62,3 +62,4 @@ specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XIVE'],
>   		if_true: files('spapr_xive_kvm.c'))
>   specific_ss.add(when: 'CONFIG_GOLDFISH_PIC', if_true: files('goldfish_pic.c'))
>   specific_ss.add(when: 'CONFIG_M68K_IRQC', if_true: files('m68k_irqc.c'))
> +specific_ss.add(when: 'CONFIG_LOONGARCH_IPI', if_true: files('loongarch_ipi.c'))
> diff --git a/hw/intc/trace-events b/hw/intc/trace-events
> index 53414aa197..6ae8917d99 100644
> --- a/hw/intc/trace-events
> +++ b/hw/intc/trace-events
> @@ -275,3 +275,7 @@ sh_intc_register(const char *s, int id, unsigned short v, int c, int m) "%s %u -
>   sh_intc_read(unsigned size, uint64_t offset, unsigned long val) "size %u 0x%" PRIx64 " -> 0x%lx"
>   sh_intc_write(unsigned size, uint64_t offset, unsigned long val) "size %u 0x%" PRIx64 " <- 0x%lx"
>   sh_intc_set(int id, int enable) "setting interrupt group %d to %d"
> +
> +# loongarch_ipi.c
> +loongarch_ipi_read(unsigned size, uint64_t addr, unsigned long val) "size: %u addr: 0x%"PRIx64 "val: 0x%"PRIx64
> +loongarch_ipi_write(unsigned size, uint64_t addr, unsigned long val) "size: %u addr: 0x%"PRIx64 "val: 0x%"PRIx64
> diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
> index 13e8501897..f0dad3329a 100644
> --- a/hw/loongarch/Kconfig
> +++ b/hw/loongarch/Kconfig
> @@ -2,3 +2,4 @@ config LOONGARCH_VIRT
>       bool
>       select PCI
>       select PCI_EXPRESS_GENERIC_BRIDGE
> +    select LOONGARCH_IPI
> diff --git a/include/hw/intc/loongarch_ipi.h b/include/hw/intc/loongarch_ipi.h
> new file mode 100644
> index 0000000000..0f3bca8a79
> --- /dev/null
> +++ b/include/hw/intc/loongarch_ipi.h
> @@ -0,0 +1,47 @@
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
> +OBJECT_DECLARE_SIMPLE_TYPE(LoongArchIPI, LOONGARCH_IPI)
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

You missed the part in my original comment on patch 14 about dropping the typedef for 
QOM structs that are defined using OBJECT_DECLARE_TYPE_SIMPLE() i.e.


#define TYPE_LOONGARCH_IPI "loongarch_ipi"
OBJECT_DECLARE_SIMPLE_TYPE(LoongArchIPI, LOONGARCH_IPI)

...
...

typedef struct IPICore {
    uint32_t status;
    uint32_t en;
    uint32_t set;
    uint32_t clear;
    /* 64bit buf divide into 2 32bit buf */
    uint32_t buf[MAX_IPI_MBX_NUM * 2];
    qemu_irq irq;
} IPICore;

struct LoongArchIPI {
     SysBusDevice parent_obj;
     IPICore core[MAX_IPI_CORE_NUM];
     MemoryRegion ipi_mmio[MAX_IPI_CORE_NUM];
};


ATB,

Mark.

