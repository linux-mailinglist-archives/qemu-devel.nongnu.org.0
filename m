Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F69C2E8795
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 15:13:51 +0100 (CET)
Received: from localhost ([::1]:60234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvhfB-0004Om-WC
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 09:13:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kvhdl-0003cO-E1; Sat, 02 Jan 2021 09:12:21 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:13745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kvhdi-0002Lp-F3; Sat, 02 Jan 2021 09:12:20 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 6DAAA7470FD;
 Sat,  2 Jan 2021 15:12:14 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 359247470DD; Sat,  2 Jan 2021 15:12:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 3396574645F;
 Sat,  2 Jan 2021 15:12:14 +0100 (CET)
Date: Sat, 2 Jan 2021 15:12:14 +0100 (CET)
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH 3/5] hw/pci-host/bonito: Remap PCI "lo" regions when
 PCIMAP reg is modified
In-Reply-To: <CAFEAcA_s_jOhL+1rVqvCHAEJHU-aAp2-1_zpQ1rC8Hjt_6H4KA@mail.gmail.com>
Message-ID: <8e9f16e-2f17-4f99-d0ee-96df2ad76d3e@eik.bme.hu>
References: <20210101231215.1870611-1-f4bug@amsat.org>
 <20210101231215.1870611-4-f4bug@amsat.org>
 <CAFEAcA_Hi+4BAPL+0BhDgbsXtzDQjiCs0SAs44mKgUbcSE+XCg@mail.gmail.com>
 <2da14074-a4ef-e90c-ea42-74d48ca06afd@amsat.org>
 <293aa484-89c8-acc2-b9a3-37f17a506a2d@eik.bme.hu>
 <CAFEAcA_s_jOhL+1rVqvCHAEJHU-aAp2-1_zpQ1rC8Hjt_6H4KA@mail.gmail.com>
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Qemu-block <qemu-block@nongnu.org>, Huacai Chen <chenhuacai@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

On Sat, 2 Jan 2021, Peter Maydell wrote:
> On Sat, 2 Jan 2021 at 11:22, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>> I have similar code in the series I've just posted where I'm mapping
>> regions of serial devices. I did consider using set_enabled and
>> set_address but ended up with removing and adding regions because I'm not
>> sure what happens if guest tries to move one region over another like
>> having one region at a default location while guest tries to map the other
>> one there (the pegasos2 maps serial at 0x2f8 which is normally COM2 on a
>> PC). This should not happen in theory but when removing disabled regions
>> it cannot happen so that looks safer therefore I chose to do that. Not
>> sure if this could be a problem here just shared my thughts about this.
>
> I'm not sure what you have in mind -- could you explain further?
> There should be no difference as far as the MemoryRegion handling
> code is concerned between "this memory region is marked disabled" and
> "the memory region was deleted and will be created from fresh and added
> back later" -- an MR that's in the hierarchy but not enabled is
> entirely ignored, as if it wasn't there at all, when creating the
> flat-view.

The device I was implementing has two registers one to set base address of 
io region and another with bits to enable/disable the regions so I could 
do set_address for base regs and set_enabled for control reg bits but I've 
seen guests first flipping the enable bits on then setting the base 
address so I thought it might cause problems with regions added to their 
parent but thinking about it more it's probably the same if we remove 
regions and add them instead of just set_enabled because they should be 
readded when control reg bits are set so they'll end up at the same 
default address.

> That said, doing memory_region_del_subregion()/memory_region_add_subregion()
> I think is also OK -- what's definitely not required is actually
> deleting and recreating the MRs the way this code is doing.

Anyway that's what I ended up doing and did not notice that this patch was 
also deleting and recreating the memory regions which I did not do just 
removing from parent when they are disabled but using set_address if they 
are enabled and new base is set. Removing inactive regions maybe better 
for debugging because they show up in info mtree so one can see which one 
is enabled/disabled not sure how disabled regions show up though.

All in all I probably have nothing to add to this so just disregard my 
comment.

Regards,
BALATON Zoltan

