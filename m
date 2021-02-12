Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5552831A600
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 21:25:14 +0100 (CET)
Received: from localhost ([::1]:34444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAf05-000521-8a
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 15:25:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAert-0004UI-DM
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 15:16:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAern-0003vP-9T
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 15:16:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613160998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4tscrRoPX0ZHiUmRctX161JhNDWtOIs+r+QFKBWqOL0=;
 b=jQHqZt9lQp6q+DZ3+Bct73Ue6v2jAU1GRnRMHls9NIRqu4qstHMSyVMPUk8643Wn7RiXWs
 LdNbP7ZjhChcjLL7H5C9W1lZrCTxDoRKl85q0Kp7X0jGbxNq0JSL8HGueadjh2JZnAFn6X
 w8qhc50Em9hcnmqseTsB8knWQYNhwfQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-02Q0QncQOwihS_WnNecvhA-1; Fri, 12 Feb 2021 15:16:33 -0500
X-MC-Unique: 02Q0QncQOwihS_WnNecvhA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CB19835E33;
 Fri, 12 Feb 2021 20:16:32 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-150.phx2.redhat.com [10.3.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 307CC6B8E5;
 Fri, 12 Feb 2021 20:16:32 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/14] iotests/264: move to python unittest
Date: Fri, 12 Feb 2021 14:16:15 -0600
Message-Id: <20210212201619.1388255-11-eblake@redhat.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

We are going to add more test cases, so use the library supporting test
cases.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210205163720.887197-7-vsementsov@virtuozzo.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 tests/qemu-iotests/264     | 109 +++++++++++++++++++++----------------
 tests/qemu-iotests/264.out |  20 ++-----
 2 files changed, 66 insertions(+), 63 deletions(-)

diff --git a/tests/qemu-iotests/264 b/tests/qemu-iotests/264
index e725cefd47b5..6feeaa405632 100755
--- a/tests/qemu-iotests/264
+++ b/tests/qemu-iotests/264
@@ -20,13 +20,10 @@
 #

 import time
+import os

 import iotests
-from iotests import qemu_img_create, file_path, qemu_nbd_popen, log
-
-iotests.script_initialize(
-    supported_fmts=['qcow2'],
-)
+from iotests import qemu_img_create, file_path, qemu_nbd_popen

 disk_a, disk_b, nbd_sock = file_path('disk_a', 'disk_b', 'nbd-sock')
 nbd_uri = 'nbd+unix:///?socket=' + nbd_sock
@@ -34,46 +31,62 @@ size = 5 * 1024 * 1024
 wait_limit = 3.0
 wait_step = 0.2

-qemu_img_create('-f', iotests.imgfmt, disk_a, str(size))
-qemu_img_create('-f', iotests.imgfmt, disk_b, str(size))
-
-with qemu_nbd_popen('-k', nbd_sock, '-f', iotests.imgfmt, disk_b):
-    vm = iotests.VM().add_drive(disk_a)
-    vm.launch()
-    vm.hmp_qemu_io('drive0', 'write 0 {}'.format(size))
-
-    vm.qmp_log('blockdev-add', filters=[iotests.filter_qmp_testfiles],
-               **{'node_name': 'backup0',
-                  'driver': 'raw',
-                  'file': {'driver': 'nbd',
-                           'server': {'type': 'unix', 'path': nbd_sock},
-                           'reconnect-delay': 10}})
-    vm.qmp_log('blockdev-backup', device='drive0', sync='full',
-               target='backup0', speed=(1 * 1024 * 1024))
-
-    # Wait for some progress
-    t = 0.0
-    while t < wait_limit:
-        jobs = vm.qmp('query-block-jobs')['return']
-        if jobs and jobs[0]['offset'] > 0:
-            break
-        time.sleep(wait_step)
-        t += wait_step
-
-    if jobs and jobs[0]['offset'] > 0:
-        log('Backup job is started')
-
-jobs = vm.qmp('query-block-jobs')['return']
-if jobs and jobs[0]['offset'] < jobs[0]['len']:
-    log('Backup job is still in progress')
-
-vm.qmp_log('block-job-set-speed', device='drive0', speed=0)
-
-# Emulate server down time for 1 second
-time.sleep(1)
-
-with qemu_nbd_popen('-k', nbd_sock, '-f', iotests.imgfmt, disk_b):
-    e = vm.event_wait('BLOCK_JOB_COMPLETED')
-    log('Backup completed: {}'.format(e['data']['offset']))
-    vm.qmp_log('blockdev-del', node_name='backup0')
-    vm.shutdown()
+
+class TestNbdReconnect(iotests.QMPTestCase):
+    def setUp(self):
+        qemu_img_create('-f', iotests.imgfmt, disk_a, str(size))
+        qemu_img_create('-f', iotests.imgfmt, disk_b, str(size))
+        self.vm = iotests.VM().add_drive(disk_a)
+        self.vm.launch()
+        self.vm.hmp_qemu_io('drive0', 'write 0 {}'.format(size))
+
+    def tearDown(self):
+        self.vm.shutdown()
+        os.remove(disk_a)
+        os.remove(disk_b)
+
+    def test(self):
+        with qemu_nbd_popen('-k', nbd_sock, '-f', iotests.imgfmt, disk_b):
+            result = self.vm.qmp('blockdev-add',
+                                 **{'node_name': 'backup0',
+                                    'driver': 'raw',
+                                    'file': {'driver': 'nbd',
+                                             'server': {'type': 'unix',
+                                                        'path': nbd_sock},
+                                             'reconnect-delay': 10}})
+            self.assert_qmp(result, 'return', {})
+            result = self.vm.qmp('blockdev-backup', device='drive0',
+                                 sync='full', target='backup0',
+                                 speed=(1 * 1024 * 1024))
+            self.assert_qmp(result, 'return', {})
+
+            # Wait for some progress
+            t = 0.0
+            while t < wait_limit:
+                jobs = self.vm.qmp('query-block-jobs')['return']
+                if jobs and jobs[0]['offset'] > 0:
+                    break
+                time.sleep(wait_step)
+                t += wait_step
+
+            self.assertTrue(jobs and jobs[0]['offset'] > 0)  # job started
+
+        jobs = self.vm.qmp('query-block-jobs')['return']
+        # Check that job is still in progress
+        self.assertTrue(jobs and jobs[0]['offset'] < jobs[0]['len'])
+
+        result = self.vm.qmp('block-job-set-speed', device='drive0', speed=0)
+        self.assert_qmp(result, 'return', {})
+
+        # Emulate server down time for 1 second
+        time.sleep(1)
+
+        with qemu_nbd_popen('-k', nbd_sock, '-f', iotests.imgfmt, disk_b):
+            e = self.vm.event_wait('BLOCK_JOB_COMPLETED')
+            self.assertEqual(e['data']['offset'], size)
+            result = self.vm.qmp('blockdev-del', node_name='backup0')
+            self.assert_qmp(result, 'return', {})
+
+
+if __name__ == '__main__':
+    iotests.main(supported_fmts=['qcow2'])
diff --git a/tests/qemu-iotests/264.out b/tests/qemu-iotests/264.out
index c45b1e81ef26..ae1213e6f863 100644
--- a/tests/qemu-iotests/264.out
+++ b/tests/qemu-iotests/264.out
@@ -1,15 +1,5 @@
-Start NBD server
-{"execute": "blockdev-add", "arguments": {"driver": "raw", "file": {"driver": "nbd", "reconnect-delay": 10, "server": {"path": "TEST_DIR/PID-nbd-sock", "type": "unix"}}, "node-name": "backup0"}}
-{"return": {}}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "speed": 1048576, "sync": "full", "target": "backup0"}}
-{"return": {}}
-Backup job is started
-Kill NBD server
-Backup job is still in progress
-{"execute": "block-job-set-speed", "arguments": {"device": "drive0", "speed": 0}}
-{"return": {}}
-Start NBD server
-Backup completed: 5242880
-{"execute": "blockdev-del", "arguments": {"node-name": "backup0"}}
-{"return": {}}
-Kill NBD server
+.
+----------------------------------------------------------------------
+Ran 1 tests
+
+OK
-- 
2.30.1


