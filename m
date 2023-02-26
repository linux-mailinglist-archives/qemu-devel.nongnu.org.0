Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EF76A359C
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 00:37:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWQaB-00027M-MI; Sun, 26 Feb 2023 18:37:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pWQa8-00026d-DX; Sun, 26 Feb 2023 18:37:28 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pWQa6-0000Nz-OU; Sun, 26 Feb 2023 18:37:28 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 406BE746377;
 Mon, 27 Feb 2023 00:37:25 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id EFFC5746369; Mon, 27 Feb 2023 00:37:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id EBC4F74635C;
 Mon, 27 Feb 2023 00:37:24 +0100 (CET)
Date: Mon, 27 Feb 2023 00:37:24 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, ReneEngel80@emailn.de
Subject: Re: [PATCH v3 4/8] hw/isa/vt82c686: Implement PCI IRQ routing
In-Reply-To: <0E10FCF9-465D-462A-8031-880B0907CCDA@gmail.com>
Message-ID: <236a7e87-b8dd-720d-e2e2-2c1beb97116e@eik.bme.hu>
References: <cover.1677445307.git.balaton@eik.bme.hu>
 <0fd9eac9174a840054c511fbc015048929c7bc40.1677445307.git.balaton@eik.bme.hu>
 <a496276e-24fb-e2bc-fbdf-ace9ef7f361f@linaro.org>
 <0E10FCF9-465D-462A-8031-880B0907CCDA@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1987530450-1677454644=:59185"
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

--3866299591-1987530450-1677454644=:59185
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sun, 26 Feb 2023, Bernhard Beschow wrote:
> Am 26. Februar 2023 22:27:50 UTC schrieb "Philippe Mathieu-Daudé" <philmd@linaro.org>:
>> On 25/2/23 19:11, BALATON Zoltan wrote:
>>> From: Bernhard Beschow <shentey@gmail.com>
>>>
>>> The real VIA south bridges implement a PCI IRQ router which is configured
>>> by the BIOS or the OS. In order to respect these configurations, QEMU
>>> needs to implement it as well.
>>>
>>> Note: The implementation was taken from piix4_set_irq() in hw/isa/piix4.
>>>
>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>>> [balaton: declare gpio inputs instead of changing pci bus irqs so it can
>>>   be connected in board code; remove some empty lines]
>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>> Tested-by: Rene Engel <ReneEngel80@emailn.de>
>>> ---
>>>   hw/isa/vt82c686.c | 39 +++++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 39 insertions(+)
>>
>>> +static int via_isa_get_pci_irq(const ViaISAState *s, int irq_num)
>>> +{
>>> +    switch (irq_num) {
>>> +    case 0:
>>> +        return s->dev.config[0x55] >> 4;
>>> +    case 1:
>>> +        return s->dev.config[0x56] & 0xf;
>>> +    case 2:
>>> +        return s->dev.config[0x56] >> 4;
>>> +    case 3:
>>> +        return s->dev.config[0x57] >> 4;
>>> +    }
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
>>
>> the ISA IRQ is stored in 4-bit so will always be in range.
>
> Indeed. I'd turn this into an assert to keep this assum visible. I'll do another iteration of the PCI IRQ router series.

If you do that please don't break it and make me redo this series again. 
Sumbit a patch as a reply to this that can be substituted without changing 
other patches and I can include in later respins. We don't have time to 
make extensive changes now, the freeze is too close.

Regards,
BALATON Zoltan

> Best regards,
> Bernhard
>>
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
>>
>>
>
>
--3866299591-1987530450-1677454644=:59185--

