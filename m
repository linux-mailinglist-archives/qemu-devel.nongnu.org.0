Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F07D4029AF
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 15:26:51 +0200 (CEST)
Received: from localhost ([::1]:51958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNb7i-0000YE-8S
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 09:26:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mNaRe-0006DF-Gd
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:43:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mNaRa-0006QN-TO
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:43:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631018598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Va6dthAJ4ryg39yemtQOXF6nFMezl1sVaWdFx2t7eg=;
 b=AydiAR6wxIdtthxtFSyk5UEiN0GYQXtT21u2l9XwNgR2PaMeVJtS3BjD1/IdjUar6dIHFJ
 x/seNaehK4vwG77AmrGCiViMXBSN7wTCqOOm63zGoENpVNO/+cUBGMlZ8hYXREB/fUqvGq
 vry7Ye3Ti5BuCPc/RFIMYj8FjnyzVFc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-ztEORO7nNJ-AfgSay0QUJg-1; Tue, 07 Sep 2021 08:43:16 -0400
X-MC-Unique: ztEORO7nNJ-AfgSay0QUJg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CEB1319611A5;
 Tue,  7 Sep 2021 12:43:15 +0000 (UTC)
Received: from localhost (unknown [10.39.193.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 44D1577BF5;
 Tue,  7 Sep 2021 12:43:15 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 12/12] iotests: Add mirror-ready-cancel-error test
Date: Tue,  7 Sep 2021 14:42:45 +0200
Message-Id: <20210907124245.143492-13-hreitz@redhat.com>
In-Reply-To: <20210907124245.143492-1-hreitz@redhat.com>
References: <20210907124245.143492-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.391, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Test what happens when there is an I/O error after a mirror job in the
READY phase has been cancelled.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Tested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 .../tests/mirror-ready-cancel-error           | 143 ++++++++++++++++++
 .../tests/mirror-ready-cancel-error.out       |   5 +
 2 files changed, 148 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/mirror-ready-cancel-error
 create mode 100644 tests/qemu-iotests/tests/mirror-ready-cancel-error.out

diff --git a/tests/qemu-iotests/tests/mirror-ready-cancel-error b/tests/qemu-iotests/tests/mirror-ready-cancel-error
new file mode 100755
index 0000000000..f2dc88881f
--- /dev/null
+++ b/tests/qemu-iotests/tests/mirror-ready-cancel-error
@@ -0,0 +1,143 @@
+#!/usr/bin/env python3
+# group: rw quick
+#
+# Test what happens when errors occur to a mirror job after it has
+# been cancelled in the READY phase
+#
+# Copyright (C) 2021 Red Hat, Inc.
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
+
+image_size = 1 * 1024 * 1024
+source = os.path.join(iotests.test_dir, 'source.img')
+target = os.path.join(iotests.test_dir, 'target.img')
+
+
+class TestMirrorReadyCancelError(iotests.QMPTestCase):
+    def setUp(self) -> None:
+        assert iotests.qemu_img_create('-f', iotests.imgfmt, source,
+                                       str(image_size)) == 0
+        assert iotests.qemu_img_create('-f', iotests.imgfmt, target,
+                                       str(image_size)) == 0
+
+        self.vm = iotests.VM()
+        self.vm.launch()
+
+    def tearDown(self) -> None:
+        self.vm.shutdown()
+        os.remove(source)
+        os.remove(target)
+
+    def add_blockdevs(self, once: bool) -> None:
+        res = self.vm.qmp('blockdev-add',
+                          **{'node-name': 'source',
+                             'driver': iotests.imgfmt,
+                             'file': {
+                                 'driver': 'file',
+                                 'filename': source
+                             }})
+        self.assert_qmp(res, 'return', {})
+
+        # blkdebug notes:
+        # Enter state 2 on the first flush, which happens before the
+        # job enters the READY state.  The second flush will happen
+        # when the job is about to complete, and we want that one to
+        # fail.
+        res = self.vm.qmp('blockdev-add',
+                          **{'node-name': 'target',
+                             'driver': iotests.imgfmt,
+                             'file': {
+                                 'driver': 'blkdebug',
+                                 'image': {
+                                     'driver': 'file',
+                                     'filename': target
+                                 },
+                                 'set-state': [{
+                                     'event': 'flush_to_disk',
+                                     'state': 1,
+                                     'new_state': 2
+                                 }],
+                                 'inject-error': [{
+                                     'event': 'flush_to_disk',
+                                     'once': once,
+                                     'immediately': True,
+                                     'state': 2
+                                 }]}})
+        self.assert_qmp(res, 'return', {})
+
+    def start_mirror(self) -> None:
+        res = self.vm.qmp('blockdev-mirror',
+                          job_id='mirror',
+                          device='source',
+                          target='target',
+                          filter_node_name='mirror-top',
+                          sync='full',
+                          on_target_error='stop')
+        self.assert_qmp(res, 'return', {})
+
+    def cancel_mirror_with_error(self) -> None:
+        self.vm.event_wait('BLOCK_JOB_READY')
+
+        # Write something so will not leave the job immediately, but
+        # flush first (which will fail, thanks to blkdebug)
+        res = self.vm.qmp('human-monitor-command',
+                          command_line='qemu-io mirror-top "write 0 64k"')
+        self.assert_qmp(res, 'return', '')
+
+        # Drain status change events
+        while self.vm.event_wait('JOB_STATUS_CHANGE', timeout=0.0) is not None:
+            pass
+
+        res = self.vm.qmp('block-job-cancel', device='mirror')
+        self.assert_qmp(res, 'return', {})
+
+        self.vm.event_wait('BLOCK_JOB_ERROR')
+
+    def test_transient_error(self) -> None:
+        self.add_blockdevs(True)
+        self.start_mirror()
+        self.cancel_mirror_with_error()
+
+        while True:
+            e = self.vm.event_wait('JOB_STATUS_CHANGE')
+            if e['data']['status'] == 'standby':
+                # Transient error, try again
+                self.vm.qmp('block-job-resume', device='mirror')
+            elif e['data']['status'] == 'null':
+                break
+
+    def test_persistent_error(self) -> None:
+        self.add_blockdevs(False)
+        self.start_mirror()
+        self.cancel_mirror_with_error()
+
+        while True:
+            e = self.vm.event_wait('JOB_STATUS_CHANGE')
+            if e['data']['status'] == 'standby':
+                # Persistent error, no point in continuing
+                self.vm.qmp('block-job-cancel', device='mirror', force=True)
+            elif e['data']['status'] == 'null':
+                break
+
+
+if __name__ == '__main__':
+    # LUKS would require special key-secret handling in add_blockdevs()
+    iotests.main(supported_fmts=['generic'],
+                 unsupported_fmts=['luks'],
+                 supported_protocols=['file'])
diff --git a/tests/qemu-iotests/tests/mirror-ready-cancel-error.out b/tests/qemu-iotests/tests/mirror-ready-cancel-error.out
new file mode 100644
index 0000000000..fbc63e62f8
--- /dev/null
+++ b/tests/qemu-iotests/tests/mirror-ready-cancel-error.out
@@ -0,0 +1,5 @@
+..
+----------------------------------------------------------------------
+Ran 2 tests
+
+OK
-- 
2.31.1


