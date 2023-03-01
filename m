Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 926986A6B90
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 12:18:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXKTI-0007Gb-Nj; Wed, 01 Mar 2023 06:18:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pXKT7-0007G1-Vx; Wed, 01 Mar 2023 06:17:58 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pXKT6-0002IU-C9; Wed, 01 Mar 2023 06:17:57 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id D764F746377;
 Wed,  1 Mar 2023 12:17:53 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 9BD97746335; Wed,  1 Mar 2023 12:17:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 9A4FC746324;
 Wed,  1 Mar 2023 12:17:53 +0100 (CET)
Date: Wed, 1 Mar 2023 12:17:53 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org, 
 ReneEngel80@emailn.de
Subject: Re: [PATCH v5 2/7] Revert "hw/isa/vt82c686: Remove intermediate IRQ
 forwarder"
In-Reply-To: <CDB81BB8-8136-4C97-84A2-EB3CAACC8781@gmail.com>
Message-ID: <6bf1b86d-1176-2801-692e-7b86bc185800@eik.bme.hu>
References: <cover.1677628524.git.balaton@eik.bme.hu>
 <cdfb3c5a42e505450f6803124f27856434c5b298.1677628524.git.balaton@eik.bme.hu>
 <709f5780-97e5-0cee-d776-4558cf39e000@eik.bme.hu>
 <CDB81BB8-8136-4C97-84A2-EB3CAACC8781@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1130574246-1677669473=:74695"
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

--3866299591-1130574246-1677669473=:74695
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 1 Mar 2023, Bernhard Beschow wrote:
> Am 1. März 2023 00:33:28 UTC schrieb BALATON Zoltan <balaton@eik.bme.hu>:
>> On Wed, 1 Mar 2023, BALATON Zoltan wrote:
>>> This partially reverts commit bb98e0f59cde846666d9fddc60ae74ef7ddfca17
>>> keeping the rename of a state field but reverting other cahanges which
>>> break interrupts on pegasos2.
>>
>> I've found this with just booting the MorphOS iso which now hangs without this revert when trying to read from the ide device. I think I've mentioned that I've also tried this way first but then ended up adding this because it was needed in a review of the patch earlier but I can't find that message now. For now it seems the easiest is to revert this and think about it later.
>
> It looks like Philippe's patch should work, at least in theory. Why does the indirection work while it doesn't without?

I have eno idea. I've found this before because I've also thought it 
should work in the simpler way but found it doesn't, that's why I've added 
the indirection which I saw was the way other similar devices also did it. 
We're now too close to the freeze to have another try so just chose to 
revert it for now then we can find out later what's going on.

Regards,
BALATON Zoltan
>
>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>> ---
>>> hw/isa/vt82c686.c | 10 +++++++++-
>>> 1 file changed, 9 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
>>> index f4c40965cd..01e0148967 100644
>>> --- a/hw/isa/vt82c686.c
>>> +++ b/hw/isa/vt82c686.c
>>> @@ -598,15 +598,23 @@ void via_isa_set_irq(PCIDevice *d, int n, int level)
>>>     qemu_set_irq(s->isa_irqs_in[n], level);
>>> }
>>>
>>> +static void via_isa_request_i8259_irq(void *opaque, int irq, int level)
>>> +{
>>> +    ViaISAState *s = opaque;
>>> +    qemu_set_irq(s->cpu_intr, level);
>>> +}
>>> +
>>> static void via_isa_realize(PCIDevice *d, Error **errp)
>>> {
>>>     ViaISAState *s = VIA_ISA(d);
>>>     DeviceState *dev = DEVICE(d);
>>>     PCIBus *pci_bus = pci_get_bus(d);
>>> +    qemu_irq *isa_irq;
>>>     ISABus *isa_bus;
>>>     int i;
>>>
>>>     qdev_init_gpio_out(dev, &s->cpu_intr, 1);
>>> +    isa_irq = qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
>>>     isa_bus = isa_bus_new(dev, pci_address_space(d), pci_address_space_io(d),
>>>                           errp);
>>>
>>> @@ -614,7 +622,7 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
>>>         return;
>>>     }
>>>
>>> -    s->isa_irqs_in = i8259_init(isa_bus, s->cpu_intr);
>>> +    s->isa_irqs_in = i8259_init(isa_bus, *isa_irq);
>>>     isa_bus_register_input_irqs(isa_bus, s->isa_irqs_in);
>>>     i8254_pit_init(isa_bus, 0x40, 0, NULL);
>>>     i8257_dma_init(isa_bus, 0);
>>>
>
>
--3866299591-1130574246-1677669473=:74695--

