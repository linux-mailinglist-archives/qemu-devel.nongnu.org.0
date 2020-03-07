Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D892717CEF8
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Mar 2020 16:17:12 +0100 (CET)
Received: from localhost ([::1]:49732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jAbCR-0003Tn-Kl
	for lists+qemu-devel@lfdr.de; Sat, 07 Mar 2020 10:17:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59798)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1jAbBC-0001rB-Bd
 for qemu-devel@nongnu.org; Sat, 07 Mar 2020 10:15:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1jAbBB-0003BI-DS
 for qemu-devel@nongnu.org; Sat, 07 Mar 2020 10:15:54 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:38348
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jAbBB-00039M-1z; Sat, 07 Mar 2020 10:15:53 -0500
Received: from host86-162-6-80.range86-162.btcentralplus.com ([86.162.6.80]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jAbBV-0007LU-0Y; Sat, 07 Mar 2020 15:16:16 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org,
	jsnow@redhat.com
Date: Sat,  7 Mar 2020 15:15:36 +0000
Message-Id: <20200307151536.32709-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200307151536.32709-1-mark.cave-ayland@ilande.co.uk>
References: <20200307151536.32709-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.162.6.80
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 2/2] cmd646: register vmstate_ide_pci VMStateDescription in
 DeviceClass
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

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/ide/cmd646.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/ide/cmd646.c b/hw/ide/cmd646.c
index 2f11d8de24..3c4f765bd6 100644
--- a/hw/ide/cmd646.c
+++ b/hw/ide/cmd646.c
@@ -301,8 +301,6 @@ static void pci_cmd646_ide_realize(PCIDevice *dev, Error **errp)
         ide_register_restart_cb(&d->bus[i]);
     }
     g_free(irq);
-
-    vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_pci, d);
 }
 
 static void pci_cmd646_ide_exitfn(PCIDevice *dev)
@@ -339,6 +337,7 @@ static void cmd646_ide_class_init(ObjectClass *klass, void *data)
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
     dc->reset = cmd646_reset;
+    dc->vmsd = &vmstate_ide_pci;
     k->realize = pci_cmd646_ide_realize;
     k->exit = pci_cmd646_ide_exitfn;
     k->vendor_id = PCI_VENDOR_ID_CMD;
-- 
2.20.1


