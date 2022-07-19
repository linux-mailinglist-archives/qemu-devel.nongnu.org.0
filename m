Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 307E75794FF
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 10:10:16 +0200 (CEST)
Received: from localhost ([::1]:48180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDiJ5-0003yn-9t
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 04:10:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1oDiAr-0002Fy-1Z
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 04:01:45 -0400
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:49020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1oDiAm-0003UW-K5
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 04:01:43 -0400
Received: from vla5-d6d5ce7a4718.qloud-c.yandex.net
 (vla5-d6d5ce7a4718.qloud-c.yandex.net
 [IPv6:2a02:6b8:c18:341e:0:640:d6d5:ce7a])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 99FEF2E0D75;
 Tue, 19 Jul 2022 11:01:25 +0300 (MSK)
Received: from rvkaganb.yandex-team.ru (unknown [2a02:6b8:b081:8012::1:1c])
 by vla5-d6d5ce7a4718.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 jTrgVYP7rQ-1OOuh7MV; Tue, 19 Jul 2022 08:01:24 +0000
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1658217684; bh=NPOrgVUqlkrD0TTtyERGpMyANZPGvgzu/8Ha0spcK+c=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=FvjATYlMkdms+THUK4MDwsqRItNpaDMl8ea1xOTqs9eVfhECCUBjzTEZCzBHSOnu5
 Yq+GfPyPhl3GZ8gPAChJSSnruQpeHujjREP8Zt0yxvtZdwZIQ3KaUXpSGbi8hrnE4o
 00cNM5yRN1DNZVFnEbVtJ7lgW9jn6Jo+4gQPURx8=
Authentication-Results: vla5-d6d5ce7a4718.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Roman Kagan <rvkagan@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 yc-core@yandex-team.ru, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2] hw/pci/pci_bridge: ensure PCIe slots have only one slot
Date: Tue, 19 Jul 2022 11:01:23 +0300
Message-Id: <20220719080123.553981-1-rvkagan@yandex-team.ru>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=77.88.29.217; envelope-from=rvkagan@yandex-team.ru;
 helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
v1 -> v2:
- use object_dynamic_cast (without assert) [Vladimir]
- add explaining comment [Michael]
- add tests
(I've only had a chance to run tests against x86; hope I didn't mess
them up for other arches)

 hw/pci/pci_bridge.c               |  6 +++
 tests/qtest/pcie-root-port-test.c | 77 +++++++++++++++++++++++++++++++
 tests/qtest/xio3130-test.c        | 54 ++++++++++++++++++++++
 tests/qtest/meson.build           |  2 +
 4 files changed, 139 insertions(+)
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
index 0000000000..a1f3d84d75
--- /dev/null
+++ b/tests/qtest/pcie-root-port-test.c
@@ -0,0 +1,77 @@
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
+#include "libqtest-single.h"
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
+    qtest_end();
+
+    return ret;
+}
diff --git a/tests/qtest/xio3130-test.c b/tests/qtest/xio3130-test.c
new file mode 100644
index 0000000000..3a937889b9
--- /dev/null
+++ b/tests/qtest/xio3130-test.c
@@ -0,0 +1,54 @@
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
+#include "libqtest-single.h"
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
+    qtest_add_func("/x3130/slot4", test_slot4);
+
+    ret = g_test_run();
+
+    qtest_end();
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


