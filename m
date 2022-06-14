Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32ED354AED2
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 12:51:50 +0200 (CEST)
Received: from localhost ([::1]:53246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o149F-0005vQ-AK
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 06:51:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o13nz-0001MZ-St; Tue, 14 Jun 2022 06:29:51 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:57968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o13nh-0000kW-11; Tue, 14 Jun 2022 06:29:51 -0400
Received: from sas2-6a1db1376cb6.qloud-c.yandex.net
 (sas2-6a1db1376cb6.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bb0f:0:640:6a1d:b137])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 355BD2E0C7C;
 Tue, 14 Jun 2022 13:29:22 +0300 (MSK)
Received: from sas1-c73b4b4f4b95.qloud-c.yandex.net
 (sas1-c73b4b4f4b95.qloud-c.yandex.net [2a02:6b8:c08:12a9:0:640:c73b:4b4f])
 by sas2-6a1db1376cb6.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 3mpCRnkkWF-TLKulPdG; Tue, 14 Jun 2022 13:29:22 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1655202562; bh=3co4b1cHcqzkWY+4m4UHzr//GFLMjEItIKVDippfpv8=;
 h=Message-Id:References:Date:Subject:In-Reply-To:Cc:To:From;
 b=EaUfX7gDPtVArAnEaYu5QvkO0jMpnzg228YBKdz7r6wbwKzUVfd2OWrqaO6IlqV8K
 Wtm5dtqSS/pbeC++wuZSmfL0enVGuLH6po+9cVeqy+ko/qxGyyITPtMRDGopt2heWQ
 fXIbMRmOInJ13xRlFi0OYtcuMh7lIupEeDo11onE=
Authentication-Results: sas2-6a1db1376cb6.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:a427::1:2e])
 by sas1-c73b4b4f4b95.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 15x97ivcvu-TLMm0wTX; Tue, 14 Jun 2022 13:29:21 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, stefanha@redhat.com,
 eblake@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@yandex-team.ru, peter.maydell@linaro.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Subject: [PULL 03/10] iotests: add copy-before-write: on-cbw-error tests
Date: Tue, 14 Jun 2022 13:29:03 +0300
Message-Id: <20220614102910.1431380-4-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220614102910.1431380-1-vsementsov@yandex-team.ru>
References: <20220614102910.1431380-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>

Add tests for new option of copy-before-write filter: on-cbw-error.

Note that we use QEMUMachine instead of VM class, because in further
commit we'll want to use throttling which doesn't work with -accel
qtest used by VM.

We also touch pylintrc to not break iotest 297.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 tests/qemu-iotests/pylintrc                   |   5 +
 tests/qemu-iotests/tests/copy-before-write    | 132 ++++++++++++++++++
 .../qemu-iotests/tests/copy-before-write.out  |   5 +
 3 files changed, 142 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/copy-before-write
 create mode 100644 tests/qemu-iotests/tests/copy-before-write.out

diff --git a/tests/qemu-iotests/pylintrc b/tests/qemu-iotests/pylintrc
index 32ab77b8bb..f4f823a991 100644
--- a/tests/qemu-iotests/pylintrc
+++ b/tests/qemu-iotests/pylintrc
@@ -51,3 +51,8 @@ notes=FIXME,
 
 # Maximum number of characters on a single line.
 max-line-length=79
+
+
+[SIMILARITIES]
+
+min-similarity-lines=6
diff --git a/tests/qemu-iotests/tests/copy-before-write b/tests/qemu-iotests/tests/copy-before-write
new file mode 100755
index 0000000000..6c7638965e
--- /dev/null
+++ b/tests/qemu-iotests/tests/copy-before-write
@@ -0,0 +1,132 @@
+#!/usr/bin/env python3
+# group: auto backup
+#
+# Copyright (c) 2022 Virtuozzo International GmbH
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
+import re
+
+from qemu.machine import QEMUMachine
+
+import iotests
+from iotests import qemu_img_create, qemu_io
+
+
+temp_img = os.path.join(iotests.test_dir, 'temp')
+source_img = os.path.join(iotests.test_dir, 'source')
+size = '1M'
+
+
+class TestCbwError(iotests.QMPTestCase):
+    def tearDown(self):
+        self.vm.shutdown()
+        os.remove(temp_img)
+        os.remove(source_img)
+
+    def setUp(self):
+        qemu_img_create('-f', iotests.imgfmt, source_img, size)
+        qemu_img_create('-f', iotests.imgfmt, temp_img, size)
+        qemu_io('-c', 'write 0 1M', source_img)
+
+        self.vm = QEMUMachine(iotests.qemu_prog)
+        self.vm.launch()
+
+    def do_cbw_error(self, on_cbw_error):
+        result = self.vm.qmp('blockdev-add', {
+            'node-name': 'cbw',
+            'driver': 'copy-before-write',
+            'on-cbw-error': on_cbw_error,
+            'file': {
+                'driver': iotests.imgfmt,
+                'file': {
+                    'driver': 'file',
+                    'filename': source_img,
+                }
+            },
+            'target': {
+                'driver': iotests.imgfmt,
+                'file': {
+                    'driver': 'blkdebug',
+                    'image': {
+                        'driver': 'file',
+                        'filename': temp_img
+                    },
+                    'inject-error': [
+                        {
+                            'event': 'write_aio',
+                            'errno': 5,
+                            'immediately': False,
+                            'once': True
+                        }
+                    ]
+                }
+            }
+        })
+        self.assert_qmp(result, 'return', {})
+
+        result = self.vm.qmp('blockdev-add', {
+            'node-name': 'access',
+            'driver': 'snapshot-access',
+            'file': 'cbw'
+        })
+        self.assert_qmp(result, 'return', {})
+
+        result = self.vm.qmp('human-monitor-command',
+                             command_line='qemu-io cbw "write 0 1M"')
+        self.assert_qmp(result, 'return', '')
+
+        result = self.vm.qmp('human-monitor-command',
+                             command_line='qemu-io access "read 0 1M"')
+        self.assert_qmp(result, 'return', '')
+
+        self.vm.shutdown()
+        log = self.vm.get_log()
+        log = re.sub(r'^\[I \d+\.\d+\] OPENED\n', '', log)
+        log = re.sub(r'\[I \+\d+\.\d+\] CLOSED\n?$', '', log)
+        log = iotests.filter_qemu_io(log)
+        return log
+
+    def test_break_snapshot_on_cbw_error(self):
+        """break-snapshot behavior:
+        Guest write succeed, but further snapshot-read fails, as snapshot is
+        broken.
+        """
+        log = self.do_cbw_error('break-snapshot')
+
+        self.assertEqual(log, """\
+wrote 1048576/1048576 bytes at offset 0
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read failed: Permission denied
+""")
+
+    def test_break_guest_write_on_cbw_error(self):
+        """break-guest-write behavior:
+        Guest write fails, but snapshot-access continues working and further
+        snapshot-read succeeds.
+        """
+        log = self.do_cbw_error('break-guest-write')
+
+        self.assertEqual(log, """\
+write failed: Input/output error
+read 1048576/1048576 bytes at offset 0
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+""")
+
+
+if __name__ == '__main__':
+    iotests.main(supported_fmts=['qcow2'],
+                 supported_protocols=['file'])
diff --git a/tests/qemu-iotests/tests/copy-before-write.out b/tests/qemu-iotests/tests/copy-before-write.out
new file mode 100644
index 0000000000..fbc63e62f8
--- /dev/null
+++ b/tests/qemu-iotests/tests/copy-before-write.out
@@ -0,0 +1,5 @@
+..
+----------------------------------------------------------------------
+Ran 2 tests
+
+OK
-- 
2.25.1


