Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E9B1F7124
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jun 2020 02:06:54 +0200 (CEST)
Received: from localhost ([::1]:36702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjXDg-0001yp-N0
	for lists+qemu-devel@lfdr.de; Thu, 11 Jun 2020 20:06:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jjXC2-0008Lr-ER; Thu, 11 Jun 2020 20:05:10 -0400
Received: from relay.sw.ru ([185.231.240.75]:52837 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jjXBy-0006IA-K0; Thu, 11 Jun 2020 20:05:10 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.93)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jjXBr-0002Yd-OG; Fri, 12 Jun 2020 03:04:59 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 7/9] qcow2.py: Introduce '-j' key to dump in JSON format
Date: Fri, 12 Jun 2020 03:05:00 +0300
Message-Id: <1591920302-1002219-8-git-send-email-andrey.shinkevich@virtuozzo.com>
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

Add the command key to the qcow2.py arguments list to dump QCOW2
metadata in JSON format. Here is the suggested way to do that. The
implementation of the dump in JSON format is in the patch that follows.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 tests/qemu-iotests/qcow2.py        | 20 +++++++++++++++-----
 tests/qemu-iotests/qcow2_format.py | 18 +++++++++---------
 2 files changed, 24 insertions(+), 14 deletions(-)

diff --git a/tests/qemu-iotests/qcow2.py b/tests/qemu-iotests/qcow2.py
index 8c187e9..b08d8fc 100755
--- a/tests/qemu-iotests/qcow2.py
+++ b/tests/qemu-iotests/qcow2.py
@@ -24,16 +24,19 @@ from qcow2_format import (
 )
 
 
+dump_json = False
+
+
 def cmd_dump_header(fd):
     h = QcowHeader(fd)
-    h.dump()
+    h.dump(dump_json)
     print()
-    h.dump_extensions()
+    h.dump_extensions(dump_json)
 
 
 def cmd_dump_header_exts(fd):
     h = QcowHeader(fd)
-    h.dump_extensions()
+    h.dump_extensions(dump_json)
 
 
 def cmd_set_header(fd, name, value):
@@ -132,6 +135,11 @@ cmds = [
 
 
 def main(filename, cmd, args):
+    global dump_json
+    dump_json = '-j' in sys.argv
+    if dump_json:
+        sys.argv.remove('-j')
+        args.remove('-j')
     fd = open(filename, "r+b")
     try:
         for name, handler, num_args, desc in cmds:
@@ -149,12 +157,14 @@ def main(filename, cmd, args):
 
 
 def usage():
-    print("Usage: %s <file> <cmd> [<arg>, ...]" % sys.argv[0])
+    print("Usage: %s <file> <cmd> [<arg>, ...] [<key>, ...]" % sys.argv[0])
     print("")
     print("Supported commands:")
     for name, handler, num_args, desc in cmds:
         print("    %-20s - %s" % (name, desc))
-
+    print("")
+    print("Supported keys:")
+    print("    %-20s - %s" % ('-j', 'Dump in JSON format'))
 
 if __name__ == '__main__':
     if len(sys.argv) < 3:
diff --git a/tests/qemu-iotests/qcow2_format.py b/tests/qemu-iotests/qcow2_format.py
index c1c2773..a19f3b3 100644
--- a/tests/qemu-iotests/qcow2_format.py
+++ b/tests/qemu-iotests/qcow2_format.py
@@ -92,7 +92,7 @@ class Qcow2Struct(metaclass=Qcow2StructMeta):
         self.__dict__ = dict((field[2], values[i])
                              for i, field in enumerate(self.fields))
 
-    def dump(self):
+    def dump(self, dump_json=None):
         for f in self.fields:
             value = self.__dict__[f[2]]
             if isinstance(f[1], str):
@@ -143,10 +143,10 @@ class Qcow2BitmapExt(Qcow2Struct):
     def load(self, fd):
         self.read_bitmap_directory(fd)
 
-    def dump(self):
-        super().dump()
+    def dump(self, dump_json=None):
+        super().dump(dump_json)
         for bm in self.bitmaps:
-            bm.dump_bitmap_dir_entry()
+            bm.dump_bitmap_dir_entry(dump_json)
 
 
 BME_FLAG_IN_USE = 1 << 0
@@ -190,7 +190,7 @@ class Qcow2BitmapDirEntry(Qcow2Struct):
         table = [e[0] for e in struct.iter_unpack('>Q', fd.read(table_size))]
         self.bitmap_table = Qcow2BitmapTable(table)
 
-    def dump_bitmap_dir_entry(self):
+    def dump_bitmap_dir_entry(self, dump_json=None):
         print()
         print(f'{"Bitmap name":<25} {self.name}')
         for fl in self.bitmap_flags:
@@ -296,13 +296,13 @@ class QcowHeaderExtension(Qcow2Struct):
         else:
             self.obj = None
 
-    def dump(self):
+    def dump(self, dump_json=None):
         super().dump()
 
         if self.obj is None:
             print(f'{"data":<25} {self.data_str}')
         else:
-            self.obj.dump()
+            self.obj.dump(dump_json)
 
     @classmethod
     def create(cls, magic, data):
@@ -405,8 +405,8 @@ class QcowHeader(Qcow2Struct):
         buf = buf[0:header_bytes-1]
         fd.write(buf)
 
-    def dump_extensions(self):
+    def dump_extensions(self, dump_json=None):
         for ex in self.extensions:
             print('Header extension:')
-            ex.dump()
+            ex.dump(dump_json)
             print()
-- 
1.8.3.1


