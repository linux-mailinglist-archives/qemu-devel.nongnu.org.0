Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6CFC07C2
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Sep 2019 16:41:12 +0200 (CEST)
Received: from localhost ([::1]:51778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDrQk-0007bV-LA
	for lists+qemu-devel@lfdr.de; Fri, 27 Sep 2019 10:41:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34564)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iDqCr-0003ho-Dy
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 09:22:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iDqCq-0000P5-60
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 09:22:45 -0400
Received: from relay.sw.ru ([185.231.240.75]:49752)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iDqCn-0000IU-5b; Fri, 27 Sep 2019 09:22:41 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iDpHy-0003za-06; Fri, 27 Sep 2019 15:23:58 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 3/9] iotests: add test-case to 165 to test reopening qcow2
 bitmaps to RW
Date: Fri, 27 Sep 2019 15:23:49 +0300
Message-Id: <20190927122355.7344-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190927122355.7344-1-vsementsov@virtuozzo.com>
References: <20190927122355.7344-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reopening bitmaps to RW was broken prior to previous commit. Check that
it works now.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/165     | 57 ++++++++++++++++++++++++++++++++++++--
 tests/qemu-iotests/165.out |  4 +--
 2 files changed, 57 insertions(+), 4 deletions(-)

diff --git a/tests/qemu-iotests/165 b/tests/qemu-iotests/165
index 5650dc7c87..951ea011a2 100755
--- a/tests/qemu-iotests/165
+++ b/tests/qemu-iotests/165
@@ -43,10 +43,10 @@ class TestPersistentDirtyBitmap(iotests.QMPTestCase):
         os.remove(disk)
 
     def mkVm(self):
-        return iotests.VM().add_drive(disk)
+        return iotests.VM().add_drive(disk, opts='node-name=node0')
 
     def mkVmRo(self):
-        return iotests.VM().add_drive(disk, opts='readonly=on')
+        return iotests.VM().add_drive(disk, opts='readonly=on,node-name=node0')
 
     def getSha256(self):
         result = self.vm.qmp('x-debug-block-dirty-bitmap-sha256',
@@ -102,6 +102,59 @@ class TestPersistentDirtyBitmap(iotests.QMPTestCase):
 
         self.vm.shutdown()
 
+    def test_reopen_rw(self):
+        self.vm = self.mkVm()
+        self.vm.launch()
+        self.qmpAddBitmap()
+
+        # Calculate hashes
+
+        self.writeRegions(regions1)
+        sha256_1 = self.getSha256()
+
+        self.writeRegions(regions2)
+        sha256_2 = self.getSha256()
+        assert sha256_1 != sha256_2 # Otherwise, it's not very interesting.
+
+        result = self.vm.qmp('block-dirty-bitmap-clear', node='drive0',
+                             name='bitmap0')
+        self.assert_qmp(result, 'return', {})
+
+        # Start with regions1
+
+        self.writeRegions(regions1)
+        assert sha256_1 == self.getSha256()
+
+        self.vm.shutdown()
+
+        self.vm = self.mkVmRo()
+        self.vm.launch()
+
+        assert sha256_1 == self.getSha256()
+
+        # Check that we are in RO mode and can't modify bitmap.
+        self.writeRegions(regions2)
+        assert sha256_1 == self.getSha256()
+
+        # Reopen to RW
+        result = self.vm.qmp('x-blockdev-reopen', **{
+            'node-name': 'node0',
+            'driver': iotests.imgfmt,
+            'file': {
+                'driver': 'file',
+                'filename': disk
+            },
+            'read-only': False
+        })
+        self.assert_qmp(result, 'return', {})
+
+        # Check that bitmap is reopened to RW and we can write to it.
+        self.writeRegions(regions2)
+        assert sha256_2 == self.getSha256()
+
+        self.vm.shutdown()
+
+
 if __name__ == '__main__':
     iotests.main(supported_fmts=['qcow2'],
                  supported_protocols=['file'])
diff --git a/tests/qemu-iotests/165.out b/tests/qemu-iotests/165.out
index ae1213e6f8..fbc63e62f8 100644
--- a/tests/qemu-iotests/165.out
+++ b/tests/qemu-iotests/165.out
@@ -1,5 +1,5 @@
-.
+..
 ----------------------------------------------------------------------
-Ran 1 tests
+Ran 2 tests
 
 OK
-- 
2.21.0


