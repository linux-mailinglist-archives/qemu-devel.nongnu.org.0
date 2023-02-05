Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F68B68B226
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 23:23:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOnOl-0006U1-9L; Sun, 05 Feb 2023 17:22:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@jedlik.phy.bme.hu>)
 id 1pOnOi-0006TW-If; Sun, 05 Feb 2023 17:22:08 -0500
Received: from jedlik.phy.bme.hu ([152.66.102.83])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@jedlik.phy.bme.hu>)
 id 1pOnOf-0005Sg-6U; Sun, 05 Feb 2023 17:22:07 -0500
Received: by jedlik.phy.bme.hu (Postfix, from userid 1000)
 id 7352CA00FB; Sun,  5 Feb 2023 23:21:52 +0100 (CET)
Date: Sun, 5 Feb 2023 23:21:52 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
cc: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>, 
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Aurelien Jarno <aurelien@aurel32.net>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
 David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>, 
 qemu-ppc@nongnu.org, qemu-block@nongnu.org, John Snow <jsnow@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 07/10] hw/ide/piix: Require an ISABus only for
 user-created instances
In-Reply-To: <fb287888-c88c-60b1-20a4-1e50ddbf1daf@ilande.co.uk>
Message-ID: <alpine.LMD.2.03.2302052308460.32269@eik.bme.hu>
References: <20230126211740.66874-1-shentey@gmail.com>
 <20230126211740.66874-8-shentey@gmail.com>
 <fb287888-c88c-60b1-20a4-1e50ddbf1daf@ilande.co.uk>
User-Agent: Alpine 2.03 (LMD 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Received-SPF: none client-ip=152.66.102.83;
 envelope-from=balaton@jedlik.phy.bme.hu; helo=jedlik.phy.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Sun, 5 Feb 2023, Mark Cave-Ayland wrote:
> On 26/01/2023 21:17, Bernhard Beschow wrote:
>> Internal instances now defer interrupt wiring to the caller which
>> decouples them from the ISABus. User-created devices still fish out the
>> ISABus from the QOM tree and the interrupt wiring remains in PIIX IDE.
>> The latter mechanism is considered a workaround and intended to be
>> removed once a deprecation period for user-created PIIX IDE devices is
>> over.
>> 
>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>> ---
>>   include/hw/ide/pci.h |  1 +
>>   hw/ide/piix.c        | 64 ++++++++++++++++++++++++++++++++++----------
>>   hw/isa/piix.c        |  5 ++++
>>   3 files changed, 56 insertions(+), 14 deletions(-)
>> 
>> diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
>> index 24c0b7a2dd..ee2c8781b7 100644
>> --- a/include/hw/ide/pci.h
>> +++ b/include/hw/ide/pci.h
>> @@ -54,6 +54,7 @@ struct PCIIDEState {
>>       MemoryRegion bmdma_bar;
>>       MemoryRegion cmd_bar[2];
>>       MemoryRegion data_bar[2];
>> +    bool user_created;
>>   };
>>     static inline IDEState *bmdma_active_if(BMDMAState *bmdma)
>> diff --git a/hw/ide/piix.c b/hw/ide/piix.c
>> index 5980045db0..f0d95761ac 100644
>> --- a/hw/ide/piix.c
>> +++ b/hw/ide/piix.c
>> @@ -108,6 +108,13 @@ static void bmdma_setup_bar(PCIIDEState *d)
>>       }
>>   }
>>   +static void piix_ide_set_irq(void *opaque, int n, int level)
>> +{
>> +    PCIIDEState *d = opaque;
>> +
>> +    qemu_set_irq(d->isa_irqs[n], level);
>> +}
>> +
>>   static void piix_ide_reset(DeviceState *dev)
>>   {
>>       PCIIDEState *d = PCI_IDE(dev);
>> @@ -138,11 +145,18 @@ static void pci_piix_init_ports(PCIIDEState *d, 
>> ISABus *isa_bus)
>>       };
>>       int i;
>>   +    if (isa_bus) {
>> +        d->isa_irqs[0] = isa_bus->irqs[port_info[0].isairq];
>> +        d->isa_irqs[1] = isa_bus->irqs[port_info[1].isairq];
>> +    } else {
>> +        qdev_init_gpio_out(DEVICE(d), d->isa_irqs, 2);
>> +    }
>> +
>>       for (i = 0; i < 2; i++) {
>>           ide_bus_init(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
>>           ide_init_ioport(&d->bus[i], NULL, port_info[i].iobase,
>>                           port_info[i].iobase2);
>> -        ide_init2(&d->bus[i], isa_bus->irqs[port_info[i].isairq]);
>> +        ide_init2(&d->bus[i], qdev_get_gpio_in(DEVICE(d), i));
>>             bmdma_init(&d->bus[i], &d->bmdma[i], d);
>>           d->bmdma[i].bus = &d->bus[i];
>> @@ -154,8 +168,7 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error 
>> **errp)
>>   {
>>       PCIIDEState *d = PCI_IDE(dev);
>>       uint8_t *pci_conf = dev->config;
>> -    ISABus *isa_bus;
>> -    bool ambiguous;
>> +    ISABus *isa_bus = NULL;
>>         pci_conf[PCI_CLASS_PROG] = 0x80; // legacy ATA mode
>>   @@ -164,22 +177,36 @@ static void pci_piix_ide_realize(PCIDevice *dev, 
>> Error **errp)
>>         vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_pci, d);
>>   -    isa_bus = ISA_BUS(object_resolve_path_type("", TYPE_ISA_BUS, 
>> &ambiguous));
>> -    if (ambiguous) {
>> -        error_setg(errp,
>> -                   "More than one ISA bus found while %s supports only 
>> one",
>> -                   object_get_typename(OBJECT(dev)));
>> -        return;
>> -    }
>> -    if (!isa_bus) {
>> -        error_setg(errp, "No ISA bus found while %s requires one",
>> -                   object_get_typename(OBJECT(dev)));
>> -        return;
>> +    if (d->user_created) {
>> +        bool ambiguous;
>> +
>> +        isa_bus = ISA_BUS(object_resolve_path_type("", TYPE_ISA_BUS,
>> +                                                   &ambiguous));
>> +
>> +        if (ambiguous) {
>> +            error_setg(errp,
>> +                       "More than one ISA bus found while %s supports only 
>> one",
>> +                       object_get_typename(OBJECT(dev)));
>> +            return;
>> +        }
>> +
>> +        if (!isa_bus) {
>> +            error_setg(errp, "No ISA bus found while %s requires one",
>> +                       object_get_typename(OBJECT(dev)));
>> +            return;
>> +        }
>>       }
>>         pci_piix_init_ports(d, isa_bus);
>>   }
>>   +static void pci_piix_ide_init(Object *obj)
>> +{
>> +    DeviceState *dev = DEVICE(obj);
>> +
>> +    qdev_init_gpio_in(dev, piix_ide_set_irq, 2);
>> +}
>> +
>>   static void pci_piix_ide_exitfn(PCIDevice *dev)
>>   {
>>       PCIIDEState *d = PCI_IDE(dev);
>> @@ -191,6 +218,11 @@ static void pci_piix_ide_exitfn(PCIDevice *dev)
>>       }
>>   }
>>   +static Property piix_ide_properties[] = {
>> +    DEFINE_PROP_BOOL("user-created", PCIIDEState, user_created, true),
>> +    DEFINE_PROP_END_OF_LIST(),
>> +};
>> +
>>   /* NOTE: for the PIIX3, the IRQs and IOports are hardcoded */
>>   static void piix3_ide_class_init(ObjectClass *klass, void *data)
>>   {
>> @@ -205,11 +237,13 @@ static void piix3_ide_class_init(ObjectClass *klass, 
>> void *data)
>>       k->class_id = PCI_CLASS_STORAGE_IDE;
>>       set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>>       dc->hotpluggable = false;
>> +    device_class_set_props(dc, piix_ide_properties);
>>   }
>>     static const TypeInfo piix3_ide_info = {
>>       .name          = TYPE_PIIX3_IDE,
>>       .parent        = TYPE_PCI_IDE,
>> +    .instance_init = pci_piix_ide_init,
>>       .class_init    = piix3_ide_class_init,
>>   };
>>   @@ -227,11 +261,13 @@ static void piix4_ide_class_init(ObjectClass 
>> *klass, void *data)
>>       k->class_id = PCI_CLASS_STORAGE_IDE;
>>       set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>>       dc->hotpluggable = false;
>> +    device_class_set_props(dc, piix_ide_properties);
>>   }
>>     static const TypeInfo piix4_ide_info = {
>>       .name          = TYPE_PIIX4_IDE,
>>       .parent        = TYPE_PCI_IDE,
>> +    .instance_init = pci_piix_ide_init,
>>       .class_init    = piix4_ide_class_init,
>>   };
>>   diff --git a/hw/isa/piix.c b/hw/isa/piix.c
>> index 54a1246a9d..f9974c2a77 100644
>> --- a/hw/isa/piix.c
>> +++ b/hw/isa/piix.c
>> @@ -345,9 +345,14 @@ static void pci_piix_realize(PCIDevice *dev, const 
>> char *uhci_type,
>>         /* IDE */
>>       qdev_prop_set_int32(DEVICE(&d->ide), "addr", dev->devfn + 1);
>> +    qdev_prop_set_bit(DEVICE(&d->ide), "user-created", false);
>>       if (!qdev_realize(DEVICE(&d->ide), BUS(pci_bus), errp)) {
>>           return;
>>       }
>> +    qdev_connect_gpio_out(DEVICE(&d->ide), 0,
>> +                          qdev_get_gpio_in(DEVICE(&d->pic), 14));
>> +    qdev_connect_gpio_out(DEVICE(&d->ide), 1,
>> +                          qdev_get_gpio_in(DEVICE(&d->pic), 15));
>>         /* USB */
>>       if (d->has_usb) {
>
> I haven't checked the datasheet, but I suspect this will be similar to the 
> cmd646/via PCI-IDE interfaces in that there will be a PCI configuration 
> register that will switch between ISA compatibility mode (and ISA irqs) and 
> PCI mode (with PCI IRQs). So it would be the device configuration that would 
> specify PCI or ISA mode, rather than the presence of an ISABus.

I forgot about this topic already and haven't follwed this series either 
so what I say may not fully make sense but I think CMD646 and via-ide are 
different. CMD646 is a PCI device and should use PCI interrupts while 
via-ide is part of a southbridge/superio complex and connected to the ISA 
PICs within that southbride, so I think via-ide always uses ISA IRQs and 
the ISA btidge within the same chip may convert that to PCI IRQs or not 
(that part is where I'm lost also because we may not actually model it 
that way). After a long debate we managed to find a solution back then 
that works for every guest we use it for now so I think we don't want to 
touch it now until some real need arises. It does not worth the trouble 
and added complexity to model something that is not used just for the sake 
of correctness. By the time we find a use for that, the ISA emulation may 
evolve so it's easier to implement the missing switching between isa and 
native mode or we may want to do it differently (such as we do things 
differently now compared to what we did years ago). So I think it does not 
worth keeping the ISA model from being simplified for some theoretical 
uses in the future which we may not actually do any time soon. But I don't 
want to get into this again so just shared my thoughts and feel free to 
ignore it. I don't care where these patches go as long as the VIA model 
keeps working for me.

Regards,
BALATON Zoltan

