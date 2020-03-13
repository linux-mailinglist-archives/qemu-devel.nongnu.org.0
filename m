Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BC118429F
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Mar 2020 09:30:03 +0100 (CET)
Received: from localhost ([::1]:55536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCfhi-0006Rk-VE
	for lists+qemu-devel@lfdr.de; Fri, 13 Mar 2020 04:30:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56724)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1jCfcy-0008RO-Qr
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 04:25:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1jCfcx-0004xE-Nu
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 04:25:08 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:51520
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jCfcv-0004sW-Fa; Fri, 13 Mar 2020 04:25:05 -0400
Received: from host86-185-91-43.range86-185.btcentralplus.com ([86.185.91.43]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jCfdH-0007Mr-P2; Fri, 13 Mar 2020 08:25:29 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: jsnow@redhat.com, philmd@redhat.com, amarkovic@wavecomp.com,
 mst@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 balaton@eik.bme.hu
Date: Fri, 13 Mar 2020 08:24:40 +0000
Message-Id: <20200313082444.2439-4-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200313082444.2439-1-mark.cave-ayland@ilande.co.uk>
References: <20200313082444.2439-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.185.91.43
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 3/7] pci: Honour wmask when resetting PCI_INTERRUPT_LINE
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

From: BALATON Zoltan <balaton@eik.bme.hu>

The pci_do_device_reset() function (called from pci_device_reset)
clears the PCI_INTERRUPT_LINE config reg of devices on the bus but did
this without taking wmask into account. We'll have a device model now
that needs to set a constant value for this reg and this patch allows
to do that without additional workaround in device emulation to
reverse the effect of this PCI bus reset function.

Suggested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/pci/pci.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index e1ed6677e1..b5bc842fac 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -302,8 +302,11 @@ static void pci_do_device_reset(PCIDevice *dev)
     pci_word_test_and_clear_mask(dev->config + PCI_STATUS,
                                  pci_get_word(dev->wmask + PCI_STATUS) |
                                  pci_get_word(dev->w1cmask + PCI_STATUS));
+    /* Some devices make bits of PCI_INTERRUPT_LINE read only */
+    pci_byte_test_and_clear_mask(dev->config + PCI_INTERRUPT_LINE,
+                              pci_get_word(dev->wmask + PCI_INTERRUPT_LINE) |
+                              pci_get_word(dev->w1cmask + PCI_INTERRUPT_LINE));
     dev->config[PCI_CACHE_LINE_SIZE] = 0x0;
-    dev->config[PCI_INTERRUPT_LINE] = 0x0;
     for (r = 0; r < PCI_NUM_REGIONS; ++r) {
         PCIIORegion *region = &dev->io_regions[r];
         if (!region->size) {
-- 
2.20.1


