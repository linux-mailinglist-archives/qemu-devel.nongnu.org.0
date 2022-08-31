Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6575A834D
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 18:36:15 +0200 (CEST)
Received: from localhost ([::1]:33870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTQhJ-0001CQ-Vn
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 12:36:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oTQba-0003qz-IB; Wed, 31 Aug 2022 12:30:19 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:20868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oTQbX-0002Ow-GQ; Wed, 31 Aug 2022 12:30:17 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 5099A746324;
 Wed, 31 Aug 2022 18:30:10 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 150107462D3; Wed, 31 Aug 2022 18:30:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 13432745702;
 Wed, 31 Aug 2022 18:30:10 +0200 (CEST)
Date: Wed, 31 Aug 2022 18:30:10 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>, qemu-ppc@nongnu.org, 
 Huacai Chen <chenhuacai@kernel.org>, qemu-block@nongnu.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v4 12/12] hw/isa/vt82c686: Create rtc-time alias in boards
 instead
In-Reply-To: <20220831154605.12773-13-shentey@gmail.com>
Message-ID: <7627bf2-d76f-f178-6c5d-bd3cd56686ba@eik.bme.hu>
References: <20220831154605.12773-1-shentey@gmail.com>
 <20220831154605.12773-13-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
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

On Wed, 31 Aug 2022, Bernhard Beschow wrote:
> According to good QOM practice, an object should only deal with objects
> of its own sub tree. Having devices create an alias on the machine
> object doesn't respect this good practice. To resolve this, create the
> alias in the machine's code.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
> hw/isa/vt82c686.c   | 2 --
> hw/mips/fuloong2e.c | 4 ++++
> hw/ppc/pegasos2.c   | 4 ++++
> 3 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index 48cd4d0036..3f9bd0c04d 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -632,8 +632,6 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
>     if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), errp)) {
>         return;
>     }
> -    object_property_add_alias(qdev_get_machine(), "rtc-time", OBJECT(&s->rtc),
> -                              "date");
>     isa_connect_gpio_out(ISA_DEVICE(&s->rtc), 0, s->rtc.isairq);
>
>     for (i = 0; i < PCI_CONFIG_HEADER_SIZE; i++) {
> diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
> index 2d8723ab74..0f4cfe1188 100644
> --- a/hw/mips/fuloong2e.c
> +++ b/hw/mips/fuloong2e.c
> @@ -203,6 +203,10 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
>
>     via = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(slot, 0), true,
>                                           TYPE_VT82C686B_ISA);
> +    object_property_add_alias(qdev_get_machine(), "rtc-time",
> +                              object_resolve_path_component(OBJECT(via),
> +                                                            "rtc"),
> +                              "date");
>     qdev_connect_gpio_out(DEVICE(via), 0, intc);
>
>     dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "ide"));
> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
> index 09fdb7557f..f50e1d8b3f 100644
> --- a/hw/ppc/pegasos2.c
> +++ b/hw/ppc/pegasos2.c
> @@ -161,6 +161,10 @@ static void pegasos2_init(MachineState *machine)
>     /* VIA VT8231 South Bridge (multifunction PCI device) */
>     via = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(12, 0), true,
>                                           TYPE_VT8231_ISA);
> +    object_property_add_alias(qdev_get_machine(), "rtc-time",

I did not check it in previous version but Phillppe noted this 
qdev_get_machine() should be machine (the parameter to pegasos2_init) 
instead and I agree with that.

Also if you get rid of the now very much cut down 
vt82c686b_southbridge_init func in fuloong2e and just inline what's left 
of it at the only call site then the same machine pointer could be used 
there too and would be simpler then going through the function now that 
it's moved to via-isa mostly.

Sorry that this needs another respin but that's the last, I won't look at 
it again :-) You can also add to the whole series:

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

Regards,
BALATON Zoltan

> +                              object_resolve_path_component(OBJECT(via),
> +                                                            "rtc"),
> +                              "date");
>     qdev_connect_gpio_out(DEVICE(via), 0,
>                           qdev_get_gpio_in_named(pm->mv, "gpp", 31));
>
>

