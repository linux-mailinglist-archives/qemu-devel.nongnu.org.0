Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2339120A266
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jun 2020 17:51:47 +0200 (CEST)
Received: from localhost ([::1]:60102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joUAE-00055m-0a
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 11:51:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1joTjO-00073r-Tg
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 11:24:06 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:20230
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1joTjL-0001Yi-Ul
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 11:24:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593098639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m8B92WjrExLEMrCAW5AW2cnw2+Wtezd3CD14wIf7oGo=;
 b=FeQTAgR2cl9Javnz5iLYkxz57H1NGTwp5IoohTpMuP3X4+IHXtxf74VZAq95m3TugmBG8R
 FdigDYoY6xHj1s/7W2eXrnmsmnNcIAjzhi5LiZury5vUfsxFDWFemBC0Z3PBfKkn82EziP
 fQsLBgGECUxJ0+01wumarRX+75JVgeE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-HksOnrBYPwG08QDxt1vEpQ-1; Thu, 25 Jun 2020 11:23:57 -0400
X-MC-Unique: HksOnrBYPwG08QDxt1vEpQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4CB7C8015FD;
 Thu, 25 Jun 2020 15:23:56 +0000 (UTC)
Received: from localhost (ovpn-113-182.ams2.redhat.com [10.36.113.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C121917D9C;
 Thu, 25 Jun 2020 15:23:55 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 44/47] iotests: Add filter commit test cases
Date: Thu, 25 Jun 2020 17:22:12 +0200
Message-Id: <20200625152215.941773-45-mreitz@redhat.com>
In-Reply-To: <20200625152215.941773-1-mreitz@redhat.com>
References: <20200625152215.941773-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/25 00:45:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds some tests on how commit copes with filter nodes.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/040     | 177 +++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/040.out |   4 +-
 2 files changed, 179 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/040 b/tests/qemu-iotests/040
index 32c82b4ec6..e7fa244738 100755
--- a/tests/qemu-iotests/040
+++ b/tests/qemu-iotests/040
@@ -713,6 +713,183 @@ class TestErrorHandling(iotests.QMPTestCase):
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
+                             '-c', '{} -P {} {}M 1M'.format(read_or_write,
+                                                            index + 1, index),
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
2.26.2


