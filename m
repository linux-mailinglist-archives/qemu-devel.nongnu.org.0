Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F13332ED2
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 20:13:57 +0100 (CET)
Received: from localhost ([::1]:43014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJhnn-0007vs-Om
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 14:13:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lJfrH-0001F5-PX; Tue, 09 Mar 2021 12:09:25 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:40104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lJfrC-0001DM-9d; Tue, 09 Mar 2021 12:09:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=A+T1bSKlqEkwVYZoX1JnDjc+/+etM1HIC9Kf9E/14T0=; 
 b=SnodUm8tQFHllmTcHuMgDCMfnBZEY0Ju/t4OiPGP6Xd7WIpXuclO8QM+KAucA7bnWqiB1Y0VZqy9cCiKgK4l/ya+YJpU3y01huDSmxsz4RSXxWUO77yuqTbePL2SM3VJ7eHCclcq54ggLHQ/sCniHjzUELf0YAQHU7aBfIcDi0wZssac6cRCm0a+Lye5MjaJ62kEr2ktaTLazbji/nxwrfMMANQb++AeZurjKdP04GC/QwC98uzUTwyA+ZSg26NS3o8vh0p1opVSpqWkb36WLyJayTkvyvdl2wTB7xivJf0RL6bpVnXFwAuxU7cQQ1ppyVcrkleVDID78F387eUaGA==;
Received: from [213.94.25.37] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1lJfqn-0003Lr-QJ; Tue, 09 Mar 2021 18:08:53 +0100
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1lJfqa-0005IX-M4; Tue, 09 Mar 2021 18:08:40 +0100
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/6] iotests: Test replacing files with x-blockdev-reopen
Date: Tue,  9 Mar 2021 18:08:29 +0100
Message-Id: <4bd25cbdac5d14fb980133ca7ec8fd9772f8a4a2.1615309297.git.berto@igalia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1615309297.git.berto@igalia.com>
References: <cover.1615309297.git.berto@igalia.com>
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
index 52c2ed7c2d..1549a42e2b 100755
--- a/tests/qemu-iotests/245
+++ b/tests/qemu-iotests/245
@@ -78,7 +78,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         for line in log.split("\n"):
             if line.startswith("Pattern verification failed"):
                 raise Exception("%s (command #%d)" % (line, found))
-            if re.match("read .*/.* bytes at offset", line):
+            if re.match("(read|wrote) .*/.* bytes at offset", line):
                 found += 1
         self.assertEqual(found, self.total_io_cmds,
                          "Expected output of %d qemu-io commands, found %d" %
@@ -536,6 +536,113 @@ class TestBlockdevReopen(iotests.QMPTestCase):
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


