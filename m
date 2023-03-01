Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8886A6CF5
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 14:20:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXMMc-0004BN-Cu; Wed, 01 Mar 2023 08:19:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pXMME-00044D-EZ; Wed, 01 Mar 2023 08:18:59 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pXMMC-0001fT-1x; Wed, 01 Mar 2023 08:18:58 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id E7F10746324;
 Wed,  1 Mar 2023 14:18:50 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id E0B567457E7; Wed,  1 Mar 2023 14:18:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id DF07A745720;
 Wed,  1 Mar 2023 14:18:42 +0100 (CET)
Date: Wed, 1 Mar 2023 14:18:42 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: David Woodhouse <dwmw2@infradead.org>
cc: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org, 
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org, 
 ReneEngel80@emailn.de
Subject: Re: [PATCH v5 5/7] hw/isa/vt82c686: Work around missing level
 sensitive irq in i8259 model
In-Reply-To: <943866390436e3c8828fea3e8cec117ae8553887.camel@infradead.org>
Message-ID: <1c9daa28-b4b0-5227-ea94-90035a8bed7a@eik.bme.hu>
References: <cover.1677628524.git.balaton@eik.bme.hu>
 <cd0b323bb88df202e36014f950c0eb13a9fafd54.1677628524.git.balaton@eik.bme.hu>
 <CC88085A-C269-4BCF-8CFD-EB3B457533C9@gmail.com>
 <6502f6bd-029c-25a8-49ec-e61784c64db5@eik.bme.hu>
 <943866390436e3c8828fea3e8cec117ae8553887.camel@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-2076377483-1677676722=:5284"
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

--3866299591-2076377483-1677676722=:5284
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 1 Mar 2023, David Woodhouse wrote:
> On Wed, 2023-03-01 at 12:27 +0100, BALATON Zoltan wrote:
>> On Wed, 1 Mar 2023, Bernhard Beschow wrote:
>>> Am 1. März 2023 00:17:11 UTC schrieb BALATON Zoltan <balaton@eik.bme.hu>:
>>>> MorphOS sets the ISA PIC to level sensitive mode but QEMU does
>>>> not
>>>> support that so this causes a freeze if multiple devices try to
>>>> raise
>>>> a shared interrupt. Work around it by lowering the interrupt
>>>> before
>>>> raising it again if it is already raised. This could be reverted
>>>> when
>>>> the i8259 model is fixed.
>>>>
>>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>>> ---
>>>> hw/isa/vt82c686.c | 9 +++++++++
>>>> 1 file changed, 9 insertions(+)
>>>>
>>>> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
>>>> index 018a119964..3e44a51f92 100644
>>>> --- a/hw/isa/vt82c686.c
>>>> +++ b/hw/isa/vt82c686.c
>>>> @@ -549,6 +549,7 @@ struct ViaISAState {
>>>>      PCIDevice dev;
>>>>      qemu_irq cpu_intr;
>>>>      qemu_irq *isa_irqs_in;
>>>> +    uint16_t isa_irqs_state;
>>>>      ViaSuperIOState via_sio;
>>>>      MC146818RtcState rtc;
>>>>      PCIIDEState ide;
>>>> @@ -636,6 +637,14 @@ static void via_isa_set_pci_irq(void
>>>> *opaque, int irq_num, int level)
>>>>              pic_level |= pci_bus_get_irq_level(bus, i);
>>>>          }
>>>>      }
>>>> +    /* FIXME: workaround for i8259: level sensitive irq not
>>>> supported */
>>>> +    if ((s->isa_irqs_state & BIT(pic_irq)) && pic_level) {
>>>> +        qemu_irq_lower(s->isa_irqs_in[pic_irq]);
>>>> +    } else if (pic_level) {
>>>> +        s->isa_irqs_state |= BIT(pic_irq);
>>>> +    } else {
>>>> +        s->isa_irqs_state &= ~BIT(pic_irq);
>>>> +    }
>>>
>>> Let's not clutter the device model with workarounds which quickly
>>> snowball into unmaintainable code. Please fix the i8259 instead.
>>
>> Do you have an idea how?
>
> Let's start by understanding the problem completely. The i8259 *does*
> support level-triggered interrupts. Look at the checks for s->elcr in
> hw/intc/i8259.c, in pic_set_irq()...
>
>    if (s->elcr & mask) {
>        /* level triggered */
>        if (level) {
>            s->irr |= mask;
>            s->last_irr |= mask;
>        } else {
>            s->irr &= ~mask;
>            s->last_irr &= ~mask;
>        }
>    } else {
>        /* edge triggered */
>
>
> ... and in pic_intack() ...
>
>
>    /* We don't clear a level sensitive interrupt here */
>    if (!(s->elcr & (1 << irq))) {
>        s->irr &= ~(1 << irq);
>    }
>
>
> What qemu typically has an issue with is *shared* level-triggered
> interrupts. But that would cause a level to be "forgotten" if another
> input asserts and then deasserts the IRQ while one input thinks it's
> holding it asserted. And I don't see how your workaround above would
> have helped in that situation.
>
> Are you sure the PIC ELCR is actually set for the lines you're having
> trouble with? Is that something the Pegasos SmartFirmware would have
> done, and MorphOS is expecting to inherit but isn't actually setting up
> for itself?

No, it works with other guests like Linux and AmigaOS that use PIC as set 
up by the firmware but MorphOS tries to use it in level sensitive mode and 
likely has an IRQ handler which expects this to work. This is where I've 
debugged it and came to this workaround:

https://lists.nongnu.org/archive/html/qemu-ppc/2023-02/msg00403.html

When booting MorphOS with -d unimp I see these logs:

i8259: level sensitive irq not supported
i8259: level sensitive irq not supported

which is I guess when it tries to set it for both PICs. (If you want to 
try this MorphOS iso is downloadable and instructions how to boot it is 
here: http://zero.eik.bme.hu/~balaton/qemu/amiga/#morphos

Regards,
BALATON Zoltan
--3866299591-2076377483-1677676722=:5284--

