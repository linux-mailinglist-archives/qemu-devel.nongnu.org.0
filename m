Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1870D666F19
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 11:10:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFuO6-0004hG-Q9; Thu, 12 Jan 2023 05:00:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pFuNn-0004fY-Cn
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:00:28 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pFuNk-0004sp-LE
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:00:27 -0500
Received: by mail-pl1-x62a.google.com with SMTP id d9so19707886pll.9
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 02:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F8LZ6MwsszDYYaatOEQ1wZn0Yly80TSQWEZojxzytbc=;
 b=ktWlFbNd6Bu0wQYXFofzxFbzWARBIWP8CrwkR+zlP3YO2qX8yXzCj6BVasiHDib+j5
 MxpZAoQ5riCXx2zL/2znUO5GEnRLMtwDau/XH4zUEuZKBu0h3Q6I18EXRARFN/CcBsrI
 NebuDImLwAQIe9sNjWdtzAABufq8qfmuXQw+Pa4KofJEC5NnBo8gX+mdQJh9kGFw4Nf7
 56YETCJ/LyjPqLxhYjMIVVG2utxJi97SfqSPkz5qcQv99MA+KNEcW1WxRT54skj4YiWl
 QqSpF3yRuBMpMxQb+cTw4oT5wPItVV7g2xG6cm0JnI5Yk6MzIyBejMOxqj0hkRUK2anc
 wVOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F8LZ6MwsszDYYaatOEQ1wZn0Yly80TSQWEZojxzytbc=;
 b=EcSpU3fnbtdXeinBW7jEvC9jBAiqVFWjf7Kwkyqj7Wz1cGPCZHzz9A4Fpha1+ks17g
 5cNeRtP6UDNM8qTQAVVrHoRUYqOlM2ui4vcd0hBzsdEw9wuuAIzep4VGTqAU7VKxSDOf
 6Z1t93NQcz/MLIi3me18A54LcxBDA/S50pZp4P2QCg1xuV3Acc1AKb9onrNbWBQd9gty
 ZQnUv864qgbikp2ljCUhYZcsG/+Sgoro5eOW8uCDD28X8DJLbkQYbDGWBCQgSiITmbuM
 T0GQzM1PMjvIUUhVsy8fCf2mY3GXETdBBstxceok+enRdgHchT4bd142seein0bu/mjv
 La+w==
X-Gm-Message-State: AFqh2kqYGUr+hMBRu+1YXjL39EUVc5KRZLm+t/Rq08AI9oOaM21loiMQ
 ahmZQyqZW6GP5M5bmEQth57l5Q==
X-Google-Smtp-Source: AMrXdXvDSplCWwOAz7CwlUwGT5rxizJNtwKtqly/odXNNcxeLE/4MQKpenColMaU3qtXsKp4vh7cwg==
X-Received: by 2002:a17:90b:3886:b0:227:252c:7d26 with SMTP id
 mu6-20020a17090b388600b00227252c7d26mr6464028pjb.8.1673517622733; 
 Thu, 12 Jan 2023 02:00:22 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a17090a3ccd00b00219025945dcsm12095450pjd.19.2023.01.12.02.00.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 02:00:22 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, devel@daynix.com,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH 29/31] tests/qtest/libqos/igb: Transform to igb tests
Date: Thu, 12 Jan 2023 18:57:41 +0900
Message-Id: <20230112095743.20123-30-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230112095743.20123-1-akihiko.odaki@daynix.com>
References: <20230112095743.20123-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62a;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 tests/qtest/fuzz/generic_fuzz_configs.h |   5 +
 tests/qtest/igb-test.c                  |  67 ++++++------
 tests/qtest/libqos/igb.c                | 139 +++++++++---------------
 tests/qtest/libqos/meson.build          |   1 +
 tests/qtest/meson.build                 |   1 +
 5 files changed, 90 insertions(+), 123 deletions(-)

diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
index a825b78c14..50689da653 100644
--- a/tests/qtest/fuzz/generic_fuzz_configs.h
+++ b/tests/qtest/fuzz/generic_fuzz_configs.h
@@ -90,6 +90,11 @@ const generic_fuzz_config predefined_configs[] = {
         .args = "-M q35 -nodefaults "
         "-device e1000e,netdev=net0 -netdev user,id=net0",
         .objects = "e1000e",
+    },{
+        .name = "igb",
+        .args = "-M q35 -nodefaults "
+        "-device igb,netdev=net0 -netdev user,id=net0",
+        .objects = "igb",
     },{
         .name = "cirrus-vga",
         .args = "-machine q35 -nodefaults -device cirrus-vga",
diff --git a/tests/qtest/igb-test.c b/tests/qtest/igb-test.c
index 98706355e3..17d408f02a 100644
--- a/tests/qtest/igb-test.c
+++ b/tests/qtest/igb-test.c
@@ -1,10 +1,12 @@
 /*
- * QTest testcase for e1000e NIC
+ * QTest testcase for igb NIC
  *
+ * Copyright (c) 2022-2023 Red Hat, Inc.
  * Copyright (c) 2015 Ravello Systems LTD (http://ravellosystems.com)
  * Developed by Daynix Computing LTD (http://www.daynix.com)
  *
  * Authors:
+ * Akihiko Odaki <akihiko.odaki@daynix.com>
  * Dmitry Fleytman <dmitry@daynix.com>
  * Leonid Bloch <leonid@daynix.com>
  * Yan Vugenfirer <yan@daynix.com>
@@ -34,16 +36,16 @@
 #include "qemu/bitops.h"
 #include "libqos/libqos-malloc.h"
 #include "libqos/e1000e.h"
-#include "hw/net/e1000_regs.h"
+#include "hw/net/igb_regs.h"
 
 static const struct eth_header test = {
     .h_dest = E1000E_ADDRESS,
     .h_source = E1000E_ADDRESS,
 };
 
-static void e1000e_send_verify(QE1000E *d, int *test_sockets, QGuestAllocator *alloc)
+static void igb_send_verify(QE1000E *d, int *test_sockets, QGuestAllocator *alloc)
 {
-    struct e1000_tx_desc descr;
+    union e1000_adv_tx_desc descr;
     char buffer[64];
     int ret;
     uint32_t recv_len;
@@ -54,12 +56,11 @@ static void e1000e_send_verify(QE1000E *d, int *test_sockets, QGuestAllocator *a
 
     /* Prepare TX descriptor */
     memset(&descr, 0, sizeof(descr));
-    descr.buffer_addr = cpu_to_le64(data);
-    descr.lower.data = cpu_to_le32(E1000_TXD_CMD_RS   |
-                                   E1000_TXD_CMD_EOP  |
-                                   E1000_TXD_CMD_DEXT |
-                                   E1000_TXD_DTYP_D   |
-                                   sizeof(buffer));
+    descr.read.buffer_addr = cpu_to_le64(data);
+    descr.read.cmd_type_len = cpu_to_le32(E1000_TXD_CMD_RS   |
+                                          E1000_TXD_CMD_EOP  |
+                                          E1000_TXD_DTYP_D   |
+                                          sizeof(buffer));
 
     /* Put descriptor to the ring */
     e1000e_tx_ring_push(d, &descr);
@@ -68,7 +69,7 @@ static void e1000e_send_verify(QE1000E *d, int *test_sockets, QGuestAllocator *a
     e1000e_wait_isr(d, E1000E_TX0_MSG_ID);
 
     /* Check DD bit */
-    g_assert_cmphex(le32_to_cpu(descr.upper.data) & E1000_TXD_STAT_DD, ==,
+    g_assert_cmphex(le32_to_cpu(descr.wb.status) & E1000_TXD_STAT_DD, ==,
                     E1000_TXD_STAT_DD);
 
     /* Check data sent to the backend */
@@ -82,9 +83,9 @@ static void e1000e_send_verify(QE1000E *d, int *test_sockets, QGuestAllocator *a
     guest_free(alloc, data);
 }
 
-static void e1000e_receive_verify(QE1000E *d, int *test_sockets, QGuestAllocator *alloc)
+static void igb_receive_verify(QE1000E *d, int *test_sockets, QGuestAllocator *alloc)
 {
-    union e1000_rx_desc_extended descr;
+    union e1000_adv_rx_desc descr;
 
     struct eth_header test_iov = test;
     int len = htonl(sizeof(test));
@@ -110,7 +111,7 @@ static void e1000e_receive_verify(QE1000E *d, int *test_sockets, QGuestAllocator
 
     /* Prepare RX descriptor */
     memset(&descr, 0, sizeof(descr));
-    descr.read.buffer_addr = cpu_to_le64(data);
+    descr.read.pkt_addr = cpu_to_le64(data);
 
     /* Put descriptor to the ring */
     e1000e_rx_ring_push(d, &descr);
@@ -135,7 +136,7 @@ static void test_e1000e_init(void *obj, void *data, QGuestAllocator * alloc)
     /* init does nothing */
 }
 
-static void test_e1000e_tx(void *obj, void *data, QGuestAllocator * alloc)
+static void test_igb_tx(void *obj, void *data, QGuestAllocator * alloc)
 {
     QE1000E_PCI *e1000e = obj;
     QE1000E *d = &e1000e->e1000e;
@@ -147,10 +148,10 @@ static void test_e1000e_tx(void *obj, void *data, QGuestAllocator * alloc)
         return;
     }
 
-    e1000e_send_verify(d, data, alloc);
+    igb_send_verify(d, data, alloc);
 }
 
-static void test_e1000e_rx(void *obj, void *data, QGuestAllocator * alloc)
+static void test_igb_rx(void *obj, void *data, QGuestAllocator * alloc)
 {
     QE1000E_PCI *e1000e = obj;
     QE1000E *d = &e1000e->e1000e;
@@ -162,11 +163,11 @@ static void test_e1000e_rx(void *obj, void *data, QGuestAllocator * alloc)
         return;
     }
 
-    e1000e_receive_verify(d, data, alloc);
+    igb_receive_verify(d, data, alloc);
 }
 
-static void test_e1000e_multiple_transfers(void *obj, void *data,
-                                           QGuestAllocator *alloc)
+static void test_igb_multiple_transfers(void *obj, void *data,
+                                        QGuestAllocator *alloc)
 {
     static const long iterations = 4 * 1024;
     long i;
@@ -182,13 +183,13 @@ static void test_e1000e_multiple_transfers(void *obj, void *data,
     }
 
     for (i = 0; i < iterations; i++) {
-        e1000e_send_verify(d, data, alloc);
-        e1000e_receive_verify(d, data, alloc);
+        igb_send_verify(d, data, alloc);
+        igb_receive_verify(d, data, alloc);
     }
 
 }
 
-static void test_e1000e_hotplug(void *obj, void *data, QGuestAllocator * alloc)
+static void test_igb_hotplug(void *obj, void *data, QGuestAllocator * alloc)
 {
     QTestState *qts = global_qtest;  /* TODO: get rid of global_qtest here */
     QE1000E_PCI *dev = obj;
@@ -198,8 +199,8 @@ static void test_e1000e_hotplug(void *obj, void *data, QGuestAllocator * alloc)
         return;
     }
 
-    qtest_qmp_device_add(qts, "e1000e", "e1000e_net", "{'addr': '0x06'}");
-    qpci_unplug_acpi_device_test(qts, "e1000e_net", 0x06);
+    qtest_qmp_device_add(qts, "igb", "igb_net", "{'addr': '0x06'}");
+    qpci_unplug_acpi_device_test(qts, "igb_net", 0x06);
 }
 
 static void data_test_clear(void *sockets)
@@ -225,18 +226,18 @@ static void *data_test_init(GString *cmd_line, void *arg)
     return test_sockets;
 }
 
-static void register_e1000e_test(void)
+static void register_igb_test(void)
 {
     QOSGraphTestOptions opts = {
         .before = data_test_init,
     };
 
-    qos_add_test("init", "e1000e", test_e1000e_init, &opts);
-    qos_add_test("tx", "e1000e", test_e1000e_tx, &opts);
-    qos_add_test("rx", "e1000e", test_e1000e_rx, &opts);
-    qos_add_test("multiple_transfers", "e1000e",
-                      test_e1000e_multiple_transfers, &opts);
-    qos_add_test("hotplug", "e1000e", test_e1000e_hotplug, &opts);
+    qos_add_test("init", "igb", test_e1000e_init, &opts);
+    qos_add_test("tx", "igb", test_igb_tx, &opts);
+    qos_add_test("rx", "igb", test_igb_rx, &opts);
+    qos_add_test("multiple_transfers", "igb",
+                 test_igb_multiple_transfers, &opts);
+    qos_add_test("hotplug", "igb", test_igb_hotplug, &opts);
 }
 
-libqos_init(register_e1000e_test);
+libqos_init(register_igb_test);
diff --git a/tests/qtest/libqos/igb.c b/tests/qtest/libqos/igb.c
index 925654c7fd..12fb531bf0 100644
--- a/tests/qtest/libqos/igb.c
+++ b/tests/qtest/libqos/igb.c
@@ -1,6 +1,7 @@
 /*
  * libqos driver framework
  *
+ * Copyright (c) 2022-2023 Red Hat, Inc.
  * Copyright (c) 2018 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>
  *
  * This library is free software; you can redistribute it and/or
@@ -17,7 +18,8 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/net/e1000_regs.h"
+#include "hw/net/igb_regs.h"
+#include "hw/net/mii.h"
 #include "hw/pci/pci_ids.h"
 #include "../libqtest.h"
 #include "pci-pc.h"
@@ -29,47 +31,12 @@
 #include "qgraph.h"
 #include "e1000e.h"
 
-#define E1000E_IVAR_TEST_CFG \
-    (((E1000E_RX0_MSG_ID | E1000_IVAR_INT_ALLOC_VALID) << E1000_IVAR_RXQ0_SHIFT) | \
-     ((E1000E_TX0_MSG_ID | E1000_IVAR_INT_ALLOC_VALID) << E1000_IVAR_TXQ0_SHIFT) | \
-     E1000_IVAR_TX_INT_EVERY_WB)
+#define IGB_IVAR_TEST_CFG \
+    ((E1000E_RX0_MSG_ID | E1000_IVAR_VALID) << (igb_ivar_entry_rx(0) * 8)   | \
+     ((E1000E_TX0_MSG_ID | E1000_IVAR_VALID) << (igb_ivar_entry_tx(0) * 8)))
 
 #define E1000E_RING_LEN (0x1000)
 
-void e1000e_tx_ring_push(QE1000E *d, void *descr)
-{
-    QE1000E_PCI *d_pci = container_of(d, QE1000E_PCI, e1000e);
-    uint32_t tail = e1000e_macreg_read(d, E1000_TDT);
-    uint32_t len = e1000e_macreg_read(d, E1000_TDLEN) / E1000_RING_DESC_LEN;
-
-    qtest_memwrite(d_pci->pci_dev.bus->qts,
-                   d->tx_ring + tail * E1000_RING_DESC_LEN,
-                   descr, E1000_RING_DESC_LEN);
-    e1000e_macreg_write(d, E1000_TDT, (tail + 1) % len);
-
-    /* Read WB data for the packet transmitted */
-    qtest_memread(d_pci->pci_dev.bus->qts,
-                  d->tx_ring + tail * E1000_RING_DESC_LEN,
-                  descr, E1000_RING_DESC_LEN);
-}
-
-void e1000e_rx_ring_push(QE1000E *d, void *descr)
-{
-    QE1000E_PCI *d_pci = container_of(d, QE1000E_PCI, e1000e);
-    uint32_t tail = e1000e_macreg_read(d, E1000_RDT);
-    uint32_t len = e1000e_macreg_read(d, E1000_RDLEN) / E1000_RING_DESC_LEN;
-
-    qtest_memwrite(d_pci->pci_dev.bus->qts,
-                   d->rx_ring + tail * E1000_RING_DESC_LEN,
-                   descr, E1000_RING_DESC_LEN);
-    e1000e_macreg_write(d, E1000_RDT, (tail + 1) % len);
-
-    /* Read WB data for the packet received */
-    qtest_memread(d_pci->pci_dev.bus->qts,
-                  d->rx_ring + tail * E1000_RING_DESC_LEN,
-                  descr, E1000_RING_DESC_LEN);
-}
-
 static void e1000e_foreach_callback(QPCIDevice *dev, int devfn, void *data)
 {
     QPCIDevice *res = data;
@@ -77,21 +44,6 @@ static void e1000e_foreach_callback(QPCIDevice *dev, int devfn, void *data)
     g_free(dev);
 }
 
-void e1000e_wait_isr(QE1000E *d, uint16_t msg_id)
-{
-    QE1000E_PCI *d_pci = container_of(d, QE1000E_PCI, e1000e);
-    guint64 end_time = g_get_monotonic_time() + 5 * G_TIME_SPAN_SECOND;
-
-    do {
-        if (qpci_msix_pending(&d_pci->pci_dev, msg_id)) {
-            return;
-        }
-        qtest_clock_step(d_pci->pci_dev.bus->qts, 10000);
-    } while (g_get_monotonic_time() < end_time);
-
-    g_error("Timeout expired");
-}
-
 static void e1000e_pci_destructor(QOSGraphObject *obj)
 {
     QE1000E_PCI *epci = (QE1000E_PCI *) obj;
@@ -99,8 +51,9 @@ static void e1000e_pci_destructor(QOSGraphObject *obj)
     qpci_msix_disable(&epci->pci_dev);
 }
 
-static void e1000e_pci_start_hw(QOSGraphObject *obj)
+static void igb_pci_start_hw(QOSGraphObject *obj)
 {
+    static const uint8_t address[] = E1000E_ADDRESS;
     QE1000E_PCI *d = (QE1000E_PCI *) obj;
     uint32_t val;
 
@@ -111,58 +64,65 @@ static void e1000e_pci_start_hw(QOSGraphObject *obj)
     val = e1000e_macreg_read(&d->e1000e, E1000_CTRL);
     e1000e_macreg_write(&d->e1000e, E1000_CTRL, val | E1000_CTRL_RST | E1000_CTRL_SLU);
 
+    /* Setup link */
+    e1000e_macreg_write(&d->e1000e, E1000_MDIC,
+                        MII_BMCR_AUTOEN | MII_BMCR_ANRESTART |
+                        (MII_BMCR << E1000_MDIC_REG_SHIFT) |
+                        (1 << E1000_MDIC_PHY_SHIFT) |
+                        E1000_MDIC_OP_WRITE);
+
+    qtest_clock_step(d->pci_dev.bus->qts, 900000000);
+
     /* Enable and configure MSI-X */
     qpci_msix_enable(&d->pci_dev);
-    e1000e_macreg_write(&d->e1000e, E1000_IVAR, E1000E_IVAR_TEST_CFG);
+    e1000e_macreg_write(&d->e1000e, E1000_IVAR0, IGB_IVAR_TEST_CFG);
 
-    /* Check the device status - link and speed */
+    /* Check the device link status */
     val = e1000e_macreg_read(&d->e1000e, E1000_STATUS);
-    g_assert_cmphex(val & (E1000_STATUS_LU | E1000_STATUS_ASDV_1000),
-        ==, E1000_STATUS_LU | E1000_STATUS_ASDV_1000);
+    g_assert_cmphex(val & E1000_STATUS_LU, ==, E1000_STATUS_LU);
 
     /* Initialize TX/RX logic */
     e1000e_macreg_write(&d->e1000e, E1000_RCTL, 0);
     e1000e_macreg_write(&d->e1000e, E1000_TCTL, 0);
 
-    /* Notify the device that the driver is ready */
-    val = e1000e_macreg_read(&d->e1000e, E1000_CTRL_EXT);
-    e1000e_macreg_write(&d->e1000e, E1000_CTRL_EXT,
-        val | E1000_CTRL_EXT_DRV_LOAD);
-
-    e1000e_macreg_write(&d->e1000e, E1000_TDBAL,
+    e1000e_macreg_write(&d->e1000e, E1000_TDBAL(0),
                            (uint32_t) d->e1000e.tx_ring);
-    e1000e_macreg_write(&d->e1000e, E1000_TDBAH,
+    e1000e_macreg_write(&d->e1000e, E1000_TDBAH(0),
                            (uint32_t) (d->e1000e.tx_ring >> 32));
-    e1000e_macreg_write(&d->e1000e, E1000_TDLEN, E1000E_RING_LEN);
-    e1000e_macreg_write(&d->e1000e, E1000_TDT, 0);
-    e1000e_macreg_write(&d->e1000e, E1000_TDH, 0);
+    e1000e_macreg_write(&d->e1000e, E1000_TDLEN(0), E1000E_RING_LEN);
+    e1000e_macreg_write(&d->e1000e, E1000_TDT(0), 0);
+    e1000e_macreg_write(&d->e1000e, E1000_TDH(0), 0);
 
     /* Enable transmit */
     e1000e_macreg_write(&d->e1000e, E1000_TCTL, E1000_TCTL_EN);
 
-    e1000e_macreg_write(&d->e1000e, E1000_RDBAL,
+    e1000e_macreg_write(&d->e1000e, E1000_RDBAL(0),
                            (uint32_t)d->e1000e.rx_ring);
-    e1000e_macreg_write(&d->e1000e, E1000_RDBAH,
+    e1000e_macreg_write(&d->e1000e, E1000_RDBAH(0),
                            (uint32_t)(d->e1000e.rx_ring >> 32));
-    e1000e_macreg_write(&d->e1000e, E1000_RDLEN, E1000E_RING_LEN);
-    e1000e_macreg_write(&d->e1000e, E1000_RDT, 0);
-    e1000e_macreg_write(&d->e1000e, E1000_RDH, 0);
+    e1000e_macreg_write(&d->e1000e, E1000_RDLEN(0), E1000E_RING_LEN);
+    e1000e_macreg_write(&d->e1000e, E1000_RDT(0), 0);
+    e1000e_macreg_write(&d->e1000e, E1000_RDH(0), 0);
+    e1000e_macreg_write(&d->e1000e, E1000_RA,
+                        le32_to_cpu(*(uint32_t *)address));
+    e1000e_macreg_write(&d->e1000e, E1000_RA + 4,
+                        E1000_RAH_AV | E1000_RAH_POOL_1 |
+                        le16_to_cpu(*(uint16_t *)(address + 4)));
 
     /* Enable receive */
     e1000e_macreg_write(&d->e1000e, E1000_RFCTL, E1000_RFCTL_EXTEN);
-    e1000e_macreg_write(&d->e1000e, E1000_RCTL, E1000_RCTL_EN  |
-                                        E1000_RCTL_UPE |
-                                        E1000_RCTL_MPE);
+    e1000e_macreg_write(&d->e1000e, E1000_RCTL, E1000_RCTL_EN);
 
     /* Enable all interrupts */
-    e1000e_macreg_write(&d->e1000e, E1000_IMS, 0xFFFFFFFF);
+    e1000e_macreg_write(&d->e1000e, E1000_IMS,  0xFFFFFFFF);
+    e1000e_macreg_write(&d->e1000e, E1000_EIMS, 0xFFFFFFFF);
 
 }
 
-static void *e1000e_pci_get_driver(void *obj, const char *interface)
+static void *igb_pci_get_driver(void *obj, const char *interface)
 {
     QE1000E_PCI *epci = obj;
-    if (!g_strcmp0(interface, "e1000e-if")) {
+    if (!g_strcmp0(interface, "igb-if")) {
         return &epci->e1000e;
     }
 
@@ -171,12 +131,11 @@ static void *e1000e_pci_get_driver(void *obj, const char *interface)
         return &epci->pci_dev;
     }
 
-    fprintf(stderr, "%s not present in e1000e\n", interface);
+    fprintf(stderr, "%s not present in igb\n", interface);
     g_assert_not_reached();
 }
 
-static void *e1000e_pci_create(void *pci_bus, QGuestAllocator *alloc,
-                               void *addr)
+static void *igb_pci_create(void *pci_bus, QGuestAllocator *alloc, void *addr)
 {
     QE1000E_PCI *d = g_new0(QE1000E_PCI, 1);
     QPCIBus *bus = pci_bus;
@@ -196,18 +155,18 @@ static void *e1000e_pci_create(void *pci_bus, QGuestAllocator *alloc,
     d->e1000e.rx_ring = guest_alloc(alloc, E1000E_RING_LEN);
     g_assert(d->e1000e.rx_ring != 0);
 
-    d->obj.get_driver = e1000e_pci_get_driver;
-    d->obj.start_hw = e1000e_pci_start_hw;
+    d->obj.get_driver = igb_pci_get_driver;
+    d->obj.start_hw = igb_pci_start_hw;
     d->obj.destructor = e1000e_pci_destructor;
 
     return &d->obj;
 }
 
-static void e1000e_register_nodes(void)
+static void igb_register_nodes(void)
 {
     QPCIAddress addr = {
         .vendor_id = PCI_VENDOR_ID_INTEL,
-        .device_id = E1000_DEV_ID_82574L,
+        .device_id = E1000_DEV_ID_82576,
     };
 
     /*
@@ -219,8 +178,8 @@ static void e1000e_register_nodes(void)
     };
     add_qpci_address(&opts, &addr);
 
-    qos_node_create_driver("e1000e", e1000e_pci_create);
-    qos_node_consumes("e1000e", "pci-bus", &opts);
+    qos_node_create_driver("igb", igb_pci_create);
+    qos_node_consumes("igb", "pci-bus", &opts);
 }
 
-libqos_init(e1000e_register_nodes);
+libqos_init(igb_register_nodes);
diff --git a/tests/qtest/libqos/meson.build b/tests/qtest/libqos/meson.build
index 32f028872c..cc209a8de5 100644
--- a/tests/qtest/libqos/meson.build
+++ b/tests/qtest/libqos/meson.build
@@ -30,6 +30,7 @@ libqos_srcs = files(
         'i2c.c',
         'i2c-imx.c',
         'i2c-omap.c',
+        'igb.c',
         'sdhci.c',
         'tpci200.c',
         'virtio.c',
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index f0ebb5fac6..10279ed3bf 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -256,6 +256,7 @@ qos_test_ss.add(
   'virtio-serial-test.c',
   'virtio-iommu-test.c',
   'vmxnet3-test.c',
+  'igb-test.c',
 )
 if config_host.has_key('CONFIG_POSIX')
   qos_test_ss.add(files('e1000e-test.c'))
-- 
2.39.0


