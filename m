Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B32D7389F0F
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 09:43:26 +0200 (CEST)
Received: from localhost ([::1]:59612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljdL3-0005y5-Cu
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 03:43:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ljdJ4-0004aY-Fo
 for qemu-devel@nongnu.org; Thu, 20 May 2021 03:41:22 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:38976
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ljdIw-0005IT-TU
 for qemu-devel@nongnu.org; Thu, 20 May 2021 03:41:22 -0400
Received: from host217-39-58-213.range217-39.btcentralplus.com
 ([217.39.58.213] helo=[192.168.1.65])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ljdIo-000Bks-61; Thu, 20 May 2021 08:41:10 +0100
To: BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20210518215545.1793947-1-philmd@redhat.com>
 <20210518215545.1793947-3-philmd@redhat.com>
 <f571a63d-d6a2-2085-740-bcc59b3424e5@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <a1f3080f-bf74-8779-ccfd-9ef131368bb3@ilande.co.uk>
Date: Thu, 20 May 2021 08:41:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <f571a63d-d6a2-2085-740-bcc59b3424e5@eik.bme.hu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 217.39.58.213
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC PATCH 02/11] hw/ide: Add PCIIDEState::isa_bus link
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
 Jagannathan Raman <jag.raman@oracle.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/05/2021 00:05, BALATON Zoltan wrote:

> On Tue, 18 May 2021, Philippe Mathieu-Daudé wrote:
>> IDE bus depends on ISA bus for IRQ/DMA.
>>
>> Add an ISABus reference in PCIIDEState, and add link properties
>> to it in the PIIX and VIA objects (which inherit PCI_IDE).
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> include/hw/ide/pci.h |  1 +
>> hw/ide/piix.c        | 11 ++++++++++-
>> hw/ide/via.c         | 10 +++++++++-
>> 3 files changed, 20 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
>> index d8384e1c422..e790722ed14 100644
>> --- a/include/hw/ide/pci.h
>> +++ b/include/hw/ide/pci.h
>> @@ -47,6 +47,7 @@ struct PCIIDEState {
>>     PCIDevice parent_obj;
>>     /*< public >*/
>>
>> +    ISABus *isa_bus;
> 
> I'm not sure that this belongs here. Previously we managed to remove device specific 
> fields from this structure so it's now really just holds stuff related to PCI IDE 
> (except the remaining "secondary" field specific to CMD646). PCI IDE normaly has 
> nothing to do with ISA except for those south bridges that have IDE with legacy mode. 
> So this ISABus reference should be in those south bridges instead. But that may need 
> a new subclass just for this so putting it here is just avoiding boilerplate of 
> declaring new subclasses in piix and via-ide. I can sympathise with that but I'd 
> still prefer to keep it off here but I wonder if there's a way to do that without 
> subclassing and storing an ISABus ref? If I understand correctly this ISABus ref is 
> just needed to get appropriate ISA irqs. But could we just store a ref to those irqs 
> directly so we don't need to keep the ref to the ISA bus? There's already a qemu_irq 
> in BMDMAState but I'm not sure how those are set and if you could store an isa irq 
> there to simplify this. I don't know the details and could not detangle it by a brief 
> look so not sure it can be done but conceptually it feels better to keep PCI IDE 
> separate from ISA and let it raise either PCI irq or ISA irq as needed. For that a 
> ref to the irq should be enough and that can either come from a PCI bus (which is 
> normaly expected for PCI IDE) or an ISA bridge for legacy modes. Hope it makes sense 
> and you get what I'm trying to say. (Longer term we may want to make it changeable 
> also after the device is created to allow switching between legacy and PCI mode but 
> so far we could get away without emulating that so it's not a requirement just 
> something to consider when you're changing this. The real problem that prevents 
> switching modes is not irq I think but ioports and that ISA devices are not 
> configurable after creating them but that would need QOM'ifying ISA emulation which 
> probably does not worth the effort unless we come across some guest that needs this.)

Right. I've had a quick look over the patchset and the IRQ changes look good: the 
part I'm not keen on is adding the property links for the ISABus directly to these 
devices, since as Zoltan correctly points out this is handled by a PCI-ISA bridge in 
the PCI host bridge and not the PCI device itself.

One of the better diagrams to explain how this wires together is on the QEMU wiki at 
https://wiki.qemu.org/Features/Q35. Bear in mind that the PCI-ISA bridge is optional 
and not all PCI bridges have them.

I spent a bit of time trying to figure how we know which devices have a PCI-ISA 
bridge and then realised that it is those devices with a PCI class id of 
PCI_CLASS_BRIDGE_ISA. If you grep for this then it is possible to see that there are 
a couple of places that check for whether a PCI device is a PCI-ISA bridge by 
checking the PCI class id for PCI_CLASS_BRIDGE_ISA instead of using a QOM type.

This gives me the following idea:

1) Create an abstract TYPE_PCI_ISA_BRIDGE QOM type with parent PCI_DEVICE and change 
the existing devices with PCI_CLASS_BRIDGE_ISA so that they have TYPE_PCI_ISA_BRIDGE 
as a parent

2) In the PCI_ISA_BRIDGE realize function add the following common code to 
instantiate the ISABus and remove it from the individual PCI_CLASS_BRIDGE_ISA devices:

static void pci_isa_bridge_realize(DeviceState *dev)
{
     PCIISABridge *s = PCI_ISA_BRIDGE(dev);

     s->isa_bus = isa_bus_new(DEVICE(dev), pci_address_space(dev),
                              pci_address_space_io(dev), errp);

     /* FIXME: this should probably use errp */
     if (!s->isa_bus) {
         return;
     }
}

You may also be able to do something similar with the 8259 IRQ initialisation 
although I haven't really looked at that.

3) Add a new pci_isa_bridge_get_isabus(PCIDevice *d) function that the devices such 
as via-ide can use to obtain a reference to the ISABus from their own PCIDevice. It 
should hopefully be quite simple like this:

ISABus *pci_isa_bridge_get_isabus(PCIDevice *d)
{
     PCIISABridge *s = PCI_ISA_BRIDGE(d);

     return s->isa_bus;
}


I think this is the best solution since it avoids either 1) having to embed ISABus 
unconditionally into PCIHostState and therefore bringing in all ISA devices for all 
PCI builds and 2) it avoids having to manually link the ISABus directly for the 
affected devices. It also allows for a future cleanup where PCI-ISA bridges can be 
detected by checking QOM type rather than PCI class id directly.

Once that is done the follow on work could be to investigate how TYPE_PCI_ISA_BRIDGE 
devices can use the ISABus to handle the switch between legacy mode and PCI mode, but 
that's certainly a job for another day.


ATB,

Mark.

