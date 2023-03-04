Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAE96AA9CD
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 14:13:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYRgL-00049x-DB; Sat, 04 Mar 2023 08:12:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pYRgI-000499-Kx; Sat, 04 Mar 2023 08:12:10 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pYRgG-0001Lx-Gp; Sat, 04 Mar 2023 08:12:10 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 420B27462DB;
 Sat,  4 Mar 2023 14:11:55 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 7EF057457E7; Sat,  4 Mar 2023 14:11:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 7A4647456E3;
 Sat,  4 Mar 2023 14:11:54 +0100 (CET)
Date: Sat, 4 Mar 2023 14:11:54 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
 Artyom Tarasenko <atar4qemu@gmail.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Paul Burton <paulburton@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Aurelien Jarno <aurelien@aurel32.net>, 
 =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>, 
 Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 1/5] hw/isa/vt82c686: Fix wiring of PIC -> CPU
 interrupt
In-Reply-To: <20230304114043.121024-2-shentey@gmail.com>
Message-ID: <fd8029bc-b574-6260-3ae1-c65b344ed04f@eik.bme.hu>
References: <20230304114043.121024-1-shentey@gmail.com>
 <20230304114043.121024-2-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sat, 4 Mar 2023, Bernhard Beschow wrote:
> Commit bb98e0f59cde ("hw/isa/vt82c686: Remove intermediate IRQ forwarder")
> passes s->cpu_intr to i8259_init() in via_isa_realize() directly. However,
> s->cpu_intr isn't initialized yet since that happens after the south
> bridge's pci_realize_and_unref() in board code. Fix this by initializing s-
>> cpu_intr before realizing the south bridge.
>
> Fixes: bb98e0f59cde ("hw/isa/vt82c686: Remove intermediate IRQ forwarder")
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
> hw/isa/vt82c686.c   |  3 ++-
> hw/mips/fuloong2e.c |  9 +++++----
> hw/ppc/pegasos2.c   | 10 ++++++----
> 3 files changed, 13 insertions(+), 9 deletions(-)
>
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index f4c40965cd..8900d87f59 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -578,6 +578,8 @@ static void via_isa_init(Object *obj)
>     object_initialize_child(obj, "uhci2", &s->uhci[1], TYPE_VT82C686B_USB_UHCI);
>     object_initialize_child(obj, "ac97", &s->ac97, TYPE_VIA_AC97);
>     object_initialize_child(obj, "mc97", &s->mc97, TYPE_VIA_MC97);
> +
> +    qdev_init_gpio_out(DEVICE(obj), &s->cpu_intr, 1);
> }
>
> static const TypeInfo via_isa_info = {
> @@ -606,7 +608,6 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
>     ISABus *isa_bus;
>     int i;
>
> -    qdev_init_gpio_out(dev, &s->cpu_intr, 1);

I'm not a fan of useless asserts but in this case it's not useless and 
you'd need an assert here to make sure board code already connected the 
intertupt if that's required for this to work.

Regards,
BALATON Zoltan

>     isa_bus = isa_bus_new(dev, pci_address_space(d), pci_address_space_io(d),
>                           errp);
>
> diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
> index cfc8ca6ae4..30944f8fe7 100644
> --- a/hw/mips/fuloong2e.c
> +++ b/hw/mips/fuloong2e.c
> @@ -295,14 +295,15 @@ static void mips_fuloong2e_init(MachineState *machine)
>     pci_bus = bonito_init((qemu_irq *)&(env->irq[2]));
>
>     /* South bridge -> IP5 */
> -    pci_dev = pci_create_simple_multifunction(pci_bus,
> -                                              PCI_DEVFN(FULOONG2E_VIA_SLOT, 0),
> -                                              true, TYPE_VT82C686B_ISA);
> +    pci_dev = pci_new_multifunction(PCI_DEVFN(FULOONG2E_VIA_SLOT, 0), true,
> +                                    TYPE_VT82C686B_ISA);
> +    qdev_connect_gpio_out(DEVICE(pci_dev), 0, env->irq[5]);
> +    pci_realize_and_unref(pci_dev, pci_bus, &error_fatal);
> +
>     object_property_add_alias(OBJECT(machine), "rtc-time",
>                               object_resolve_path_component(OBJECT(pci_dev),
>                                                             "rtc"),
>                               "date");
> -    qdev_connect_gpio_out(DEVICE(pci_dev), 0, env->irq[5]);
>
>     dev = DEVICE(object_resolve_path_component(OBJECT(pci_dev), "ide"));
>     pci_ide_create_devs(PCI_DEVICE(dev));
> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
> index 7cc375df05..b0ada9c963 100644
> --- a/hw/ppc/pegasos2.c
> +++ b/hw/ppc/pegasos2.c
> @@ -159,13 +159,15 @@ static void pegasos2_init(MachineState *machine)
>     pci_bus = mv64361_get_pci_bus(pm->mv, 1);
>
>     /* VIA VT8231 South Bridge (multifunction PCI device) */
> -    via = OBJECT(pci_create_simple_multifunction(pci_bus, PCI_DEVFN(12, 0),
> -                                                 true, TYPE_VT8231_ISA));
> +    via = OBJECT(pci_new_multifunction(PCI_DEVFN(12, 0), true,
> +                                       TYPE_VT8231_ISA));
> +    qdev_connect_gpio_out(DEVICE(via), 0,
> +                          qdev_get_gpio_in_named(pm->mv, "gpp", 31));
> +    pci_realize_and_unref(PCI_DEVICE(via), pci_bus, &error_fatal);
> +
>     object_property_add_alias(OBJECT(machine), "rtc-time",
>                               object_resolve_path_component(via, "rtc"),
>                               "date");
> -    qdev_connect_gpio_out(DEVICE(via), 0,
> -                          qdev_get_gpio_in_named(pm->mv, "gpp", 31));
>
>     dev = PCI_DEVICE(object_resolve_path_component(via, "ide"));
>     pci_ide_create_devs(dev);
>

