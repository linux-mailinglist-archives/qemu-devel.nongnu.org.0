Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFCE5B9BD5
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 15:30:55 +0200 (CEST)
Received: from localhost ([::1]:41064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYoxC-0000Eh-OB
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 09:30:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.labiuk@virtuozzo.com>)
 id 1oYohY-0007uY-3M
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 09:14:47 -0400
Received: from relay.virtuozzo.com ([130.117.225.111]:51284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.labiuk@virtuozzo.com>)
 id 1oYohS-0002ty-Q0
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 09:14:42 -0400
Received: from [192.168.16.215] (helo=mikewrk.sw.ru)
 by relay.virtuozzo.com with esmtp (Exim 4.95)
 (envelope-from <michael.labiuk@virtuozzo.com>) id 1oYoer-004BPT-Bf;
 Thu, 15 Sep 2022 15:14:09 +0200
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, den@virtuozzo.com
Subject: [PATCH v3 2/5] tests/x86: Add 'q35' machine type to ivshmem-test
Date: Thu, 15 Sep 2022 16:14:04 +0300
Message-Id: <20220915131407.372485-3-michael.labiuk@virtuozzo.com>
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

Configure pci bridge setting to test ivshmem on 'q35'.
Signed-off-by: Michael Labiuk <michael.labiuk@virtuozzo.com>
---
 tests/qtest/ivshmem-test.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/tests/qtest/ivshmem-test.c b/tests/qtest/ivshmem-test.c
index 9611d05eb5..0f9755abc6 100644
--- a/tests/qtest/ivshmem-test.c
+++ b/tests/qtest/ivshmem-test.c
@@ -378,6 +378,32 @@ static void test_ivshmem_server(void)
     close(thread.pipe[0]);
 }
 
+static void device_del(QTestState *qtest, const char *id)
+{
+    QDict *resp;
+
+    resp = qtest_qmp(qtest,
+                     "{'execute': 'device_del',"
+                     " 'arguments': { 'id': %s } }", id);
+
+    g_assert(qdict_haskey(resp, "return"));
+    qobject_unref(resp);
+}
+
+static void test_ivshmem_hotplug_q35(void)
+{
+    QTestState *qts = qtest_init("-object memory-backend-ram,size=1M,id=mb1 "
+                                 "-device pcie-root-port,id=p1 "
+                                 "-device pcie-pci-bridge,bus=p1,id=b1 "
+                                 "-machine q35");
+
+    qtest_qmp_device_add(qts, "ivshmem-plain", "iv1",
+                         "{'memdev': 'mb1', 'bus': 'b1'}");
+    device_del(qts, "iv1");
+
+    qtest_quit(qts);
+}
+
 #define PCI_SLOT_HP             0x06
 
 static void test_ivshmem_hotplug(void)
@@ -469,6 +495,7 @@ int main(int argc, char **argv)
 {
     int ret, fd;
     gchar dir[] = "/tmp/ivshmem-test.XXXXXX";
+    const char *arch = qtest_get_arch();
 
     g_test_init(&argc, &argv, NULL);
 
@@ -494,6 +521,9 @@ int main(int argc, char **argv)
         qtest_add_func("/ivshmem/pair", test_ivshmem_pair);
         qtest_add_func("/ivshmem/server", test_ivshmem_server);
     }
+    if (!strcmp(arch, "x86_64")) {
+        qtest_add_func("/ivshmem/hotplug-q35", test_ivshmem_hotplug_q35);
+    }
 
 out:
     ret = g_test_run();
-- 
2.34.1


