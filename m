Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4851174FE8
	for <lists+qemu-devel@lfdr.de>; Sun,  1 Mar 2020 22:31:47 +0100 (CET)
Received: from localhost ([::1]:52006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8WBe-0004rg-DE
	for lists+qemu-devel@lfdr.de; Sun, 01 Mar 2020 16:31:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55511)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1j8WAa-0004FW-An
 for qemu-devel@nongnu.org; Sun, 01 Mar 2020 16:30:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1j8WAY-0000g0-4n
 for qemu-devel@nongnu.org; Sun, 01 Mar 2020 16:30:40 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:47808)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
 id 1j8WAU-0000e3-82; Sun, 01 Mar 2020 16:30:34 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id B358D7476D5;
 Sun,  1 Mar 2020 22:30:31 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 8AF4B746381; Sun,  1 Mar 2020 22:30:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 889F474637E;
 Sun,  1 Mar 2020 22:30:31 +0100 (CET)
Date: Sun, 1 Mar 2020 22:30:31 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH 2/2] via-ide: Also emulate non 100% native mode
In-Reply-To: <38cb0f83-79fc-7021-38fc-c1e28c3c0fa0@ilande.co.uk>
Message-ID: <alpine.BSF.2.22.395.2003012202330.79908@zero.eik.bme.hu>
References: <cover.1583017348.git.balaton@eik.bme.hu>
 <32bb2eab213344151ca342bab5db2cf8c2758fb7.1583017348.git.balaton@eik.bme.hu>
 <f7f6bca9-ce20-cc3d-5366-1e947d729c21@ilande.co.uk>
 <bdbef976-a853-7178-8163-579e4bf9e2e0@ilande.co.uk>
 <alpine.BSF.2.22.395.2003011731130.95594@zero.eik.bme.hu>
 <57ff6676-5054-d3f6-f4fc-6ff02b09019f@ilande.co.uk>
 <alpine.BSF.2.22.395.2003011902490.28669@zero.eik.bme.hu>
 <alpine.BSF.2.22.395.2003011951370.28669@zero.eik.bme.hu>
 <38cb0f83-79fc-7021-38fc-c1e28c3c0fa0@ilande.co.uk>
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
Cc: qemu-block@nongnu.org, philmd@redhat.com, qemu-devel@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>, John Snow <jsnow@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 1 Mar 2020, Mark Cave-Ayland wrote:
> On 01/03/2020 18:53, BALATON Zoltan wrote:
>> On Sun, 1 Mar 2020, BALATON Zoltan wrote:
>>> is not legacy mode but "not 100% native mode". The prog-if is set to 0x8a which
>>> corresponds to native mode but this is what the Linux fixup function does, firmware
>>> sets it to 0x8f which means native mode.
>>
>> I mean, 0x8a legacy mode and 0x8f native mode, I see firmware poking 0x8f and Amiga
>> like OSes reading that yet expecting legacy interrupts. Linux fixes up prog-if so its
>> driver detects legacy interrupts but still uses ioports from PCI BARs.
>
> I see. Note that it is also possible to have a prog-if value of 0x80 which is where
> the hardware is locked into legacy mode via a pull-down resistor. Perhaps this is the
> case for Pegasos, since it would explain why attempts to switch the mode via prog-if
> are ignored?

I've seen such option in CMD646 docs but couldn't find similar in VT8231. 
Genesi has published the schematics of Pegasos II (linked from my 
https://osdn.net/projects/qmiga/wiki/SubprojectPegasos2 page) so we could 
check if you can tell which pin is that. But we get 0x8a in Linux lspci 
output on real hardware for prog-if which is explained by firmare setting 
it to 0x8f then Linux fixup function clearing bits 0 and 2 so does not 
seem it started as 0x80 because then firmware should not be able to set it 
to 0x8f either.

> I don't see the PCI BARs being a problem since native drivers wouldn't touch the
> memory/IO space enable bits, and the BARs are disabled by default. It could just be
> that the VIA chipset simply doesn't lock the PCI memory/IO space bits in
> compatibility mode if an OS does decide to use them and program the BARs as it would
> in native mode.

I think you mean legacy drivers should not touch BARs. That could also be 
a way (the docs do say that default values for BARs match legacy ports so 
it's possible that setting legacy mode resets these and uses them as they 
were enabled but does not prevent changes) but I don't see how could we 
implement that in QEMU because we either have legacy ports or PCI IDE in 
QEMU and BARs are handled by PCI code so to keep those enabled for legacy 
emulation even if they would be disabled for PCI would need some change in 
PCI code that's probably not a good idea to touch as a lot of things 
depend on that. This patch I've come up with is confined to PCI IDE code 
and the end result is the same for at least the boards and clients we care 
about so I'd go with this for now.

Regards,
BALATON Zoltan

