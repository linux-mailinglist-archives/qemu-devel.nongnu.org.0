Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22784213ABA
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 15:18:08 +0200 (CEST)
Received: from localhost ([::1]:45540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrLZv-0004Qc-6V
	for lists+qemu-devel@lfdr.de; Fri, 03 Jul 2020 09:18:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jrLW4-0006xK-Qy; Fri, 03 Jul 2020 09:14:08 -0400
Received: from relay.sw.ru ([185.231.240.75]:60342 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jrLVw-0007eN-0f; Fri, 03 Jul 2020 09:14:08 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.93)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jrLVj-0004Vj-Sd; Fri, 03 Jul 2020 16:13:47 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v8 06/10] qcow2_format.py: pass cluster size to substructures
Date: Fri,  3 Jul 2020 16:13:46 +0300
Message-Id: <1593782030-521984-7-git-send-email-andrey.shinkevich@virtuozzo.com>
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
 tests/qemu-iotests/qcow2_format.py | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/tests/qemu-iotests/qcow2_format.py b/tests/qemu-iotests/qcow2_format.py
index 7c0dc9a..cfd9646 100644
--- a/tests/qemu-iotests/qcow2_format.py
+++ b/tests/qemu-iotests/qcow2_format.py
@@ -130,14 +130,16 @@ class Qcow2BitmapExt(Qcow2Struct):
         ('u64', '{:#x}', 'bitmap_directory_offset')
     )
 
-    def __init__(self, fd):
+    def __init__(self, fd, cluster_size):
         super().__init__(fd=fd)
+        self.cluster_size = cluster_size
         self.read_bitmap_directory(fd)
 
     def read_bitmap_directory(self, fd):
         fd.seek(self.bitmap_directory_offset)
         self.bitmap_directory = \
-            [Qcow2BitmapDirEntry(fd) for _ in range(self.nb_bitmaps)]
+            [Qcow2BitmapDirEntry(fd, cluster_size=self.cluster_size)
+             for _ in range(self.nb_bitmaps)]
 
     def dump(self):
         super().dump()
@@ -158,8 +160,9 @@ class Qcow2BitmapDirEntry(Qcow2Struct):
         ('u32', '{}', 'extra_data_size')
     )
 
-    def __init__(self, fd):
+    def __init__(self, fd, cluster_size):
         super().__init__(fd=fd)
+        self.cluster_size = cluster_size
         # Seek relative to the current position in the file
         fd.seek(self.extra_data_size, 1)
         bitmap_name = fd.read(self.name_size)
@@ -199,11 +202,13 @@ class QcowHeaderExtension(Qcow2Struct):
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
@@ -242,7 +247,7 @@ class QcowHeaderExtension(Qcow2Struct):
             # Step back to reread data
             padded = (self.length + 7) & ~7
             fd.seek(-padded, 1)
-            self.obj = Qcow2BitmapExt(fd=fd)
+            self.obj = Qcow2BitmapExt(fd=fd, cluster_size=cluster_size)
             fd.seek(position)
         else:
             self.obj = None
@@ -318,7 +323,7 @@ class QcowHeader(Qcow2Struct):
             end = self.cluster_size
 
         while fd.tell() < end:
-            ext = QcowHeaderExtension(fd=fd)
+            ext = QcowHeaderExtension(fd=fd, cluster_size=self.cluster_size)
             if ext.magic == 0:
                 break
             else:
-- 
1.8.3.1


