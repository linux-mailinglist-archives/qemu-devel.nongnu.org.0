Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 155E321E28B
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jul 2020 23:38:09 +0200 (CEST)
Received: from localhost ([::1]:58716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jv69I-0004LP-53
	for lists+qemu-devel@lfdr.de; Mon, 13 Jul 2020 17:38:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jv682-0002uF-Gd; Mon, 13 Jul 2020 17:36:50 -0400
Received: from relay.sw.ru ([185.231.240.75]:52828 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jv67z-000528-Vs; Mon, 13 Jul 2020 17:36:50 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.93)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jv67m-0000E2-RA; Tue, 14 Jul 2020 00:36:34 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v10 09/10] qcow2_format.py: collect fields to dump in JSON
 format
Date: Tue, 14 Jul 2020 00:36:42 +0300
Message-Id: <1594676203-436999-10-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1594676203-436999-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1594676203-436999-1-git-send-email-andrey.shinkevich@virtuozzo.com>
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.shinkevich@virtuozzo.com; helo=relay3.sw.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/13 17:36:45
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

As __dict__ is being extended with class members we do not want to
print, make a light copy of the initial __dict__ and extend the copy
by adding lists we have to print in the JSON output.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 tests/qemu-iotests/qcow2_format.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qemu-iotests/qcow2_format.py b/tests/qemu-iotests/qcow2_format.py
index e0e14b5..83c3482 100644
--- a/tests/qemu-iotests/qcow2_format.py
+++ b/tests/qemu-iotests/qcow2_format.py
@@ -109,6 +109,8 @@ class Qcow2Struct(metaclass=Qcow2StructMeta):
         self.__dict__ = dict((field[2], values[i])
                              for i, field in enumerate(self.fields))
 
+        self.fields_dict = self.__dict__.copy()
+
     def dump(self, dump_json=None):
         for f in self.fields:
             value = self.__dict__[f[2]]
@@ -144,6 +146,7 @@ class Qcow2BitmapExt(Qcow2Struct):
         self.bitmap_directory = \
             [Qcow2BitmapDirEntry(fd, cluster_size=self.cluster_size)
              for _ in range(self.nb_bitmaps)]
+        self.fields_dict.update(bitmap_directory=self.bitmap_directory)
 
     def dump(self, dump_json=None):
         super().dump(dump_json)
@@ -189,6 +192,7 @@ class Qcow2BitmapDirEntry(Qcow2Struct):
         table = [e[0] for e in struct.iter_unpack('>Q', fd.read(table_size))]
         self.bitmap_table = Qcow2BitmapTable(raw_table=table,
                                              cluster_size=self.cluster_size)
+        self.fields_dict.update(bitmap_table=self.bitmap_table)
 
     def dump(self, dump_json=None):
         print(f'{"Bitmap name":<25} {self.name}')
-- 
1.8.3.1


