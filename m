Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A9C233423
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jul 2020 16:17:55 +0200 (CEST)
Received: from localhost ([::1]:36940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k19Na-0000Ut-K6
	for lists+qemu-devel@lfdr.de; Thu, 30 Jul 2020 10:17:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1k19L9-0004zN-KA; Thu, 30 Jul 2020 10:15:23 -0400
Received: from relay.sw.ru ([185.231.240.75]:44448 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1k19L4-00052h-Lg; Thu, 30 Jul 2020 10:15:23 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.93)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1k19Km-0004Cz-Q6; Thu, 30 Jul 2020 17:15:00 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v12 05/11] qcow2_format.py: Dump bitmap directory information
Date: Thu, 30 Jul 2020 17:15:06 +0300
Message-Id: <1596118512-424960-6-git-send-email-andrey.shinkevich@virtuozzo.com>
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
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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

Read and dump entries from the bitmap directory of QCOW2 image.

Header extension:
magic                     0x23852875 (Bitmaps)
...
Bitmap name               bitmap-1
bitmap_table_offset       0xf0000
bitmap_table_size         1
flags                     0x2 (['auto'])
type                      1
granularity_bits          16
name_size                 8
extra_data_size           0

Suggested-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/303.out         | 18 +++++++++++++++
 tests/qemu-iotests/qcow2_format.py | 47 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/tests/qemu-iotests/303.out b/tests/qemu-iotests/303.out
index 8b11169..dc3739b 100644
--- a/tests/qemu-iotests/303.out
+++ b/tests/qemu-iotests/303.out
@@ -62,3 +62,21 @@ reserved32                0
 bitmap_directory_size     0x40
 bitmap_directory_offset   0x9d0000
 
+Bitmap name               bitmap-1
+bitmap_table_offset       0x9b0000
+bitmap_table_size         1
+flags                     0x2 (['auto'])
+type                      1
+granularity_bits          15
+name_size                 8
+extra_data_size           0
+
+Bitmap name               bitmap-2
+bitmap_table_offset       0x9c0000
+bitmap_table_size         1
+flags                     0x0 ([])
+type                      1
+granularity_bits          16
+name_size                 8
+extra_data_size           0
+
diff --git a/tests/qemu-iotests/qcow2_format.py b/tests/qemu-iotests/qcow2_format.py
index b447344..05a8aa9 100644
--- a/tests/qemu-iotests/qcow2_format.py
+++ b/tests/qemu-iotests/qcow2_format.py
@@ -134,6 +134,53 @@ class Qcow2BitmapExt(Qcow2Struct):
         tail = struct.calcsize(self.fmt) % 8
         if tail:
             fd.seek(8 - tail, 1)
+        position = fd.tell()
+        self.read_bitmap_directory(fd)
+        fd.seek(position)
+
+    def read_bitmap_directory(self, fd):
+        fd.seek(self.bitmap_directory_offset)
+        self.bitmap_directory = \
+            [Qcow2BitmapDirEntry(fd) for _ in range(self.nb_bitmaps)]
+
+    def dump(self):
+        super().dump()
+        for entry in self.bitmap_directory:
+            print()
+            entry.dump()
+
+
+class Qcow2BitmapDirEntry(Qcow2Struct):
+
+    fields = (
+        ('u64', '{:#x}', 'bitmap_table_offset'),
+        ('u32', '{}', 'bitmap_table_size'),
+        ('u32', BitmapFlags, 'flags'),
+        ('u8',  '{}', 'type'),
+        ('u8',  '{}', 'granularity_bits'),
+        ('u16', '{}', 'name_size'),
+        ('u32', '{}', 'extra_data_size')
+    )
+
+    def __init__(self, fd):
+        super().__init__(fd=fd)
+        # Seek relative to the current position in the file
+        fd.seek(self.extra_data_size, 1)
+        bitmap_name = fd.read(self.name_size)
+        self.name = bitmap_name.decode('ascii')
+        # Move position to the end of the entry in the directory
+        entry_raw_size = self.bitmap_dir_entry_raw_size()
+        padding = ((entry_raw_size + 7) & ~7) - entry_raw_size
+        fd.seek(padding, 1)
+
+    def bitmap_dir_entry_raw_size(self):
+        return struct.calcsize(self.fmt) + self.name_size + \
+            self.extra_data_size
+
+    def dump(self):
+        print(f'{"Bitmap name":<25} {self.name}')
+        super(Qcow2BitmapDirEntry, self).dump()
+
 
 QCOW2_EXT_MAGIC_BITMAPS = 0x23852875
 
-- 
1.8.3.1


