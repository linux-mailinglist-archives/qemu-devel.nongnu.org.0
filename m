Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7449C23E32A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Aug 2020 22:29:21 +0200 (CEST)
Received: from localhost ([::1]:35898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3mVs-0003CZ-GD
	for lists+qemu-devel@lfdr.de; Thu, 06 Aug 2020 16:29:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1k3lgP-0002Tw-IK; Thu, 06 Aug 2020 15:36:09 -0400
Received: from relay.sw.ru ([185.231.240.75]:56478 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1k3lgK-0000Ks-NV; Thu, 06 Aug 2020 15:36:09 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.93)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1k3lgC-0003k9-0Y; Thu, 06 Aug 2020 22:35:56 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v13 08/11] qcow2.py: Introduce '-j' key to dump in JSON format
Date: Thu,  6 Aug 2020 22:35:54 +0300
Message-Id: <1596742557-320265-9-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1596742557-320265-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1596742557-320265-1-git-send-email-andrey.shinkevich@virtuozzo.com>
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.shinkevich@virtuozzo.com; helo=relay3.sw.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/06 15:35:59
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

Add the command key to the qcow2.py arguments list to dump QCOW2
metadata in JSON format. Here is the suggested way to do that. The
implementation of the dump in JSON format is in the patch that follows.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/qcow2.py        | 18 ++++++++++++++----
 tests/qemu-iotests/qcow2_format.py |  4 ++--
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/tests/qemu-iotests/qcow2.py b/tests/qemu-iotests/qcow2.py
index 0910e6a..77ca59c 100755
--- a/tests/qemu-iotests/qcow2.py
+++ b/tests/qemu-iotests/qcow2.py
@@ -26,16 +26,19 @@ from qcow2_format import (
 )
 
 
+is_json = False
+
+
 def cmd_dump_header(fd):
     h = QcowHeader(fd)
-    h.dump()
+    h.dump(is_json)
     print()
-    h.dump_extensions()
+    h.dump_extensions(is_json)
 
 
 def cmd_dump_header_exts(fd):
     h = QcowHeader(fd)
-    h.dump_extensions()
+    h.dump_extensions(is_json)
 
 
 def cmd_set_header(fd, name, value):
@@ -151,11 +154,14 @@ def main(filename, cmd, args):
 
 
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
@@ -163,4 +169,8 @@ if __name__ == '__main__':
         usage()
         sys.exit(1)
 
+    is_json = '-j' in sys.argv
+    if is_json:
+        sys.argv.remove('-j')
+
     main(sys.argv[1], sys.argv[2], sys.argv[3:])
diff --git a/tests/qemu-iotests/qcow2_format.py b/tests/qemu-iotests/qcow2_format.py
index 574249b..de0adcb 100644
--- a/tests/qemu-iotests/qcow2_format.py
+++ b/tests/qemu-iotests/qcow2_format.py
@@ -109,7 +109,7 @@ class Qcow2Struct(metaclass=Qcow2StructMeta):
         self.__dict__ = dict((field[2], values[i])
                              for i, field in enumerate(self.fields))
 
-    def dump(self):
+    def dump(self, is_json=False):
         for f in self.fields:
             value = self.__dict__[f[2]]
             if isinstance(f[1], str):
@@ -408,7 +408,7 @@ class QcowHeader(Qcow2Struct):
         buf = buf[0:header_bytes-1]
         fd.write(buf)
 
-    def dump_extensions(self):
+    def dump_extensions(self, is_json=False):
         for ex in self.extensions:
             print('Header extension:')
             ex.dump()
-- 
1.8.3.1


