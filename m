Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CA925F9A4
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Sep 2020 13:38:49 +0200 (CEST)
Received: from localhost ([::1]:34248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFFU0-0003Fv-1l
	for lists+qemu-devel@lfdr.de; Mon, 07 Sep 2020 07:38:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kFF3B-00047i-4B
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 07:11:05 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:35555
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kFF37-0008Il-8F
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 07:11:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599477060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5nmrVRJIfL3D2vBxS45cCHI7EEkQMg5DdPXGtTCD73U=;
 b=Jl1+howg0lbEz6EXW/DXufwLdYNvIMzUW1mLyNVJziWnyp+HgTnBrUBFJnb9eM/xNcjyac
 CFDPy8G0UzycmbvMrY9z6oliUtQ9kVp8UcBOGUMBXWBhJQ/6ldekGJjs+ti4jH3h+OFdpB
 J8a5/s9AVeRcc733DsaI0rLPbPtEinY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-oCbafpj2MVGXKO_TYSXaQA-1; Mon, 07 Sep 2020 07:10:58 -0400
X-MC-Unique: oCbafpj2MVGXKO_TYSXaQA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 353791084C85;
 Mon,  7 Sep 2020 11:10:57 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-114-154.ams2.redhat.com
 [10.36.114.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 33F137E435;
 Mon,  7 Sep 2020 11:10:56 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 56/64] iotests: Add filter commit test cases
Date: Mon,  7 Sep 2020 13:09:28 +0200
Message-Id: <20200907110936.261684-57-kwolf@redhat.com>
In-Reply-To: <20200907110936.261684-1-kwolf@redhat.com>
References: <20200907110936.261684-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/06 22:29:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

This patch adds some tests on how commit copes with filter nodes.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/040     | 177 +++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/040.out |   4 +-
 2 files changed, 179 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/040 b/tests/qemu-iotests/040
index f58f50d023..71c6d7f621 100755
--- a/tests/qemu-iotests/040
+++ b/tests/qemu-iotests/040
@@ -734,6 +734,183 @@ class TestErrorHandling(iotests.QMPTestCase):
         self.assertTrue(iotests.compare_images(mid_img, backing_img, fmt2='raw'),
                         'target image does not match source after commit')
 
+class TestCommitWithFilters(iotests.QMPTestCase):
+    img0 = os.path.join(iotests.test_dir, '0.img')
+    img1 = os.path.join(iotests.test_dir, '1.img')
+    img2 = os.path.join(iotests.test_dir, '2.img')
+    img3 = os.path.join(iotests.test_dir, '3.img')
+
+    def do_test_io(self, read_or_write):
+        for index, pattern_file in enumerate(self.pattern_files):
+            result = qemu_io('-f', iotests.imgfmt,
+                             '-c',
+                             f'{read_or_write} -P {index + 1} {index}M 1M',
+                             pattern_file)
+            self.assertFalse('Pattern verification failed' in result)
+
+    def setUp(self):
+        qemu_img('create', '-f', iotests.imgfmt, self.img0, '64M')
+        qemu_img('create', '-f', iotests.imgfmt, self.img1, '64M')
+        qemu_img('create', '-f', iotests.imgfmt, self.img2, '64M')
+        qemu_img('create', '-f', iotests.imgfmt, self.img3, '64M')
+
+        # Distributions of the patterns in the files; this is checked
+        # by tearDown() and should be changed by the test cases as is
+        # necessary
+        self.pattern_files = [self.img0, self.img1, self.img2, self.img3]
+
+        self.do_test_io('write')
+
+        self.vm = iotests.VM()
+        self.vm.launch()
+
+        result = self.vm.qmp('object-add', qom_type='throttle-group', id='tg')
+        self.assert_qmp(result, 'return', {})
+
+        result = self.vm.qmp('blockdev-add', **{
+                'node-name': 'top-filter',
+                'driver': 'throttle',
+                'throttle-group': 'tg',
+                'file': {
+                    'node-name': 'cow-3',
+                    'driver': iotests.imgfmt,
+                    'file': {
+                        'driver': 'file',
+                        'filename': self.img3
+                    },
+                    'backing': {
+                        'node-name': 'cow-2',
+                        'driver': iotests.imgfmt,
+                        'file': {
+                            'driver': 'file',
+                            'filename': self.img2
+                        },
+                        'backing': {
+                            'node-name': 'cow-1',
+                            'driver': iotests.imgfmt,
+                            'file': {
+                                'driver': 'file',
+                                'filename': self.img1
+                            },
+                            'backing': {
+                                'node-name': 'bottom-filter',
+                                'driver': 'throttle',
+                                'throttle-group': 'tg',
+                                'file': {
+                                    'node-name': 'cow-0',
+                                    'driver': iotests.imgfmt,
+                                    'file': {
+                                        'driver': 'file',
+                                        'filename': self.img0
+                                    }
+                                }
+                            }
+                        }
+                    }
+                }
+            })
+        self.assert_qmp(result, 'return', {})
+
+    def tearDown(self):
+        self.vm.shutdown()
+        self.do_test_io('read')
+
+        os.remove(self.img3)
+        os.remove(self.img2)
+        os.remove(self.img1)
+        os.remove(self.img0)
+
+    # Filters make for funny filenames, so we cannot just use
+    # self.imgX to get them
+    def get_filename(self, node):
+        return self.vm.node_info(node)['image']['filename']
+
+    def test_filterless_commit(self):
+        result = self.vm.qmp('block-commit',
+                             job_id='commit',
+                             device='top-filter',
+                             top_node='cow-2',
+                             base_node='cow-1')
+        self.assert_qmp(result, 'return', {})
+        self.wait_until_completed(drive='commit')
+
+        self.assertIsNotNone(self.vm.node_info('cow-3'))
+        self.assertIsNone(self.vm.node_info('cow-2'))
+        self.assertIsNotNone(self.vm.node_info('cow-1'))
+
+        # 2 has been comitted into 1
+        self.pattern_files[2] = self.img1
+
+    def test_commit_through_filter(self):
+        result = self.vm.qmp('block-commit',
+                             job_id='commit',
+                             device='top-filter',
+                             top_node='cow-1',
+                             base_node='cow-0')
+        self.assert_qmp(result, 'return', {})
+        self.wait_until_completed(drive='commit')
+
+        self.assertIsNotNone(self.vm.node_info('cow-2'))
+        self.assertIsNone(self.vm.node_info('cow-1'))
+        self.assertIsNone(self.vm.node_info('bottom-filter'))
+        self.assertIsNotNone(self.vm.node_info('cow-0'))
+
+        # 1 has been comitted into 0
+        self.pattern_files[1] = self.img0
+
+    def test_filtered_active_commit_with_filter(self):
+        # Add a device, so the commit job finds a parent it can change
+        # to point to the base node (so we can test that top-filter is
+        # dropped from the graph)
+        result = self.vm.qmp('device_add', id='drv0', driver='virtio-blk',
+                             drive='top-filter')
+        self.assert_qmp(result, 'return', {})
+
+        # Try to release our reference to top-filter; that should not
+        # work because drv0 uses it
+        result = self.vm.qmp('blockdev-del', node_name='top-filter')
+        self.assert_qmp(result, 'error/class', 'GenericError')
+        self.assert_qmp(result, 'error/desc', 'Node top-filter is in use')
+
+        result = self.vm.qmp('block-commit',
+                             job_id='commit',
+                             device='top-filter',
+                             base_node='cow-2')
+        self.assert_qmp(result, 'return', {})
+        self.complete_and_wait(drive='commit')
+
+        # Try to release our reference to top-filter again
+        result = self.vm.qmp('blockdev-del', node_name='top-filter')
+        self.assert_qmp(result, 'return', {})
+
+        self.assertIsNone(self.vm.node_info('top-filter'))
+        self.assertIsNone(self.vm.node_info('cow-3'))
+        self.assertIsNotNone(self.vm.node_info('cow-2'))
+
+        # Check that drv0 is now connected to cow-2
+        blockdevs = self.vm.qmp('query-block')['return']
+        drv0 = next(dev for dev in blockdevs if '/drv0' in dev['qdev'])
+        self.assertEqual(drv0['inserted']['node-name'], 'cow-2')
+
+        # 3 has been comitted into 2
+        self.pattern_files[3] = self.img2
+
+    def test_filtered_active_commit_without_filter(self):
+        result = self.vm.qmp('block-commit',
+                             job_id='commit',
+                             device='top-filter',
+                             top_node='cow-3',
+                             base_node='cow-2')
+        self.assert_qmp(result, 'return', {})
+        self.complete_and_wait(drive='commit')
+
+        self.assertIsNotNone(self.vm.node_info('top-filter'))
+        self.assertIsNone(self.vm.node_info('cow-3'))
+        self.assertIsNotNone(self.vm.node_info('cow-2'))
+
+        # 3 has been comitted into 2
+        self.pattern_files[3] = self.img2
+
 if __name__ == '__main__':
     iotests.main(supported_fmts=['qcow2', 'qed'],
                  supported_protocols=['file'])
diff --git a/tests/qemu-iotests/040.out b/tests/qemu-iotests/040.out
index 6a917130b6..4823c113d5 100644
--- a/tests/qemu-iotests/040.out
+++ b/tests/qemu-iotests/040.out
@@ -1,5 +1,5 @@
-...........................................................
+...............................................................
 ----------------------------------------------------------------------
-Ran 59 tests
+Ran 63 tests
 
 OK
-- 
2.25.4


