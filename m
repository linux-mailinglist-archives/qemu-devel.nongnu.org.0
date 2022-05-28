Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEC5536E71
	for <lists+qemu-devel@lfdr.de>; Sat, 28 May 2022 22:51:10 +0200 (CEST)
Received: from localhost ([::1]:43842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nv3Ov-0006Tf-Gj
	for lists+qemu-devel@lfdr.de; Sat, 28 May 2022 16:51:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lkujaw@member.fsf.org>)
 id 1nv3MJ-0003i4-GW; Sat, 28 May 2022 16:48:28 -0400
Received: from mout-u-107.mailbox.org ([2001:67c:2050:101:465::107]:35140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <lkujaw@member.fsf.org>)
 id 1nv3MH-00051a-VZ; Sat, 28 May 2022 16:48:27 -0400
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-u-107.mailbox.org (Postfix) with ESMTPS id 4L9YfZ3W8bz9sR0;
 Sat, 28 May 2022 22:48:22 +0200 (CEST)
From: Lev Kujawski <lkujaw@member.fsf.org>
To: qemu-trival@nongnu.org
Cc: Lev Kujawski <lkujaw@member.fsf.org>, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org (open list:IDE),
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH 4/4] hw/ide/piix: Ignore writes of hardwired PCI command
 register bits
Date: Sat, 28 May 2022 20:47:02 +0000
Message-Id: <20220528204702.167912-4-lkujaw@member.fsf.org>
In-Reply-To: <20220528204702.167912-1-lkujaw@member.fsf.org>
References: <20220528204702.167912-1-lkujaw@member.fsf.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2050:101:465::107;
 envelope-from=lkujaw@member.fsf.org; helo=mout-u-107.mailbox.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

One method to enable PCI bus mastering for IDE controllers, often used
by x86 firmware, is to write 0x7 to the PCI command register.  Neither
the PIIX3 specification nor actual hardware (a Tyan S1686D system)
permit modification of the Memory Space Enable (MSE) bit, 1, and thus
the command register would be left in an unspecified state without
this patch.

Signed-off-by: Lev Kujawski <lkujaw@member.fsf.org>
---
 hw/ide/piix.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index 76ea8fd9f6..f1d1168ecd 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -25,6 +25,8 @@
  * References:
  *  [1] 82371FB (PIIX) AND 82371SB (PIIX3) PCI ISA IDE XCELERATOR,
  *      290550-002, Intel Corporation, April 1997.
+ *  [2] 82371AB PCI-TO-ISA / IDE XCELERATOR (PIIX4), 290562-001,
+ *      Intel Corporation, April 1997.
  */
 
 #include "qemu/osdep.h"
@@ -32,6 +34,7 @@
 #include "migration/vmstate.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
+#include "qemu/range.h"
 #include "sysemu/block-backend.h"
 #include "sysemu/blockdev.h"
 #include "sysemu/dma.h"
@@ -220,6 +223,26 @@ static void pci_piix_ide_exitfn(PCIDevice *dev)
     }
 }
 
+static void piix_pci_config_write(PCIDevice *d, uint32_t addr,
+                                  uint32_t val, int l)
+{
+    /*
+     * Mask all IDE PCI command register bits except for Bus Master
+     * Function Enable (bit 2) and I/O Space Enable (bit 1), as the
+     * remainder are hardwired to 0 [1, p.48] [2, p.89-90].
+     *
+     * NOTE: According to the PIIX3 datasheet [1], the Memory Space
+     * Enable (MSE bit) is hardwired to 1, but this is contradicted by
+     * actual PIIX3 hardware, the datasheet itself (viz., Default
+     * Value: 0000h), and the PIIX4 datasheet [2].
+     */
+    if (range_covers_byte(addr, l, PCI_COMMAND)) {
+        val &= ~(0xfffa << ((PCI_COMMAND - addr) << 3));
+    }
+
+    pci_default_write_config(d, addr, val, l);
+}
+
 /* NOTE: for the PIIX3, the IRQs and IOports are hardcoded */
 static void piix3_ide_class_init(ObjectClass *klass, void *data)
 {
@@ -232,6 +255,7 @@ static void piix3_ide_class_init(ObjectClass *klass, void *data)
     k->vendor_id = PCI_VENDOR_ID_INTEL;
     k->device_id = PCI_DEVICE_ID_INTEL_82371SB_1;
     k->class_id = PCI_CLASS_STORAGE_IDE;
+    k->config_write = piix_pci_config_write;
     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
     dc->hotpluggable = false;
 }
@@ -260,6 +284,7 @@ static void piix4_ide_class_init(ObjectClass *klass, void *data)
     k->vendor_id = PCI_VENDOR_ID_INTEL;
     k->device_id = PCI_DEVICE_ID_INTEL_82371AB;
     k->class_id = PCI_CLASS_STORAGE_IDE;
+    k->config_write = piix_pci_config_write;
     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
     dc->hotpluggable = false;
 }
-- 
2.34.1


