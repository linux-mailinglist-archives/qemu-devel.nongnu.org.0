Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B316A06BE
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 11:52:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV9Cf-0007b2-4s; Thu, 23 Feb 2023 05:51:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV9CY-0007QQ-4c
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:51:51 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV9CV-0003j6-Kh
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:51:49 -0500
Received: by mail-pl1-x62c.google.com with SMTP id i3so1861666plg.6
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 02:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oxU/A0aIZnOQvXFNRoKjHMNKf95YgL1aGXtC3+llRhs=;
 b=3v7GZOz2QzZiuId9idlHEMt4WX26/XLPelk10zHugyfJeD617/qaDWQtUMjzK+qC+x
 sjKZsc3nDD70UrhFNW+M+wlOd7jT1ZrQfemzaQAhoLPJ2jKobSxYxAxc4hXQXQJRdWQI
 jyv0j4orXle48KLfR2YEQXK1nmUf0ZQzCM1KtM53IgMZkxlG0l9Dw4vT/96MA+7H/wKm
 vp5SmCVKiULkmNDHbKIOfboOHmPCb+dWj4FBGivrDGU48cVpNiEEEqy71OZnWk7T7dJa
 1hyR9EHPMgNM7B4hjdS717JtkMNiU7F64YXKySeY2gdxa9X9vR9gVR7uEetVdaiXlNAH
 JdRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oxU/A0aIZnOQvXFNRoKjHMNKf95YgL1aGXtC3+llRhs=;
 b=tywVMl8vxWFjIca7rVjdJbwyLHqNdxkxd9BNMsHCkGQZfK9O2CGGgiELPUxrxzLXd1
 QQ3JFwTvSfYqKhMVKX/ofNe7SGpjb9z3aoyoHaj5VA4KmXvyu22/HLUV+n0/64mYBbpn
 +eUERi2yFlk1K7AzHadl0l1OQWhUSmyNuomdxw+1/3+siwR4GLziePT5uxLH6Jro9j/5
 P+ALLAOZ1NEmIrVhQ7PA+MMUCm3GCce/3nT1oByl945ZJwFIRyYtkusBz/VQvMCeNhXP
 heahVtju327pxapi6eoTbm9j1cOiYgFnrF6hLFgsi7iQAPM7RNLosJdMABvjf/MXlQLH
 e6HQ==
X-Gm-Message-State: AO0yUKVpkOiSHTBMl1aRzuTw+NuBIAWefPy5FRkqDUfUFrnDvvFdrpYY
 ezg9Q25OGg5/pwiyJyUWBerokkZkRBev47M7
X-Google-Smtp-Source: AK7set/IkNibTq3awHZc8sFKRo1if5zQcu0j/PY6XyNHeZYOVRDJlzRM74GNXsDfqQDrPdxSq/Kleg==
X-Received: by 2002:a05:6a20:8f05:b0:b9:7a47:bca5 with SMTP id
 b5-20020a056a208f0500b000b97a47bca5mr13466132pzk.43.1677149506872; 
 Thu, 23 Feb 2023 02:51:46 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 k184-20020a6384c1000000b004fb26a80875sm4477692pgd.22.2023.02.23.02.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 02:51:45 -0800 (PST)
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
Subject: [PATCH v9 7/9] igb: Introduce qtest for igb device
Date: Thu, 23 Feb 2023 19:50:55 +0900
Message-Id: <20230223105057.144309-8-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223105057.144309-1-akihiko.odaki@daynix.com>
References: <20230223105057.144309-1-akihiko.odaki@daynix.com>
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
index 11af257e04..446283d5bc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2229,6 +2229,8 @@ igb
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
index 29a4efb4c2..c6dd19bb89 100644
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
2.39.1


