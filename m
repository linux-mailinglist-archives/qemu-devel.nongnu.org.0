Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F0B2236EA
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jul 2020 10:21:18 +0200 (CEST)
Received: from localhost ([::1]:35152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jwLcL-0004DQ-6z
	for lists+qemu-devel@lfdr.de; Fri, 17 Jul 2020 04:21:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jwLWU-0001tm-C8; Fri, 17 Jul 2020 04:15:14 -0400
Received: from relay.sw.ru ([185.231.240.75]:50006 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jwLWK-0007JU-Ch; Fri, 17 Jul 2020 04:15:14 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.93)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jwLWC-0003cP-J5; Fri, 17 Jul 2020 11:14:56 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v11 03/11] qcow2_format.py: change Qcow2BitmapExt
 initialization method
Date: Fri, 17 Jul 2020 11:14:51 +0300
Message-Id: <1594973699-781898-4-git-send-email-andrey.shinkevich@virtuozzo.com>
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

There are two ways to initialize a class derived from Qcow2Struct:
1. Pass a block of binary data to the constructor.
2. Pass the file descriptor to allow reading the file from constructor.
Let's change the Qcow2BitmapExt initialization method from 1 to 2 to
support a scattered reading in the initialization chain.
The implementation comes with the patch that follows.

Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 tests/qemu-iotests/qcow2_format.py | 36 ++++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/tests/qemu-iotests/qcow2_format.py b/tests/qemu-iotests/qcow2_format.py
index 2f3681b..d4a9974 100644
--- a/tests/qemu-iotests/qcow2_format.py
+++ b/tests/qemu-iotests/qcow2_format.py
@@ -113,6 +113,11 @@ class Qcow2BitmapExt(Qcow2Struct):
         ('u64', '{:#x}', 'bitmap_directory_offset')
     )
 
+    def __init__(self, fd):
+        super().__init__(fd=fd)
+        tail = struct.calcsize(self.fmt) % 8
+        if tail:
+            fd.seek(8 - tail, 1)
 
 QCOW2_EXT_MAGIC_BITMAPS = 0x23852875
 
@@ -161,21 +166,24 @@ class QcowHeaderExtension(Qcow2Struct):
         else:
             assert all(v is None for v in (magic, length, data))
             super().__init__(fd=fd)
-            padded = (self.length + 7) & ~7
-            self.data = fd.read(padded)
-            assert self.data is not None
-
-        data_str = self.data[:self.length]
-        if all(c in string.printable.encode('ascii') for c in data_str):
-            data_str = f"'{ data_str.decode('ascii') }'"
-        else:
-            data_str = '<binary>'
-        self.data_str = data_str
+            if self.magic == QCOW2_EXT_MAGIC_BITMAPS:
+                self.obj = Qcow2BitmapExt(fd=fd)
+                self.data = None
+            else:
+                padded = (self.length + 7) & ~7
+                self.data = fd.read(padded)
+                assert self.data is not None
+                self.obj = None
+
+        if self.data is not None:
+            data_str = self.data[:self.length]
+            if all(c in string.printable.encode(
+                'ascii') for c in data_str):
+                data_str = f"'{ data_str.decode('ascii') }'"
+            else:
+                data_str = '<binary>'
+            self.data_str = data_str
 
-        if self.magic == QCOW2_EXT_MAGIC_BITMAPS:
-            self.obj = Qcow2BitmapExt(data=self.data)
-        else:
-            self.obj = None
 
     def dump(self):
         super().dump()
-- 
1.8.3.1


