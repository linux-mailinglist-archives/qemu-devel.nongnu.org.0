Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A07E715D40C
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Feb 2020 09:49:14 +0100 (CET)
Received: from localhost ([::1]:36198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2Weu-000059-ST
	for lists+qemu-devel@lfdr.de; Fri, 14 Feb 2020 03:49:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40606)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1j2WcG-0005p3-Vo
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 03:46:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1j2WcF-0001pk-TN
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 03:46:28 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47866
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1j2WcF-0001pB-Nl
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 03:46:27 -0500
Received: from host86-175-83-30.range86-175.btcentralplus.com ([86.175.83.30]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1j2WcL-0008V4-D7; Fri, 14 Feb 2020 08:46:39 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	rth@twiddle.net,
	jsnow@redhat.com
Date: Fri, 14 Feb 2020 08:46:07 +0000
Message-Id: <20200214084607.20471-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214084607.20471-1-mark.cave-ayland@ilande.co.uk>
References: <20200214084607.20471-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.175.83.30
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 2/2] cmd646: remove unused pci_cmd646_ide_init() function
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
 hw/ide/cmd646.c  | 12 ------------
 include/hw/ide.h |  2 --
 2 files changed, 14 deletions(-)

diff --git a/hw/ide/cmd646.c b/hw/ide/cmd646.c
index 335c060673..d953932104 100644
--- a/hw/ide/cmd646.c
+++ b/hw/ide/cmd646.c
@@ -317,18 +317,6 @@ static void pci_cmd646_ide_exitfn(PCIDevice *dev)
     }
 }
 
-void pci_cmd646_ide_init(PCIBus *bus, DriveInfo **hd_table,
-                         int secondary_ide_enabled)
-{
-    PCIDevice *dev;
-
-    dev = pci_create(bus, -1, "cmd646-ide");
-    qdev_prop_set_uint32(&dev->qdev, "secondary", secondary_ide_enabled);
-    qdev_init_nofail(&dev->qdev);
-
-    pci_ide_create_devs(dev, hd_table);
-}
-
 static Property cmd646_ide_properties[] = {
     DEFINE_PROP_UINT32("secondary", PCIIDEState, secondary, 0),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/include/hw/ide.h b/include/hw/ide.h
index 28d8a06439..0c7080ed92 100644
--- a/include/hw/ide.h
+++ b/include/hw/ide.h
@@ -12,8 +12,6 @@ ISADevice *isa_ide_init(ISABus *bus, int iobase, int iobase2, int isairq,
                         DriveInfo *hd0, DriveInfo *hd1);
 
 /* ide-pci.c */
-void pci_cmd646_ide_init(PCIBus *bus, DriveInfo **hd_table,
-                         int secondary_ide_enabled);
 PCIDevice *pci_piix3_xen_ide_init(PCIBus *bus, DriveInfo **hd_table, int devfn);
 PCIDevice *pci_piix3_ide_init(PCIBus *bus, DriveInfo **hd_table, int devfn);
 PCIDevice *pci_piix4_ide_init(PCIBus *bus, DriveInfo **hd_table, int devfn);
-- 
2.20.1


