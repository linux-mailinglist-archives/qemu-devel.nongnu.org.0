Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FDF49FE4
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jun 2019 13:55:58 +0200 (CEST)
Received: from localhost ([::1]:55938 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdCiU-0007Ef-3n
	for lists+qemu-devel@lfdr.de; Tue, 18 Jun 2019 07:55:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48330)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <vsementsov@virtuozzo.com>) id 1hdCWX-00041p-9j
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 07:43:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1hdCWV-0000Mr-66
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 07:43:37 -0400
Received: from relay.sw.ru ([185.231.240.75]:58014)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1hdCWU-0000Jg-Rj; Tue, 18 Jun 2019 07:43:35 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1hdCWQ-00016b-3V; Tue, 18 Jun 2019 14:43:30 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Tue, 18 Jun 2019 14:43:28 +0300
Message-Id: <20190618114328.55249-10-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190618114328.55249-1-vsementsov@virtuozzo.com>
References: <20190618114328.55249-1-vsementsov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v7 9/9] iotests: test nbd reconnect
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, armbru@redhat.com,
 mreitz@redhat.com, stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add test, which starts backup to nbd target and restarts nbd server
during backup.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/257        | 63 +++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/257.out    | 10 ++++++
 tests/qemu-iotests/group      |  1 +
 tests/qemu-iotests/iotests.py |  4 +++
 4 files changed, 78 insertions(+)
 create mode 100755 tests/qemu-iotests/257
 create mode 100644 tests/qemu-iotests/257.out

diff --git a/tests/qemu-iotests/257 b/tests/qemu-iotests/257
new file mode 100755
index 0000000000..a29a276207
--- /dev/null
+++ b/tests/qemu-iotests/257
@@ -0,0 +1,63 @@
+#!/usr/bin/env python
+#
+# Test nbd reconnect
+#
+# Copyright (c) 2019 Virtuozzo International GmbH. All rights reserved.
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
+import time
+
+import iotests
+from iotests import qemu_img_create, file_path, qemu_nbd_popen, log
+
+disk_a, disk_b, nbd_sock = file_path('disk_a', 'disk_b', 'nbd-sock')
+
+qemu_img_create('-f', iotests.imgfmt, disk_a, '5M')
+qemu_img_create('-f', iotests.imgfmt, disk_b, '5M')
+srv = qemu_nbd_popen('-k', nbd_sock, '-f', iotests.imgfmt, disk_b)
+time.sleep(1)
+
+vm = iotests.VM().add_drive(disk_a)
+vm.launch()
+vm.hmp_qemu_io('drive0', 'write 0 5M')
+
+vm.qmp_log('blockdev-add', filters=[iotests.filter_qmp_testfiles],
+           **{'node_name': 'backup0',
+              'driver': 'raw',
+              'file': {'driver': 'nbd',
+                       'server': {'type': 'unix', 'path': nbd_sock},
+                       'reconnect-delay': 10}})
+vm.qmp_log('blockdev-backup', device='drive0', sync='full', target='backup0')
+
+time.sleep(1)
+log('Kill NBD server')
+srv.kill()
+
+jobs = vm.qmp('query-block-jobs')['return']
+if jobs and jobs[0]['offset'] < jobs[0]['len']:
+    log('Backup job is still in progress')
+
+time.sleep(1)
+
+log('Start NBD server')
+srv = qemu_nbd_popen('-k', nbd_sock, '-f', iotests.imgfmt, disk_b)
+
+e = vm.event_wait('BLOCK_JOB_COMPLETED')
+log('Backup completed: {}'.format(e['data']['offset']))
+
+vm.qmp_log('blockdev-del', node_name='backup0')
+srv.kill()
+vm.shutdown()
diff --git a/tests/qemu-iotests/257.out b/tests/qemu-iotests/257.out
new file mode 100644
index 0000000000..15a82ddefb
--- /dev/null
+++ b/tests/qemu-iotests/257.out
@@ -0,0 +1,10 @@
+{"execute": "blockdev-add", "arguments": {"driver": "raw", "file": {"driver": "nbd", "reconnect-delay": 10, "server": {"path": "TEST_DIR/PID-nbd-sock", "type": "unix"}}, "node-name": "backup0"}}
+{"return": {}}
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "sync": "full", "target": "backup0"}}
+{"return": {}}
+Kill NBD server
+Backup job is still in progress
+Start NBD server
+Backup completed: 5242880
+{"execute": "blockdev-del", "arguments": {"node-name": "backup0"}}
+{"return": {}}
diff --git a/tests/qemu-iotests/group b/tests/qemu-iotests/group
index b34c8e3c0c..00fbfefc8e 100644
--- a/tests/qemu-iotests/group
+++ b/tests/qemu-iotests/group
@@ -269,3 +269,4 @@
 254 rw auto backing quick
 255 rw auto quick
 256 rw auto quick
+257 rw auto quick
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 3ecef5bc90..3c77950877 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -226,6 +226,10 @@ def qemu_nbd_early_pipe(*args):
     else:
         return exitcode, subp.communicate()[0]
 
+def qemu_nbd_popen(*args):
+    '''Run qemu-nbd in daemon mode and return the parent's exit code'''
+    return subprocess.Popen(qemu_nbd_args + ['--persistent'] + list(args))
+
 def compare_images(img1, img2, fmt1=imgfmt, fmt2=imgfmt):
     '''Return True if two image files are identical'''
     return qemu_img('compare', '-f', fmt1,
-- 
2.18.0


