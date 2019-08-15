Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C40028EA14
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Aug 2019 13:19:19 +0200 (CEST)
Received: from localhost ([::1]:40588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hyDmo-0006hT-UO
	for lists+qemu-devel@lfdr.de; Thu, 15 Aug 2019 07:19:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58737)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1hyDlD-0006ER-43
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 07:17:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1hyDlB-0001fi-Iu
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 07:17:38 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:47032)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>) id 1hyDlB-0001eL-DB
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 07:17:37 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 2F2C87456B4;
 Thu, 15 Aug 2019 13:17:34 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 13B7F74569A; Thu, 15 Aug 2019 13:17:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 12AFD7456D4;
 Thu, 15 Aug 2019 13:17:34 +0200 (CEST)
Date: Thu, 15 Aug 2019 13:17:34 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Gerd Hoffmann <kraxel@redhat.com>
In-Reply-To: <20190815095036.lon6sw6cft2agdzw@sirius.home.kraxel.org>
Message-ID: <alpine.BSF.2.21.9999.1908151312100.58299@zero.eik.bme.hu>
References: <20190815002652.79FDE7456E2@zero.eik.bme.hu>
 <20190815062313.ve26cevmbyuewlo5@sirius.home.kraxel.org>
 <alpine.BSF.2.21.9999.1908151051570.23526@zero.eik.bme.hu>
 <20190815095036.lon6sw6cft2agdzw@sirius.home.kraxel.org>
User-Agent: Alpine 2.21.9999 (BSF 287 2018-06-16)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:738:2001:2001::2001
Subject: Re: [Qemu-devel] [RFC PATCH] ati-vga: Implement dummy VBlank IRQ
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 15 Aug 2019, Gerd Hoffmann wrote:
>>>> +static void ati_vga_update_irq(ATIVGAState *s)
>>>> +{
>>>> +    pci_set_irq(&s->dev, s->regs.gen_int_status & 1);
>>>
>>> This should be "s->regs.gen_int_status & s->regs.gen_int_cntl" I guess?
>>
>> Probably, but we only try to emulate VBlank yet so to avoid any problems due
>> to raising irq for unknown bits I restricted it for that now.
>
> Well, qemu doesn't set unknown status bits, only vblank.  The guest
> can't set them either due to status register having write-one-to-clear
> semantics.  So, that should not happen.  If you want an extra check to
> catch programming errors I'd suggest to add an assert() for that.

OK I'll change that then.

>>>> +        s->regs.gen_int_status &= ~data;
>>>
>>> ati_vga_update_irq() needed here too.
>>
>> Thanks. Indeed I forgot this. With that it works a bit better, mouse now can
>> be moved but only vertically... No idea why, I'll have to check,
>
> Still progress.  One step at a time ;)

Got this too (and cursor color as well). These are becuase MacOS accesses 
these regs with less than 4 size so we need to support unaligned access 
for them. It's a bit tricky because we could get reg content in pieces and 
we need to decide when it's complete to act on it. I'll try to fix that 
and then it hopefully will work (well, at least boot to see it fail 
whenever tries to use any unimplemented acceleration but at least we can 
test emulation with it when further pieces are implemented in the future).

Regards,
BALATON Zoltan

