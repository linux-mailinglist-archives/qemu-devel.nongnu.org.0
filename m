Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEDB68A837
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 05:38:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOAIY-0005mY-Pe; Fri, 03 Feb 2023 23:37:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pOAIX-0005lK-4l
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 23:37:09 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pOAIU-0008NT-JE
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 23:37:08 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 nm12-20020a17090b19cc00b0022c2155cc0bso6720497pjb.4
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 20:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=obGEsF4vUOp82wAWBCF2F6FrpUcB0JzGwYPugPkKWDI=;
 b=fSjhlM1S+ITHf2zYBAo6/QyAc1DuX62If7a9qP3SEMUnPDI5HRFf5pnkNHAtEeAAG6
 O8nJGUbg5a3yCkH/WvI0QIhG1Fqz+KmzQXPc+8fdN9Hgk1zsv6yJT1tv8DV8ju5LVNDG
 uu7DzWHyCiixFIvdQwycKSXW32Y02bJ0sEuJip+XKT8VBd7ti+qdyNLrZtpgEsQbJlbB
 6DJjOZhIcsV2zRNWkocAstVUv+5Y8mdUw6EoagDMi3PTce/sVws1AkxiYzPr4sfiwFif
 Da4hX6w8SwoAMG7IVUod2A7HKj6B0JXVU6hy4YHOH6PVMH8iQqd4G7NZqWFB4bGAxEZD
 OXPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=obGEsF4vUOp82wAWBCF2F6FrpUcB0JzGwYPugPkKWDI=;
 b=AK45qjE1xU7MeqRXADSu6qeMl+zfV0bvkBPyAW8cYt01hat5I7vrI+VaR1t9fQx8oK
 96LFwjYMLkzoFvNH4LlYwi924zbU8y6WAwnIchY5uMe4jFyddFpEE0rEXRSG2iffu/3y
 jaroa2ZhgnrBFhuyFFrjWOSXXlO6L18jo5R2WogJVvfVmgBSiw6cbFOPc7wUVZzN3lCM
 plzcy9xzTREJbZGzMJM/UwCWS+/Qi33sWCps+rTIhlSCWCh6w5MKbulMd/qA6RpsY1Mm
 0zXguLx3k2xWVERP8lktQsHnqUm0yt7tPpwQqpF+oKVYQl4PNxH6/Hmfm4LX4Tmhw+6A
 qQAQ==
X-Gm-Message-State: AO0yUKXhviZGCXqKJP/tI0DrxGzkcbOUZD3/sN/shkGeaSkSoqOLbeXa
 ZSAPwjJXBGb1FFOuewOkR+foRQ==
X-Google-Smtp-Source: AK7set/RTj7bdgCZQBJeLSXQfzi+BG22rRGDlxV0YW8fvrh4f9J5RvQaZpcgaKZj/2cFU/psJdNIow==
X-Received: by 2002:a05:6a20:94c8:b0:bc:d4cf:d647 with SMTP id
 ht8-20020a056a2094c800b000bcd4cfd647mr13564046pzb.6.1675485425861; 
 Fri, 03 Feb 2023 20:37:05 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 g7-20020a17090adb0700b002308f6e7f41sm225707pjv.55.2023.02.03.20.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 20:37:05 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
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
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Gal Hammer <gal.hammer@sap.com>, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v8 6/8] igb: Introduce qtest for igb device
Date: Sat,  4 Feb 2023 13:36:19 +0900
Message-Id: <20230204043621.13540-7-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230204043621.13540-1-akihiko.odaki@daynix.com>
References: <20230204043621.13540-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102f.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This change is derived from qtest for e1000e device.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Acked-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS                             |   2 +
 tests/qtest/fuzz/generic_fuzz_configs.h |   5 +
 tests/qtest/igb-test.c                  | 243 ++++++++++++++++++++++++
 tests/qtest/libqos/igb.c                | 185 ++++++++++++++++++
 tests/qtest/libqos/meson.build          |   1 +
 tests/qtest/meson.build                 |   1 +
 6 files changed, 437 insertions(+)
 create mode 100644 tests/qtest/igb-test.c
 create mode 100644 tests/qtest/libqos/igb.c

diff --git a/MAINTAINERS b/MAINTAINERS
index f9e9638290..127fd92541 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2225,6 +2225,8 @@ igb
 M: Akihiko Odaki <akihiko.odaki@daynix.com>
 S: Maintained
 F: hw/net/igb*
+F: tests/qtest/igb-test.c
+F: tests/qtest/libqos/igb.c
 
 eepro100
 M: Stefan Weil <sw@weilnetz.de>
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
new file mode 100644
index 0000000000..b36ddece75
--- /dev/null
+++ b/tests/qtest/igb-test.c
@@ -0,0 +1,243 @@
+/*
+ * QTest testcase for igb NIC
+ *
+ * Copyright (c) 2022-2023 Red Hat, Inc.
+ * Copyright (c) 2015 Ravello Systems LTD (http://ravellosystems.com)
+ * Developed by Daynix Computing LTD (http://www.daynix.com)
+ *
+ * Authors:
+ * Akihiko Odaki <akihiko.odaki@daynix.com>
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
+#include "hw/net/igb_regs.h"
+
+static const struct eth_header packet = {
+    .h_dest = E1000E_ADDRESS,
+    .h_source = E1000E_ADDRESS,
+};
+
+static void igb_send_verify(QE1000E *d, int *test_sockets, QGuestAllocator *alloc)
+{
+    union e1000_adv_tx_desc descr;
+    char buffer[64];
+    int ret;
+    uint32_t recv_len;
+
+    /* Prepare test data buffer */
+    uint64_t data = guest_alloc(alloc, sizeof(buffer));
+    memwrite(data, &packet, sizeof(packet));
+
+    /* Prepare TX descriptor */
+    memset(&descr, 0, sizeof(descr));
+    descr.read.buffer_addr = cpu_to_le64(data);
+    descr.read.cmd_type_len = cpu_to_le32(E1000_TXD_CMD_RS   |
+                                          E1000_TXD_CMD_EOP  |
+                                          E1000_TXD_DTYP_D   |
+                                          sizeof(buffer));
+
+    /* Put descriptor to the ring */
+    e1000e_tx_ring_push(d, &descr);
+
+    /* Wait for TX WB interrupt */
+    e1000e_wait_isr(d, E1000E_TX0_MSG_ID);
+
+    /* Check DD bit */
+    g_assert_cmphex(le32_to_cpu(descr.wb.status) & E1000_TXD_STAT_DD, ==,
+                    E1000_TXD_STAT_DD);
+
+    /* Check data sent to the backend */
+    ret = recv(test_sockets[0], &recv_len, sizeof(recv_len), 0);
+    g_assert_cmpint(ret, == , sizeof(recv_len));
+    ret = recv(test_sockets[0], buffer, sizeof(buffer), 0);
+    g_assert_cmpint(ret, ==, sizeof(buffer));
+    g_assert_false(memcmp(buffer, &packet, sizeof(packet)));
+
+    /* Free test data buffer */
+    guest_free(alloc, data);
+}
+
+static void igb_receive_verify(QE1000E *d, int *test_sockets, QGuestAllocator *alloc)
+{
+    union e1000_adv_rx_desc descr;
+
+    struct eth_header test_iov = packet;
+    int len = htonl(sizeof(packet));
+    struct iovec iov[] = {
+        {
+            .iov_base = &len,
+            .iov_len = sizeof(len),
+        },{
+            .iov_base = &test_iov,
+            .iov_len = sizeof(packet),
+        },
+    };
+
+    char buffer[64];
+    int ret;
+
+    /* Send a dummy packet to device's socket*/
+    ret = iov_send(test_sockets[0], iov, 2, 0, sizeof(len) + sizeof(packet));
+    g_assert_cmpint(ret, == , sizeof(packet) + sizeof(len));
+
+    /* Prepare test data buffer */
+    uint64_t data = guest_alloc(alloc, sizeof(buffer));
+
+    /* Prepare RX descriptor */
+    memset(&descr, 0, sizeof(descr));
+    descr.read.pkt_addr = cpu_to_le64(data);
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
+    g_assert_false(memcmp(buffer, &packet, sizeof(packet)));
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
+static void test_igb_tx(void *obj, void *data, QGuestAllocator * alloc)
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
+    igb_send_verify(d, data, alloc);
+}
+
+static void test_igb_rx(void *obj, void *data, QGuestAllocator * alloc)
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
+    igb_receive_verify(d, data, alloc);
+}
+
+static void test_igb_multiple_transfers(void *obj, void *data,
+                                        QGuestAllocator *alloc)
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
+        igb_send_verify(d, data, alloc);
+        igb_receive_verify(d, data, alloc);
+    }
+
+}
+
+static void test_igb_hotplug(void *obj, void *data, QGuestAllocator * alloc)
+{
+    QTestState *qts = global_qtest;  /* TODO: get rid of global_qtest here */
+    QE1000E_PCI *dev = obj;
+
+    if (dev->pci_dev.bus->not_hotpluggable) {
+        g_test_skip("pci bus does not support hotplug");
+        return;
+    }
+
+    qtest_qmp_device_add(qts, "igb", "igb_net", "{'addr': '0x06'}");
+    qpci_unplug_acpi_device_test(qts, "igb_net", 0x06);
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
+static void register_igb_test(void)
+{
+    QOSGraphTestOptions opts = {
+        .before = data_test_init,
+    };
+
+    qos_add_test("init", "igb", test_e1000e_init, &opts);
+    qos_add_test("tx", "igb", test_igb_tx, &opts);
+    qos_add_test("rx", "igb", test_igb_rx, &opts);
+    qos_add_test("multiple_transfers", "igb",
+                 test_igb_multiple_transfers, &opts);
+    qos_add_test("hotplug", "igb", test_igb_hotplug, &opts);
+}
+
+libqos_init(register_igb_test);
diff --git a/tests/qtest/libqos/igb.c b/tests/qtest/libqos/igb.c
new file mode 100644
index 0000000000..12fb531bf0
--- /dev/null
+++ b/tests/qtest/libqos/igb.c
@@ -0,0 +1,185 @@
+/*
+ * libqos driver framework
+ *
+ * Copyright (c) 2022-2023 Red Hat, Inc.
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
+#include "hw/net/igb_regs.h"
+#include "hw/net/mii.h"
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
+#define IGB_IVAR_TEST_CFG \
+    ((E1000E_RX0_MSG_ID | E1000_IVAR_VALID) << (igb_ivar_entry_rx(0) * 8)   | \
+     ((E1000E_TX0_MSG_ID | E1000_IVAR_VALID) << (igb_ivar_entry_tx(0) * 8)))
+
+#define E1000E_RING_LEN (0x1000)
+
+static void e1000e_foreach_callback(QPCIDevice *dev, int devfn, void *data)
+{
+    QPCIDevice *res = data;
+    memcpy(res, dev, sizeof(QPCIDevice));
+    g_free(dev);
+}
+
+static void e1000e_pci_destructor(QOSGraphObject *obj)
+{
+    QE1000E_PCI *epci = (QE1000E_PCI *) obj;
+    qpci_iounmap(&epci->pci_dev, epci->mac_regs);
+    qpci_msix_disable(&epci->pci_dev);
+}
+
+static void igb_pci_start_hw(QOSGraphObject *obj)
+{
+    static const uint8_t address[] = E1000E_ADDRESS;
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
+    /* Setup link */
+    e1000e_macreg_write(&d->e1000e, E1000_MDIC,
+                        MII_BMCR_AUTOEN | MII_BMCR_ANRESTART |
+                        (MII_BMCR << E1000_MDIC_REG_SHIFT) |
+                        (1 << E1000_MDIC_PHY_SHIFT) |
+                        E1000_MDIC_OP_WRITE);
+
+    qtest_clock_step(d->pci_dev.bus->qts, 900000000);
+
+    /* Enable and configure MSI-X */
+    qpci_msix_enable(&d->pci_dev);
+    e1000e_macreg_write(&d->e1000e, E1000_IVAR0, IGB_IVAR_TEST_CFG);
+
+    /* Check the device link status */
+    val = e1000e_macreg_read(&d->e1000e, E1000_STATUS);
+    g_assert_cmphex(val & E1000_STATUS_LU, ==, E1000_STATUS_LU);
+
+    /* Initialize TX/RX logic */
+    e1000e_macreg_write(&d->e1000e, E1000_RCTL, 0);
+    e1000e_macreg_write(&d->e1000e, E1000_TCTL, 0);
+
+    e1000e_macreg_write(&d->e1000e, E1000_TDBAL(0),
+                           (uint32_t) d->e1000e.tx_ring);
+    e1000e_macreg_write(&d->e1000e, E1000_TDBAH(0),
+                           (uint32_t) (d->e1000e.tx_ring >> 32));
+    e1000e_macreg_write(&d->e1000e, E1000_TDLEN(0), E1000E_RING_LEN);
+    e1000e_macreg_write(&d->e1000e, E1000_TDT(0), 0);
+    e1000e_macreg_write(&d->e1000e, E1000_TDH(0), 0);
+
+    /* Enable transmit */
+    e1000e_macreg_write(&d->e1000e, E1000_TCTL, E1000_TCTL_EN);
+
+    e1000e_macreg_write(&d->e1000e, E1000_RDBAL(0),
+                           (uint32_t)d->e1000e.rx_ring);
+    e1000e_macreg_write(&d->e1000e, E1000_RDBAH(0),
+                           (uint32_t)(d->e1000e.rx_ring >> 32));
+    e1000e_macreg_write(&d->e1000e, E1000_RDLEN(0), E1000E_RING_LEN);
+    e1000e_macreg_write(&d->e1000e, E1000_RDT(0), 0);
+    e1000e_macreg_write(&d->e1000e, E1000_RDH(0), 0);
+    e1000e_macreg_write(&d->e1000e, E1000_RA,
+                        le32_to_cpu(*(uint32_t *)address));
+    e1000e_macreg_write(&d->e1000e, E1000_RA + 4,
+                        E1000_RAH_AV | E1000_RAH_POOL_1 |
+                        le16_to_cpu(*(uint16_t *)(address + 4)));
+
+    /* Enable receive */
+    e1000e_macreg_write(&d->e1000e, E1000_RFCTL, E1000_RFCTL_EXTEN);
+    e1000e_macreg_write(&d->e1000e, E1000_RCTL, E1000_RCTL_EN);
+
+    /* Enable all interrupts */
+    e1000e_macreg_write(&d->e1000e, E1000_IMS,  0xFFFFFFFF);
+    e1000e_macreg_write(&d->e1000e, E1000_EIMS, 0xFFFFFFFF);
+
+}
+
+static void *igb_pci_get_driver(void *obj, const char *interface)
+{
+    QE1000E_PCI *epci = obj;
+    if (!g_strcmp0(interface, "igb-if")) {
+        return &epci->e1000e;
+    }
+
+    /* implicit contains */
+    if (!g_strcmp0(interface, "pci-device")) {
+        return &epci->pci_dev;
+    }
+
+    fprintf(stderr, "%s not present in igb\n", interface);
+    g_assert_not_reached();
+}
+
+static void *igb_pci_create(void *pci_bus, QGuestAllocator *alloc, void *addr)
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
+    d->obj.get_driver = igb_pci_get_driver;
+    d->obj.start_hw = igb_pci_start_hw;
+    d->obj.destructor = e1000e_pci_destructor;
+
+    return &d->obj;
+}
+
+static void igb_register_nodes(void)
+{
+    QPCIAddress addr = {
+        .vendor_id = PCI_VENDOR_ID_INTEL,
+        .device_id = E1000_DEV_ID_82576,
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
+    qos_node_create_driver("igb", igb_pci_create);
+    qos_node_consumes("igb", "pci-bus", &opts);
+}
+
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
index 1af63f8bd2..611a9f5f4f 100644
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
2.39.1


