Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEC531A605
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 21:27:18 +0100 (CET)
Received: from localhost ([::1]:41908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAf25-0008LU-Cj
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 15:27:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAery-0004Vu-IK
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 15:16:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAers-0003z0-MV
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 15:16:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613161003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JQxWEcr0Iu+MW/pITfaGMDDXYVcjTULZrpdjdEWY4ic=;
 b=a8C/H4Dn7iyeMtlouMXBbZFTSzsHRXrw9n/u4XI+f/20AO+Wa4MBCaarM44RNLl81jMGtw
 COFabcKLWSwiG0gyvNQ1IbhZM0gZA0ZHoxWYJarkrmlcZNCk3SiGn4w90YAtmxk61dD0l9
 sNxEef+cMFA1EZp2fB3CxxRi3rYjrKA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-XXpYODF8NKicluG442ePrw-1; Fri, 12 Feb 2021 15:16:35 -0500
X-MC-Unique: XXpYODF8NKicluG442ePrw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E56ED801962;
 Fri, 12 Feb 2021 20:16:33 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-150.phx2.redhat.com [10.3.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7985A6B8E5;
 Fri, 12 Feb 2021 20:16:33 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/14] iotests/264: add mirror-cancel test-case
Date: Fri, 12 Feb 2021 14:16:17 -0600
Message-Id: <20210212201619.1388255-13-eblake@redhat.com>
In-Reply-To: <20210212201619.1388255-1-eblake@redhat.com>
References: <20210212201619.1388255-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Check that cancel doesn't wait for 10s of nbd reconnect timeout.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210205163720.887197-9-vsementsov@virtuozzo.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 tests/qemu-iotests/264     | 38 ++++++++++++++++++++++++++++++--------
 tests/qemu-iotests/264.out |  4 ++--
 2 files changed, 32 insertions(+), 10 deletions(-)

diff --git a/tests/qemu-iotests/264 b/tests/qemu-iotests/264
index 6feeaa405632..347e53add51b 100755
--- a/tests/qemu-iotests/264
+++ b/tests/qemu-iotests/264
@@ -27,25 +27,26 @@ from iotests import qemu_img_create, file_path, qemu_nbd_popen

 disk_a, disk_b, nbd_sock = file_path('disk_a', 'disk_b', 'nbd-sock')
 nbd_uri = 'nbd+unix:///?socket=' + nbd_sock
-size = 5 * 1024 * 1024
 wait_limit = 3.0
 wait_step = 0.2


 class TestNbdReconnect(iotests.QMPTestCase):
-    def setUp(self):
-        qemu_img_create('-f', iotests.imgfmt, disk_a, str(size))
-        qemu_img_create('-f', iotests.imgfmt, disk_b, str(size))
+    def init_vm(self, disk_size):
+        qemu_img_create('-f', iotests.imgfmt, disk_a, str(disk_size))
+        qemu_img_create('-f', iotests.imgfmt, disk_b, str(disk_size))
         self.vm = iotests.VM().add_drive(disk_a)
         self.vm.launch()
-        self.vm.hmp_qemu_io('drive0', 'write 0 {}'.format(size))
+        self.vm.hmp_qemu_io('drive0', 'write 0 {}'.format(disk_size))

     def tearDown(self):
         self.vm.shutdown()
         os.remove(disk_a)
         os.remove(disk_b)

-    def test(self):
+    def start_job(self, job):
+        """Stat job with nbd target and kill the server"""
+        assert job in ('blockdev-backup', 'blockdev-mirror')
         with qemu_nbd_popen('-k', nbd_sock, '-f', iotests.imgfmt, disk_b):
             result = self.vm.qmp('blockdev-add',
                                  **{'node_name': 'backup0',
@@ -55,7 +56,7 @@ class TestNbdReconnect(iotests.QMPTestCase):
                                                         'path': nbd_sock},
                                              'reconnect-delay': 10}})
             self.assert_qmp(result, 'return', {})
-            result = self.vm.qmp('blockdev-backup', device='drive0',
+            result = self.vm.qmp(job, device='drive0',
                                  sync='full', target='backup0',
                                  speed=(1 * 1024 * 1024))
             self.assert_qmp(result, 'return', {})
@@ -73,7 +74,8 @@ class TestNbdReconnect(iotests.QMPTestCase):

         jobs = self.vm.qmp('query-block-jobs')['return']
         # Check that job is still in progress
-        self.assertTrue(jobs and jobs[0]['offset'] < jobs[0]['len'])
+        self.assertTrue(jobs)
+        self.assertTrue(jobs[0]['offset'] < jobs[0]['len'])

         result = self.vm.qmp('block-job-set-speed', device='drive0', speed=0)
         self.assert_qmp(result, 'return', {})
@@ -81,12 +83,32 @@ class TestNbdReconnect(iotests.QMPTestCase):
         # Emulate server down time for 1 second
         time.sleep(1)

+    def test_backup(self):
+        size = 5 * 1024 * 1024
+        self.init_vm(size)
+        self.start_job('blockdev-backup')
+
         with qemu_nbd_popen('-k', nbd_sock, '-f', iotests.imgfmt, disk_b):
             e = self.vm.event_wait('BLOCK_JOB_COMPLETED')
             self.assertEqual(e['data']['offset'], size)
             result = self.vm.qmp('blockdev-del', node_name='backup0')
             self.assert_qmp(result, 'return', {})

+    def test_mirror_cancel(self):
+        # Mirror speed limit doesn't work well enough, it seems that mirror
+        # will run many parallel requests anyway. MAX_IN_FLIGHT is 16 and
+        # MAX_IO_BYTES is 1M in mirror.c, so let's use 20M disk.
+        self.init_vm(20 * 1024 * 1024)
+        self.start_job('blockdev-mirror')
+
+        result = self.vm.qmp('block-job-cancel', device='drive0')
+        self.assert_qmp(result, 'return', {})
+
+        start_t = time.time()
+        self.vm.event_wait('BLOCK_JOB_CANCELLED')
+        delta_t = time.time() - start_t
+        self.assertTrue(delta_t < 2.0)
+

 if __name__ == '__main__':
     iotests.main(supported_fmts=['qcow2'])
diff --git a/tests/qemu-iotests/264.out b/tests/qemu-iotests/264.out
index ae1213e6f863..fbc63e62f885 100644
--- a/tests/qemu-iotests/264.out
+++ b/tests/qemu-iotests/264.out
@@ -1,5 +1,5 @@
-.
+..
 ----------------------------------------------------------------------
-Ran 1 tests
+Ran 2 tests

 OK
-- 
2.30.1


