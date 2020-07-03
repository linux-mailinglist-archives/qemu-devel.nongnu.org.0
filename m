Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6286213AB3
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 15:15:58 +0200 (CEST)
Received: from localhost ([::1]:36500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrLXp-0000W6-OU
	for lists+qemu-devel@lfdr.de; Fri, 03 Jul 2020 09:15:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jrLW3-0006tV-IX; Fri, 03 Jul 2020 09:14:07 -0400
Received: from relay.sw.ru ([185.231.240.75]:60360 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jrLVw-0007eT-0y; Fri, 03 Jul 2020 09:14:07 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.93)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jrLVj-0004Vj-Q8; Fri, 03 Jul 2020 16:13:47 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v8 05/10] qcow2_format.py: Dump bitmap directory information
Date: Fri,  3 Jul 2020 16:13:45 +0300
Message-Id: <1593782030-521984-6-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1593782030-521984-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1593782030-521984-1-git-send-email-andrey.shinkevich@virtuozzo.com>
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.shinkevich@virtuozzo.com; helo=relay3.sw.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/03 09:13:53
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
It extends the output in the test case #291.

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
---
 tests/qemu-iotests/291.out         | 45 ++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/qcow2_format.py | 44 +++++++++++++++++++++++++++++++++++++
 2 files changed, 89 insertions(+)

diff --git a/tests/qemu-iotests/291.out b/tests/qemu-iotests/291.out
index 08bfaaa..53a8eeb 100644
--- a/tests/qemu-iotests/291.out
+++ b/tests/qemu-iotests/291.out
@@ -33,6 +33,24 @@ reserved32                0
 bitmap_directory_size     0x40
 bitmap_directory_offset   0x510000
 
+Bitmap name               b1
+bitmap_table_offset       0x4e0000
+bitmap_table_size         1
+flags                     0x0 ([])
+type                      1
+granularity_bits          19
+name_size                 2
+extra_data_size           0
+
+Bitmap name               b2
+bitmap_table_offset       0x500000
+bitmap_table_size         1
+flags                     0x2 (['auto'])
+type                      1
+granularity_bits          16
+name_size                 2
+extra_data_size           0
+
 
 === Bitmap preservation not possible to non-qcow2 ===
 
@@ -98,6 +116,33 @@ reserved32                0
 bitmap_directory_size     0x60
 bitmap_directory_offset   0x520000
 
+Bitmap name               b1
+bitmap_table_offset       0x470000
+bitmap_table_size         1
+flags                     0x0 ([])
+type                      1
+granularity_bits          19
+name_size                 2
+extra_data_size           0
+
+Bitmap name               b2
+bitmap_table_offset       0x490000
+bitmap_table_size         1
+flags                     0x2 (['auto'])
+type                      1
+granularity_bits          16
+name_size                 2
+extra_data_size           0
+
+Bitmap name               b0
+bitmap_table_offset       0x510000
+bitmap_table_size         1
+flags                     0x0 ([])
+type                      1
+granularity_bits          16
+name_size                 2
+extra_data_size           0
+
 
 === Check bitmap contents ===
 
diff --git a/tests/qemu-iotests/qcow2_format.py b/tests/qemu-iotests/qcow2_format.py
index d8c058d..7c0dc9a 100644
--- a/tests/qemu-iotests/qcow2_format.py
+++ b/tests/qemu-iotests/qcow2_format.py
@@ -132,6 +132,50 @@ class Qcow2BitmapExt(Qcow2Struct):
 
     def __init__(self, fd):
         super().__init__(fd=fd)
+        self.read_bitmap_directory(fd)
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
 
 
 QCOW2_EXT_MAGIC_BITMAPS = 0x23852875
-- 
1.8.3.1


