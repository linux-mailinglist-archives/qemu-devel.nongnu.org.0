Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9C36A6B8A
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 12:15:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXKQZ-0005rn-5O; Wed, 01 Mar 2023 06:15:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pXKQP-0005rP-F5; Wed, 01 Mar 2023 06:15:09 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pXKQN-0001o8-DD; Wed, 01 Mar 2023 06:15:09 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id D9E6B74638A;
 Wed,  1 Mar 2023 12:15:03 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id CC9197462DB; Wed,  1 Mar 2023 12:15:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id CB41D7457E7;
 Wed,  1 Mar 2023 12:15:02 +0100 (CET)
Date: Wed, 1 Mar 2023 12:15:02 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org, 
 ReneEngel80@emailn.de
Subject: Re: [PATCH v5 3/7] hw/isa/vt82c686: Implement PCI IRQ routing
In-Reply-To: <375EC0ED-F7D8-4A40-B316-F7BA32709836@gmail.com>
Message-ID: <794ef01a-730b-46c6-2e79-95c68bc42102@eik.bme.hu>
References: <cover.1677628524.git.balaton@eik.bme.hu>
 <36574dd259a98b240bfe12cd9ffa30b778bf06eb.1677628524.git.balaton@eik.bme.hu>
 <375EC0ED-F7D8-4A40-B316-F7BA32709836@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-878357434-1677669302=:74695"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--3866299591-878357434-1677669302=:74695
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 1 Mar 2023, Bernhard Beschow wrote:
> Am 1. März 2023 00:17:09 UTC schrieb BALATON Zoltan <balaton@eik.bme.hu>:
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
>> ---
>> hw/isa/vt82c686.c | 38 +++++++++++++++++++++++++++++++++++++-
>> 1 file changed, 37 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
>> index 01e0148967..018a119964 100644
>> --- a/hw/isa/vt82c686.c
>> +++ b/hw/isa/vt82c686.c
>> @@ -604,6 +604,42 @@ static void via_isa_request_i8259_irq(void *opaque, int irq, int level)
>>     qemu_set_irq(s->cpu_intr, level);
>> }
>>
>> +static int via_isa_get_pci_irq(const ViaISAState *s, int irq_num)
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
>> +    if (unlikely(pic_irq == 0 || pic_irq == 2 || pic_irq > 14)) {
>
> Where does the "pic_irq > 14" come from? It's not mentioned in the datasheet.

Check at 0x3c register of USB and AC97 functions. For the others it may be 
valid but unlikely to be used hence we just disallow it. (In my version 
which also mapped IDE here I've checkrf for each source but there's no way 
to do that in this version.)

Regards,
BALATON Zoltan

>> +        return;
>> +    }
>> +
>> +    /* The pic level is the logical OR of all the PCI irqs mapped to it. */
>> +    pic_level = 0;
>> +    for (i = 0; i < PCI_NUM_PINS; i++) {
>> +        if (pic_irq == via_isa_get_pci_irq(s, i)) {
>> +            pic_level |= pci_bus_get_irq_level(bus, i);
>> +        }
>> +    }
>> +    /* Now we change the pic irq level according to the via irq mappings. */
>> +    qemu_set_irq(s->isa_irqs_in[pic_irq], pic_level);
>> +}
>> +
>> static void via_isa_realize(PCIDevice *d, Error **errp)
>> {
>>     ViaISAState *s = VIA_ISA(d);
>> @@ -615,9 +651,9 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
>>
>>     qdev_init_gpio_out(dev, &s->cpu_intr, 1);
>>     isa_irq = qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
>> +    qdev_init_gpio_in_named(dev, via_isa_set_pci_irq, "pirq", PCI_NUM_PINS);
>>     isa_bus = isa_bus_new(dev, pci_address_space(d), pci_address_space_io(d),
>>                           errp);
>> -
>>     if (!isa_bus) {
>>         return;
>>     }
>
>
--3866299591-878357434-1677669302=:74695--

