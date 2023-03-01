Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE956A6BAF
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 12:29:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXKcm-0002BI-4S; Wed, 01 Mar 2023 06:27:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pXKck-0002B1-2Q; Wed, 01 Mar 2023 06:27:54 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pXKcf-0004Gt-KG; Wed, 01 Mar 2023 06:27:53 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 0F9A17457E7;
 Wed,  1 Mar 2023 12:27:46 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id C5CA4745720; Wed,  1 Mar 2023 12:27:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id C41DF745706;
 Wed,  1 Mar 2023 12:27:45 +0100 (CET)
Date: Wed, 1 Mar 2023 12:27:45 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org, 
 ReneEngel80@emailn.de
Subject: Re: [PATCH v5 5/7] hw/isa/vt82c686: Work around missing level
 sensitive irq in i8259 model
In-Reply-To: <CC88085A-C269-4BCF-8CFD-EB3B457533C9@gmail.com>
Message-ID: <6502f6bd-029c-25a8-49ec-e61784c64db5@eik.bme.hu>
References: <cover.1677628524.git.balaton@eik.bme.hu>
 <cd0b323bb88df202e36014f950c0eb13a9fafd54.1677628524.git.balaton@eik.bme.hu>
 <CC88085A-C269-4BCF-8CFD-EB3B457533C9@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-375586322-1677670065=:74695"
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

--3866299591-375586322-1677670065=:74695
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 1 Mar 2023, Bernhard Beschow wrote:
> Am 1. März 2023 00:17:11 UTC schrieb BALATON Zoltan <balaton@eik.bme.hu>:
>> MorphOS sets the ISA PIC to level sensitive mode but QEMU does not
>> support that so this causes a freeze if multiple devices try to raise
>> a shared interrupt. Work around it by lowering the interrupt before
>> raising it again if it is already raised. This could be reverted when
>> the i8259 model is fixed.
>>
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>> hw/isa/vt82c686.c | 9 +++++++++
>> 1 file changed, 9 insertions(+)
>>
>> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
>> index 018a119964..3e44a51f92 100644
>> --- a/hw/isa/vt82c686.c
>> +++ b/hw/isa/vt82c686.c
>> @@ -549,6 +549,7 @@ struct ViaISAState {
>>     PCIDevice dev;
>>     qemu_irq cpu_intr;
>>     qemu_irq *isa_irqs_in;
>> +    uint16_t isa_irqs_state;
>>     ViaSuperIOState via_sio;
>>     MC146818RtcState rtc;
>>     PCIIDEState ide;
>> @@ -636,6 +637,14 @@ static void via_isa_set_pci_irq(void *opaque, int irq_num, int level)
>>             pic_level |= pci_bus_get_irq_level(bus, i);
>>         }
>>     }
>> +    /* FIXME: workaround for i8259: level sensitive irq not supported */
>> +    if ((s->isa_irqs_state & BIT(pic_irq)) && pic_level) {
>> +        qemu_irq_lower(s->isa_irqs_in[pic_irq]);
>> +    } else if (pic_level) {
>> +        s->isa_irqs_state |= BIT(pic_irq);
>> +    } else {
>> +        s->isa_irqs_state &= ~BIT(pic_irq);
>> +    }
>
> Let's not clutter the device model with workarounds which quickly snowball into unmaintainable code. Please fix the i8259 instead.

Do you have an idea how? I don't know PC hardware well so it's not likely 
I can do that in one day and breaking PIC model would affect a lot of 
machines among them some production critical ones. Adding this workaround 
here only affects pegasos2 and the only partially modeled likely not used 
fuloong2e board (which is mostly there because it was there before and 
good to keep it to be able to test this device model with another machine) 
and I can test these two but not all the others using i8259. So I think 
for this release this is the best we can do and if somebody more 
knowledgeable about PC hardware fixes the i8259 PIC model later this can 
be easily reverted. It's not a big clutter so unless you can show this 
breaks something I'd rather have it to keep MorphOS usable on pegasos2 
with sound and network or USB. If you can prove this breaks something we 
could drop it but not based on opinion or feelengs only some evidence.

Regards,
BALATON Zoltan

>>     /* Now we change the pic irq level according to the via irq mappings. */
>>     qemu_set_irq(s->isa_irqs_in[pic_irq], pic_level);
>> }
>
>
--3866299591-375586322-1677670065=:74695--

