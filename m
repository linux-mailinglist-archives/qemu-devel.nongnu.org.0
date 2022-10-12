Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3095FC787
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 16:38:16 +0200 (CEST)
Received: from localhost ([::1]:38586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oicsB-0002Tr-EG
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 10:38:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oicna-00054S-Oh
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 10:33:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oicnW-0006jm-0q
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 10:33:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665585205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/d0rc1UlbYQ0b2OxmfhxJd2FSCVm+ytrjf647l1qxYE=;
 b=GZ3NjZ5M4Vg78l68EEwRJUZatHGK92as0DXNCXzRQSO2MBVomx/2C3VenJ/+oukJyhwkY8
 sr+LPdc6XpWtdyHS3S9xOmrJe8xvipdSEKHV69azrSVL5jjQYFUpGjFIf8P7aHzoWGPIJy
 nK6uxv6y2cAaUk85lMY8BNE8/X4pulU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-381-0hS81VAEPpmp1xrgO16YVQ-1; Wed, 12 Oct 2022 10:33:23 -0400
X-MC-Unique: 0hS81VAEPpmp1xrgO16YVQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2AAF0101AA45;
 Wed, 12 Oct 2022 14:33:23 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.235])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E77C2144B20;
 Wed, 12 Oct 2022 14:33:22 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Michael Labiuk <michael.labiuk@virtuozzo.com>
Subject: [PULL 03/16] tests/x86: add helper qtest_qmp_device_del_send()
Date: Wed, 12 Oct 2022 16:33:03 +0200
Message-Id: <20221012143316.988561-4-thuth@redhat.com>
In-Reply-To: <20221012143316.988561-1-thuth@redhat.com>
References: <20221012143316.988561-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

From: Michael Labiuk <michael.labiuk@virtuozzo.com>

Move sending 'device_del' command to separate function.
Function can be used in case of addition action is needed to start
actual removing device after sending command.

Signed-off-by: Michael Labiuk <michael.labiuk@virtuozzo.com>
Message-Id: <20220929223547.1429580-2-michael.labiuk@virtuozzo.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
[thuth: Fixed typo]
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/libqtest.h         | 10 ++++++++++
 tests/qtest/device-plug-test.c | 15 ++-------------
 tests/qtest/drive_del-test.c   |  6 +-----
 tests/qtest/libqos/pci-pc.c    |  8 +-------
 tests/qtest/libqtest.c         | 16 ++++++++++------
 5 files changed, 24 insertions(+), 31 deletions(-)

diff --git a/tests/qtest/libqtest.h b/tests/qtest/libqtest.h
index 3abc75964d..65c040e504 100644
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
+ * Waiting for command completion event.
  */
 void qtest_qmp_device_del(QTestState *qts, const char *id);
 
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
 
-- 
2.31.1


