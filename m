Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D0C4AA918
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 14:20:04 +0100 (CET)
Received: from localhost ([::1]:42478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGKyx-0002nZ-Mh
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 08:20:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nGKvJ-0001jN-Q1
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 08:16:17 -0500
Received: from [2001:41c9:1:41f::167] (port=48744
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nGKvH-0002mN-H1
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 08:16:17 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nGKui-0009di-OV; Sat, 05 Feb 2022 13:15:44 +0000
Message-ID: <7eef286b-8bf3-f913-2cbc-2e3ffa506509@ilande.co.uk>
Date: Sat, 5 Feb 2022 13:16:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220128034412.1262452-1-yangxiaojuan@loongson.cn>
 <20220128034412.1262452-22-yangxiaojuan@loongson.cn>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220128034412.1262452-22-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC PATCH v5 21/30] hw/loongarch: Add irq hierarchy for the
 system
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

> This patch add the irq hierarchy for the virt board.
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   hw/loongarch/loongson3.c   | 88 ++++++++++++++++++++++++++++++++++++++
>   include/hw/pci-host/ls7a.h | 13 ++++++
>   2 files changed, 101 insertions(+)
> 
> diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
> index e79d86928d..e0909d4c82 100644
> --- a/hw/loongarch/loongson3.c
> +++ b/hw/loongarch/loongson3.c
> @@ -15,6 +15,10 @@
>   #include "sysemu/runstate.h"
>   #include "sysemu/reset.h"
>   #include "hw/loongarch/loongarch.h"
> +#include "hw/intc/loongarch_ipi.h"
> +#include "hw/intc/loongarch_extioi.h"
> +#include "hw/intc/loongarch_pch_pic.h"
> +#include "hw/intc/loongarch_pch_msi.h"
>   #include "hw/pci-host/ls7a.h"
>   
>   #include "target/loongarch/cpu.h"
> @@ -87,6 +91,87 @@ static void loongarch_cpu_set_irq(void *opaque, int irq, int level)
>       }
>   }
>   
> +static void loongarch_irq_init(LoongArchMachineState *lams)
> +{
> +    MachineState *ms = MACHINE(lams);
> +    DeviceState *ipi, *extioi, *pch_pic, *pch_msi, *cpudev;
> +    SysBusDevice *d;
> +    int cpu, pin, i;
> +    unsigned long ipi_addr;
> +    CPULoongArchState *env;
> +
> +    ipi = qdev_new(TYPE_LOONGARCH_IPI);
> +    d = SYS_BUS_DEVICE(ipi);
> +    sysbus_realize_and_unref(d, &error_fatal);
> +    for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
> +        cpudev = DEVICE(qemu_get_cpu(cpu));
> +        env = (qemu_get_cpu(cpu))->env_ptr;

> +        ipi_addr = SMP_IPI_MAILBOX + cpu * 0x100;
> +        memory_region_add_subregion(env->system_iocsr, ipi_addr,
> +                                    sysbus_mmio_get_region(d, cpu));

This part here setting the ipi_addr offset in env->system_iocsr should be in the new 
loongson_cpu_init() function as it is being done per cpu.

> +        /* connect ipi irq to cpu irq */
> +        qdev_connect_gpio_out(ipi, cpu, qdev_get_gpio_in(cpudev, IRQ_IPI));
> +    }
> +
> +    extioi = qdev_new(TYPE_LOONGARCH_EXTIOI);
> +    d = SYS_BUS_DEVICE(extioi);
> +    sysbus_realize_and_unref(d, &error_fatal);
> +    for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
> +        env = (qemu_get_cpu(cpu))->env_ptr;
> +        memory_region_add_subregion(env->system_iocsr, APIC_BASE,
> +                                    sysbus_mmio_get_region(d, cpu * 4));
> +        memory_region_add_subregion(env->system_iocsr, IPMAP_OFFSET,
> +                                    sysbus_mmio_get_region(d, cpu * 4 + 1));
> +        memory_region_add_subregion(env->system_iocsr, BOUNCE_OFFSET,
> +                                    sysbus_mmio_get_region(d, cpu * 4 + 2));
> +        memory_region_add_subregion(env->system_iocsr, COREMAP_OFFSET,
> +                                    sysbus_mmio_get_region(d, cpu * 4 + 3));

And same here as this is also being configured per-cpu. Switching this over to use a 
single container memory region as per my comment on patch 20 also means you only need 
a single memory_region_add_subregion() too.

> +    }
> +
> +    for (i = 0; i < EXTIOI_IRQS; i++) {
> +        sysbus_connect_irq(d, i, qdev_get_gpio_in(extioi, i));
> +    }
> +
> +    /*
> +     * connect ext irq to the cpu irq
> +     * cpu_pin[9:2] <= intc_pin[7:0]
> +     */
> +    for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
> +        cpudev = DEVICE(qemu_get_cpu(cpu));
> +        for (pin = 0; pin < LS3A_INTC_IP; pin++) {
> +            qdev_connect_gpio_out(extioi, (cpu * 8 + pin),
> +                                  qdev_get_gpio_in(cpudev, pin + 2));
> +        }
> +    }
> +
> +    pch_pic = qdev_new(TYPE_LOONGARCH_PCH_PIC);
> +    d = SYS_BUS_DEVICE(pch_pic);
> +    sysbus_realize_and_unref(d, &error_fatal);
> +    memory_region_add_subregion(get_system_memory(), LS7A_IOAPIC_REG_BASE,
> +                            sysbus_mmio_get_region(d, 0));
> +    memory_region_add_subregion(get_system_memory(),
> +                            LS7A_IOAPIC_REG_BASE + PCH_PIC_ROUTE_ENTRY_OFFSET,
> +                            sysbus_mmio_get_region(d, 1));
> +    memory_region_add_subregion(get_system_memory(),
> +                            LS7A_IOAPIC_REG_BASE + PCH_PIC_INT_STATUS_LO,
> +                            sysbus_mmio_get_region(d, 2));
> +
> +    /* Connect 64 pch_pic irqs to extioi */
> +    for (int i = 0; i < PCH_PIC_IRQ_NUM; i++) {
> +        sysbus_connect_irq(d, i, qdev_get_gpio_in(extioi, i));
> +    }
> +
> +    pch_msi = qdev_new(TYPE_LOONGARCH_PCH_MSI);
> +    d = SYS_BUS_DEVICE(pch_msi);
> +    sysbus_realize_and_unref(d, &error_fatal);
> +    sysbus_mmio_map(d, 0, LS7A_PCH_MSI_ADDR_LOW);
> +    for (i = 0; i < PCH_MSI_IRQ_NUM; i++) {
> +        /* Connect 192 pch_msi irqs to extioi */
> +        sysbus_connect_irq(d, i,
> +                           qdev_get_gpio_in(extioi, i + PCH_MSI_IRQ_START));
> +    }
> +}
> +
>   static void loongarch_init(MachineState *machine)
>   {
>       const char *cpu_model = machine->cpu_type;
> @@ -146,6 +231,9 @@ static void loongarch_init(MachineState *machine)
>                                get_system_io(), 0, LOONGARCH_ISA_IO_SIZE);
>       memory_region_add_subregion(address_space_mem, LOONGARCH_ISA_IO_BASE,
>                                   &lams->isa_io);
> +
> +    /* Initialize the IO interrupt subsystem */
> +    loongarch_irq_init(lams);
>   }
>   
>   static void loongarch_class_init(ObjectClass *oc, void *data)
> diff --git a/include/hw/pci-host/ls7a.h b/include/hw/pci-host/ls7a.h
> index 6adbfbe443..447450828e 100644
> --- a/include/hw/pci-host/ls7a.h
> +++ b/include/hw/pci-host/ls7a.h
> @@ -24,6 +24,19 @@
>   #define LS7A_PCI_IO_BASE         0x18004000UL
>   #define LS7A_PCI_IO_SIZE         0xC000
>   
> +#define LS7A_PCH_REG_BASE       0x10000000UL
> +#define LS7A_IOAPIC_REG_BASE    (LS7A_PCH_REG_BASE)
> +#define LS7A_PCH_MSI_ADDR_LOW   0x2FF00000UL
> +
> +/*
> + * According to the kernel pch irq start from 64 offset
> + * 0 ~ 16 irqs used for non-pci device while 16 ~ 64 irqs
> + * used for pci device.
> + */
> +#define PCH_PIC_IRQ_OFFSET      64
> +#define LS7A_DEVICE_IRQS        16
> +#define LS7A_PCI_IRQS           48
> +
>   struct LS7APCIState {
>       /*< private >*/
>       PCIDevice parent_obj;


ATB,

Mark.

