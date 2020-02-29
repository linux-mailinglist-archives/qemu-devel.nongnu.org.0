Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 668C0174A1E
	for <lists+qemu-devel@lfdr.de>; Sun,  1 Mar 2020 00:28:36 +0100 (CET)
Received: from localhost ([::1]:36744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8BX8-0001ES-TR
	for lists+qemu-devel@lfdr.de; Sat, 29 Feb 2020 18:28:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38704)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1j8BW1-0008N4-HD
 for qemu-devel@nongnu.org; Sat, 29 Feb 2020 18:27:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1j8BW0-0005WA-IN
 for qemu-devel@nongnu.org; Sat, 29 Feb 2020 18:27:25 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:40848)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
 id 1j8BVx-0005Kz-Uv; Sat, 29 Feb 2020 18:27:22 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 97FF1747E08;
 Sun,  1 Mar 2020 00:27:11 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 79186747DCF; Sun,  1 Mar 2020 00:27:11 +0100 (CET)
Message-Id: <cover.1583017348.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 0/2] Implement "non 100% native mode" in via-ide
Date: Sun, 01 Mar 2020 00:02:28 +0100
To: qemu-devel@nongnu.org,
    qemu-block@nongnu.org
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
Cc: John Snow <jsnow@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, philmd@redhat.com,
 Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This small series implements the quirky mode of via-ide found at least
on pegasos2 which is needed for guests that expect this and activate
work arounds on that platform so don't work unless this is emulated.
(Symptom is missing IDE interrupts.) We need a flag to turn this mode
on or off so the first patch repurposes the last remaining CMD646
specific field in PCIIDEState to allow more flags and make room for
the new legacy-irq flag there. (The CMD646 may need similar mode or
something else may need more flags in the future.) Boards using CMD646
and VIA IDE are updated for the above changes.

Tested with Linux and MorphOS on pegasos2 and a Gentoo live CD kernel
for mips_fulong2e that's the only one I could find but being beta not
sure if that fully works on real hardware. (The mips_fulong2e also
seems to have problems with pci devices so to boot Linux you need
-net none -vga none and use serial console otherwise the kernel panics.)

Regards,
BALATON Zoltan

BALATON Zoltan (2):
  ide: Make room for flags in PCIIDEState and add one for legacy IRQ
    routing
  via-ide: Also emulate non 100% native mode

 hw/alpha/dp264.c        |  2 +-
 hw/ide/cmd646.c         | 12 ++++-----
 hw/ide/via.c            | 60 +++++++++++++++++++++++++++++++++++------
 hw/mips/mips_fulong2e.c |  2 +-
 hw/sparc64/sun4u.c      |  9 ++-----
 include/hw/ide.h        |  7 ++---
 include/hw/ide/pci.h    |  7 ++++-
 7 files changed, 72 insertions(+), 27 deletions(-)

-- 
2.21.1


