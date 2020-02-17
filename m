Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B5E161599
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Feb 2020 16:09:52 +0100 (CET)
Received: from localhost ([::1]:46850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3i1v-0007xh-Ku
	for lists+qemu-devel@lfdr.de; Mon, 17 Feb 2020 10:09:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38975)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1j3hvM-00044I-Vw
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 10:03:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1j3hvK-0007O2-B9
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 10:03:04 -0500
Received: from relay.sw.ru ([185.231.240.75]:47426)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1j3hvK-0007LC-1o; Mon, 17 Feb 2020 10:03:02 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1j3hvG-0007Zt-Lw; Mon, 17 Feb 2020 18:02:58 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/22] qemu-iotests/199: change discard patterns
Date: Mon, 17 Feb 2020 18:02:40 +0300
Message-Id: <20200217150246.29180-17-vsementsov@virtuozzo.com>
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

iotest 40 works too long because of many discard opertion. On the same
time, postcopy period is very short, in spite of all these efforts.

So, let's use less discards (and with more interesting patterns) to
reduce test timing. In the next commit we'll increase postcopy period.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/199 | 44 +++++++++++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 18 deletions(-)

diff --git a/tests/qemu-iotests/199 b/tests/qemu-iotests/199
index d78f81b71c..7914fd0b2b 100755
--- a/tests/qemu-iotests/199
+++ b/tests/qemu-iotests/199
@@ -30,6 +30,28 @@ size = '256G'
 fifo = os.path.join(iotests.test_dir, 'mig_fifo')
 
 
+GiB = 1024 * 1024 * 1024
+
+discards1 = (
+    (0, GiB),
+    (2 * GiB + 512 * 5, 512),
+    (3 * GiB + 512 * 5, 512),
+    (100 * GiB, GiB)
+)
+
+discards2 = (
+    (3 * GiB + 512 * 8, 512),
+    (4 * GiB + 512 * 8, 512),
+    (50 * GiB, GiB),
+    (100 * GiB + GiB // 2, GiB)
+)
+
+
+def apply_discards(vm, discards):
+    for d in discards:
+        vm.hmp_qemu_io('drive0', 'discard {} {}'.format(*d))
+
+
 def event_seconds(event):
     return event['timestamp']['seconds'] + \
         event['timestamp']['microseconds'] / 1000000.0
@@ -80,9 +102,7 @@ class TestDirtyBitmapPostcopyMigration(iotests.QMPTestCase):
         self.vm_b_events = []
 
     def test_postcopy(self):
-        discard_size = 0x40000000
         granularity = 512
-        chunk = 4096
 
         result = self.vm_a.qmp('block-dirty-bitmap-add', node='drive0',
                                name='bitmap', granularity=granularity)
@@ -92,14 +112,7 @@ class TestDirtyBitmapPostcopyMigration(iotests.QMPTestCase):
                                node='drive0', name='bitmap')
         empty_sha256 = result['return']['sha256']
 
-        s = 0
-        while s < discard_size:
-            self.vm_a.hmp_qemu_io('drive0', 'discard %d %d' % (s, chunk))
-            s += 0x10000
-        s = 0x8000
-        while s < discard_size:
-            self.vm_a.hmp_qemu_io('drive0', 'discard %d %d' % (s, chunk))
-            s += 0x10000
+        apply_discards(self.vm_a, discards1 + discards2)
 
         result = self.vm_a.qmp('x-debug-block-dirty-bitmap-sha256',
                                node='drive0', name='bitmap')
@@ -111,10 +124,8 @@ class TestDirtyBitmapPostcopyMigration(iotests.QMPTestCase):
         result = self.vm_a.qmp('block-dirty-bitmap-clear', node='drive0',
                                name='bitmap')
         self.assert_qmp(result, 'return', {})
-        s = 0
-        while s < discard_size:
-            self.vm_a.hmp_qemu_io('drive0', 'discard %d %d' % (s, chunk))
-            s += 0x10000
+
+        apply_discards(self.vm_a, discards1)
 
         caps = [{'capability': 'dirty-bitmaps', 'state': True},
                 {'capability': 'events', 'state': True}]
@@ -134,10 +145,7 @@ class TestDirtyBitmapPostcopyMigration(iotests.QMPTestCase):
         e_resume = self.vm_b.event_wait('RESUME')
         self.vm_b_events.append(e_resume)
 
-        s = 0x8000
-        while s < discard_size:
-            self.vm_b.hmp_qemu_io('drive0', 'discard %d %d' % (s, chunk))
-            s += 0x10000
+        apply_discards(self.vm_b, discards2)
 
         match = {'data': {'status': 'completed'}}
         e_complete = self.vm_b.event_wait('MIGRATION', match=match)
-- 
2.21.0


