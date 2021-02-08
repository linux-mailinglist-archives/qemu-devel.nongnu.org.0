Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3E031435A
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 23:58:59 +0100 (CET)
Received: from localhost ([::1]:42302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9FUg-0003Ls-RV
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 17:58:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1l9BXX-0008Jp-Ti; Mon, 08 Feb 2021 13:45:39 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:46561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1l9BXN-0006o7-Ko; Mon, 08 Feb 2021 13:45:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=D/3jKyHLwJmlaYsfs930G7WJY9pPcoP2AfxzDeDVO/w=; 
 b=LQNZEzkcy6TRN12NQY1p3m0fWYiKmUXthPJ0Dsm3xrPiUlyMY9/gauoTIHlUs1VSbbCpRxZxz12X+hz12u7SEKDcmhnk3XQeuZXcsuW43X/OLPryWPCP8X1BAX8AGbB2Jpx9cocS6AVaU+Qc0QROs9sEaoU28DYDT0VI7glUGmlTtypyUJ0nwfJJj38s/dkYAbovlArRsqTcDmbwlzE1a4HKen/qf5O52qDEc4TBn1p7At/OhWJ1ZaZu+q18ALffyrcVP+I/GIinPwzVv1xSDLZM8ZzjMayAmRxjsNB7Yxeriwzs3gwomutWkeNvJ/yvd6OAwqX0GtDUWAvetIIpAg==;
Received: from [213.94.25.37] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1l9BWw-000568-LL; Mon, 08 Feb 2021 19:45:02 +0100
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1l9BWj-000083-LF; Mon, 08 Feb 2021 19:44:49 +0100
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 2/4] iotests: Update 245 to support replacing files
 with x-blockdev-reopen
Date: Mon,  8 Feb 2021 19:44:42 +0100
Message-Id: <74cbe313dce107f6100751f1c42296769f05a7ef.1612809837.git.berto@igalia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1612809837.git.berto@igalia.com>
References: <cover.1612809837.git.berto@igalia.com>
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

Signed-off-by: Alberto Garcia <berto@igalia.com>
---
 tests/qemu-iotests/245     | 54 +++++++++++++++++++++++++++++++++++++-
 tests/qemu-iotests/245.out |  4 +--
 2 files changed, 55 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/245 b/tests/qemu-iotests/245
index f9d68b3958..bad6911f0c 100755
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
@@ -536,6 +536,58 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         result = self.vm.qmp('blockdev-del', conv_keys = True, node_name = 'bv')
         self.assert_qmp(result, 'return', {})
 
+    def test_replace_file(self):
+        qemu_img('create', '-f', 'raw', hd_path[0], '10k')
+        qemu_img('create', '-f', 'raw', hd_path[1], '10k')
+
+        hd0_opts = {'driver': 'file',
+                    'node-name': 'hd0-file',
+                    'filename':  hd_path[0] }
+        hd1_opts = {'driver': 'file',
+                    'node-name': 'hd1-file',
+                    'filename':  hd_path[1] }
+
+        opts = {'driver': 'raw', 'node-name': 'hd', 'file': 'hd0-file'}
+
+        result = self.vm.qmp('blockdev-add', conv_keys = False, **hd0_opts)
+        self.assert_qmp(result, 'return', {})
+        result = self.vm.qmp('blockdev-add', conv_keys = False, **hd1_opts)
+        self.assert_qmp(result, 'return', {})
+        result = self.vm.qmp('blockdev-add', conv_keys = False, **opts)
+        self.assert_qmp(result, 'return', {})
+
+        self.run_qemu_io("hd", "read  -P 0 0 10k")
+        self.run_qemu_io("hd", "write -P 0xa0 0 10k")
+
+        self.reopen(opts, {'file': 'hd1-file'})
+        self.run_qemu_io("hd", "read  -P 0 0 10k")
+        self.run_qemu_io("hd", "write -P 0xa1 0 10k")
+
+        self.reopen(opts, {'file': 'hd0-file'})
+        self.run_qemu_io("hd", "read  -P 0xa0 0 10k")
+
+        self.reopen(opts, {'file': 'hd1-file'})
+        self.run_qemu_io("hd", "read  -P 0xa1 0 10k")
+
+    def test_insert_throttle_filter(self):
+        hd0_opts = hd_opts(0)
+        result = self.vm.qmp('blockdev-add', conv_keys = False, **hd0_opts)
+        self.assert_qmp(result, 'return', {})
+
+        opts = { 'qom-type': 'throttle-group', 'id': 'group0',
+                 'props': { 'limits': { 'iops-total': 1000 } } }
+        result = self.vm.qmp('object-add', conv_keys = False, **opts)
+        self.assert_qmp(result, 'return', {})
+
+        opts = { 'driver': 'throttle', 'node-name': 'throttle0',
+                 'throttle-group': 'group0', 'file': 'hd0-file' }
+        result = self.vm.qmp('blockdev-add', conv_keys = False, **opts)
+        self.assert_qmp(result, 'return', {})
+
+        self.reopen(hd0_opts, {'file': 'throttle0'})
+
+        self.reopen(hd0_opts, {'file': 'hd0-file'})
+
     # Misc reopen tests with different block drivers
     @iotests.skip_if_unsupported(['quorum', 'throttle'])
     def test_misc_drivers(self):
diff --git a/tests/qemu-iotests/245.out b/tests/qemu-iotests/245.out
index 4b33dcaf5c..537a2b5b63 100644
--- a/tests/qemu-iotests/245.out
+++ b/tests/qemu-iotests/245.out
@@ -10,8 +10,8 @@
 {"return": {}}
 {"data": {"id": "stream0", "type": "stream"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 {"data": {"device": "stream0", "len": 3145728, "offset": 3145728, "speed": 0, "type": "stream"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
-.....................
+.......................
 ----------------------------------------------------------------------
-Ran 21 tests
+Ran 23 tests
 
 OK
-- 
2.20.1


