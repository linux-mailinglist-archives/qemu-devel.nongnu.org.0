Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BDA2E8CC8
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 16:16:33 +0100 (CET)
Received: from localhost ([::1]:33622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kw57Q-0006yI-Ab
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 10:16:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kw56M-0006Tx-Oh; Sun, 03 Jan 2021 10:15:26 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:53726
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kw56K-0003pv-4w; Sun, 03 Jan 2021 10:15:26 -0500
Received: from host86-148-34-1.range86-148.btcentralplus.com ([86.148.34.1]
 helo=[192.168.1.65]) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kw560-0000ql-F2; Sun, 03 Jan 2021 15:15:10 +0000
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210101231215.1870611-1-f4bug@amsat.org>
 <20210101231215.1870611-3-f4bug@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <3b45dfea-0534-b61f-8fef-a38b1b1a4236@ilande.co.uk>
Date: Sun, 3 Jan 2021 15:14:57 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210101231215.1870611-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.34.1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC PATCH 2/5] via-ide: Fix fuloong2e support
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.262,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-block@nongnu.org,
 Huacai Chen <chenhuacai@kernel.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/01/2021 23:12, Philippe Mathieu-Daudé wrote:

> From: Guenter Roeck <linux@roeck-us.net>
> 
> The IDE legacy mode emulation has been removed in commit 4ea98d317eb
> ("ide/via: Implement and use native PCI IDE mode") but some Linux
> kernels (probably including def_config) require legacy mode on the
> Fuloong2e so only emulating native mode did not turn out feasible.
> Add property to via-ide model to make the mode configurable, and set
> legacy mode for Fuloong2e.
> 
> [balaton: Use bit in flags for property, add comment for missing BAR4]
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> Tested-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Message-Id: <17a50e58e6baa26440c7dac83f07fdbba1595439.1609191252.git.balaton@eik.bme.hu>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/ide/via.c        | 19 +++++++++++++++++--
>   hw/mips/fuloong2e.c |  4 +++-
>   2 files changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/ide/via.c b/hw/ide/via.c
> index be09912b334..2d935b910f8 100644
> --- a/hw/ide/via.c
> +++ b/hw/ide/via.c
> @@ -26,6 +26,7 @@
>   
>   #include "qemu/osdep.h"
>   #include "hw/pci/pci.h"
> +#include "hw/qdev-properties.h"
>   #include "migration/vmstate.h"
>   #include "qemu/module.h"
>   #include "sysemu/dma.h"
> @@ -185,12 +186,19 @@ static void via_ide_realize(PCIDevice *dev, Error **errp)
>                             &d->bus[1], "via-ide1-cmd", 4);
>       pci_register_bar(dev, 3, PCI_BASE_ADDRESS_SPACE_IO, &d->cmd_bar[1]);
>   
> -    bmdma_setup_bar(d);
> -    pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
> +    if (!(d->flags & BIT(PCI_IDE_LEGACY_MODE))) {
> +        /* Missing BAR4 will make Linux driver fall back to legacy PIO mode */
> +        bmdma_setup_bar(d);
> +        pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
> +    }
>   
>       qdev_init_gpio_in(ds, via_ide_set_irq, 2);
>       for (i = 0; i < 2; i++) {
>           ide_bus_new(&d->bus[i], sizeof(d->bus[i]), ds, i, 2);
> +        if (d->flags & BIT(PCI_IDE_LEGACY_MODE)) {
> +            ide_init_ioport(&d->bus[i], NULL, i ? 0x170 : 0x1f0,
> +                            i ? 0x376 : 0x3f6);
> +        }
>           ide_init2(&d->bus[i], qdev_get_gpio_in(ds, i));

The if() here needs to be removed because the VIA IDE device starts up in legacy 
mode. If you look at the PCI bus master specification [1] the table at the top of 
page 3 is the breakdown of the PCI_CLASS_PROG byte: the configured value of 0x8a 
clearly indicates both channels are in legacy mode, which means that the PCI BARs are 
disabled and the controller is fixed to use the legacy IDE ioports with the option to 
switch up to native mode.

This is the main reason that the fuloong2e kernel panics on startup because its reads 
PCI_CLASS_PROG, discovers the controller is in legacy mode and then tries to access 
the legacy IDE ioports. Since the ioports are no longer mapped then the kernel crashes.

(Fun fact: you can change PCI_CLASS_PROG to 0x8f and watch Linux configure the VIA 
IDE controller in native mode: it gets quite far before it decides to eventually panic)

The fix here is simple: always enable the legacy IDE ioports. Zoltan mentioned he was 
concerned about having multiple IDE ports available, but this is not an issue for 2 
reasons:

1) Before any of Zoltan's patches were applied, the VIA IDE driver set PCI_CLASS_PROG 
to 0x8a with the legacy IDE ports always enabled, and there were no issues

2) PCI bus enumeration always leaves the low end of IO space free so that there are 
no clashes with legacy ISA devices which can't be freely relocated in IO space

>           bmdma_init(&d->bus[i], &d->bmdma[i], d);
> @@ -210,6 +218,12 @@ static void via_ide_exitfn(PCIDevice *dev)
>       }
>   }
>   
> +static Property via_ide_properties[] = {
> +    DEFINE_PROP_BIT("legacy-mode", PCIIDEState, flags, PCI_IDE_LEGACY_MODE,
> +                    false),
> +    DEFINE_PROP_END_OF_LIST(),
> +};

The other issue with the patch is that the legacy-mode property doesn't have anything 
to do with legacy mode: once the legacy IDE ioports are always enabled, the only 
thing this property controls is whether PCI BAR 4 is enabled. It doesn't select 
legacy mode since this is already the default, and neither does it force it by fixing 
the relevant bits in PCI_CLASS_PROG.

PCI BAR 4 is for configuring BMDMA and Linux checks to see if BAR 4 is non-zero: if 
it is, then it tries to use BMDMA which is the feature that actually crashes the 
fuloong2e Linux kernel. Hence my suggestion to rename the property to 
"x-disable-bdma": the x- prefix convention clearly marks this out as an experimental 
property whilst also correctly describing what is is used for, just in case it leaks 
into external qdev configuration.

>   static void via_ide_class_init(ObjectClass *klass, void *data)
>   {
>       DeviceClass *dc = DEVICE_CLASS(klass);
> @@ -223,6 +237,7 @@ static void via_ide_class_init(ObjectClass *klass, void *data)
>       k->device_id = PCI_DEVICE_ID_VIA_IDE;
>       k->revision = 0x06;
>       k->class_id = PCI_CLASS_STORAGE_IDE;
> +    device_class_set_props(dc, via_ide_properties);
>       set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>   }
>   
> diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
> index 45c596f4fe5..d334fde389f 100644
> --- a/hw/mips/fuloong2e.c
> +++ b/hw/mips/fuloong2e.c
> @@ -253,7 +253,9 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
>       /* Super I/O */
>       isa_create_simple(isa_bus, TYPE_VT82C686B_SUPERIO);
>   
> -    dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 1), "via-ide");
> +    dev = pci_new(PCI_DEVFN(slot, 1), "via-ide");
> +    qdev_prop_set_bit(&dev->qdev, "legacy-mode", true);
> +    pci_realize_and_unref(dev, pci_bus, &error_fatal);
>       pci_ide_create_devs(dev);
>   
>       pci_create_simple(pci_bus, PCI_DEVFN(slot, 2), "vt82c686b-usb-uhci");

I hope this helps to summarise all my comments from the previous thread. Given that 
it is not possible to set default PCI BAR addresses in QEMU due to the post-qdev PCI 
bus reset, the ultimate aim should be to devise a couple of routines pci_enable_bar() 
and pci_disable_bar() so that the new property can be removed and controller mode set 
directly from configuration space writes to PCI_CLASS_PROG. And as per my reply in 
the previous thread, I can't see this happening in the near future.

I would really like to see a version of this patchset merged, particularly the 
integration test which will be of clear value moving forward. I am not against hacks 
like this where they are necessary, but as part of the review process they need to be 
understood with the aim being for QEMU to provide the guest with the most coherent 
environment possible.


ATB,

Mark.

[1] PCI IDE Controller: http://www.bswd.com/pciide.pdf

