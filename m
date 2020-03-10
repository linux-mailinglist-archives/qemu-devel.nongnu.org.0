Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D87911807DF
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Mar 2020 20:21:17 +0100 (CET)
Received: from localhost ([::1]:39094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBkRI-0004dN-RD
	for lists+qemu-devel@lfdr.de; Tue, 10 Mar 2020 15:21:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41840)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1jBkO2-00018u-6w
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 15:17:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1jBkO0-00038Q-5X
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 15:17:54 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:60272)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
 id 1jBkNx-0002rL-87; Tue, 10 Mar 2020 15:17:49 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 267BC747E00;
 Tue, 10 Mar 2020 20:17:46 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 081DF74637D; Tue, 10 Mar 2020 20:17:46 +0100 (CET)
Message-Id: <cover.1583867210.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v4 0/4] Implement "non 100% native mode" in via-ide
Date: Tue, 10 Mar 2020 20:06:50 +0100
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

This (started to be small but getting bigger) series implements
"non-100% native mode" of via-ide found at least on pegasos2 where io
addresses come from PCI BARs but interrupts are hard coded to legacy
IRQ14 and 15. This is needed for guests that expect it and activate
work arounds on that platform and don't work unless this is emulated.
(Symptom is missing IDE IRQs after enabling BMDMA and boot freezes
waiting for interrupt.)

We need a flag to turn this mode on or off so we repurpose the last
remaining CMD646 specific field in PCIIDEState to allow more flags and
make room for the new legacy-irq flag there. (The CMD646 may need
similar mode or something else may need more flags in the future.)
Boards using CMD646 and VIA IDE are updated for the above changes.
Also included a patch fixing up PCI reset to not clear value set by
device emulation on bus reset when wmask does not allow that and
another getting rid of via_ide_init helper that's now out of fashion.

Tested with Linux and MorphOS on pegasos2 and a Gentoo live CD kernel
for mips_fulong2e that's the only one I could find but being beta not
sure if that fully works on real hardware. (The mips_fulong2e also
seems to have problems with pci devices so to boot Linux you need
-net none -vga none and use serial console otherwise the kernel panics.)

v4 is rebased on top of Mark's cmd646 patches that are now on the ide
tree.

Regards,
BALATON Zoltan

BALATON Zoltan (4):
  ide/via: Get rid of via_init_ide()
  ide: Make room for flags in PCIIDEState and add one for legacy IRQ
    routing
  pci: Honour wmask when resetting PCI_INTERRUPT_LINE
  via-ide: Also emulate non 100% native mode

 hw/ide/cmd646.c         |  4 ++--
 hw/ide/via.c            | 36 +++++++++++++++++++++++-------------
 hw/mips/mips_fulong2e.c |  5 ++++-
 hw/pci/pci.c            |  5 ++++-
 hw/sparc64/sun4u.c      |  2 +-
 include/hw/ide.h        |  1 -
 include/hw/ide/pci.h    |  7 ++++++-
 7 files changed, 40 insertions(+), 20 deletions(-)

-- 
2.21.1


