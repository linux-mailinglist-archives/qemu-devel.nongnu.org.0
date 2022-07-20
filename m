Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 786E957B488
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 12:28:51 +0200 (CEST)
Received: from localhost ([::1]:47472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE6wi-00035o-Ro
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 06:28:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1oE6uG-0007wO-RT
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 06:26:17 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:55628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1oE6uB-0007YX-Lu
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 06:26:14 -0400
Received: from vla1-81430ab5870b.qloud-c.yandex.net
 (vla1-81430ab5870b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:35a1:0:640:8143:ab5])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 752A02E0A45;
 Wed, 20 Jul 2022 13:25:57 +0300 (MSK)
Received: from rvkaganb.yandex.net (unknown
 [2a02:6b8:0:419:7359:4dc3:71d:4c5a])
 by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 SPmgQ0mpgF-PtOmtwQi; Wed, 20 Jul 2022 10:25:56 +0000
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1658312756; bh=0xwIij2C4K+R6ZF9JM/0wD9HM+ziiiBPNtw1z2U7fKc=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=SHapc4xgClKFwxb3JExtT9oyYh76MWeLHg7CT2fZj/4OV/6o4AuKvyzi4MeBP2vpx
 Hb6Nt+IP/Fs7Kla+/d0/YgoX9Q8+egvfJCbIAbBOM5SyWn0mXUFr3pTdxu98U0Dqud
 8iTkf38WoPWPboUH8WVZphIkolW0v27fUgJf0Itc=
Authentication-Results: vla1-81430ab5870b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Roman Kagan <rvkagan@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, yc-core@yandex-team.ru,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v3] hw/pci/pci_bridge: ensure PCIe slots have only one slot
Date: Wed, 20 Jul 2022 13:25:55 +0300
Message-Id: <20220720102555.874394-1-rvkagan@yandex-team.ru>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1a2d::193;
 envelope-from=rvkagan@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

It's possible to create non-working configurations by attaching a device
to a derivative of PCIe slot (pcie-root-port, ioh3420, etc) and
specifying a slot number other that zero, e.g.:

    -device pcie-root-port,id=s0,... \
    -device virtio-blk-pci,bus=s0,addr=4,...

Make QEMU reject such configurations and only allow addr=0 on the
secondary bus of a PCIe slot.

To verify this new behavior, add two basic qtests for the PCIe bridges
that may be affected by change: pcie-root-port and x3130.  For the
former, two testcases are included, one positive for slot #0 and one
negative for (arbitrary) slot #4; for the latter, only a positive
testcase for slot #4 is included.

Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
---
v2 -> v3:
- do not use qtest-single stuff [Thomas]

v1 -> v2:
- use object_dynamic_cast (without assert) [Vladimir]
- add explaining comment [Michael]
- add tests

 hw/pci/pci_bridge.c               |  6 +++
 tests/qtest/pcie-root-port-test.c | 75 +++++++++++++++++++++++++++++++
 tests/qtest/xio3130-test.c        | 52 +++++++++++++++++++++
 tests/qtest/meson.build           |  2 +
 4 files changed, 135 insertions(+)
 create mode 100644 tests/qtest/pcie-root-port-test.c
 create mode 100644 tests/qtest/xio3130-test.c

diff --git a/hw/pci/pci_bridge.c b/hw/pci/pci_bridge.c
index da34c8ebcd..23e1701d06 100644
--- a/hw/pci/pci_bridge.c
+++ b/hw/pci/pci_bridge.c
@@ -33,6 +33,7 @@
 #include "qemu/units.h"
 #include "hw/pci/pci_bridge.h"
 #include "hw/pci/pci_bus.h"
+#include "hw/pci/pcie_port.h"
 #include "qemu/module.h"
 #include "qemu/range.h"
 #include "qapi/error.h"
@@ -386,6 +387,11 @@ void pci_bridge_initfn(PCIDevice *dev, const char *typename)
     br->windows = pci_bridge_region_init(br);
     QLIST_INIT(&sec_bus->child);
     QLIST_INSERT_HEAD(&parent->child, sec_bus, sibling);
+
+    /* PCIe slot derivatives are bridges with a single slot; enforce that */
+    if (object_dynamic_cast(OBJECT(dev), TYPE_PCIE_SLOT)) {
+        sec_bus->slot_reserved_mask = ~1u;
+    }
 }
 
 /* default qdev clean up function for PCI-to-PCI bridge */
diff --git a/tests/qtest/pcie-root-port-test.c b/tests/qtest/pcie-root-port-test.c
new file mode 100644
index 0000000000..c462f03fda
--- /dev/null
+++ b/tests/qtest/pcie-root-port-test.c
@@ -0,0 +1,75 @@
+/*
+ * QTest testcase for generic PCIe root port
+ *
+ * Copyright (c) 2022 Yandex N.V.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "libqtest.h"
+
+/*
+ * Let QEMU choose the bus and slot for the device under test.  It may even be
+ * a non-PCIe bus but it's ok for the purpose of the test.
+ */
+static const char *common_args = "-device pcie-root-port,id=s0"
+                                 ",port=1,chassis=1,multifunction=on";
+
+static void test_slot0(void)
+{
+    QTestState *qts;
+    QDict *resp;
+
+    /* attach a PCIe device into slot0 of the root port */
+    qts = qtest_init(common_args);
+    /* PCIe root port is known to be supported, use it as a leaf device too */
+    resp = qtest_qmp(qts, "{'execute': 'device_add', 'arguments': {"
+                     "'driver': 'pcie-root-port', "
+                     "'id': 'port1', "
+                     "'bus': 's0', "
+                     "'chassis': 5, "
+                     "'addr': '0'"
+                     "} }");
+    g_assert_nonnull(resp);
+    g_assert(!qdict_haskey(resp, "event"));
+    g_assert(!qdict_haskey(resp, "error"));
+    qobject_unref(resp);
+
+    qtest_quit(qts);
+}
+
+static void test_slot4(void)
+{
+    QTestState *qts;
+    QDict *resp;
+
+    /* attach a PCIe device into slot4 of the root port should be rejected */
+    qts = qtest_init(common_args);
+    /* PCIe root port is known to be supported, use it as a leaf device too */
+    resp = qtest_qmp(qts, "{'execute': 'device_add', 'arguments': {"
+                     "'driver': 'pcie-root-port', "
+                     "'id': 'port1', "
+                     "'bus': 's0', "
+                     "'chassis': 5, "
+                     "'addr': '4'"
+                     "} }");
+    qmp_expect_error_and_unref(resp, "GenericError");
+
+    qtest_quit(qts);
+}
+
+int main(int argc, char **argv)
+{
+    int ret;
+
+    g_test_init(&argc, &argv, NULL);
+
+    qtest_add_func("/pcie-root-port/slot0", test_slot0);
+    qtest_add_func("/pcie-root-port/slot4", test_slot4);
+
+    ret = g_test_run();
+
+    return ret;
+}
diff --git a/tests/qtest/xio3130-test.c b/tests/qtest/xio3130-test.c
new file mode 100644
index 0000000000..8306da4aea
--- /dev/null
+++ b/tests/qtest/xio3130-test.c
@@ -0,0 +1,52 @@
+/*
+ * QTest testcase for TI X3130 PCIe switch
+ *
+ * Copyright (c) 2022 Yandex N.V.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "libqtest.h"
+
+/*
+ * Let QEMU choose the bus and slot for the device under test.  It may even be
+ * a non-PCIe bus but it's ok for the purpose of the test.
+ */
+static const char *common_args = "-device x3130-upstream,id=s0";
+
+static void test_slot4(void)
+{
+    QTestState *qts;
+    QDict *resp;
+
+    /* attach a downstream port into slot4 of the upstream port */
+    qts = qtest_init(common_args);
+    resp = qtest_qmp(qts, "{'execute': 'device_add', 'arguments': {"
+                     "'driver': 'xio3130-downstream', "
+                     "'id': 'port1', "
+                     "'bus': 's0', "
+                     "'chassis': 5, "
+                     "'addr': '4'"
+                     "} }");
+    g_assert_nonnull(resp);
+    g_assert(!qdict_haskey(resp, "event"));
+    g_assert(!qdict_haskey(resp, "error"));
+    qobject_unref(resp);
+
+    qtest_quit(qts);
+}
+
+int main(int argc, char **argv)
+{
+    int ret;
+
+    g_test_init(&argc, &argv, NULL);
+
+    qtest_add_func("/pcie-root-port/slot4", test_slot4);
+
+    ret = g_test_run();
+
+    return ret;
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 31287a9173..19cab1bc35 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -54,6 +54,7 @@ qtests_i386 = \
   (config_all_devices.has_key('CONFIG_I82801B11') ? ['i82801b11-test'] : []) +             \
   (config_all_devices.has_key('CONFIG_IOH3420') ? ['ioh3420-test'] : []) +                  \
   (config_all_devices.has_key('CONFIG_LPC_ICH9') ? ['lpc-ich9-test'] : []) +              \
+  (config_all_devices.has_key('CONFIG_PCIE_PORT') ? ['pcie-root-port-test'] : []) +         \
   (config_all_devices.has_key('CONFIG_USB_UHCI') ? ['usb-hcd-uhci-test'] : []) +            \
   (config_all_devices.has_key('CONFIG_USB_UHCI') and                                        \
    config_all_devices.has_key('CONFIG_USB_EHCI') ? ['usb-hcd-ehci-test'] : []) +            \
@@ -63,6 +64,7 @@ qtests_i386 = \
   (config_all_devices.has_key('CONFIG_TPM_TIS_ISA') ? ['tpm-tis-test'] : []) +              \
   (config_all_devices.has_key('CONFIG_TPM_TIS_ISA') ? ['tpm-tis-swtpm-test'] : []) +        \
   (config_all_devices.has_key('CONFIG_RTL8139_PCI') ? ['rtl8139-test'] : []) +              \
+  (config_all_devices.has_key('CONFIG_XIO3130') ? ['xio3130-test'] : []) +                  \
   (config_all_devices.has_key('CONFIG_E1000E_PCI_EXPRESS') ? ['fuzz-e1000e-test'] : []) +   \
   (config_all_devices.has_key('CONFIG_MEGASAS_SCSI_PCI') ? ['fuzz-megasas-test'] : []) +    \
   (config_all_devices.has_key('CONFIG_LSI_SCSI_PCI') ? ['fuzz-lsi53c895a-test'] : []) +     \
-- 
2.36.1


