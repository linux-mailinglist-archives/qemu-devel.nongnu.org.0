Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6335A270D
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 13:48:03 +0200 (CEST)
Received: from localhost ([::1]:49866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRXog-0004Pk-JQ
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 07:48:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.labiuk@virtuozzo.com>)
 id 1oRXjP-0008E6-DL
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 07:42:36 -0400
Received: from relay.virtuozzo.com ([130.117.225.111]:49220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.labiuk@virtuozzo.com>)
 id 1oRXjK-0002CI-Un
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 07:42:33 -0400
Received: from [192.168.16.18] (helo=mikewrk.sw.ru)
 by relay.virtuozzo.com with esmtp (Exim 4.95)
 (envelope-from <michael.labiuk@virtuozzo.com>) id 1oRXhG-000LyA-Kh;
 Fri, 26 Aug 2022 13:41:58 +0200
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, den@virtuozzo.com
Subject: [PATCH] tests/x86: Add 'q35' machine type to hotplug tests
Date: Fri, 26 Aug 2022 14:41:59 +0300
Message-Id: <20220826114159.6370-1-michael.labiuk@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
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

Add pci bridge setting to run hotplug tests on q35 machine type.
Hotplug tests was bounded to 'pc' machine type by commit 7b172333f1b

Signed-off-by: Michael Labiuk <michael.labiuk@virtuozzo.com>
---
 tests/qtest/device-plug-test.c |  26 ++++++
 tests/qtest/drive_del-test.c   | 111 +++++++++++++++++++++++++
 tests/qtest/hd-geo-test.c      | 148 +++++++++++++++++++++++++++++++++
 tests/qtest/ivshmem-test.c     |  30 +++++++
 4 files changed, 315 insertions(+)

diff --git a/tests/qtest/device-plug-test.c b/tests/qtest/device-plug-test.c
index 2e3137843e..2f07b37ba1 100644
--- a/tests/qtest/device-plug-test.c
+++ b/tests/qtest/device-plug-test.c
@@ -165,6 +165,26 @@ static void test_spapr_phb_unplug_request(void)
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
+    /*
+     * Request device removal. As the guest is not running, the request won't
+     * be processed. However during system reset, the removal will be
+     * handled, removing the device.
+     */
+    device_del(qtest, "dev0");
+    system_reset(qtest);
+    wait_device_deleted_event(qtest, "dev0");
+
+    qtest_quit(qtest);
+}
+
 int main(int argc, char **argv)
 {
     const char *arch = qtest_get_arch();
@@ -195,5 +215,11 @@ int main(int argc, char **argv)
                        test_spapr_phb_unplug_request);
     }
 
+    if (!strcmp(arch, "x86_64")) {
+        qtest_add_func("/device-plug/q35-pci-unplug-request",
+                   test_q35_pci_unplug_request);
+
+    }
+
     return g_test_run();
 }
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
diff --git a/tests/qtest/ivshmem-test.c b/tests/qtest/ivshmem-test.c
index e23a97fa8e..c4ca7efc62 100644
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


