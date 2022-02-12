Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C23114B362A
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 17:02:31 +0100 (CET)
Received: from localhost ([::1]:51864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIur0-0005Hu-LI
	for lists+qemu-devel@lfdr.de; Sat, 12 Feb 2022 11:02:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nIumO-0001jY-Nb
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 10:57:45 -0500
Received: from [2001:738:2001:2001::2001] (port=32674 helo=zero.eik.bme.hu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nIumM-000875-In
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 10:57:44 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 26FF974635C;
 Sat, 12 Feb 2022 16:57:37 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 0655B745708; Sat, 12 Feb 2022 16:57:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 04BE87456E3;
 Sat, 12 Feb 2022 16:57:37 +0100 (CET)
Date: Sat, 12 Feb 2022 16:57:36 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
Subject: Re: [PATCH v2 5/5] isa/piix4: Resolve redundant i8259[] attribute
In-Reply-To: <1D2AB604-50DD-48F8-8E92-DE9AEAE0FC90@gmail.com>
Message-ID: <b8b2fd3e-8b50-9be2-726e-c0a3c73ad83e@eik.bme.hu>
References: <20220212113519.69527-1-shentey@gmail.com>
 <20220212113519.69527-6-shentey@gmail.com>
 <9a3e73e-ac7-f79-c84-ca9a8523d0d1@eik.bme.hu>
 <1D2AB604-50DD-48F8-8E92-DE9AEAE0FC90@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:738:2001:2001::2001
 (failed)
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 12 Feb 2022, Bernhard Beschow wrote:
> Am 12. Februar 2022 14:19:51 MEZ schrieb BALATON Zoltan <balaton@eik.bme.hu>:
>> On Sat, 12 Feb 2022, Bernhard Beschow wrote:
>>> This is a follow-up on patch "malta: Move PCI interrupt handling from
>>> gt64xxx to piix4" where i8259[] was moved from MaltaState to PIIX4State
>>> to make the code movement more obvious. However, i8259[] seems redundant
>>> to *isa, so remove it.
>>
>> Should this be squashed in patch 1 or at least come after it? Or are there
>> some other changes needed before this patch?
>
> I didn't want to change the patch order since they've been reviewed already. But yeah, you're right: It makes sense to get this out of the way early in the patch series. I will do a v3.

I had another comment in the bottom of this message, not sure you've 
found that too, I forgot to put a warning that there are more comments 
below here. Changing the patch order or patches according to review is OK 
and adding a new patch between already reviewed ones is OK too then you 
can keep Reviewed-by on patches that did not change.

Regards,
BALATON Zoltan

> Regards,
> Bernhard
>
>>
>> Regards,
>> BALATON Zoltan
>>
>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>>> ---
>>> hw/isa/piix4.c | 7 +------
>>> 1 file changed, 1 insertion(+), 6 deletions(-)
>>>
>>> diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
>>> index a9322851db..692fa8d1f9 100644
>>> --- a/hw/isa/piix4.c
>>> +++ b/hw/isa/piix4.c
>>> @@ -43,7 +43,6 @@ struct PIIX4State {
>>>     PCIDevice dev;
>>>     qemu_irq cpu_intr;
>>>     qemu_irq *isa;
>>> -    qemu_irq i8259[ISA_NUM_IRQS];
>>>
>>>     int32_t pci_irq_levels[PIIX_NUM_PIRQS];
>>>
>>> @@ -73,7 +72,7 @@ static void piix4_set_irq(void *opaque, int irq_num, int level)
>>>                 pic_level |= s->pci_irq_levels[i];
>>>             }
>>>         }
>>> -        qemu_set_irq(s->i8259[pic_irq], pic_level);
>>> +        qemu_set_irq(s->isa[pic_irq], pic_level);
>>>     }
>>> }
>>>
>>> @@ -323,9 +322,5 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
>>>
>>>     pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, PIIX_NUM_PIRQS);
>>>
>>> -    for (int i = 0; i < ISA_NUM_IRQS; i++) {
>>> -        s->i8259[i] = qdev_get_gpio_in_named(dev, "isa", i);
>>> -    }
>>> -
>>>     return dev;
>>> }
>>>
>
>

