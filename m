Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E40FD7ED5
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Oct 2019 20:23:49 +0200 (CEST)
Received: from localhost ([::1]:56024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKRU4-000071-7f
	for lists+qemu-devel@lfdr.de; Tue, 15 Oct 2019 14:23:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59676)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1iKRR6-0005ol-9K
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 14:20:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1iKRR4-0001T0-Tg
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 14:20:44 -0400
Received: from relay.sw.ru ([185.231.240.75]:35002)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1iKRR4-0001RI-LK; Tue, 15 Oct 2019 14:20:42 -0400
Received: from [172.16.25.136] (helo=dhcp-172-16-25-136.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1iKRQz-0003ry-Co; Tue, 15 Oct 2019 21:20:37 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH v3 5/5] tests/qemu-iotests: add case for block-stream compress
Date: Tue, 15 Oct 2019 21:20:25 +0300
Message-Id: <1571163625-642312-6-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1571163625-642312-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1571163625-642312-1-git-send-email-andrey.shinkevich@virtuozzo.com>
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
Cc: kwolf@redhat.com, fam@euphon.net, vsementsov@virtuozzo.com,
 armbru@redhat.com, mreitz@redhat.com, stefanha@redhat.com,
 andrey.shinkevich@virtuozzo.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a case to the iotest #030 that tests the 'compress' option for a
block-stream job.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 tests/qemu-iotests/030     | 51 +++++++++++++++++++++++++++++++++++++++++++++-
 tests/qemu-iotests/030.out |  4 ++--
 2 files changed, 52 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/030 b/tests/qemu-iotests/030
index f3766f2..f0f0e26 100755
--- a/tests/qemu-iotests/030
+++ b/tests/qemu-iotests/030
@@ -21,7 +21,8 @@
 import time
 import os
 import iotests
-from iotests import qemu_img, qemu_io
+from iotests import qemu_img, qemu_io, qemu_img_pipe
+import json
 
 backing_img = os.path.join(iotests.test_dir, 'backing.img')
 mid_img = os.path.join(iotests.test_dir, 'mid.img')
@@ -956,6 +957,54 @@ class TestSetSpeed(iotests.QMPTestCase):
 
         self.cancel_and_wait(resume=True)
 
+class TestCompressed(iotests.QMPTestCase):
+    test_img_init_size = 0
+
+    def setUp(self):
+        qemu_img('create', '-f', iotests.imgfmt, backing_img, '1M')
+        qemu_img('create', '-f', iotests.imgfmt, '-o',
+                 'backing_file=%s' % backing_img, mid_img)
+        qemu_img('create', '-f', iotests.imgfmt, '-o',
+                 'backing_file=%s' % mid_img, test_img)
+        qemu_io('-c', 'write -P 0x1 0 512k', backing_img)
+        top = json.loads(qemu_img_pipe('info', '--output=json', test_img))
+        self.test_img_init_size = top['actual-size']
+        self.vm = iotests.VM().add_drive(test_img, "backing.node-name=mid," +
+                                         "backing.backing.node-name=base," +
+                                         "compress=on")
+        self.vm.launch()
+
+    def tearDown(self):
+        self.vm.shutdown()
+        os.remove(test_img)
+        os.remove(mid_img)
+        os.remove(backing_img)
+
+    def test_stream_compress(self):
+        self.assert_no_active_block_jobs()
+
+        result = self.vm.qmp('block-stream', device='mid', job_id='stream-mid')
+        self.assert_qmp(result, 'return', {})
+
+        self.wait_until_completed(drive='stream-mid')
+        # Remove other 'JOB_STATUS_CHANGE' events for the job 'stream-mid'
+        self.vm.get_qmp_events(wait=True)
+
+        result = self.vm.qmp('block-stream', device='drive0',
+                             job_id='stream-top')
+        self.assert_qmp(result, 'return', {})
+
+        self.wait_until_completed(drive='stream-top')
+        self.vm.shutdown()
+
+        top = json.loads(qemu_img_pipe('info', '--output=json', test_img))
+        mid = json.loads(qemu_img_pipe('info', '--output=json', mid_img))
+        base = json.loads(qemu_img_pipe('info', '--output=json', backing_img))
+
+        self.assertEqual(mid['actual-size'], base['actual-size'])
+        self.assertLess(top['actual-size'], mid['actual-size'])
+        self.assertLess(self.test_img_init_size, top['actual-size'])
+
 if __name__ == '__main__':
     iotests.main(supported_fmts=['qcow2', 'qed'],
                  supported_protocols=['file'])
diff --git a/tests/qemu-iotests/030.out b/tests/qemu-iotests/030.out
index 6d9bee1..af8dac1 100644
--- a/tests/qemu-iotests/030.out
+++ b/tests/qemu-iotests/030.out
@@ -1,5 +1,5 @@
-...........................
+............................
 ----------------------------------------------------------------------
-Ran 27 tests
+Ran 28 tests
 
 OK
-- 
1.8.3.1


