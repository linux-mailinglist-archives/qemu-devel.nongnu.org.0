Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3AF1615CA
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Feb 2020 16:13:02 +0100 (CET)
Received: from localhost ([::1]:46936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3i4z-0005q3-Q0
	for lists+qemu-devel@lfdr.de; Mon, 17 Feb 2020 10:13:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38916)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1j3hvL-000444-MF
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 10:03:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1j3hvK-0007ND-7B
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 10:03:03 -0500
Received: from relay.sw.ru ([185.231.240.75]:47452)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1j3hvJ-0007LK-Un; Mon, 17 Feb 2020 10:03:02 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1j3hvG-0007Zt-CA; Mon, 17 Feb 2020 18:02:58 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/22] qemu-iotests/199: improve performance: set bitmap by
 discard
Date: Mon, 17 Feb 2020 18:02:39 +0300
Message-Id: <20200217150246.29180-16-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200217150246.29180-1-vsementsov@virtuozzo.com>
References: <20200217150246.29180-1-vsementsov@virtuozzo.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, vsementsov@virtuozzo.com,
 qemu-block@nongnu.org, quintela@redhat.com, dgilbert@redhat.com,
 Max Reitz <mreitz@redhat.com>, andrey.shinkevich@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Discard dirties dirty-bitmap as well as write, but works faster. Let's
use it instead.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/199 | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/tests/qemu-iotests/199 b/tests/qemu-iotests/199
index 6599fc6fb4..d78f81b71c 100755
--- a/tests/qemu-iotests/199
+++ b/tests/qemu-iotests/199
@@ -67,8 +67,10 @@ class TestDirtyBitmapPostcopyMigration(iotests.QMPTestCase):
         os.mkfifo(fifo)
         qemu_img('create', '-f', iotests.imgfmt, disk_a, size)
         qemu_img('create', '-f', iotests.imgfmt, disk_b, size)
-        self.vm_a = iotests.VM(path_suffix='a').add_drive(disk_a)
-        self.vm_b = iotests.VM(path_suffix='b').add_drive(disk_b)
+        self.vm_a = iotests.VM(path_suffix='a').add_drive(disk_a,
+                                                          'discard=unmap')
+        self.vm_b = iotests.VM(path_suffix='b').add_drive(disk_b,
+                                                          'discard=unmap')
         self.vm_b.add_incoming("exec: cat '" + fifo + "'")
         self.vm_a.launch()
         self.vm_b.launch()
@@ -78,7 +80,7 @@ class TestDirtyBitmapPostcopyMigration(iotests.QMPTestCase):
         self.vm_b_events = []
 
     def test_postcopy(self):
-        write_size = 0x40000000
+        discard_size = 0x40000000
         granularity = 512
         chunk = 4096
 
@@ -86,25 +88,32 @@ class TestDirtyBitmapPostcopyMigration(iotests.QMPTestCase):
                                name='bitmap', granularity=granularity)
         self.assert_qmp(result, 'return', {})
 
+        result = self.vm_a.qmp('x-debug-block-dirty-bitmap-sha256',
+                               node='drive0', name='bitmap')
+        empty_sha256 = result['return']['sha256']
+
         s = 0
-        while s < write_size:
-            self.vm_a.hmp_qemu_io('drive0', 'write %d %d' % (s, chunk))
+        while s < discard_size:
+            self.vm_a.hmp_qemu_io('drive0', 'discard %d %d' % (s, chunk))
             s += 0x10000
         s = 0x8000
-        while s < write_size:
-            self.vm_a.hmp_qemu_io('drive0', 'write %d %d' % (s, chunk))
+        while s < discard_size:
+            self.vm_a.hmp_qemu_io('drive0', 'discard %d %d' % (s, chunk))
             s += 0x10000
 
         result = self.vm_a.qmp('x-debug-block-dirty-bitmap-sha256',
                                node='drive0', name='bitmap')
         sha256 = result['return']['sha256']
 
+        # Check, that updating the bitmap by discards works
+        assert sha256 != empty_sha256
+
         result = self.vm_a.qmp('block-dirty-bitmap-clear', node='drive0',
                                name='bitmap')
         self.assert_qmp(result, 'return', {})
         s = 0
-        while s < write_size:
-            self.vm_a.hmp_qemu_io('drive0', 'write %d %d' % (s, chunk))
+        while s < discard_size:
+            self.vm_a.hmp_qemu_io('drive0', 'discard %d %d' % (s, chunk))
             s += 0x10000
 
         caps = [{'capability': 'dirty-bitmaps', 'state': True},
@@ -126,8 +135,8 @@ class TestDirtyBitmapPostcopyMigration(iotests.QMPTestCase):
         self.vm_b_events.append(e_resume)
 
         s = 0x8000
-        while s < write_size:
-            self.vm_b.hmp_qemu_io('drive0', 'write %d %d' % (s, chunk))
+        while s < discard_size:
+            self.vm_b.hmp_qemu_io('drive0', 'discard %d %d' % (s, chunk))
             s += 0x10000
 
         match = {'data': {'status': 'completed'}}
-- 
2.21.0


