Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA39332EE3
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 20:20:08 +0100 (CET)
Received: from localhost ([::1]:53060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJhtn-0004gk-4h
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 14:20:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lJfrK-0001Gb-Nt; Tue, 09 Mar 2021 12:09:27 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:40108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lJfrC-0001DP-8y; Tue, 09 Mar 2021 12:09:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=sLcazRBYDZOTf/U/pqyZY5+acPdr0M5SVvjch2P+1lw=; 
 b=R+K7NMw7TYdGg1TdozkGzeuQYnizJpGmcGqyFSA3bORXo3QZj2IrRtx3ljuLQktwYTbCp+5Hwv/U/I3767KxdFBtzC7fKBpZAItlMCq7Vt2+j7ynOdHK1uCQPlgVCY5iwfn/0CvujsniuFQw8/GJlxsvIMy1nv1BRj1urymSFKg0PVqCmzPdCfG4czP8vBVj/Co5Cn01V+FywASuzqCPkmTWofHSjqYujNuI9EtRwNbumysLCLq9G1CeZHx36f490yu2Y6G2CZyRqSTFZarY0AVZyXVvysF/TTcerJCDX4JGPRJ5mTLC6NjYlKAc+CVpA6lq5zBCo+ClyMMb3ubjZQ==;
Received: from [213.94.25.37] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1lJfqn-0003Lt-P1; Tue, 09 Mar 2021 18:08:53 +0100
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1lJfqa-0005Ib-OO; Tue, 09 Mar 2021 18:08:40 +0100
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/6] iotests: Test reopening multiple devices at the same
 time
Date: Tue,  9 Mar 2021 18:08:31 +0100
Message-Id: <23d5f5437212a7d9640c663e6c32daf8f31ae8cb.1615309297.git.berto@igalia.com>
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

This test swaps the images used by two active block devices.

This is now possible thanks to the new ability to run
x-blockdev-reopen on multiple devices at the same time.

Signed-off-by: Alberto Garcia <berto@igalia.com>
---
 tests/qemu-iotests/245     | 41 ++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/245.out |  4 ++--
 2 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/245 b/tests/qemu-iotests/245
index 53281228bc..fb11eb146d 100755
--- a/tests/qemu-iotests/245
+++ b/tests/qemu-iotests/245
@@ -648,6 +648,47 @@ class TestBlockdevReopen(iotests.QMPTestCase):
                                          '-c', 'read -P 0x40 0x40008 1',
                                          '-c', 'read -P 0x80 0x40010 1', hd_path[0])
 
+    # Swap the disk images of two active block devices
+    def test_swap_files(self):
+        # Add hd0 and hd2 (none of them with backing files)
+        opts0 = hd_opts(0)
+        result = self.vm.qmp('blockdev-add', conv_keys = False, **opts0)
+        self.assert_qmp(result, 'return', {})
+
+        opts2 = hd_opts(2)
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
     # Misc reopen tests with different block drivers
     @iotests.skip_if_unsupported(['quorum', 'throttle'])
     def test_misc_drivers(self):
diff --git a/tests/qemu-iotests/245.out b/tests/qemu-iotests/245.out
index 6ea1b2798f..c4230b51d1 100644
--- a/tests/qemu-iotests/245.out
+++ b/tests/qemu-iotests/245.out
@@ -17,8 +17,8 @@ read 1/1 bytes at offset 262152
 read 1/1 bytes at offset 262160
 1 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 
-........................
+.........................
 ----------------------------------------------------------------------
-Ran 24 tests
+Ran 25 tests
 
 OK
-- 
2.20.1


