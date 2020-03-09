Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF81717D804
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Mar 2020 03:07:27 +0100 (CET)
Received: from localhost ([::1]:35150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jB7pG-0000D8-RI
	for lists+qemu-devel@lfdr.de; Sun, 08 Mar 2020 22:07:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55319)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1jB7np-0006xc-Ph
 for qemu-devel@nongnu.org; Sun, 08 Mar 2020 22:05:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1jB7no-0004M5-PO
 for qemu-devel@nongnu.org; Sun, 08 Mar 2020 22:05:57 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:31603)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
 id 1jB7nl-0004Hn-Q1; Sun, 08 Mar 2020 22:05:53 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 0CA9B7476D5;
 Mon,  9 Mar 2020 01:49:29 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 823457461AE; Mon,  9 Mar 2020 01:49:28 +0100 (CET)
Message-Id: <cover.1583714522.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 0/2] Implement "non 100% native mode" in via-ide
Date: Mon, 09 Mar 2020 01:42:02 +0100
To: qemu-devel@nongnu.org,
    qemu-block@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:738:2001:2001::2001
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
work arounds on that platform and don't work unless this is emulated.
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
 hw/ide/via.c            | 57 +++++++++++++++++++++++++++++++++++------
 hw/mips/mips_fulong2e.c |  2 +-
 hw/sparc64/sun4u.c      |  9 ++-----
 include/hw/ide.h        |  7 ++---
 include/hw/ide/pci.h    |  7 ++++-
 7 files changed, 69 insertions(+), 27 deletions(-)

-- 
2.21.1


