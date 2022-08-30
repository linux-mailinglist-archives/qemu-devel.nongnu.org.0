Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A8D5A70EE
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 00:41:25 +0200 (CEST)
Received: from localhost ([::1]:43940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT9v9-0006yv-Pd
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 18:41:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oT9tK-0004dG-LX; Tue, 30 Aug 2022 18:39:30 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:59729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oT9tG-0000rG-Ol; Tue, 30 Aug 2022 18:39:29 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 37C0F7462D3;
 Wed, 31 Aug 2022 00:39:23 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id E77017461AE; Wed, 31 Aug 2022 00:39:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id E3692745702;
 Wed, 31 Aug 2022 00:39:22 +0200 (CEST)
Date: Wed, 31 Aug 2022 00:39:22 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 07/10] hw/isa/vt82c686: Instantiate PM function in
 host device
In-Reply-To: <20220830190048.67448-8-shentey@gmail.com>
Message-ID: <a41e60b2-7e36-fd5a-e440-1a5b20bf2543@eik.bme.hu>
References: <20220830190048.67448-1-shentey@gmail.com>
 <20220830190048.67448-8-shentey@gmail.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 30 Aug 2022, Bernhard Beschow wrote:
> The PM controller has activity bits which monitor activity of other
> built-in devices in the host device.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
> hw/isa/vt82c686.c         | 12 ++++++++++++
> hw/mips/fuloong2e.c       |  2 +-
> hw/ppc/pegasos2.c         |  3 +--
> include/hw/isa/vt82c686.h |  2 --
> 4 files changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index 6aba7f29de..4e66570655 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -40,6 +40,9 @@
> #define TYPE_VIA_PM "via-pm"
> OBJECT_DECLARE_SIMPLE_TYPE(ViaPMState, VIA_PM)
>
> +#define TYPE_VT82C686B_PM "vt82c686b-pm"
> +#define TYPE_VT8231_PM "vt8231-pm"

These defines should be further down before vt82c686b_pm_init_info and 
vt8231_pm_init_info respectively to keep object class definitions 
together. Here the generic abstract superclass is defined, followed be the 
specific chips so it's too early to define these at this point.

Regards,
BALATON Zoltan

> +
> struct ViaPMState {
>     PCIDevice dev;
>     MemoryRegion io;
> @@ -548,6 +551,7 @@ struct ViaISAState {
>     ViaSuperIOState via_sio;
>     PCIIDEState ide;
>     UHCIState uhci[2];
> +    ViaPMState pm;
> };
>
> static const VMStateDescription vmstate_via = {
> @@ -641,6 +645,12 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
>             return;
>         }
>     }
> +
> +    /* Function 4: Power Management */
> +    qdev_prop_set_int32(DEVICE(&s->pm), "addr", d->devfn + 4);
> +    if (!qdev_realize(DEVICE(&s->pm), BUS(pci_bus), errp)) {
> +        return;
> +    }
> }
>
> /* TYPE_VT82C686B_ISA */
> @@ -683,6 +693,7 @@ static void vt82c686b_init(Object *obj)
>     ViaISAState *s = VIA_ISA(obj);
>
>     object_initialize_child(obj, "sio", &s->via_sio, TYPE_VT82C686B_SUPERIO);
> +    object_initialize_child(obj, "pm", &s->pm, TYPE_VT82C686B_PM);
> }
>
> static void vt82c686b_class_init(ObjectClass *klass, void *data)
> @@ -746,6 +757,7 @@ static void vt8231_init(Object *obj)
>     ViaISAState *s = VIA_ISA(obj);
>
>     object_initialize_child(obj, "sio", &s->via_sio, TYPE_VT8231_SUPERIO);
> +    object_initialize_child(obj, "pm", &s->pm, TYPE_VT8231_PM);
> }
>
> static void vt8231_class_init(ObjectClass *klass, void *data)
> diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
> index dc92223b76..377108d313 100644
> --- a/hw/mips/fuloong2e.c
> +++ b/hw/mips/fuloong2e.c
> @@ -208,7 +208,7 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
>     dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "ide"));
>     pci_ide_create_devs(dev);
>
> -    dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 4), TYPE_VT82C686B_PM);
> +    dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "pm"));
>     *i2c_bus = I2C_BUS(qdev_get_child_bus(DEVICE(dev), "i2c"));
>
>     /* Audio support */
> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
> index 85cca6f7a6..e32944ee2b 100644
> --- a/hw/ppc/pegasos2.c
> +++ b/hw/ppc/pegasos2.c
> @@ -168,8 +168,7 @@ static void pegasos2_init(MachineState *machine)
>     dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "ide"));
>     pci_ide_create_devs(dev);
>
> -    /* VT8231 function 4: Power Management Controller */
> -    dev = pci_create_simple(pci_bus, PCI_DEVFN(12, 4), TYPE_VT8231_PM);
> +    dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "pm"));
>     i2c_bus = I2C_BUS(qdev_get_child_bus(DEVICE(dev), "i2c"));
>     spd_data = spd_data_generate(DDR, machine->ram_size);
>     smbus_eeprom_init_one(i2c_bus, 0x57, spd_data);
> diff --git a/include/hw/isa/vt82c686.h b/include/hw/isa/vt82c686.h
> index 56ac141be3..559f7c8926 100644
> --- a/include/hw/isa/vt82c686.h
> +++ b/include/hw/isa/vt82c686.h
> @@ -4,9 +4,7 @@
> #include "hw/pci/pci.h"
>
> #define TYPE_VT82C686B_ISA "vt82c686b-isa"
> -#define TYPE_VT82C686B_PM "vt82c686b-pm"
> #define TYPE_VT8231_ISA "vt8231-isa"
> -#define TYPE_VT8231_PM "vt8231-pm"
> #define TYPE_VIA_AC97 "via-ac97"
> #define TYPE_VIA_MC97 "via-mc97"
>
>

