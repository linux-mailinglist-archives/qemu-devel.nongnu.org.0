Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E6B233454
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jul 2020 16:26:42 +0200 (CEST)
Received: from localhost ([::1]:47600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k19W5-0008CW-JD
	for lists+qemu-devel@lfdr.de; Thu, 30 Jul 2020 10:26:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1k19LQ-0005e4-UH; Thu, 30 Jul 2020 10:15:40 -0400
Received: from relay.sw.ru ([185.231.240.75]:44440 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1k19LO-00052e-SS; Thu, 30 Jul 2020 10:15:40 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.93)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1k19Km-0004Cz-LN; Thu, 30 Jul 2020 17:15:00 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v12 01/11] iotests: add test for QCOW2 header dump
Date: Thu, 30 Jul 2020 17:15:02 +0300
Message-Id: <1596118512-424960-2-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1596118512-424960-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1596118512-424960-1-git-send-email-andrey.shinkevich@virtuozzo.com>
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.shinkevich@virtuozzo.com; helo=relay3.sw.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/30 10:15:15
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, andrey.shinkevich@virtuozzo.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The simple script creates a QCOW2 image and fills it with some data.
Two bitmaps are created as well. Then the script reads the image header
with extensions from the disk by running the script qcow2.py and dumps
the information to the output. Other entities, such as snapshots, may
be added to the test later.

Suggested-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 tests/qemu-iotests/303     | 59 ++++++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/303.out | 64 ++++++++++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/group   |  1 +
 3 files changed, 124 insertions(+)
 create mode 100755 tests/qemu-iotests/303
 create mode 100644 tests/qemu-iotests/303.out

diff --git a/tests/qemu-iotests/303 b/tests/qemu-iotests/303
new file mode 100755
index 0000000..3c7a611
--- /dev/null
+++ b/tests/qemu-iotests/303
@@ -0,0 +1,59 @@
+#!/usr/bin/env python3
+#
+# Test for dumping of qcow2 image metadata
+#
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
+import subprocess
+from iotests import qemu_img_create, qemu_io, file_path, log, filter_qemu_io
+
+iotests.script_initialize(supported_fmts=['qcow2'])
+
+disk = file_path('disk')
+chunk = 1024 * 1024
+
+
+def create_bitmap(bitmap_number, disabled):
+    granularity = 1 << (14 + bitmap_number)
+    bitmap_name = 'bitmap-' + str(bitmap_number)
+    vm = iotests.VM().add_drive(disk)
+    vm.launch()
+    vm.qmp_log('block-dirty-bitmap-add', node='drive0', name=bitmap_name,
+               granularity=granularity, persistent=True, disabled=disabled)
+    vm.shutdown()
+
+
+def write_to_disk(offset, size):
+    write = f'write {offset} {size}'
+    log(qemu_io('-c', write, disk), filters=[filter_qemu_io])
+
+
+def add_bitmap(num, begin, end, disabled):
+    log(f'Add bitmap {num}')
+    create_bitmap(num, disabled)
+    for i in range(begin, end):
+        write_to_disk((i-1) * chunk, chunk)
+    log('')
+
+
+qemu_img_create('-f', iotests.imgfmt, disk, '10M')
+
+add_bitmap(1, 1, 7, False)
+add_bitmap(2, 7, 9, True)
+dump = ['qcow2.py', f'{disk}', 'dump-header']
+subprocess.run(dump)
diff --git a/tests/qemu-iotests/303.out b/tests/qemu-iotests/303.out
new file mode 100644
index 0000000..8b11169
--- /dev/null
+++ b/tests/qemu-iotests/303.out
@@ -0,0 +1,64 @@
+Add bitmap 1
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": false, "granularity": 32768, "name": "bitmap-1", "node": "drive0", "persistent": true}}
+{"return": {}}
+wrote 1048576/1048576 bytes at offset 0
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+wrote 1048576/1048576 bytes at offset 1048576
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+wrote 1048576/1048576 bytes at offset 2097152
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+wrote 1048576/1048576 bytes at offset 3145728
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+wrote 1048576/1048576 bytes at offset 4194304
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+wrote 1048576/1048576 bytes at offset 5242880
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+
+Add bitmap 2
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": true, "granularity": 65536, "name": "bitmap-2", "node": "drive0", "persistent": true}}
+{"return": {}}
+wrote 1048576/1048576 bytes at offset 6291456
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+wrote 1048576/1048576 bytes at offset 7340032
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+
+magic                     0x514649fb
+version                   3
+backing_file_offset       0x0
+backing_file_size         0x0
+cluster_bits              16
+size                      10485760
+crypt_method              0
+l1_size                   1
+l1_table_offset           0x30000
+refcount_table_offset     0x10000
+refcount_table_clusters   1
+nb_snapshots              0
+snapshot_offset           0x0
+incompatible_features     []
+compatible_features       []
+autoclear_features        [0]
+refcount_order            4
+header_length             112
+
+Header extension:
+magic                     0x6803f857 (Feature table)
+length                    336
+data                      <binary>
+
+Header extension:
+magic                     0x23852875 (Bitmaps)
+length                    24
+nb_bitmaps                2
+reserved32                0
+bitmap_directory_size     0x40
+bitmap_directory_offset   0x9d0000
+
diff --git a/tests/qemu-iotests/group b/tests/qemu-iotests/group
index 025ed52..7e12e1f 100644
--- a/tests/qemu-iotests/group
+++ b/tests/qemu-iotests/group
@@ -309,3 +309,4 @@
 299 auto quick
 301 backing quick
 302 quick
+303 rw quick
-- 
1.8.3.1


