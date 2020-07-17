Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FDD2236D9
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jul 2020 10:18:47 +0200 (CEST)
Received: from localhost ([::1]:50972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jwLZu-0007PP-MS
	for lists+qemu-devel@lfdr.de; Fri, 17 Jul 2020 04:18:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jwLWO-0001qt-02; Fri, 17 Jul 2020 04:15:09 -0400
Received: from relay.sw.ru ([185.231.240.75]:49998 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jwLWK-0007JR-DW; Fri, 17 Jul 2020 04:15:07 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.93)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jwLWC-0003cP-QU; Fri, 17 Jul 2020 11:14:56 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v11 09/11] qcow2_format.py: collect fields to dump in JSON
 format
Date: Fri, 17 Jul 2020 11:14:57 +0300
Message-Id: <1594973699-781898-10-git-send-email-andrey.shinkevich@virtuozzo.com>
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

As __dict__ is being extended with class members we do not want to
print, add the to_dict() method to classes that returns a dictionary
with desired fields and their values. Extend it in subclass when
necessary to print the final dictionary in the JSON output which
follows.

Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 tests/qemu-iotests/qcow2_format.py | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/tests/qemu-iotests/qcow2_format.py b/tests/qemu-iotests/qcow2_format.py
index 2921a27..19d29b8 100644
--- a/tests/qemu-iotests/qcow2_format.py
+++ b/tests/qemu-iotests/qcow2_format.py
@@ -119,6 +119,9 @@ class Qcow2Struct(metaclass=Qcow2StructMeta):
 
             print('{:<25} {}'.format(f[2], value_str))
 
+    def to_dict(self):
+        return dict((f[2], self.__dict__[f[2]]) for f in self.fields)
+
 
 class Qcow2BitmapExt(Qcow2Struct):
 
@@ -152,6 +155,11 @@ class Qcow2BitmapExt(Qcow2Struct):
             print()
             entry.dump()
 
+    def to_dict(self):
+        fields_dict = super().to_dict()
+        fields_dict.update(bitmap_directory=self.bitmap_directory)
+        return fields_dict
+
 
 class Qcow2BitmapDirEntry(Qcow2Struct):
 
@@ -190,6 +198,13 @@ class Qcow2BitmapDirEntry(Qcow2Struct):
         super(Qcow2BitmapDirEntry, self).dump()
         self.bitmap_table.dump()
 
+    def to_dict(self):
+        fields_dict = super().to_dict()
+        fields_dict.update(bitmap_table=self.bitmap_table)
+        bmp_name = dict(name=self.name)
+        bme_dict = {**bmp_name, **fields_dict}
+        return bme_dict
+
 
 class Qcow2BitmapTableEntry:
 
@@ -205,6 +220,9 @@ class Qcow2BitmapTableEntry:
         else:
             self.type = 'all-zeroes'
 
+    def to_dict(self):
+        return dict(type=self.type, offset=self.offset)
+
 
 class Qcow2BitmapTable:
 
@@ -226,6 +244,9 @@ class Qcow2BitmapTable:
         for i, entry in bitmap_table:
             print(f'{i:<14} {entry.type:<15} {entry.offset:<24} {size}')
 
+    def to_dict(self):
+        return dict(entries=self.entries)
+
 
 QCOW2_EXT_MAGIC_BITMAPS = 0x23852875
 
@@ -241,6 +262,9 @@ class QcowHeaderExtension(Qcow2Struct):
             0x44415441: 'Data file'
         }
 
+        def to_dict(self):
+            return self.mapping.get(self.value, "<unknown>")
+
     fields = (
         ('u32', Magic, 'magic'),
         ('u32', '{}', 'length')
@@ -303,6 +327,17 @@ class QcowHeaderExtension(Qcow2Struct):
         else:
             self.obj.dump()
 
+    def to_dict(self):
+        fields_dict = super().to_dict()
+        ext_name = dict(name=self.Magic(self.magic))
+        he_dict = {**ext_name, **fields_dict}
+        if self.obj is not None:
+            he_dict.update(data=self.obj)
+        else:
+            he_dict.update(data_str=self.data_str)
+
+        return he_dict
+
     @classmethod
     def create(cls, magic, data):
         return QcowHeaderExtension(magic, len(data), data)
@@ -405,3 +440,6 @@ class QcowHeader(Qcow2Struct):
             print('Header extension:')
             ex.dump()
             print()
+
+    def to_dict(self):
+        return super().to_dict()
-- 
1.8.3.1


