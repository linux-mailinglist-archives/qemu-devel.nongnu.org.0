Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EB348EB37
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 15:07:55 +0100 (CET)
Received: from localhost ([::1]:41398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8NFA-0003R9-NX
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 09:07:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1n8N0a-0003B8-Ug
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 08:52:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1n8N0Y-0000M4-Nu
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 08:52:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642168366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gpT2w30WSUo7d2SOMBmCERq8noAYchtmHueolHdpuD8=;
 b=aN3tBLHGtCUQjLMU+j5ovtwax9JH+tJRExEy0nYP7cnFqK7uiwDJ/c6PvP5G3zanTy9+h8
 zKwBjcYuim4Bq8SfsDd5suCwvKNHwvQMgBhycQpro4f4U7sANw3U9GP643moVNgCOG9xkT
 CMWI+OuxhDrjtsP7PxmVK7iISmZqnu4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-333-A1CCwysFOhOCTwXChcCDsQ-1; Fri, 14 Jan 2022 08:52:43 -0500
X-MC-Unique: A1CCwysFOhOCTwXChcCDsQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C860D1853030;
 Fri, 14 Jan 2022 13:52:42 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3F05105B213;
 Fri, 14 Jan 2022 13:52:41 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 09/16] iotests/stream-error-on-reset: New test
Date: Fri, 14 Jan 2022 14:52:19 +0100
Message-Id: <20220114135226.185407-10-kwolf@redhat.com>
In-Reply-To: <20220114135226.185407-1-kwolf@redhat.com>
References: <20220114135226.185407-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hanna Reitz <hreitz@redhat.com>

Test the following scenario:
- Simple stream block in two-layer backing chain (base and top)
- The job is drained via blk_drain(), then an error occurs while the job
  settles the ongoing request
- And so the job completes while in blk_drain()

This was reported as a segfault, but is fixed by "block-backend: prevent
dangling BDS pointers across aio_poll()".

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2036178
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20220111153613.25453-3-stefanha@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 .../qemu-iotests/tests/stream-error-on-reset  | 140 ++++++++++++++++++
 .../tests/stream-error-on-reset.out           |   5 +
 2 files changed, 145 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/stream-error-on-reset
 create mode 100644 tests/qemu-iotests/tests/stream-error-on-reset.out

diff --git a/tests/qemu-iotests/tests/stream-error-on-reset b/tests/qemu-iotests/tests/stream-error-on-reset
new file mode 100755
index 0000000000..7eaedb24d7
--- /dev/null
+++ b/tests/qemu-iotests/tests/stream-error-on-reset
@@ -0,0 +1,140 @@
+#!/usr/bin/env python3
+# group: rw quick
+#
+# Test what happens when a stream job completes in a blk_drain().
+#
+# Copyright (C) 2022 Red Hat, Inc.
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
+from iotests import imgfmt, qemu_img_create, qemu_io_silent, QMPTestCase
+
+
+image_size = 1 * 1024 * 1024
+data_size = 64 * 1024
+base = os.path.join(iotests.test_dir, 'base.img')
+top = os.path.join(iotests.test_dir, 'top.img')
+
+
+# We want to test completing a stream job in a blk_drain().
+#
+# The blk_drain() we are going to use is a virtio-scsi device resetting,
+# which we can trigger by resetting the system.
+#
+# In order to have the block job complete on drain, we (1) throttle its
+# base image so we can start the drain after it has begun, but before it
+# completes, and (2) make it encounter an I/O error on the ensuing write.
+# (If it completes regularly, the completion happens after the drain for
+# some reason.)
+
+class TestStreamErrorOnReset(QMPTestCase):
+    def setUp(self) -> None:
+        """
+        Create two images:
+        - base image {base} with {data_size} bytes allocated
+        - top image {top} without any data allocated
+
+        And the following VM configuration:
+        - base image throttled to {data_size}
+        - top image with a blkdebug configuration so the first write access
+          to it will result in an error
+        - top image is attached to a virtio-scsi device
+        """
+        assert qemu_img_create('-f', imgfmt, base, str(image_size)) == 0
+        assert qemu_io_silent('-c', f'write 0 {data_size}', base) == 0
+        assert qemu_img_create('-f', imgfmt, top, str(image_size)) == 0
+
+        self.vm = iotests.VM()
+        self.vm.add_args('-accel', 'tcg') # Make throttling work properly
+        self.vm.add_object(self.vm.qmp_to_opts({
+            'qom-type': 'throttle-group',
+            'id': 'thrgr',
+            'x-bps-total': str(data_size)
+        }))
+        self.vm.add_blockdev(self.vm.qmp_to_opts({
+            'driver': imgfmt,
+            'node-name': 'base',
+            'file': {
+                'driver': 'throttle',
+                'throttle-group': 'thrgr',
+                'file': {
+                    'driver': 'file',
+                    'filename': base
+                }
+            }
+        }))
+        self.vm.add_blockdev(self.vm.qmp_to_opts({
+            'driver': imgfmt,
+            'node-name': 'top',
+            'file': {
+                'driver': 'blkdebug',
+                'node-name': 'top-blkdebug',
+                'inject-error': [{
+                    'event': 'pwritev',
+                    'immediately': 'true',
+                    'once': 'true'
+                }],
+                'image': {
+                    'driver': 'file',
+                    'filename': top
+                }
+            },
+            'backing': 'base'
+        }))
+        self.vm.add_device(self.vm.qmp_to_opts({
+            'driver': 'virtio-scsi',
+            'id': 'vscsi'
+        }))
+        self.vm.add_device(self.vm.qmp_to_opts({
+            'driver': 'scsi-hd',
+            'bus': 'vscsi.0',
+            'drive': 'top'
+        }))
+        self.vm.launch()
+
+    def tearDown(self) -> None:
+        self.vm.shutdown()
+        os.remove(top)
+        os.remove(base)
+
+    def test_stream_error_on_reset(self) -> None:
+        # Launch a stream job, which will take at least a second to
+        # complete, because the base image is throttled (so we can
+        # get in between it having started and it having completed)
+        res = self.vm.qmp('block-stream', job_id='stream', device='top')
+        self.assert_qmp(res, 'return', {})
+
+        while True:
+            ev = self.vm.event_wait('JOB_STATUS_CHANGE')
+            if ev['data']['status'] == 'running':
+                # Once the stream job is running, reset the system, which
+                # forces the virtio-scsi device to be reset, thus draining
+                # the stream job, and making it complete.  Completing
+                # inside of that drain should not result in a segfault.
+                res = self.vm.qmp('system_reset')
+                self.assert_qmp(res, 'return', {})
+            elif ev['data']['status'] == 'null':
+                # The test is done once the job is gone
+                break
+
+
+if __name__ == '__main__':
+    # Passes with any format with backing file support, but qed and
+    # qcow1 do not seem to exercise the used-to-be problematic code
+    # path, so there is no point in having them in this list
+    iotests.main(supported_fmts=['qcow2', 'vmdk'],
+                 supported_protocols=['file'])
diff --git a/tests/qemu-iotests/tests/stream-error-on-reset.out b/tests/qemu-iotests/tests/stream-error-on-reset.out
new file mode 100644
index 0000000000..ae1213e6f8
--- /dev/null
+++ b/tests/qemu-iotests/tests/stream-error-on-reset.out
@@ -0,0 +1,5 @@
+.
+----------------------------------------------------------------------
+Ran 1 tests
+
+OK
-- 
2.31.1


