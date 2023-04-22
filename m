Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C78556EBAFB
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 21:23:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqIox-0004Vo-PN; Sat, 22 Apr 2023 15:22:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pqIou-0004Tk-P5; Sat, 22 Apr 2023 15:22:52 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pqIos-0003lZ-CJ; Sat, 22 Apr 2023 15:22:52 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id C88DA74634B;
 Sat, 22 Apr 2023 21:21:12 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 58332745720; Sat, 22 Apr 2023 21:21:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 564177456E3;
 Sat, 22 Apr 2023 21:21:12 +0200 (CEST)
Date: Sat, 22 Apr 2023 21:21:12 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, John Snow <jsnow@redhat.com>, 
 Huacai Chen <chenhuacai@kernel.org>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
 qemu-ppc@nongnu.org
Subject: Re: [PATCH 02/13] hw/ide/via: Implement ISA IRQ routing
In-Reply-To: <8B29FA8F-B534-4CB5-8311-07AAAC782CD9@gmail.com>
Message-ID: <d7d94bb5-3f76-e7bb-9786-207ec10e4936@eik.bme.hu>
References: <20230422150728.176512-1-shentey@gmail.com>
 <20230422150728.176512-3-shentey@gmail.com>
 <3b1d7a25-1600-872d-c0e8-b71ec49f551e@eik.bme.hu>
 <8B29FA8F-B534-4CB5-8311-07AAAC782CD9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Sat, 22 Apr 2023, Bernhard Beschow wrote:
> Am 22. April 2023 17:23:56 UTC schrieb BALATON Zoltan <balaton@eik.bme.hu>:
>> On Sat, 22 Apr 2023, Bernhard Beschow wrote:
>>> The VIA south bridge allows the legacy IDE interrupts to be routed to four
>>> different ISA interrupts. This can be configured through the 0x4a register in
>>> the PCI configuration space of the ISA function. The default routing matches
>>> the legacy ISA IRQs, that is 14 and 15.
>>
>> On VT8231 0x4a is PCI Master Arbitration Control, IDE interrupt Routing is 0x4c and only documents 14/15 as valid values.
>
> In the datasheet titled "VT8231 South Bridge", preliminary revision 0.8, 
> Oct. 29, 1999, page 60, the "IDE Interrupt Routing" register is located 
> at offset 0x4a and offers the same four interrupts in the same order as 
> in the code. Are we looking at the same datasheet?

Apparently not. The one I have says: Revision 2.32, May 10, 2004. Looks 
more authorative than a preliminary one.

>> Not sure any guest would actually change this or 0x4a and if that could cause problems but you may need to handle this somehow. (Apart from testing with MorphOS with -kernel you should really be testing with pegasos2.rom with MorphOS and Linux, e.g. Debian 8.11 netinstall iso is known to boot.)
>
> I've tested extensively with an x86 Linux guest on my pc-via branch which worked flawlessly.

That does not substitute testing Linux on pegasos2 though becuase there 
are some hacks in Linux kernel to handle some pecularities of the pegasos2 
including via ide on that machine and that can only be fully tested with 
pegasos2.rom and PPC Linux.

> As mentioned in the commit message the default routing of the chipset 
> matches legacy behavior, that is interrupts 14 and 15. This is reflected 
> by assigning [0x4a] = 4 in the code and that is how the code behaved 
> before.

And that's the only allowed value on VT8231, other bits are listed as 
reserved so I wonder if we want to model this at all if no guest is 
touching it anyway. So you could also just drop that part and keep it hard 
mapped to 14-15 as it is now, mentioning the config reg in a comment if we 
ever find a guest that needs it.

Regards,
BALATON Zoltan

