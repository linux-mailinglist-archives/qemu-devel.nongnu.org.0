Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C990C4D893C
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 17:33:02 +0100 (CET)
Received: from localhost ([::1]:38594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTncz-0000Xb-8o
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 12:33:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nTnXf-0001YD-Gd
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 12:27:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nTnXd-0005lT-IX
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 12:27:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647275248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1R9g94+vMC65XZjqr2KtePUIB0UeFoJjSaSLqLU9Teg=;
 b=QC1K2ZGZ8kGKYYR78fjj6/yllyEumohEAZXaXhx8i/IYwBLSglB/Zag+9zS7gL1Gxxcegh
 vC9CYQevektm3ncu0aJBft2dlQ7oo8p/dxAHvfErEmQB/9SLgJi7qFK+rEFVI9oi7kK3zS
 Dd98pPLAM7E79EM0PiZbptQCffqNUSs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-6-jqjEgSZxNCaHVl3fAQn3VQ-1; Mon, 14 Mar 2022 12:27:24 -0400
X-MC-Unique: jqjEgSZxNCaHVl3fAQn3VQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C613801585;
 Mon, 14 Mar 2022 16:27:24 +0000 (UTC)
Received: from localhost (unknown [10.39.194.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EB7102023A09;
 Mon, 14 Mar 2022 16:27:23 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH for-7.0 2/2] iotests/reopen-file: Test reopening file child
Date: Mon, 14 Mar 2022 17:27:19 +0100
Message-Id: <20220314162719.65384-3-hreitz@redhat.com>
In-Reply-To: <20220314162719.65384-1-hreitz@redhat.com>
References: <20220314162719.65384-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This should work for all format drivers that support reopening, so test
it.

(This serves as a regression test for HEAD^: This test used to fail for
VMDK before HEAD^.)

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/tests/reopen-file     | 88 ++++++++++++++++++++++++
 tests/qemu-iotests/tests/reopen-file.out |  5 ++
 2 files changed, 93 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/reopen-file
 create mode 100644 tests/qemu-iotests/tests/reopen-file.out

diff --git a/tests/qemu-iotests/tests/reopen-file b/tests/qemu-iotests/tests/reopen-file
new file mode 100755
index 0000000000..24fd648050
--- /dev/null
+++ b/tests/qemu-iotests/tests/reopen-file
@@ -0,0 +1,88 @@
+#!/usr/bin/env python3
+# group: rw quick
+#
+# Test reopening a format driver's file child
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
+from iotests import imgfmt, qemu_img_create, QMPTestCase
+
+
+image_size = 1 * 1024 * 1024
+test_img = os.path.join(iotests.test_dir, 'test.img')
+
+
+class TestReopenFile(QMPTestCase):
+    def setUp(self) -> None:
+        assert qemu_img_create('-f', imgfmt, test_img, str(image_size)) == 0
+
+        # Add format driver node ('format') on top of the file ('file'), then
+        # add another raw node ('raw') on top of 'file' so for the reopen we
+        # can just switch from 'file' to 'raw'
+        self.vm = iotests.VM()
+        self.vm.add_blockdev(self.vm.qmp_to_opts({
+            'driver': imgfmt,
+            'node-name': 'format',
+            'file': {
+                'driver': 'file',
+                'node-name': 'file',
+                'filename': test_img
+            }
+        }))
+        self.vm.add_blockdev(self.vm.qmp_to_opts({
+            'driver': 'raw',
+            'node-name': 'raw',
+            'file': 'file'
+        }))
+        self.vm.launch()
+
+    def tearDown(self) -> None:
+        self.vm.shutdown()
+        os.remove(test_img)
+
+        # Check if there was any qemu-io run that failed
+        if 'Pattern verification failed' in self.vm.get_log():
+            print('ERROR: Pattern verification failed:')
+            print(self.vm.get_log())
+            self.fail('qemu-io pattern verification failed')
+
+    def test_reopen_file(self) -> None:
+        result = self.vm.qmp('blockdev-reopen', options=[{
+            'driver': imgfmt,
+            'node-name': 'format',
+            'file': 'raw'
+        }])
+        self.assert_qmp(result, 'return', {})
+
+        # Do some I/O to the image to see whether it still works
+        # (Pattern verification will be checked by tearDown())
+        result = self.vm.qmp('human-monitor-command',
+                             command_line='qemu-io format "write -P 42 0 64k"')
+        self.assert_qmp(result, 'return', '')
+
+        result = self.vm.qmp('human-monitor-command',
+                             command_line='qemu-io format "read -P 42 0 64k"')
+        self.assert_qmp(result, 'return', '')
+
+
+if __name__ == '__main__':
+    # Must support creating images and reopen
+    iotests.main(supported_fmts=['qcow', 'qcow2', 'qed', 'raw', 'vdi', 'vhdx',
+                                 'vmdk', 'vpc'],
+                 supported_protocols=['file'])
diff --git a/tests/qemu-iotests/tests/reopen-file.out b/tests/qemu-iotests/tests/reopen-file.out
new file mode 100644
index 0000000000..ae1213e6f8
--- /dev/null
+++ b/tests/qemu-iotests/tests/reopen-file.out
@@ -0,0 +1,5 @@
+.
+----------------------------------------------------------------------
+Ran 1 tests
+
+OK
-- 
2.35.1


