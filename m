Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 754EA1F7127
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jun 2020 02:07:16 +0200 (CEST)
Received: from localhost ([::1]:38184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjXE3-0002Z3-F7
	for lists+qemu-devel@lfdr.de; Thu, 11 Jun 2020 20:07:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jjXC3-0008MK-4e; Thu, 11 Jun 2020 20:05:11 -0400
Received: from relay.sw.ru ([185.231.240.75]:52854 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jjXBy-0006IF-JM; Thu, 11 Jun 2020 20:05:10 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.93)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jjXBr-0002Yd-JZ; Fri, 12 Jun 2020 03:04:59 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 3/9] qcow2_format.py: make printable data an extension
 class member
Date: Fri, 12 Jun 2020 03:04:56 +0300
Message-Id: <1591920302-1002219-4-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1591920302-1002219-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1591920302-1002219-1-git-send-email-andrey.shinkevich@virtuozzo.com>
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.shinkevich@virtuozzo.com; helo=relay3.sw.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/11 20:05:03
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

Let us differ binary data type from string one for the extension data
variable and keep the string as the QcowHeaderExtension class member.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/qcow2_format.py | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/tests/qemu-iotests/qcow2_format.py b/tests/qemu-iotests/qcow2_format.py
index 0f65fd1..d4f0000 100644
--- a/tests/qemu-iotests/qcow2_format.py
+++ b/tests/qemu-iotests/qcow2_format.py
@@ -164,6 +164,13 @@ class QcowHeaderExtension(Qcow2Struct):
             self.data = fd.read(padded)
             assert self.data is not None
 
+        data_str = self.data[:self.length]
+        if all(c in string.printable.encode('ascii') for c in data_str):
+            data_str = f"'{ data_str.decode('ascii') }'"
+        else:
+            data_str = '<binary>'
+        self.data_str = data_str
+
         if self.magic == QCOW2_EXT_MAGIC_BITMAPS:
             self.obj = Qcow2BitmapExt(data=self.data)
         else:
@@ -173,12 +180,7 @@ class QcowHeaderExtension(Qcow2Struct):
         super().dump()
 
         if self.obj is None:
-            data = self.data[:self.length]
-            if all(c in string.printable.encode('ascii') for c in data):
-                data = f"'{ data.decode('ascii') }'"
-            else:
-                data = '<binary>'
-            print(f'{"data":<25} {data}')
+            print(f'{"data":<25} {self.data_str}')
         else:
             self.obj.dump()
 
-- 
1.8.3.1


