Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3D5625E57
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 16:29:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otVwz-0008Bi-Du; Fri, 11 Nov 2022 10:28:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1otVwx-0008A8-Iv
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 10:28:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1otVwv-00011W-D0
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 10:28:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668180487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hmR0hhofl+o1ro1AFrfJNWim7do//Q4XFxA27roHiNM=;
 b=BrCaRIE+evYDMGBEO9hDJlDq6aMygot6IA9ifZCPVolnv0P8HJz/lbkoyuo35Hm53upI7e
 rwHIFh/CvgK2SGkYDVpQ/Cg+tDgmT5xa/npYbJ3vnceYADtVRb6nXMRoGyOZUj++XL5Z3Y
 sJVxHuIKC9pFsCMQ0W5OimOm81lZrdE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-bJAvBIwdPBiKecCE3hqEPg-1; Fri, 11 Nov 2022 10:28:04 -0500
X-MC-Unique: bJAvBIwdPBiKecCE3hqEPg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 12D693C0D18B;
 Fri, 11 Nov 2022 15:28:04 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F78EC15BB4;
 Fri, 11 Nov 2022 15:28:02 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 11/11] tests/stream-under-throttle: New test
Date: Fri, 11 Nov 2022 16:27:44 +0100
Message-Id: <20221111152744.261358-12-kwolf@redhat.com>
In-Reply-To: <20221111152744.261358-1-kwolf@redhat.com>
References: <20221111152744.261358-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Hanna Reitz <hreitz@redhat.com>

Test streaming a base image into the top image underneath two throttle
nodes.  This was reported to make qemu 7.1 hang
(https://gitlab.com/qemu-project/qemu/-/issues/1215), so this serves as
a regression test.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20221110160921.33158-1-hreitz@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 .../qemu-iotests/tests/stream-under-throttle  | 121 ++++++++++++++++++
 .../tests/stream-under-throttle.out           |   5 +
 2 files changed, 126 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/stream-under-throttle
 create mode 100644 tests/qemu-iotests/tests/stream-under-throttle.out

diff --git a/tests/qemu-iotests/tests/stream-under-throttle b/tests/qemu-iotests/tests/stream-under-throttle
new file mode 100755
index 0000000000..37788b147d
--- /dev/null
+++ b/tests/qemu-iotests/tests/stream-under-throttle
@@ -0,0 +1,121 @@
+#!/usr/bin/env python3
+# group: rw
+#
+# Test streaming with throttle nodes on top
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
+import asyncio
+import os
+from typing import List
+import iotests
+from iotests import qemu_img_create, qemu_io
+
+
+image_size = 256 * 1024 * 1024
+base_img = os.path.join(iotests.test_dir, 'base.img')
+top_img = os.path.join(iotests.test_dir, 'top.img')
+
+
+class TcgVM(iotests.VM):
+    '''
+    Variant of iotests.VM that uses -accel tcg.  Simply using
+    iotests.VM.add_args('-accel', 'tcg') is not sufficient, because that will
+    put -accel qtest before -accel tcg, and -accel arguments are prioritized in
+    the order they appear.
+    '''
+    @property
+    def _base_args(self) -> List[str]:
+        # Put -accel tcg first so it takes precedence
+        return ['-accel', 'tcg'] + super()._base_args
+
+
+class TestStreamWithThrottle(iotests.QMPTestCase):
+    def setUp(self) -> None:
+        '''
+        Create a simple backing chain between two images, write something to
+        the base image.  Attach them to the VM underneath two throttle nodes,
+        one of which has actually no limits set, but the other does.  Then put
+        a virtio-blk device on top.
+        This test configuration has been taken from
+        https://gitlab.com/qemu-project/qemu/-/issues/1215
+        '''
+        qemu_img_create('-f', iotests.imgfmt, base_img, str(image_size))
+        qemu_img_create('-f', iotests.imgfmt, '-b', base_img, '-F',
+                        iotests.imgfmt, top_img, str(image_size))
+
+        # Write something to stream
+        qemu_io(base_img, '-c', f'write 0 {image_size}')
+
+        blockdev = {
+            'driver': 'throttle',
+            'node-name': 'throttled-node',
+            'throttle-group': 'thrgr-limited',
+            'file': {
+                'driver': 'throttle',
+                'throttle-group': 'thrgr-unlimited',
+                'file': {
+                    'driver': iotests.imgfmt,
+                    'node-name': 'unthrottled-node',
+                    'file': {
+                        'driver': 'file',
+                        'filename': top_img
+                    }
+                }
+            }
+        }
+
+        # Issue 1215 is not reproducible in qtest mode, which is why we need to
+        # create an -accel tcg VM
+        self.vm = TcgVM()
+        self.vm.add_object('iothread,id=iothr0')
+        self.vm.add_object('throttle-group,id=thrgr-unlimited')
+        self.vm.add_object('throttle-group,id=thrgr-limited,'
+                           'x-iops-total=10000,x-bps-total=104857600')
+        self.vm.add_blockdev(self.vm.qmp_to_opts(blockdev))
+        self.vm.add_device('virtio-blk,iothread=iothr0,drive=throttled-node')
+        self.vm.launch()
+
+    def tearDown(self) -> None:
+        self.vm.shutdown()
+        os.remove(top_img)
+        os.remove(base_img)
+
+    def test_stream(self) -> None:
+        '''
+        Do a simple stream beneath the two throttle nodes.  Should complete
+        with no problems.
+        '''
+        result = self.vm.qmp('block-stream',
+                             job_id='stream',
+                             device='unthrottled-node')
+        self.assert_qmp(result, 'return', {})
+
+        # Should succeed and not time out
+        try:
+            self.vm.run_job('stream')
+        except asyncio.exceptions.TimeoutError:
+            # VM may be stuck, kill it before tearDown()
+            self.vm.kill()
+            raise
+
+
+if __name__ == '__main__':
+    # Must support backing images
+    iotests.main(supported_fmts=['qcow', 'qcow2', 'qed'],
+                 supported_protocols=['file'],
+                 required_fmts=['throttle'])
diff --git a/tests/qemu-iotests/tests/stream-under-throttle.out b/tests/qemu-iotests/tests/stream-under-throttle.out
new file mode 100644
index 0000000000..ae1213e6f8
--- /dev/null
+++ b/tests/qemu-iotests/tests/stream-under-throttle.out
@@ -0,0 +1,5 @@
+.
+----------------------------------------------------------------------
+Ran 1 tests
+
+OK
-- 
2.38.1


