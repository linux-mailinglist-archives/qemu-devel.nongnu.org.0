Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0038D1807E1
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Mar 2020 20:21:49 +0100 (CET)
Received: from localhost ([::1]:39100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBkRp-0005RI-3Z
	for lists+qemu-devel@lfdr.de; Tue, 10 Mar 2020 15:21:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43871)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1jBkQ3-0003SJ-VB
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 15:20:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1jBkQ2-0000YW-U6
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 15:19:59 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:60284)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
 id 1jBkNw-0002rN-Ap; Tue, 10 Mar 2020 15:19:56 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 95B25747E04;
 Tue, 10 Mar 2020 20:17:46 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 189A6747DFE; Tue, 10 Mar 2020 20:17:46 +0100 (CET)
Message-Id: <5e372f6a73d4f45c0c18a264e986c29fc075f2d4.1583867210.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1583867210.git.balaton@eik.bme.hu>
References: <cover.1583867210.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v4 3/4] pci: Honour wmask when resetting PCI_INTERRUPT_LINE
Date: Tue, 10 Mar 2020 20:06:50 +0100
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, John Snow <jsnow@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, philmd@redhat.com,
 Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The pci_do_device_reset() function (called from pci_device_reset)
clears the PCI_INTERRUPT_LINE config reg of devices on the bus but did
this without taking wmask into account. We'll have a device model now
that needs to set a constant value for this reg and this patch allows
to do that without additional workaround in device emulation to
reverse the effect of this PCI bus reset function.

Suggested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
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
2.21.1


