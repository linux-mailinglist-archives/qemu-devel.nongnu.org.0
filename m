Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E46544D84F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 15:31:38 +0100 (CET)
Received: from localhost ([::1]:53800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlB73-0002wB-Hk
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 09:31:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mlB47-0000db-Tb
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:28:37 -0500
Received: from [2001:41c9:1:41f::167] (port=36140
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mlB44-00006R-1W
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:28:35 -0500
Received: from [2a00:23c4:8b9e:9b00:2535:46c:7466:70fe]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mlB3t-0003ue-4v; Thu, 11 Nov 2021 14:28:25 +0000
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
 <1636594528-8175-19-git-send-email-yangxiaojuan@loongson.cn>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <5fea8e2c-7874-bc83-73a8-d0e5bec2a5c6@ilande.co.uk>
Date: Thu, 11 Nov 2021 14:28:16 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1636594528-8175-19-git-send-email-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9e:9b00:2535:46c:7466:70fe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC PATCH v2 18/30] hw/loongarch: Add LoongArch ipi interrupt
 support(IPI)
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.999,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 11/11/2021 01:35, Xiaojuan Yang wrote:

> This patch realize the IPI interrupt controller.
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   hw/loongarch/ipi.c               | 144 +++++++++++++++++++++++++++++++
>   hw/loongarch/ls3a5000_virt.c     |   1 +
>   hw/loongarch/meson.build         |   2 +-
>   include/hw/loongarch/gipi.h      |  37 ++++++++
>   include/hw/loongarch/loongarch.h |   4 +
>   target/loongarch/cpu.h           |   1 +
>   6 files changed, 188 insertions(+), 1 deletion(-)
>   create mode 100644 hw/loongarch/ipi.c
>   create mode 100644 include/hw/loongarch/gipi.h
> 
> diff --git a/hw/loongarch/ipi.c b/hw/loongarch/ipi.c
> new file mode 100644
> index 0000000000..4902205ff5
> --- /dev/null
> +++ b/hw/loongarch/ipi.c
> @@ -0,0 +1,144 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * LoongArch ipi interrupt support
> + *
> + * Copyright (C) 2021 Loongson Technology Corporation Limited
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/units.h"
> +#include "qapi/error.h"
> +#include "exec/address-spaces.h"
> +#include "hw/hw.h"
> +#include "hw/irq.h"
> +#include "sysemu/sysemu.h"
> +#include "sysemu/cpus.h"
> +#include "cpu.h"
> +#include "qemu/log.h"
> +#include "hw/loongarch/loongarch.h"
> +#include "migration/vmstate.h"
> +
> +static const VMStateDescription vmstate_gipi_core = {
> +    .name = "gipi-single",
> +    .version_id = 0,
> +    .minimum_version_id = 0,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32(status, gipi_core),
> +        VMSTATE_UINT32(en, gipi_core),
> +        VMSTATE_UINT32(set, gipi_core),
> +        VMSTATE_UINT32(clear, gipi_core),
> +        VMSTATE_UINT64_ARRAY(buf, gipi_core, MAX_GIPI_MBX_NUM),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static const VMStateDescription vmstate_gipi = {
> +    .name = "gipi",
> +    .version_id = 0,
> +    .minimum_version_id = 0,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_STRUCT_ARRAY(core, gipiState, MAX_GIPI_CORE_NUM, 0,
> +                             vmstate_gipi_core, gipi_core),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void gipi_writel(void *opaque, hwaddr addr, uint64_t val, unsigned size)
> +{
> +    gipi_core *s = opaque;
> +    void *pbuf;
> +
> +    if (size != 4) {
> +        hw_error("size not 4");
> +    }
> +    addr &= 0xff;
> +    switch (addr) {
> +    case CORE_STATUS_OFF:
> +        hw_error("CORE_SET_OFF Can't be write\n");
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
> +    case CORE_BUF_20 ... CORE_BUF_38:
> +        pbuf =  (void *)s->buf + (addr - 0x20);
> +        *(unsigned int *)pbuf = val;
> +        break;
> +    default:
> +        break;
> +    }
> +}
> +
> +static uint64_t gipi_readl(void *opaque, hwaddr addr, unsigned size)
> +{
> +    gipi_core *s = opaque;
> +    uint64_t ret = 0;
> +    void *pbuf;
> +
> +    addr &= 0xff;
> +    if (size != 4) {
> +        hw_error("size not 4 %d\n", size);
> +    }
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
> +    case CORE_BUF_20 ... CORE_BUF_38:
> +        pbuf =  (void *)s->buf + (addr - 0x20);
> +        ret = *(unsigned int *)pbuf;
> +        break;
> +    default:
> +        break;
> +    }
> +
> +    return ret;
> +}
> +
> +static const MemoryRegionOps gipi_ops = {
> +    .read = gipi_readl,
> +    .write = gipi_writel,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +};
> +
> +int cpu_init_ipi(LoongArchMachineState *lams, qemu_irq parent, int cpu)
> +{
> +    int core_num = cpu % 4;
> +    hwaddr addr;
> +    MemoryRegion *region;
> +    char str[32];
> +
> +    if (lams->gipi == NULL) {
> +        lams->gipi = g_malloc0(sizeof(gipiState));
> +        vmstate_register(NULL, 0, &vmstate_gipi, lams->gipi);
> +    }
> +
> +    lams->gipi->core[cpu].irq = parent;
> +
> +    addr = SMP_GIPI_MAILBOX + core_num * 0x100;
> +    region = g_new(MemoryRegion, 1);
> +    sprintf(str, "gipi%d", cpu);
> +    memory_region_init_io(region, NULL, &gipi_ops,
> +                          &lams->gipi->core[cpu], str, 0x100);
> +    memory_region_add_subregion(lams->system_iocsr, addr, region);
> +    return 0;
> +}

This doesn't look right at all. Shouldn't this be a qdev device? Also similar to my 
comments on previous patches, there shouldn't really be any heap allocation used.

> diff --git a/hw/loongarch/ls3a5000_virt.c b/hw/loongarch/ls3a5000_virt.c
> index 37d6b1ec88..bd79df96df 100644
> --- a/hw/loongarch/ls3a5000_virt.c
> +++ b/hw/loongarch/ls3a5000_virt.c
> @@ -153,6 +153,7 @@ static void ls3a5000_virt_init(MachineState *machine)
>           /* Init CPU internal devices */
>           cpu_loongarch_init_irq(cpu);
>           cpu_loongarch_clock_init(cpu);
> +        cpu_init_ipi(lams, env->irq[IRQ_IPI], i);
>           qemu_register_reset(main_cpu_reset, cpu);
>       }
>   
> diff --git a/hw/loongarch/meson.build b/hw/loongarch/meson.build
> index a972210680..1bd209c9eb 100644
> --- a/hw/loongarch/meson.build
> +++ b/hw/loongarch/meson.build
> @@ -1,5 +1,5 @@
>   loongarch_ss = ss.source_set()
>   loongarch_ss.add(files('loongarch_int.c'))
> -loongarch_ss.add(when: 'CONFIG_LOONGSON_3A5000', if_true: files('ls3a5000_virt.c'))
> +loongarch_ss.add(when: 'CONFIG_LOONGSON_3A5000', if_true: files('ls3a5000_virt.c', 'ipi.c'))
>   
>   hw_arch += {'loongarch': loongarch_ss}
> diff --git a/include/hw/loongarch/gipi.h b/include/hw/loongarch/gipi.h
> new file mode 100644
> index 0000000000..244d4e3ecf
> --- /dev/null
> +++ b/include/hw/loongarch/gipi.h
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * LoongArch ipi interrupt header files
> + *
> + * Copyright (C) 2021 Loongson Technology Corporation Limited
> + */
> +
> +#ifndef HW_LOONGARCH_GIPI_H
> +#define HW_LOONGARCH_GIPI_H
> +
> +#define SMP_GIPI_MAILBOX      0x1000ULL
> +#define CORE_STATUS_OFF       0x0
> +#define CORE_EN_OFF           0x4
> +#define CORE_SET_OFF          0x8
> +#define CORE_CLEAR_OFF        0xc
> +#define CORE_BUF_20           0x20
> +#define CORE_BUF_28           0x28
> +#define CORE_BUF_30           0x30
> +#define CORE_BUF_38           0x38
> +
> +#define MAX_GIPI_CORE_NUM      4
> +#define MAX_GIPI_MBX_NUM       4
> +
> +typedef struct gipi_core {
> +    uint32_t status;
> +    uint32_t en;
> +    uint32_t set;
> +    uint32_t clear;
> +    uint64_t buf[MAX_GIPI_MBX_NUM];
> +    qemu_irq irq;
> +} gipi_core;
> +
> +typedef struct gipiState {
> +    gipi_core core[MAX_GIPI_CORE_NUM];
> +} gipiState;
> +
> +#endif
> diff --git a/include/hw/loongarch/loongarch.h b/include/hw/loongarch/loongarch.h
> index 8538697e5f..54cc875e6d 100644
> --- a/include/hw/loongarch/loongarch.h
> +++ b/include/hw/loongarch/loongarch.h
> @@ -12,6 +12,7 @@
>   #include "qemu-common.h"
>   #include "hw/boards.h"
>   #include "qemu/queue.h"
> +#include "hw/loongarch/gipi.h"
>   
>   #define LOONGARCH_MAX_VCPUS     4
>   #define PM_MMIO_ADDR            0x10080000UL
> @@ -38,6 +39,8 @@ typedef struct LoongArchMachineState {
>   
>       AddressSpace *address_space_iocsr;
>       MemoryRegion *system_iocsr;
> +
> +    gipiState   *gipi;
>   } LoongArchMachineState;
>   
>   #define TYPE_LOONGARCH_MACHINE  MACHINE_TYPE_NAME("loongson7a")
> @@ -45,4 +48,5 @@ DECLARE_INSTANCE_CHECKER(LoongArchMachineState, LOONGARCH_MACHINE,
>                            TYPE_LOONGARCH_MACHINE)
>   
>   void cpu_loongarch_init_irq(LoongArchCPU *cpu);
> +int cpu_init_ipi(LoongArchMachineState *lams, qemu_irq irq, int cpu);
>   #endif
> diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
> index 77afe9e26a..b7ef0b8b3c 100644
> --- a/target/loongarch/cpu.h
> +++ b/target/loongarch/cpu.h
> @@ -152,6 +152,7 @@ extern const char * const fregnames[];
>   
>   #define N_IRQS      14
>   #define IRQ_TIMER   11
> +#define IRQ_IPI     12
>   
>   /*
>    * LoongArch cpu has 4 priv level, now only 2 mode used.


ATB,

Mark.

