Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F17D6A7287
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 19:03:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXQln-0005va-Pc; Wed, 01 Mar 2023 13:01:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pXQlV-0005qA-Nv; Wed, 01 Mar 2023 13:01:22 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pXQlT-0002I5-0u; Wed, 01 Mar 2023 13:01:21 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 98554746335;
 Wed,  1 Mar 2023 19:01:12 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 5E951746324; Wed,  1 Mar 2023 19:01:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 5C8677457E7;
 Wed,  1 Mar 2023 19:01:12 +0100 (CET)
Date: Wed, 1 Mar 2023 19:01:12 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: David Woodhouse <dwmw2@infradead.org>
cc: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org, 
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org, 
 ReneEngel80@emailn.de
Subject: Re: [PATCH v5 5/7] hw/isa/vt82c686: Work around missing level
 sensitive irq in i8259 model
In-Reply-To: <859e28fd61203c35e30fce505f0101886a54e654.camel@infradead.org>
Message-ID: <418dd5ca-cabc-fb91-6437-63bece1dfe1b@eik.bme.hu>
References: <cover.1677628524.git.balaton@eik.bme.hu>
 <cd0b323bb88df202e36014f950c0eb13a9fafd54.1677628524.git.balaton@eik.bme.hu>
 <CC88085A-C269-4BCF-8CFD-EB3B457533C9@gmail.com>
 <6502f6bd-029c-25a8-49ec-e61784c64db5@eik.bme.hu>
 <943866390436e3c8828fea3e8cec117ae8553887.camel@infradead.org>
 <1c9daa28-b4b0-5227-ea94-90035a8bed7a@eik.bme.hu>
 <859e28fd61203c35e30fce505f0101886a54e654.camel@infradead.org>
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

On Wed, 1 Mar 2023, David Woodhouse wrote:
> On Wed, 2023-03-01 at 14:18 +0100, BALATON Zoltan wrote:
>>> Are you sure the PIC ELCR is actually set for the lines you're having
>>> trouble with? Is that something the Pegasos SmartFirmware would have
>>> done, and MorphOS is expecting to inherit but isn't actually setting up
>>> for itself?
>>
>> No, it works with other guests like Linux and AmigaOS that use PIC as set
>> up by the firmware but MorphOS tries to use it in level sensitive mode and
>> likely has an IRQ handler which expects this to work. This is where I've
>> debugged it and came to this workaround:
>>
>> https://lists.nongnu.org/archive/html/qemu-ppc/2023-02/msg00403.html
>>
>> When booting MorphOS with -d unimp I see these logs:
>>
>> i8259: level sensitive irq not supported
>> i8259: level sensitive irq not supported
>>
>> which is I guess when it tries to set it for both PICs. (If you want to
>> try this MorphOS iso is downloadable and instructions how to boot it is
>> here: http://zero.eik.bme.hu/~balaton/qemu/amiga/#morphos
>
>
> Wow. Even looking at the PIIX3 datasheet from 1996, That 'Edge/Level
> Bank Select (LTIM)' bit was documented as 'This bit is disabled. Its
> function is replaced by the Edge/Level Triggerede Control (ELCR)
> Registers.
>
> We've been able to set the edge/level on a per-pin basis ever since the
> ELCR was introduced with the IBM PS/2, I think.
>
> It isn't a *correct* fix without a little bit more typing, but does
> this make it work?
>
> diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
> index 17910f3bcb..36ebcff025 100644
> --- a/hw/intc/i8259.c
> +++ b/hw/intc/i8259.c
> @@ -246,6 +246,7 @@ static void pic_ioport_write(void *opaque, hwaddr addr64,
>             if (val & 0x08) {
>                 qemu_log_mask(LOG_UNIMP,
>                               "i8259: level sensitive irq not supported\n");
> +                s->elcr = 0xff;

This works too. I guess the log can be then removed too. Could you submit 
a proper patch or you want me to do that so we can drop the workaround for 
it? Thanks for looking into it.

Regards,
BALATON Zoltan

>             }
>         } else if (val & 0x08) {
>             if (val & 0x04) {
>
>
>
>

