Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9371B59FCF8
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 16:14:28 +0200 (CEST)
Received: from localhost ([::1]:50514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQr9G-0003Nb-Ad
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 10:14:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oQqpj-00056T-DU; Wed, 24 Aug 2022 09:54:18 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:56064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oQqpf-0007Lv-Sd; Wed, 24 Aug 2022 09:54:14 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 0D41A74817C;
 Wed, 24 Aug 2022 15:54:04 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 6D600748165; Wed, 24 Aug 2022 15:54:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 69C91745702;
 Wed, 24 Aug 2022 15:54:03 +0200 (CEST)
Date: Wed, 24 Aug 2022 15:54:03 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>, 
 Huacai Chen <chenhuacai@kernel.org>, qemu-ppc@nongnu.org
Subject: Re: [PATCH 4/9] hw/isa/vt82c686: QOM'ify via-ide creation
In-Reply-To: <20220822224355.11753-5-shentey@gmail.com>
Message-ID: <14e283f-7bbd-dd70-5458-af897cd7ff4a@eik.bme.hu>
References: <20220822224355.11753-1-shentey@gmail.com>
 <20220822224355.11753-5-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 23 Aug 2022, Bernhard Beschow wrote:
> The IDE function is closely tied to the ISA function (e.g. the IDE
> interrupt routing happens there), so it makes sense that the IDE
> function is instantiated within the southbridge itself. As a side effect,
> duplicated code in the boards is resolved.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
> configs/devices/mips64el-softmmu/default.mak |  1 -
> hw/isa/Kconfig                               |  1 +
> hw/isa/vt82c686.c                            | 18 ++++++++++++++++++
> hw/mips/fuloong2e.c                          |  3 ---
> hw/ppc/Kconfig                               |  1 -
> hw/ppc/pegasos2.c                            |  4 ----
> 6 files changed, 19 insertions(+), 9 deletions(-)
>
> diff --git a/configs/devices/mips64el-softmmu/default.mak b/configs/devices/mips64el-softmmu/default.mak
> index c610749ac1..d5188f7ea5 100644
> --- a/configs/devices/mips64el-softmmu/default.mak
> +++ b/configs/devices/mips64el-softmmu/default.mak
> @@ -1,7 +1,6 @@
> # Default configuration for mips64el-softmmu
>
> include ../mips-softmmu/common.mak
> -CONFIG_IDE_VIA=y
> CONFIG_FULOONG=y
> CONFIG_LOONGSON3V=y
> CONFIG_ATI_VGA=y
> diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
> index d42143a991..20de7e9294 100644
> --- a/hw/isa/Kconfig
> +++ b/hw/isa/Kconfig
> @@ -53,6 +53,7 @@ config VT82C686
>     select I8254
>     select I8257
>     select I8259
> +    select IDE_VIA
>     select MC146818RTC
>     select PARALLEL
>
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index 5582c0b179..37d9ed635d 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -17,6 +17,7 @@
> #include "hw/isa/vt82c686.h"
> #include "hw/pci/pci.h"
> #include "hw/qdev-properties.h"
> +#include "hw/ide/pci.h"
> #include "hw/isa/isa.h"
> #include "hw/isa/superio.h"
> #include "hw/intc/i8259.h"
> @@ -544,6 +545,7 @@ struct ViaISAState {
>     qemu_irq cpu_intr;
>     qemu_irq *isa_irqs;
>     ViaSuperIOState via_sio;
> +    PCIIDEState ide;
> };
>
> static const VMStateDescription vmstate_via = {
> @@ -556,10 +558,18 @@ static const VMStateDescription vmstate_via = {
>     }
> };
>
> +static void via_isa_init(Object *obj)
> +{
> +    ViaISAState *s = VIA_ISA(obj);
> +
> +    object_initialize_child(obj, "ide", &s->ide, "via-ide");
> +}
> +
> static const TypeInfo via_isa_info = {
>     .name          = TYPE_VIA_ISA,
>     .parent        = TYPE_PCI_DEVICE,
>     .instance_size = sizeof(ViaISAState),
> +    .instance_init = via_isa_init,
>     .abstract      = true,
>     .interfaces    = (InterfaceInfo[]) {
>         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
> @@ -583,6 +593,7 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
> {
>     ViaISAState *s = VIA_ISA(d);
>     DeviceState *dev = DEVICE(d);
> +    PCIBus *pci_bus = pci_get_bus(d);
>     qemu_irq *isa_irq;
>     ISABus *isa_bus;
>     int i;
> @@ -607,6 +618,13 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
>     if (!qdev_realize(DEVICE(&s->via_sio), BUS(isa_bus), errp)) {
>         return;
>     }
> +
> +    /* Function 1: IDE */
> +    qdev_prop_set_int32(DEVICE(&s->ide), "addr", d->devfn + 1);
> +    if (!qdev_realize(DEVICE(&s->ide), BUS(pci_bus), errp)) {
> +        return;
> +    }
> +    pci_ide_create_devs(PCI_DEVICE(&s->ide));

I'm not sure about moving pci_ide_create_devs() here. This is usally 
called from board code and only piix4 seems to do this. Maybe that's wrong 
because if all IDE devices did this then one machine could not have more 
than one different ide devices (like having an on-board ide and adding a 
pci ide controoler with -device) so this probably belongs to the board 
code to add devices to its default ide controller only as this is machine 
specific. Unless I'm wrong in which case somebody will correct me.

Regards,
BALATON Zoltan

> }
>
> /* TYPE_VT82C686B_ISA */
> diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
> index 5ee546f5f6..dae263c1e3 100644
> --- a/hw/mips/fuloong2e.c
> +++ b/hw/mips/fuloong2e.c
> @@ -205,9 +205,6 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
>                                           TYPE_VT82C686B_ISA);
>     qdev_connect_gpio_out(DEVICE(dev), 0, intc);
>
> -    dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 1), "via-ide");
> -    pci_ide_create_devs(dev);
> -
>     pci_create_simple(pci_bus, PCI_DEVFN(slot, 2), "vt82c686b-usb-uhci");
>     pci_create_simple(pci_bus, PCI_DEVFN(slot, 3), "vt82c686b-usb-uhci");
>
> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
> index 400511c6b7..18565e966b 100644
> --- a/hw/ppc/Kconfig
> +++ b/hw/ppc/Kconfig
> @@ -74,7 +74,6 @@ config PEGASOS2
>     bool
>     select MV64361
>     select VT82C686
> -    select IDE_VIA
>     select SMBUS_EEPROM
>     select VOF
> # This should come with VT82C686
> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
> index 61f4263953..2f59d08ad1 100644
> --- a/hw/ppc/pegasos2.c
> +++ b/hw/ppc/pegasos2.c
> @@ -165,10 +165,6 @@ static void pegasos2_init(MachineState *machine)
>     qdev_connect_gpio_out(DEVICE(dev), 0,
>                           qdev_get_gpio_in_named(pm->mv, "gpp", 31));
>
> -    /* VT8231 function 1: IDE Controller */
> -    dev = pci_create_simple(pci_bus, PCI_DEVFN(12, 1), "via-ide");
> -    pci_ide_create_devs(dev);
> -
>     /* VT8231 function 2-3: USB Ports */
>     pci_create_simple(pci_bus, PCI_DEVFN(12, 2), "vt82c686b-usb-uhci");
>     pci_create_simple(pci_bus, PCI_DEVFN(12, 3), "vt82c686b-usb-uhci");
>

