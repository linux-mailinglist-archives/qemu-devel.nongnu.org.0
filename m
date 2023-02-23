Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7389B6A13F6
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 00:48:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVLJw-0007rx-0C; Thu, 23 Feb 2023 18:48:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pVLJo-0007rh-Sz; Thu, 23 Feb 2023 18:48:08 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pVLJl-0002RM-3s; Thu, 23 Feb 2023 18:48:08 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 139F0746346;
 Fri, 24 Feb 2023 00:47:59 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id C05DF746324; Fri, 24 Feb 2023 00:47:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id BEB63745720;
 Fri, 24 Feb 2023 00:47:58 +0100 (CET)
Date: Fri, 24 Feb 2023 00:47:58 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
 Huacai Chen <chenhuacai@kernel.org>, qemu-ppc@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 2/5] hw/isa/vt82c686: Implement PCI IRQ routing
In-Reply-To: <83759E2D-1871-4D26-906A-F9112990BDFF@gmail.com>
Message-ID: <b8d457d1-40b1-adb5-a2ac-98070f62ac1e@eik.bme.hu>
References: <20230223202053.117050-1-shentey@gmail.com>
 <20230223202053.117050-3-shentey@gmail.com>
 <a9efb349-e2b9-1ece-cded-ee500457f1cf@eik.bme.hu>
 <83759E2D-1871-4D26-906A-F9112990BDFF@gmail.com>
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

On Thu, 23 Feb 2023, Bernhard Beschow wrote:
> Am 23. Februar 2023 21:11:23 UTC schrieb BALATON Zoltan <balaton@eik.bme.hu>:
>> On Thu, 23 Feb 2023, Bernhard Beschow wrote:
>>> The real VIA south bridges implement a PCI IRQ router which is configured
>>> by the BIOS or the OS. In order to respect these configurations, QEMU
>>> needs to implement it as well.
>>>
>>> Note: The implementation was taken from piix4_set_irq() in hw/isa/piix4.
>>>
>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>>> ---
>>> hw/isa/vt82c686.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
>>> 1 file changed, 44 insertions(+)
>>>
>>> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
>>> index 3f9bd0c04d..f24e387d63 100644
>>> --- a/hw/isa/vt82c686.c
>>> +++ b/hw/isa/vt82c686.c
>>> @@ -604,6 +604,48 @@ static void via_isa_request_i8259_irq(void *opaque, int irq, int level)
>>>     qemu_set_irq(s->cpu_intr, level);
>>> }
>>>
>>> +static int via_isa_get_pci_irq(const ViaISAState *s, int irq_num)
>>> +{
>>> +    switch (irq_num) {
>>> +    case 0:
>>> +        return s->dev.config[0x55] >> 4;
>>> +
>>> +    case 1:
>>> +        return s->dev.config[0x56] & 0xf;
>>> +
>>> +    case 2:
>>> +        return s->dev.config[0x56] >> 4;
>>> +
>>> +    case 3:
>>> +        return s->dev.config[0x57] >> 4;
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static void via_isa_set_pci_irq(void *opaque, int irq_num, int level)
>>> +{
>>> +    ViaISAState *s = opaque;
>>> +    PCIBus *bus = pci_get_bus(&s->dev);
>>> +    int pic_irq;
>>> +
>>> +    /* now we change the pic irq level according to the via irq mappings */
>>> +    /* XXX: optimize */
>>> +    pic_irq = via_isa_get_pci_irq(s, irq_num);
>>> +    if (pic_irq < ISA_NUM_IRQS) {
>>> +        int i, pic_level;
>>> +
>>> +        /* The pic level is the logical OR of all the PCI irqs mapped to it. */
>>> +        pic_level = 0;
>>> +        for (i = 0; i < PCI_NUM_PINS; i++) {
>>> +            if (pic_irq == via_isa_get_pci_irq(s, i)) {
>>> +                pic_level |= pci_bus_get_irq_level(bus, i);
>>> +            }
>>> +        }
>>> +        qemu_set_irq(s->isa_irqs[pic_irq], pic_level);
>>> +    }
>>> +}
>>> +
>>> static void via_isa_realize(PCIDevice *d, Error **errp)
>>> {
>>>     ViaISAState *s = VIA_ISA(d);
>>> @@ -676,6 +718,8 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
>>>     if (!qdev_realize(DEVICE(&s->mc97), BUS(pci_bus), errp)) {
>>>         return;
>>>     }
>>> +
>>> +    pci_bus_irqs(pci_bus, via_isa_set_pci_irq, s, PCI_NUM_PINS);
>>
>> Please no oversimplification. This replaces the connections to mv64361 gpp pins made in mv64361_realize() and breaks the interrupts that can be enabled in mv64361.
>
> Let's split our work as follows: You'll do the audio and pegasos2 
> changes including exporting the pirq properties, I'll do the first three 
> routing patches of this series as the base.

I'm OK with doing audio as said and already did the PIRQ and pegaosos2 
changes (patch 2 and 3 in my series), just take those without deleting 
half of them. So drop the last two via-ac97 patches and do the IRQ fixes 
in your way but keep working what now works.

>> I've implemented that for something but can't remember now which guest exactly,
>
> Could you please put this information into the commit message or into 
> the code? That would ease maintainance a lot.

I did, see patch 3 in my series.

>> but this would be needed so please restore my pegasos2 patch and move 
>> this there connecting both mv64361 and via-isa to PCI interrupts as 
>> shown in the schematics. That means you also need the PIRQ pins here. 
>> Can you do a new version with that?
>
> As proposed above I'd fold the first three patches into a separate 
> series which you can build upon. I have no way to test the pegasos2 IRQ 
> changes since the test cases I'm aware of either work or we agreed that 
> they can be fixed later (-> USB).

I did fix the USB just haven't sent a v2 yet due to this thread but it's 
just the change I've sent yesterday, just add this before qemu_set_irq at 
the end of via_isa_set_irq() in my series. This is what I have now:

+    uint16_t old_state;
+    if (old_state && s->isa_irq_state[isa_irq]) {
+        /* FIXME: i8259 model does not support level sensitive mode */
+        qemu_set_irq(s->isa_irqs[isa_irq], 0);
+    }

How to do that with your version I have no idea but this fixed the problem 
with my series. I can send a v2 of this patch with this change if it's not 
clear from this and the other message what I did.

>> I'll try this one in the meantime
>
> Sounds good to me -- that's what I wanted to achieve ;) Thanks!

I've answered about that in the other message, I've tried with AmigaOS, 
Debian Linux 8.11.0 netboot iso and MorphOS and they still boot but 
couldn't test them much yet. MorphOS works on my series with sound and USB 
and does not hang with the above workaround but found now it still hangs 
if I send something to it over serial (e.g. press space or enter where 
you've typed boot cd boot.img after it starts playing sound). This happens 
on both of our series but only with the via-ac97 patch so probably related 
to that. This could easily be a guest bug too so I don't care that much, 
the pegasos2 changes are more interesting to get AmigaOS run well so 
that's my main focus now, MorphOS already runs on other QEMU machines 
well. I'll still try to find this out but AmigaOS can use other sound card 
so as long as the IRQ problems are fixed it would work but we need more 
than one PCI cards working as we'd need sound card and network card for it 
to be usable. This was tested to work with my series, if you give 
alternative series I can ask to have those tested too.

Regards,
BALATON Zoltan

