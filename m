Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B16202E2563
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 09:13:01 +0100 (CET)
Received: from localhost ([::1]:43924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksLk4-0002gv-As
	for lists+qemu-devel@lfdr.de; Thu, 24 Dec 2020 03:13:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ksLic-0002DD-Fz
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 03:11:31 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:21336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ksLiY-0002y4-0k
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 03:11:29 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 6626B746552;
 Thu, 24 Dec 2020 09:11:22 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 2D40F74646C; Thu, 24 Dec 2020 09:11:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 2B336746383;
 Thu, 24 Dec 2020 09:11:22 +0100 (CET)
Date: Thu, 24 Dec 2020 09:11:22 +0100 (CET)
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: Problems with irq mapping in qemu v5.2
In-Reply-To: <20201224053216.GA60462@roeck-us.net>
Message-ID: <88314cc3-6219-3dc-2981-279ef6442514@eik.bme.hu>
References: <3f0f8fc6-6148-a76e-1088-b7882b0bbcaf@roeck-us.net>
 <e90b9df0-5173-6e2b-3572-4f21ac318231@amsat.org>
 <2c478b3e-5098-1887-73b3-90f91a808ad8@ilande.co.uk>
 <1d33fa46-2079-ad40-d579-6e827543de50@roeck-us.net>
 <f04ae64-fa4a-2e21-1468-cf37315ec9b2@eik.bme.hu>
 <c64fe3a4-cd9c-b455-53ce-c53fb6cf0632@roeck-us.net>
 <8a3b2030-8ee6-fd56-6bfa-206457db84f@eik.bme.hu>
 <165973a-135e-3072-ee2c-afda64844770@eik.bme.hu>
 <20201224053216.GA60462@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, chenhuacai@kernel.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

On Wed, 23 Dec 2020, Guenter Roeck wrote:
> On Thu, Dec 24, 2020 at 02:34:07AM +0100, BALATON Zoltan wrote:
> [ ... ]
>>
>> If we need legacy mode then we may be able to emulate that by setting BARs
>> to legacy ports ignoring what values are written to them if legacy mode
>> config is set (which may be what the real chip does) and we already have
>> IRQs hard wired to legacy values so that would give us legacy and
>> half-native mode which is enough for both fuloong2e and pegasos2 but I'm not
>> sure how can we fix BARs in QEMU because that's also handled by generic PCI
>> code which I also don't want to break.
>
> The code below works for booting Linux while at the same time not affecting
> any other emulation. I don't claim it to be a perfect fix, and overloading
> the existing property is a bit hackish, but it does work.

Yes, maybe combining it with my original patch 1 to change secondary to 
flags to make it a bit cleaner would work for me. Then we would either 
only emulate legacy or half-native mode which is sufficient for these two 
machines we have. If Mark or others do not object it this time, I can 
update my patch and resubmit with this one to fix this issue, otherwise 
let's wait what idea do they have because I hate to spend time with 
something only to be discarded again. I think we don't need more complete 
emulation of this chip than this for now but if somebody wants to attempt 
that I don't mind as long as it does not break pegasos2.

Regards,
BALATON Zoltan

> Guenter
>
> ---
> From cf2d1d655f3fe4f88dc435a3ac4e1e6b6040d08b Mon Sep 17 00:00:00 2001
> From: Guenter Roeck <linux@roeck-us.net>
> Date: Wed, 23 Dec 2020 09:12:37 -0800
> Subject: [PATCH] via-ide: Fix fuloong2 support
>
> Fuloong2 needs to use legacy mode for IDE support to work with Linux.
> Add property to via-ide driver to make the mode configurable, and set
> legacy mode for Fuloong2.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> hw/ide/via.c        | 16 ++++++++++++++--
> hw/mips/fuloong2e.c |  4 +++-
> 2 files changed, 17 insertions(+), 3 deletions(-)
>
> diff --git a/hw/ide/via.c b/hw/ide/via.c
> index be09912b33..9e55e717e8 100644
> --- a/hw/ide/via.c
> +++ b/hw/ide/via.c
> @@ -26,6 +26,7 @@
>
> #include "qemu/osdep.h"
> #include "hw/pci/pci.h"
> +#include "hw/qdev-properties.h"
> #include "migration/vmstate.h"
> #include "qemu/module.h"
> #include "sysemu/dma.h"
> @@ -185,12 +186,17 @@ static void via_ide_realize(PCIDevice *dev, Error **errp)
>                           &d->bus[1], "via-ide1-cmd", 4);
>     pci_register_bar(dev, 3, PCI_BASE_ADDRESS_SPACE_IO, &d->cmd_bar[1]);
>
> -    bmdma_setup_bar(d);
> -    pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
> +    if (!d->secondary) {
> +        bmdma_setup_bar(d);
> +        pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
> +    }
>
>     qdev_init_gpio_in(ds, via_ide_set_irq, 2);
>     for (i = 0; i < 2; i++) {
>         ide_bus_new(&d->bus[i], sizeof(d->bus[i]), ds, i, 2);
> +        if (d->secondary) {
> +            ide_init_ioport(&d->bus[i], NULL, i ? 0x170 : 0x1f0, i ? 0x376 : 0x3f6);
> +        }
>         ide_init2(&d->bus[i], qdev_get_gpio_in(ds, i));
>
>         bmdma_init(&d->bus[i], &d->bmdma[i], d);
> @@ -210,6 +216,11 @@ static void via_ide_exitfn(PCIDevice *dev)
>     }
> }
>
> +static Property via_ide_properties[] = {
> +    DEFINE_PROP_UINT32("legacy_mode", PCIIDEState, secondary, 0), /* hijacked */
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> static void via_ide_class_init(ObjectClass *klass, void *data)
> {
>     DeviceClass *dc = DEVICE_CLASS(klass);
> @@ -223,6 +234,7 @@ static void via_ide_class_init(ObjectClass *klass, void *data)
>     k->device_id = PCI_DEVICE_ID_VIA_IDE;
>     k->revision = 0x06;
>     k->class_id = PCI_CLASS_STORAGE_IDE;
> +    device_class_set_props(dc, via_ide_properties);
>     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
> }
>
> diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
> index 23c526c69d..d0398d6266 100644
> --- a/hw/mips/fuloong2e.c
> +++ b/hw/mips/fuloong2e.c
> @@ -245,7 +245,9 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
>     /* Super I/O */
>     isa_create_simple(isa_bus, TYPE_VT82C686B_SUPERIO);
>
> -    dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 1), "via-ide");
> +    dev = pci_new(PCI_DEVFN(slot, 1), "via-ide");
> +    qdev_prop_set_uint32(&dev->qdev, "legacy_mode", 1);
> +    pci_realize_and_unref(dev, pci_bus, &error_fatal);
>     pci_ide_create_devs(dev);
>
>     pci_create_simple(pci_bus, PCI_DEVFN(slot, 2), "vt82c686b-usb-uhci");
>

