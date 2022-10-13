Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 202E25FD464
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 07:59:20 +0200 (CEST)
Received: from localhost ([::1]:46576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oirFW-0003U0-N5
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 01:59:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oir9t-00064K-0y
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 01:53:30 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:35700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oir9p-0006HI-Vt
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 01:53:28 -0400
Received: by mail-pl1-x62c.google.com with SMTP id h10so923493plb.2
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 22:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1+w5uY9Bw+eVNjSZY3QsmIR/7gtrwAJ6iTY4dwiKzzI=;
 b=djDtA1COpCFTSf1ar0vbuIsYffUoO5yIdX3Fwf2YfslyRqlWadrAGe7oqEmWKAU63a
 erGmgYljhQja9XjPXKz0Ck9GcFrqgBiKBf2JLmtnajaOFw/Z8EKjiw4BnJ1d/7npJUD6
 qV0pjtXJilZotv9xea2rkbON8n2bzC5Hn4LXmL+IRE+Yd554/XzUs7nOt1iiEgCscifi
 gpQJAswP/QmMMpt8N/wnmeUUdOo5DdUUilwL4jQO38Fyx6qIQcdOiY4a5g/m7mrglS2b
 M0VMv20vdsuedISrltQUroF9nGMwuWxWOpUn3FN6VGYHw/Si98X7pCBIc4RrEYmkmZGt
 YXUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1+w5uY9Bw+eVNjSZY3QsmIR/7gtrwAJ6iTY4dwiKzzI=;
 b=SuJ6fMvhhR6Qv7Qo5/2XaRqSjiD66qKI4LAiLcSukjsTRh1zB+dQuHp0YbIJLONouj
 8dTTojwryYQoxVNbELlI1ghrYjn9nUZXf8CbRdylMjeKnLu7yNHj+mmz6tV3whjqE6Bu
 qiZQK9dOfXiS+kXvhMYgpi54uZinIcCe9bVrs/5ofHGScGcVUMoIJtDRlzVNjtLQ2jSD
 qEYXu5mAE3RjNSOItFdvLJKzSgcb7MLHWSnqKWL8LLK381WaxeJXcUfh+fsWKEgtiQWQ
 wb8owQHzmmudUSR1RbD7q+Ck5K7Evck33NIa4MK5ngTjySkMyJWEo/dom8XKfMwoWD09
 kiEQ==
X-Gm-Message-State: ACrzQf1JKT9GJi3SNiF59BDDtKc4nw1U8Nkat9JN17CGfSLmvBLNGcEF
 oWqODlyLiGMAuQpeLHKxeNDktCUZjjaTuw==
X-Google-Smtp-Source: AMsMyM4RU8Eiw0pGGohmBgIAqUsddpjrsU2efq+d3ViiIFJZuP9su7lfit1EPi47TaD50Odqag3Gzg==
X-Received: by 2002:a17:90b:4a51:b0:20d:4ded:3c26 with SMTP id
 lb17-20020a17090b4a5100b0020d4ded3c26mr9092890pjb.23.1665640403963; 
 Wed, 12 Oct 2022 22:53:23 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a170902e84900b00177f82f0789sm11800752plg.198.2022.10.12.22.53.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Oct 2022 22:53:23 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH] tests/qtest/libqos/e1000e: Use e1000_regs.h
Date: Thu, 13 Oct 2022 14:52:45 +0900
Message-Id: <20221013055245.28102-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
---
 hw/net/e1000_regs.h         |   1 +
 tests/qtest/libqos/e1000e.c | 119 +++++++++++++-----------------------
 2 files changed, 45 insertions(+), 75 deletions(-)

diff --git a/hw/net/e1000_regs.h b/hw/net/e1000_regs.h
index e274c4fcd2..170452e0af 100644
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
index f87e0e84b2..9b6bb17565 100644
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
2.37.3


