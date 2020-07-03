Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8DC213ADF
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 15:21:42 +0200 (CEST)
Received: from localhost ([::1]:59256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrLdN-0002V3-QN
	for lists+qemu-devel@lfdr.de; Fri, 03 Jul 2020 09:21:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jrLW3-0006sS-46; Fri, 03 Jul 2020 09:14:07 -0400
Received: from relay.sw.ru ([185.231.240.75]:60348 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jrLVv-0007eS-W5; Fri, 03 Jul 2020 09:14:06 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.93)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jrLVk-0004Vj-1I; Fri, 03 Jul 2020 16:13:48 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v8 09/10] qcow2_format.py: collect fields to dump in JSON
 format
Date: Fri,  3 Jul 2020 16:13:49 +0300
Message-Id: <1593782030-521984-10-git-send-email-andrey.shinkevich@virtuozzo.com>
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

As __dict__ is being extended with class members we do not want to
print, make a light copy of the initial __dict__ and extend the copy
by adding lists we have to print in the JSON output.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 tests/qemu-iotests/qcow2_format.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qemu-iotests/qcow2_format.py b/tests/qemu-iotests/qcow2_format.py
index dae6b6e..e8eb36f 100644
--- a/tests/qemu-iotests/qcow2_format.py
+++ b/tests/qemu-iotests/qcow2_format.py
@@ -110,6 +110,8 @@ class Qcow2Struct(metaclass=Qcow2StructMeta):
         self.__dict__ = dict((field[2], values[i])
                              for i, field in enumerate(self.fields))
 
+        self.fields_dict = self.__dict__.copy()
+
     def dump(self, dump_json=None):
         for f in self.fields:
             value = self.__dict__[f[2]]
@@ -140,6 +142,7 @@ class Qcow2BitmapExt(Qcow2Struct):
         self.bitmap_directory = \
             [Qcow2BitmapDirEntry(fd, cluster_size=self.cluster_size)
              for _ in range(self.nb_bitmaps)]
+        self.fields_dict.update(bitmap_directory=self.bitmap_directory)
 
     def dump(self, dump_json=None):
         super().dump(dump_json)
@@ -185,6 +188,7 @@ class Qcow2BitmapDirEntry(Qcow2Struct):
         table = [e[0] for e in struct.iter_unpack('>Q', fd.read(table_size))]
         self.bitmap_table = Qcow2BitmapTable(raw_table=table,
                                              cluster_size=self.cluster_size)
+        self.fields_dict.update(bitmap_table=self.bitmap_table)
 
     def dump(self, dump_json=None):
         print(f'{"Bitmap name":<25} {self.name}')
-- 
1.8.3.1


