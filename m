Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF66648F73D
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Jan 2022 15:05:17 +0100 (CET)
Received: from localhost ([::1]:47766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8jgC-0004XZ-AD
	for lists+qemu-devel@lfdr.de; Sat, 15 Jan 2022 09:05:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1n8jbt-0002vq-Gt
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 09:00:51 -0500
Received: from [2001:41c9:1:41f::167] (port=48792
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1n8jbp-00069O-B1
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 09:00:47 -0500
Received: from [2a00:23c4:8ba0:4900:614:7796:ec2b:4f88]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1n8jbG-00063D-4Z; Sat, 15 Jan 2022 14:00:14 +0000
Message-ID: <901dffa0-84bb-5f54-4ab5-4e5b97e23d33@ilande.co.uk>
Date: Sat, 15 Jan 2022 14:00:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220108091419.2027710-1-yangxiaojuan@loongson.cn>
 <20220108091419.2027710-22-yangxiaojuan@loongson.cn>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220108091419.2027710-22-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:4900:614:7796:ec2b:4f88
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC PATCH v4 21/30] hw/loongarch: Add irq hierarchy for the
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

> This patch add the irq hierarchy for the virt board.
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   hw/loongarch/loongson3.c   | 85 ++++++++++++++++++++++++++++++++++++++
>   include/hw/pci-host/ls7a.h | 13 ++++++
>   2 files changed, 98 insertions(+)
> 
> diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
> index 6e796c2c08..cc7ee02003 100644
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
>   static void loongarch_cpu_reset(void *opaque)
> @@ -93,6 +97,84 @@ static void loongarch_cpu_set_irq(void *opaque, int irq, int level)
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
> +        memory_region_add_subregion_overlap(env->system_iocsr, ENABLE_OFFSET,
> +                                            sysbus_mmio_get_region(d, cpu * 4 + 1), 1);
> +        memory_region_add_subregion_overlap(env->system_iocsr, IPMAP_OFFSET,
> +                                            sysbus_mmio_get_region(d, cpu * 4 + 2), 1);
> +        memory_region_add_subregion_overlap(env->system_iocsr, COREMAP_OFFSET,
> +                                            sysbus_mmio_get_region(d, cpu * 4 + 3), 1);

This _overlap() doesn't look right: since all of these regions are contained within 
env->system_iocsr then I'd expect to see just the top memory_region_add_subregion() 
map env->system_iocsr into the CPU space.

Possibly I've misunderstood something about how these registers appear since I had a 
similar question earlier.

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
> +                                sysbus_mmio_get_region(d, 0));
> +    memory_region_add_subregion_overlap(get_system_memory(),
> +                                        LS7A_IOAPIC_REG_BASE + PCH_PIC_ROUTE_ENTRY_OFFSET,
> +                                        sysbus_mmio_get_region(d, 1), 1);

And also here - I can't quite understand what is happening here. Perhaps you could 
supply the output of "info mtree" highlighting the relevant entries here and above?

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
> @@ -145,6 +227,9 @@ static void loongarch_init(MachineState *machine)
>                                get_system_io(), 0, LOONGARCH_ISA_IO_SIZE);
>       memory_region_add_subregion(get_system_memory(), LOONGARCH_ISA_IO_BASE,
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

