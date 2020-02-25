Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCA216F25C
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 23:01:25 +0100 (CET)
Received: from localhost ([::1]:35486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6iGa-0004zt-W1
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 17:01:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47540)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1j6iFK-0004QL-EO
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 17:00:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1j6iFI-00018e-E8
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 17:00:05 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:47467)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>) id 1j6iFH-0000u0-NG
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 17:00:04 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 74244747DFD;
 Tue, 25 Feb 2020 23:00:01 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 192FD747DFA; Tue, 25 Feb 2020 23:00:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 14BD1747DF7;
 Tue, 25 Feb 2020 23:00:01 +0100 (CET)
Date: Tue, 25 Feb 2020 23:00:01 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: John Snow <jsnow@redhat.com>
Subject: Re: IDE IRQ problem after UDMA enabled (was: Re: Emulating Solaris
 10 on SPARC64 sun4u)
In-Reply-To: <alpine.BSF.2.22.395.2002252041380.50551@zero.eik.bme.hu>
Message-ID: <alpine.BSF.2.22.395.2002252251001.87116@zero.eik.bme.hu>
References: <CWXP123MB2262B6F3159B7AA7AB010F4183020@CWXP123MB2262.GBRP123.PROD.OUTLOOK.COM>
 <20200205173326.GA3256@work-vm>
 <LO2P123MB22710F9D590E023381119FAB831C0@LO2P123MB2271.GBRP123.PROD.OUTLOOK.COM>
 <alpine.BSF.2.22.395.2002080030360.88696@zero.eik.bme.hu>
 <alpine.BSF.2.22.395.2002101546080.56058@zero.eik.bme.hu>
 <078a89dc-3e5f-2152-8783-1f22483c4603@redhat.com>
 <alpine.BSF.2.22.395.2002252041380.50551@zero.eik.bme.hu>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 152.66.115.2
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

On Tue, 25 Feb 2020, BALATON Zoltan wrote:
> On Mon, 10 Feb 2020, John Snow wrote:
>> It sounds like the real problem is either in the bmdma controller (or
>> its unique interaction with hw/ide/core.c -- which is possible) or in
>> the interrupt routing somewhere else.
>> 
>> If you have any IDE traces from a hang, feel free to throw them up on a
>> pastebin for me to take a peek at; it might help for me to see the exact
>> sequence that causes a hang in QEMU's IDE terms to see if I can't
>> "reverse engineer" what the guest is hoping to have happen. Maybe I can
>> trace this to a bad register value.
>
> I've got some traces from Linux and MorphOS (both on my work in progress 
> pegasos2 emulation using via-ide where I can most easily reproduce this) but 
> I'm not sure what to look for in these. MorphOS starts booting, so firmware 
> can read ide-cd connected to via-ide as well as MorphOS can before enabling 
> UDMA 5 mode but stops after that and cannot read the drive any more. Linux 
> works even after enabling DMA. I've gathered some logs in 
> https://osdn.net/projects/qmiga/ticket/38949 previously but now I try to list 
> here the part in more detail where drive is detected, enabling DMA and first 
> command after that in case you can spot something in these that could explain 
> why it fails with MorphOS driver.

Never mind, I've found a clue in NetBSD's driver:

http://cvsweb.netbsd.org/bsdweb.cgi/src/sys/dev/pci/viaide.c?rev=1.89&content-type=text/x-cvsweb-markup&only_with_tag=MAIN

which has a comment that says:

/*
  * At least under certain (mis)configurations (e.g. on the "Pegasos" board)
  * the VT8231-IDE's native mode only works with irq 14/15, and cannot be
  * programmed to use a single native PCI irq alone. So we install an interrupt
  * handler for each channel, as in compatibility mode.
  */

If I change via-ide to use ISA IRQ14 and 15 and ignore what's programmed 
in the PCI config reg then MorphOS works with UDMA so it expects that. 
This change however breaks Linux which still boots after getting some 
errors but maybe it downgrades to PIO mode then. I'll need to find out 
more about how is this broken on real hardware and how can we emulate it.

So you don't need to look at the logs unless you want to check why it sees 
a non working ATA device after resetting the bus but logs in the ticket 
above may be more useful for that as I did not include that part in this 
email.

Thank you,
BALATON Zoltan

