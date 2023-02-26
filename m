Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2311E6A34CC
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Feb 2023 23:49:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWPo5-0001E8-10; Sun, 26 Feb 2023 17:47:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pWPo2-0001Do-8h; Sun, 26 Feb 2023 17:47:46 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pWPo0-0001Wl-1E; Sun, 26 Feb 2023 17:47:45 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 63F54746369;
 Sun, 26 Feb 2023 23:47:40 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 2941174635C; Sun, 26 Feb 2023 23:47:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 27EB6745706;
 Sun, 26 Feb 2023 23:47:40 +0100 (CET)
Date: Sun, 26 Feb 2023 23:47:40 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Bernhard Beschow <shentey@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, ReneEngel80@emailn.de
Subject: Re: [PATCH v3 4/8] hw/isa/vt82c686: Implement PCI IRQ routing
In-Reply-To: <a496276e-24fb-e2bc-fbdf-ace9ef7f361f@linaro.org>
Message-ID: <628a581c-b670-c87f-7619-bef9cb398c86@eik.bme.hu>
References: <cover.1677445307.git.balaton@eik.bme.hu>
 <0fd9eac9174a840054c511fbc015048929c7bc40.1677445307.git.balaton@eik.bme.hu>
 <a496276e-24fb-e2bc-fbdf-ace9ef7f361f@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-279008969-1677451660=:59185"
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

--3866299591-279008969-1677451660=:59185
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sun, 26 Feb 2023, Philippe Mathieu-Daudé wrote:
> On 25/2/23 19:11, BALATON Zoltan wrote:
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
>>   be connected in board code; remove some empty lines]
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> Tested-by: Rene Engel <ReneEngel80@emailn.de>
>> ---
>>   hw/isa/vt82c686.c | 39 +++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 39 insertions(+)
>
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
>> +    /* now we change the pic irq level according to the via irq mappings 
>> */
>> +    /* XXX: optimize */
>> +    pic_irq = via_isa_get_pci_irq(s, irq_num);
>> +    if (pic_irq < ISA_NUM_IRQS) {
>
> the ISA IRQ is stored in 4-bit so will always be in range.

Complain at hw/isa/piix4 I guess or clean this up together later :-) Or 
maybe Bernhard has an idea or patch for this coming up that's why he 
pushed this in here. In any case, since this is now the same as piix4 
either both or nothing for this and both would be out of scope for this 
series.

Regards,
BALATON Zoltan

>> +        int i, pic_level;
>> +
>> +        /* The pic level is the logical OR of all the PCI irqs mapped to 
>> it. */
>> +        pic_level = 0;
>> +        for (i = 0; i < PCI_NUM_PINS; i++) {
>> +            if (pic_irq == via_isa_get_pci_irq(s, i)) {
>> +                pic_level |= pci_bus_get_irq_level(bus, i);
>> +            }
>> +        }
>> +        qemu_set_irq(s->isa_irqs[pic_irq], pic_level);
>> +    }
>> +}
>
>
>
>
--3866299591-279008969-1677451660=:59185--

