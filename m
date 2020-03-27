Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9369195B14
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Mar 2020 17:29:34 +0100 (CET)
Received: from localhost ([::1]:44160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHrrR-0004Bf-K7
	for lists+qemu-devel@lfdr.de; Fri, 27 Mar 2020 12:29:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42437)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liq3ea@163.com>) id 1jHrqE-0003iw-Ek
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 12:28:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <liq3ea@163.com>) id 1jHrqA-0007mQ-Em
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 12:28:15 -0400
Received: from m12-11.163.com ([220.181.12.11]:55806)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <liq3ea@163.com>) id 1jHrq8-0006eU-Jn
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 12:28:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=Aoh9M8PIytTEynGlfU
 LDMXmI1griONF7C7l3NKr6Jzk=; b=ZAW0I8Vq8CY6hciCuL0d+ZtugYkYWk501F
 oaGxmVPOyByHFREwpHlJBUXxUard3L6YrytZQmCh9f/vxoeTMJdXjNWXn4dEkBYI
 JU0TnO2UPuyh/soDeZFH35iSxtC8rCRYMu8O/7y0lPUCgbGC8o6tJhm6gWPXGNCx
 MMFAIQW7k=
Received: from ubuntu.localdomain (unknown [183.159.64.111])
 by smtp7 (Coremail) with SMTP id C8CowACXme3DJX5eQrFqBg--.31568S4;
 Sat, 28 Mar 2020 00:11:48 +0800 (CST)
From: Li Qiang <liq3ea@163.com>
To: thuth@redhat.com, lvivier@redhat.com, pbonzini@redhat.com,
 jasowang@redhat.com
Subject: [PATCH] qtest: add tulip test case
Date: Fri, 27 Mar 2020 09:11:46 -0700
Message-Id: <20200327161146.16402-1-liq3ea@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: C8CowACXme3DJX5eQrFqBg--.31568S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxCr4DAr1rCr45Cr17ZF15CFg_yoWrXw4UpF
 yUA3s09r48AF13Xrnak3W7JFy5Ga93uw1UCFy3Xr18uFZ8J3srKwn7Kr9F9Fn5uFWkXF15
 Aw1ktF1fGF18tF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UBv3nUUUUU=
X-Originating-IP: [183.159.64.111]
X-CM-SenderInfo: 5oltjvrd6rljoofrz/1tbiFATzbVaD4+gv1gAAsp
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 220.181.12.11
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Li Qiang <liq3ea@163.com>, liq3ea@gmail.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The tulip networking card emulation has an OOB issue in
'tulip_copy_tx_buffers' when the guest provide malformed descriptor.
This test will trigger a ASAN heap overflow crash.

Signed-off-by: Li Qiang <liq3ea@163.com>
---
 tests/qtest/Makefile.include |  1 +
 tests/qtest/tulip-test.c     | 91 ++++++++++++++++++++++++++++++++++++
 2 files changed, 92 insertions(+)
 create mode 100644 tests/qtest/tulip-test.c

diff --git a/tests/qtest/Makefile.include b/tests/qtest/Makefile.include
index 10a28de8a3..9e5a51d033 100644
--- a/tests/qtest/Makefile.include
+++ b/tests/qtest/Makefile.include
@@ -217,6 +217,7 @@ qos-test-obj-y += tests/qtest/es1370-test.o
 qos-test-obj-y += tests/qtest/ipoctal232-test.o
 qos-test-obj-y += tests/qtest/megasas-test.o
 qos-test-obj-y += tests/qtest/ne2000-test.o
+qos-test-obj-y += tests/qtest/tulip-test.o
 qos-test-obj-y += tests/qtest/nvme-test.o
 qos-test-obj-y += tests/qtest/pca9552-test.o
 qos-test-obj-y += tests/qtest/pci-test.o
diff --git a/tests/qtest/tulip-test.c b/tests/qtest/tulip-test.c
new file mode 100644
index 0000000000..d91ddfd765
--- /dev/null
+++ b/tests/qtest/tulip-test.c
@@ -0,0 +1,91 @@
+/*
+ * QTest testcase for DEC/Intel Tulip 21143
+ *
+ * Copyright (c) 2020 Li Qiang <liq3ea@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "libqtest.h"
+#include "qemu/module.h"
+#include "libqos/qgraph.h"
+#include "libqos/pci.h"
+#include "qemu/bitops.h"
+#include "hw/net/tulip.h"
+
+typedef struct QTulip_pci QTulip_pci;
+
+struct QTulip_pci {
+    QOSGraphObject obj;
+    QPCIDevice dev;
+};
+
+static void *tulip_pci_get_driver(void *obj, const char *interface)
+{
+    QTulip_pci *tulip_pci = obj;
+
+    if (!g_strcmp0(interface, "pci-device")) {
+        return &tulip_pci->dev;
+    }
+
+    fprintf(stderr, "%s not present in tulip_pci\n", interface);
+    g_assert_not_reached();
+}
+
+static void *tulip_pci_create(void *pci_bus, QGuestAllocator *alloc, void *addr)
+{
+    QTulip_pci *tulip_pci = g_new0(QTulip_pci, 1);
+    QPCIBus *bus = pci_bus;
+
+    qpci_device_init(&tulip_pci->dev, bus, addr);
+    tulip_pci->obj.get_driver = tulip_pci_get_driver;
+
+    return &tulip_pci->obj;
+}
+
+static void tulip_large_tx(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QTulip_pci *tulip_pci = obj;
+    QPCIDevice *dev = &tulip_pci->dev;
+    QPCIBar bar;
+    struct tulip_descriptor context;
+    char guest_data[4096];
+    uint64_t context_pa;
+    uint64_t guest_pa;
+
+    qpci_device_enable(dev);
+    bar = qpci_iomap(dev, 0, NULL);
+    context_pa = guest_alloc(alloc, sizeof(context));
+    guest_pa = guest_alloc(alloc, 4096);
+    memset(guest_data, 'A', sizeof(guest_data));
+    context.status = TDES0_OWN;
+    context.control = TDES1_BUF2_SIZE_MASK << TDES1_BUF2_SIZE_SHIFT |
+                      TDES1_BUF1_SIZE_MASK << TDES1_BUF1_SIZE_SHIFT;
+    context.buf_addr2 = context_pa + sizeof(struct tulip_descriptor);
+    context.buf_addr1 = guest_pa;
+
+    qtest_memwrite(dev->bus->qts, context_pa, &context, sizeof(context));
+    qtest_memwrite(dev->bus->qts, guest_pa, guest_data, sizeof(guest_data));
+    qpci_io_writel(dev, bar, 0x20, context_pa);
+    qpci_io_writel(dev, bar, 0x30, 1 << 13);
+    guest_free(alloc, context_pa);
+    guest_free(alloc, guest_pa);
+}
+
+static void tulip_register_nodes(void)
+{
+    QOSGraphEdgeOptions opts = {
+        .extra_device_opts = "addr=04.0",
+    };
+    add_qpci_address(&opts, &(QPCIAddress) { .devfn = QPCI_DEVFN(4, 0) });
+
+    qos_node_create_driver("tulip", tulip_pci_create);
+    qos_node_consumes("tulip", "pci-bus", &opts);
+    qos_node_produces("tulip", "pci-device");
+
+    qos_add_test("tulip_large_tx", "tulip", tulip_large_tx, NULL);
+}
+
+libqos_init(tulip_register_nodes);
-- 
2.17.1



