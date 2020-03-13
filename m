Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BCE18428F
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Mar 2020 09:26:52 +0100 (CET)
Received: from localhost ([::1]:55494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCfed-0001rB-Cp
	for lists+qemu-devel@lfdr.de; Fri, 13 Mar 2020 04:26:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56855)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1jCfd5-0000Gy-3V
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 04:25:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1jCfd3-00058P-3I
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 04:25:15 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:51530
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jCfd0-00050d-P0; Fri, 13 Mar 2020 04:25:10 -0400
Received: from host86-185-91-43.range86-185.btcentralplus.com ([86.185.91.43]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jCfdJ-0007Mr-P4; Fri, 13 Mar 2020 08:25:34 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: jsnow@redhat.com, philmd@redhat.com, amarkovic@wavecomp.com,
 mst@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 balaton@eik.bme.hu
Date: Fri, 13 Mar 2020 08:24:41 +0000
Message-Id: <20200313082444.2439-5-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200313082444.2439-1-mark.cave-ayland@ilande.co.uk>
References: <20200313082444.2439-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.185.91.43
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 4/7] via-ide: ensure that PCI_INTERRUPT_LINE is hard-wired to
 its default value
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

Some firmwares accidentally write to PCI_INTERRUPT_LINE on startup which has
no effect on real hardware since it is hard-wired to its default value, but
causes the guest OS to become confused trying to initialise IDE devices
when running under QEMU.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/ide/via.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ide/via.c b/hw/ide/via.c
index 3153be8862..8363bd4802 100644
--- a/hw/ide/via.c
+++ b/hw/ide/via.c
@@ -169,7 +169,7 @@ static void via_ide_realize(PCIDevice *dev, Error **errp)
 
     pci_config_set_prog_interface(pci_conf, 0x8f); /* native PCI ATA mode */
     pci_set_long(pci_conf + PCI_CAPABILITY_LIST, 0x000000c0);
-    dev->wmask[PCI_INTERRUPT_LINE] = 0xf;
+    dev->wmask[PCI_INTERRUPT_LINE] = 0;
 
     memory_region_init_io(&d->data_bar[0], OBJECT(d), &pci_ide_data_le_ops,
                           &d->bus[0], "via-ide0-data", 8);
-- 
2.20.1


