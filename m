Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7D15A7EC9
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 15:31:23 +0200 (CEST)
Received: from localhost ([::1]:55794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTNoQ-0003Kd-5A
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 09:31:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oTNhp-0002wd-UM; Wed, 31 Aug 2022 09:24:33 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:16846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oTNhn-0006mw-4I; Wed, 31 Aug 2022 09:24:32 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 4F6E774637E;
 Wed, 31 Aug 2022 15:24:29 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 9C804746324; Wed, 31 Aug 2022 15:24:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 9AF1D7462D3;
 Wed, 31 Aug 2022 15:24:28 +0200 (CEST)
Date: Wed, 31 Aug 2022 15:24:28 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Huacai Chen <chenhuacai@kernel.org>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH v3 08/10] hw/isa/vt82c686: Instantiate AC97 and MC97
 functions in host device
In-Reply-To: <20220831095914.2041-9-shentey@gmail.com>
Message-ID: <7e52791-f51d-9d5e-51b9-1bab67c58027@eik.bme.hu>
References: <20220831095914.2041-1-shentey@gmail.com>
 <20220831095914.2041-9-shentey@gmail.com>
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

On Wed, 31 Aug 2022, Bernhard Beschow wrote:
> The AC97 function's wakeup status is wired to the PM function and both
> the AC97 and MC97 interrupt routing is determined by the ISA function.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
> hw/isa/vt82c686.c   | 16 ++++++++++++++++
> hw/mips/fuloong2e.c |  4 ----
> hw/ppc/pegasos2.c   |  5 -----
> 3 files changed, 16 insertions(+), 9 deletions(-)
>
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index fcc9894e8b..691a467b2c 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -553,6 +553,8 @@ struct ViaISAState {
>     PCIIDEState ide;
>     UHCIState uhci[2];
>     ViaPMState pm;
> +    PCIDevice ac97;
> +    PCIDevice mc97;
> };
>
> static const VMStateDescription vmstate_via = {
> @@ -572,6 +574,8 @@ static void via_isa_init(Object *obj)
>     object_initialize_child(obj, "ide", &s->ide, "via-ide");
>     object_initialize_child(obj, "uhci1", &s->uhci[0], "vt82c686b-usb-uhci");
>     object_initialize_child(obj, "uhci2", &s->uhci[1], "vt82c686b-usb-uhci");
> +    object_initialize_child(obj, "ac97", &s->ac97, TYPE_VIA_AC97);
> +    object_initialize_child(obj, "mc97", &s->mc97, TYPE_VIA_MC97);
> }
>
> static const TypeInfo via_isa_info = {
> @@ -652,6 +656,18 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
>     if (!qdev_realize(DEVICE(&s->pm), BUS(pci_bus), errp)) {
>         return;
>     }
> +
> +    /* Function 5: AC97 Audio */
> +    qdev_prop_set_int32(DEVICE(&s->ac97), "addr", d->devfn + 5);
> +    if (!qdev_realize(DEVICE(&s->ac97), BUS(pci_bus), errp)) {
> +        return;
> +    }
> +
> +    /* Function 6: AC97 Modem */

Is this MC97 Modem instead?

Regards,
BALATON Zoltan

> +    qdev_prop_set_int32(DEVICE(&s->mc97), "addr", d->devfn + 6);
> +    if (!qdev_realize(DEVICE(&s->mc97), BUS(pci_bus), errp)) {
> +        return;
> +    }
> }
>
> /* TYPE_VT82C686B_ISA */
> diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
> index 377108d313..2d8723ab74 100644
> --- a/hw/mips/fuloong2e.c
> +++ b/hw/mips/fuloong2e.c
> @@ -210,10 +210,6 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
>
>     dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "pm"));
>     *i2c_bus = I2C_BUS(qdev_get_child_bus(DEVICE(dev), "i2c"));
> -
> -    /* Audio support */
> -    pci_create_simple(pci_bus, PCI_DEVFN(slot, 5), TYPE_VIA_AC97);
> -    pci_create_simple(pci_bus, PCI_DEVFN(slot, 6), TYPE_VIA_MC97);
> }
>
> /* Network support */
> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
> index e32944ee2b..09fdb7557f 100644
> --- a/hw/ppc/pegasos2.c
> +++ b/hw/ppc/pegasos2.c
> @@ -159,7 +159,6 @@ static void pegasos2_init(MachineState *machine)
>     pci_bus = mv64361_get_pci_bus(pm->mv, 1);
>
>     /* VIA VT8231 South Bridge (multifunction PCI device) */
> -    /* VT8231 function 0: PCI-to-ISA Bridge */
>     via = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(12, 0), true,
>                                           TYPE_VT8231_ISA);
>     qdev_connect_gpio_out(DEVICE(via), 0,
> @@ -173,10 +172,6 @@ static void pegasos2_init(MachineState *machine)
>     spd_data = spd_data_generate(DDR, machine->ram_size);
>     smbus_eeprom_init_one(i2c_bus, 0x57, spd_data);
>
> -    /* VT8231 function 5-6: AC97 Audio & Modem */
> -    pci_create_simple(pci_bus, PCI_DEVFN(12, 5), TYPE_VIA_AC97);
> -    pci_create_simple(pci_bus, PCI_DEVFN(12, 6), TYPE_VIA_MC97);
> -
>     /* other PC hardware */
>     pci_vga_init(pci_bus);
>
>

