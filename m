Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9B16AB187
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Mar 2023 18:10:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYrqq-00021L-Qg; Sun, 05 Mar 2023 12:08:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pYrqo-00020u-8B; Sun, 05 Mar 2023 12:08:46 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pYrqm-00041H-48; Sun, 05 Mar 2023 12:08:45 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 5183374634B;
 Sun,  5 Mar 2023 18:08:30 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 0E0A6746346; Sun,  5 Mar 2023 18:08:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 0C3137462DB;
 Sun,  5 Mar 2023 18:08:30 +0100 (CET)
Date: Sun, 5 Mar 2023 18:08:30 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org, 
 ReneEngel80@emailn.de
Subject: Re: [PATCH v7 3/6] hw/isa/vt82c686: Implement PCI IRQ routing
In-Reply-To: <BB2359B3-F746-4D2D-BBB7-7FC744D5718A@gmail.com>
Message-ID: <33eebf66-d4d1-d25f-dbd8-2fdefa0fe211@eik.bme.hu>
References: <cover.1678023358.git.balaton@eik.bme.hu>
 <2c1aa2fad58fffa4e26e8e271243ed30ecd9d41d.1678023358.git.balaton@eik.bme.hu>
 <BB2359B3-F746-4D2D-BBB7-7FC744D5718A@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1032981043-1678036110=:86601"
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

--3866299591-1032981043-1678036110=:86601
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sun, 5 Mar 2023, Bernhard Beschow wrote:
> Am 5. März 2023 14:05:49 UTC schrieb BALATON Zoltan <balaton@eik.bme.hu>:
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
>> hw/isa/vt82c686.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>> 1 file changed, 42 insertions(+)
>>
>> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
>> index 8900d87f59..e5aa467506 100644
>> --- a/hw/isa/vt82c686.c
>> +++ b/hw/isa/vt82c686.c
>> @@ -600,6 +600,46 @@ void via_isa_set_irq(PCIDevice *d, int n, int level)
>>     qemu_set_irq(s->isa_irqs_in[n], level);
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
>> +    /* IRQ 0 and 15 mean disabled, IRQ 2 is reserved */
>
> The vt82c686b datasheet mentions that IRQs 2, 8 and 13 are reserved (-> 
> guest errors) while only 0 means disabled. I think below code should 
> reflect this.

We can't because 8 and 13 are allowed for USB and ac97 but 15 means 
disabled for those. My original implementation would have allowed to 
implement that but this one from you mixes everyting with the PIRQ pins so 
we can't implement different reserved/disabled values for different IRQ 
sources so this is the best we can do. IRQ 0 is already handled as 
disabled by the code below.

Regards,
BALATON Zoltan

>> +    if (unlikely(pic_irq == 0 || pic_irq == 2 || pic_irq > 14)) {
>> +        if (pic_irq == 2) {
>> +            qemu_log_mask(LOG_GUEST_ERROR, "Invalid ISA IRQ routing");
>> +        }
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
>> @@ -620,6 +660,8 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
>>     i8254_pit_init(isa_bus, 0x40, 0, NULL);
>>     i8257_dma_init(isa_bus, 0);
>>
>> +    qdev_init_gpio_in_named(dev, via_isa_set_pci_irq, "pirq", PCI_NUM_PINS);
>> +
>>     /* RTC */
>>     qdev_prop_set_int32(DEVICE(&s->rtc), "base_year", 2000);
>>     if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), errp)) {
>
>
--3866299591-1032981043-1678036110=:86601--

