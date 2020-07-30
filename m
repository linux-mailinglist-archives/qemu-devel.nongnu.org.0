Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 700A023343E
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jul 2020 16:23:54 +0200 (CEST)
Received: from localhost ([::1]:37558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k19TN-0003tJ-Hy
	for lists+qemu-devel@lfdr.de; Thu, 30 Jul 2020 10:23:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1k19LA-000510-C5; Thu, 30 Jul 2020 10:15:24 -0400
Received: from relay.sw.ru ([185.231.240.75]:44454 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1k19L4-00052i-NA; Thu, 30 Jul 2020 10:15:23 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.93)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1k19Kn-0004Cz-2f; Thu, 30 Jul 2020 17:15:01 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v12 11/11] iotests: dump QCOW2 header in JSON in #303
Date: Thu, 30 Jul 2020 17:15:12 +0300
Message-Id: <1596118512-424960-12-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1596118512-424960-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1596118512-424960-1-git-send-email-andrey.shinkevich@virtuozzo.com>
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.shinkevich@virtuozzo.com; helo=relay3.sw.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/30 10:15:15
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, andrey.shinkevich@virtuozzo.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extend the test case #303 by dumping QCOW2 image metadata in JSON
format.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 tests/qemu-iotests/303     |  3 ++
 tests/qemu-iotests/303.out | 76 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 79 insertions(+)

diff --git a/tests/qemu-iotests/303 b/tests/qemu-iotests/303
index 3c7a611..6821bd3 100755
--- a/tests/qemu-iotests/303
+++ b/tests/qemu-iotests/303
@@ -57,3 +57,6 @@ add_bitmap(1, 1, 7, False)
 add_bitmap(2, 7, 9, True)
 dump = ['qcow2.py', f'{disk}', 'dump-header']
 subprocess.run(dump)
+# Dump the metadata in JSON format
+dump.append('-j')
+subprocess.run(dump)
diff --git a/tests/qemu-iotests/303.out b/tests/qemu-iotests/303.out
index d581fb4..ead3b63 100644
--- a/tests/qemu-iotests/303.out
+++ b/tests/qemu-iotests/303.out
@@ -84,3 +84,79 @@ extra_data_size           0
 Bitmap table   type            size         offset
 0              all-zeroes      65536        0
 
+{
+    "magic": 1363560955,
+    "version": 3,
+    "backing_file_offset": 0,
+    "backing_file_size": 0,
+    "cluster_bits": 16,
+    "size": 10485760,
+    "crypt_method": 0,
+    "l1_size": 1,
+    "l1_table_offset": 196608,
+    "refcount_table_offset": 65536,
+    "refcount_table_clusters": 1,
+    "nb_snapshots": 0,
+    "snapshot_offset": 0,
+    "incompatible_features": 0,
+    "compatible_features": 0,
+    "autoclear_features": 1,
+    "refcount_order": 4,
+    "header_length": 112
+}
+
+[
+    {
+        "name": "Feature table",
+        "magic": 1745090647,
+        "length": 336,
+        "data_str": "<binary>"
+    },
+    {
+        "name": "Bitmaps",
+        "magic": 595929205,
+        "length": 24,
+        "data": {
+            "nb_bitmaps": 2,
+            "reserved32": 0,
+            "bitmap_directory_size": 64,
+            "bitmap_directory_offset": 10289152,
+            "bitmap_directory": [
+                {
+                    "name": "bitmap-1",
+                    "bitmap_table_offset": 10158080,
+                    "bitmap_table_size": 1,
+                    "flags": 2,
+                    "type": 1,
+                    "granularity_bits": 15,
+                    "name_size": 8,
+                    "extra_data_size": 0,
+                    "bitmap_table": [
+                        {
+                            "type": "serialized",
+                            "offset": 10092544,
+                            "reserved": 0
+                        }
+                    ]
+                },
+                {
+                    "name": "bitmap-2",
+                    "bitmap_table_offset": 10223616,
+                    "bitmap_table_size": 1,
+                    "flags": 0,
+                    "type": 1,
+                    "granularity_bits": 16,
+                    "name_size": 8,
+                    "extra_data_size": 0,
+                    "bitmap_table": [
+                        {
+                            "type": "all-zeroes",
+                            "offset": 0,
+                            "reserved": 0
+                        }
+                    ]
+                }
+            ]
+        }
+    }
+]
-- 
1.8.3.1


