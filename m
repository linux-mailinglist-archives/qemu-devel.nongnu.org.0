Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B63A51A22F
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 16:28:56 +0200 (CEST)
Received: from localhost ([::1]:58028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmFzq-0004J2-VZ
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 10:28:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nmFwk-0000tl-Sp
 for qemu-devel@nongnu.org; Wed, 04 May 2022 10:25:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nmFwh-0007Ge-CA
 for qemu-devel@nongnu.org; Wed, 04 May 2022 10:25:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651674338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c7u9B8zZJ2FkOFZ8LOS4U5oMNmKJnFbcVYLWMhgki4U=;
 b=RVflZWRVJgLdOSwpfm79wb6M5dmeOb+stsJzcWMhjc+/G4qV24VXSw/uaTWRres09RvmQi
 vQ4GHzXFM7BwGDzOI9611eMil9OsZ4WkGRqVI0RRshaQNks7bOaz+RFnu3opIPASRFJ9Oa
 GoswTCCG+gJs1MIyDoA9unSuvNGbZKg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-258-lS3SMvjWPGOGP1gZZyraNg-1; Wed, 04 May 2022 10:25:37 -0400
X-MC-Unique: lS3SMvjWPGOGP1gZZyraNg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA799800186;
 Wed,  4 May 2022 14:25:36 +0000 (UTC)
Received: from merkur.str.redhat.com (dhcp-192-180.str.redhat.com
 [10.33.192.180])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6AAA64021A2;
 Wed,  4 May 2022 14:25:36 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 10/13] iotests/reopen-file: Test reopening file child
Date: Wed,  4 May 2022 16:25:19 +0200
Message-Id: <20220504142522.167506-11-kwolf@redhat.com>
In-Reply-To: <20220504142522.167506-1-kwolf@redhat.com>
References: <20220504142522.167506-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hanna Reitz <hreitz@redhat.com>

This should work for all format drivers that support reopening, so test
it.

(This serves as a regression test for HEAD^: This test used to fail for
VMDK before HEAD^.)

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220314162719.65384-3-hreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/tests/reopen-file     | 89 ++++++++++++++++++++++++
 tests/qemu-iotests/tests/reopen-file.out |  5 ++
 2 files changed, 94 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/reopen-file
 create mode 100644 tests/qemu-iotests/tests/reopen-file.out

diff --git a/tests/qemu-iotests/tests/reopen-file b/tests/qemu-iotests/tests/reopen-file
new file mode 100755
index 0000000000..8590a94d53
--- /dev/null
+++ b/tests/qemu-iotests/tests/reopen-file
@@ -0,0 +1,89 @@
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
+        res = qemu_img_create('-f', imgfmt, test_img, str(image_size))
+        assert res.returncode == 0
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


