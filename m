Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8635BE785
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 15:48:45 +0200 (CEST)
Received: from localhost ([::1]:55448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oadcC-0001VO-NB
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 09:48:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.labiuk@virtuozzo.com>)
 id 1oaaoH-0003xW-1m
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:49:01 -0400
Received: from relay.virtuozzo.com ([130.117.225.111]:52114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.labiuk@virtuozzo.com>)
 id 1oaaoD-0007yR-U3
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:49:00 -0400
Received: from [192.168.16.178] (helo=mikewrk.sw.ru)
 by relay.virtuozzo.com with esmtp (Exim 4.95)
 (envelope-from <michael.labiuk@virtuozzo.com>) id 1oaalo-004fUv-My;
 Tue, 20 Sep 2022 12:48:40 +0200
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, den@virtuozzo.com
Subject: [PATCH v4 7/7] tests/x86: Add 'q35' machine type to hotplug
 hd-geo-test
Date: Tue, 20 Sep 2022 13:48:42 +0300
Message-Id: <20220920104842.605530-8-michael.labiuk@virtuozzo.com>
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

Add pci bridge setting to test hotplug.
Duplicate tests for plugging scsi and virtio devices for q35 machine type.

Signed-off-by: Michael Labiuk <michael.labiuk@virtuozzo.com>
---
 tests/qtest/hd-geo-test.c | 76 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/tests/qtest/hd-geo-test.c b/tests/qtest/hd-geo-test.c
index d488ad9ac0..ada80d8828 100644
--- a/tests/qtest/hd-geo-test.c
+++ b/tests/qtest/hd-geo-test.c
@@ -969,6 +969,42 @@ static void test_override_scsi_hot_unplug(void)
     test_override_hot_unplug(args, "scsi-disk0", expected, expected2);
 }
 
+static void test_override_scsi_hot_unplug_q35(void)
+{
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
+
+    args->argc = append_arg(args->argc, args->argv, ARGV_SIZE,
+                            g_strdup("-device pcie-root-port,id=p0 "
+                                     "-device pcie-pci-bridge,bus=p0,id=b1 "
+                                     "-machine q35"));
+
+    add_drive_with_mbr(args, empty_mbr, 1);
+    add_drive_with_mbr(args, empty_mbr, 1);
+    add_scsi_controller(args, "virtio-scsi-pci", "b1", 2);
+    add_scsi_disk(args, 0, 0, 0, 0, 0, 10000, 120, 30);
+    add_scsi_disk(args, 1, 0, 0, 1, 0, 20, 20, 20);
+
+    test_override_hot_unplug(args, "scsi-disk0", expected, expected2);
+}
+
 static void test_override_virtio_hot_unplug(void)
 {
     TestArgs *args = create_args();
@@ -992,6 +1028,41 @@ static void test_override_virtio_hot_unplug(void)
     test_override_hot_unplug(args, "virtio-disk0", expected, expected2);
 }
 
+static void test_override_virtio_hot_unplug_q35(void)
+{
+    TestArgs *args = create_args();
+    CHSResult expected[] = {
+        {
+            "/pci@i0cf8/pci-bridge@1/pci-bridge@0/scsi@2/disk@0,0",
+            {10000, 120, 30}
+        },
+        {
+            "/pci@i0cf8/pci-bridge@1/pci-bridge@0/scsi@3/disk@0,0",
+            {20, 20, 20}
+        },
+        {NULL, {0, 0, 0} }
+    };
+    CHSResult expected2[] = {
+        {
+            "/pci@i0cf8/pci-bridge@1/pci-bridge@0/scsi@3/disk@0,0",
+            {20, 20, 20}
+        },
+        {NULL, {0, 0, 0} }
+    };
+
+    args->argc = append_arg(args->argc, args->argv, ARGV_SIZE,
+                            g_strdup("-device pcie-root-port,id=p0 "
+                                     "-device pcie-pci-bridge,bus=p0,id=b1 "
+                                     "-machine q35"));
+
+    add_drive_with_mbr(args, empty_mbr, 1);
+    add_drive_with_mbr(args, empty_mbr, 1);
+    add_virtio_disk(args, 0, "b1", 2, 10000, 120, 30);
+    add_virtio_disk(args, 1, "b1", 3, 20, 20, 20);
+
+    test_override_hot_unplug(args, "virtio-disk0", expected, expected2);
+}
+
 int main(int argc, char **argv)
 {
     Backend i;
@@ -1038,8 +1109,13 @@ int main(int argc, char **argv)
                        test_override_zero_chs_q35);
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


