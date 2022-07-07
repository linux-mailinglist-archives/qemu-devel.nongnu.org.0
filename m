Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F050C5698AE
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 05:15:03 +0200 (CEST)
Received: from localhost ([::1]:41336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Hyo-0006zT-QX
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 23:15:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lkujaw@member.fsf.org>)
 id 1o9Hw6-0004YN-9a; Wed, 06 Jul 2022 23:12:14 -0400
Received: from mout-u-107.mailbox.org ([80.241.59.207]:35580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <lkujaw@member.fsf.org>)
 id 1o9Hw4-0007k9-MK; Wed, 06 Jul 2022 23:12:14 -0400
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-u-107.mailbox.org (Postfix) with ESMTPS id 4LdhK81pyZz9sSg;
 Thu,  7 Jul 2022 05:11:56 +0200 (CEST)
From: Lev Kujawski <lkujaw@member.fsf.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, Lev Kujawski <lkujaw@member.fsf.org>
Subject: [PATCH v2 5/7] qpci_device_enable: Allow for command bits hardwired
 to 0
Date: Thu,  7 Jul 2022 03:11:38 +0000
Message-Id: <20220707031140.158958-5-lkujaw@member.fsf.org>
In-Reply-To: <20220707031140.158958-1-lkujaw@member.fsf.org>
References: <20220707031140.158958-1-lkujaw@member.fsf.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=80.241.59.207; envelope-from=lkujaw@member.fsf.org;
 helo=mout-u-107.mailbox.org
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

Devices like the PIIX3/4 IDE controller do not support certain modes
of operation, such as memory space accesses, and indicate this lack of
support by hardwiring the applicable bits to zero.  Extend the QEMU
PCI device testing framework to accommodate such devices.

* tests/qtest/libqos/pci.h: Add the command_disabled word to indicate
  bits hardwired to 0.
* tests/qtest/libqos/pci.c: Verify that hardwired bits are actually
  hardwired.

Signed-off-by: Lev Kujawski <lkujaw@member.fsf.org>
---
 tests/qtest/libqos/pci.c | 13 +++++++------
 tests/qtest/libqos/pci.h |  1 +
 2 files changed, 8 insertions(+), 6 deletions(-)

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


