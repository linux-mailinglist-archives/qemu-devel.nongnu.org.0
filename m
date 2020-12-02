Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 745E92CC532
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 19:33:45 +0100 (CET)
Received: from localhost ([::1]:43924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkWwi-0003dD-GR
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 13:33:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kkWuH-0001cz-SW; Wed, 02 Dec 2020 13:31:13 -0500
Received: from relay.sw.ru ([185.231.240.75]:49930 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kkWuB-000105-4Y; Wed, 02 Dec 2020 13:31:13 -0500
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kkWtu-00BTPZ-E7; Wed, 02 Dec 2020 21:30:50 +0300
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, mreitz@redhat.com,
 stefanha@redhat.com, fam@euphon.net, armbru@redhat.com, jsnow@redhat.com,
 eblake@redhat.com, den@openvz.org, vsementsov@virtuozzo.com,
 andrey.shinkevich@virtuozzo.com
Subject: [PATCH v13 06/10] iotests: add #310 to test bottom node in COR driver
Date: Wed,  2 Dec 2020 21:30:57 +0300
Message-Id: <1606933861-297777-7-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1606933861-297777-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1606933861-297777-1-git-send-email-andrey.shinkevich@virtuozzo.com>
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.shinkevich@virtuozzo.com; helo=relay3.sw.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
From: Andrey Shinkevich via <qemu-devel@nongnu.org>

The test case #310 is similar to #216 by Max Reitz. The difference is
that the test #310 involves a bottom node to the COR filter driver.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/310     | 114 +++++++++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/310.out |  15 ++++++
 tests/qemu-iotests/group   |   1 +
 3 files changed, 130 insertions(+)
 create mode 100755 tests/qemu-iotests/310
 create mode 100644 tests/qemu-iotests/310.out

diff --git a/tests/qemu-iotests/310 b/tests/qemu-iotests/310
new file mode 100755
index 0000000..c8b34cd
--- /dev/null
+++ b/tests/qemu-iotests/310
@@ -0,0 +1,114 @@
+#!/usr/bin/env python3
+#
+# Copy-on-read tests using a COR filter with a bottom node
+#
+# Copyright (C) 2018 Red Hat, Inc.
+# Copyright (c) 2020 Virtuozzo International GmbH
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
+import iotests
+from iotests import log, qemu_img, qemu_io_silent
+
+# Need backing file support
+iotests.script_initialize(supported_fmts=['qcow2', 'qcow', 'qed', 'vmdk'],
+                          supported_platforms=['linux'])
+
+log('')
+log('=== Copy-on-read across nodes ===')
+log('')
+
+# This test is similar to the 216 one by Max Reitz <mreitz@redhat.com>
+# The difference is that this test case involves a bottom node to the
+# COR filter driver.
+
+with iotests.FilePath('base.img') as base_img_path, \
+     iotests.FilePath('mid.img') as mid_img_path, \
+     iotests.FilePath('top.img') as top_img_path, \
+     iotests.VM() as vm:
+
+    log('--- Setting up images ---')
+    log('')
+
+    assert qemu_img('create', '-f', iotests.imgfmt, base_img_path, '64M') == 0
+    assert qemu_io_silent(base_img_path, '-c', 'write -P 1 0M 1M') == 0
+    assert qemu_io_silent(base_img_path, '-c', 'write -P 1 3M 1M') == 0
+    assert qemu_img('create', '-f', iotests.imgfmt, '-b', base_img_path,
+                    '-F', iotests.imgfmt, mid_img_path) == 0
+    assert qemu_io_silent(mid_img_path,  '-c', 'write -P 3 2M 1M') == 0
+    assert qemu_io_silent(mid_img_path,  '-c', 'write -P 3 4M 1M') == 0
+    assert qemu_img('create', '-f', iotests.imgfmt, '-b', mid_img_path,
+                    '-F', iotests.imgfmt, top_img_path) == 0
+    assert qemu_io_silent(top_img_path,  '-c', 'write -P 2 1M 1M') == 0
+
+#      0 1 2 3 4
+# top    2
+# mid      3   3
+# base 1     1
+
+    log('Done')
+
+    log('')
+    log('--- Doing COR ---')
+    log('')
+
+    vm.launch()
+
+    log(vm.qmp('blockdev-add',
+               node_name='node0',
+               driver='copy-on-read',
+               bottom='node2',
+               file={
+                   'driver': iotests.imgfmt,
+                   'file': {
+                       'driver': 'file',
+                       'filename': top_img_path
+                   },
+                   'backing': {
+                       'node-name': 'node2',
+                       'driver': iotests.imgfmt,
+                       'file': {
+                           'driver': 'file',
+                           'filename': mid_img_path
+                       },
+                       'backing': {
+                           'driver': iotests.imgfmt,
+                           'file': {
+                               'driver': 'file',
+                               'filename': base_img_path
+                           }
+                       },
+                   }
+               }))
+
+    # Trigger COR
+    log(vm.qmp('human-monitor-command',
+               command_line='qemu-io node0 "read 0 5M"'))
+
+    vm.shutdown()
+
+    log('')
+    log('--- Checking COR result ---')
+    log('')
+
+    assert qemu_io_silent(base_img_path, '-c', 'discard 0 4M') == 0
+    assert qemu_io_silent(mid_img_path, '-c', 'discard 0M 5M') == 0
+    assert qemu_io_silent(top_img_path,  '-c', 'read -P 0 0 1M') == 0
+    assert qemu_io_silent(top_img_path,  '-c', 'read -P 2 1M 1M') == 0
+    assert qemu_io_silent(top_img_path,  '-c', 'read -P 3 2M 1M') == 0
+    assert qemu_io_silent(top_img_path,  '-c', 'read -P 0 3M 1M') == 0
+    assert qemu_io_silent(top_img_path,  '-c', 'read -P 3 4M 1M') == 0
+
+    log('Done')
diff --git a/tests/qemu-iotests/310.out b/tests/qemu-iotests/310.out
new file mode 100644
index 0000000..a70aa5c
--- /dev/null
+++ b/tests/qemu-iotests/310.out
@@ -0,0 +1,15 @@
+
+=== Copy-on-read across nodes ===
+
+--- Setting up images ---
+
+Done
+
+--- Doing COR ---
+
+{"return": {}}
+{"return": ""}
+
+--- Checking COR result ---
+
+Done
diff --git a/tests/qemu-iotests/group b/tests/qemu-iotests/group
index 2960dff..2793dc3 100644
--- a/tests/qemu-iotests/group
+++ b/tests/qemu-iotests/group
@@ -316,3 +316,4 @@
 305 rw quick
 307 rw quick export
 309 rw auto quick
+310 rw quick
-- 
1.8.3.1


