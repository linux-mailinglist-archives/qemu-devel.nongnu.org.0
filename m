Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2F05B9BBD
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 15:21:01 +0200 (CEST)
Received: from localhost ([::1]:52484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYona-0004Eu-N4
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 09:20:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.labiuk@virtuozzo.com>)
 id 1oYohY-0007uX-2g
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 09:14:47 -0400
Received: from relay.virtuozzo.com ([130.117.225.111]:51271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.labiuk@virtuozzo.com>)
 id 1oYohT-0002u1-Re
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 09:14:42 -0400
Received: from [192.168.16.215] (helo=mikewrk.sw.ru)
 by relay.virtuozzo.com with esmtp (Exim 4.95)
 (envelope-from <michael.labiuk@virtuozzo.com>) id 1oYoes-004BPT-5H;
 Thu, 15 Sep 2022 15:14:10 +0200
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, den@virtuozzo.com
Subject: [PATCH v3 3/5] tests/x86: Add 'q35' machine type to drive_del-test
Date: Thu, 15 Sep 2022 16:14:05 +0300
Message-Id: <20220915131407.372485-4-michael.labiuk@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220915131407.372485-1-michael.labiuk@virtuozzo.com>
References: <20220915131407.372485-1-michael.labiuk@virtuozzo.com>
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

Configure pci bridge setting
Also run tests on 'q35' machine type.
Signed-off-by: Michael Labiuk <michael.labiuk@virtuozzo.com>
---
 tests/qtest/drive_del-test.c | 111 +++++++++++++++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/tests/qtest/drive_del-test.c b/tests/qtest/drive_del-test.c
index 5e6d58b4dd..3a2ddecf22 100644
--- a/tests/qtest/drive_del-test.c
+++ b/tests/qtest/drive_del-test.c
@@ -258,6 +258,27 @@ static void test_cli_device_del(void)
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
@@ -294,6 +315,45 @@ static void test_device_add_and_del(void)
     qtest_quit(qts);
 }
 
+static void device_add_q35(QTestState *qts)
+{
+    QDict *response;
+    char driver[32];
+    snprintf(driver, sizeof(driver), "virtio-blk-%s",
+             qvirtio_get_dev_type());
+
+    response = qtest_qmp(qts, "{'execute': 'device_add',"
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
@@ -318,6 +378,25 @@ static void test_drive_add_device_add_and_del(void)
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
@@ -342,8 +421,29 @@ static void test_blockdev_add_device_add_and_del(void)
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
+     * blockdev_add/device_add and device_del.  The it drive is used by a
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
+    const char *arch = qtest_get_arch();
+
     g_test_init(&argc, &argv, NULL);
 
     qtest_add_func("/drive_del/without-dev", test_drive_without_dev);
@@ -363,6 +463,17 @@ int main(int argc, char **argv)
                        test_empty_device_del);
         qtest_add_func("/device_del/blockdev",
                        test_blockdev_add_device_add_and_del);
+
+        if (!strcmp(arch, "x86_64")) {
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


