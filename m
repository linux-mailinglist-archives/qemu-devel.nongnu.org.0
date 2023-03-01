Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB246A7710
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 23:48:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXVE7-00031g-A8; Wed, 01 Mar 2023 17:47:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pXVE4-00030r-Lp; Wed, 01 Mar 2023 17:47:08 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pXVE2-0008Ro-NJ; Wed, 01 Mar 2023 17:47:08 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 9DE6A7462DB;
 Wed,  1 Mar 2023 23:47:01 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 5ED6B7457E7; Wed,  1 Mar 2023 23:47:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 5C290745706;
 Wed,  1 Mar 2023 23:47:01 +0100 (CET)
Date: Wed, 1 Mar 2023 23:47:01 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: David Woodhouse <dwmw2@infradead.org>
cc: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org, 
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org, 
 ReneEngel80@emailn.de
Subject: Re: [PATCH v5 5/7] hw/isa/vt82c686: Work around missing level
 sensitive irq in i8259 model
In-Reply-To: <ca4e524d0f0ce8c404ad224d7de9eb1bdf51961e.camel@infradead.org>
Message-ID: <20eb7e98-aedb-1528-8ba0-806b93b123ea@eik.bme.hu>
References: <cover.1677628524.git.balaton@eik.bme.hu>
 <cd0b323bb88df202e36014f950c0eb13a9fafd54.1677628524.git.balaton@eik.bme.hu>
 <CC88085A-C269-4BCF-8CFD-EB3B457533C9@gmail.com>
 <6502f6bd-029c-25a8-49ec-e61784c64db5@eik.bme.hu>
 <943866390436e3c8828fea3e8cec117ae8553887.camel@infradead.org>
 <1c9daa28-b4b0-5227-ea94-90035a8bed7a@eik.bme.hu>
 <859e28fd61203c35e30fce505f0101886a54e654.camel@infradead.org>
 <418dd5ca-cabc-fb91-6437-63bece1dfe1b@eik.bme.hu>
 <ca4e524d0f0ce8c404ad224d7de9eb1bdf51961e.camel@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-951860295-1677710821=:23145"
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

--3866299591-951860295-1677710821=:23145
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 1 Mar 2023, David Woodhouse wrote:
> On Wed, 2023-03-01 at 19:01 +0100, BALATON Zoltan wrote:
>>
>>> It isn't a *correct* fix without a little bit more typing, but does
>>> this make it work?
>>>
>>> diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
>>> index 17910f3bcb..36ebcff025 100644
>>> --- a/hw/intc/i8259.c
>>> +++ b/hw/intc/i8259.c
>>> @@ -246,6 +246,7 @@ static void pic_ioport_write(void *opaque, hwaddr addr64,
>>>              if (val & 0x08) {
>>>                  qemu_log_mask(LOG_UNIMP,
>>>                                "i8259: level sensitive irq not supported\n");
>>> +                s->elcr = 0xff;
>>
>> This works too. I guess the log can be then removed too. Could you submit
>> a proper patch or you want me to do that so we can drop the workaround for
>> it? Thanks for looking into it.
>
>
> Happy for you to do the rest of the typing ... :)

I don't mind the typing but this is quite a bit more involved than I 
expected. You've lost me at the vmstate stuff which I don't quite know how 
to change or test. If these were stored as bits in an ISW1 register as 
described by the docs I've looked at now then no change in migration would 
be needed but this isn't how it seems to be in QEMU so I give up on that 
in this case. Could you please do the typing then?

Thank you,
BALATON Zoltan

> So, *ideally* I think you need to introduce a new field in the
> PICCommonState which records the status of the LTIM bit. And fix up the
> vmstate_pic_common in hw/intc/i8259_common.c to save and restore that
> (with versioning for upgrade/downgrade).
>
> Then you find those places which currently check the bit for the
> specific pin in s->elcr, and make them something like:
>
> --- a/hw/intc/i8259.c
> +++ b/hw/intc/i8259.c
> @@ -133,7 +133,7 @@ static void pic_set_irq(void *opaque, int irq, int level)
>     }
> #endif
>
> -    if (s->elcr & mask) {
> +    if (s->ltim || (s->elcr & mask)) {
>         /* level triggered */
>         if (level) {
>             s->irr |= mask;
>
> It *might* be that you should make the LTIM behaviour optional, so that
> only certain incarnations of the i8259 actually get it at all and it
> *wouldn't* take effect if a guest tried to set it, which is what the
> PIIX3 datasheet implies. But I suspect we can get away without that.
>
>
--3866299591-951860295-1677710821=:23145--

