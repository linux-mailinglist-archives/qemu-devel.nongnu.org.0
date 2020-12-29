Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4D92E707F
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Dec 2020 13:08:39 +0100 (CET)
Received: from localhost ([::1]:35528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuDnq-0003Ta-Bv
	for lists+qemu-devel@lfdr.de; Tue, 29 Dec 2020 07:08:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kuDn8-000351-4f
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 07:07:54 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:61844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kuDn6-00089E-Ba
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 07:07:53 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id C7869746552;
 Tue, 29 Dec 2020 13:07:50 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 9A01274645F; Tue, 29 Dec 2020 13:07:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 9827974645B;
 Tue, 29 Dec 2020 13:07:50 +0100 (CET)
Date: Tue, 29 Dec 2020 13:07:50 +0100 (CET)
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v2 2/2] via-ide: Fix fuloong2e support
In-Reply-To: <59564814-9b82-7f9d-7535-201a9ca5189a@ilande.co.uk>
Message-ID: <a2abba3c-3a99-8ff6-fcfd-daf346e912e0@eik.bme.hu>
References: <cover.1609107222.git.balaton@eik.bme.hu>
 <8e58807dd2ba46866e7f152244e4541e6425177d.1609107222.git.balaton@eik.bme.hu>
 <a7b14637-4a3e-1635-a0c2-da9ee48022a8@ilande.co.uk>
 <ab55636b-9ba7-6e38-8d62-31ef1a11c455@eik.bme.hu>
 <59564814-9b82-7f9d-7535-201a9ca5189a@ilande.co.uk>
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
Cc: Huacai Chen <chenhuacai@kernel.org>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Guenter Roeck <linux@roeck-us.net>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

On Tue, 29 Dec 2020, Mark Cave-Ayland wrote:
> On 28/12/2020 20:50, BALATON Zoltan via wrote:
>> I think leaving the legacy ports enabled is a bad idea for at least two 
>> reasons: 1) It may clash with other io ports on other machines, e.g. I'm 
>> not sure on PPC where firmware or OS does not expect to see legacy ISA 
>> ports won't map some io BAR of a PCI card there. 2) If this is left enabled 
>> there would be two ports poking the same registers so if that does not 
>> cause a problem by itself, writing to one accidentally (like when something 
>> is mapped over it) could cause corruption of IDE state so I think it's much 
>> better to protect this than later trying to debug such problems.
>
> Legacy ioports originate in the x86 world, however all the PCI bus 
> enumeration code I've seen reserves the lower part of the IO address space to 
> prevent such problems with e.g. a BIOS starting up in legacy mode.

I don't remember the details and won't test it again but PPC has neither 
BIOS nor legacy io ports (or io ports for that matter, all that is memory 
mapped). If you want go back to the email thread in March where I've 
described in detail how I ended up with these and what are the assumptions 
of guests I've tested and tried to satisfy with this.

Stop trying to compare it with hardware and look at it in a way that we 
want to make a device model that works with the guests we want to run. In 
that frame this works and probably the simplest way. Unless you fully want 
to implement all the quirks of the chip and take up all the clean up in 
QEMU needed for that (possibly risking breaking a lot of other boards 
along the way) this won't match hardware 100%.

Regards,
BALATON Zoltan

