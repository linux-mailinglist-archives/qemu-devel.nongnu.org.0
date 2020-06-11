Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E8B1F6F62
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jun 2020 23:22:19 +0200 (CEST)
Received: from localhost ([::1]:36444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjUeQ-0005Sh-JX
	for lists+qemu-devel@lfdr.de; Thu, 11 Jun 2020 17:22:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jjUbi-00034c-Mb; Thu, 11 Jun 2020 17:19:30 -0400
Received: from relay.sw.ru ([185.231.240.75]:40362 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jjUbf-00057r-5p; Thu, 11 Jun 2020 17:19:30 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.93)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jjUbW-0001xE-Qz; Fri, 12 Jun 2020 00:19:18 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 4/8] qcow2_format.py: pass cluster size to substructures
Date: Fri, 12 Jun 2020 00:19:16 +0300
Message-Id: <1591910360-867499-5-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1591910360-867499-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1591910360-867499-1-git-send-email-andrey.shinkevich@virtuozzo.com>
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.shinkevich@virtuozzo.com; helo=relay3.sw.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/11 17:19:22
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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

The cluster size of an image is the QcowHeader class member and may be
obtained by dependent extension structures such as Qcow2BitmapExt for
further bitmap table details print.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 tests/qemu-iotests/qcow2_format.py | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/tests/qemu-iotests/qcow2_format.py b/tests/qemu-iotests/qcow2_format.py
index a7868a7..6589f68 100644
--- a/tests/qemu-iotests/qcow2_format.py
+++ b/tests/qemu-iotests/qcow2_format.py
@@ -116,6 +116,10 @@ class Qcow2BitmapExt(Qcow2Struct):
         ('u64', '{:#x}', 'bitmap_directory_offset')
     )
 
+    def __init__(self, data, cluster_size):
+        super().__init__(data=data)
+        self.cluster_size = cluster_size
+
     def read_bitmap_directory(self, fd):
         self.bitmaps = []
         fd.seek(self.bitmap_directory_offset)
@@ -123,7 +127,8 @@ class Qcow2BitmapExt(Qcow2Struct):
 
         for n in range(self.nb_bitmaps):
             buf = fd.read(buf_size)
-            dir_entry = Qcow2BitmapDirEntry(data=buf)
+            dir_entry = Qcow2BitmapDirEntry(data=buf,
+                                            cluster_size=self.cluster_size)
             fd.seek(dir_entry.extra_data_size, FROM_CURRENT)
             bitmap_name = fd.read(dir_entry.name_size)
             dir_entry.name = bitmap_name.decode('ascii')
@@ -159,8 +164,9 @@ class Qcow2BitmapDirEntry(Qcow2Struct):
         ('u32', '{}',    'extra_data_size')
     )
 
-    def __init__(self, data):
+    def __init__(self, data, cluster_size):
         super().__init__(data=data)
+        self.cluster_size = cluster_size
 
         self.bitmap_table_bytes = self.bitmap_table_size \
             * struct.calcsize('Q')
@@ -205,11 +211,13 @@ class QcowHeaderExtension(Qcow2Struct):
         # then padding to next multiply of 8
     )
 
-    def __init__(self, magic=None, length=None, data=None, fd=None):
+    def __init__(self, magic=None, length=None, data=None, fd=None,
+                 cluster_size=None):
         """
         Support both loading from fd and creation from user data.
         For fd-based creation current position in a file will be used to read
         the data.
+        The cluster_size value may be obtained by dependent structures.
 
         This should be somehow refactored and functionality should be moved to
         superclass (to allow creation of any qcow2 struct), but then, fields
@@ -243,7 +251,8 @@ class QcowHeaderExtension(Qcow2Struct):
         self.data_str = data_str
 
         if self.magic == QCOW2_EXT_MAGIC_BITMAPS:
-            self.obj = Qcow2BitmapExt(data=self.data)
+            self.obj = Qcow2BitmapExt(data=self.data,
+                                      cluster_size=cluster_size)
         else:
             self.obj = None
 
@@ -318,7 +327,7 @@ class QcowHeader(Qcow2Struct):
             end = self.cluster_size
 
         while fd.tell() < end:
-            ext = QcowHeaderExtension(fd=fd)
+            ext = QcowHeaderExtension(fd=fd, cluster_size=self.cluster_size)
             if ext.magic == 0:
                 break
             else:
-- 
1.8.3.1


