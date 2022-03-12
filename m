Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 277384D6FC4
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Mar 2022 16:41:53 +0100 (CET)
Received: from localhost ([::1]:34478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nT3sN-0004hC-HC
	for lists+qemu-devel@lfdr.de; Sat, 12 Mar 2022 10:41:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nT3r4-0003zH-IB
 for qemu-devel@nongnu.org; Sat, 12 Mar 2022 10:40:30 -0500
Received: from [2001:41c9:1:41f::167] (port=39088
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nT3r1-0003ZE-Ve
 for qemu-devel@nongnu.org; Sat, 12 Mar 2022 10:40:29 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nT3qI-000C4O-07; Sat, 12 Mar 2022 15:39:46 +0000
Message-ID: <12b34313-faa7-2bca-06fe-af20889072fc@ilande.co.uk>
Date: Sat, 12 Mar 2022 15:40:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220310112725.570053-1-richard.henderson@linaro.org>
 <20220310112725.570053-49-richard.henderson@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220310112725.570053-49-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v5 48/48] hw/nios2: Machine with a Vectored Interrupt
 Controller
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/03/2022 11:27, Richard Henderson wrote:

> From: Amir Gonnen <amir.gonnen@neuroblade.ai>
> 
> Demonstrate how to use nios2 VIC on a machine.
> Introduce a new machine property to attach a VIC.
> 
> When VIC is present, let the CPU know that it should use the
> External Interrupt Interface instead of the Internal Interrupt Interface.
> The devices on the machine are attached to the VIC and not directly to cpu.
> To allow VIC update EIC fields, we set the "cpu" property of the VIC
> with a reference to the nios2 cpu.
> 
> Signed-off-by: Amir Gonnen <amir.gonnen@neuroblade.ai>
> Message-Id: <20220303153906.2024748-6-amir.gonnen@neuroblade.ai>
> [rth: Put a property on the 10m50-ghrd machine, rather than
>        create a new machine class.]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   hw/nios2/10m50_devboard.c | 61 +++++++++++++++++++++++++++++++++------
>   hw/nios2/Kconfig          |  1 +
>   2 files changed, 53 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/nios2/10m50_devboard.c b/hw/nios2/10m50_devboard.c
> index dda4ab2bf5..91383fb097 100644
> --- a/hw/nios2/10m50_devboard.c
> +++ b/hw/nios2/10m50_devboard.c
> @@ -27,6 +27,7 @@
>   
>   #include "hw/sysbus.h"
>   #include "hw/char/serial.h"
> +#include "hw/intc/nios2_vic.h"
>   #include "hw/qdev-properties.h"
>   #include "sysemu/sysemu.h"
>   #include "hw/boards.h"
> @@ -43,6 +44,8 @@ struct Nios2MachineState {
>       MemoryRegion phys_tcm_alias;
>       MemoryRegion phys_ram;
>       MemoryRegion phys_ram_alias;
> +
> +    bool vic;
>   };
>   
>   #define TYPE_NIOS2_MACHINE  MACHINE_TYPE_NAME("10m50-ghrd")
> @@ -81,10 +84,39 @@ static void nios2_10m50_ghrd_init(MachineState *machine)
>       memory_region_add_subregion(address_space_mem, 0xc0000000 + ram_base,
>                                   &nms->phys_ram_alias);
>   
> -    /* Create CPU -- FIXME */
> -    cpu = NIOS2_CPU(cpu_create(TYPE_NIOS2_CPU));
> -    for (i = 0; i < 32; i++) {
> -        irq[i] = qdev_get_gpio_in_named(DEVICE(cpu), "IRQ", i);
> +    /* Create CPU.  We need to set eic_present between init and realize. */
> +    cpu = NIOS2_CPU(object_new(TYPE_NIOS2_CPU));
> +
> +    /* Enable the External Interrupt Controller within the CPU. */
> +    cpu->eic_present = nms->vic;
> +
> +    /* Configure new exception vectors. */
> +    cpu->reset_addr = 0xd4000000;
> +    cpu->exception_addr = 0xc8000120;
> +    cpu->fast_tlb_miss_addr = 0xc0000100;
> +
> +    qdev_realize_and_unref(DEVICE(cpu), NULL, &error_fatal);
> +
> +    if (nms->vic) {
> +        DeviceState *dev = qdev_new(TYPE_NIOS2_VIC);
> +        MemoryRegion *dev_mr;
> +        qemu_irq cpu_irq;
> +
> +        object_property_set_link(OBJECT(dev), "cpu", OBJECT(cpu), &error_fatal);
> +        sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> +
> +        cpu_irq = qdev_get_gpio_in_named(DEVICE(cpu), "EIC", 0);
> +        sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, cpu_irq);
> +        for (int i = 0; i < 32; i++) {
> +            irq[i] = qdev_get_gpio_in(dev, i);
> +        }
> +
> +        dev_mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
> +        memory_region_add_subregion(address_space_mem, 0x18002000, dev_mr);
> +    } else {
> +        for (i = 0; i < 32; i++) {
> +            irq[i] = qdev_get_gpio_in_named(DEVICE(cpu), "IRQ", i);
> +        }
>       }
>   
>       /* Register: Altera 16550 UART */
> @@ -105,15 +137,22 @@ static void nios2_10m50_ghrd_init(MachineState *machine)
>       sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0xe0000880);
>       sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, irq[5]);
>   
> -    /* Configure new exception vectors and reset CPU for it to take effect. */
> -    cpu->reset_addr = 0xd4000000;
> -    cpu->exception_addr = 0xc8000120;
> -    cpu->fast_tlb_miss_addr = 0xc0000100;
> -
>       nios2_load_kernel(cpu, ram_base, ram_size, machine->initrd_filename,
>                         BINARY_DEVICE_TREE_FILE, NULL);
>   }
>   
> +static bool get_vic(Object *obj, Error **errp)
> +{
> +    Nios2MachineState *nms = NIOS2_MACHINE(obj);
> +    return nms->vic;
> +}
> +
> +static void set_vic(Object *obj, bool value, Error **errp)
> +{
> +    Nios2MachineState *nms = NIOS2_MACHINE(obj);
> +    nms->vic = value;
> +}
> +
>   static void nios2_10m50_ghrd_class_init(ObjectClass *oc, void *data)
>   {
>       MachineClass *mc = MACHINE_CLASS(oc);
> @@ -121,6 +160,10 @@ static void nios2_10m50_ghrd_class_init(ObjectClass *oc, void *data)
>       mc->desc = "Altera 10M50 GHRD Nios II design";
>       mc->init = nios2_10m50_ghrd_init;
>       mc->is_default = true;
> +
> +    object_class_property_add_bool(oc, "vic", get_vic, set_vic);
> +    object_class_property_set_description(oc, "vic",
> +        "Set on/off to enable/disable the Vectored Interrupt Controller");
>   }
>   
>   static const TypeInfo nios2_10m50_ghrd_type_info = {
> diff --git a/hw/nios2/Kconfig b/hw/nios2/Kconfig
> index b10ea640da..4748ae27b6 100644
> --- a/hw/nios2/Kconfig
> +++ b/hw/nios2/Kconfig
> @@ -3,6 +3,7 @@ config NIOS2_10M50
>       select NIOS2
>       select SERIAL
>       select ALTERA_TIMER
> +    select NIOS2_VIC
>   
>   config NIOS2_GENERIC_NOMMU
>       bool

I'm surprised that there isn't a way to remove the boiler-plate code around setting 
the bool "vic" property (when compared with qdev), but regardless:

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

