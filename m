Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56123315484
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 17:59:27 +0100 (CET)
Received: from localhost ([::1]:44458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9WMH-0006ZA-4z
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 11:59:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l9WIO-0003TP-GQ
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 11:55:24 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:31565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l9WI7-0000pt-8k
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 11:55:24 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 6E1FC74632F;
 Tue,  9 Feb 2021 17:55:05 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id AB6737462FD; Tue,  9 Feb 2021 17:55:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id AA0C67462D6;
 Tue,  9 Feb 2021 17:55:04 +0100 (CET)
Date: Tue, 9 Feb 2021 17:55:04 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 08/13] vt82c686: Move creation of ISA devices to the
 ISA bridge
In-Reply-To: <alpine.LMD.2.03.2102012101480.9444@eik.bme.hu>
Message-ID: <7088e295-bc69-3d6b-acde-c66e9c82124@eik.bme.hu>
References: <cover.1610223396.git.balaton@eik.bme.hu>
 <bf9400cc8e4ddd3129aa5678de4d3cf38384805f.1610223397.git.balaton@eik.bme.hu>
 <f77d6471-d19d-a1c2-e447-18181d55ba86@amsat.org>
 <5c5ce8b9-f5c4-c58d-6f8a-76c47ad8db4d@eik.bme.hu>
 <2a45450d-8357-c03e-7e11-bd59bffa61ae@amsat.org>
 <1b55216e-4526-6f50-eac2-f91797a64e7@eik.bme.hu>
 <alpine.LMD.2.03.2102012101480.9444@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1495457781-1612889704=:24435"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1495457781-1612889704=:24435
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 1 Feb 2021, BALATON Zoltan wrote:
> On Sun, 10 Jan 2021, BALATON Zoltan wrote:
>> On Sun, 10 Jan 2021, Philippe Mathieu-Daudé wrote:
>>> +PCI experts
>>> 
>>> On 1/10/21 1:43 AM, BALATON Zoltan wrote:
>>>> On Sun, 10 Jan 2021, Philippe Mathieu-Daudé wrote:
>>>>> Hi Zoltan,
>>>>> 
>>>>> On 1/9/21 9:16 PM, BALATON Zoltan wrote:
>>>>>> Currently the ISA devices that are part of the VIA south bridge,
>>>>>> superio chip are wired up by board code. Move creation of these ISA
>>>>>> devices to the VIA ISA bridge model so that board code does not need
>>>>>> to access ISA bus. This also allows vt82c686b-superio to be made
>>>>>> internal to vt82c686 which allows implementing its configuration via
>>>>>> registers in subseqent commits.
>>>>> 
>>>>> Is this patch dependent of the VT82C686B_PM changes
>>>>> or can it be applied before them?
>>>> 
>>>> I don't know but why would that be better? I thought it's clearer to
>>>> clean up pm related parts first before moving more stuff to this file so
>>>> that's why this patch comes after (and also because that's the order I
>>>> did it).
>>> 
>>> Not any better, but easier for me to get your patches integrated,
>>> as I'm reviewing your patches slowly. Finding other reviewers
>>> would certainly help.
>> 
>> No problem, I'll wait for your review. Merging parts of the series does not 
>> help much because the whole series is needed for vt8231 which is 
>> prerequisite for pegasos2 so eventually all of these are needed so it does 
>> not matter if this one patch gets in earlier or later.
>> 
>> Not sure who could help with review. Maybe Jiaxun or Huacai as this is used 
>> by fuloong2e so they might be interested and could have info on this chip. 
>> Most of these patches just cleaning up the vt82c686b and adding some 
>> missing features so these can be reused by the vt8231 model in last 3 
>> patches (which is very similar to 686b only some reg addresses and ids seem 
>> to be different for what we are concerned).
>
> Ping? There are still a few patches needing review:
>
> http://patchwork.ozlabs.org/project/qemu-devel/list/?series=223512
>
> Jiaxun, Hiacai, or anybody else could you please help reviewing or testing if 
> this works with fuloong2e?

Ping^2

> Thank you,
> BALATON Zoltan
>
>>>>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>>>>> ---
>>>>>>  hw/isa/vt82c686.c   | 20 ++++++++++++++++++++
>>>>>>  hw/mips/fuloong2e.c | 29 +++++------------------------
>>>>>>  2 files changed, 25 insertions(+), 24 deletions(-)
>>>>>> 
>>>>>> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
>>>>>> index 58c0bba1d0..5df9be8ff4 100644
>>>>>> --- a/hw/isa/vt82c686.c
>>>>>> +++ b/hw/isa/vt82c686.c
>>>>>> @@ -16,6 +16,11 @@
>>>>>>  #include "hw/qdev-properties.h"
>>>>>>  #include "hw/isa/isa.h"
>>>>>>  #include "hw/isa/superio.h"
>>>>>> +#include "hw/intc/i8259.h"
>>>>>> +#include "hw/irq.h"
>>>>>> +#include "hw/dma/i8257.h"
>>>>>> +#include "hw/timer/i8254.h"
>>>>>> +#include "hw/rtc/mc146818rtc.h"
>>>>>>  #include "migration/vmstate.h"
>>>>>>  #include "hw/isa/apm.h"
>>>>>>  #include "hw/acpi/acpi.h"
>>>>>> @@ -307,9 +312,16 @@ OBJECT_DECLARE_SIMPLE_TYPE(VT82C686BISAState,
>>>>>> VT82C686B_ISA)
>>>>>> 
>>>>>>  struct VT82C686BISAState {
>>>>>>      PCIDevice dev;
>>>>>> +    qemu_irq cpu_intr;
>>>>>>      SuperIOConfig superio_cfg;
>>>>>>  };
>>>>>> 
>>>>>> +static void via_isa_request_i8259_irq(void *opaque, int irq, int 
>>>>>> level)
>>>>>> +{
>>>>>> +    VT82C686BISAState *s = opaque;
>>>>>> +    qemu_set_irq(s->cpu_intr, level);
>>>>>> +}
>>>>>> +
>>>>>>  static void vt82c686b_write_config(PCIDevice *d, uint32_t addr,
>>>>>>                                     uint32_t val, int len)
>>>>>>  {
>>>>>> @@ -365,10 +377,18 @@ static void vt82c686b_realize(PCIDevice *d,
>>>>>> Error **errp)
>>>>>>      VT82C686BISAState *s = VT82C686B_ISA(d);
>>>>>>      DeviceState *dev = DEVICE(d);
>>>>>>      ISABus *isa_bus;
>>>>>> +    qemu_irq *isa_irq;
>>>>>>      int i;
>>>>>> 
>>>>>> +    qdev_init_gpio_out(dev, &s->cpu_intr, 1);
>>>>> 
>>>>> Why not use the SysBus API?
>>>> 
>>>> How? This is a PCIDevice not a SysBusDevice.
>>> 
>>> Indeed :)
>>> 
>>>>>> +    isa_irq = qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
>>>>>>      isa_bus = isa_bus_new(dev, get_system_memory(),
>>>>>> pci_address_space_io(d),
>>>>>>                            &error_fatal);
>>>>> 
>>>>> Isn't it get_system_memory() -> pci_address_space(d)?
>>>> 
>>>> I don't really know. Most other places that create an isa bus seem to
>>>> also use get_system_memory(), only piix4 uses pci_address_space(dev) so
>>>> I thought if those others are OK this should be too.
>>> 
>>> I'm not a PCI expert but my understanding is PCI device functions are
>>> restricted to the PCI bus address space. The host bridge may map this
>>> space within the host.
>>> 
>>> QEMU might be using get_system_memory() because for some host bridge
>>> the mapping is not implemented so it was easier this way?
>> 
>> Maybe, also one less indirection which if not really needed is a good thing 
>> for performance so unless it's found to be needed to use another address 
>> space here I'm happy with this as it matches what other similar devices do 
>> and it seems to work. Maybe a separate address space is only really needed 
>> if we have an iommu?
>> 
>> Regards,
>> BALATON Zoltan
--3866299591-1495457781-1612889704=:24435--

