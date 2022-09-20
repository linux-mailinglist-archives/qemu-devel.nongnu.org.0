Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3385BE8BE
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 16:23:27 +0200 (CEST)
Received: from localhost ([::1]:53348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oae9m-00021c-1p
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 10:23:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.labiuk@virtuozzo.com>)
 id 1oaaoI-0003yY-Ui
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:49:05 -0400
Received: from relay.virtuozzo.com ([130.117.225.111]:52113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.labiuk@virtuozzo.com>)
 id 1oaaoD-0007yT-UM
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:49:00 -0400
Received: from [192.168.16.178] (helo=mikewrk.sw.ru)
 by relay.virtuozzo.com with esmtp (Exim 4.95)
 (envelope-from <michael.labiuk@virtuozzo.com>) id 1oaaln-004fUv-30;
 Tue, 20 Sep 2022 12:48:39 +0200
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, den@virtuozzo.com
Subject: [PATCH v4 5/7] tests/x86: Add 'q35' machine type to override-tests in
 hd-geo-test
Date: Tue, 20 Sep 2022 13:48:40 +0300
Message-Id: <20220920104842.605530-6-michael.labiuk@virtuozzo.com>
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

Signed-off-by: Michael Labiuk <michael.labiuk@virtuozzo.com>
---
 tests/qtest/hd-geo-test.c | 105 +++++++++++++++++++++++++++++++++++---
 1 file changed, 98 insertions(+), 7 deletions(-)

diff --git a/tests/qtest/hd-geo-test.c b/tests/qtest/hd-geo-test.c
index 413cf964c0..58b1107d64 100644
--- a/tests/qtest/hd-geo-test.c
+++ b/tests/qtest/hd-geo-test.c
@@ -693,7 +693,8 @@ static void add_virtio_disk(TestArgs *args,
     args->n_virtio_disks++;
 }
 
-static void test_override(TestArgs *args, CHSResult expected[])
+static void test_override(TestArgs *args, const char *arch,
+                          CHSResult expected[])
 {
     QTestState *qts;
     char *joined_args;
@@ -702,7 +703,7 @@ static void test_override(TestArgs *args, CHSResult expected[])
 
     joined_args = g_strjoinv(" ", args->argv);
 
-    qts = qtest_initf("-machine pc %s", joined_args);
+    qts = qtest_initf("-machine %s %s", arch, joined_args);
     fw_cfg = pc_fw_cfg_init(qts);
 
     read_bootdevices(fw_cfg, expected);
@@ -739,7 +740,28 @@ static void test_override_ide(void)
     add_ide_disk(args, 1, 0, 1, 9000, 120, 30);
     add_ide_disk(args, 2, 1, 0, 0, 1, 1);
     add_ide_disk(args, 3, 1, 1, 1, 0, 0);
-    test_override(args, expected);
+    test_override(args, "pc", expected);
+}
+
+static void test_override_sata(void)
+{
+    TestArgs *args = create_args();
+    CHSResult expected[] = {
+        {"/pci@i0cf8/pci8086,2922@1f,2/drive@0/disk@0", {10000, 120, 30} },
+        {"/pci@i0cf8/pci8086,2922@1f,2/drive@1/disk@0", {9000, 120, 30} },
+        {"/pci@i0cf8/pci8086,2922@1f,2/drive@2/disk@0", {0, 1, 1} },
+        {"/pci@i0cf8/pci8086,2922@1f,2/drive@3/disk@0", {1, 0, 0} },
+        {NULL, {0, 0, 0} }
+    };
+    add_drive_with_mbr(args, empty_mbr, 1);
+    add_drive_with_mbr(args, empty_mbr, 1);
+    add_drive_with_mbr(args, empty_mbr, 1);
+    add_drive_with_mbr(args, empty_mbr, 1);
+    add_ide_disk(args, 0, 0, 0, 10000, 120, 30);
+    add_ide_disk(args, 1, 1, 0, 9000, 120, 30);
+    add_ide_disk(args, 2, 2, 0, 0, 1, 1);
+    add_ide_disk(args, 3, 3, 0, 1, 0, 0);
+    test_override(args, "q35", expected);
 }
 
 static void test_override_scsi(void)
@@ -761,7 +783,43 @@ static void test_override_scsi(void)
     add_scsi_disk(args, 1, 0, 0, 1, 0, 9000, 120, 30);
     add_scsi_disk(args, 2, 0, 0, 2, 0, 1, 0, 0);
     add_scsi_disk(args, 3, 0, 0, 3, 0, 0, 1, 0);
-    test_override(args, expected);
+    test_override(args, "pc", expected);
+}
+
+static void setup_pci_bridge(TestArgs *args, const char *id, const char *rootid)
+{
+
+    char *root, *br;
+    root = g_strdup_printf("-device pcie-root-port,id=%s", rootid);
+    br = g_strdup_printf("-device pcie-pci-bridge,bus=%s,id=%s", rootid, id);
+
+    args->argc = append_arg(args->argc, args->argv, ARGV_SIZE, root);
+    args->argc = append_arg(args->argc, args->argv, ARGV_SIZE, br);
+}
+
+static void test_override_scsi_q35(void)
+{
+    TestArgs *args = create_args();
+    CHSResult expected[] = {
+        {   "/pci@i0cf8/pci-bridge@1/scsi@3/channel@0/disk@0,0",
+            {10000, 120, 30}
+        },
+        {"/pci@i0cf8/pci-bridge@1/scsi@3/channel@0/disk@1,0", {9000, 120, 30} },
+        {"/pci@i0cf8/pci-bridge@1/scsi@3/channel@0/disk@2,0", {1, 0, 0} },
+        {"/pci@i0cf8/pci-bridge@1/scsi@3/channel@0/disk@3,0", {0, 1, 0} },
+        {NULL, {0, 0, 0} }
+    };
+    add_drive_with_mbr(args, empty_mbr, 1);
+    add_drive_with_mbr(args, empty_mbr, 1);
+    add_drive_with_mbr(args, empty_mbr, 1);
+    add_drive_with_mbr(args, empty_mbr, 1);
+    setup_pci_bridge(args, "pcie.0", "br");
+    add_scsi_controller(args, "lsi53c895a", "br", 3);
+    add_scsi_disk(args, 0, 0, 0, 0, 0, 10000, 120, 30);
+    add_scsi_disk(args, 1, 0, 0, 1, 0, 9000, 120, 30);
+    add_scsi_disk(args, 2, 0, 0, 2, 0, 1, 0, 0);
+    add_scsi_disk(args, 3, 0, 0, 3, 0, 0, 1, 0);
+    test_override(args, "q35", expected);
 }
 
 static void test_override_scsi_2_controllers(void)
@@ -784,7 +842,7 @@ static void test_override_scsi_2_controllers(void)
     add_scsi_disk(args, 1, 0, 0, 1, 0, 9000, 120, 30);
     add_scsi_disk(args, 2, 1, 0, 0, 1, 1, 0, 0);
     add_scsi_disk(args, 3, 1, 0, 1, 2, 0, 1, 0);
-    test_override(args, expected);
+    test_override(args, "pc", expected);
 }
 
 static void test_override_virtio_blk(void)
@@ -799,7 +857,23 @@ static void test_override_virtio_blk(void)
     add_drive_with_mbr(args, empty_mbr, 1);
     add_virtio_disk(args, 0, "pci.0", 3, 10000, 120, 30);
     add_virtio_disk(args, 1, "pci.0", 4, 9000, 120, 30);
-    test_override(args, expected);
+    test_override(args, "pc", expected);
+}
+
+static void test_override_virtio_blk_q35(void)
+{
+    TestArgs *args = create_args();
+    CHSResult expected[] = {
+        {"/pci@i0cf8/pci-bridge@2/scsi@3/disk@0,0", {10000, 120, 30} },
+        {"/pci@i0cf8/pci-bridge@2/scsi@4/disk@0,0", {9000, 120, 30} },
+        {NULL, {0, 0, 0} }
+    };
+    add_drive_with_mbr(args, empty_mbr, 1);
+    add_drive_with_mbr(args, empty_mbr, 1);
+    setup_pci_bridge(args, "pcie.0", "br");
+    add_virtio_disk(args, 0, "br", 3, 10000, 120, 30);
+    add_virtio_disk(args, 1, "br", 4, 9000, 120, 30);
+    test_override(args, "pc", expected);
 }
 
 static void test_override_zero_chs(void)
@@ -810,7 +884,18 @@ static void test_override_zero_chs(void)
     };
     add_drive_with_mbr(args, empty_mbr, 1);
     add_ide_disk(args, 0, 1, 1, 0, 0, 0);
-    test_override(args, expected);
+    test_override(args, "pc", expected);
+}
+
+static void test_override_zero_chs_q35(void)
+{
+    TestArgs *args = create_args();
+    CHSResult expected[] = {
+        {NULL, {0, 0, 0} }
+    };
+    add_drive_with_mbr(args, empty_mbr, 1);
+    add_ide_disk(args, 0, 0, 0, 0, 0, 0);
+    test_override(args, "q35", expected);
 }
 
 static void test_override_scsi_hot_unplug(void)
@@ -965,13 +1050,19 @@ int main(int argc, char **argv)
     qtest_add_func("hd-geo/ide/device/user/chst", test_ide_device_user_chst);
     if (have_qemu_img()) {
         qtest_add_func("hd-geo/override/ide", test_override_ide);
+        qtest_add_func("hd-geo/override/sata", test_override_sata);
         if (qtest_has_device("lsi53c895a")) {
             qtest_add_func("hd-geo/override/scsi", test_override_scsi);
+            qtest_add_func("hd-geo/override/scsiq35", test_override_scsi_q35);
             qtest_add_func("hd-geo/override/scsi_2_controllers",
                            test_override_scsi_2_controllers);
         }
         qtest_add_func("hd-geo/override/virtio_blk", test_override_virtio_blk);
+        qtest_add_func("hd-geo/override/virtio_blk_q35",
+                       test_override_virtio_blk_q35);
         qtest_add_func("hd-geo/override/zero_chs", test_override_zero_chs);
+        qtest_add_func("hd-geo/override/zero_chs_q35",
+                       test_override_zero_chs_q35);
         qtest_add_func("hd-geo/override/scsi_hot_unplug",
                        test_override_scsi_hot_unplug);
         qtest_add_func("hd-geo/override/virtio_hot_unplug",
-- 
2.34.1


