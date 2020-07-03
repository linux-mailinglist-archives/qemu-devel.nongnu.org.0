Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A593C213AB5
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 15:16:31 +0200 (CEST)
Received: from localhost ([::1]:38026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrLYM-0001EW-OW
	for lists+qemu-devel@lfdr.de; Fri, 03 Jul 2020 09:16:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jrLW3-0006uW-Qo; Fri, 03 Jul 2020 09:14:07 -0400
Received: from relay.sw.ru ([185.231.240.75]:60366 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jrLVw-0007eU-0t; Fri, 03 Jul 2020 09:14:07 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.93)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jrLVj-0004Vj-V0; Fri, 03 Jul 2020 16:13:48 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v8 08/10] qcow2.py: Introduce '-j' key to dump in JSON format
Date: Fri,  3 Jul 2020 16:13:48 +0300
Message-Id: <1593782030-521984-9-git-send-email-andrey.shinkevich@virtuozzo.com>
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

Add the command key to the qcow2.py arguments list to dump QCOW2
metadata in JSON format. Here is the suggested way to do that. The
implementation of the dump in JSON format is in the patch that follows.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 tests/qemu-iotests/qcow2.py        | 19 +++++++++++++++----
 tests/qemu-iotests/qcow2_format.py | 16 ++++++++--------
 2 files changed, 23 insertions(+), 12 deletions(-)

diff --git a/tests/qemu-iotests/qcow2.py b/tests/qemu-iotests/qcow2.py
index 0910e6a..7402279 100755
--- a/tests/qemu-iotests/qcow2.py
+++ b/tests/qemu-iotests/qcow2.py
@@ -26,16 +26,19 @@ from qcow2_format import (
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
@@ -134,6 +137,11 @@ cmds = [
 
 
 def main(filename, cmd, args):
+    global dump_json
+    dump_json = '-j' in sys.argv
+    if dump_json:
+        sys.argv.remove('-j')
+        args.remove('-j')
     fd = open(filename, "r+b")
     try:
         for name, handler, num_args, desc in cmds:
@@ -151,11 +159,14 @@ def main(filename, cmd, args):
 
 
 def usage():
-    print("Usage: %s <file> <cmd> [<arg>, ...]" % sys.argv[0])
+    print("Usage: %s <file> <cmd> [<arg>, ...] [<key>, ...]" % sys.argv[0])
     print("")
     print("Supported commands:")
     for name, handler, num_args, desc in cmds:
         print("    %-20s - %s" % (name, desc))
+    print("")
+    print("Supported keys:")
+    print("    %-20s - %s" % ('-j', 'Dump in JSON format'))
 
 
 if __name__ == '__main__':
diff --git a/tests/qemu-iotests/qcow2_format.py b/tests/qemu-iotests/qcow2_format.py
index b512f84..dae6b6e 100644
--- a/tests/qemu-iotests/qcow2_format.py
+++ b/tests/qemu-iotests/qcow2_format.py
@@ -110,7 +110,7 @@ class Qcow2Struct(metaclass=Qcow2StructMeta):
         self.__dict__ = dict((field[2], values[i])
                              for i, field in enumerate(self.fields))
 
-    def dump(self):
+    def dump(self, dump_json=None):
         for f in self.fields:
             value = self.__dict__[f[2]]
             if isinstance(f[1], str):
@@ -141,8 +141,8 @@ class Qcow2BitmapExt(Qcow2Struct):
             [Qcow2BitmapDirEntry(fd, cluster_size=self.cluster_size)
              for _ in range(self.nb_bitmaps)]
 
-    def dump(self):
-        super().dump()
+    def dump(self, dump_json=None):
+        super().dump(dump_json)
         for entry in self.bitmap_directory:
             print()
             entry.dump()
@@ -186,7 +186,7 @@ class Qcow2BitmapDirEntry(Qcow2Struct):
         self.bitmap_table = Qcow2BitmapTable(raw_table=table,
                                              cluster_size=self.cluster_size)
 
-    def dump(self):
+    def dump(self, dump_json=None):
         print(f'{"Bitmap name":<25} {self.name}')
         super(Qcow2BitmapDirEntry, self).dump()
         self.bitmap_table.dump()
@@ -294,13 +294,13 @@ class QcowHeaderExtension(Qcow2Struct):
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
@@ -399,8 +399,8 @@ class QcowHeader(Qcow2Struct):
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


