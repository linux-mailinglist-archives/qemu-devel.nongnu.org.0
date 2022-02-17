Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F62C4B95DE
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 03:23:58 +0100 (CET)
Received: from localhost ([::1]:42838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKWSa-0005gF-Pi
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 21:23:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nKWR9-0004qg-Vq
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 21:22:27 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:17651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nKWR5-00011U-VE
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 21:22:27 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id D4BA37457EF;
 Thu, 17 Feb 2022 03:22:19 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id A8D8B745712; Thu, 17 Feb 2022 03:22:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id A72D57456E3;
 Thu, 17 Feb 2022 03:22:19 +0100 (CET)
Date: Thu, 17 Feb 2022 03:22:19 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
Subject: Re: [PATCH v3 7/7] hw/mips/gt64xxx_pci: Resolve gt64120_register()
In-Reply-To: <20220216224519.157233-8-shentey@gmail.com>
Message-ID: <28b9c78c-e54a-157a-c42b-b88e465ff12@eik.bme.hu>
References: <20220216224519.157233-1-shentey@gmail.com>
 <20220216224519.157233-8-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 16 Feb 2022, Bernhard Beschow wrote:
> Now that gt64120_register() lost its pic parameter, there is an
> opportunity to remove it. gt64120_register() is old style by wrapping
> qdev API, and the new style is to use qdev directly. So take the
> opportunity and modernize the code.
>
> Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
> hw/mips/gt64xxx_pci.c  | 21 ++++-----------------
> hw/mips/malta.c        | 13 ++++++++-----
> include/hw/mips/mips.h |  3 ---
> 3 files changed, 12 insertions(+), 25 deletions(-)

Very good but maybe it could be simplified even further, see below.

> diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
> index eb205d6d70..e0ff1b5566 100644
> --- a/hw/mips/gt64xxx_pci.c
> +++ b/hw/mips/gt64xxx_pci.c
> @@ -26,7 +26,6 @@
> #include "qapi/error.h"
> #include "qemu/units.h"
> #include "qemu/log.h"
> -#include "hw/mips/mips.h"
> #include "hw/pci/pci.h"
> #include "hw/pci/pci_host.h"
> #include "migration/vmstate.h"
> @@ -1151,30 +1150,18 @@ static void gt64120_reset(DeviceState *dev)
> static void gt64120_realize(DeviceState *dev, Error **errp)
> {
>     GT64120State *s = GT64120_PCI_HOST_BRIDGE(dev);
> +    PCIHostState *phb = PCI_HOST_BRIDGE(dev);
>
>     memory_region_init_io(&s->ISD_mem, OBJECT(dev), &isd_mem_ops, s,
>                           "gt64120-isd", 0x1000);
> -}
> -
> -PCIBus *gt64120_register(void)
> -{
> -    GT64120State *d;
> -    PCIHostState *phb;
> -    DeviceState *dev;
> -
> -    dev = qdev_new(TYPE_GT64120_PCI_HOST_BRIDGE);
> -    d = GT64120_PCI_HOST_BRIDGE(dev);
> -    phb = PCI_HOST_BRIDGE(dev);
> -    memory_region_init(&d->pci0_mem, OBJECT(dev), "pci0-mem", 4 * GiB);
> -    address_space_init(&d->pci0_mem_as, &d->pci0_mem, "pci0-mem");
> +    memory_region_init(&s->pci0_mem, OBJECT(dev), "pci0-mem", 4 * GiB);
> +    address_space_init(&s->pci0_mem_as, &s->pci0_mem, "pci0-mem");
>     phb->bus = pci_root_bus_new(dev, "pci",
> -                                &d->pci0_mem,
> +                                &s->pci0_mem,
>                                 get_system_io(),
>                                 PCI_DEVFN(18, 0), TYPE_PCI_BUS);
> -    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>
>     pci_create_simple(phb->bus, PCI_DEVFN(0, 0), "gt64120_pci");
> -    return phb->bus;
> }
>
> static void gt64120_pci_realize(PCIDevice *d, Error **errp)
> diff --git a/hw/mips/malta.c b/hw/mips/malta.c
> index 13254dbc89..16fdaed3db 100644
> --- a/hw/mips/malta.c
> +++ b/hw/mips/malta.c
> @@ -38,6 +38,7 @@
> #include "hw/mips/mips.h"
> #include "hw/mips/cpudevs.h"
> #include "hw/pci/pci.h"
> +#include "hw/pci/pci_host.h"
> #include "qemu/log.h"
> #include "hw/mips/bios.h"
> #include "hw/ide.h"
> @@ -1230,7 +1231,7 @@ void mips_malta_init(MachineState *machine)
>     const size_t smbus_eeprom_size = 8 * 256;
>     uint8_t *smbus_eeprom_buf = g_malloc0(smbus_eeprom_size);
>     uint64_t kernel_entry, bootloader_run_addr;
> -    PCIBus *pci_bus;
> +    PCIHostState *phb;
>     ISABus *isa_bus;
>     qemu_irq cbus_irq, i8259_irq;
>     I2CBus *smbus;
> @@ -1390,7 +1391,9 @@ void mips_malta_init(MachineState *machine)
>     stl_p(memory_region_get_ram_ptr(bios_copy) + 0x10, 0x00000420);
>
>     /* Northbridge */
> -    pci_bus = gt64120_register();
> +    dev = qdev_new("gt64120");
> +    phb = PCI_HOST_BRIDGE(dev);
> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);

Since no need for setting properties you could do qdev_new and realize in 
one step with sysbus_create_simple and then get the bus from it so no need 
for going through phb either. Something like:

dev = sysbus_create_simple("gt64120", -1. 0);
pci_bus = PCI_BUS(qdev_get_child_bus(dev, "pci"));

should work with less changes.

Regards,
BALATON Zoltan

>     /*
>      * The whole address space decoded by the GT-64120A doesn't generate
>      * exception when accessing invalid memory. Create an empty slot to
> @@ -1399,7 +1402,7 @@ void mips_malta_init(MachineState *machine)
>     empty_slot_init("GT64120", 0, 0x20000000);
>
>     /* Southbridge */
> -    dev = piix4_create(pci_bus, &isa_bus, &smbus);
> +    dev = piix4_create(phb->bus, &isa_bus, &smbus);
>
>     /* Interrupt controller */
>     qdev_connect_gpio_out_named(dev, "intr", 0, i8259_irq);
> @@ -1414,10 +1417,10 @@ void mips_malta_init(MachineState *machine)
>     isa_create_simple(isa_bus, TYPE_FDC37M81X_SUPERIO);
>
>     /* Network card */
> -    network_init(pci_bus);
> +    network_init(phb->bus);
>
>     /* Optional PCI video card */
> -    pci_vga_init(pci_bus);
> +    pci_vga_init(phb->bus);
> }
>
> static void mips_malta_instance_init(Object *obj)
> diff --git a/include/hw/mips/mips.h b/include/hw/mips/mips.h
> index ff88942e63..101799f7d3 100644
> --- a/include/hw/mips/mips.h
> +++ b/include/hw/mips/mips.h
> @@ -9,9 +9,6 @@
>
> #include "exec/memory.h"
>
> -/* gt64xxx.c */
> -PCIBus *gt64120_register(void);
> -
> /* bonito.c */
> PCIBus *bonito_init(qemu_irq *pic);
>
>

