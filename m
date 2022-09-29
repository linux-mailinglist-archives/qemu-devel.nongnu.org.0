Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 492445F00CD
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 00:39:18 +0200 (CEST)
Received: from localhost ([::1]:58070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oe2BZ-00030I-4Q
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 18:39:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.labiuk@virtuozzo.com>)
 id 1oe28m-00064W-Tb
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 18:36:24 -0400
Received: from relay.virtuozzo.com ([130.117.225.111]:42766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.labiuk@virtuozzo.com>)
 id 1oe28j-0001xj-8t
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 18:36:24 -0400
Received: from [192.168.16.158] (helo=mikewrk.sw.ru)
 by relay.virtuozzo.com with esmtp (Exim 4.95)
 (envelope-from <michael.labiuk@virtuozzo.com>) id 1oe25g-0071e8-RY;
 Fri, 30 Sep 2022 00:35:37 +0200
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, den@virtuozzo.com
Subject: [PATCH v5 3/9] tests/x86: Refactor hot unplug hd-geo-test
Date: Fri, 30 Sep 2022 01:35:41 +0300
Message-Id: <20220929223547.1429580-4-michael.labiuk@virtuozzo.com>
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

Moving common code to function.

Signed-off-by: Michael Labiuk <michael.labiuk@virtuozzo.com>
---
 tests/qtest/hd-geo-test.c | 144 +++++++++++++++-----------------------
 1 file changed, 57 insertions(+), 87 deletions(-)

diff --git a/tests/qtest/hd-geo-test.c b/tests/qtest/hd-geo-test.c
index ba772f4d7a..61f4c24b81 100644
--- a/tests/qtest/hd-geo-test.c
+++ b/tests/qtest/hd-geo-test.c
@@ -691,7 +691,8 @@ static void add_virtio_disk(TestArgs *args,
     args->n_virtio_disks++;
 }
 
-static void test_override(TestArgs *args, CHSResult expected[])
+static void test_override(TestArgs *args, const char *arch,
+                          CHSResult expected[])
 {
     QTestState *qts;
     char *joined_args;
@@ -700,7 +701,7 @@ static void test_override(TestArgs *args, CHSResult expected[])
 
     joined_args = g_strjoinv(" ", args->argv);
 
-    qts = qtest_initf("-machine pc %s", joined_args);
+    qts = qtest_initf("-machine %s %s", arch, joined_args);
     fw_cfg = pc_fw_cfg_init(qts);
 
     read_bootdevices(fw_cfg, expected);
@@ -737,7 +738,7 @@ static void test_override_ide(void)
     add_ide_disk(args, 1, 0, 1, 9000, 120, 30);
     add_ide_disk(args, 2, 1, 0, 0, 1, 1);
     add_ide_disk(args, 3, 1, 1, 1, 0, 0);
-    test_override(args, expected);
+    test_override(args, "pc", expected);
 }
 
 static void test_override_scsi(void)
@@ -759,7 +760,7 @@ static void test_override_scsi(void)
     add_scsi_disk(args, 1, 0, 0, 1, 0, 9000, 120, 30);
     add_scsi_disk(args, 2, 0, 0, 2, 0, 1, 0, 0);
     add_scsi_disk(args, 3, 0, 0, 3, 0, 0, 1, 0);
-    test_override(args, expected);
+    test_override(args, "pc", expected);
 }
 
 static void test_override_scsi_2_controllers(void)
@@ -782,7 +783,7 @@ static void test_override_scsi_2_controllers(void)
     add_scsi_disk(args, 1, 0, 0, 1, 0, 9000, 120, 30);
     add_scsi_disk(args, 2, 1, 0, 0, 1, 1, 0, 0);
     add_scsi_disk(args, 3, 1, 0, 1, 2, 0, 1, 0);
-    test_override(args, expected);
+    test_override(args, "pc", expected);
 }
 
 static void test_override_virtio_blk(void)
@@ -797,7 +798,7 @@ static void test_override_virtio_blk(void)
     add_drive_with_mbr(args, empty_mbr, 1);
     add_virtio_disk(args, 0, "pci.0", 3, 10000, 120, 30);
     add_virtio_disk(args, 1, "pci.0", 4, 9000, 120, 30);
-    test_override(args, expected);
+    test_override(args, "pc", expected);
 }
 
 static void test_override_zero_chs(void)
@@ -808,16 +809,54 @@ static void test_override_zero_chs(void)
     };
     add_drive_with_mbr(args, empty_mbr, 1);
     add_ide_disk(args, 0, 1, 1, 0, 0, 0);
-    test_override(args, expected);
+    test_override(args, "pc", expected);
+}
+
+static void test_override_hot_unplug(TestArgs *args, const char *devid,
+                                     CHSResult expected[], CHSResult expected2[])
+{
+    QTestState *qts;
+    char *joined_args;
+    QFWCFG *fw_cfg;
+    QDict *response;
+    int i;
+
+    joined_args = g_strjoinv(" ", args->argv);
+
+    qts = qtest_initf("%s", joined_args);
+    fw_cfg = pc_fw_cfg_init(qts);
+
+    read_bootdevices(fw_cfg, expected);
+
+    /* unplug device an restart */
+    qtest_qmp_device_del_send(qts, devid);
+
+    response = qtest_qmp(qts,
+                         "{ 'execute': 'system_reset', 'arguments': { }}");
+    g_assert(response);
+    g_assert(!qdict_haskey(response, "error"));
+    qobject_unref(response);
+
+    qtest_qmp_eventwait(qts, "RESET");
+
+    read_bootdevices(fw_cfg, expected2);
+
+    g_free(joined_args);
+    qtest_quit(qts);
+
+    g_free(fw_cfg);
+
+    for (i = 0; i < args->n_drives; i++) {
+        unlink(args->drives[i]);
+        g_free(args->drives[i]);
+    }
+    g_free(args->drives);
+    g_strfreev(args->argv);
+    g_free(args);
 }
 
 static void test_override_scsi_hot_unplug(void)
 {
-    QTestState *qts;
-    char *joined_args;
-    QFWCFG *fw_cfg;
-    QDict *response;
-    int i;
     TestArgs *args = create_args();
     CHSResult expected[] = {
         {"/pci@i0cf8/scsi@2/channel@0/disk@0,0", {10000, 120, 30} },
@@ -834,51 +873,14 @@ static void test_override_scsi_hot_unplug(void)
     add_scsi_disk(args, 0, 0, 0, 0, 0, 10000, 120, 30);
     add_scsi_disk(args, 1, 0, 0, 1, 0, 20, 20, 20);
 
-    joined_args = g_strjoinv(" ", args->argv);
+    args->argc = append_arg(args->argc, args->argv, ARGV_SIZE,
+                            g_strdup("-machine pc"));
 
-    qts = qtest_initf("-machine pc %s", joined_args);
-    fw_cfg = pc_fw_cfg_init(qts);
-
-    read_bootdevices(fw_cfg, expected);
-
-    /* unplug device an restart */
-    response = qtest_qmp(qts,
-                         "{ 'execute': 'device_del',"
-                         "  'arguments': {'id': 'scsi-disk0' }}");
-    g_assert(response);
-    g_assert(!qdict_haskey(response, "error"));
-    qobject_unref(response);
-    response = qtest_qmp(qts,
-                         "{ 'execute': 'system_reset', 'arguments': { }}");
-    g_assert(response);
-    g_assert(!qdict_haskey(response, "error"));
-    qobject_unref(response);
-
-    qtest_qmp_eventwait(qts, "RESET");
-
-    read_bootdevices(fw_cfg, expected2);
-
-    g_free(joined_args);
-    qtest_quit(qts);
-
-    g_free(fw_cfg);
-
-    for (i = 0; i < args->n_drives; i++) {
-        unlink(args->drives[i]);
-        g_free(args->drives[i]);
-    }
-    g_free(args->drives);
-    g_strfreev(args->argv);
-    g_free(args);
+    test_override_hot_unplug(args, "scsi-disk0", expected, expected2);
 }
 
 static void test_override_virtio_hot_unplug(void)
 {
-    QTestState *qts;
-    char *joined_args;
-    QFWCFG *fw_cfg;
-    QDict *response;
-    int i;
     TestArgs *args = create_args();
     CHSResult expected[] = {
         {"/pci@i0cf8/scsi@2/disk@0,0", {10000, 120, 30} },
@@ -894,42 +896,10 @@ static void test_override_virtio_hot_unplug(void)
     add_virtio_disk(args, 0, "pci.0", 2, 10000, 120, 30);
     add_virtio_disk(args, 1, "pci.0", 3, 20, 20, 20);
 
-    joined_args = g_strjoinv(" ", args->argv);
+    args->argc = append_arg(args->argc, args->argv, ARGV_SIZE,
+                            g_strdup("-machine pc"));
 
-    qts = qtest_initf("-machine pc %s", joined_args);
-    fw_cfg = pc_fw_cfg_init(qts);
-
-    read_bootdevices(fw_cfg, expected);
-
-    /* unplug device an restart */
-    response = qtest_qmp(qts,
-                         "{ 'execute': 'device_del',"
-                         "  'arguments': {'id': 'virtio-disk0' }}");
-    g_assert(response);
-    g_assert(!qdict_haskey(response, "error"));
-    qobject_unref(response);
-    response = qtest_qmp(qts,
-                         "{ 'execute': 'system_reset', 'arguments': { }}");
-    g_assert(response);
-    g_assert(!qdict_haskey(response, "error"));
-    qobject_unref(response);
-
-    qtest_qmp_eventwait(qts, "RESET");
-
-    read_bootdevices(fw_cfg, expected2);
-
-    g_free(joined_args);
-    qtest_quit(qts);
-
-    g_free(fw_cfg);
-
-    for (i = 0; i < args->n_drives; i++) {
-        unlink(args->drives[i]);
-        g_free(args->drives[i]);
-    }
-    g_free(args->drives);
-    g_strfreev(args->argv);
-    g_free(args);
+    test_override_hot_unplug(args, "virtio-disk0", expected, expected2);
 }
 
 int main(int argc, char **argv)
-- 
2.34.1


