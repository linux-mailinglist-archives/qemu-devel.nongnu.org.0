Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 910AF2DE66C
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 16:22:00 +0100 (CET)
Received: from localhost ([::1]:60702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqHZv-00035B-Hq
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 10:21:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqHRs-0002eC-Um
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:13:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqHRm-0005RN-Hb
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:13:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608304413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6ErUEnaNKG6/qSd1Y8m/jb6ba8DX2JHoW//aeqtNNhg=;
 b=CYvsghTa9JO7k80Y8wNLiSob5sBsArkFBOwrUm6NR9IODGwHedOIHiZn0Dulr0d8nPwCmi
 Fob7DrTyHqUdzfxTdpjy2oewrohQeR9ds4JSIo2d0NmAOINfqGmluAGwKHtaErjH5iDqON
 XvJFQ+CEvxbf/PDU/9ePKf/fUsGkvrQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-IOmWYGXmO8OeNuXdUo5yAw-1; Fri, 18 Dec 2020 10:13:29 -0500
X-MC-Unique: IOmWYGXmO8OeNuXdUo5yAw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 918CA1005D4E;
 Fri, 18 Dec 2020 15:13:28 +0000 (UTC)
Received: from localhost (ovpn-114-84.ams2.redhat.com [10.36.114.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0666C2998C;
 Fri, 18 Dec 2020 15:13:27 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 16/30] iotests: add 298 to test new preallocate filter driver
Date: Fri, 18 Dec 2020 16:12:35 +0100
Message-Id: <20201218151249.715731-17-mreitz@redhat.com>
In-Reply-To: <20201218151249.715731-1-mreitz@redhat.com>
References: <20201218151249.715731-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20201021145859.11201-13-vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/298     | 186 +++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/298.out |   5 +
 tests/qemu-iotests/group   |   1 +
 3 files changed, 192 insertions(+)
 create mode 100644 tests/qemu-iotests/298
 create mode 100644 tests/qemu-iotests/298.out

diff --git a/tests/qemu-iotests/298 b/tests/qemu-iotests/298
new file mode 100644
index 0000000000..d535946b5f
--- /dev/null
+++ b/tests/qemu-iotests/298
@@ -0,0 +1,186 @@
+#!/usr/bin/env python3
+#
+# Test for preallocate filter
+#
+# Copyright (c) 2020 Virtuozzo International GmbH.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+#
+
+import os
+import iotests
+
+MiB = 1024 * 1024
+disk = os.path.join(iotests.test_dir, 'disk')
+overlay = os.path.join(iotests.test_dir, 'overlay')
+refdisk = os.path.join(iotests.test_dir, 'refdisk')
+drive_opts = f'node-name=disk,driver={iotests.imgfmt},' \
+    f'file.node-name=filter,file.driver=preallocate,' \
+    f'file.file.node-name=file,file.file.filename={disk}'
+
+
+class TestPreallocateBase(iotests.QMPTestCase):
+    def setUp(self):
+        iotests.qemu_img_create('-f', iotests.imgfmt, disk, str(10 * MiB))
+
+    def tearDown(self):
+        try:
+            self.check_small()
+            check = iotests.qemu_img_check(disk)
+            self.assertFalse('leaks' in check)
+            self.assertFalse('corruptions' in check)
+            self.assertEqual(check['check-errors'], 0)
+        finally:
+            os.remove(disk)
+
+    def check_big(self):
+        self.assertTrue(os.path.getsize(disk) > 100 * MiB)
+
+    def check_small(self):
+        self.assertTrue(os.path.getsize(disk) < 10 * MiB)
+
+
+class TestQemuImg(TestPreallocateBase):
+    def test_qemu_img(self):
+        p = iotests.QemuIoInteractive('--image-opts', drive_opts)
+
+        p.cmd('write 0 1M')
+        p.cmd('flush')
+
+        self.check_big()
+
+        p.close()
+
+
+class TestPreallocateFilter(TestPreallocateBase):
+    def setUp(self):
+        super().setUp()
+        self.vm = iotests.VM().add_drive(path=None, opts=drive_opts)
+        self.vm.launch()
+
+    def tearDown(self):
+        self.vm.shutdown()
+        super().tearDown()
+
+    def test_prealloc(self):
+        self.vm.hmp_qemu_io('drive0', 'write 0 1M')
+        self.check_big()
+
+    def test_external_snapshot(self):
+        self.test_prealloc()
+
+        result = self.vm.qmp('blockdev-snapshot-sync', node_name='disk',
+                             snapshot_file=overlay,
+                             snapshot_node_name='overlay')
+        self.assert_qmp(result, 'return', {})
+
+        # on reopen to  r-o base preallocation should be dropped
+        self.check_small()
+
+        self.vm.hmp_qemu_io('drive0', 'write 1M 1M')
+
+        result = self.vm.qmp('block-commit', device='overlay')
+        self.assert_qmp(result, 'return', {})
+        self.complete_and_wait()
+
+        # commit of new megabyte should trigger preallocation
+        self.check_big()
+
+    def test_reopen_opts(self):
+        result = self.vm.qmp('x-blockdev-reopen', **{
+            'node-name': 'disk',
+            'driver': iotests.imgfmt,
+            'file': {
+                'node-name': 'filter',
+                'driver': 'preallocate',
+                'prealloc-size': 20 * MiB,
+                'prealloc-align': 5 * MiB,
+                'file': {
+                    'node-name': 'file',
+                    'driver': 'file',
+                    'filename': disk
+                }
+            }
+        })
+        self.assert_qmp(result, 'return', {})
+
+        self.vm.hmp_qemu_io('drive0', 'write 0 1M')
+        self.assertTrue(os.path.getsize(disk) == 25 * MiB)
+
+
+class TestTruncate(iotests.QMPTestCase):
+    def setUp(self):
+        iotests.qemu_img_create('-f', iotests.imgfmt, disk, str(10 * MiB))
+        iotests.qemu_img_create('-f', iotests.imgfmt, refdisk, str(10 * MiB))
+
+    def tearDown(self):
+        os.remove(disk)
+        os.remove(refdisk)
+
+    def do_test(self, prealloc_mode, new_size):
+        ret = iotests.qemu_io_silent('--image-opts', '-c', 'write 0 10M', '-c',
+                                     f'truncate -m {prealloc_mode} {new_size}',
+                                     drive_opts)
+        self.assertEqual(ret, 0)
+
+        ret = iotests.qemu_io_silent('-f', iotests.imgfmt, '-c', 'write 0 10M',
+                                     '-c',
+                                     f'truncate -m {prealloc_mode} {new_size}',
+                                     refdisk)
+        self.assertEqual(ret, 0)
+
+        stat = os.stat(disk)
+        refstat = os.stat(refdisk)
+
+        # Probably we'll want preallocate filter to keep align to cluster when
+        # shrink preallocation, so, ignore small differece
+        self.assertLess(abs(stat.st_size - refstat.st_size), 64 * 1024)
+
+        # Preallocate filter may leak some internal clusters (for example, if
+        # guest write far over EOF, skipping some clusters - they will remain
+        # fallocated, preallocate filter don't care about such leaks, it drops
+        # only trailing preallocation.
+        self.assertLess(abs(stat.st_blocks - refstat.st_blocks) * 512,
+                        1024 * 1024)
+
+    def test_real_shrink(self):
+        self.do_test('off', '5M')
+
+    def test_truncate_inside_preallocated_area__falloc(self):
+        self.do_test('falloc', '50M')
+
+    def test_truncate_inside_preallocated_area__metadata(self):
+        self.do_test('metadata', '50M')
+
+    def test_truncate_inside_preallocated_area__full(self):
+        self.do_test('full', '50M')
+
+    def test_truncate_inside_preallocated_area__off(self):
+        self.do_test('off', '50M')
+
+    def test_truncate_over_preallocated_area__falloc(self):
+        self.do_test('falloc', '150M')
+
+    def test_truncate_over_preallocated_area__metadata(self):
+        self.do_test('metadata', '150M')
+
+    def test_truncate_over_preallocated_area__full(self):
+        self.do_test('full', '150M')
+
+    def test_truncate_over_preallocated_area__off(self):
+        self.do_test('off', '150M')
+
+
+if __name__ == '__main__':
+    iotests.main(supported_fmts=['qcow2'], required_fmts=['preallocate'])
diff --git a/tests/qemu-iotests/298.out b/tests/qemu-iotests/298.out
new file mode 100644
index 0000000000..fa16b5ccef
--- /dev/null
+++ b/tests/qemu-iotests/298.out
@@ -0,0 +1,5 @@
+.............
+----------------------------------------------------------------------
+Ran 13 tests
+
+OK
diff --git a/tests/qemu-iotests/group b/tests/qemu-iotests/group
index 9a8394b4cd..614d58369e 100644
--- a/tests/qemu-iotests/group
+++ b/tests/qemu-iotests/group
@@ -307,6 +307,7 @@
 295 rw
 296 rw
 297 meta
+298
 299 auto quick
 300 migration
 301 backing quick
-- 
2.29.2


