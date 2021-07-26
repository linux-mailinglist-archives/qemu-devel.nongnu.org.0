Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B443D5C1C
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 16:51:13 +0200 (CEST)
Received: from localhost ([::1]:42092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m81wm-0000P0-50
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 10:51:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m81sL-00026u-Gj
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 10:46:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m81sJ-0007ZM-0s
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 10:46:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627310794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p66di2x7GVz95gKgwWfCkIprCmNaU8NcuuasLq3Wu20=;
 b=DKglpLfIFh6suesw022BxA/If9+0ABXOpy4pH+80hIE5PkKrCqmqmQbfg+im6+Bzwq9leB
 FkDnlAhIF4yyxhdNMpSN/UmFYUH7LCpleikTlQiS5CC3XH6mOap8eRen4xP83nYBxSNpJy
 MxOpZ4oZEq2gb9Js9jq2JHFZF7eqn2s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-cCrvPTTHPuu53DnQUuZzcg-1; Mon, 26 Jul 2021 10:46:32 -0400
X-MC-Unique: cCrvPTTHPuu53DnQUuZzcg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4DAC93920;
 Mon, 26 Jul 2021 14:46:31 +0000 (UTC)
Received: from localhost (ovpn-112-179.ams2.redhat.com [10.36.112.179])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 649ED60C5A;
 Mon, 26 Jul 2021 14:46:31 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH for-6.1? v2 7/7] iotests: Add mirror-ready-cancel-error test
Date: Mon, 26 Jul 2021 16:46:13 +0200
Message-Id: <20210726144613.954844-8-mreitz@redhat.com>
In-Reply-To: <20210726144613.954844-1-mreitz@redhat.com>
References: <20210726144613.954844-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Test what happens when there is an I/O error after a mirror job in the
READY phase has been cancelled.

Signed-off-by: Max Reitz <mreitz@redhat.com>
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


