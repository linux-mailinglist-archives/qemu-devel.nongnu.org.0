Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCC16A9782
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 13:49:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY4p8-0003Qs-OE; Fri, 03 Mar 2023 07:47:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pY4p4-0003Oo-VV; Fri, 03 Mar 2023 07:47:42 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pY4p3-00085w-11; Fri, 03 Mar 2023 07:47:42 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 3406B745720;
 Fri,  3 Mar 2023 13:47:33 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id F028F745706; Fri,  3 Mar 2023 13:47:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id EEB4E7456E3;
 Fri,  3 Mar 2023 13:47:32 +0100 (CET)
Date: Fri, 3 Mar 2023 13:47:32 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: David Woodhouse <dwmw2@infradead.org>
cc: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>, 
 John Snow <jsnow@redhat.com>, 
 =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>, 
 qemu-ppc@nongnu.org
Subject: Re: [PATCH v3 00/18] hw/ide: Untangle ISA/PCI abuses of
 ide_init_ioport()
In-Reply-To: <366B37B3-B601-4405-9D7B-4FF1A6D1B9AF@infradead.org>
Message-ID: <0baf4043-ab5d-1982-ca76-e30dae93a6df@eik.bme.hu>
References: <20230302224058.43315-1-philmd@linaro.org>
 <366B37B3-B601-4405-9D7B-4FF1A6D1B9AF@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1407362776-1677847652=:28478"
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

--3866299591-1407362776-1677847652=:28478
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 3 Mar 2023, David Woodhouse wrote:
> On 2 March 2023 22:40:40 GMT, "Philippe Mathieu-Daudé" <philmd@linaro.org> wrote:
>> Since v2: rebased
>>
>> I'm posting this series as it to not block Bernhard's PIIX
>> cleanup work. I don't have code change planned, but eventually
>> reword / improve commit descriptions.
>>
>> Tested commit after commit to be sure it is bisectable. Sadly
>> this was before Zoltan & Thomas report a problem with commit
>> bb98e0f59c ("hw/isa/vt82c686: Remove intermediate IRQ forwarder").
>
> However much I stare at the partial revert which fixes it, I just cannot 
> believe that the change could make any difference at all. There's got to 
> be something weird going on there.
>
> I was going to ask if the level mode for the PIT made any difference, 
> but this is the output IRQ from the PIT to the CPU itself so I don't see 
> how it would.

This is independent of the ltim patch and I've found this even before 
you've sent that patch as this is in my v5 series which you've replied to. 
I've found this problem before when I've first written this model back in 
2019 and did not understand why it's needed but as now shown also with the 
prep machine there's some other problem somewhere that makes this 
necessary. As the way we had before works for the last few years reverting 
it is the safest bet now but we can try to find out and clean up 
eventually.

> Would like to see a report with tracing from pic_update_irq, the CPU 
> interrupt "handler" and the intermediate IRQ handler. With the 
> intermediate present and without it. To compare the two.

I'll try to collect such trace when I'll have time but if you want to 
experiment debian 8.11.0 netinstall cd should boot either with -kernel or 
with the -bios pegasos2.rom (type boot cd install/pegasos at the ok prompt 
in that case but the rom needs to be extracted from an updater as it's not 
freely distributable). I think Thomas Huth also reproduced the same with 
prep or 40p firmware after a similar change on that machine now.

In any case it's unrelated to level sensitive mode which is only needed by 
MorphOS on pegasos2 to fix simultaneous interrupts e.g.with sound and USB 
or PCI cards which all share IRQ9 on that machine. Other guests don't even 
enable that ltim bit so it should not affect anything else.

Regards,
BALATON Zoltan
--3866299591-1407362776-1677847652=:28478--

