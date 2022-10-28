Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4AC6112AD
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 15:27:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooPLN-0001xt-ID; Fri, 28 Oct 2022 09:24:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooPKe-0001IY-6z
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:23:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooPKX-0005JS-O2
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:23:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666963405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qzgzF0IwgTS6jL8EH8+/wkSxte9W9rI2Lj5Ni37d9U4=;
 b=D4dqBuZ5F0dGREWe+GA91Ssw8mKHmJm9F3m+9qOoicqwtemlXwRC8Mii69O2hNBAjxuTlm
 fjJtzAFqMymilBQt8fiDgBT3ofmqOvrlxlzt40xFXOlinx0nCuZXqZ7ptpMnjrefFRfKcX
 +ZI7x47d+CrHk71M17eSXl5VzJDRU5g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-50hB6ZmJPcKPEh4jHZGVDQ-1; Fri, 28 Oct 2022 09:23:23 -0400
X-MC-Unique: 50hB6ZmJPcKPEh4jHZGVDQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 656BF1C08960;
 Fri, 28 Oct 2022 13:23:23 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D0A6112131B;
 Fri, 28 Oct 2022 13:23:22 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PULL 10/21] tests/qtest/libqos/e1000e: Use e1000_regs.h
Date: Fri, 28 Oct 2022 15:22:53 +0200
Message-Id: <20221028132304.829103-11-thuth@redhat.com>
In-Reply-To: <20221028132304.829103-1-thuth@redhat.com>
References: <20221028132304.829103-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Akihiko Odaki <akihiko.odaki@daynix.com>

The register definitions in tests/qtest/libqos/e1000e.c had names
different from hw/net/e1000_regs.h, which made it hard to understand
what test codes corresponds to the implementation. Use
hw/net/e1000_regs.h from tests/qtest/libqos/e1000e.c to remove
these duplications.

E1000E_CTRL_EXT_TXLSFLOW is removed from E1000E_CTRL_EXT settings
because hw/net/e1000_regs.h does not have the definition and it is for
TCP segmentation offload, which does not matter for the implemented
tests.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Message-Id: <20221013055245.28102-1-akihiko.odaki@daynix.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/net/e1000_regs.h         |   1 +
 tests/qtest/libqos/e1000e.c | 119 +++++++++++++-----------------------
 2 files changed, 45 insertions(+), 75 deletions(-)

diff --git a/hw/net/e1000_regs.h b/hw/net/e1000_regs.h
index ae99f58bab..9d423f6c09 100644
--- a/hw/net/e1000_regs.h
+++ b/hw/net/e1000_regs.h
@@ -793,6 +793,7 @@
 #define E1000_CTRL_EXT_ASDCHK  0x00001000 /* auto speed detection check */
 #define E1000_CTRL_EXT_EE_RST  0x00002000 /* EEPROM reset */
 #define E1000_CTRL_EXT_LINK_EN 0x00010000 /* enable link status from external LINK_0 and LINK_1 pins */
+#define E1000_CTRL_EXT_DRV_LOAD 0x10000000 /* Driver loaded bit for FW */
 #define E1000_CTRL_EXT_EIAME   0x01000000
 #define E1000_CTRL_EXT_IAME    0x08000000 /* Int ACK Auto-mask */
 #define E1000_CTRL_EXT_PBA_CLR 0x80000000 /* PBA Clear */
diff --git a/tests/qtest/libqos/e1000e.c b/tests/qtest/libqos/e1000e.c
index fc14b07884..ed47e34044 100644
--- a/tests/qtest/libqos/e1000e.c
+++ b/tests/qtest/libqos/e1000e.c
@@ -17,6 +17,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "hw/net/e1000_regs.h"
 #include "../libqtest.h"
 #include "pci-pc.h"
 #include "qemu/sockets.h"
@@ -27,49 +28,13 @@
 #include "qgraph.h"
 #include "e1000e.h"
 
-#define E1000E_IMS      (0x00d0)
+#define E1000E_IVAR_TEST_CFG \
+    (E1000E_RX0_MSG_ID | E1000_IVAR_INT_ALLOC_VALID             | \
+     ((E1000E_TX0_MSG_ID | E1000_IVAR_INT_ALLOC_VALID) << 8)    | \
+     ((E1000E_OTHER_MSG_ID | E1000_IVAR_INT_ALLOC_VALID) << 16) | \
+     E1000_IVAR_TX_INT_EVERY_WB)
 
-#define E1000E_STATUS   (0x0008)
-#define E1000E_STATUS_LU BIT(1)
-#define E1000E_STATUS_ASDV1000 BIT(9)
-
-#define E1000E_CTRL     (0x0000)
-#define E1000E_CTRL_RESET BIT(26)
-
-#define E1000E_RCTL     (0x0100)
-#define E1000E_RCTL_EN  BIT(1)
-#define E1000E_RCTL_UPE BIT(3)
-#define E1000E_RCTL_MPE BIT(4)
-
-#define E1000E_RFCTL     (0x5008)
-#define E1000E_RFCTL_EXTEN  BIT(15)
-
-#define E1000E_TCTL     (0x0400)
-#define E1000E_TCTL_EN  BIT(1)
-
-#define E1000E_CTRL_EXT             (0x0018)
-#define E1000E_CTRL_EXT_DRV_LOAD    BIT(28)
-#define E1000E_CTRL_EXT_TXLSFLOW    BIT(22)
-
-#define E1000E_IVAR                 (0x00E4)
-#define E1000E_IVAR_TEST_CFG        ((E1000E_RX0_MSG_ID << 0)    | BIT(3)  | \
-                                     (E1000E_TX0_MSG_ID << 8)    | BIT(11) | \
-                                     (E1000E_OTHER_MSG_ID << 16) | BIT(19) | \
-                                     BIT(31))
-
-#define E1000E_RING_LEN             (0x1000)
-
-#define E1000E_TDBAL    (0x3800)
-
-#define E1000E_TDBAH    (0x3804)
-#define E1000E_TDH      (0x3810)
-
-#define E1000E_RDBAL    (0x2800)
-#define E1000E_RDBAH    (0x2804)
-#define E1000E_RDH      (0x2810)
-
-#define E1000E_TXD_LEN              (16)
-#define E1000E_RXD_LEN              (16)
+#define E1000E_RING_LEN (0x1000)
 
 static void e1000e_macreg_write(QE1000E *d, uint32_t reg, uint32_t val)
 {
@@ -87,30 +52,34 @@ void e1000e_tx_ring_push(QE1000E *d, void *descr)
 {
     QE1000E_PCI *d_pci = container_of(d, QE1000E_PCI, e1000e);
     uint32_t tail = e1000e_macreg_read(d, E1000E_TDT);
-    uint32_t len = e1000e_macreg_read(d, E1000E_TDLEN) / E1000E_TXD_LEN;
+    uint32_t len = e1000e_macreg_read(d, E1000E_TDLEN) / E1000_RING_DESC_LEN;
 
-    qtest_memwrite(d_pci->pci_dev.bus->qts, d->tx_ring + tail * E1000E_TXD_LEN,
-                   descr, E1000E_TXD_LEN);
+    qtest_memwrite(d_pci->pci_dev.bus->qts,
+                   d->tx_ring + tail * E1000_RING_DESC_LEN,
+                   descr, E1000_RING_DESC_LEN);
     e1000e_macreg_write(d, E1000E_TDT, (tail + 1) % len);
 
     /* Read WB data for the packet transmitted */
-    qtest_memread(d_pci->pci_dev.bus->qts, d->tx_ring + tail * E1000E_TXD_LEN,
-                  descr, E1000E_TXD_LEN);
+    qtest_memread(d_pci->pci_dev.bus->qts,
+                  d->tx_ring + tail * E1000_RING_DESC_LEN,
+                  descr, E1000_RING_DESC_LEN);
 }
 
 void e1000e_rx_ring_push(QE1000E *d, void *descr)
 {
     QE1000E_PCI *d_pci = container_of(d, QE1000E_PCI, e1000e);
     uint32_t tail = e1000e_macreg_read(d, E1000E_RDT);
-    uint32_t len = e1000e_macreg_read(d, E1000E_RDLEN) / E1000E_RXD_LEN;
+    uint32_t len = e1000e_macreg_read(d, E1000E_RDLEN) / E1000_RING_DESC_LEN;
 
-    qtest_memwrite(d_pci->pci_dev.bus->qts, d->rx_ring + tail * E1000E_RXD_LEN,
-                   descr, E1000E_RXD_LEN);
+    qtest_memwrite(d_pci->pci_dev.bus->qts,
+                   d->rx_ring + tail * E1000_RING_DESC_LEN,
+                   descr, E1000_RING_DESC_LEN);
     e1000e_macreg_write(d, E1000E_RDT, (tail + 1) % len);
 
     /* Read WB data for the packet received */
-    qtest_memread(d_pci->pci_dev.bus->qts, d->rx_ring + tail * E1000E_RXD_LEN,
-                  descr, E1000E_RXD_LEN);
+    qtest_memread(d_pci->pci_dev.bus->qts,
+                  d->rx_ring + tail * E1000_RING_DESC_LEN,
+                  descr, E1000_RING_DESC_LEN);
 }
 
 static void e1000e_foreach_callback(QPCIDevice *dev, int devfn, void *data)
@@ -151,53 +120,53 @@ static void e1000e_pci_start_hw(QOSGraphObject *obj)
     qpci_device_enable(&d->pci_dev);
 
     /* Reset the device */
-    val = e1000e_macreg_read(&d->e1000e, E1000E_CTRL);
-    e1000e_macreg_write(&d->e1000e, E1000E_CTRL, val | E1000E_CTRL_RESET);
+    val = e1000e_macreg_read(&d->e1000e, E1000_CTRL);
+    e1000e_macreg_write(&d->e1000e, E1000_CTRL, val | E1000_CTRL_RST);
 
     /* Enable and configure MSI-X */
     qpci_msix_enable(&d->pci_dev);
-    e1000e_macreg_write(&d->e1000e, E1000E_IVAR, E1000E_IVAR_TEST_CFG);
+    e1000e_macreg_write(&d->e1000e, E1000_IVAR, E1000E_IVAR_TEST_CFG);
 
     /* Check the device status - link and speed */
-    val = e1000e_macreg_read(&d->e1000e, E1000E_STATUS);
-    g_assert_cmphex(val & (E1000E_STATUS_LU | E1000E_STATUS_ASDV1000),
-        ==, E1000E_STATUS_LU | E1000E_STATUS_ASDV1000);
+    val = e1000e_macreg_read(&d->e1000e, E1000_STATUS);
+    g_assert_cmphex(val & (E1000_STATUS_LU | E1000_STATUS_LAN_INIT_DONE),
+        ==, E1000_STATUS_LU | E1000_STATUS_LAN_INIT_DONE);
 
     /* Initialize TX/RX logic */
-    e1000e_macreg_write(&d->e1000e, E1000E_RCTL, 0);
-    e1000e_macreg_write(&d->e1000e, E1000E_TCTL, 0);
+    e1000e_macreg_write(&d->e1000e, E1000_RCTL, 0);
+    e1000e_macreg_write(&d->e1000e, E1000_TCTL, 0);
 
     /* Notify the device that the driver is ready */
-    val = e1000e_macreg_read(&d->e1000e, E1000E_CTRL_EXT);
-    e1000e_macreg_write(&d->e1000e, E1000E_CTRL_EXT,
-        val | E1000E_CTRL_EXT_DRV_LOAD | E1000E_CTRL_EXT_TXLSFLOW);
+    val = e1000e_macreg_read(&d->e1000e, E1000_CTRL_EXT);
+    e1000e_macreg_write(&d->e1000e, E1000_CTRL_EXT,
+        val | E1000_CTRL_EXT_DRV_LOAD);
 
-    e1000e_macreg_write(&d->e1000e, E1000E_TDBAL,
+    e1000e_macreg_write(&d->e1000e, E1000_TDBAL,
                            (uint32_t) d->e1000e.tx_ring);
-    e1000e_macreg_write(&d->e1000e, E1000E_TDBAH,
+    e1000e_macreg_write(&d->e1000e, E1000_TDBAH,
                            (uint32_t) (d->e1000e.tx_ring >> 32));
     e1000e_macreg_write(&d->e1000e, E1000E_TDLEN, E1000E_RING_LEN);
     e1000e_macreg_write(&d->e1000e, E1000E_TDT, 0);
-    e1000e_macreg_write(&d->e1000e, E1000E_TDH, 0);
+    e1000e_macreg_write(&d->e1000e, E1000_TDH, 0);
 
     /* Enable transmit */
-    e1000e_macreg_write(&d->e1000e, E1000E_TCTL, E1000E_TCTL_EN);
-    e1000e_macreg_write(&d->e1000e, E1000E_RDBAL,
+    e1000e_macreg_write(&d->e1000e, E1000_TCTL, E1000_TCTL_EN);
+    e1000e_macreg_write(&d->e1000e, E1000_RDBAL,
                            (uint32_t)d->e1000e.rx_ring);
-    e1000e_macreg_write(&d->e1000e, E1000E_RDBAH,
+    e1000e_macreg_write(&d->e1000e, E1000_RDBAH,
                            (uint32_t)(d->e1000e.rx_ring >> 32));
     e1000e_macreg_write(&d->e1000e, E1000E_RDLEN, E1000E_RING_LEN);
     e1000e_macreg_write(&d->e1000e, E1000E_RDT, 0);
-    e1000e_macreg_write(&d->e1000e, E1000E_RDH, 0);
+    e1000e_macreg_write(&d->e1000e, E1000_RDH, 0);
 
     /* Enable receive */
-    e1000e_macreg_write(&d->e1000e, E1000E_RFCTL, E1000E_RFCTL_EXTEN);
-    e1000e_macreg_write(&d->e1000e, E1000E_RCTL, E1000E_RCTL_EN  |
-                                        E1000E_RCTL_UPE |
-                                        E1000E_RCTL_MPE);
+    e1000e_macreg_write(&d->e1000e, E1000_RFCTL, E1000_RFCTL_EXTEN);
+    e1000e_macreg_write(&d->e1000e, E1000_RCTL, E1000_RCTL_EN  |
+                                        E1000_RCTL_UPE |
+                                        E1000_RCTL_MPE);
 
     /* Enable all interrupts */
-    e1000e_macreg_write(&d->e1000e, E1000E_IMS, 0xFFFFFFFF);
+    e1000e_macreg_write(&d->e1000e, E1000_IMS, 0xFFFFFFFF);
 
 }
 
-- 
2.31.1


