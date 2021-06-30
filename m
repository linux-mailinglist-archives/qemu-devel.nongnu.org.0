Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8A03B86FB
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 18:22:32 +0200 (CEST)
Received: from localhost ([::1]:60034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lycyt-0003UQ-QN
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 12:22:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lycft-0002zA-Ov
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:02:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lycfa-00076D-5n
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:02:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625068953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CJKTkTZ4uMQcizttwS9+dN21D02u2uEK+7NsYrSQPVg=;
 b=DD0J37VfephsLiC2O0X/s1YFpBMTWYI5alyN8hr/YSfTK5bhEMUa4QmiYBy7P/p8zC3AJN
 FduF7RZkoXOHAZ0suExXeX84N8GQfsEbvhxuQL1WK6XdX11nkCCDotI5ONtOsCVF9SDBQ4
 uPkaq5A7ROFdOSGhbl2wYwLDy9gKtm4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-BaHIyJ2HPJWg7rLBdtdqPw-1; Wed, 30 Jun 2021 12:02:30 -0400
X-MC-Unique: BaHIyJ2HPJWg7rLBdtdqPw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D54D0800D55;
 Wed, 30 Jun 2021 16:02:28 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-114.ams2.redhat.com [10.36.114.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E21D8604CD;
 Wed, 30 Jun 2021 16:02:27 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 14/24] iotests: Test replacing files with x-blockdev-reopen
Date: Wed, 30 Jun 2021 18:01:56 +0200
Message-Id: <20210630160206.276439-15-kwolf@redhat.com>
In-Reply-To: <20210630160206.276439-1-kwolf@redhat.com>
References: <20210630160206.276439-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alberto Garcia <berto@igalia.com>

This patch adds new tests in which we use x-blockdev-reopen to change
bs->file

Signed-off-by: Alberto Garcia <berto@igalia.com>
Message-Id: <20210610120537.196183-10-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/245     | 109 ++++++++++++++++++++++++++++++++++++-
 tests/qemu-iotests/245.out |  11 +++-
 2 files changed, 117 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/245 b/tests/qemu-iotests/245
index d955e0dfd3..0295129cbb 100755
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
index 99c12f4f98..daf1e51922 100644
--- a/tests/qemu-iotests/245.out
+++ b/tests/qemu-iotests/245.out
@@ -10,8 +10,15 @@
 {"return": {}}
 {"data": {"id": "stream0", "type": "stream"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 {"data": {"device": "stream0", "len": 3145728, "offset": 3145728, "speed": 0, "type": "stream"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
-...............
+....read 1/1 bytes at offset 262144
+1 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 1/1 bytes at offset 262152
+1 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 1/1 bytes at offset 262160
+1 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+..............
 ----------------------------------------------------------------------
-Ran 21 tests
+Ran 24 tests
 
 OK
-- 
2.31.1


