Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 056AD69FB9B
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 19:57:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUuIJ-0006aw-GT; Wed, 22 Feb 2023 13:56:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pUuIC-0006Vo-IF; Wed, 22 Feb 2023 13:56:40 -0500
Received: from forwardcorp1a.mail.yandex.net ([178.154.239.72])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pUuIA-0005BT-Hu; Wed, 22 Feb 2023 13:56:40 -0500
Received: from mail-nwsmtp-smtp-corp-main-83.vla.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-83.vla.yp-c.yandex.net
 [IPv6:2a02:6b8:c15:2905:0:640:e5fe:0])
 by forwardcorp1a.mail.yandex.net (Yandex) with ESMTP id B71FB5FECE;
 Wed, 22 Feb 2023 21:56:29 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:a528::1:22])
 by mail-nwsmtp-smtp-corp-main-83.vla.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id BuTfTE0KlSw0-gOYx85f9; Wed, 22 Feb 2023 21:56:28 +0300
X-Yandex-Fwd: 1
Authentication-Results: mail-nwsmtp-smtp-corp-main-83.vla.yp-c.yandex.net;
 dkim=pass
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, armbru@redhat.com,
 eblake@redhat.com, hreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 vsementsov@yandex-team.ru, alexander.ivanov@virtuozzo.com
Subject: [PATCH v6 7/7] iotests: add filter-insertion
Date: Wed, 22 Feb 2023 21:55:52 +0300
Message-Id: <20230222185552.913733-8-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222185552.913733-1-vsementsov@yandex-team.ru>
References: <20230222185552.913733-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.72;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1a.mail.yandex.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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

Demonstrate new blockdev-replace API for filter insertion and removal.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 tests/qemu-iotests/tests/filter-insertion     | 257 ++++++++++++++++++
 tests/qemu-iotests/tests/filter-insertion.out |   5 +
 2 files changed, 262 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/filter-insertion
 create mode 100644 tests/qemu-iotests/tests/filter-insertion.out

diff --git a/tests/qemu-iotests/tests/filter-insertion b/tests/qemu-iotests/tests/filter-insertion
new file mode 100755
index 0000000000..11c0ea0447
--- /dev/null
+++ b/tests/qemu-iotests/tests/filter-insertion
@@ -0,0 +1,257 @@
+#!/usr/bin/env python3
+#
+# Tests for inserting and removing filters in a block graph.
+#
+# Copyright (c) 2022 Virtuozzo International GmbH.
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
+
+import iotests
+from iotests import qemu_img_create, try_remove
+
+
+disk = os.path.join(iotests.test_dir, 'disk')
+sock = os.path.join(iotests.sock_dir, 'sock')
+size = 1024 * 1024
+
+
+class TestFilterInsertion(iotests.QMPTestCase):
+    def setUp(self):
+        qemu_img_create('-f', iotests.imgfmt, disk, str(size))
+
+        self.vm = iotests.VM()
+        self.vm.launch()
+
+        result = self.vm.qmp('blockdev-add', {
+            'node-name': 'disk0',
+            'driver': 'qcow2',
+            'file': {
+                'node-name': 'file0',
+                'driver': 'file',
+                'filename': disk
+            }
+        })
+        self.assert_qmp(result, 'return', {})
+
+    def tearDown(self):
+        self.vm.shutdown()
+        os.remove(disk)
+        try_remove(sock)
+
+    def test_simple_insertion(self):
+        vm = self.vm
+
+        result = vm.qmp('blockdev-add', {
+            'node-name': 'filter',
+            'driver': 'preallocate',
+            'file': 'file0'
+        })
+        self.assert_qmp(result, 'return', {})
+
+        result = vm.qmp('x-blockdev-replace', {
+            'parent-type': 'driver',
+            'node-name': 'disk0',
+            'child': 'file',
+            'new-child': 'filter'
+        })
+        self.assert_qmp(result, 'return', {})
+
+        # Filter inserted:
+        # disk0 -file-> filter -file-> file0
+        vm.assert_edges_list([
+            ('disk0', 'file', 'filter'),
+            ('filter', 'file', 'file0')
+        ])
+
+        result = vm.qmp('x-blockdev-replace', {
+            'parent-type': 'driver',
+            'node-name': 'disk0',
+            'child': 'file',
+            'new-child': 'file0'
+        })
+        self.assert_qmp(result, 'return', {})
+
+        # Filter replaced, but still exists:
+        # dik0 -file-> file0 <-file- filter
+        vm.assert_edges_list([
+            ('disk0', 'file', 'file0'),
+            ('filter', 'file', 'file0')
+        ])
+
+        result = vm.qmp('blockdev-del', node_name='filter')
+        self.assert_qmp(result, 'return', {})
+
+        # Filter removed
+        # dik0 -file-> file0
+        vm.assert_edges_list([
+            ('disk0', 'file', 'file0')
+        ])
+
+    def test_insert_under_qdev(self):
+        vm = self.vm
+
+        result = vm.qmp('device_add', driver='virtio-scsi')
+        self.assert_qmp(result, 'return', {})
+        result = vm.qmp('device_add', id='sda', driver='scsi-hd',
+                              drive='disk0')
+        self.assert_qmp(result, 'return', {})
+
+        result = vm.qmp('blockdev-add', {
+            'node-name': 'filter',
+            'driver': 'compress',
+            'file': 'disk0'
+        })
+        self.assert_qmp(result, 'return', {})
+
+        result = vm.qmp('x-blockdev-replace', {
+            'parent-type': 'qdev',
+            'qdev-id': 'sda',
+            'new-child': 'filter'
+        })
+        self.assert_qmp(result, 'return', {})
+
+        # Filter inserted:
+        # sda -root-> filter -file-> disk0 -file-> file0
+        vm.assert_edges_list([
+            # parent_node_name, child_name, child_node_name
+            ('sda', 'root', 'filter'),
+            ('filter', 'file', 'disk0'),
+            ('disk0', 'file', 'file0'),
+        ])
+
+        result = vm.qmp('x-blockdev-replace', {
+            'parent-type': 'qdev',
+            'qdev-id': 'sda',
+            'new-child': 'disk0'
+        })
+        self.assert_qmp(result, 'return', {})
+        result = vm.qmp('blockdev-del', node_name='filter')
+        self.assert_qmp(result, 'return', {})
+
+        # Filter removed:
+        # sda -root-> disk0 -file-> file0
+        vm.assert_edges_list([
+            # parent_node_name, child_name, child_node_name
+            ('sda', 'root', 'disk0'),
+            ('disk0', 'file', 'file0'),
+        ])
+
+    def test_insert_under_nbd_export(self):
+        vm = self.vm
+
+        result = vm.qmp('nbd-server-start',
+                              addr={'type': 'unix', 'data': {'path': sock}})
+        self.assert_qmp(result, 'return', {})
+        result = vm.qmp('block-export-add', id='exp1', type='nbd',
+                              node_name='disk0', name='exp1')
+        self.assert_qmp(result, 'return', {})
+        result = vm.qmp('block-export-add', id='exp2', type='nbd',
+                              node_name='disk0', name='exp2')
+        self.assert_qmp(result, 'return', {})
+        result = vm.qmp('object-add', qom_type='throttle-group',
+                              id='tg', limits={'iops-read': 1})
+        self.assert_qmp(result, 'return', {})
+
+        result = vm.qmp('blockdev-add', {
+            'node-name': 'filter',
+            'driver': 'throttle',
+            'throttle-group': 'tg',
+            'file': 'disk0'
+        })
+        self.assert_qmp(result, 'return', {})
+
+        result = vm.qmp('x-blockdev-replace', {
+            'parent-type': 'export',
+            'export-id': 'exp1',
+            'new-child': 'filter'
+        })
+        self.assert_qmp(result, 'return', {})
+
+        # Only exp1 is throttled, exp2 is not:
+        # exp1 -root-> filter
+        #                |
+        #                |file
+        #                v
+        # exp2 -file-> disk0 -file> file0
+        vm.assert_edges_list([
+            # parent_node_name, child_name, child_node_name
+            ('exp1', 'root', 'filter'),
+            ('filter', 'file', 'disk0'),
+            ('disk0', 'file', 'file0'),
+            ('exp2', 'root', 'disk0')
+        ])
+
+        result = vm.qmp('x-blockdev-replace', {
+            'parent-type': 'export',
+            'export-id': 'exp2',
+            'new-child': 'filter'
+        })
+        self.assert_qmp(result, 'return', {})
+
+        # Both throttled:
+        # exp1 -root-> filter <-file- exp2
+        #                |
+        #                |file
+        #                v
+        #              disk0 -file> file0
+        vm.assert_edges_list([
+            # parent_node_name, child_name, child_node_name
+            ('exp1', 'root', 'filter'),
+            ('filter', 'file', 'disk0'),
+            ('disk0', 'file', 'file0'),
+            ('exp2', 'root', 'filter')
+        ])
+
+        # Check, that filter is in use and can't be removed
+        result = vm.qmp('blockdev-del', node_name='filter')
+        self.assert_qmp(result, 'error/desc', 'Node filter is in use')
+
+        result = vm.qmp('x-blockdev-replace', {
+            'parent-type': 'export',
+            'export-id': 'exp1',
+            'new-child': 'disk0'
+        })
+        self.assert_qmp(result, 'return', {})
+
+        result = vm.qmp('x-blockdev-replace', {
+            'parent-type': 'export',
+            'export-id': 'exp2',
+            'new-child': 'disk0'
+        })
+        self.assert_qmp(result, 'return', {})
+        result = vm.qmp('blockdev-del', node_name='filter')
+        self.assert_qmp(result, 'return', {})
+
+        # Filter removed:
+        # exp1 -root-> disk0 <-file- exp2
+        #                |
+        #                |file
+        #                v
+        #              file0
+        vm.assert_edges_list([
+            # parent_node_name, child_name, child_node_name
+            ('exp1', 'root', 'disk0'),
+            ('disk0', 'file', 'file0'),
+            ('exp2', 'root', 'disk0')
+        ])
+
+
+if __name__ == '__main__':
+    iotests.main(
+        supported_fmts=['qcow2'],
+        supported_protocols=['file']
+    )
diff --git a/tests/qemu-iotests/tests/filter-insertion.out b/tests/qemu-iotests/tests/filter-insertion.out
new file mode 100644
index 0000000000..8d7e996700
--- /dev/null
+++ b/tests/qemu-iotests/tests/filter-insertion.out
@@ -0,0 +1,5 @@
+...
+----------------------------------------------------------------------
+Ran 3 tests
+
+OK
-- 
2.34.1


