Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4BC666F5C
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 11:17:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFuNl-0004e5-AJ; Thu, 12 Jan 2023 05:00:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pFuNh-0004b9-Km
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:00:21 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pFuNf-0004qr-0Y
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:00:21 -0500
Received: by mail-pj1-x102f.google.com with SMTP id bj3so15434619pjb.0
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 02:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nbAqWHYsE2WNDeLqk4LR69ABhm4wHQXmsFp8BzaSNYo=;
 b=FU/yQDUhMUbkSYb40yvbwHTF33SeV2Q0lld3U0xjw5uZmX9PsO3AEY8IFtSKDANsZO
 UL+oQuPmVceaUHwpUG4JoTHb6hQrzMCYzv9RFyuoXKF5mjXuJrIPDRcspeIj3cPPE6Xg
 fOspTXx54jk4hp6MVveyNPV7/GNr3VDdZQ6BnQPpq0MyTMFcTPgQS8incWl9EqUlHu4l
 YzxONZp2sgZ+MqzGBn99fVjxvRq0rQjHC8Armokk2VEKGAiWTKagl1YsSuD6j5q5QcUJ
 dmgOUvo/oVOnwV2xHoAdYKasjpFsuZXKx+neOlzKKvKrDchm0pkqB1FOBKPvFJc1VCKg
 kctA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nbAqWHYsE2WNDeLqk4LR69ABhm4wHQXmsFp8BzaSNYo=;
 b=5ZSNRCnhZw+aLTfPO+scQMDKYeoeCR4gBNIA+1VtvxbWLZ1F49uZ9+ZEwyrxGjFZfl
 3SLbI0m6YZf4Oa0KqykViZclHchXJ2meIO09craUBCyYpDWR/WouwZDYHk3HcuOpamDB
 cAJzgnAGTPDAbT2F/Ub69R5LrW/pHe1JnQQ71FcyZD2AWQn9G6rYIoj4SAiF3IXoh1gE
 3X2giIPmWCB+Spx7LlyQ165ARp1JeBR3T3617GABZchcbqcvMyc16SVNGQCkzU2Ti/uH
 gh270OusOjkddCeVknqYBwyzxqEK3tfnB8PQomgvvSgCsFWQjEQOruxmzkP6CdxPRpyi
 j+6w==
X-Gm-Message-State: AFqh2kpSM33Ic0ZvIih00W2hIJI8Mm7M0guXW5xSD93/6tpam7K4QchW
 JFlcmA2UArqp6mkLjWj/r25vzw==
X-Google-Smtp-Source: AMrXdXuXD88GtOZjxFShDmTJxGYunDYZdAyKqeUUr0XXjPZFd6yCGB+R93vygSSgTkX4iQ6wdYZFXQ==
X-Received: by 2002:a17:90a:4282:b0:223:f131:3604 with SMTP id
 p2-20020a17090a428200b00223f1313604mr78890458pjg.17.1673517617619; 
 Thu, 12 Jan 2023 02:00:17 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a17090a3ccd00b00219025945dcsm12095450pjd.19.2023.01.12.02.00.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 02:00:17 -0800 (PST)
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
Subject: [PATCH 28/31] tests/qtest/libqos/igb: Copy e1000e code
Date: Thu, 12 Jan 2023 18:57:40 +0900
Message-Id: <20230112095743.20123-29-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230112095743.20123-1-akihiko.odaki@daynix.com>
References: <20230112095743.20123-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102f.google.com
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

Start off igb test implementation by copying e1000e code first as igb
resembles e1000e.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 MAINTAINERS              |   2 +
 tests/qtest/igb-test.c   | 242 +++++++++++++++++++++++++++++++++++++++
 tests/qtest/libqos/igb.c | 226 ++++++++++++++++++++++++++++++++++++
 3 files changed, 470 insertions(+)
 create mode 100644 tests/qtest/igb-test.c
 create mode 100644 tests/qtest/libqos/igb.c

diff --git a/MAINTAINERS b/MAINTAINERS
index a3b2f67f66..d4a3b4f6db 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2212,6 +2212,8 @@ igb
 M: Akihiko Odaki <akihiko.odaki@daynix.com>
 S: Maintained
 F: hw/net/igb*
+F: tests/qtest/igb-test.c
+F: tests/qtest/libqos/igb.c
 
 eepro100
 M: Stefan Weil <sw@weilnetz.de>
diff --git a/tests/qtest/igb-test.c b/tests/qtest/igb-test.c
new file mode 100644
index 0000000000..98706355e3
--- /dev/null
+++ b/tests/qtest/igb-test.c
@@ -0,0 +1,242 @@
+/*
+ * QTest testcase for e1000e NIC
+ *
+ * Copyright (c) 2015 Ravello Systems LTD (http://ravellosystems.com)
+ * Developed by Daynix Computing LTD (http://www.daynix.com)
+ *
+ * Authors:
+ * Dmitry Fleytman <dmitry@daynix.com>
+ * Leonid Bloch <leonid@daynix.com>
+ * Yan Vugenfirer <yan@daynix.com>
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+
+#include "qemu/osdep.h"
+#include "libqtest-single.h"
+#include "libqos/pci-pc.h"
+#include "net/eth.h"
+#include "qemu/sockets.h"
+#include "qemu/iov.h"
+#include "qemu/module.h"
+#include "qemu/bitops.h"
+#include "libqos/libqos-malloc.h"
+#include "libqos/e1000e.h"
+#include "hw/net/e1000_regs.h"
+
+static const struct eth_header test = {
+    .h_dest = E1000E_ADDRESS,
+    .h_source = E1000E_ADDRESS,
+};
+
+static void e1000e_send_verify(QE1000E *d, int *test_sockets, QGuestAllocator *alloc)
+{
+    struct e1000_tx_desc descr;
+    char buffer[64];
+    int ret;
+    uint32_t recv_len;
+
+    /* Prepare test data buffer */
+    uint64_t data = guest_alloc(alloc, sizeof(buffer));
+    memwrite(data, &test, sizeof(test));
+
+    /* Prepare TX descriptor */
+    memset(&descr, 0, sizeof(descr));
+    descr.buffer_addr = cpu_to_le64(data);
+    descr.lower.data = cpu_to_le32(E1000_TXD_CMD_RS   |
+                                   E1000_TXD_CMD_EOP  |
+                                   E1000_TXD_CMD_DEXT |
+                                   E1000_TXD_DTYP_D   |
+                                   sizeof(buffer));
+
+    /* Put descriptor to the ring */
+    e1000e_tx_ring_push(d, &descr);
+
+    /* Wait for TX WB interrupt */
+    e1000e_wait_isr(d, E1000E_TX0_MSG_ID);
+
+    /* Check DD bit */
+    g_assert_cmphex(le32_to_cpu(descr.upper.data) & E1000_TXD_STAT_DD, ==,
+                    E1000_TXD_STAT_DD);
+
+    /* Check data sent to the backend */
+    ret = recv(test_sockets[0], &recv_len, sizeof(recv_len), 0);
+    g_assert_cmpint(ret, == , sizeof(recv_len));
+    ret = recv(test_sockets[0], buffer, sizeof(buffer), 0);
+    g_assert_cmpint(ret, ==, sizeof(buffer));
+    g_assert_false(memcmp(buffer, &test, sizeof(test)));
+
+    /* Free test data buffer */
+    guest_free(alloc, data);
+}
+
+static void e1000e_receive_verify(QE1000E *d, int *test_sockets, QGuestAllocator *alloc)
+{
+    union e1000_rx_desc_extended descr;
+
+    struct eth_header test_iov = test;
+    int len = htonl(sizeof(test));
+    struct iovec iov[] = {
+        {
+            .iov_base = &len,
+            .iov_len = sizeof(len),
+        },{
+            .iov_base = &test_iov,
+            .iov_len = sizeof(test),
+        },
+    };
+
+    char buffer[64];
+    int ret;
+
+    /* Send a dummy packet to device's socket*/
+    ret = iov_send(test_sockets[0], iov, 2, 0, sizeof(len) + sizeof(test));
+    g_assert_cmpint(ret, == , sizeof(test) + sizeof(len));
+
+    /* Prepare test data buffer */
+    uint64_t data = guest_alloc(alloc, sizeof(buffer));
+
+    /* Prepare RX descriptor */
+    memset(&descr, 0, sizeof(descr));
+    descr.read.buffer_addr = cpu_to_le64(data);
+
+    /* Put descriptor to the ring */
+    e1000e_rx_ring_push(d, &descr);
+
+    /* Wait for TX WB interrupt */
+    e1000e_wait_isr(d, E1000E_RX0_MSG_ID);
+
+    /* Check DD bit */
+    g_assert_cmphex(le32_to_cpu(descr.wb.upper.status_error) &
+        E1000_RXD_STAT_DD, ==, E1000_RXD_STAT_DD);
+
+    /* Check data sent to the backend */
+    memread(data, buffer, sizeof(buffer));
+    g_assert_false(memcmp(buffer, &test, sizeof(test)));
+
+    /* Free test data buffer */
+    guest_free(alloc, data);
+}
+
+static void test_e1000e_init(void *obj, void *data, QGuestAllocator * alloc)
+{
+    /* init does nothing */
+}
+
+static void test_e1000e_tx(void *obj, void *data, QGuestAllocator * alloc)
+{
+    QE1000E_PCI *e1000e = obj;
+    QE1000E *d = &e1000e->e1000e;
+    QOSGraphObject *e_object = obj;
+    QPCIDevice *dev = e_object->get_driver(e_object, "pci-device");
+
+    /* FIXME: add spapr support */
+    if (qpci_check_buggy_msi(dev)) {
+        return;
+    }
+
+    e1000e_send_verify(d, data, alloc);
+}
+
+static void test_e1000e_rx(void *obj, void *data, QGuestAllocator * alloc)
+{
+    QE1000E_PCI *e1000e = obj;
+    QE1000E *d = &e1000e->e1000e;
+    QOSGraphObject *e_object = obj;
+    QPCIDevice *dev = e_object->get_driver(e_object, "pci-device");
+
+    /* FIXME: add spapr support */
+    if (qpci_check_buggy_msi(dev)) {
+        return;
+    }
+
+    e1000e_receive_verify(d, data, alloc);
+}
+
+static void test_e1000e_multiple_transfers(void *obj, void *data,
+                                           QGuestAllocator *alloc)
+{
+    static const long iterations = 4 * 1024;
+    long i;
+
+    QE1000E_PCI *e1000e = obj;
+    QE1000E *d = &e1000e->e1000e;
+    QOSGraphObject *e_object = obj;
+    QPCIDevice *dev = e_object->get_driver(e_object, "pci-device");
+
+    /* FIXME: add spapr support */
+    if (qpci_check_buggy_msi(dev)) {
+        return;
+    }
+
+    for (i = 0; i < iterations; i++) {
+        e1000e_send_verify(d, data, alloc);
+        e1000e_receive_verify(d, data, alloc);
+    }
+
+}
+
+static void test_e1000e_hotplug(void *obj, void *data, QGuestAllocator * alloc)
+{
+    QTestState *qts = global_qtest;  /* TODO: get rid of global_qtest here */
+    QE1000E_PCI *dev = obj;
+
+    if (dev->pci_dev.bus->not_hotpluggable) {
+        g_test_skip("pci bus does not support hotplug");
+        return;
+    }
+
+    qtest_qmp_device_add(qts, "e1000e", "e1000e_net", "{'addr': '0x06'}");
+    qpci_unplug_acpi_device_test(qts, "e1000e_net", 0x06);
+}
+
+static void data_test_clear(void *sockets)
+{
+    int *test_sockets = sockets;
+
+    close(test_sockets[0]);
+    qos_invalidate_command_line();
+    close(test_sockets[1]);
+    g_free(test_sockets);
+}
+
+static void *data_test_init(GString *cmd_line, void *arg)
+{
+    int *test_sockets = g_new(int, 2);
+    int ret = socketpair(PF_UNIX, SOCK_STREAM, 0, test_sockets);
+    g_assert_cmpint(ret, != , -1);
+
+    g_string_append_printf(cmd_line, " -netdev socket,fd=%d,id=hs0 ",
+                           test_sockets[1]);
+
+    g_test_queue_destroy(data_test_clear, test_sockets);
+    return test_sockets;
+}
+
+static void register_e1000e_test(void)
+{
+    QOSGraphTestOptions opts = {
+        .before = data_test_init,
+    };
+
+    qos_add_test("init", "e1000e", test_e1000e_init, &opts);
+    qos_add_test("tx", "e1000e", test_e1000e_tx, &opts);
+    qos_add_test("rx", "e1000e", test_e1000e_rx, &opts);
+    qos_add_test("multiple_transfers", "e1000e",
+                      test_e1000e_multiple_transfers, &opts);
+    qos_add_test("hotplug", "e1000e", test_e1000e_hotplug, &opts);
+}
+
+libqos_init(register_e1000e_test);
diff --git a/tests/qtest/libqos/igb.c b/tests/qtest/libqos/igb.c
new file mode 100644
index 0000000000..925654c7fd
--- /dev/null
+++ b/tests/qtest/libqos/igb.c
@@ -0,0 +1,226 @@
+/*
+ * libqos driver framework
+ *
+ * Copyright (c) 2018 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License version 2.1 as published by the Free Software Foundation.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>
+ */
+
+#include "qemu/osdep.h"
+#include "hw/net/e1000_regs.h"
+#include "hw/pci/pci_ids.h"
+#include "../libqtest.h"
+#include "pci-pc.h"
+#include "qemu/sockets.h"
+#include "qemu/iov.h"
+#include "qemu/module.h"
+#include "qemu/bitops.h"
+#include "libqos-malloc.h"
+#include "qgraph.h"
+#include "e1000e.h"
+
+#define E1000E_IVAR_TEST_CFG \
+    (((E1000E_RX0_MSG_ID | E1000_IVAR_INT_ALLOC_VALID) << E1000_IVAR_RXQ0_SHIFT) | \
+     ((E1000E_TX0_MSG_ID | E1000_IVAR_INT_ALLOC_VALID) << E1000_IVAR_TXQ0_SHIFT) | \
+     E1000_IVAR_TX_INT_EVERY_WB)
+
+#define E1000E_RING_LEN (0x1000)
+
+void e1000e_tx_ring_push(QE1000E *d, void *descr)
+{
+    QE1000E_PCI *d_pci = container_of(d, QE1000E_PCI, e1000e);
+    uint32_t tail = e1000e_macreg_read(d, E1000_TDT);
+    uint32_t len = e1000e_macreg_read(d, E1000_TDLEN) / E1000_RING_DESC_LEN;
+
+    qtest_memwrite(d_pci->pci_dev.bus->qts,
+                   d->tx_ring + tail * E1000_RING_DESC_LEN,
+                   descr, E1000_RING_DESC_LEN);
+    e1000e_macreg_write(d, E1000_TDT, (tail + 1) % len);
+
+    /* Read WB data for the packet transmitted */
+    qtest_memread(d_pci->pci_dev.bus->qts,
+                  d->tx_ring + tail * E1000_RING_DESC_LEN,
+                  descr, E1000_RING_DESC_LEN);
+}
+
+void e1000e_rx_ring_push(QE1000E *d, void *descr)
+{
+    QE1000E_PCI *d_pci = container_of(d, QE1000E_PCI, e1000e);
+    uint32_t tail = e1000e_macreg_read(d, E1000_RDT);
+    uint32_t len = e1000e_macreg_read(d, E1000_RDLEN) / E1000_RING_DESC_LEN;
+
+    qtest_memwrite(d_pci->pci_dev.bus->qts,
+                   d->rx_ring + tail * E1000_RING_DESC_LEN,
+                   descr, E1000_RING_DESC_LEN);
+    e1000e_macreg_write(d, E1000_RDT, (tail + 1) % len);
+
+    /* Read WB data for the packet received */
+    qtest_memread(d_pci->pci_dev.bus->qts,
+                  d->rx_ring + tail * E1000_RING_DESC_LEN,
+                  descr, E1000_RING_DESC_LEN);
+}
+
+static void e1000e_foreach_callback(QPCIDevice *dev, int devfn, void *data)
+{
+    QPCIDevice *res = data;
+    memcpy(res, dev, sizeof(QPCIDevice));
+    g_free(dev);
+}
+
+void e1000e_wait_isr(QE1000E *d, uint16_t msg_id)
+{
+    QE1000E_PCI *d_pci = container_of(d, QE1000E_PCI, e1000e);
+    guint64 end_time = g_get_monotonic_time() + 5 * G_TIME_SPAN_SECOND;
+
+    do {
+        if (qpci_msix_pending(&d_pci->pci_dev, msg_id)) {
+            return;
+        }
+        qtest_clock_step(d_pci->pci_dev.bus->qts, 10000);
+    } while (g_get_monotonic_time() < end_time);
+
+    g_error("Timeout expired");
+}
+
+static void e1000e_pci_destructor(QOSGraphObject *obj)
+{
+    QE1000E_PCI *epci = (QE1000E_PCI *) obj;
+    qpci_iounmap(&epci->pci_dev, epci->mac_regs);
+    qpci_msix_disable(&epci->pci_dev);
+}
+
+static void e1000e_pci_start_hw(QOSGraphObject *obj)
+{
+    QE1000E_PCI *d = (QE1000E_PCI *) obj;
+    uint32_t val;
+
+    /* Enable the device */
+    qpci_device_enable(&d->pci_dev);
+
+    /* Reset the device */
+    val = e1000e_macreg_read(&d->e1000e, E1000_CTRL);
+    e1000e_macreg_write(&d->e1000e, E1000_CTRL, val | E1000_CTRL_RST | E1000_CTRL_SLU);
+
+    /* Enable and configure MSI-X */
+    qpci_msix_enable(&d->pci_dev);
+    e1000e_macreg_write(&d->e1000e, E1000_IVAR, E1000E_IVAR_TEST_CFG);
+
+    /* Check the device status - link and speed */
+    val = e1000e_macreg_read(&d->e1000e, E1000_STATUS);
+    g_assert_cmphex(val & (E1000_STATUS_LU | E1000_STATUS_ASDV_1000),
+        ==, E1000_STATUS_LU | E1000_STATUS_ASDV_1000);
+
+    /* Initialize TX/RX logic */
+    e1000e_macreg_write(&d->e1000e, E1000_RCTL, 0);
+    e1000e_macreg_write(&d->e1000e, E1000_TCTL, 0);
+
+    /* Notify the device that the driver is ready */
+    val = e1000e_macreg_read(&d->e1000e, E1000_CTRL_EXT);
+    e1000e_macreg_write(&d->e1000e, E1000_CTRL_EXT,
+        val | E1000_CTRL_EXT_DRV_LOAD);
+
+    e1000e_macreg_write(&d->e1000e, E1000_TDBAL,
+                           (uint32_t) d->e1000e.tx_ring);
+    e1000e_macreg_write(&d->e1000e, E1000_TDBAH,
+                           (uint32_t) (d->e1000e.tx_ring >> 32));
+    e1000e_macreg_write(&d->e1000e, E1000_TDLEN, E1000E_RING_LEN);
+    e1000e_macreg_write(&d->e1000e, E1000_TDT, 0);
+    e1000e_macreg_write(&d->e1000e, E1000_TDH, 0);
+
+    /* Enable transmit */
+    e1000e_macreg_write(&d->e1000e, E1000_TCTL, E1000_TCTL_EN);
+
+    e1000e_macreg_write(&d->e1000e, E1000_RDBAL,
+                           (uint32_t)d->e1000e.rx_ring);
+    e1000e_macreg_write(&d->e1000e, E1000_RDBAH,
+                           (uint32_t)(d->e1000e.rx_ring >> 32));
+    e1000e_macreg_write(&d->e1000e, E1000_RDLEN, E1000E_RING_LEN);
+    e1000e_macreg_write(&d->e1000e, E1000_RDT, 0);
+    e1000e_macreg_write(&d->e1000e, E1000_RDH, 0);
+
+    /* Enable receive */
+    e1000e_macreg_write(&d->e1000e, E1000_RFCTL, E1000_RFCTL_EXTEN);
+    e1000e_macreg_write(&d->e1000e, E1000_RCTL, E1000_RCTL_EN  |
+                                        E1000_RCTL_UPE |
+                                        E1000_RCTL_MPE);
+
+    /* Enable all interrupts */
+    e1000e_macreg_write(&d->e1000e, E1000_IMS, 0xFFFFFFFF);
+
+}
+
+static void *e1000e_pci_get_driver(void *obj, const char *interface)
+{
+    QE1000E_PCI *epci = obj;
+    if (!g_strcmp0(interface, "e1000e-if")) {
+        return &epci->e1000e;
+    }
+
+    /* implicit contains */
+    if (!g_strcmp0(interface, "pci-device")) {
+        return &epci->pci_dev;
+    }
+
+    fprintf(stderr, "%s not present in e1000e\n", interface);
+    g_assert_not_reached();
+}
+
+static void *e1000e_pci_create(void *pci_bus, QGuestAllocator *alloc,
+                               void *addr)
+{
+    QE1000E_PCI *d = g_new0(QE1000E_PCI, 1);
+    QPCIBus *bus = pci_bus;
+    QPCIAddress *address = addr;
+
+    qpci_device_foreach(bus, address->vendor_id, address->device_id,
+                        e1000e_foreach_callback, &d->pci_dev);
+
+    /* Map BAR0 (mac registers) */
+    d->mac_regs = qpci_iomap(&d->pci_dev, 0, NULL);
+
+    /* Allocate and setup TX ring */
+    d->e1000e.tx_ring = guest_alloc(alloc, E1000E_RING_LEN);
+    g_assert(d->e1000e.tx_ring != 0);
+
+    /* Allocate and setup RX ring */
+    d->e1000e.rx_ring = guest_alloc(alloc, E1000E_RING_LEN);
+    g_assert(d->e1000e.rx_ring != 0);
+
+    d->obj.get_driver = e1000e_pci_get_driver;
+    d->obj.start_hw = e1000e_pci_start_hw;
+    d->obj.destructor = e1000e_pci_destructor;
+
+    return &d->obj;
+}
+
+static void e1000e_register_nodes(void)
+{
+    QPCIAddress addr = {
+        .vendor_id = PCI_VENDOR_ID_INTEL,
+        .device_id = E1000_DEV_ID_82574L,
+    };
+
+    /*
+     * FIXME: every test using this node needs to setup a -netdev socket,id=hs0
+     * otherwise QEMU is not going to start
+     */
+    QOSGraphEdgeOptions opts = {
+        .extra_device_opts = "netdev=hs0",
+    };
+    add_qpci_address(&opts, &addr);
+
+    qos_node_create_driver("e1000e", e1000e_pci_create);
+    qos_node_consumes("e1000e", "pci-bus", &opts);
+}
+
+libqos_init(e1000e_register_nodes);
-- 
2.39.0


