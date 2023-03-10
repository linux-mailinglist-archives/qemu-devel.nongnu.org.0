Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8F46B3AD1
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 10:40:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paZBu-0007Oq-Q2; Fri, 10 Mar 2023 04:37:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1paZBp-0006zm-8R
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 04:37:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1paZBm-00005e-67
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 04:37:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678441045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U0l/PySC6onTEs1EDP7hgT2f1UIRIi9FOPzBQcS8KBM=;
 b=FVOwdRCWdOjRg3mc2+wckn/KECkorgkmQUjecTCpXEVXdN+oVIbFmuhxjl7gT6b0tdBmwg
 LJ4goLf/iy49RZ/N4ucm1NTOfnvAQepINB8//jzJYOUgjqUQCVgWFwcKW+BDyHaFge1cEv
 KevZ8E5FloFCN9yUZu6tHoBxuC8C6iQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-AbAqvZB1M1iaynu47JVPoA-1; Fri, 10 Mar 2023 04:37:24 -0500
X-MC-Unique: AbAqvZB1M1iaynu47JVPoA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 156E438041DC;
 Fri, 10 Mar 2023 09:37:24 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-41.pek2.redhat.com [10.72.12.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D242340C1106;
 Fri, 10 Mar 2023 09:37:21 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, Thomas Huth <thuth@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL V2 41/44] igb: Introduce qtest for igb device
Date: Fri, 10 Mar 2023 17:35:23 +0800
Message-Id: <20230310093526.30828-42-jasowang@redhat.com>
In-Reply-To: <20230310093526.30828-1-jasowang@redhat.com>
References: <20230310093526.30828-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Akihiko Odaki <akihiko.odaki@daynix.com>

This change is derived from qtest for e1000e device.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Acked-by: Thomas Huth <thuth@redhat.com>
[Jason: make qtest work for win32 (only hotplug)]
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 MAINTAINERS                             |   2 +
 tests/qtest/fuzz/generic_fuzz_configs.h |   5 +
 tests/qtest/igb-test.c                  | 256 ++++++++++++++++++++++++++++++++
 tests/qtest/libqos/igb.c                | 185 +++++++++++++++++++++++
 tests/qtest/libqos/meson.build          |   1 +
 tests/qtest/meson.build                 |   1 +
 6 files changed, 450 insertions(+)
 create mode 100644 tests/qtest/igb-test.c
 create mode 100644 tests/qtest/libqos/igb.c

diff --git a/MAINTAINERS b/MAINTAINERS
index c4980a4..501dbb2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2253,6 +2253,8 @@ igb
 M: Akihiko Odaki <akihiko.odaki@daynix.com>
 S: Maintained
 F: hw/net/igb*
+F: tests/qtest/igb-test.c
+F: tests/qtest/libqos/igb.c
 
 eepro100
 M: Stefan Weil <sw@weilnetz.de>
diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
index a825b78..50689da 100644
--- a/tests/qtest/fuzz/generic_fuzz_configs.h
+++ b/tests/qtest/fuzz/generic_fuzz_configs.h
@@ -91,6 +91,11 @@ const generic_fuzz_config predefined_configs[] = {
         "-device e1000e,netdev=net0 -netdev user,id=net0",
         .objects = "e1000e",
     },{
+        .name = "igb",
+        .args = "-M q35 -nodefaults "
+        "-device igb,netdev=net0 -netdev user,id=net0",
+        .objects = "igb",
+    },{
         .name = "cirrus-vga",
         .args = "-machine q35 -nodefaults -device cirrus-vga",
         .objects = "cirrus*",
diff --git a/tests/qtest/igb-test.c b/tests/qtest/igb-test.c
new file mode 100644
index 0000000..3d397ea
--- /dev/null
+++ b/tests/qtest/igb-test.c
@@ -0,0 +1,256 @@
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
+#ifndef _WIN32
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
+#endif
+
+static void *data_test_init_no_socket(GString *cmd_line, void *arg)
+{
+    g_string_append(cmd_line, " -netdev hubport,hubid=0,id=hs0 ");
+    return arg;
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
+static void register_igb_test(void)
+{
+    QOSGraphTestOptions opts = { 0 };
+
+#ifndef _WIN32
+    opts.before = data_test_init,
+    qos_add_test("init", "igb", test_e1000e_init, &opts);
+    qos_add_test("tx", "igb", test_igb_tx, &opts);
+    qos_add_test("rx", "igb", test_igb_rx, &opts);
+    qos_add_test("multiple_transfers", "igb",
+                 test_igb_multiple_transfers, &opts);
+#endif
+
+    opts.before = data_test_init_no_socket;
+    qos_add_test("hotplug", "igb", test_igb_hotplug, &opts);
+}
+
+libqos_init(register_igb_test);
diff --git a/tests/qtest/libqos/igb.c b/tests/qtest/libqos/igb.c
new file mode 100644
index 0000000..12fb531
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
index 32f0288..cc209a8 100644
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
index 62eecf2..c9292b6 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -259,6 +259,7 @@ qos_test_ss.add(
   'virtio-scsi-test.c',
   'virtio-iommu-test.c',
   'vmxnet3-test.c',
+  'igb-test.c',
 )
 
 if config_all_devices.has_key('CONFIG_VIRTIO_SERIAL')
-- 
2.7.4


