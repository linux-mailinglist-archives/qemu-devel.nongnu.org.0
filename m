Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 282385F00D5
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 00:42:52 +0200 (CEST)
Received: from localhost ([::1]:52642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oe2F1-00006G-6c
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 18:42:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.labiuk@virtuozzo.com>)
 id 1oe28o-00066B-9B
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 18:36:26 -0400
Received: from relay.virtuozzo.com ([130.117.225.111]:42746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.labiuk@virtuozzo.com>)
 id 1oe28j-0001xc-IV
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 18:36:25 -0400
Received: from [192.168.16.158] (helo=mikewrk.sw.ru)
 by relay.virtuozzo.com with esmtp (Exim 4.95)
 (envelope-from <michael.labiuk@virtuozzo.com>) id 1oe25k-0071e8-OK;
 Fri, 30 Sep 2022 00:35:41 +0200
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, den@virtuozzo.com
Subject: [PATCH v5 8/9] tests/x86: Add 'q35' machine type to drive_del-test
Date: Fri, 30 Sep 2022 01:35:46 +0300
Message-Id: <20220929223547.1429580-9-michael.labiuk@virtuozzo.com>
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

Configure pci bridge setting to run tests on 'q35' machine type.

Signed-off-by: Michael Labiuk <michael.labiuk@virtuozzo.com>
---
 tests/qtest/drive_del-test.c | 107 +++++++++++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/tests/qtest/drive_del-test.c b/tests/qtest/drive_del-test.c
index 106c613f4f..9a750395a9 100644
--- a/tests/qtest/drive_del-test.c
+++ b/tests/qtest/drive_del-test.c
@@ -252,6 +252,27 @@ static void test_cli_device_del(void)
     qtest_quit(qts);
 }
 
+static void test_cli_device_del_q35(void)
+{
+    QTestState *qts;
+
+    /*
+     * -drive/-device and device_del.  Start with a drive used by a
+     * device that unplugs after reset.
+     */
+    qts = qtest_initf("-drive if=none,id=drive0,file=null-co://,"
+                      "file.read-zeroes=on,format=raw "
+                      "-machine q35 -device pcie-root-port,id=p1 "
+                      "-device pcie-pci-bridge,bus=p1,id=b1 "
+                      "-device virtio-blk-%s,drive=drive0,bus=b1,id=dev0",
+                      qvirtio_get_dev_type());
+
+    device_del(qts, true);
+    g_assert(!has_drive(qts));
+
+    qtest_quit(qts);
+}
+
 static void test_empty_device_del(void)
 {
     QTestState *qts;
@@ -288,6 +309,43 @@ static void test_device_add_and_del(void)
     qtest_quit(qts);
 }
 
+static void device_add_q35(QTestState *qts)
+{
+    g_autofree char *driver = g_strdup_printf("virtio-blk-%s",
+                                              qvirtio_get_dev_type());
+    QDict *response =
+               qtest_qmp(qts, "{'execute': 'device_add',"
+                              " 'arguments': {"
+                              "   'driver': %s,"
+                              "   'drive': 'drive0',"
+                              "   'id': 'dev0',"
+                              "   'bus': 'b1'"
+                              "}}", driver);
+    g_assert(response);
+    g_assert(qdict_haskey(response, "return"));
+    qobject_unref(response);
+}
+
+static void test_device_add_and_del_q35(void)
+{
+    QTestState *qts;
+
+    /*
+     * -drive/device_add and device_del.  Start with a drive used by a
+     * device that unplugs after reset.
+     */
+    qts = qtest_initf("-machine q35 -device pcie-root-port,id=p1 "
+                     "-device pcie-pci-bridge,bus=p1,id=b1 "
+                     "-drive if=none,id=drive0,file=null-co://,"
+                     "file.read-zeroes=on,format=raw");
+
+    device_add_q35(qts);
+    device_del(qts, true);
+    g_assert(!has_drive(qts));
+
+    qtest_quit(qts);
+}
+
 static void test_drive_add_device_add_and_del(void)
 {
     QTestState *qts;
@@ -312,6 +370,25 @@ static void test_drive_add_device_add_and_del(void)
     qtest_quit(qts);
 }
 
+static void test_drive_add_device_add_and_del_q35(void)
+{
+    QTestState *qts;
+
+    qts = qtest_init("-machine q35 -device pcie-root-port,id=p1 "
+                     "-device pcie-pci-bridge,bus=p1,id=b1");
+
+    /*
+     * drive_add/device_add and device_del.  The drive is used by a
+     * device that unplugs after reset.
+     */
+    drive_add_with_media(qts);
+    device_add_q35(qts);
+    device_del(qts, true);
+    g_assert(!has_drive(qts));
+
+    qtest_quit(qts);
+}
+
 static void test_blockdev_add_device_add_and_del(void)
 {
     QTestState *qts;
@@ -336,6 +413,25 @@ static void test_blockdev_add_device_add_and_del(void)
     qtest_quit(qts);
 }
 
+static void test_blockdev_add_device_add_and_del_q35(void)
+{
+    QTestState *qts;
+
+    qts = qtest_init("-machine q35 -device pcie-root-port,id=p1 "
+                     "-device pcie-pci-bridge,bus=p1,id=b1");
+
+    /*
+     * blockdev_add/device_add and device_del. The drive is used by a
+     * device that unplugs after reset, but it doesn't go away.
+     */
+    blockdev_add_with_media(qts);
+    device_add_q35(qts);
+    device_del(qts, true);
+    g_assert(has_blockdev(qts));
+
+    qtest_quit(qts);
+}
+
 int main(int argc, char **argv)
 {
     g_test_init(&argc, &argv, NULL);
@@ -357,6 +453,17 @@ int main(int argc, char **argv)
                        test_empty_device_del);
         qtest_add_func("/device_del/blockdev",
                        test_blockdev_add_device_add_and_del);
+
+        if (qtest_has_machine("q35")) {
+            qtest_add_func("/device_del/drive/cli_device_q35",
+                           test_cli_device_del_q35);
+            qtest_add_func("/device_del/drive/device_add_q35",
+                           test_device_add_and_del_q35);
+            qtest_add_func("/device_del/drive/drive_add_device_add_q35",
+                           test_drive_add_device_add_and_del_q35);
+            qtest_add_func("/device_del/blockdev_q35",
+                           test_blockdev_add_device_add_and_del_q35);
+        }
     }
 
     return g_test_run();
-- 
2.34.1


