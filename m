Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C334C2E6AED
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 21:52:34 +0100 (CET)
Received: from localhost ([::1]:46790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktzVJ-0001sd-AL
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 15:52:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ktzTO-0001I4-BC
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 15:50:34 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:18236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ktzTI-0007tB-PV
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 15:50:33 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 16DA074646C;
 Mon, 28 Dec 2020 21:50:24 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id B8B3174645F; Mon, 28 Dec 2020 21:50:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id B6F1C74645B;
 Mon, 28 Dec 2020 21:50:23 +0100 (CET)
Date: Mon, 28 Dec 2020 21:50:23 +0100 (CET)
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v2 2/2] via-ide: Fix fuloong2e support
In-Reply-To: <a7b14637-4a3e-1635-a0c2-da9ee48022a8@ilande.co.uk>
Message-ID: <ab55636b-9ba7-6e38-8d62-31ef1a11c455@eik.bme.hu>
References: <cover.1609107222.git.balaton@eik.bme.hu>
 <8e58807dd2ba46866e7f152244e4541e6425177d.1609107222.git.balaton@eik.bme.hu>
 <a7b14637-4a3e-1635-a0c2-da9ee48022a8@ilande.co.uk>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1530652603-1609188623=:86464"
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
Cc: Huacai Chen <chenhuacai@kernel.org>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Guenter Roeck <linux@roeck-us.net>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1530652603-1609188623=:86464
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 28 Dec 2020, Mark Cave-Ayland wrote:
> On 27/12/2020 22:13, BALATON Zoltan via wrote:
>
>> From: Guenter Roeck <linux@roeck-us.net>
>> 
>> The IDE legacy mode emulation has been removed in commit 4ea98d317eb
>> ("ide/via: Implement and use native PCI IDE mode") but some Linux
>> kernels (probably including def_config) require legacy mode on the
>> Fuloong2e so only emulating native mode did not turn out feasible.
>> Add property to via-ide model to make the mode configurable, and set
>> legacy mode for Fuloong2e.
>> 
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> [balaton: Use bit in flags for property, add comment for missing BAR4]
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> Tested-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>> v2: Reworded commit message
>>
>>   hw/ide/via.c        | 19 +++++++++++++++++--
>>   hw/mips/fuloong2e.c |  4 +++-
>>   2 files changed, 20 insertions(+), 3 deletions(-)
>> 
>> diff --git a/hw/ide/via.c b/hw/ide/via.c
>> index be09912b33..7d54d7e829 100644
>> --- a/hw/ide/via.c
>> +++ b/hw/ide/via.c
>> @@ -26,6 +26,7 @@
>>     #include "qemu/osdep.h"
>>   #include "hw/pci/pci.h"
>> +#include "hw/qdev-properties.h"
>>   #include "migration/vmstate.h"
>>   #include "qemu/module.h"
>>   #include "sysemu/dma.h"
>> @@ -185,12 +186,19 @@ static void via_ide_realize(PCIDevice *dev, Error 
>> **errp)
>>                             &d->bus[1], "via-ide1-cmd", 4);
>>       pci_register_bar(dev, 3, PCI_BASE_ADDRESS_SPACE_IO, &d->cmd_bar[1]);
>>   -    bmdma_setup_bar(d);
>> -    pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
>> +    if (!(d->flags & BIT(PCI_IDE_LEGACY_MODE))) {
>> +        /* Missing BAR4 will make Linux driver fall back to legacy PIO 
>> mode */
>> +        bmdma_setup_bar(d);
>> +        pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, 
>> &d->bmdma_bar);
>> +    }
>
> Since the default value of the legacy mode parameter is false, then this 
> means the device assumes native mode by default. Therefore PCI_CLASS_PROG 
> should be set to 0x8f unless legacy mode is being used, in which case it 
> should be 0x8a.

I think this casued problems before because if it's not set to 0x8a 
(legacy) at start then guests may assume it's already switched to native 
mode by firmware and won't program the BARs and it will not work. This 
way, even if it looks odd all guests I've tested work so I don't want to 
touch this, because I don't want to test all guests again.

Keep in mind we're not fully emulating this device so not every 
combination that may work on real hardware work in this model. We really 
either only emulate "half-native" mode (i.e. native mode with ISA IRQs) 
that's needed for pegasos2 guests or now again only emulate legacy mode if 
property is set for Linux on fuloong2e. (My original patch emulated 
half-native and native mode instead of legacy thinking that Linux on 
fuloong2e would adapt.) All other combinations, including switching 
between these two is expected to not work which is due to QEMU limitations 
as you've also discovered now. I think this is still an improvement over 
only emulating legacy mode before even if it does not yet fully model the 
chip and I've also cleaned up PCI IDE emulation during implementing this 
so that code can be shared between via-ide, sii3112 and CMD646 without 
much duplication.

>>       qdev_init_gpio_in(ds, via_ide_set_irq, 2);
>>       for (i = 0; i < 2; i++) {
>>           ide_bus_new(&d->bus[i], sizeof(d->bus[i]), ds, i, 2);
>> +        if (d->flags & BIT(PCI_IDE_LEGACY_MODE)) {
>> +            ide_init_ioport(&d->bus[i], NULL, i ? 0x170 : 0x1f0,
>> +                            i ? 0x376 : 0x3f6);
>> +        }
>
> You could actually remove the if() here: PCI configuration always leaves a 
> gap at the lower end of IO address space to avoid clashes with legacy ports. 
> Therefore if a guest decides to switch to native mode and configure the BAR, 
> it will never clash with the default legacy IDE ports. This has the advantage 
> of minimising the parts protected by PCI_IDE_LEGACY_MODE whilst also 
> providing the legacy ports if someone can devise a method to dynamically 
> switch between compatible and native modes later.

I think leaving the legacy ports enabled is a bad idea for at least two 
reasons: 1) It may clash with other io ports on other machines, e.g. I'm 
not sure on PPC where firmware or OS does not expect to see legacy ISA 
ports won't map some io BAR of a PCI card there. 2) If this is left 
enabled there would be two ports poking the same registers so if that does 
not cause a problem by itself, writing to one accidentally (like when 
something is mapped over it) could cause corruption of IDE state so I 
think it's much better to protect this than later trying to debug such 
problems. (You can't get rid of the flag without implementing mode 
switching that needs rewrite of ISA and PCI emulation in QEMU so just get 
over it.)

>>           ide_init2(&d->bus[i], qdev_get_gpio_in(ds, i));
>>             bmdma_init(&d->bus[i], &d->bmdma[i], d);
>> @@ -210,6 +218,12 @@ static void via_ide_exitfn(PCIDevice *dev)
>>       }
>>   }
>>   +static Property via_ide_properties[] = {
>> +    DEFINE_PROP_BIT("legacy_mode", PCIIDEState, flags, 
>> PCI_IDE_LEGACY_MODE,
>> +                    false),
>
> The convention for new qdev/QOM properties is that they should use hyphens 
> instead of underscores (see the comment underneath object_property_try_add() 
> at https://qemu.readthedocs.io/en/latest/devel/qom.html).

I'll fix this with the comment in the first patch.

Regards,
BALATON Zoltan

>> +    DEFINE_PROP_END_OF_LIST(),
>> +};
>> +
>>   static void via_ide_class_init(ObjectClass *klass, void *data)
>>   {
>>       DeviceClass *dc = DEVICE_CLASS(klass);
>> @@ -223,6 +237,7 @@ static void via_ide_class_init(ObjectClass *klass, void 
>> *data)
>>       k->device_id = PCI_DEVICE_ID_VIA_IDE;
>>       k->revision = 0x06;
>>       k->class_id = PCI_CLASS_STORAGE_IDE;
>> +    device_class_set_props(dc, via_ide_properties);
>>       set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>>   }
>>   diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
>> index 45c596f4fe..f0733e87b7 100644
>> --- a/hw/mips/fuloong2e.c
>> +++ b/hw/mips/fuloong2e.c
>> @@ -253,7 +253,9 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, 
>> int slot, qemu_irq intc,
>>       /* Super I/O */
>>       isa_create_simple(isa_bus, TYPE_VT82C686B_SUPERIO);
>>   -    dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 1), "via-ide");
>> +    dev = pci_new(PCI_DEVFN(slot, 1), "via-ide");
>> +    qdev_prop_set_bit(&dev->qdev, "legacy_mode", true);
>> +    pci_realize_and_unref(dev, pci_bus, &error_fatal);
>>       pci_ide_create_devs(dev);
>>         pci_create_simple(pci_bus, PCI_DEVFN(slot, 2), 
>> "vt82c686b-usb-uhci");
>
>
> ATB,
>
> Mark.
>
>
--3866299591-1530652603-1609188623=:86464--

