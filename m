Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAB96A7629
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 22:28:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXTz5-0000qs-D9; Wed, 01 Mar 2023 16:27:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pXTz3-0000l6-Cp; Wed, 01 Mar 2023 16:27:33 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pXTz1-0006GV-7G; Wed, 01 Mar 2023 16:27:33 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id E6AFA7457E7;
 Wed,  1 Mar 2023 22:27:24 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id A30D7745720; Wed,  1 Mar 2023 22:27:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id A1C22745706;
 Wed,  1 Mar 2023 22:27:24 +0100 (CET)
Date: Wed, 1 Mar 2023 22:27:24 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org, 
 ReneEngel80@emailn.de
Subject: Re: [PATCH v5 3/7] hw/isa/vt82c686: Implement PCI IRQ routing
In-Reply-To: <C6D02032-862B-4159-933C-D2B8C2BE00CC@gmail.com>
Message-ID: <eea0288f-d086-bc97-81ef-3ff9dcaef570@eik.bme.hu>
References: <cover.1677628524.git.balaton@eik.bme.hu>
 <36574dd259a98b240bfe12cd9ffa30b778bf06eb.1677628524.git.balaton@eik.bme.hu>
 <375EC0ED-F7D8-4A40-B316-F7BA32709836@gmail.com>
 <794ef01a-730b-46c6-2e79-95c68bc42102@eik.bme.hu>
 <C6D02032-862B-4159-933C-D2B8C2BE00CC@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1241327770-1677706044=:23145"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1241327770-1677706044=:23145
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 1 Mar 2023, Bernhard Beschow wrote:
> Am 1. März 2023 11:15:02 UTC schrieb BALATON Zoltan <balaton@eik.bme.hu>:
>> On Wed, 1 Mar 2023, Bernhard Beschow wrote:
>>> Am 1. März 2023 00:17:09 UTC schrieb BALATON Zoltan <balaton@eik.bme.hu>:
>>>> The real VIA south bridges implement a PCI IRQ router which is configured
>>>> by the BIOS or the OS. In order to respect these configurations, QEMU
>>>> needs to implement it as well. The real chip may allow routing IRQs from
>>>> internal functions independently of PCI interrupts but since guests
>>>> usually configute it to a single shared interrupt we don't model that
>>>> here for simplicity.
>>>>
>>>> Note: The implementation was taken from piix4_set_irq() in hw/isa/piix4.
>>>>
>>>> Suggested-by: Bernhard Beschow <shentey@gmail.com>
>>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>>> ---
>>>> hw/isa/vt82c686.c | 38 +++++++++++++++++++++++++++++++++++++-
>>>> 1 file changed, 37 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
>>>> index 01e0148967..018a119964 100644
>>>> --- a/hw/isa/vt82c686.c
>>>> +++ b/hw/isa/vt82c686.c
>>>> @@ -604,6 +604,42 @@ static void via_isa_request_i8259_irq(void *opaque, int irq, int level)
>>>>     qemu_set_irq(s->cpu_intr, level);
>>>> }
>>>>
>>>> +static int via_isa_get_pci_irq(const ViaISAState *s, int irq_num)
>>>> +{
>>>> +    switch (irq_num) {
>>>> +    case 0:
>>>> +        return s->dev.config[0x55] >> 4;
>>>> +    case 1:
>>>> +        return s->dev.config[0x56] & 0xf;
>>>> +    case 2:
>>>> +        return s->dev.config[0x56] >> 4;
>>>> +    case 3:
>>>> +        return s->dev.config[0x57] >> 4;
>>>> +    }
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static void via_isa_set_pci_irq(void *opaque, int irq_num, int level)
>>>> +{
>>>> +    ViaISAState *s = opaque;
>>>> +    PCIBus *bus = pci_get_bus(&s->dev);
>>>> +    int i, pic_level, pic_irq = via_isa_get_pci_irq(s, irq_num);
>>>> +
>>>> +    if (unlikely(pic_irq == 0 || pic_irq == 2 || pic_irq > 14)) {
>>>
>>> Where does the "pic_irq > 14" come from? It's not mentioned in the datasheet.
>>
>> Check at 0x3c register of USB and AC97 functions. For the others it may be valid but unlikely to be used hence we just disallow it. (In my version which also mapped IDE here I've checkrf for each source but there's no way to do that in this version.)
>
> I'm not sure what you mean. The 0x3c regs aren't related to the PCI IRQ routing regs.
>
> Moreover, as I wrote in my other mail, I wonder what the datasheet tries to tell us here at all. The information there partly contradicts itself.
>
> Can you please clarify?

Here is the entire register desription that you've partly quoted before:

Offset 3C - Interrupt Line (00h)...................................... RW
7-4 Reserved ........................................always reads 0
3-0 USB Interrupt Routing ........................ default = 16h
0000 Disabled................................................. default
0001 IRQ1
0010 Reserved
0011 IRQ3
0100 IRQ4
0101 IRQ5
0110 IRQ6
0111 IRQ7
1000 IRQ8
1001 IRQ9
1010 IRQ10
1011 IRQ11
1100 IRQ12
1101 IRQ13
1110 IRQ14
1111 Disabled

Apart from the obvious typo stating default 16h the list below clearly 
says that the default is really 0 and 0 and 15 means Disabled (so if this 
is a copy paste error and the default should be 15 that would still mean 
it's disabled by default) and could be routed to any other ISA IRQ but 
you really should not route it to 2 as that would mess up the cascade IRQ. 
That's how I read that.

And yes I was trying to tell you rhat this is not related to the PCI IRQ 
routing regs which only set the IRQ for the PIRQ pins ahd this one sets 
the IRQ for the function it belongs to (USB, AC97, etc.) independently of 
that. Your patch which is now in the series does not implement this but 
uses pci interrupts instead and still works because guests don't seem to 
actually route IRQs to different interrupts just put everything on IRQ9 so 
your patch still works. As this makes QEMU model simpler we can do that 
and later if we ever need to model this for a guest that actually wants to 
use this feature of the chip you'll have my v1 series in the list archives 
where I've tried to implement the above. For me we can end it here.

Regards,
BALATON Zoltan
--3866299591-1241327770-1677706044=:23145--

