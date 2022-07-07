Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3535698BA
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 05:18:46 +0200 (CEST)
Received: from localhost ([::1]:51662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9I2P-0005Uy-AG
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 23:18:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lkujaw@member.fsf.org>)
 id 1o9Hw9-0004iT-A4; Wed, 06 Jul 2022 23:12:17 -0400
Received: from mout-u-204.mailbox.org ([80.241.59.204]:43388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <lkujaw@member.fsf.org>)
 id 1o9Hw7-0007kg-Ke; Wed, 06 Jul 2022 23:12:17 -0400
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-u-204.mailbox.org (Postfix) with ESMTPS id 4LdhKC0FS1z9sQc;
 Thu,  7 Jul 2022 05:11:59 +0200 (CEST)
From: Lev Kujawski <lkujaw@member.fsf.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, Lev Kujawski <lkujaw@member.fsf.org>
Subject: [PATCH v2 6/7] hw/ide/piix: Ignore writes of hardwired PCI command
 register bits
Date: Thu,  7 Jul 2022 03:11:39 +0000
Message-Id: <20220707031140.158958-6-lkujaw@member.fsf.org>
In-Reply-To: <20220707031140.158958-1-lkujaw@member.fsf.org>
References: <20220707031140.158958-1-lkujaw@member.fsf.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=80.241.59.204; envelope-from=lkujaw@member.fsf.org;
 helo=mout-u-204.mailbox.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

* hw/ide/piix.c
  a) Add a reference to the PIIX4 data sheet.
  b) Mask the MSE bit using the QEMU PCI device wmask field.
* tests/qtest/ide-test.c
  Use the command_disabled field of the QPCIDevice testing model to
  indicate that PCI_COMMAND_MEMORY is hardwired in the PIIX3/4 IDE
  controller.

Signed-off-by: Lev Kujawski <lkujaw@member.fsf.org>
---
 hw/ide/piix.c          | 15 +++++++++++++++
 tests/qtest/ide-test.c |  1 +
 2 files changed, 16 insertions(+)

diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index de1f4f0efb..64620c5778 100644
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
@@ -160,6 +162,19 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
     uint8_t *pci_conf = dev->config;
     int rc;
 
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
+    pci_set_word(dev->wmask + PCI_COMMAND,
+                 PCI_COMMAND_MASTER | PCI_COMMAND_IO);
+
     pci_conf[PCI_CLASS_PROG] = 0x80; // legacy ATA mode
 
     bmdma_setup_bar(d);
diff --git a/tests/qtest/ide-test.c b/tests/qtest/ide-test.c
index dfcf59cee8..728e8ce00f 100644
--- a/tests/qtest/ide-test.c
+++ b/tests/qtest/ide-test.c
@@ -176,6 +176,7 @@ static QPCIDevice *get_pci_device(QTestState *qts, QPCIBar *bmdma_bar,
 
     *ide_bar = qpci_legacy_iomap(dev, IDE_BASE);
 
+    dev->command_disabled = PCI_COMMAND_MEMORY;
     qpci_device_enable(dev);
 
     return dev;
-- 
2.34.1


