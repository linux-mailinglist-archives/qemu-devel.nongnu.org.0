Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5308C1D2593
	for <lists+qemu-devel@lfdr.de>; Thu, 14 May 2020 05:52:24 +0200 (CEST)
Received: from localhost ([::1]:34240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZ4v1-0003FW-CL
	for lists+qemu-devel@lfdr.de; Wed, 13 May 2020 23:52:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1jZ4t7-00015R-HJ
 for qemu-devel@nongnu.org; Wed, 13 May 2020 23:50:25 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33075
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1jZ4sx-00007Z-Am
 for qemu-devel@nongnu.org; Wed, 13 May 2020 23:50:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589428214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wb+QkS2M8JcRM6Yv8F6Dm+OOgvXdDsiD3FXNvt3k4Vc=;
 b=SbECq43B5mtDni2fkedMNg/Eb6f/6VU2UyN9u0AhLiNnP5XzJfu7vAxn4/T0J1uCxpr53j
 I3FSZuQCDDVuFCn8E8jdT+ohkEx44/Py3eENxd1aUKAO6zVBKmrHTennbuLIyxsr4QPczx
 7sXPcXGfvTehxPuCE3wsr+UmFACnpsw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-0ZcpZ7hfNeaAJx_5J3EXPg-1; Wed, 13 May 2020 23:50:12 -0400
X-MC-Unique: 0ZcpZ7hfNeaAJx_5J3EXPg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E8C5461;
 Thu, 14 May 2020 03:50:11 +0000 (UTC)
Received: from probe.redhat.com (ovpn-113-9.rdu2.redhat.com [10.10.113.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C2AB176E9F;
 Thu, 14 May 2020 03:49:48 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC v2 5/5] iotests: add 287 for block-dirty-bitmap-populate
Date: Wed, 13 May 2020 23:49:22 -0400
Message-Id: <20200514034922.24834-6-jsnow@redhat.com>
In-Reply-To: <20200514034922.24834-1-jsnow@redhat.com>
References: <20200514034922.24834-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=jsnow@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/13 22:25:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, pkrempa@redhat.com,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, vsementsov@virtuozzo.com,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Give block-dirty-bitmap-populate a workout.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/287     |  242 ++
 tests/qemu-iotests/287.out | 4544 ++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/group   |    1 +
 3 files changed, 4787 insertions(+)
 create mode 100755 tests/qemu-iotests/287
 create mode 100644 tests/qemu-iotests/287.out

diff --git a/tests/qemu-iotests/287 b/tests/qemu-iotests/287
new file mode 100755
index 0000000000..1faff03917
--- /dev/null
+++ b/tests/qemu-iotests/287
@@ -0,0 +1,242 @@
+#!/usr/bin/env python3
+#
+# Test block-dirty-bitmap-populate
+#
+# Copyright (c) 2020 John Snow for Red Hat, Inc.
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
+# owner=jsnow@redhat.com
+
+from collections import namedtuple
+import itertools
+import math
+import os
+
+import iotests
+from iotests import log, qemu_img
+from bitmaps import EmulatedBitmap, GROUPS
+
+SIZE = 64 * 1024 * 1024
+GRANULARITY = 64 * 1024
+
+
+class Drive:
+    def __init__(self, path, vm):
+        self.path = path
+        self.vm = vm
+        self.fmt = None
+        self.size = None
+        self.node = None
+
+    def img_create(self, fmt, size):
+        self.fmt = fmt
+        self.size = size
+        iotests.qemu_img_create('-f', self.fmt, self.path, str(self.size))
+
+
+def block_dirty_bitmap_populate(vm, node, bitmap, job_id, pattern, **kwargs):
+    # Strip any arguments explicitly nulled by the caller:
+    kwargs = {key: val for key, val in kwargs.items() if val is not None}
+    result = vm.qmp_log('block-dirty-bitmap-populate',
+                        node=node,
+                        name=bitmap,
+                        job_id=job_id,
+                        pattern=pattern,
+                        **kwargs)
+    return result
+
+
+def populate(drive, bitmap, job_id, pattern='allocation-top', **kwargs):
+    kwargs.setdefault('pattern', pattern)
+    kwargs.setdefault('auto-finalize', False)
+    kwargs.setdefault('auto-dismiss', False)
+    ret = block_dirty_bitmap_populate(drive.vm, drive.node,
+                                      bitmap, job_id, **kwargs)
+    return {
+        'id': job_id,
+        'auto-finalize': kwargs['auto-finalize'],
+        'auto-dismiss': kwargs['auto-dismiss'],
+        'return': ret,
+    }
+
+
+def perform_writes(drive, n, filter_node_name=None):
+    log("-- Write #{:d}:".format(n))
+    node_name = filter_node_name or drive.node
+    for pattern in GROUPS[n].patterns:
+        cmd = "write -P{:s} 0x{:07x} 0x{:x}".format(
+            pattern.byte,
+            pattern.offset,
+            pattern.size)
+        drive.vm.hmp_qemu_io(node_name, cmd, use_log=True)
+    log('')
+
+
+TestConfig = namedtuple('TestConfig', [
+    'base_pattern',
+    'disabled',
+    'pre_writes',
+    'mid_writes',
+    'cancel',
+    'post_writes',
+])
+
+
+def test_bitmap_populate(config):
+    """
+    Test bitmap populate.
+
+    :param base_pattern: Write a base pattern?
+    :param disabled:     Disable the target bitmap?
+    :param pre_writes:   Write a pattern after bitmap creation, but before job?
+    :param mid_writes:   Write a pattern before job finalizes?
+    :param cancel:       Cancel the job instead of finalizing it?
+    :param post_writes:  Write a pattern after the job?
+    """
+    with iotests.FilePaths(['img']) as (img_path,), iotests.VM() as vm:
+        log("\n=== Bitmap Populate {:s} ===\n".format(str(config)))
+
+        log('-- Prepare image & VM:')
+        drive0 = Drive(img_path, vm=vm)
+        drive0.img_create(iotests.imgfmt, SIZE)
+        vm.add_device("{},id=scsi0".format(iotests.get_virtio_scsi_device()))
+        vm.launch()
+
+        file_config = {
+            'driver': 'file',
+            'filename': drive0.path
+        }
+
+        drive0.node = 'drive0'
+        vm.qmp_log('blockdev-add',
+                   filters=[iotests.filter_qmp_testfiles],
+                   node_name=drive0.node,
+                   driver=drive0.fmt,
+                   file=file_config)
+        log('')
+
+
+        # Step 0: Prepare & Base Allocation Pattern
+
+        if config.base_pattern:
+            perform_writes(drive0, 0)
+
+
+        # Step 1: Add test bitmap
+
+        log('-- Add Bitmap:')
+        vm.qmp_log('block-dirty-bitmap-add',
+                   node=drive0.node,
+                   name="target",
+                   granularity=GRANULARITY,
+                   disabled=config.disabled)
+        ebitmap = EmulatedBitmap()
+        log('')
+
+        # Step 2: Pre-Writes
+
+        if config.pre_writes:
+            perform_writes(drive0, 1)
+            if not config.disabled:
+                ebitmap.dirty_group(1)
+            bitmap = vm.get_bitmap(drive0.node, 'target')
+            ebitmap.compare(bitmap)
+
+
+        # Step 3: Launch job & Mid-Writes
+
+        log('-- Test block-dirty-bitmap-populate (bitpop0):')
+        def pre_finalize():
+            # Writes issued prior to job finalization:
+            if config.mid_writes:
+                perform_writes(drive0, 2)
+                if not config.disabled:
+                    ebitmap.dirty_group(2)
+
+
+        class TestJobRunner(iotests.JobRunner):
+            def on_pending(self, event):
+                if config.mid_writes:
+                    perform_writes(drive0, 2)
+                    if not config.disabled:
+                        ebitmap.dirty_group(2)
+                super().on_pending(event)
+
+        job = populate(drive0, 'target', 'bitpop0')
+        assert job['return'] == {'return': {}}
+        job_runner = TestJobRunner(vm, job['id'],
+                                   auto_dismiss=job['auto-dismiss'],
+                                   auto_finalize=job['auto-finalize'],
+                                   cancel=config.cancel)
+        job_runner.run()
+        log('')
+
+
+        # Step 4: Post-job verification
+
+        if not config.cancel:
+            # Any writes made prior to the job finishing should now be visible.
+            if config.base_pattern:
+                ebitmap.dirty_group(0)
+            if config.pre_writes:
+                ebitmap.dirty_group(1)
+            if config.mid_writes:
+                ebitmap.dirty_group(2)
+
+        bitmap = vm.get_bitmap(drive0.node, 'target')
+        ebitmap.compare(bitmap)
+
+
+        # Step 5: Post-Writes
+
+        if config.post_writes:
+            perform_writes(drive0, 3)
+            if not config.disabled:
+                ebitmap.dirty_group(3)
+
+
+        # Step 6: Final Verification
+
+        log('-- Verification:')
+        bitmaps = vm.query_bitmaps()
+        log({'bitmaps': bitmaps}, indent=2)
+        log('')
+        bitmap = vm.get_bitmap(drive0.node, 'target', bitmaps=bitmaps)
+        ebitmap.compare(bitmap)
+
+
+        log('-- Cleanup:')
+        vm.qmp_log("block-dirty-bitmap-remove",
+                   node=drive0.node, name="target")
+
+        bitmaps = vm.query_bitmaps()
+        if bitmaps:
+            log("ERROR: bitmaps unaccounted for:")
+            log(bitmaps)
+        else:
+            log('OK: All bitmaps removed')
+        vm.shutdown()
+        log('')
+
+
+def main():
+    for args in itertools.product((True, False), repeat=6):
+        cfg = TestConfig(*args)
+        test_bitmap_populate(cfg)
+
+
+if __name__ == '__main__':
+    iotests.script_main(main, supported_fmts=['qcow2'],
+                        supported_protocols=['file'])
diff --git a/tests/qemu-iotests/287.out b/tests/qemu-iotests/287.out
new file mode 100644
index 0000000000..7c0afc7192
--- /dev/null
+++ b/tests/qemu-iotests/287.out
@@ -0,0 +1,4544 @@
+
+=== Bitmap Populate TestConfig(base_pattern=True, disabled=True, pre_writes=True, mid_writes=True, cancel=True, post_writes=True) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Write #0:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x49 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6c 0x0100000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6f 0x2000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x76 0x3ff0000 0x10000\""}}
+{"return": ""}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": true, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Write #1:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x65 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x77 0x00f8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x72 0x2008000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x3fe0000 0x10000\""}}
+{"return": ""}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+-- Write #2:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x74 0x0010000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x00e8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6e 0x2018000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x67 0x3fe0000 0x20000\""}}
+{"return": ""}
+
+{"execute": "job-cancel", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+Job failed: Operation canceled
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_CANCELLED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Write #3:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xaa 0x0010000 0x30000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xbb 0x00d8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xcc 0x2028000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xdd 0x3fc0000 0x10000\""}}
+{"return": ""}
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 0,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": false,
+        "status": "disabled"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=True, disabled=True, pre_writes=True, mid_writes=True, cancel=True, post_writes=False) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Write #0:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x49 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6c 0x0100000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6f 0x2000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x76 0x3ff0000 0x10000\""}}
+{"return": ""}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": true, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Write #1:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x65 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x77 0x00f8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x72 0x2008000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x3fe0000 0x10000\""}}
+{"return": ""}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+-- Write #2:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x74 0x0010000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x00e8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6e 0x2018000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x67 0x3fe0000 0x20000\""}}
+{"return": ""}
+
+{"execute": "job-cancel", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+Job failed: Operation canceled
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_CANCELLED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 0,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": false,
+        "status": "disabled"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=True, disabled=True, pre_writes=True, mid_writes=True, cancel=False, post_writes=True) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Write #0:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x49 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6c 0x0100000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6f 0x2000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x76 0x3ff0000 0x10000\""}}
+{"return": ""}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": true, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Write #1:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x65 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x77 0x00f8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x72 0x2008000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x3fe0000 0x10000\""}}
+{"return": ""}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+-- Write #2:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x74 0x0010000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x00e8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6e 0x2018000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x67 0x3fe0000 0x20000\""}}
+{"return": ""}
+
+{"execute": "job-finalize", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 10 dirty sectors; have 10. OK!
+
+-- Write #3:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xaa 0x0010000 0x30000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xbb 0x00d8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xcc 0x2028000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xdd 0x3fc0000 0x10000\""}}
+{"return": ""}
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 655360,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": false,
+        "status": "disabled"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 10 dirty sectors; have 10. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=True, disabled=True, pre_writes=True, mid_writes=True, cancel=False, post_writes=False) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Write #0:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x49 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6c 0x0100000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6f 0x2000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x76 0x3ff0000 0x10000\""}}
+{"return": ""}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": true, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Write #1:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x65 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x77 0x00f8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x72 0x2008000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x3fe0000 0x10000\""}}
+{"return": ""}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+-- Write #2:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x74 0x0010000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x00e8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6e 0x2018000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x67 0x3fe0000 0x20000\""}}
+{"return": ""}
+
+{"execute": "job-finalize", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 10 dirty sectors; have 10. OK!
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 655360,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": false,
+        "status": "disabled"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 10 dirty sectors; have 10. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=True, disabled=True, pre_writes=True, mid_writes=False, cancel=True, post_writes=True) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Write #0:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x49 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6c 0x0100000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6f 0x2000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x76 0x3ff0000 0x10000\""}}
+{"return": ""}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": true, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Write #1:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x65 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x77 0x00f8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x72 0x2008000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x3fe0000 0x10000\""}}
+{"return": ""}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+{"execute": "job-cancel", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+Job failed: Operation canceled
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_CANCELLED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Write #3:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xaa 0x0010000 0x30000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xbb 0x00d8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xcc 0x2028000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xdd 0x3fc0000 0x10000\""}}
+{"return": ""}
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 0,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": false,
+        "status": "disabled"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=True, disabled=True, pre_writes=True, mid_writes=False, cancel=True, post_writes=False) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Write #0:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x49 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6c 0x0100000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6f 0x2000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x76 0x3ff0000 0x10000\""}}
+{"return": ""}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": true, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Write #1:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x65 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x77 0x00f8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x72 0x2008000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x3fe0000 0x10000\""}}
+{"return": ""}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+{"execute": "job-cancel", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+Job failed: Operation canceled
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_CANCELLED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 0,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": false,
+        "status": "disabled"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=True, disabled=True, pre_writes=True, mid_writes=False, cancel=False, post_writes=True) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Write #0:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x49 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6c 0x0100000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6f 0x2000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x76 0x3ff0000 0x10000\""}}
+{"return": ""}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": true, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Write #1:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x65 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x77 0x00f8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x72 0x2008000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x3fe0000 0x10000\""}}
+{"return": ""}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+{"execute": "job-finalize", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 7 dirty sectors; have 7. OK!
+
+-- Write #3:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xaa 0x0010000 0x30000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xbb 0x00d8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xcc 0x2028000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xdd 0x3fc0000 0x10000\""}}
+{"return": ""}
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 458752,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": false,
+        "status": "disabled"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 7 dirty sectors; have 7. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=True, disabled=True, pre_writes=True, mid_writes=False, cancel=False, post_writes=False) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Write #0:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x49 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6c 0x0100000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6f 0x2000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x76 0x3ff0000 0x10000\""}}
+{"return": ""}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": true, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Write #1:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x65 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x77 0x00f8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x72 0x2008000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x3fe0000 0x10000\""}}
+{"return": ""}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+{"execute": "job-finalize", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 7 dirty sectors; have 7. OK!
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 458752,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": false,
+        "status": "disabled"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 7 dirty sectors; have 7. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=True, disabled=True, pre_writes=False, mid_writes=True, cancel=True, post_writes=True) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Write #0:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x49 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6c 0x0100000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6f 0x2000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x76 0x3ff0000 0x10000\""}}
+{"return": ""}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": true, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+-- Write #2:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x74 0x0010000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x00e8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6e 0x2018000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x67 0x3fe0000 0x20000\""}}
+{"return": ""}
+
+{"execute": "job-cancel", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+Job failed: Operation canceled
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_CANCELLED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Write #3:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xaa 0x0010000 0x30000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xbb 0x00d8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xcc 0x2028000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xdd 0x3fc0000 0x10000\""}}
+{"return": ""}
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 0,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": false,
+        "status": "disabled"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=True, disabled=True, pre_writes=False, mid_writes=True, cancel=True, post_writes=False) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Write #0:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x49 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6c 0x0100000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6f 0x2000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x76 0x3ff0000 0x10000\""}}
+{"return": ""}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": true, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+-- Write #2:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x74 0x0010000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x00e8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6e 0x2018000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x67 0x3fe0000 0x20000\""}}
+{"return": ""}
+
+{"execute": "job-cancel", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+Job failed: Operation canceled
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_CANCELLED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 0,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": false,
+        "status": "disabled"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=True, disabled=True, pre_writes=False, mid_writes=True, cancel=False, post_writes=True) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Write #0:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x49 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6c 0x0100000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6f 0x2000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x76 0x3ff0000 0x10000\""}}
+{"return": ""}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": true, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+-- Write #2:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x74 0x0010000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x00e8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6e 0x2018000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x67 0x3fe0000 0x20000\""}}
+{"return": ""}
+
+{"execute": "job-finalize", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 10 dirty sectors; have 10. OK!
+
+-- Write #3:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xaa 0x0010000 0x30000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xbb 0x00d8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xcc 0x2028000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xdd 0x3fc0000 0x10000\""}}
+{"return": ""}
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 655360,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": false,
+        "status": "disabled"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 10 dirty sectors; have 10. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=True, disabled=True, pre_writes=False, mid_writes=True, cancel=False, post_writes=False) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Write #0:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x49 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6c 0x0100000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6f 0x2000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x76 0x3ff0000 0x10000\""}}
+{"return": ""}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": true, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+-- Write #2:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x74 0x0010000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x00e8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6e 0x2018000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x67 0x3fe0000 0x20000\""}}
+{"return": ""}
+
+{"execute": "job-finalize", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 10 dirty sectors; have 10. OK!
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 655360,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": false,
+        "status": "disabled"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 10 dirty sectors; have 10. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=True, disabled=True, pre_writes=False, mid_writes=False, cancel=True, post_writes=True) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Write #0:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x49 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6c 0x0100000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6f 0x2000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x76 0x3ff0000 0x10000\""}}
+{"return": ""}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": true, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+{"execute": "job-cancel", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+Job failed: Operation canceled
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_CANCELLED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Write #3:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xaa 0x0010000 0x30000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xbb 0x00d8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xcc 0x2028000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xdd 0x3fc0000 0x10000\""}}
+{"return": ""}
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 0,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": false,
+        "status": "disabled"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=True, disabled=True, pre_writes=False, mid_writes=False, cancel=True, post_writes=False) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Write #0:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x49 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6c 0x0100000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6f 0x2000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x76 0x3ff0000 0x10000\""}}
+{"return": ""}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": true, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+{"execute": "job-cancel", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+Job failed: Operation canceled
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_CANCELLED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 0,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": false,
+        "status": "disabled"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=True, disabled=True, pre_writes=False, mid_writes=False, cancel=False, post_writes=True) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Write #0:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x49 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6c 0x0100000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6f 0x2000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x76 0x3ff0000 0x10000\""}}
+{"return": ""}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": true, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+{"execute": "job-finalize", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 4 dirty sectors; have 4. OK!
+
+-- Write #3:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xaa 0x0010000 0x30000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xbb 0x00d8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xcc 0x2028000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xdd 0x3fc0000 0x10000\""}}
+{"return": ""}
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 262144,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": false,
+        "status": "disabled"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 4 dirty sectors; have 4. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=True, disabled=True, pre_writes=False, mid_writes=False, cancel=False, post_writes=False) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Write #0:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x49 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6c 0x0100000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6f 0x2000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x76 0x3ff0000 0x10000\""}}
+{"return": ""}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": true, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+{"execute": "job-finalize", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 4 dirty sectors; have 4. OK!
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 262144,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": false,
+        "status": "disabled"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 4 dirty sectors; have 4. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=True, disabled=False, pre_writes=True, mid_writes=True, cancel=True, post_writes=True) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Write #0:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x49 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6c 0x0100000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6f 0x2000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x76 0x3ff0000 0x10000\""}}
+{"return": ""}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": false, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Write #1:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x65 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x77 0x00f8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x72 0x2008000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x3fe0000 0x10000\""}}
+{"return": ""}
+
+= Checking Bitmap target =
+expecting 6 dirty sectors; have 6. OK!
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+-- Write #2:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x74 0x0010000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x00e8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6e 0x2018000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x67 0x3fe0000 0x20000\""}}
+{"return": ""}
+
+{"execute": "job-cancel", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+Job failed: Operation canceled
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_CANCELLED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 10 dirty sectors; have 10. OK!
+
+-- Write #3:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xaa 0x0010000 0x30000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xbb 0x00d8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xcc 0x2028000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xdd 0x3fc0000 0x10000\""}}
+{"return": ""}
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 983040,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": true,
+        "status": "active"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 15 dirty sectors; have 15. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=True, disabled=False, pre_writes=True, mid_writes=True, cancel=True, post_writes=False) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Write #0:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x49 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6c 0x0100000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6f 0x2000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x76 0x3ff0000 0x10000\""}}
+{"return": ""}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": false, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Write #1:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x65 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x77 0x00f8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x72 0x2008000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x3fe0000 0x10000\""}}
+{"return": ""}
+
+= Checking Bitmap target =
+expecting 6 dirty sectors; have 6. OK!
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+-- Write #2:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x74 0x0010000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x00e8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6e 0x2018000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x67 0x3fe0000 0x20000\""}}
+{"return": ""}
+
+{"execute": "job-cancel", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+Job failed: Operation canceled
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_CANCELLED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 10 dirty sectors; have 10. OK!
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 655360,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": true,
+        "status": "active"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 10 dirty sectors; have 10. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=True, disabled=False, pre_writes=True, mid_writes=True, cancel=False, post_writes=True) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Write #0:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x49 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6c 0x0100000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6f 0x2000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x76 0x3ff0000 0x10000\""}}
+{"return": ""}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": false, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Write #1:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x65 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x77 0x00f8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x72 0x2008000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x3fe0000 0x10000\""}}
+{"return": ""}
+
+= Checking Bitmap target =
+expecting 6 dirty sectors; have 6. OK!
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+-- Write #2:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x74 0x0010000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x00e8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6e 0x2018000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x67 0x3fe0000 0x20000\""}}
+{"return": ""}
+
+{"execute": "job-finalize", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 10 dirty sectors; have 10. OK!
+
+-- Write #3:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xaa 0x0010000 0x30000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xbb 0x00d8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xcc 0x2028000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xdd 0x3fc0000 0x10000\""}}
+{"return": ""}
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 983040,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": true,
+        "status": "active"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 15 dirty sectors; have 15. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=True, disabled=False, pre_writes=True, mid_writes=True, cancel=False, post_writes=False) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Write #0:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x49 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6c 0x0100000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6f 0x2000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x76 0x3ff0000 0x10000\""}}
+{"return": ""}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": false, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Write #1:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x65 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x77 0x00f8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x72 0x2008000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x3fe0000 0x10000\""}}
+{"return": ""}
+
+= Checking Bitmap target =
+expecting 6 dirty sectors; have 6. OK!
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+-- Write #2:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x74 0x0010000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x00e8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6e 0x2018000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x67 0x3fe0000 0x20000\""}}
+{"return": ""}
+
+{"execute": "job-finalize", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 10 dirty sectors; have 10. OK!
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 655360,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": true,
+        "status": "active"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 10 dirty sectors; have 10. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=True, disabled=False, pre_writes=True, mid_writes=False, cancel=True, post_writes=True) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Write #0:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x49 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6c 0x0100000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6f 0x2000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x76 0x3ff0000 0x10000\""}}
+{"return": ""}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": false, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Write #1:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x65 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x77 0x00f8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x72 0x2008000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x3fe0000 0x10000\""}}
+{"return": ""}
+
+= Checking Bitmap target =
+expecting 6 dirty sectors; have 6. OK!
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+{"execute": "job-cancel", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+Job failed: Operation canceled
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_CANCELLED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 6 dirty sectors; have 6. OK!
+
+-- Write #3:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xaa 0x0010000 0x30000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xbb 0x00d8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xcc 0x2028000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xdd 0x3fc0000 0x10000\""}}
+{"return": ""}
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 917504,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": true,
+        "status": "active"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 14 dirty sectors; have 14. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=True, disabled=False, pre_writes=True, mid_writes=False, cancel=True, post_writes=False) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Write #0:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x49 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6c 0x0100000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6f 0x2000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x76 0x3ff0000 0x10000\""}}
+{"return": ""}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": false, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Write #1:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x65 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x77 0x00f8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x72 0x2008000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x3fe0000 0x10000\""}}
+{"return": ""}
+
+= Checking Bitmap target =
+expecting 6 dirty sectors; have 6. OK!
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+{"execute": "job-cancel", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+Job failed: Operation canceled
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_CANCELLED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 6 dirty sectors; have 6. OK!
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 393216,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": true,
+        "status": "active"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 6 dirty sectors; have 6. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=True, disabled=False, pre_writes=True, mid_writes=False, cancel=False, post_writes=True) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Write #0:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x49 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6c 0x0100000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6f 0x2000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x76 0x3ff0000 0x10000\""}}
+{"return": ""}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": false, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Write #1:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x65 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x77 0x00f8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x72 0x2008000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x3fe0000 0x10000\""}}
+{"return": ""}
+
+= Checking Bitmap target =
+expecting 6 dirty sectors; have 6. OK!
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+{"execute": "job-finalize", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 7 dirty sectors; have 7. OK!
+
+-- Write #3:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xaa 0x0010000 0x30000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xbb 0x00d8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xcc 0x2028000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xdd 0x3fc0000 0x10000\""}}
+{"return": ""}
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 983040,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": true,
+        "status": "active"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 15 dirty sectors; have 15. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=True, disabled=False, pre_writes=True, mid_writes=False, cancel=False, post_writes=False) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Write #0:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x49 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6c 0x0100000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6f 0x2000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x76 0x3ff0000 0x10000\""}}
+{"return": ""}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": false, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Write #1:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x65 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x77 0x00f8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x72 0x2008000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x3fe0000 0x10000\""}}
+{"return": ""}
+
+= Checking Bitmap target =
+expecting 6 dirty sectors; have 6. OK!
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+{"execute": "job-finalize", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 7 dirty sectors; have 7. OK!
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 458752,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": true,
+        "status": "active"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 7 dirty sectors; have 7. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=True, disabled=False, pre_writes=False, mid_writes=True, cancel=True, post_writes=True) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Write #0:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x49 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6c 0x0100000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6f 0x2000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x76 0x3ff0000 0x10000\""}}
+{"return": ""}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": false, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+-- Write #2:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x74 0x0010000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x00e8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6e 0x2018000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x67 0x3fe0000 0x20000\""}}
+{"return": ""}
+
+{"execute": "job-cancel", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+Job failed: Operation canceled
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_CANCELLED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 7 dirty sectors; have 7. OK!
+
+-- Write #3:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xaa 0x0010000 0x30000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xbb 0x00d8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xcc 0x2028000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xdd 0x3fc0000 0x10000\""}}
+{"return": ""}
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 786432,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": true,
+        "status": "active"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 12 dirty sectors; have 12. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=True, disabled=False, pre_writes=False, mid_writes=True, cancel=True, post_writes=False) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Write #0:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x49 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6c 0x0100000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6f 0x2000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x76 0x3ff0000 0x10000\""}}
+{"return": ""}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": false, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+-- Write #2:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x74 0x0010000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x00e8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6e 0x2018000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x67 0x3fe0000 0x20000\""}}
+{"return": ""}
+
+{"execute": "job-cancel", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+Job failed: Operation canceled
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_CANCELLED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 7 dirty sectors; have 7. OK!
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 458752,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": true,
+        "status": "active"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 7 dirty sectors; have 7. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=True, disabled=False, pre_writes=False, mid_writes=True, cancel=False, post_writes=True) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Write #0:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x49 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6c 0x0100000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6f 0x2000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x76 0x3ff0000 0x10000\""}}
+{"return": ""}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": false, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+-- Write #2:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x74 0x0010000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x00e8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6e 0x2018000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x67 0x3fe0000 0x20000\""}}
+{"return": ""}
+
+{"execute": "job-finalize", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 10 dirty sectors; have 10. OK!
+
+-- Write #3:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xaa 0x0010000 0x30000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xbb 0x00d8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xcc 0x2028000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xdd 0x3fc0000 0x10000\""}}
+{"return": ""}
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 983040,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": true,
+        "status": "active"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 15 dirty sectors; have 15. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=True, disabled=False, pre_writes=False, mid_writes=True, cancel=False, post_writes=False) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Write #0:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x49 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6c 0x0100000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6f 0x2000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x76 0x3ff0000 0x10000\""}}
+{"return": ""}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": false, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+-- Write #2:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x74 0x0010000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x00e8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6e 0x2018000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x67 0x3fe0000 0x20000\""}}
+{"return": ""}
+
+{"execute": "job-finalize", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 10 dirty sectors; have 10. OK!
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 655360,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": true,
+        "status": "active"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 10 dirty sectors; have 10. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=True, disabled=False, pre_writes=False, mid_writes=False, cancel=True, post_writes=True) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Write #0:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x49 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6c 0x0100000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6f 0x2000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x76 0x3ff0000 0x10000\""}}
+{"return": ""}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": false, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+{"execute": "job-cancel", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+Job failed: Operation canceled
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_CANCELLED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Write #3:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xaa 0x0010000 0x30000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xbb 0x00d8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xcc 0x2028000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xdd 0x3fc0000 0x10000\""}}
+{"return": ""}
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 524288,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": true,
+        "status": "active"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 8 dirty sectors; have 8. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=True, disabled=False, pre_writes=False, mid_writes=False, cancel=True, post_writes=False) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Write #0:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x49 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6c 0x0100000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6f 0x2000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x76 0x3ff0000 0x10000\""}}
+{"return": ""}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": false, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+{"execute": "job-cancel", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+Job failed: Operation canceled
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_CANCELLED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 0,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": true,
+        "status": "active"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=True, disabled=False, pre_writes=False, mid_writes=False, cancel=False, post_writes=True) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Write #0:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x49 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6c 0x0100000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6f 0x2000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x76 0x3ff0000 0x10000\""}}
+{"return": ""}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": false, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+{"execute": "job-finalize", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 4 dirty sectors; have 4. OK!
+
+-- Write #3:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xaa 0x0010000 0x30000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xbb 0x00d8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xcc 0x2028000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xdd 0x3fc0000 0x10000\""}}
+{"return": ""}
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 786432,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": true,
+        "status": "active"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 12 dirty sectors; have 12. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=True, disabled=False, pre_writes=False, mid_writes=False, cancel=False, post_writes=False) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Write #0:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x49 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6c 0x0100000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6f 0x2000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x76 0x3ff0000 0x10000\""}}
+{"return": ""}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": false, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+{"execute": "job-finalize", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 4 dirty sectors; have 4. OK!
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 262144,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": true,
+        "status": "active"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 4 dirty sectors; have 4. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=False, disabled=True, pre_writes=True, mid_writes=True, cancel=True, post_writes=True) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": true, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Write #1:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x65 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x77 0x00f8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x72 0x2008000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x3fe0000 0x10000\""}}
+{"return": ""}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+-- Write #2:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x74 0x0010000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x00e8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6e 0x2018000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x67 0x3fe0000 0x20000\""}}
+{"return": ""}
+
+{"execute": "job-cancel", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+Job failed: Operation canceled
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_CANCELLED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Write #3:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xaa 0x0010000 0x30000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xbb 0x00d8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xcc 0x2028000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xdd 0x3fc0000 0x10000\""}}
+{"return": ""}
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 0,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": false,
+        "status": "disabled"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=False, disabled=True, pre_writes=True, mid_writes=True, cancel=True, post_writes=False) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": true, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Write #1:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x65 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x77 0x00f8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x72 0x2008000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x3fe0000 0x10000\""}}
+{"return": ""}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+-- Write #2:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x74 0x0010000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x00e8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6e 0x2018000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x67 0x3fe0000 0x20000\""}}
+{"return": ""}
+
+{"execute": "job-cancel", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+Job failed: Operation canceled
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_CANCELLED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 0,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": false,
+        "status": "disabled"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=False, disabled=True, pre_writes=True, mid_writes=True, cancel=False, post_writes=True) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": true, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Write #1:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x65 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x77 0x00f8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x72 0x2008000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x3fe0000 0x10000\""}}
+{"return": ""}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+-- Write #2:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x74 0x0010000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x00e8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6e 0x2018000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x67 0x3fe0000 0x20000\""}}
+{"return": ""}
+
+{"execute": "job-finalize", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 10 dirty sectors; have 10. OK!
+
+-- Write #3:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xaa 0x0010000 0x30000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xbb 0x00d8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xcc 0x2028000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xdd 0x3fc0000 0x10000\""}}
+{"return": ""}
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 655360,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": false,
+        "status": "disabled"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 10 dirty sectors; have 10. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=False, disabled=True, pre_writes=True, mid_writes=True, cancel=False, post_writes=False) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": true, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Write #1:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x65 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x77 0x00f8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x72 0x2008000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x3fe0000 0x10000\""}}
+{"return": ""}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+-- Write #2:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x74 0x0010000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x00e8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6e 0x2018000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x67 0x3fe0000 0x20000\""}}
+{"return": ""}
+
+{"execute": "job-finalize", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 10 dirty sectors; have 10. OK!
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 655360,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": false,
+        "status": "disabled"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 10 dirty sectors; have 10. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=False, disabled=True, pre_writes=True, mid_writes=False, cancel=True, post_writes=True) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": true, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Write #1:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x65 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x77 0x00f8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x72 0x2008000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x3fe0000 0x10000\""}}
+{"return": ""}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+{"execute": "job-cancel", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+Job failed: Operation canceled
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_CANCELLED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Write #3:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xaa 0x0010000 0x30000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xbb 0x00d8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xcc 0x2028000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xdd 0x3fc0000 0x10000\""}}
+{"return": ""}
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 0,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": false,
+        "status": "disabled"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=False, disabled=True, pre_writes=True, mid_writes=False, cancel=True, post_writes=False) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": true, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Write #1:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x65 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x77 0x00f8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x72 0x2008000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x3fe0000 0x10000\""}}
+{"return": ""}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+{"execute": "job-cancel", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+Job failed: Operation canceled
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_CANCELLED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 0,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": false,
+        "status": "disabled"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=False, disabled=True, pre_writes=True, mid_writes=False, cancel=False, post_writes=True) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": true, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Write #1:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x65 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x77 0x00f8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x72 0x2008000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x3fe0000 0x10000\""}}
+{"return": ""}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+{"execute": "job-finalize", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 6 dirty sectors; have 6. OK!
+
+-- Write #3:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xaa 0x0010000 0x30000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xbb 0x00d8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xcc 0x2028000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xdd 0x3fc0000 0x10000\""}}
+{"return": ""}
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 393216,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": false,
+        "status": "disabled"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 6 dirty sectors; have 6. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=False, disabled=True, pre_writes=True, mid_writes=False, cancel=False, post_writes=False) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": true, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Write #1:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x65 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x77 0x00f8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x72 0x2008000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x3fe0000 0x10000\""}}
+{"return": ""}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+{"execute": "job-finalize", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 6 dirty sectors; have 6. OK!
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 393216,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": false,
+        "status": "disabled"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 6 dirty sectors; have 6. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=False, disabled=True, pre_writes=False, mid_writes=True, cancel=True, post_writes=True) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": true, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+-- Write #2:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x74 0x0010000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x00e8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6e 0x2018000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x67 0x3fe0000 0x20000\""}}
+{"return": ""}
+
+{"execute": "job-cancel", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+Job failed: Operation canceled
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_CANCELLED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Write #3:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xaa 0x0010000 0x30000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xbb 0x00d8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xcc 0x2028000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xdd 0x3fc0000 0x10000\""}}
+{"return": ""}
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 0,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": false,
+        "status": "disabled"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=False, disabled=True, pre_writes=False, mid_writes=True, cancel=True, post_writes=False) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": true, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+-- Write #2:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x74 0x0010000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x00e8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6e 0x2018000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x67 0x3fe0000 0x20000\""}}
+{"return": ""}
+
+{"execute": "job-cancel", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+Job failed: Operation canceled
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_CANCELLED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 0,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": false,
+        "status": "disabled"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=False, disabled=True, pre_writes=False, mid_writes=True, cancel=False, post_writes=True) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": true, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+-- Write #2:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x74 0x0010000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x00e8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6e 0x2018000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x67 0x3fe0000 0x20000\""}}
+{"return": ""}
+
+{"execute": "job-finalize", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 7 dirty sectors; have 7. OK!
+
+-- Write #3:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xaa 0x0010000 0x30000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xbb 0x00d8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xcc 0x2028000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xdd 0x3fc0000 0x10000\""}}
+{"return": ""}
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 458752,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": false,
+        "status": "disabled"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 7 dirty sectors; have 7. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=False, disabled=True, pre_writes=False, mid_writes=True, cancel=False, post_writes=False) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": true, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+-- Write #2:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x74 0x0010000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x00e8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6e 0x2018000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x67 0x3fe0000 0x20000\""}}
+{"return": ""}
+
+{"execute": "job-finalize", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 7 dirty sectors; have 7. OK!
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 458752,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": false,
+        "status": "disabled"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 7 dirty sectors; have 7. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=False, disabled=True, pre_writes=False, mid_writes=False, cancel=True, post_writes=True) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": true, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+{"execute": "job-cancel", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+Job failed: Operation canceled
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_CANCELLED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Write #3:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xaa 0x0010000 0x30000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xbb 0x00d8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xcc 0x2028000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xdd 0x3fc0000 0x10000\""}}
+{"return": ""}
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 0,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": false,
+        "status": "disabled"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=False, disabled=True, pre_writes=False, mid_writes=False, cancel=True, post_writes=False) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": true, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+{"execute": "job-cancel", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+Job failed: Operation canceled
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_CANCELLED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 0,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": false,
+        "status": "disabled"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=False, disabled=True, pre_writes=False, mid_writes=False, cancel=False, post_writes=True) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": true, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+{"execute": "job-finalize", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Write #3:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xaa 0x0010000 0x30000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xbb 0x00d8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xcc 0x2028000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xdd 0x3fc0000 0x10000\""}}
+{"return": ""}
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 0,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": false,
+        "status": "disabled"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=False, disabled=True, pre_writes=False, mid_writes=False, cancel=False, post_writes=False) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": true, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+{"execute": "job-finalize", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 0,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": false,
+        "status": "disabled"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=False, disabled=False, pre_writes=True, mid_writes=True, cancel=True, post_writes=True) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": false, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Write #1:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x65 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x77 0x00f8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x72 0x2008000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x3fe0000 0x10000\""}}
+{"return": ""}
+
+= Checking Bitmap target =
+expecting 6 dirty sectors; have 6. OK!
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+-- Write #2:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x74 0x0010000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x00e8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6e 0x2018000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x67 0x3fe0000 0x20000\""}}
+{"return": ""}
+
+{"execute": "job-cancel", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+Job failed: Operation canceled
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_CANCELLED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 10 dirty sectors; have 10. OK!
+
+-- Write #3:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xaa 0x0010000 0x30000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xbb 0x00d8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xcc 0x2028000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xdd 0x3fc0000 0x10000\""}}
+{"return": ""}
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 983040,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": true,
+        "status": "active"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 15 dirty sectors; have 15. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=False, disabled=False, pre_writes=True, mid_writes=True, cancel=True, post_writes=False) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": false, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Write #1:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x65 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x77 0x00f8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x72 0x2008000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x3fe0000 0x10000\""}}
+{"return": ""}
+
+= Checking Bitmap target =
+expecting 6 dirty sectors; have 6. OK!
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+-- Write #2:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x74 0x0010000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x00e8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6e 0x2018000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x67 0x3fe0000 0x20000\""}}
+{"return": ""}
+
+{"execute": "job-cancel", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+Job failed: Operation canceled
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_CANCELLED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 10 dirty sectors; have 10. OK!
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 655360,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": true,
+        "status": "active"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 10 dirty sectors; have 10. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=False, disabled=False, pre_writes=True, mid_writes=True, cancel=False, post_writes=True) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": false, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Write #1:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x65 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x77 0x00f8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x72 0x2008000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x3fe0000 0x10000\""}}
+{"return": ""}
+
+= Checking Bitmap target =
+expecting 6 dirty sectors; have 6. OK!
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+-- Write #2:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x74 0x0010000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x00e8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6e 0x2018000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x67 0x3fe0000 0x20000\""}}
+{"return": ""}
+
+{"execute": "job-finalize", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 10 dirty sectors; have 10. OK!
+
+-- Write #3:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xaa 0x0010000 0x30000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xbb 0x00d8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xcc 0x2028000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xdd 0x3fc0000 0x10000\""}}
+{"return": ""}
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 983040,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": true,
+        "status": "active"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 15 dirty sectors; have 15. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=False, disabled=False, pre_writes=True, mid_writes=True, cancel=False, post_writes=False) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": false, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Write #1:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x65 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x77 0x00f8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x72 0x2008000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x3fe0000 0x10000\""}}
+{"return": ""}
+
+= Checking Bitmap target =
+expecting 6 dirty sectors; have 6. OK!
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+-- Write #2:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x74 0x0010000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x00e8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6e 0x2018000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x67 0x3fe0000 0x20000\""}}
+{"return": ""}
+
+{"execute": "job-finalize", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 10 dirty sectors; have 10. OK!
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 655360,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": true,
+        "status": "active"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 10 dirty sectors; have 10. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=False, disabled=False, pre_writes=True, mid_writes=False, cancel=True, post_writes=True) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": false, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Write #1:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x65 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x77 0x00f8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x72 0x2008000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x3fe0000 0x10000\""}}
+{"return": ""}
+
+= Checking Bitmap target =
+expecting 6 dirty sectors; have 6. OK!
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+{"execute": "job-cancel", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+Job failed: Operation canceled
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_CANCELLED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 6 dirty sectors; have 6. OK!
+
+-- Write #3:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xaa 0x0010000 0x30000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xbb 0x00d8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xcc 0x2028000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xdd 0x3fc0000 0x10000\""}}
+{"return": ""}
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 917504,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": true,
+        "status": "active"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 14 dirty sectors; have 14. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=False, disabled=False, pre_writes=True, mid_writes=False, cancel=True, post_writes=False) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": false, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Write #1:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x65 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x77 0x00f8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x72 0x2008000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x3fe0000 0x10000\""}}
+{"return": ""}
+
+= Checking Bitmap target =
+expecting 6 dirty sectors; have 6. OK!
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+{"execute": "job-cancel", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+Job failed: Operation canceled
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_CANCELLED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 6 dirty sectors; have 6. OK!
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 393216,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": true,
+        "status": "active"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 6 dirty sectors; have 6. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=False, disabled=False, pre_writes=True, mid_writes=False, cancel=False, post_writes=True) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": false, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Write #1:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x65 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x77 0x00f8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x72 0x2008000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x3fe0000 0x10000\""}}
+{"return": ""}
+
+= Checking Bitmap target =
+expecting 6 dirty sectors; have 6. OK!
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+{"execute": "job-finalize", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 6 dirty sectors; have 6. OK!
+
+-- Write #3:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xaa 0x0010000 0x30000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xbb 0x00d8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xcc 0x2028000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xdd 0x3fc0000 0x10000\""}}
+{"return": ""}
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 917504,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": true,
+        "status": "active"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 14 dirty sectors; have 14. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=False, disabled=False, pre_writes=True, mid_writes=False, cancel=False, post_writes=False) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": false, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Write #1:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x65 0x0000000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x77 0x00f8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x72 0x2008000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x3fe0000 0x10000\""}}
+{"return": ""}
+
+= Checking Bitmap target =
+expecting 6 dirty sectors; have 6. OK!
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+{"execute": "job-finalize", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 6 dirty sectors; have 6. OK!
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 393216,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": true,
+        "status": "active"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 6 dirty sectors; have 6. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=False, disabled=False, pre_writes=False, mid_writes=True, cancel=True, post_writes=True) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": false, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+-- Write #2:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x74 0x0010000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x00e8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6e 0x2018000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x67 0x3fe0000 0x20000\""}}
+{"return": ""}
+
+{"execute": "job-cancel", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+Job failed: Operation canceled
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_CANCELLED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 7 dirty sectors; have 7. OK!
+
+-- Write #3:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xaa 0x0010000 0x30000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xbb 0x00d8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xcc 0x2028000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xdd 0x3fc0000 0x10000\""}}
+{"return": ""}
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 786432,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": true,
+        "status": "active"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 12 dirty sectors; have 12. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=False, disabled=False, pre_writes=False, mid_writes=True, cancel=True, post_writes=False) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": false, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+-- Write #2:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x74 0x0010000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x00e8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6e 0x2018000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x67 0x3fe0000 0x20000\""}}
+{"return": ""}
+
+{"execute": "job-cancel", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+Job failed: Operation canceled
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_CANCELLED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 7 dirty sectors; have 7. OK!
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 458752,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": true,
+        "status": "active"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 7 dirty sectors; have 7. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=False, disabled=False, pre_writes=False, mid_writes=True, cancel=False, post_writes=True) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": false, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+-- Write #2:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x74 0x0010000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x00e8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6e 0x2018000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x67 0x3fe0000 0x20000\""}}
+{"return": ""}
+
+{"execute": "job-finalize", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 7 dirty sectors; have 7. OK!
+
+-- Write #3:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xaa 0x0010000 0x30000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xbb 0x00d8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xcc 0x2028000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xdd 0x3fc0000 0x10000\""}}
+{"return": ""}
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 786432,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": true,
+        "status": "active"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 12 dirty sectors; have 12. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=False, disabled=False, pre_writes=False, mid_writes=True, cancel=False, post_writes=False) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": false, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+-- Write #2:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x74 0x0010000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x69 0x00e8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x6e 0x2018000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0x67 0x3fe0000 0x20000\""}}
+{"return": ""}
+
+{"execute": "job-finalize", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 7 dirty sectors; have 7. OK!
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 458752,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": true,
+        "status": "active"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 7 dirty sectors; have 7. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=False, disabled=False, pre_writes=False, mid_writes=False, cancel=True, post_writes=True) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": false, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+{"execute": "job-cancel", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+Job failed: Operation canceled
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_CANCELLED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Write #3:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xaa 0x0010000 0x30000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xbb 0x00d8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xcc 0x2028000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xdd 0x3fc0000 0x10000\""}}
+{"return": ""}
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 524288,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": true,
+        "status": "active"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 8 dirty sectors; have 8. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=False, disabled=False, pre_writes=False, mid_writes=False, cancel=True, post_writes=False) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": false, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+{"execute": "job-cancel", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+Job failed: Operation canceled
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_CANCELLED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 0,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": true,
+        "status": "active"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=False, disabled=False, pre_writes=False, mid_writes=False, cancel=False, post_writes=True) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": false, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+{"execute": "job-finalize", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Write #3:
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xaa 0x0010000 0x30000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xbb 0x00d8000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xcc 0x2028000 0x10000\""}}
+{"return": ""}
+{"execute": "human-monitor-command", "arguments": {"command-line": "qemu-io drive0 \"write -P0xdd 0x3fc0000 0x10000\""}}
+{"return": ""}
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 524288,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": true,
+        "status": "active"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 8 dirty sectors; have 8. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
+
+=== Bitmap Populate TestConfig(base_pattern=False, disabled=False, pre_writes=False, mid_writes=False, cancel=False, post_writes=False) ===
+
+-- Prepare image & VM:
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+
+-- Add Bitmap:
+{"execute": "block-dirty-bitmap-add", "arguments": {"disabled": false, "granularity": 65536, "name": "target", "node": "drive0"}}
+{"return": {}}
+
+-- Test block-dirty-bitmap-populate (bitpop0):
+{"execute": "block-dirty-bitmap-populate", "arguments": {"auto-dismiss": false, "auto-finalize": false, "job-id": "bitpop0", "name": "target", "node": "drive0", "pattern": "allocation-top"}}
+{"return": {}}
+{"execute": "job-finalize", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+{"data": {"id": "bitpop0", "type": "bitmap-populate"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"data": {"device": "bitpop0", "len": 67108864, "offset": 67108864, "speed": 0, "type": "bitmap-populate"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-dismiss", "arguments": {"id": "bitpop0"}}
+{"return": {}}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Verification:
+{
+  "bitmaps": {
+    "drive0": [
+      {
+        "busy": false,
+        "count": 0,
+        "granularity": 65536,
+        "name": "target",
+        "persistent": false,
+        "recording": true,
+        "status": "active"
+      }
+    ]
+  }
+}
+
+= Checking Bitmap target =
+expecting 0 dirty sectors; have 0. OK!
+
+-- Cleanup:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "target", "node": "drive0"}}
+{"return": {}}
+OK: All bitmaps removed
+
diff --git a/tests/qemu-iotests/group b/tests/qemu-iotests/group
index fe649c5b73..122ab02d08 100644
--- a/tests/qemu-iotests/group
+++ b/tests/qemu-iotests/group
@@ -295,6 +295,7 @@
 283 auto quick
 284 rw
 286 rw quick
+287 rw
 288 quick
 289 rw quick
 290 rw auto quick
-- 
2.21.1


