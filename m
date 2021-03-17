Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D61133F699
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 18:22:06 +0100 (CET)
Received: from localhost ([::1]:38250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMZrx-0007iU-BW
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 13:22:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lMZmi-0003bU-Vt; Wed, 17 Mar 2021 13:16:41 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:38060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lMZmg-0006rY-Kg; Wed, 17 Mar 2021 13:16:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=BJfxKQtr6WRmxcANiKTqWhyFOhQzJ//5DK/ydjjpYX0=; 
 b=IDIKMatlaloupExnH83yIAdMJwmqBhJDr5M8kE5rAg3tLBWmBA87FFZ66fmSMRqLTjBU1MGLMijjigKhuSMHrt6seM4rflX9iI5FBcaUmdghe+1eqkZaS4acPtRmCAVH/PK3pCSNKhqfSCbS6SjM22MJOBOXbdnCrov8+WddRDjgZir8QACfPfuqwBK4Exd3rdl/YXjc+9KVADjQEn4YPwHrCA3W/w43lKiy983PJLhXhAIW9LiP00EDFH9I4PI0VdNZ1xUaQTNLx/CpC/pNP/LS9Wo7+gxt3BPhOzAi17H278qeckDuf8FKF3vPgJdiKd3kcIj2Ew/DuWnxRBe0CA==;
Received: from [213.94.25.37] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1lMZmd-0003v0-OO; Wed, 17 Mar 2021 18:16:35 +0100
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1lMZmQ-0007Rc-E2; Wed, 17 Mar 2021 18:16:22 +0100
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/6] iotests: Test replacing files with x-blockdev-reopen
Date: Wed, 17 Mar 2021 18:15:54 +0100
Message-Id: <6e521df2f95da4a8df679bf15ad6cb4af33fe18f.1616000692.git.berto@igalia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1616000692.git.berto@igalia.com>
References: <cover.1616000692.git.berto@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds new tests in which we use x-blockdev-reopen to change
bs->file

Signed-off-by: Alberto Garcia <berto@igalia.com>
---
 tests/qemu-iotests/245     | 109 ++++++++++++++++++++++++++++++++++++-
 tests/qemu-iotests/245.out |  11 +++-
 2 files changed, 117 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/245 b/tests/qemu-iotests/245
index a4d0b10e9d..caebef4ac8 100755
--- a/tests/qemu-iotests/245
+++ b/tests/qemu-iotests/245
@@ -79,7 +79,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         for line in log.split("\n"):
             if line.startswith("Pattern verification failed"):
                 raise Exception("%s (command #%d)" % (line, found))
-            if re.match("read .*/.* bytes at offset", line):
+            if re.match("(read|wrote) .*/.* bytes at offset", line):
                 found += 1
         self.assertEqual(found, self.total_io_cmds,
                          "Expected output of %d qemu-io commands, found %d" %
@@ -537,6 +537,113 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         result = self.vm.qmp('blockdev-del', conv_keys = True, node_name = 'bv')
         self.assert_qmp(result, 'return', {})
 
+    # Replace the protocol layer ('file' parameter) of a disk image
+    def test_replace_file(self):
+        # Create two small raw images and add them to a running VM
+        qemu_img('create', '-f', 'raw', hd_path[0], '10k')
+        qemu_img('create', '-f', 'raw', hd_path[1], '10k')
+
+        hd0_opts = {'driver': 'file', 'node-name': 'hd0-file', 'filename':  hd_path[0] }
+        hd1_opts = {'driver': 'file', 'node-name': 'hd1-file', 'filename':  hd_path[1] }
+
+        result = self.vm.qmp('blockdev-add', conv_keys = False, **hd0_opts)
+        self.assert_qmp(result, 'return', {})
+        result = self.vm.qmp('blockdev-add', conv_keys = False, **hd1_opts)
+        self.assert_qmp(result, 'return', {})
+
+        # Add a raw format layer that uses hd0-file as its protocol layer
+        opts = {'driver': 'raw', 'node-name': 'hd', 'file': 'hd0-file'}
+
+        result = self.vm.qmp('blockdev-add', conv_keys = False, **opts)
+        self.assert_qmp(result, 'return', {})
+
+        # Fill the image with data
+        self.run_qemu_io("hd", "read  -P 0 0 10k")
+        self.run_qemu_io("hd", "write -P 0xa0 0 10k")
+
+        # Replace hd0-file with hd1-file and fill it with (different) data
+        self.reopen(opts, {'file': 'hd1-file'})
+        self.run_qemu_io("hd", "read  -P 0 0 10k")
+        self.run_qemu_io("hd", "write -P 0xa1 0 10k")
+
+        # Use hd0-file again and check that it contains the expected data
+        self.reopen(opts, {'file': 'hd0-file'})
+        self.run_qemu_io("hd", "read  -P 0xa0 0 10k")
+
+        # And finally do the same with hd1-file
+        self.reopen(opts, {'file': 'hd1-file'})
+        self.run_qemu_io("hd", "read  -P 0xa1 0 10k")
+
+    # Insert (and remove) a throttle filter
+    def test_insert_throttle_filter(self):
+        # Add an image to the VM
+        hd0_opts = hd_opts(0)
+        result = self.vm.qmp('blockdev-add', conv_keys = False, **hd0_opts)
+        self.assert_qmp(result, 'return', {})
+
+        # Create a throttle-group object
+        opts = { 'qom-type': 'throttle-group', 'id': 'group0',
+                 'limits': { 'iops-total': 1000 } }
+        result = self.vm.qmp('object-add', conv_keys = False, **opts)
+        self.assert_qmp(result, 'return', {})
+
+        # Add a throttle filter with the group that we just created.
+        # The filter is not used by anyone yet
+        opts = { 'driver': 'throttle', 'node-name': 'throttle0',
+                 'throttle-group': 'group0', 'file': 'hd0-file' }
+        result = self.vm.qmp('blockdev-add', conv_keys = False, **opts)
+        self.assert_qmp(result, 'return', {})
+
+        # Insert the throttle filter between hd0 and hd0-file
+        self.reopen(hd0_opts, {'file': 'throttle0'})
+
+        # Remove the throttle filter from hd0
+        self.reopen(hd0_opts, {'file': 'hd0-file'})
+
+    # Insert (and remove) a compress filter
+    def test_insert_compress_filter(self):
+        # Add an image to the VM: hd (raw) -> hd0 (qcow2) -> hd0-file (file)
+        opts = {'driver': 'raw', 'node-name': 'hd', 'file': hd_opts(0)}
+        result = self.vm.qmp('blockdev-add', conv_keys = False, **opts)
+        self.assert_qmp(result, 'return', {})
+
+        # Add a 'compress' filter
+        filter_opts = {'driver': 'compress',
+                       'node-name': 'compress0',
+                       'file': 'hd0'}
+        result = self.vm.qmp('blockdev-add', conv_keys = False, **filter_opts)
+        self.assert_qmp(result, 'return', {})
+
+        # Unmap the beginning of the image (we cannot write compressed
+        # data to an allocated cluster)
+        self.run_qemu_io("hd", "write -z -u 0 128k")
+
+        # Write data to the first cluster
+        self.run_qemu_io("hd", "write -P 0xa0 0 64k")
+
+        # Insert the filter then write to the second cluster
+        # hd -> compress0 -> hd0 -> hd0-file
+        self.reopen(opts, {'file': 'compress0'})
+        self.run_qemu_io("hd", "write -P 0xa1 64k 64k")
+
+        # Remove the filter then write to the third cluster
+        # hd -> hd0 -> hd0-file
+        self.reopen(opts, {'file': 'hd0'})
+        self.run_qemu_io("hd", "write -P 0xa2 128k 64k")
+
+        # Verify the data that we just wrote
+        self.run_qemu_io("hd", "read -P 0xa0    0 64k")
+        self.run_qemu_io("hd", "read -P 0xa1  64k 64k")
+        self.run_qemu_io("hd", "read -P 0xa2 128k 64k")
+
+        self.vm.shutdown()
+
+        # Check the first byte of the first three L2 entries and verify that
+        # the second one is compressed (0x40) while the others are not (0x80)
+        iotests.qemu_io_log('-f', 'raw', '-c', 'read -P 0x80 0x40000 1',
+                                         '-c', 'read -P 0x40 0x40008 1',
+                                         '-c', 'read -P 0x80 0x40010 1', hd_path[0])
+
     # Misc reopen tests with different block drivers
     @iotests.skip_if_unsupported(['quorum', 'throttle'])
     def test_misc_drivers(self):
diff --git a/tests/qemu-iotests/245.out b/tests/qemu-iotests/245.out
index 4b33dcaf5c..6ea1b2798f 100644
--- a/tests/qemu-iotests/245.out
+++ b/tests/qemu-iotests/245.out
@@ -10,8 +10,15 @@
 {"return": {}}
 {"data": {"id": "stream0", "type": "stream"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 {"data": {"device": "stream0", "len": 3145728, "offset": 3145728, "speed": 0, "type": "stream"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
-.....................
+read 1/1 bytes at offset 262144
+1 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 1/1 bytes at offset 262152
+1 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 1/1 bytes at offset 262160
+1 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+........................
 ----------------------------------------------------------------------
-Ran 21 tests
+Ran 24 tests
 
 OK
-- 
2.20.1


