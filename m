Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEC66AD33C
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 01:20:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZL4J-0007Lf-VQ; Mon, 06 Mar 2023 19:20:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pZL44-0007LD-C1; Mon, 06 Mar 2023 19:20:25 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pZL42-0005Wy-1M; Mon, 06 Mar 2023 19:20:24 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id AC9CB74634B;
 Tue,  7 Mar 2023 01:20:07 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 6A86974633D; Tue,  7 Mar 2023 01:20:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 68D1B74632B;
 Tue,  7 Mar 2023 01:20:07 +0100 (CET)
Date: Tue, 7 Mar 2023 01:20:07 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Bernhard Beschow <shentey@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org, 
 ReneEngel80@emailn.de
Subject: Re: [PATCH v8 3/6] hw/isa/vt82c686: Implement PCI IRQ routing
In-Reply-To: <0ca8d3d3-2e42-a8c0-ed59-bc543e4149bd@ilande.co.uk>
Message-ID: <3cbf9e02-5660-18dd-783b-9f9f09fe35bb@eik.bme.hu>
References: <cover.1678105081.git.balaton@eik.bme.hu>
 <23370610213adb60877c3751f954b203fe2fa775.1678105081.git.balaton@eik.bme.hu>
 <0ca8d3d3-2e42-a8c0-ed59-bc543e4149bd@ilande.co.uk>
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

On Mon, 6 Mar 2023, Mark Cave-Ayland wrote:
> On 06/03/2023 12:33, BALATON Zoltan wrote:
>> The real VIA south bridges implement a PCI IRQ router which is configured
>> by the BIOS or the OS. In order to respect these configurations, QEMU
>> needs to implement it as well. The real chip may allow routing IRQs from
>> internal functions independently of PCI interrupts but since guests
>> usually configute it to a single shared interrupt we don't model that
>> here for simplicity.
>> 
>> Note: The implementation was taken from piix4_set_irq() in hw/isa/piix4.
>> 
>> Suggested-by: Bernhard Beschow <shentey@gmail.com>
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> Tested-by: Rene Engel <ReneEngel80@emailn.de>
>> ---
>>   hw/isa/vt82c686.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 42 insertions(+)
>> 
>> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
>> index 8900d87f59..3383ab7e2d 100644
>> --- a/hw/isa/vt82c686.c
>> +++ b/hw/isa/vt82c686.c
>> @@ -600,6 +600,46 @@ void via_isa_set_irq(PCIDevice *d, int n, int level)
>>       qemu_set_irq(s->isa_irqs_in[n], level);
>>   }
>>   +static int via_isa_get_pci_irq(const ViaISAState *s, int irq_num)
>> +{
>> +    switch (irq_num) {
>> +    case 0:
>> +        return s->dev.config[0x55] >> 4;
>> +    case 1:
>> +        return s->dev.config[0x56] & 0xf;
>> +    case 2:
>> +        return s->dev.config[0x56] >> 4;
>> +    case 3:
>> +        return s->dev.config[0x57] >> 4;
>> +    }
>> +    return 0;
>> +}
>> +
>> +static void via_isa_set_pci_irq(void *opaque, int irq_num, int level)
>> +{
>> +    ViaISAState *s = opaque;
>> +    PCIBus *bus = pci_get_bus(&s->dev);
>> +    int i, pic_level, pic_irq = via_isa_get_pci_irq(s, irq_num);
>> +
>> +    /* IRQ 0: disabled, IRQ 2,8,13: reserved */
>> +    if (!pic_irq) {
>> +        return;
>> +    }
>> +    if (unlikely(pic_irq == 2 || pic_irq == 8 || pic_irq == 13)) {
>> +        qemu_log_mask(LOG_GUEST_ERROR, "Invalid ISA IRQ routing");
>> +    }
>> +
>> +    /* The pic level is the logical OR of all the PCI irqs mapped to it. 
>> */
>> +    pic_level = 0;
>> +    for (i = 0; i < PCI_NUM_PINS; i++) {
>> +        if (pic_irq == via_isa_get_pci_irq(s, i)) {
>> +            pic_level |= pci_bus_get_irq_level(bus, i);
>> +        }
>> +    }
>> +    /* Now we change the pic irq level according to the via irq mappings. 
>> */
>> +    qemu_set_irq(s->isa_irqs_in[pic_irq], pic_level);
>> +}
>> +
>>   static void via_isa_realize(PCIDevice *d, Error **errp)
>>   {
>>       ViaISAState *s = VIA_ISA(d);
>> @@ -620,6 +660,8 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
>>       i8254_pit_init(isa_bus, 0x40, 0, NULL);
>>       i8257_dma_init(isa_bus, 0);
>>   +    qdev_init_gpio_in_named(dev, via_isa_set_pci_irq, "pirq", 
>> PCI_NUM_PINS);
>> +
>>       /* RTC */
>>       qdev_prop_set_int32(DEVICE(&s->rtc), "base_year", 2000);
>>       if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), errp)) {
>
> Writing my previous response where I asked about the additional PCI interrupt 
> connections to the MV64361, I realised that if you forget about the 
> Northbridge component for a moment then things start to make a bit more 
> sense.
>
> At the moment we have 3 different scenarios:
>
>   1) ISA IRQ -> 8259 for all ISA devices
>
>   2) ISA IRQ -> 8259 *OR*
>      PCI IRQ -> PCI IRQ router -> 8259 for the PCI-IDE device
>
>   3) PCI IRQ -> PCI IRQ router -> 8259 for PCI devices
>
> When you look at it this way it is easy to see for case 3 that the PCI IRQ 
> routing mechanism is handled by *_set_irq() and *_map_irq() callbacks. And so 
> with that in mind, re-reading the VIA datasheet I came up with the following 
> PoC for discussion: https://github.com/mcayland/qemu/commits/via-poc.

At first glance this is basically what I had in v1 of this series just 
using PCI function numbers instead of an enum to find the IRQ source.

> It needs a bit of work, but at first glance it ticks all the boxes in that 
> the PCI bus IRQs are all internal to the VIA southbridge (no global 
> via_isa_set_irq() function and no overriding of PCI bus IRQs), there are 
> separate legacy and PCI IRQs for the via-ide device, and the PCI IRQ routing 
> bears at least a passing resemblance to the datasheet.

Given that we only have a few hours left until the freeze I hope you're 
not proposing to drop this series and postpone all this to the next 
release, only that we do this clean up in the next devel cycle. You were 
away when this series were on the list for review so this is a bit late 
now for a big rewrite. (Especially that what you propose is a variant of 
the original I've submitted that I had to change due to other review 
comments.)

Since this version was tested and works please accept this for QEMU 8.0 
now then we can work out your idea in the next devel cycle but until then 
this version allows people to run AmigaOS on pegasos2 with sound which is 
the goal I want to achieve for QEMU 8.0 and does not introduce any change 
to via-ide which was good enough for the last two years so it should be 
good enough for a few more months.

Regards,
BALATON Zoltan

