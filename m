Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C33718428C
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Mar 2020 09:26:47 +0100 (CET)
Received: from localhost ([::1]:55490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCfeY-0001Ys-9q
	for lists+qemu-devel@lfdr.de; Fri, 13 Mar 2020 04:26:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56519)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1jCfcq-00080p-O1
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 04:25:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1jCfcp-0004jJ-Nb
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 04:25:00 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:51490
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jCfcn-0004bz-CP; Fri, 13 Mar 2020 04:24:57 -0400
Received: from host86-185-91-43.range86-185.btcentralplus.com ([86.185.91.43]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jCfd4-0007Mr-G2; Fri, 13 Mar 2020 08:25:19 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: jsnow@redhat.com, philmd@redhat.com, amarkovic@wavecomp.com,
 mst@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 balaton@eik.bme.hu
Date: Fri, 13 Mar 2020 08:24:37 +0000
Message-Id: <20200313082444.2439-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.185.91.43
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 0/7] via-ide: fixes and improvements
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:41c9:1:41f::167
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Following on from the earlier thread "Implement "non 100% native mode"
in via-ide", here is an updated patchset based upon the test cases
sent to me off-list.

The VIA IDE controller is similar to early versions of the PIIX
controller in that the primary and secondary IDE channels are hardwired
to IRQs 14 and 15 respectively. Guest OSs typically handle this by
either switching the controller to legacy mode, or using native mode and
using a combination of PCI device/vendor ID and/or checking various
registers in PCI configuration space to detect this condition and apply
a special fixed IRQ 14/15 routing.

This patchset effectively updates the VIA IDE PCI device to follow the
behaviour in the datasheet in two ways: fixing some PCI configuration
space register defaults and behaviours, and always using legacy IRQ 14/15
routing, and once applied allows all our known test images to boot
correctly.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


BALATON Zoltan (2):
  ide/via: Get rid of via_ide_init()
  pci: Honour wmask when resetting PCI_INTERRUPT_LINE

Mark Cave-Ayland (5):
  via-ide: move registration of VMStateDescription to DeviceClass
  via-ide: ensure that PCI_INTERRUPT_LINE is hard-wired to its default
    value
  via-ide: initialise IDE controller in legacy mode
  via-ide: allow guests to write to PCI_CLASS_PROG
  via-ide: always use legacy IRQ 14/15 routing

 hw/ide/via.c            | 21 +++++----------------
 hw/mips/mips_fulong2e.c |  5 ++++-
 hw/pci/pci.c            |  5 ++++-
 include/hw/ide.h        |  1 -
 4 files changed, 13 insertions(+), 19 deletions(-)

-- 
2.20.1


