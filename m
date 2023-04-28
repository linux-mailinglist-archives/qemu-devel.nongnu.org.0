Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E28B6F1D25
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 19:03:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psRTw-00039M-4u; Fri, 28 Apr 2023 13:02:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1psRTt-00038i-Q8; Fri, 28 Apr 2023 13:02:01 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1psRTo-0007ax-TJ; Fri, 28 Apr 2023 13:02:01 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 9AA3E746335;
 Fri, 28 Apr 2023 19:00:07 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 43F147462DB; Fri, 28 Apr 2023 19:00:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 41F25745706;
 Fri, 28 Apr 2023 19:00:07 +0200 (CEST)
Date: Fri, 28 Apr 2023 19:00:07 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org, 
 qemu-block@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 John Snow <jsnow@redhat.com>, Huacai Chen <chenhuacai@kernel.org>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
 qemu-ppc@nongnu.org
Subject: Re: [PATCH 10/13] hw/ide/piix: Reuse PCIIDEState::{cmd,data}_ops
In-Reply-To: <22990C1E-D554-4FA1-AE08-DA433AD26247@gmail.com>
Message-ID: <53cf1bca-893e-ebb3-8afe-69da8ba0555c@eik.bme.hu>
References: <20230422150728.176512-1-shentey@gmail.com>
 <20230422150728.176512-11-shentey@gmail.com>
 <4ed18370-3a92-3ae5-912f-1f6dafab37d1@ilande.co.uk>
 <612DFA62-40DC-44D3-88A9-797FB4EC1F48@gmail.com>
 <CD1A2767-74AD-4285-ADF8-1757B8DD7953@gmail.com>
 <698457dc-ca0a-956d-f20d-c3b353fbf0c3@ilande.co.uk>
 <6D292D6F-D82B-4425-8A03-7A51AA7791B0@gmail.com>
 <22990C1E-D554-4FA1-AE08-DA433AD26247@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 28 Apr 2023, Bernhard Beschow wrote:
> Am 27. April 2023 18:15:24 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
>> Am 27. April 2023 10:52:17 UTC schrieb Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>:
>>> On 26/04/2023 21:14, Bernhard Beschow wrote:
>>>> Am 26. April 2023 18:18:35 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
>>>>> Am 26. April 2023 11:37:48 UTC schrieb Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>:
>>>>>> On 22/04/2023 16:07, Bernhard Beschow wrote:
>>>>>>> Now that PCIIDEState::{cmd,data}_ops are initialized in the base class
>>>>>>> constructor there is an opportunity for PIIX to reuse these attributes. This
>>>>>>> resolves usage of ide_init_ioport() which would fall back internally to using
>>>>>>> the isabus global due to NULL being passed as ISADevice by PIIX.
>>>>>>>
>>>>>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>>>>>>> ---
>>>>>>>    hw/ide/piix.c | 30 +++++++++++++-----------------
>>>>>>>    1 file changed, 13 insertions(+), 17 deletions(-)
>>>>>>>
>>>>>>> diff --git a/hw/ide/piix.c b/hw/ide/piix.c
>>>>>>> index a3a15dc7db..406a67fa0f 100644
>>>>>>> --- a/hw/ide/piix.c
>>>>>>> +++ b/hw/ide/piix.c
>>>>>>> @@ -104,34 +104,32 @@ static void piix_ide_reset(DeviceState *dev)
>>>>>>>        pci_set_byte(pci_conf + 0x20, 0x01);  /* BMIBA: 20-23h */
>>>>>>>    }
>>>>>>>    -static bool pci_piix_init_bus(PCIIDEState *d, unsigned i, ISABus *isa_bus,
>>>>>>> -                              Error **errp)
>>>>>>> +static void pci_piix_init_bus(PCIIDEState *d, unsigned i, ISABus *isa_bus)
>>>>>>>    {
>>>>>>>        static const struct {
>>>>>>>            int iobase;
>>>>>>>            int iobase2;
>>>>>>>            int isairq;
>>>>>>>        } port_info[] = {
>>>>>>> -        {0x1f0, 0x3f6, 14},
>>>>>>> -        {0x170, 0x376, 15},
>>>>>>> +        {0x1f0, 0x3f4, 14},
>>>>>>> +        {0x170, 0x374, 15},
>>>>>>>        };
>>>>>>> -    int ret;
>>>>>>> +    MemoryRegion *address_space_io = pci_address_space_io(PCI_DEVICE(d));
>>>>>>>          ide_bus_init(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
>>>>>>> -    ret = ide_init_ioport(&d->bus[i], NULL, port_info[i].iobase,
>>>>>>> -                          port_info[i].iobase2);
>>>>>>> -    if (ret) {
>>>>>>> -        error_setg_errno(errp, -ret, "Failed to realize %s port %u",
>>>>>>> -                         object_get_typename(OBJECT(d)), i);
>>>>>>> -        return false;
>>>>>>> -    }
>>>>>>> +    memory_region_add_subregion(address_space_io, port_info[i].iobase,
>>>>>>> +                                &d->data_ops[i]);
>>>>>>> +    /*
>>>>>>> +     * PIIX forwards the last byte of cmd_ops to ISA. Model this using a low
>>>>>>> +     * prio so competing memory regions take precedence.
>>>>>>> +     */
>>>>>>> +    memory_region_add_subregion_overlap(address_space_io, port_info[i].iobase2,
>>>>>>> +                                        &d->cmd_ops[i], -1);
>>>>>>
>>>>>> Interesting. Is this behaviour documented somewhere and/or used in one of your test images at all? If I'd have seen this myself, I probably thought that the addresses were a typo...
>>>>>
>>>>> I first  stumbled upon this and wondered why this code was working with VIA_IDE (through my pc-via branch). Then I found the correct offsets there which are confirmed in the piix datasheet, e.g.: "Secondary Control Block Offset: 0374h"
>>>>
>>>> In case you were wondering about the forwarding of the last byte the datasheet says: "Accesses to byte 3 of the Control Block are forwarded to ISA where the floppy disk controller responds."
>>>
>>> Ahhh okay okay I see what's happening here: the PIIX IDE is assuming that the legacy ioport semantics are in operation here, which as you note above is where the FDC controller is also accessed via the above byte in the IDE control block. This is also why you need to change the address above from 0x3f6/0x376 to 0x3f4/0x374 when trying to use the MemoryRegions used for the PCI BARs since the PCI IDE controller specification requires a 4 byte allocation for the Control Block - see sections 2.0 and 2.2.
>>
>> Yes, PIIX assuming that might be the case. Why does it contradict the PCI IDE specification? PIIX seems to apply the apprppriate "workarounds" here.
>>
>>>
>>> And that's fine, because the portio_lists used in ide_init_ioport() set up the legacy IDE ioports so that FDC accesses done in this way can succeed, and the PIIX IDE is hard-coded to legacy mode. So in fact PIIX IDE should keep using ide_init_ioport() rather than trying to re-use the BAR MemoryRegions so I think this patch should just be dropped.
>>
>> I was hoping to keep that patch...
>
> The whole paragraph reads: "PIIX4 claims all accesses to these ranges, 
> if enabled. The byte enables do not have to be externally decoded to 
> assert DEVSEL#. Accesses to byte 3 of the Control Block are forwarded to 
> ISA where the floppy disk controller responds." So PIIX doesn't look at 
> the individual io ports but rather at the whole blocks covering them.

I don't mind either way if this patch is dropped or not, I could imagine 
there could be reasons for both decisions. Also this is changing piix 
which I'm not concerned with but still commenting on this hoping to help 
to reach a decision.

> To me, this sounds like PIIX is applying the PCI IDE controller 
> specification without the native option.

What is that? Isn't "PCI IDE without native option" just legacy IDE i.e. 
fixed io regions and 14/15 IRQs? If so then it could be either modelled 
with ISA functions as it is now or you could reuse code from PCI IDE which 
would normally allow to set these io regions via BARs but not using thar 
here and just hard coding it to legacy ports.

> In QEMU the block part of the 
> specification is implemented by cmd_bar and data_bar. I think that 
> reusing the blocks here in fact models the PIIX datasheet closer than 
> the current implementation. I'd therefore keep this patch.

I'm not sure PIIX follows the PCI IDE spec and you may just try too hard 
to reuse code from an unrelated model here that happens to match as both 
are following legacy ISA IDE for compatibility. That's not necessarily a 
problem, but just call it what it is and keep the naming consistent to PCI 
IDE where these are BARs but are not used as such here. You can add a 
comment to note this if it disturbs you to explain why these are 
hardcoded here.

On the other hand if we consider this a legacy device that should be 
modelled accordingly then this patch may not be needed which is I think 
what Mark pointed out.

Now the question is if we want to reduce the use of legacy ISA IDE 
functions hoping we could get rid of it eventually so we go with reusing a 
slightly unrelated PCI IDE model which would work here and would allow 
more code sharing; or we want to reduce code churn and keep the model as 
it is which is already modelling the device as legacy IDE.

I can't decide on that. Dropping the patch reduces code churn and may be 
slighly cleaner but keeping it may allow more code reuse and potentially 
removing some legacy ISA stuff which may allow simplifying that part, even 
if it may need a comment here to explain that more here. Both sides have 
merrits and don't know who could be the one to make a decison. Maybe the 
maintainer of the code part? (Oops, it does not really have one... Then 
no idea.)

I don't know this well and did not follow it too deeply so in case I've 
completely misunderstood it or missed an important detail then just 
disregard all of the above.

Regards,
BALATON Zoltan

