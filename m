Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7035BE7D9
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 16:01:12 +0200 (CEST)
Received: from localhost ([::1]:41902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oadoG-0004CJ-1e
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 10:01:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.labiuk@virtuozzo.com>)
 id 1oaaoO-0003zm-54
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:49:09 -0400
Received: from relay.virtuozzo.com ([130.117.225.111]:52142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.labiuk@virtuozzo.com>)
 id 1oaaoG-0007zQ-OT
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:49:03 -0400
Received: from [192.168.16.178] (helo=mikewrk.sw.ru)
 by relay.virtuozzo.com with esmtp (Exim 4.95)
 (envelope-from <michael.labiuk@virtuozzo.com>) id 1oaalj-004fUv-LR;
 Tue, 20 Sep 2022 12:48:36 +0200
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, den@virtuozzo.com
Subject: [PATCH v4 1/7] tests/x86: Move common code to function in
 device-plug-test
Date: Tue, 20 Sep 2022 13:48:36 +0300
Message-Id: <20220920104842.605530-2-michael.labiuk@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920104842.605530-1-michael.labiuk@virtuozzo.com>
References: <20220920104842.605530-1-michael.labiuk@virtuozzo.com>
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

Move common code for device removing to function.

Signed-off-by: Michael Labiuk <michael.labiuk@virtuozzo.com>
---
 tests/qtest/device-plug-test.c | 42 ++++++++++++++--------------------
 1 file changed, 17 insertions(+), 25 deletions(-)

diff --git a/tests/qtest/device-plug-test.c b/tests/qtest/device-plug-test.c
index a1fb99c8ff..e595b45b66 100644
--- a/tests/qtest/device-plug-test.c
+++ b/tests/qtest/device-plug-test.c
@@ -61,6 +61,18 @@ static void wait_device_deleted_event(QTestState *qtest, const char *id)
     }
 }
 
+static void process_device_remove(QTestState *qtest, const char *id)
+{
+    /*
+     * Request device removal. As the guest is not running, the request won't
+     * be processed. However during system reset, the removal will be
+     * handled, removing the device.
+     */
+    device_del(qtest, id);
+    system_reset(qtest);
+    wait_device_deleted_event(qtest, id);
+}
+
 static void test_pci_unplug_request(void)
 {
     const char *arch = qtest_get_arch();
@@ -73,14 +85,7 @@ static void test_pci_unplug_request(void)
     QTestState *qtest = qtest_initf("%s -device virtio-mouse-pci,id=dev0",
                                     machine_addition);
 
-    /*
-     * Request device removal. As the guest is not running, the request won't
-     * be processed. However during system reset, the removal will be
-     * handled, removing the device.
-     */
-    device_del(qtest, "dev0");
-    system_reset(qtest);
-    wait_device_deleted_event(qtest, "dev0");
+    process_device_remove(qtest, "dev0");
 
     qtest_quit(qtest);
 }
@@ -98,14 +103,7 @@ static void test_pci_unplug_json_request(void)
         "%s -device \"{'driver': 'virtio-mouse-pci', 'id': 'dev0'}\"",
         machine_addition);
 
-    /*
-     * Request device removal. As the guest is not running, the request won't
-     * be processed. However during system reset, the removal will be
-     * handled, removing the device.
-     */
-    device_del(qtest, "dev0");
-    system_reset(qtest);
-    wait_device_deleted_event(qtest, "dev0");
+    process_device_remove(qtest, "dev0");
 
     qtest_quit(qtest);
 }
@@ -128,9 +126,7 @@ static void test_spapr_cpu_unplug_request(void)
                         "-device power9_v2.0-spapr-cpu-core,core-id=1,id=dev0");
 
     /* similar to test_pci_unplug_request */
-    device_del(qtest, "dev0");
-    system_reset(qtest);
-    wait_device_deleted_event(qtest, "dev0");
+    process_device_remove(qtest, "dev0");
 
     qtest_quit(qtest);
 }
@@ -144,9 +140,7 @@ static void test_spapr_memory_unplug_request(void)
                         "-device pc-dimm,id=dev0,memdev=mem0");
 
     /* similar to test_pci_unplug_request */
-    device_del(qtest, "dev0");
-    system_reset(qtest);
-    wait_device_deleted_event(qtest, "dev0");
+    process_device_remove(qtest, "dev0");
 
     qtest_quit(qtest);
 }
@@ -158,9 +152,7 @@ static void test_spapr_phb_unplug_request(void)
     qtest = qtest_initf("-device spapr-pci-host-bridge,index=1,id=dev0");
 
     /* similar to test_pci_unplug_request */
-    device_del(qtest, "dev0");
-    system_reset(qtest);
-    wait_device_deleted_event(qtest, "dev0");
+    process_device_remove(qtest, "dev0");
 
     qtest_quit(qtest);
 }
-- 
2.34.1


