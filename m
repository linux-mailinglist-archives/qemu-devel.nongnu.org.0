Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B50FA59CD58
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 02:47:43 +0200 (CEST)
Received: from localhost ([::1]:32898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQI50-0004AM-Ao
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 20:47:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oQI1o-0001fA-QF; Mon, 22 Aug 2022 20:44:24 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:33402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oQI1k-0001zs-Rl; Mon, 22 Aug 2022 20:44:22 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 11703747DFA;
 Tue, 23 Aug 2022 02:44:18 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 5A1F57461AE; Tue, 23 Aug 2022 02:44:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 58728745702;
 Tue, 23 Aug 2022 02:44:17 +0200 (CEST)
Date: Tue, 23 Aug 2022 02:44:17 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>, 
 Huacai Chen <chenhuacai@kernel.org>, qemu-ppc@nongnu.org
Subject: Re: [PATCH 7/9] hw/isa/vt82c686: QOM'ify ac97 and mc97 creation
In-Reply-To: <20220822224355.11753-8-shentey@gmail.com>
Message-ID: <21341fc1-51c8-af83-f034-a66c6399d45@eik.bme.hu>
References: <20220822224355.11753-1-shentey@gmail.com>
 <20220822224355.11753-8-shentey@gmail.com>
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

On Tue, 23 Aug 2022, Bernhard Beschow wrote:
> Resolves duplicate code in the boards.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
> hw/isa/vt82c686.c   | 16 ++++++++++++++++
> hw/mips/fuloong2e.c |  4 ----
> hw/ppc/pegasos2.c   |  4 ----
> 3 files changed, 16 insertions(+), 8 deletions(-)
>
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index b964d1a760..47f2fd2669 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -549,6 +549,8 @@ struct ViaISAState {
>     PCIIDEState ide;
>     UHCIState uhci[2];
>     ViaPMState pm;
> +    PCIDevice ac97;
> +    PCIDevice mc97;
> };
>
> static const VMStateDescription vmstate_via = {
> @@ -568,6 +570,8 @@ static void via_isa_init(Object *obj)
>     object_initialize_child(obj, "ide", &s->ide, "via-ide");
>     object_initialize_child(obj, "uhci1", &s->uhci[0], "vt82c686b-usb-uhci");
>     object_initialize_child(obj, "uhci2", &s->uhci[1], "vt82c686b-usb-uhci");
> +    object_initialize_child(obj, "ac97", &s->ac97, TYPE_VIA_AC97);
> +    object_initialize_child(obj, "mc97", &s->mc97, TYPE_VIA_MC97);
> }
>
> static const TypeInfo via_isa_info = {
> @@ -644,6 +648,18 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
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
> +    qdev_prop_set_int32(DEVICE(&s->mc97), "addr", d->devfn + 6);
> +    if (!qdev_realize(DEVICE(&s->mc97), BUS(pci_bus), errp)) {
> +        return;
> +    }
> }
>
> /* TYPE_VT82C686B_ISA */
> diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
> index f05474348f..ea1aef3049 100644
> --- a/hw/mips/fuloong2e.c
> +++ b/hw/mips/fuloong2e.c
> @@ -207,10 +207,6 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
>
>     dev = PCI_DEVICE(object_resolve_path_component(OBJECT(dev), "pm"));
>     *i2c_bus = I2C_BUS(qdev_get_child_bus(DEVICE(dev), "i2c"));
> -
> -    /* Audio support */
> -    pci_create_simple(pci_bus, PCI_DEVFN(slot, 5), TYPE_VIA_AC97);
> -    pci_create_simple(pci_bus, PCI_DEVFN(slot, 6), TYPE_VIA_MC97);
> }
>
> /* Network support */
> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
> index 4e29e42fba..89ef4aed8b 100644
> --- a/hw/ppc/pegasos2.c
> +++ b/hw/ppc/pegasos2.c
> @@ -171,10 +171,6 @@ static void pegasos2_init(MachineState *machine)
>     spd_data = spd_data_generate(DDR, machine->ram_size);
>     smbus_eeprom_init_one(i2c_bus, 0x57, spd_data);
>
> -    /* VT8231 function 5-6: AC97 Audio & Modem */
> -    pci_create_simple(pci_bus, PCI_DEVFN(12, 5), TYPE_VIA_AC97);
> -    pci_create_simple(pci_bus, PCI_DEVFN(12, 6), TYPE_VIA_MC97);
> -

This removes the last function created here so the comment above saying:
/* VT8231 function 0: PCI-to-ISA Bridge */
is now stale and may be removed as well.

Regards,
BALATON Zoltan

>     /* other PC hardware */
>     pci_vga_init(pci_bus);
>
>

