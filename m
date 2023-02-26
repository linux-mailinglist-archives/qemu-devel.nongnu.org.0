Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A63CF6A3599
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 00:35:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWQWK-0000z5-EO; Sun, 26 Feb 2023 18:33:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pWQWH-0000ym-La; Sun, 26 Feb 2023 18:33:29 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pWQWF-0008HC-1c; Sun, 26 Feb 2023 18:33:29 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id F157674635C;
 Mon, 27 Feb 2023 00:33:21 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id E7E43745720; Mon, 27 Feb 2023 00:33:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id E3B6E745706;
 Mon, 27 Feb 2023 00:33:20 +0100 (CET)
Date: Mon, 27 Feb 2023 00:33:20 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, ReneEngel80@emailn.de
Subject: Re: [PATCH v3 4/8] hw/isa/vt82c686: Implement PCI IRQ routing
In-Reply-To: <F86A8AF3-8D69-497A-ADD1-688D2B4FED03@gmail.com>
Message-ID: <04111f8e-e24d-2a61-d359-f20f8cd4634e@eik.bme.hu>
References: <cover.1677445307.git.balaton@eik.bme.hu>
 <0fd9eac9174a840054c511fbc015048929c7bc40.1677445307.git.balaton@eik.bme.hu>
 <F86A8AF3-8D69-497A-ADD1-688D2B4FED03@gmail.com>
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

On Sun, 26 Feb 2023, Bernhard Beschow wrote:
> Am 25. Februar 2023 18:11:49 UTC schrieb BALATON Zoltan <balaton@eik.bme.hu>:
>> From: Bernhard Beschow <shentey@gmail.com>
>>
>> The real VIA south bridges implement a PCI IRQ router which is configured
>> by the BIOS or the OS. In order to respect these configurations, QEMU
>> needs to implement it as well.
>>
>> Note: The implementation was taken from piix4_set_irq() in hw/isa/piix4.
>>
>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>> [balaton: declare gpio inputs instead of changing pci bus irqs so it can
>> be connected in board code; remove some empty lines]
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> Tested-by: Rene Engel <ReneEngel80@emailn.de>
>> ---
>> hw/isa/vt82c686.c | 39 +++++++++++++++++++++++++++++++++++++++
>> 1 file changed, 39 insertions(+)
>>
>> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
>> index 3f9bd0c04d..4025f9bcdc 100644
>> --- a/hw/isa/vt82c686.c
>> +++ b/hw/isa/vt82c686.c
>> @@ -604,6 +604,44 @@ static void via_isa_request_i8259_irq(void *opaque, int irq, int level)
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
>> +    int pic_irq;
>> +
>> +    /* now we change the pic irq level according to the via irq mappings */
>> +    /* XXX: optimize */
>> +    pic_irq = via_isa_get_pci_irq(s, irq_num);
>> +    if (pic_irq < ISA_NUM_IRQS) {
>> +        int i, pic_level;
>> +
>> +        /* The pic level is the logical OR of all the PCI irqs mapped to it. */
>> +        pic_level = 0;
>> +        for (i = 0; i < PCI_NUM_PINS; i++) {
>> +            if (pic_irq == via_isa_get_pci_irq(s, i)) {
>> +                pic_level |= pci_bus_get_irq_level(bus, i);
>> +            }
>> +        }
>> +        qemu_set_irq(s->isa_irqs[pic_irq], pic_level);
>> +    }
>> +}
>> +
>> static void via_isa_realize(PCIDevice *d, Error **errp)
>> {
>>     ViaISAState *s = VIA_ISA(d);
>> @@ -614,6 +652,7 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
>>     int i;
>>
>>     qdev_init_gpio_out(dev, &s->cpu_intr, 1);
>> +    qdev_init_gpio_in_named(dev, via_isa_set_pci_irq, "pirq", PCI_NUM_PINS);
>
> This line is a Pegasos2 specific addition for fixing its IRQ handling. Since this code must also work with the Fuloong2e board we should aim for a minimal changeset here which renders this line out of scope.
>
> Let's keep the two series separate since now I need to watch two series for comments. Please use Based-on: tag next time instead.

Well, it's not. It's part of the QDev model for VT8231 that allows it to 
be connected by boards so I think this belongs here otherwise this won't 
even compile because the function you've added would be unused and bail on 
-Werror. Let's not make this more difficult than it is. I'm OK with 
reasonable changes but what's your goal now? You can't get rid of this 
line as it's how QDev can model it. Either I have to call into this model 
or have to export these pins as gpios.

Regards,
BALATON Zoltan

> Thanks,
> Bernhard
>
>>     isa_irq = qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
>>     isa_bus = isa_bus_new(dev, pci_address_space(d), pci_address_space_io(d),
>>                           errp);
>
>

