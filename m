Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2751C2AF704
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 17:56:41 +0100 (CET)
Received: from localhost ([::1]:52850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kctQF-0004wb-Mf
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 11:56:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kctOG-0003uf-Dw; Wed, 11 Nov 2020 11:54:36 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:38401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kctOE-00042Q-4S; Wed, 11 Nov 2020 11:54:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=Ty7V6yYhUsrsBEW9hpoAzsnk1Eqy0SzMXTEJR2uFaE4=; 
 b=rUHKFbWi2wp3/up4AlLXaZfYg3hdnusPUbh5a4ix5CfZ1plmSBS/1V08bWaUiZ6UpeTmANCwsfEcDvPiogCvlVnwRyZftSD3M/EREqW5ZnRAXeg8D0WfwAWcf0VM0JY0W4ja0Gew5BH8zwlcxxrEToWfnSr6liSa0rURmUdOSpmPpmSI76LJhXcYW9JqnovUIy9kkcy6dh6sL4i6p5gonHF+nal4CrllaicvnYyKLx1uIMov3qg32Y9D4e2TEaH8Yobrgyds8nkd2qtHzozy7b+VIa+J6zZ1LP4e6YeyGqoH77kmyo1bdeh7nTVgWAJUGZZ3F1+oqClkW07MrhxD/Q==;
Received: from [213.94.31.64] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1kctNq-0007uS-K8; Wed, 11 Nov 2020 17:54:10 +0100
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1kctNc-0003m2-Tf; Wed, 11 Nov 2020 17:53:56 +0100
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/2] quorum: Implement bdrv_co_pwrite_zeroes()
Date: Wed, 11 Nov 2020 17:53:55 +0100
Message-Id: <2faad461e6bffc4a50547547b8c20c39e0f544e8.1605111801.git.berto@igalia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1605111801.git.berto@igalia.com>
References: <cover.1605111801.git.berto@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 11:54:12
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic] [fuzzy]
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
Cc: Kevin Wolf <kwolf@redhat.com>, Tao Xu <tao3.xu@intel.com>,
 Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This simply calls bdrv_co_pwrite_zeroes() in all children

Signed-off-by: Alberto Garcia <berto@igalia.com>
---
 block/quorum.c             | 18 ++++++++++++++++--
 tests/qemu-iotests/312     |  7 +++++++
 tests/qemu-iotests/312.out |  4 ++++
 3 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/block/quorum.c b/block/quorum.c
index 9691a9bee9..c81572f513 100644
--- a/block/quorum.c
+++ b/block/quorum.c
@@ -692,8 +692,13 @@ static void write_quorum_entry(void *opaque)
     QuorumChildRequest *sacb = &acb->qcrs[i];
 
     sacb->bs = s->children[i]->bs;
-    sacb->ret = bdrv_co_pwritev(s->children[i], acb->offset, acb->bytes,
-                                acb->qiov, acb->flags);
+    if (acb->flags & BDRV_REQ_ZERO_WRITE) {
+        sacb->ret = bdrv_co_pwrite_zeroes(s->children[i], acb->offset,
+                                          acb->bytes, acb->flags);
+    } else {
+        sacb->ret = bdrv_co_pwritev(s->children[i], acb->offset, acb->bytes,
+                                    acb->qiov, acb->flags);
+    }
     if (sacb->ret == 0) {
         acb->success_count++;
     } else {
@@ -739,6 +744,14 @@ static int quorum_co_pwritev(BlockDriverState *bs, uint64_t offset,
     return ret;
 }
 
+static int quorum_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset,
+                                   int bytes, BdrvRequestFlags flags)
+
+{
+    return quorum_co_pwritev(bs, offset, bytes, NULL,
+                             flags | BDRV_REQ_ZERO_WRITE);
+}
+
 static int64_t quorum_getlength(BlockDriverState *bs)
 {
     BDRVQuorumState *s = bs->opaque;
@@ -1251,6 +1264,7 @@ static BlockDriver bdrv_quorum = {
 
     .bdrv_co_preadv                     = quorum_co_preadv,
     .bdrv_co_pwritev                    = quorum_co_pwritev,
+    .bdrv_co_pwrite_zeroes              = quorum_co_pwrite_zeroes,
 
     .bdrv_add_child                     = quorum_add_child,
     .bdrv_del_child                     = quorum_del_child,
diff --git a/tests/qemu-iotests/312 b/tests/qemu-iotests/312
index 1b08f1552f..93046393e7 100755
--- a/tests/qemu-iotests/312
+++ b/tests/qemu-iotests/312
@@ -114,6 +114,13 @@ $QEMU_IO -c "write -P 0 $((0x200000)) $((0x10000))" "$TEST_IMG.0" | _filter_qemu
 $QEMU_IO -c "write -z   $((0x200000)) $((0x30000))" "$TEST_IMG.1" | _filter_qemu_io
 $QEMU_IO -c "write -P 0 $((0x200000)) $((0x20000))" "$TEST_IMG.2" | _filter_qemu_io
 
+# Test 5: write data to a region and then zeroize it, doing it
+# directly on the quorum device instead of the individual images.
+# This has no effect on the end result but proves that the quorum driver
+# supports 'write -z'.
+$QEMU_IO -c "open -o $quorum" -c "write $((0x250000)) $((0x10000))" | _filter_qemu_io
+$QEMU_IO -c "open -o $quorum" -c "write -z $((0x250000)) $((0x10000))" | _filter_qemu_io
+
 echo
 echo '### Launch the drive-mirror job'
 echo
diff --git a/tests/qemu-iotests/312.out b/tests/qemu-iotests/312.out
index 4ae749175b..778dda95c7 100644
--- a/tests/qemu-iotests/312.out
+++ b/tests/qemu-iotests/312.out
@@ -39,6 +39,10 @@ wrote 196608/196608 bytes at offset 2097152
 192 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 wrote 131072/131072 bytes at offset 2097152
 128 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+wrote 65536/65536 bytes at offset 2424832
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+wrote 65536/65536 bytes at offset 2424832
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 
 ### Launch the drive-mirror job
 
-- 
2.20.1


