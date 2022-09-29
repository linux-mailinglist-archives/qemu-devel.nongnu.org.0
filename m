Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D21D5F00D4
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 00:42:16 +0200 (CEST)
Received: from localhost ([::1]:36464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oe2ER-0007TW-Gp
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 18:42:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.labiuk@virtuozzo.com>)
 id 1oe28o-00065f-3N
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 18:36:26 -0400
Received: from relay.virtuozzo.com ([130.117.225.111]:42752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.labiuk@virtuozzo.com>)
 id 1oe28j-0001xf-N1
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 18:36:25 -0400
Received: from [192.168.16.158] (helo=mikewrk.sw.ru)
 by relay.virtuozzo.com with esmtp (Exim 4.95)
 (envelope-from <michael.labiuk@virtuozzo.com>) id 1oe25g-0071e8-2z;
 Fri, 30 Sep 2022 00:35:36 +0200
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, den@virtuozzo.com
Subject: [PATCH v5 2/9] tests/x86: Add subtest with 'q35' machine type to
 device-plug-test
Date: Fri, 30 Sep 2022 01:35:40 +0300
Message-Id: <20220929223547.1429580-3-michael.labiuk@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220929223547.1429580-1-michael.labiuk@virtuozzo.com>
References: <20220929223547.1429580-1-michael.labiuk@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=130.117.225.111;
 envelope-from=michael.labiuk@virtuozzo.com; helo=relay.virtuozzo.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Michael Labiuk <michael.labiuk@virtuozzo.com>
From:  Michael Labiuk via <qemu-devel@nongnu.org>

Configure pci bridge setting to plug pci device and unplug.

Signed-off-by: Michael Labiuk <michael.labiuk@virtuozzo.com>
---
 tests/qtest/device-plug-test.c | 41 ++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/tests/qtest/device-plug-test.c b/tests/qtest/device-plug-test.c
index 3841de1b8c..3f44f731d1 100644
--- a/tests/qtest/device-plug-test.c
+++ b/tests/qtest/device-plug-test.c
@@ -79,6 +79,19 @@ static void test_pci_unplug_request(void)
     qtest_quit(qtest);
 }
 
+static void test_q35_pci_unplug_request(void)
+{
+
+    QTestState *qtest = qtest_initf("-machine q35 "
+                                    "-device pcie-root-port,id=p1 "
+                                    "-device pcie-pci-bridge,bus=p1,id=b1 "
+                                    "-device virtio-mouse-pci,bus=b1,id=dev0");
+
+    process_device_remove(qtest, "dev0");
+
+    qtest_quit(qtest);
+}
+
 static void test_pci_unplug_json_request(void)
 {
     const char *arch = qtest_get_arch();
@@ -97,6 +110,27 @@ static void test_pci_unplug_json_request(void)
     qtest_quit(qtest);
 }
 
+static void test_q35_pci_unplug_json_request(void)
+{
+    const char *port = "-device '{\"driver\": \"pcie-root-port\", "
+                                      "\"id\": \"p1\"}'";
+
+    const char *bridge = "-device '{\"driver\": \"pcie-pci-bridge\", "
+                                   "\"id\": \"b1\", "
+                                   "\"bus\": \"p1\"}'";
+
+    const char *device = "-device '{\"driver\": \"virtio-mouse-pci\", "
+                                   "\"bus\": \"b1\", "
+                                   "\"id\": \"dev0\"}'";
+
+    QTestState *qtest = qtest_initf("-machine q35 %s %s %s",
+                                    port, bridge, device);
+
+    process_device_remove(qtest, "dev0");
+
+    qtest_quit(qtest);
+}
+
 static void test_ccw_unplug(void)
 {
     QTestState *qtest = qtest_initf("-device virtio-balloon-ccw,id=dev0");
@@ -176,5 +210,12 @@ int main(int argc, char **argv)
                        test_spapr_phb_unplug_request);
     }
 
+    if (!strcmp(arch, "x86_64") && qtest_has_machine("q35")) {
+        qtest_add_func("/device-plug/q35-pci-unplug-request",
+                   test_q35_pci_unplug_request);
+        qtest_add_func("/device-plug/q35-pci-unplug-json-request",
+                   test_q35_pci_unplug_json_request);
+    }
+
     return g_test_run();
 }
-- 
2.34.1


