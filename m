Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 393445A5328
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 19:29:54 +0200 (CEST)
Received: from localhost ([::1]:44274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSia9-0001Q4-Bo
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 13:29:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.labiuk@virtuozzo.com>)
 id 1oSi8b-0007Nj-Q9
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 13:01:27 -0400
Received: from relay.virtuozzo.com ([130.117.225.111]:48478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.labiuk@virtuozzo.com>)
 id 1oSi8Y-0000Ya-G5
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 13:01:25 -0400
Received: from [192.168.16.44] (helo=mikewrk.sw.ru)
 by relay.virtuozzo.com with esmtp (Exim 4.95)
 (envelope-from <michael.labiuk@virtuozzo.com>) id 1oSi6i-000wcp-3B;
 Mon, 29 Aug 2022 19:01:03 +0200
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, den@virtuozzo.com
Subject: [PATCH v2 3/4] tests/x86: Add 'q35' machine type to hd-geo-test
Date: Mon, 29 Aug 2022 20:01:05 +0300
Message-Id: <20220829170106.110195-4-michael.labiuk@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220829170106.110195-1-michael.labiuk@virtuozzo.com>
References: <20220829170106.110195-1-michael.labiuk@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=130.117.225.111;
 envelope-from=michael.labiuk@virtuozzo.com; helo=relay.virtuozzo.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Add pci bridge setting to test hotplug.
Duplicate tests for plugging scsi and virtio devices for q35 machine type.
Signed-off-by: Michael Labiuk <michael.labiuk@virtuozzo.com>
---
 tests/qtest/hd-geo-test.c | 148 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 148 insertions(+)

diff --git a/tests/qtest/hd-geo-test.c b/tests/qtest/hd-geo-test.c
index 413cf964c0..256450729f 100644
--- a/tests/qtest/hd-geo-test.c
+++ b/tests/qtest/hd-geo-test.c
@@ -874,6 +874,78 @@ static void test_override_scsi_hot_unplug(void)
     g_free(args);
 }
 
+static void test_override_scsi_hot_unplug_q35(void)
+{
+    QTestState *qts;
+    char *joined_args;
+    QFWCFG *fw_cfg;
+    QDict *response;
+    int i;
+    TestArgs *args = create_args();
+    CHSResult expected[] = {
+        {
+            "/pci@i0cf8/pci-bridge@1/pci-bridge@0/scsi@2/channel@0/disk@0,0",
+            {10000, 120, 30}
+        },
+        {
+            "/pci@i0cf8/pci-bridge@1/pci-bridge@0/scsi@2/channel@0/disk@1,0",
+            {20, 20, 20}
+        },
+        {NULL, {0, 0, 0} }
+    };
+    CHSResult expected2[] = {
+        {
+            "/pci@i0cf8/pci-bridge@1/pci-bridge@0/scsi@2/channel@0/disk@1,0",
+            {20, 20, 20}
+        },
+        {NULL, {0, 0, 0} }
+    };
+    add_drive_with_mbr(args, empty_mbr, 1);
+    add_drive_with_mbr(args, empty_mbr, 1);
+    add_scsi_controller(args, "virtio-scsi-pci", "b1", 2);
+    add_scsi_disk(args, 0, 0, 0, 0, 0, 10000, 120, 30);
+    add_scsi_disk(args, 1, 0, 0, 1, 0, 20, 20, 20);
+
+    joined_args = g_strjoinv(" ", args->argv);
+
+    qts = qtest_initf("-device pcie-root-port,id=p0 "
+                      "-device pcie-pci-bridge,bus=p0,id=b1 "
+                      "-machine q35 %s", joined_args);
+    fw_cfg = pc_fw_cfg_init(qts);
+
+    read_bootdevices(fw_cfg, expected);
+
+    /* unplug device an restart */
+    response = qtest_qmp(qts,
+                         "{ 'execute': 'device_del',"
+                         "  'arguments': {'id': 'scsi-disk0' }}");
+    g_assert(response);
+    g_assert(!qdict_haskey(response, "error"));
+    qobject_unref(response);
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
+        free(args->drives[i]);
+    }
+    g_free(args->drives);
+    g_strfreev(args->argv);
+    g_free(args);
+}
+
 static void test_override_virtio_hot_unplug(void)
 {
     QTestState *qts;
@@ -934,6 +1006,77 @@ static void test_override_virtio_hot_unplug(void)
     g_free(args);
 }
 
+static void test_override_virtio_hot_unplug_q35(void)
+{
+    QTestState *qts;
+    char *joined_args;
+    QFWCFG *fw_cfg;
+    QDict *response;
+    int i;
+    TestArgs *args = create_args();
+    CHSResult expected[] = {
+        {
+            "/pci@i0cf8/pci-bridge@2/pci-bridge@0/scsi@2/disk@0,0",
+            {10000, 120, 30}
+        },
+        {
+            "/pci@i0cf8/pci-bridge@2/pci-bridge@0/scsi@3/disk@0,0",
+            {20, 20, 20}
+        },
+        {NULL, {0, 0, 0} }
+    };
+    CHSResult expected2[] = {
+        {
+            "/pci@i0cf8/pci-bridge@2/pci-bridge@0/scsi@3/disk@0,0",
+            {20, 20, 20}
+        },
+        {NULL, {0, 0, 0} }
+    };
+    add_drive_with_mbr(args, empty_mbr, 1);
+    add_drive_with_mbr(args, empty_mbr, 1);
+    add_virtio_disk(args, 0, "b1", 2, 10000, 120, 30);
+    add_virtio_disk(args, 1, "b1", 3, 20, 20, 20);
+
+    joined_args = g_strjoinv(" ", args->argv);
+
+    qts = qtest_initf("-device pcie-root-port,id=p0 "
+                      "-device pcie-pci-bridge,bus=p0,id=b1 "
+                      "-machine pc %s", joined_args);
+    fw_cfg = pc_fw_cfg_init(qts);
+
+    read_bootdevices(fw_cfg, expected);
+
+    /* unplug device an restart */
+    response = qtest_qmp(qts,
+                         "{ 'execute': 'device_del',"
+                         "  'arguments': {'id': 'virtio-disk0' }}");
+    g_assert(response);
+    g_assert(!qdict_haskey(response, "error"));
+    qobject_unref(response);
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
+        free(args->drives[i]);
+    }
+    g_free(args->drives);
+    g_strfreev(args->argv);
+    g_free(args);
+}
+
 int main(int argc, char **argv)
 {
     Backend i;
@@ -974,8 +1117,13 @@ int main(int argc, char **argv)
         qtest_add_func("hd-geo/override/zero_chs", test_override_zero_chs);
         qtest_add_func("hd-geo/override/scsi_hot_unplug",
                        test_override_scsi_hot_unplug);
+        qtest_add_func("hd-geo/override/scsi_hot_unplug_q35",
+                       test_override_scsi_hot_unplug_q35);
         qtest_add_func("hd-geo/override/virtio_hot_unplug",
                        test_override_virtio_hot_unplug);
+        qtest_add_func("hd-geo/override/virtio_hot_unplug_q35",
+                       test_override_virtio_hot_unplug_q35);
+
     } else {
         g_test_message("QTEST_QEMU_IMG not set or qemu-img missing; "
                        "skipping hd-geo/override/* tests");
-- 
2.34.1


