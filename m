Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 238D5389AA6
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 02:48:54 +0200 (CEST)
Received: from localhost ([::1]:35784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljWrs-0002jF-O3
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 20:48:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ljWq9-0001wa-Ce
 for qemu-devel@nongnu.org; Wed, 19 May 2021 20:47:05 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:18737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ljWpx-0001n1-7C
 for qemu-devel@nongnu.org; Wed, 19 May 2021 20:47:04 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 59D7E74570D;
 Thu, 20 May 2021 02:46:48 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id BC7427456E3; Thu, 20 May 2021 02:46:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id B9A4F7456B4;
 Thu, 20 May 2021 02:46:47 +0200 (CEST)
Date: Thu, 20 May 2021 02:46:47 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: John Snow <jsnow@redhat.com>
Subject: Re: [RFC PATCH 02/11] hw/ide: Add PCIIDEState::isa_bus link
In-Reply-To: <3ba44704-6418-4aee-23ad-7d4dcc1fe60d@redhat.com>
Message-ID: <babbf5da-b4c0-9736-b09-426e3a358587@eik.bme.hu>
References: <20210518215545.1793947-1-philmd@redhat.com>
 <20210518215545.1793947-3-philmd@redhat.com>
 <f571a63d-d6a2-2085-740-bcc59b3424e5@eik.bme.hu>
 <3ba44704-6418-4aee-23ad-7d4dcc1fe60d@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-368746287-1621471607=:90135"
X-Spam-Probability: 9%
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>, Thomas Huth <thuth@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-368746287-1621471607=:90135
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 19 May 2021, John Snow wrote:
> On 5/18/21 7:05 PM, BALATON Zoltan wrote:
>> On Tue, 18 May 2021, Philippe Mathieu-Daudé wrote:
>>> IDE bus depends on ISA bus for IRQ/DMA.
>>> 
>>> Add an ISABus reference in PCIIDEState, and add link properties
>>> to it in the PIIX and VIA objects (which inherit PCI_IDE).
>>> 
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> ---
>>> include/hw/ide/pci.h |  1 +
>>> hw/ide/piix.c        | 11 ++++++++++-
>>> hw/ide/via.c         | 10 +++++++++-
>>> 3 files changed, 20 insertions(+), 2 deletions(-)
>>> 
>>> diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
>>> index d8384e1c422..e790722ed14 100644
>>> --- a/include/hw/ide/pci.h
>>> +++ b/include/hw/ide/pci.h
>>> @@ -47,6 +47,7 @@ struct PCIIDEState {
>>>     PCIDevice parent_obj;
>>>     /*< public >*/
>>> 
>>> +    ISABus *isa_bus;
>> 
>> I'm not sure that this belongs here. Previously we managed to remove device 
>> specific fields from this structure so it's now really just holds stuff 
>> related to PCI IDE (except the remaining "secondary" field specific to 
>> CMD646). PCI IDE normaly has nothing to do with ISA except for those south 
>> bridges that have IDE with legacy mode. So this ISABus reference should be 
>> in those south bridges instead. But that may need a 
>
> by "those south bridges" I assume you are referring to the integrated PIIX 
> and VIA controller implementations.

Yes, those are that also have an ISA bridge so the IDE in those can use 
either ISA or PCI IRQs but we probably only emulate one mode. At least 
that's the case for via-ide which we have gone into great detail before 
and concluded we can't cleanly switch between legacy ISA or PCI mode and 
the pegasos2 needs hard coded ISA interrupts even when in PCI mode so we 
only emulate that.

Apart from that this PCI IDE is also used by CMD646 and sii3112 that are 
pure PCI IDE devices without any ISA dependency so that's why I think we 
should not need this ISABus here to keep this implementing PCI IDE and 
only keep ISA in the south bridge models.

>> new subclass just for this so putting it here is just avoiding boilerplate 
>> of declaring new subclasses in piix and via-ide. I can sympathise with that 
>> but I'd still prefer to keep it off here but I wonder if there's a way to 
>> do that without subclassing and storing an ISABus ref? If I understand 
>> correctly this ISABus ref is just needed to get appropriate ISA irqs. But 
>> could we just store a ref to those irqs 
>
> It looks like it's just the IRQs, yeah.
>
>> directly so we don't need to keep the ref to the ISA bus? There's 
>
> I think the idea actually is to formalize the dependency of these models on 
> the ISA bus instead of hacking / faking one. I think we DO want the 
> dependency.

Right, but only piix and via depend on ISA so the dependency should be in 
those not in PCI IDE in my opinion. But I don't mind too much so if it 
would be too difficult to put it elsewhere I don't mind introducing this 
ISABus field but we should at least look if it could be avoided first.

>> already a qemu_irq in BMDMAState but I'm not sure how those are set and if 
>> you could store an isa irq there to simplify this. I don't know the details 
>> and could not detangle it by a brief look so not sure it can be done but 
>> conceptually it feels better to keep PCI IDE separate from ISA and let it 
>> raise either PCI irq or ISA irq as needed. For that a ref to the irq should 
>> be enough and that can either come from a PCI bus (which is normaly 
>> expected for PCI IDE) or an ISA bridge for legacy modes. Hope it makes 
>> sense and you get what I'm trying to say. (Longer term we may want to make 
>> it changeable also after the device is created to allow switching between 
>> legacy and PCI mode but so far we could get away without emulating that so 
>> it's not a requirement just something to consider when you're changing 
>> this. The real problem that prevents switching modes is not irq I think but 
>> ioports and that ISA devices are not configurable after creating them but 
>> that would need QOM'ifying ISA emulation which probably does not worth the 
>> effort unless we come across some guest that needs this.)
>> 
>> Regards,
>> BALATON Zoltan
>> 
>
> I assume the idea here is that PCIIDE does not technically need "ISA" to 
> provide ioport access to the ATA drives, so taxonomically it's odd for the 
> generic/abstract PCIIDE device to require an ISA bus.
>
> Am I understanding correctly?

I'm not sure I understand all of the IDE emulation but in my view PCI IDE 
should be independent of ISA so instead of adding a reference to an ISA 
bus to PCIIDEState maybe it's enough to set the irqs used by PCI IDE to 
the appropriate irq to raise which could be an ISA interrupt for the south 
bridges in legacy mode or a PCI irq for PCI cards and that way we don't 
need a dependency on ISABus in PCI IDE. But I'm not sure how IDE 
interrupts are set so don't know if that would work so it's just an idea 
to avoid introducing ISA into PCI IDE where it does not seem to belong.

A simpler way keeping the current code may be to subclass PCI IDE in piix 
and via and put the ISABus ref in those subclasses but that's more boiler 
plate and the result may not be simpler so while conceptually may be 
cleaner the code may be longer and harder to understand that way. So 
cleaning up the interrupt handling could make it simpler and also avoid 
the subclasses but that needs more work to detangle how IDE interrupts are 
emulated and add some clean way to set them if that's not yet available. 
But I don't completely understand what the qemu_irqs are in BMDMAState and 
if those could be connected to an ISA interrupt or some more changes would 
be needed.

Regards,
BALATON Zoltan

>>>     IDEBus bus[2];
>>>     BMDMAState bmdma[2];
>>>     uint32_t secondary; /* used only for cmd646 */
>>> diff --git a/hw/ide/piix.c b/hw/ide/piix.c
>>> index b9860e35a5c..48da68da37f 100644
>>> --- a/hw/ide/piix.c
>>> +++ b/hw/ide/piix.c
>>> @@ -30,8 +30,9 @@
>>> #include "sysemu/block-backend.h"
>>> #include "sysemu/blockdev.h"
>>> #include "sysemu/dma.h"
>>> -
>>> +#include "qapi/error.h"
>>> #include "hw/ide/pci.h"
>>> +#include "hw/isa/isa.h"
>>> #include "trace.h"
>>> 
>>> static uint64_t bmdma_read(void *opaque, hwaddr addr, unsigned size)
>>> @@ -207,6 +208,12 @@ static void pci_piix_ide_exitfn(PCIDevice *dev)
>>>     }
>>> }
>>> 
>>> +static Property piix_ide_properties[] = {
>>> +    DEFINE_PROP_LINK("isa-bus", PCIIDEState, isa_bus,
>>> +                     TYPE_ISA_BUS, ISABus *),
>>> +    DEFINE_PROP_END_OF_LIST(),
>>> +};
>>> +
>>> /* NOTE: for the PIIX3, the IRQs and IOports are hardcoded */
>>> static void piix3_ide_class_init(ObjectClass *klass, void *data)
>>> {
>>> @@ -221,6 +228,7 @@ static void piix3_ide_class_init(ObjectClass *klass, 
>>> void *data)
>>>     k->class_id = PCI_CLASS_STORAGE_IDE;
>>>     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>>>     dc->hotpluggable = false;
>>> +    device_class_set_props(dc, piix_ide_properties);
>>> }
>>> 
>>> static const TypeInfo piix3_ide_info = {
>>> @@ -249,6 +257,7 @@ static void piix4_ide_class_init(ObjectClass *klass, 
>>> void *data)
>>>     k->class_id = PCI_CLASS_STORAGE_IDE;
>>>     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>>>     dc->hotpluggable = false;
>>> +    device_class_set_props(dc, piix_ide_properties);
>>> }
>>> 
>>> static const TypeInfo piix4_ide_info = {
>>> diff --git a/hw/ide/via.c b/hw/ide/via.c
>>> index be09912b334..65fdca6dcf4 100644
>>> --- a/hw/ide/via.c
>>> +++ b/hw/ide/via.c
>>> @@ -28,8 +28,9 @@
>>> #include "hw/pci/pci.h"
>>> #include "migration/vmstate.h"
>>> #include "qemu/module.h"
>>> +#include "qapi/error.h"
>>> #include "sysemu/dma.h"
>>> -
>>> +#include "hw/isa/isa.h"
>>> #include "hw/ide/pci.h"
>>> #include "trace.h"
>>> 
>>> @@ -210,6 +211,12 @@ static void via_ide_exitfn(PCIDevice *dev)
>>>     }
>>> }
>>> 
>>> +static Property via_ide_properties[] = {
>>> +    DEFINE_PROP_LINK("isa-bus", PCIIDEState, isa_bus,
>>> +                     TYPE_ISA_BUS, ISABus *),
>>> +    DEFINE_PROP_END_OF_LIST(),
>>> +};
>>> +
>>> static void via_ide_class_init(ObjectClass *klass, void *data)
>>> {
>>>     DeviceClass *dc = DEVICE_CLASS(klass);
>>> @@ -224,6 +231,7 @@ static void via_ide_class_init(ObjectClass *klass, 
>>> void *data)
>>>     k->revision = 0x06;
>>>     k->class_id = PCI_CLASS_STORAGE_IDE;
>>>     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>>> +    device_class_set_props(dc, via_ide_properties);
>>> }
>>> 
>>> static const TypeInfo via_ide_info = {
>>> 
>
>
--3866299591-368746287-1621471607=:90135--

