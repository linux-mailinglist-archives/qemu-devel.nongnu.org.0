Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A56B4184299
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Mar 2020 09:28:49 +0100 (CET)
Received: from localhost ([::1]:55522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCfgW-0004Y0-N9
	for lists+qemu-devel@lfdr.de; Fri, 13 Mar 2020 04:28:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57007)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1jCfdC-0000cg-CZ
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 04:25:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1jCfdA-0005Lw-Sx
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 04:25:22 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:51540
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jCfd7-0005Fy-RI; Fri, 13 Mar 2020 04:25:17 -0400
Received: from host86-185-91-43.range86-185.btcentralplus.com ([86.185.91.43]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jCfdO-0007Mr-Kv; Fri, 13 Mar 2020 08:25:40 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: jsnow@redhat.com, philmd@redhat.com, amarkovic@wavecomp.com,
 mst@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 balaton@eik.bme.hu
Date: Fri, 13 Mar 2020 08:24:42 +0000
Message-Id: <20200313082444.2439-6-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200313082444.2439-1-mark.cave-ayland@ilande.co.uk>
References: <20200313082444.2439-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.185.91.43
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 5/7] via-ide: initialise IDE controller in legacy mode
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

According to both the VT82C686B and VT8231 datasheets the VIA Southbridge IDE
controller is initialised in legacy mode.

This allows Linux to correctly determine that legacy rather than PCI IRQ routing
should be used since the boot console text in the fulong2e test image changes from:

scsi0 : pata_via
scsi1 : pata_via
ata1: PATA max UDMA/100 cmd 0xffffffffbfd04050 ctl 0xffffffffbfd04062 \
  bmdma 0xffffffffbfd04040 irq 14
ata2: PATA max UDMA/100 cmd 0xffffffffbfd04058 ctl 0xffffffffbfd04066 \
  bmdma 0xffffffffbfd04048 irq 14

to:

scsi0 : pata_via
scsi1 : pata_via
ata1: PATA max UDMA/100 cmd 0xffffffffbfd001f0 ctl 0xffffffffbfd003f6 \
  bmdma 0xffffffffbfd04040 irq 14
ata2: PATA max UDMA/100 cmd 0xffffffffbfd00170 ctl 0xffffffffbfd00376 \
  bmdma 0xffffffffbfd04048 irq 15

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/ide/via.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ide/via.c b/hw/ide/via.c
index 8363bd4802..c8835de01b 100644
--- a/hw/ide/via.c
+++ b/hw/ide/via.c
@@ -167,7 +167,7 @@ static void via_ide_realize(PCIDevice *dev, Error **errp)
     uint8_t *pci_conf = dev->config;
     int i;
 
-    pci_config_set_prog_interface(pci_conf, 0x8f); /* native PCI ATA mode */
+    pci_config_set_prog_interface(pci_conf, 0x8a); /* legacy mode */
     pci_set_long(pci_conf + PCI_CAPABILITY_LIST, 0x000000c0);
     dev->wmask[PCI_INTERRUPT_LINE] = 0;
 
-- 
2.20.1


