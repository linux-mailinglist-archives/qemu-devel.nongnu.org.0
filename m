Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03709560635
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 18:46:25 +0200 (CEST)
Received: from localhost ([::1]:57062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6apc-0002fC-0p
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 12:46:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lkujaw@member.fsf.org>)
 id 1o6aex-0001Oe-QS; Wed, 29 Jun 2022 12:35:28 -0400
Received: from mout-u-107.mailbox.org ([80.241.59.207]:35776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <lkujaw@member.fsf.org>)
 id 1o6aew-0001Um-1V; Wed, 29 Jun 2022 12:35:23 -0400
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-u-107.mailbox.org (Postfix) with ESMTPS id 4LY6WX0PbRz9sb8;
 Wed, 29 Jun 2022 18:35:04 +0200 (CEST)
From: Lev Kujawski <lkujaw@member.fsf.org>
To: qemu-devel@nongnu.org
Cc: Lev Kujawski <lkujaw@member.fsf.org>, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org (open list:IDE)
Subject: [PATCH 1/2] qpci_device_enable: Allow for command bits hardwired to 0
Date: Wed, 29 Jun 2022 16:34:49 +0000
Message-Id: <20220629163450.210111-1-lkujaw@member.fsf.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=80.241.59.207; envelope-from=lkujaw@member.fsf.org;
 helo=mout-u-107.mailbox.org
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

Devices like the PIIX3/4 IDE controller do not support certain modes
of operation, such as memory space accesses, and indicate this lack of
support by hardwiring the applicable bits to zero. The QEMU PCI device
testing framework is hereby extended to accommodate such devices.

* tests/qtest/libqos/pci.h: Add the command_disabled word to indicate
  bits hardwired to 0.
* tests/qtest/libqos/pci.c: Verify that hardwired bits are actually
  hardwired.
* tests/qtest/ide-test.c: Use the new command_disabled member to
  indicate that PCI_COMMAND_MEMORY is hardwired in the PIIX3/4
  IDE controller.

Signed-off-by: Lev Kujawski <lkujaw@member.fsf.org>
---
 tests/qtest/ide-test.c   |  1 +
 tests/qtest/libqos/pci.c | 13 +++++++------
 tests/qtest/libqos/pci.h |  1 +
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/tests/qtest/ide-test.c b/tests/qtest/ide-test.c
index 5bcb75a7e5..85a3967063 100644
--- a/tests/qtest/ide-test.c
+++ b/tests/qtest/ide-test.c
@@ -173,6 +173,7 @@ static QPCIDevice *get_pci_device(QTestState *qts, QPCIBar *bmdma_bar,
 
     *ide_bar = qpci_legacy_iomap(dev, IDE_BASE);
 
+    dev->command_disabled = PCI_COMMAND_MEMORY;
     qpci_device_enable(dev);
 
     return dev;
diff --git a/tests/qtest/libqos/pci.c b/tests/qtest/libqos/pci.c
index b23d72346b..4f3d28d8d9 100644
--- a/tests/qtest/libqos/pci.c
+++ b/tests/qtest/libqos/pci.c
@@ -220,18 +220,19 @@ int qpci_secondary_buses_init(QPCIBus *bus)
 
 void qpci_device_enable(QPCIDevice *dev)
 {
-    uint16_t cmd;
+    const uint16_t enable_bits =
+        PCI_COMMAND_IO | PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER;
+    uint16_t cmd, new_cmd;
 
     /* FIXME -- does this need to be a bus callout? */
     cmd = qpci_config_readw(dev, PCI_COMMAND);
-    cmd |= PCI_COMMAND_IO | PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER;
+    cmd |= enable_bits;
     qpci_config_writew(dev, PCI_COMMAND, cmd);
 
     /* Verify the bits are now set. */
-    cmd = qpci_config_readw(dev, PCI_COMMAND);
-    g_assert_cmphex(cmd & PCI_COMMAND_IO, ==, PCI_COMMAND_IO);
-    g_assert_cmphex(cmd & PCI_COMMAND_MEMORY, ==, PCI_COMMAND_MEMORY);
-    g_assert_cmphex(cmd & PCI_COMMAND_MASTER, ==, PCI_COMMAND_MASTER);
+    new_cmd = qpci_config_readw(dev, PCI_COMMAND);
+    new_cmd &= enable_bits;
+    g_assert_cmphex(new_cmd, ==, enable_bits & ~dev->command_disabled);
 }
 
 /**
diff --git a/tests/qtest/libqos/pci.h b/tests/qtest/libqos/pci.h
index 8389614523..eaedb98588 100644
--- a/tests/qtest/libqos/pci.h
+++ b/tests/qtest/libqos/pci.h
@@ -68,6 +68,7 @@ struct QPCIDevice
     bool msix_enabled;
     QPCIBar msix_table_bar, msix_pba_bar;
     uint64_t msix_table_off, msix_pba_off;
+    uint16_t command_disabled;
 };
 
 struct QPCIAddress {
-- 
2.34.1


