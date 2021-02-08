Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B02314442
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 00:47:59 +0100 (CET)
Received: from localhost ([::1]:45634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9GG7-0005bF-0p
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 18:47:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1l9BXY-0008LW-Sl; Mon, 08 Feb 2021 13:45:40 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:46559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1l9BXN-0006o4-KE; Mon, 08 Feb 2021 13:45:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=PgM0mMAqMJNtmF60oidG6olTXXxwlo5tWPQ7kz8W8CY=; 
 b=aIXSA4dtwRzqfSbXeQ3vyol4WnxhRPR5m7VNvd+jhDn7XYfOEFSRGOYzmLC2bd2NZJuuVn7VVUTCMB/XgvqOv9jcx0Tj2EjYAuSIXb0BiaCRJubdE8x2qUNc/KeflDaz0qW6XoiKWv8CmcCJWZJwB/xdBzL7TlxNZJWC5nViKlb7w8nwBFiT0btBJPl7LilePw7T3RL3fzMtsaBhz/zuB8EfU2iu/iPNca0871qguB+CmjrDiNznYGJL558cZ/xOiqb059S2rppV1z5tCLLfA/YjAQCVErkt8wrvWCgEthpgJlf+HpaspciFwAI328QNnaSkmvJNjJw5Evq5mt6VLQ==;
Received: from [213.94.25.37] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1l9BWw-000567-MB; Mon, 08 Feb 2021 19:45:02 +0100
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1l9BWj-000087-Ni; Mon, 08 Feb 2021 19:44:49 +0100
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 4/4] iotests: Test reopening multiple devices at the
 same time
Date: Mon,  8 Feb 2021 19:44:44 +0100
Message-Id: <8c976fdb937c8c07b3b9829e6b4e6760d62a130b.1612809837.git.berto@igalia.com>
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
 tests/qemu-iotests/245     | 40 ++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/245.out |  4 ++--
 2 files changed, 42 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/245 b/tests/qemu-iotests/245
index 850c9f070b..d18dbbe638 100755
--- a/tests/qemu-iotests/245
+++ b/tests/qemu-iotests/245
@@ -574,6 +574,46 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         self.reopen(opts, {'file': 'hd1-file'})
         self.run_qemu_io("hd", "read  -P 0xa1 0 10k")
 
+    def test_swap_files(self):
+        opts0 = hd_opts(0)
+        opts2 = hd_opts(2)
+
+        # Add hd0 and hd2 (none of them with backing files)
+        result = self.vm.qmp('blockdev-add', conv_keys = False, **opts0)
+        self.assert_qmp(result, 'return', {})
+        result = self.vm.qmp('blockdev-add', conv_keys = False, **opts2)
+        self.assert_qmp(result, 'return', {})
+
+        # Write different data to both block devices
+        self.run_qemu_io("hd0", "write -P 0xa0 0 1k")
+        self.run_qemu_io("hd2", "write -P 0xa2 0 1k")
+
+        # Check that the data reads correctly
+        self.run_qemu_io("hd0", "read  -P 0xa0 0 1k")
+        self.run_qemu_io("hd2", "read  -P 0xa2 0 1k")
+
+        # It's not possible to make a block device use an image that
+        # is already being used by the other device.
+        self.reopen(opts0, {'file': 'hd2-file'},
+                    "Conflicts with use by hd0 as 'file', which does not allow 'write, resize' on hd2-file")
+        self.reopen(opts2, {'file': 'hd0-file'},
+                    "Conflicts with use by hd2 as 'file', which does not allow 'write, resize' on hd0-file")
+
+        # But we can swap the images if we reopen both devices at the
+        # same time
+        opts0['file'] = 'hd2-file'
+        opts2['file'] = 'hd0-file'
+        self.reopenMultiple([opts0, opts2])
+        self.run_qemu_io("hd0", "read  -P 0xa2 0 1k")
+        self.run_qemu_io("hd2", "read  -P 0xa0 0 1k")
+
+        # And we can of course come back to the original state
+        opts0['file'] = 'hd0-file'
+        opts2['file'] = 'hd2-file'
+        self.reopenMultiple([opts0, opts2])
+        self.run_qemu_io("hd0", "read  -P 0xa0 0 1k")
+        self.run_qemu_io("hd2", "read  -P 0xa2 0 1k")
+
     def test_insert_throttle_filter(self):
         hd0_opts = hd_opts(0)
         result = self.vm.qmp('blockdev-add', conv_keys = False, **hd0_opts)
diff --git a/tests/qemu-iotests/245.out b/tests/qemu-iotests/245.out
index 537a2b5b63..1f9debbd61 100644
--- a/tests/qemu-iotests/245.out
+++ b/tests/qemu-iotests/245.out
@@ -10,8 +10,8 @@
 {"return": {}}
 {"data": {"id": "stream0", "type": "stream"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 {"data": {"device": "stream0", "len": 3145728, "offset": 3145728, "speed": 0, "type": "stream"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
-.......................
+........................
 ----------------------------------------------------------------------
-Ran 23 tests
+Ran 24 tests
 
 OK
-- 
2.20.1


