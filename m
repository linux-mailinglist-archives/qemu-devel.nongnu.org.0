Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E55B184298
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Mar 2020 09:28:46 +0100 (CET)
Received: from localhost ([::1]:55520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCfgT-0004Uh-2t
	for lists+qemu-devel@lfdr.de; Fri, 13 Mar 2020 04:28:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57184)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1jCfdO-0000pP-3o
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 04:25:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1jCfdN-0005bx-5H
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 04:25:34 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:51558
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jCfdK-0005Xz-Am; Fri, 13 Mar 2020 04:25:30 -0400
Received: from host86-185-91-43.range86-185.btcentralplus.com ([86.185.91.43]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jCfdb-0007Mr-N6; Fri, 13 Mar 2020 08:25:52 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: jsnow@redhat.com, philmd@redhat.com, amarkovic@wavecomp.com,
 mst@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 balaton@eik.bme.hu
Date: Fri, 13 Mar 2020 08:24:44 +0000
Message-Id: <20200313082444.2439-8-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200313082444.2439-1-mark.cave-ayland@ilande.co.uk>
References: <20200313082444.2439-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.185.91.43
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 7/7] via-ide: always use legacy IRQ 14/15 routing
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

The existing code uses fixed PCI IRQ routing on IRQ 14 rather than legacy IRQ
14/15 routing as documented in the datasheet.

With the changes in this patchset guest OSs now correctly detect and configure
the VIA controller in legacy IRQ routing mode, allowing the incorrect fixed
PCI IRQ routing to be removed.

Note that this fixed legacy IRQ 14/15 routing is identical to similar behaviour
in the early PIIX IDE controllers.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/ide/via.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/hw/ide/via.c b/hw/ide/via.c
index 3c4d474e48..8de4945cc1 100644
--- a/hw/ide/via.c
+++ b/hw/ide/via.c
@@ -113,10 +113,7 @@ static void via_ide_set_irq(void *opaque, int n, int level)
     }
 
     level = (d->config[0x70] & 0x80) || (d->config[0x78] & 0x80);
-    n = pci_get_byte(d->config + PCI_INTERRUPT_LINE);
-    if (n) {
-        qemu_set_irq(isa_get_irq(NULL, n), level);
-    }
+    qemu_set_irq(isa_get_irq(NULL, 14 + n), level);
 }
 
 static void via_ide_reset(DeviceState *dev)
-- 
2.20.1


