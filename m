Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A147A5F00E1
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 00:44:59 +0200 (CEST)
Received: from localhost ([::1]:40732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oe2H4-00033F-P6
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 18:44:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.labiuk@virtuozzo.com>)
 id 1oe28p-0006Bl-Us
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 18:36:27 -0400
Received: from relay.virtuozzo.com ([130.117.225.111]:42750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.labiuk@virtuozzo.com>)
 id 1oe28j-0001xh-Fh
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 18:36:27 -0400
Received: from [192.168.16.158] (helo=mikewrk.sw.ru)
 by relay.virtuozzo.com with esmtp (Exim 4.95)
 (envelope-from <michael.labiuk@virtuozzo.com>) id 1oe25f-0071e8-AS;
 Fri, 30 Sep 2022 00:35:36 +0200
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, den@virtuozzo.com
Subject: [PATCH v5 1/9] tests/x86: add helper qtest_qmp_device_del_send()
Date: Fri, 30 Sep 2022 01:35:39 +0300
Message-Id: <20220929223547.1429580-2-michael.labiuk@virtuozzo.com>
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

Move sending 'device_del' command to separate function.
Function can be used in case of addition action is needed to start
actual removing device after sending command.

Signed-off-by: Michael Labiuk <michael.labiuk@virtuozzo.com>
---
 tests/qtest/device-plug-test.c | 15 ++-------------
 tests/qtest/drive_del-test.c   |  6 +-----
 tests/qtest/libqos/pci-pc.c    |  8 +-------
 tests/qtest/libqtest.c         | 16 ++++++++++------
 tests/qtest/libqtest.h         | 10 ++++++++++
 5 files changed, 24 insertions(+), 31 deletions(-)

diff --git a/tests/qtest/device-plug-test.c b/tests/qtest/device-plug-test.c
index e595b45b66..3841de1b8c 100644
--- a/tests/qtest/device-plug-test.c
+++ b/tests/qtest/device-plug-test.c
@@ -15,17 +15,6 @@
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qstring.h"
 
-static void device_del(QTestState *qtest, const char *id)
-{
-    QDict *resp;
-
-    resp = qtest_qmp(qtest,
-                     "{'execute': 'device_del', 'arguments': { 'id': %s } }", id);
-
-    g_assert(qdict_haskey(resp, "return"));
-    qobject_unref(resp);
-}
-
 static void system_reset(QTestState *qtest)
 {
     QDict *resp;
@@ -68,7 +57,7 @@ static void process_device_remove(QTestState *qtest, const char *id)
      * be processed. However during system reset, the removal will be
      * handled, removing the device.
      */
-    device_del(qtest, id);
+    qtest_qmp_device_del_send(qtest, id);
     system_reset(qtest);
     wait_device_deleted_event(qtest, id);
 }
@@ -112,7 +101,7 @@ static void test_ccw_unplug(void)
 {
     QTestState *qtest = qtest_initf("-device virtio-balloon-ccw,id=dev0");
 
-    device_del(qtest, "dev0");
+    qtest_qmp_device_del_send(qtest, "dev0");
     wait_device_deleted_event(qtest, "dev0");
 
     qtest_quit(qtest);
diff --git a/tests/qtest/drive_del-test.c b/tests/qtest/drive_del-test.c
index 5e6d58b4dd..467e752b0d 100644
--- a/tests/qtest/drive_del-test.c
+++ b/tests/qtest/drive_del-test.c
@@ -143,11 +143,7 @@ static void device_del(QTestState *qts, bool and_reset)
 {
     QDict *response;
 
-    response = qtest_qmp(qts, "{'execute': 'device_del',"
-                         " 'arguments': { 'id': 'dev0' } }");
-    g_assert(response);
-    g_assert(qdict_haskey(response, "return"));
-    qobject_unref(response);
+    qtest_qmp_device_del_send(qts, "dev0");
 
     if (and_reset) {
         response = qtest_qmp(qts, "{'execute': 'system_reset' }");
diff --git a/tests/qtest/libqos/pci-pc.c b/tests/qtest/libqos/pci-pc.c
index 81c2c055ca..96046287ac 100644
--- a/tests/qtest/libqos/pci-pc.c
+++ b/tests/qtest/libqos/pci-pc.c
@@ -179,13 +179,7 @@ void qpci_free_pc(QPCIBus *bus)
 
 void qpci_unplug_acpi_device_test(QTestState *qts, const char *id, uint8_t slot)
 {
-    QDict *response;
-
-    response = qtest_qmp(qts, "{'execute': 'device_del',"
-                              " 'arguments': {'id': %s}}", id);
-    g_assert(response);
-    g_assert(!qdict_haskey(response, "error"));
-    qobject_unref(response);
+    qtest_qmp_device_del_send(qts, id);
 
     qtest_outl(qts, ACPI_PCIHP_ADDR + PCI_EJ_BASE, 1 << slot);
 
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 4f4b2d6477..7b6152807b 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -1371,15 +1371,19 @@ void qtest_qmp_add_client(QTestState *qts, const char *protocol, int fd)
  *
  * {"return": {}}
  */
-void qtest_qmp_device_del(QTestState *qts, const char *id)
+void qtest_qmp_device_del_send(QTestState *qts, const char *id)
 {
-    QDict *rsp;
-
-    rsp = qtest_qmp(qts, "{'execute': 'device_del', 'arguments': {'id': %s}}",
-                    id);
-
+    QDict *rsp = qtest_qmp(qts, "{'execute': 'device_del', "
+                                "'arguments': {'id': %s}}", id);
+    g_assert(rsp);
     g_assert(qdict_haskey(rsp, "return"));
+    g_assert(!qdict_haskey(rsp, "error"));
     qobject_unref(rsp);
+}
+
+void qtest_qmp_device_del(QTestState *qts, const char *id)
+{
+    qtest_qmp_device_del_send(qts, id);
     qtest_qmp_eventwait(qts, "DEVICE_DELETED");
 }
 
diff --git a/tests/qtest/libqtest.h b/tests/qtest/libqtest.h
index 3abc75964d..29ea9c697d 100644
--- a/tests/qtest/libqtest.h
+++ b/tests/qtest/libqtest.h
@@ -761,12 +761,22 @@ void qtest_qmp_device_add(QTestState *qts, const char *driver, const char *id,
 void qtest_qmp_add_client(QTestState *qts, const char *protocol, int fd);
 #endif /* _WIN32 */
 
+/**
+ * qtest_qmp_device_del_send:
+ * @qts: QTestState instance to operate on
+ * @id: Identification string
+ *
+ * Generic hot-unplugging test via the device_del QMP command.
+ */
+void qtest_qmp_device_del_send(QTestState *qts, const char *id);
+
 /**
  * qtest_qmp_device_del:
  * @qts: QTestState instance to operate on
  * @id: Identification string
  *
  * Generic hot-unplugging test via the device_del QMP command.
+ * Waiting for command comlition event.
  */
 void qtest_qmp_device_del(QTestState *qts, const char *id);
 
-- 
2.34.1


