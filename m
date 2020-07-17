Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1E02236DD
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jul 2020 10:19:56 +0200 (CEST)
Received: from localhost ([::1]:58130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jwLb1-0001xs-Le
	for lists+qemu-devel@lfdr.de; Fri, 17 Jul 2020 04:19:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jwLWQ-0001rn-Mm; Fri, 17 Jul 2020 04:15:11 -0400
Received: from relay.sw.ru ([185.231.240.75]:49990 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jwLWK-0007JS-G1; Fri, 17 Jul 2020 04:15:10 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.93)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jwLWC-0003cP-Nr; Fri, 17 Jul 2020 11:14:56 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v11 07/11] qcow2_format.py: Dump bitmap table serialized
 entries
Date: Fri, 17 Jul 2020 11:14:55 +0300
Message-Id: <1594973699-781898-8-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1594973699-781898-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1594973699-781898-1-git-send-email-andrey.shinkevich@virtuozzo.com>
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.shinkevich@virtuozzo.com; helo=relay3.sw.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/17 04:15:01
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

Add bitmap table information to the QCOW2 metadata dump.

Bitmap name               bitmap-1
...
Bitmap table   type            offset                   size
0              serialized      4718592                  65536
1              serialized      4294967296               65536
2              serialized      5348033147437056         65536
3              serialized      13792273858822144        65536
4              serialized      4718592                  65536
5              serialized      4294967296               65536
6              serialized      4503608217305088         65536
7              serialized      14073748835532800        65536

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 tests/qemu-iotests/qcow2_format.py | 41 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/tests/qemu-iotests/qcow2_format.py b/tests/qemu-iotests/qcow2_format.py
index ca0d350..ad1918c 100644
--- a/tests/qemu-iotests/qcow2_format.py
+++ b/tests/qemu-iotests/qcow2_format.py
@@ -175,6 +175,10 @@ class Qcow2BitmapDirEntry(Qcow2Struct):
         entry_raw_size = self.bitmap_dir_entry_raw_size()
         padding = ((entry_raw_size + 7) & ~7) - entry_raw_size
         fd.seek(padding, 1)
+        self.bitmap_table = Qcow2BitmapTable(fd=fd,
+                                             offset=self.bitmap_table_offset,
+                                             size=self.bitmap_table_size,
+                                             cluster_size=self.cluster_size)
 
     def bitmap_dir_entry_raw_size(self):
         return struct.calcsize(self.fmt) + self.name_size + \
@@ -183,6 +187,43 @@ class Qcow2BitmapDirEntry(Qcow2Struct):
     def dump(self):
         print(f'{"Bitmap name":<25} {self.name}')
         super(Qcow2BitmapDirEntry, self).dump()
+        self.bitmap_table.dump()
+
+
+class Qcow2BitmapTableEntry:
+
+    BME_TABLE_ENTRY_OFFSET_MASK = 0x00fffffffffffe00
+    BME_TABLE_ENTRY_FLAG_ALL_ONES = 1
+
+    def __init__(self, entry):
+        self.offset = entry & self.BME_TABLE_ENTRY_OFFSET_MASK
+        if self.offset:
+            self.type = 'serialized'
+        elif entry & self.BME_TABLE_ENTRY_FLAG_ALL_ONES:
+            self.type = 'all-ones'
+        else:
+            self.type = 'all-zeroes'
+
+
+class Qcow2BitmapTable:
+
+    def __init__(self, fd, offset, size, cluster_size):
+        self.entries = []
+        self.cluster_size = cluster_size
+        table_size = size * 8
+        position = fd.tell()
+        fd.seek(offset)
+        table = [e[0] for e in struct.iter_unpack('>Q', fd.read(table_size))]
+        fd.seek(position)
+        for entry in table:
+            self.entries.append(Qcow2BitmapTableEntry(entry))
+
+    def dump(self):
+        size = self.cluster_size
+        bitmap_table = enumerate(self.entries)
+        print(f'{"Bitmap table":<14} {"type":<15} {"offset":<24} {"size"}')
+        for i, entry in bitmap_table:
+            print(f'{i:<14} {entry.type:<15} {entry.offset:<24} {size}')
 
 
 QCOW2_EXT_MAGIC_BITMAPS = 0x23852875
-- 
1.8.3.1


