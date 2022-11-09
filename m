Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3BB6230CF
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 17:57:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osoMI-0005sq-MH; Wed, 09 Nov 2022 11:55:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1osoM9-0005me-NQ
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 11:55:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1osoM6-0007Cn-Mt
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 11:55:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668012914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yr2WYAovp6EyKYty2HAlgQtGC2F574eMQsRRtaYymH8=;
 b=JI1rKU0zgEh+IKyNbbcp88BSKl+1OHCbnXMfqnOv6P7csrD5k2EOn2c69JWvSvA4NedJqI
 v+7fqjgx7HGnn9Foo+d7+bSlOanvN+kxMnOImOAi5yrd5W7aHYFZq+JWSqzAUwE9vDgiTP
 A2vO7xkVveeTQfSB1hVCT35FClke4DU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-183-IVcvoe-zOVy62wr2nGmclw-1; Wed, 09 Nov 2022 11:55:12 -0500
X-MC-Unique: IVcvoe-zOVy62wr2nGmclw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EFBF11C09B8A;
 Wed,  9 Nov 2022 16:55:00 +0000 (UTC)
Received: from localhost (unknown [10.39.195.15])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8CBFB2166B29;
 Wed,  9 Nov 2022 16:55:00 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PATCH for-7.2 4/5] iotests/151: Test that active mirror progresses
Date: Wed,  9 Nov 2022 17:54:51 +0100
Message-Id: <20221109165452.67927-5-hreitz@redhat.com>
In-Reply-To: <20221109165452.67927-1-hreitz@redhat.com>
References: <20221109165452.67927-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Before this series, a mirror job in write-blocking mode would pause
issuing background requests while active requests are in flight.  Thus,
if the source is constantly in use by active requests, no actual
progress can be made.

This series should have fixed that, making the mirror job issue
background requests even while active requests are in flight.

Have a new test case in 151 verify this.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/151     | 180 ++++++++++++++++++++++++++++++++++++-
 tests/qemu-iotests/151.out |   4 +-
 2 files changed, 181 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/151 b/tests/qemu-iotests/151
index 93d14193d0..0a052e5050 100755
--- a/tests/qemu-iotests/151
+++ b/tests/qemu-iotests/151
@@ -19,7 +19,10 @@
 # along with this program.  If not, see <http://www.gnu.org/licenses/>.
 #
 
+import math
 import os
+import subprocess
+from typing import List
 import iotests
 from iotests import qemu_img
 
@@ -50,7 +53,7 @@ class TestActiveMirror(iotests.QMPTestCase):
         self.vm = iotests.VM()
         self.vm.add_drive_raw(self.vm.qmp_to_opts(blk_source))
         self.vm.add_blockdev(self.vm.qmp_to_opts(blk_target))
-        self.vm.add_device('virtio-blk,drive=source')
+        self.vm.add_device('virtio-blk,id=vblk,drive=source')
         self.vm.launch()
 
     def tearDown(self):
@@ -192,6 +195,181 @@ class TestActiveMirror(iotests.QMPTestCase):
         self.potential_writes_in_flight = False
 
 
+class TestThrottledWithNbdExport(iotests.QMPTestCase):
+    image_len = 128 * 1024 * 1024  # MB
+    iops = 16
+    background_processes: List['subprocess.Popen[str]'] = []
+
+    def setUp(self):
+        qemu_img('create', '-f', iotests.imgfmt, source_img, '128M')
+        qemu_img('create', '-f', iotests.imgfmt, target_img, '128M')
+
+        self.vm = iotests.VM()
+        self.vm.launch()
+
+        result = self.vm.qmp('object-add', **{
+            'qom-type': 'throttle-group',
+            'id': 'thrgr',
+            'limits': {
+                'iops-total': self.iops,
+                'iops-total-max': self.iops
+            }
+        })
+        self.assert_qmp(result, 'return', {})
+
+        result = self.vm.qmp('blockdev-add', **{
+            'node-name': 'source-node',
+            'driver': 'throttle',
+            'throttle-group': 'thrgr',
+            'file': {
+                'driver': iotests.imgfmt,
+                'file': {
+                    'driver': 'file',
+                    'filename': source_img
+                }
+            }
+        })
+        self.assert_qmp(result, 'return', {})
+
+        result = self.vm.qmp('blockdev-add', **{
+            'node-name': 'target-node',
+            'driver': iotests.imgfmt,
+            'file': {
+                'driver': 'file',
+                'filename': target_img
+            }
+        })
+        self.assert_qmp(result, 'return', {})
+
+        self.nbd_sock = iotests.file_path('nbd.sock',
+                                          base_dir=iotests.sock_dir)
+        self.nbd_url = f'nbd+unix:///source-node?socket={self.nbd_sock}'
+
+        result = self.vm.qmp('nbd-server-start', addr={
+            'type': 'unix',
+            'data': {
+                'path': self.nbd_sock
+            }
+        })
+        self.assert_qmp(result, 'return', {})
+
+        result = self.vm.qmp('block-export-add', id='exp0', type='nbd',
+                             node_name='source-node', writable=True)
+        self.assert_qmp(result, 'return', {})
+
+    def tearDown(self):
+        # Wait for background requests to settle
+        try:
+            while True:
+                p = self.background_processes.pop()
+                while True:
+                    try:
+                        p.wait(timeout=0.0)
+                        break
+                    except subprocess.TimeoutExpired:
+                        self.vm.qtest(f'clock_step {1 * 1000 * 1000 * 1000}')
+        except IndexError:
+            pass
+
+        # Cancel ongoing block jobs
+        for job in self.vm.qmp('query-jobs')['return']:
+            self.vm.qmp('block-job-cancel', device=job['id'], force=True)
+
+        while True:
+            self.vm.qtest(f'clock_step {1 * 1000 * 1000 * 1000}')
+            if len(self.vm.qmp('query-jobs')['return']) == 0:
+                break
+
+        self.vm.shutdown()
+        os.remove(source_img)
+        os.remove(target_img)
+
+    def testUnderLoad(self):
+        '''
+        Throttle the source node, then issue a whole bunch of external requests
+        while the mirror job (in write-blocking mode) is running.  We want to
+        see background requests being issued even while the source is under
+        full load by active writes, so that progress can be made towards READY.
+        '''
+
+        # Fill the first half of the source image; do not fill the second half,
+        # that is where we will have active requests occur.  This ensures that
+        # active mirroring itself will not directly contribute to the job's
+        # progress (because when the job was started, those areas were not
+        # intended to be copied, so active mirroring will only lead to not
+        # losing progress, but also not making any).
+        self.vm.hmp_qemu_io('source-node',
+                            f'aio_write -P 1 0 {self.image_len // 2}')
+        self.vm.qtest(f'clock_step {1 * 1000 * 1000 * 1000}')
+
+        # Launch the mirror job
+        mirror_buf_size = 65536
+        result = self.vm.qmp('blockdev-mirror',
+                             job_id='mirror',
+                             filter_node_name='mirror-node',
+                             device='source-node',
+                             target='target-node',
+                             sync='full',
+                             copy_mode='write-blocking',
+                             buf_size=mirror_buf_size)
+        self.assert_qmp(result, 'return', {})
+
+        # We create the external requests via qemu-io processes on the NBD
+        # server.  Have their offset start in the middle of the image so they
+        # do not overlap with the background requests (which start from the
+        # beginning).
+        active_request_offset = self.image_len // 2
+        active_request_len = 4096
+
+        # Create enough requests to saturate the node for 5 seconds
+        for _ in range(0, 5 * self.iops):
+            req = f'write -P 42 {active_request_offset} {active_request_len}'
+            active_request_offset += active_request_len
+            p = iotests.qemu_io_popen('-f', 'nbd', self.nbd_url, '-c', req)
+            self.background_processes += [p]
+
+        # Now advance the clock one I/O operation at a time by the 4 seconds
+        # (i.e. one less than 5).  We expect the mirror job to issue background
+        # operations here, even though active requests are still in flight.
+        # The active requests will take precedence, however, because they have
+        # been issued earlier than mirror's background requests.
+        # Once the active requests we have started above are done (i.e. after 5
+        # virtual seconds), we expect those background requests to be worked
+        # on.  We only advance 4 seconds here to avoid race conditions.
+        for _ in range(0, 4 * self.iops):
+            step = math.ceil(1 * 1000 * 1000 * 1000 / self.iops)
+            self.vm.qtest(f'clock_step {step}')
+
+        # Note how much remains to be done until the mirror job is finished
+        job_status = self.vm.qmp('query-jobs')['return'][0]
+        start_remaining = job_status['total-progress'] - \
+            job_status['current-progress']
+
+        # Create a whole bunch of more active requests
+        for _ in range(0, 10 * self.iops):
+            req = f'write -P 42 {active_request_offset} {active_request_len}'
+            active_request_offset += active_request_len
+            p = iotests.qemu_io_popen('-f', 'nbd', self.nbd_url, '-c', req)
+            self.background_processes += [p]
+
+        # Let the clock advance more.  After 1 second, as noted above, we
+        # expect the background requests to be worked on.  Give them a couple
+        # of seconds (specifically 4) to see their impact.
+        for _ in range(0, 5 * self.iops):
+            step = math.ceil(1 * 1000 * 1000 * 1000 / self.iops)
+            self.vm.qtest(f'clock_step {step}')
+
+        # Note how much remains to be done now.  We expect this number to be
+        # reduced thanks to those background requests.
+        job_status = self.vm.qmp('query-jobs')['return'][0]
+        end_remaining = job_status['total-progress'] - \
+            job_status['current-progress']
+
+        # See that indeed progress was being made on the job, even while the
+        # node was saturated with active requests
+        self.assertGreater(start_remaining - end_remaining, 0)
+
+
 if __name__ == '__main__':
     iotests.main(supported_fmts=['qcow2', 'raw'],
                  supported_protocols=['file'])
diff --git a/tests/qemu-iotests/151.out b/tests/qemu-iotests/151.out
index 89968f35d7..914e3737bd 100644
--- a/tests/qemu-iotests/151.out
+++ b/tests/qemu-iotests/151.out
@@ -1,5 +1,5 @@
-....
+.....
 ----------------------------------------------------------------------
-Ran 4 tests
+Ran 5 tests
 
 OK
-- 
2.36.1


