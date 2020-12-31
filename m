Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE312E820D
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Dec 2020 21:56:48 +0100 (CET)
Received: from localhost ([::1]:46654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kv503-0004d6-0T
	for lists+qemu-devel@lfdr.de; Thu, 31 Dec 2020 15:56:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kv4yR-0003kg-Hc; Thu, 31 Dec 2020 15:55:07 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:35464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kv4yO-0007zW-LE; Thu, 31 Dec 2020 15:55:06 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 7BF657470E4;
 Thu, 31 Dec 2020 21:55:00 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id E32F67470F2; Thu, 31 Dec 2020 21:54:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id E0D6074645F;
 Thu, 31 Dec 2020 21:54:59 +0100 (CET)
Date: Thu, 31 Dec 2020 21:54:59 +0100 (CET)
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 3/3] sam460ex: Clean up irq mapping
In-Reply-To: <CAFEAcA_bAjvx1oWO1DGimmThE7BhGHE0EqCoCR4nhuO3DMY_2g@mail.gmail.com>
Message-ID: <79681dc2-d689-4518-a83-dead38dd6e8@eik.bme.hu>
References: <cover.1609413115.git.balaton@eik.bme.hu>
 <6892fc8ac57283bf7ba27fe89ea9dbdd6a37f988.1609413115.git.balaton@eik.bme.hu>
 <CAFEAcA96wr_+DmXfR5ba_MEPB+sBow-QR1wpvSvKawus7qzKVg@mail.gmail.com>
 <CAFEAcA_bAjvx1oWO1DGimmThE7BhGHE0EqCoCR4nhuO3DMY_2g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Guenter Roeck <linux@roeck-us.net>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

On Thu, 31 Dec 2020, Peter Maydell wrote:
> On Thu, 31 Dec 2020 at 15:11, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On Thu, 31 Dec 2020 at 11:20, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>>>
>>> Avoid mapping multiple interrupts to the same irq. Instead map them to
>>> the 4 PCI interrupts and use an or-gate in the board to connect them
>>> to the interrupt controller. This does not fix any known problem but
>>> does not seem to cause a new problem either and may be cleaner at least.
>>>
>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>> Tested-by: Guenter Roeck <linux@roeck-us.net>
>>
>> So, this patch is a behavioural change, but I think it's
>> probably a change to the right behaviour. The difference
>> is relatively slight, but you would see it if there are two
>> different PCI cards and they both assert a different PCI
>> interrupt, and then one of them lowers the interrupt
>> before the other:
>
> This turns out to be wrong -- I hadn't looked at the QEMU PCI
> code, but it has an internal implementation of logic that
> gives the same behaviour as an explicit OR gate. Basically
> pci_change_irq_level() tracks how many assert/deasserts of
> the (mapped) IRQ lines have happened, so it only calls the
> controller's set_irq function when the count of asserted
> inputs goes down to 0. So both the current code and this
> patch's change are functionally correct.

I've remembered we had this discussion before and arrived to the same 
conclusion that current code was equivalently working but could not recall 
the reason.

> I'm not sure which would be nominally closer to the "real hardware":
> the 440ex CPU/SoC datasheet lists a single PCI0INT signal, but
> it says it is an output, not an input, so I'm pretty sure there's
> something I don't understand about PCI here. (Also, unlike the
> 440EP it provides PCI Express as well as PCI.)

The SoC is called 460EX (despite having a PPC 440 core not 460 one) but I 
think you've looked at the right data sheet and it's just a typo. I also 
don't know how the board is wired so I think in this case I prefer 
dropping this patch and keeping the current code just for simplicity but 
to avoid going through this again maybe we should add a comment saying why 
it's working. Can you please suggest a test for such comment pointing to 
the relevant part of pci_change_irq_level() you refer to above? I don't 
think I understand it enough to document it.

Thank you,
BALATON Zoltan

