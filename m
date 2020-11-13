Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9DB2B2108
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 17:54:41 +0100 (CET)
Received: from localhost ([::1]:43184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdcLQ-0004ST-Bj
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 11:54:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kdcJk-0002zs-VB; Fri, 13 Nov 2020 11:52:56 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:47299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kdcJh-0003Qk-97; Fri, 13 Nov 2020 11:52:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=Ufy7ZBhgCN+vtFnDFOVNFx0TlhuUmZhHjH8T6L7hwCY=; 
 b=YZVJlYHg2Cor2xjDpJXybyj257ksiNyUT6FrlzhE6xXvViIgUTwikyaCfroIrA1oIFZrIapTSg2oJsA425rqrTJ69x81kWTQs+WxiuEnW3RcRSzZ2geQeVUjxZA3kf+yyr0QSXMBjeb5qAZ2Poh/oPvhwRxq9GI9HtDDu4lfi38eCRM8b9mtmiZ6fyFnal9BgS/bWcROHAatKAbUpP6fqdVCYdf+DN3tDrR52U+kDpKalbMQF7rxgYDLHT/V2Ve10QDWuCDKJlxf/6pKKxldA6nzFxo5SDlrqeJJ4ZhSsxrLNhm4CY4Eui30ro8D+0/3JHu6GEJrHcwVLZg7Gg6Hpw==;
Received: from [213.94.31.64] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1kdcJc-0008O4-Ag; Fri, 13 Nov 2020 17:52:48 +0100
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1kdcJP-0002hj-AX; Fri, 13 Nov 2020 17:52:35 +0100
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/2] quorum: Implement bdrv_co_pwrite_zeroes()
Date: Fri, 13 Nov 2020 17:52:32 +0100
Message-Id: <2f09c842781fe336b4c2e40036bba577b7430190.1605286097.git.berto@igalia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1605286097.git.berto@igalia.com>
References: <cover.1605286097.git.berto@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/13 11:07:49
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

This simply calls bdrv_co_pwrite_zeroes() in all children.

bs->supported_zero_flags is also set to the flags that are supported
by all children.

Signed-off-by: Alberto Garcia <berto@igalia.com>
---
 block/quorum.c             | 36 ++++++++++++++++++++++++++++++++++--
 tests/qemu-iotests/312     | 11 +++++++++++
 tests/qemu-iotests/312.out |  8 ++++++++
 3 files changed, 53 insertions(+), 2 deletions(-)

diff --git a/block/quorum.c b/block/quorum.c
index 9691a9bee9..b70d365ba9 100644
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
@@ -897,6 +910,21 @@ static QemuOptsList quorum_runtime_opts = {
     },
 };
 
+static void quorum_refresh_flags(BlockDriverState *bs)
+{
+    BDRVQuorumState *s = bs->opaque;
+    int i;
+
+    bs->supported_zero_flags =
+        BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK;
+
+    for (i = 0; i < s->num_children; i++) {
+        bs->supported_zero_flags &= s->children[i]->bs->supported_zero_flags;
+    }
+
+    bs->supported_zero_flags |= BDRV_REQ_WRITE_UNCHANGED;
+}
+
 static int quorum_open(BlockDriverState *bs, QDict *options, int flags,
                        Error **errp)
 {
@@ -991,6 +1019,7 @@ static int quorum_open(BlockDriverState *bs, QDict *options, int flags,
     s->next_child_index = s->num_children;
 
     bs->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED;
+    quorum_refresh_flags(bs);
 
     g_free(opened);
     goto exit;
@@ -1062,6 +1091,7 @@ static void quorum_add_child(BlockDriverState *bs, BlockDriverState *child_bs,
     }
     s->children = g_renew(BdrvChild *, s->children, s->num_children + 1);
     s->children[s->num_children++] = child;
+    quorum_refresh_flags(bs);
 
 out:
     bdrv_drained_end(bs);
@@ -1106,6 +1136,7 @@ static void quorum_del_child(BlockDriverState *bs, BdrvChild *child,
     s->children = g_renew(BdrvChild *, s->children, --s->num_children);
     bdrv_unref_child(bs, child);
 
+    quorum_refresh_flags(bs);
     bdrv_drained_end(bs);
 }
 
@@ -1251,6 +1282,7 @@ static BlockDriver bdrv_quorum = {
 
     .bdrv_co_preadv                     = quorum_co_preadv,
     .bdrv_co_pwritev                    = quorum_co_pwritev,
+    .bdrv_co_pwrite_zeroes              = quorum_co_pwrite_zeroes,
 
     .bdrv_add_child                     = quorum_add_child,
     .bdrv_del_child                     = quorum_del_child,
diff --git a/tests/qemu-iotests/312 b/tests/qemu-iotests/312
index 1b08f1552f..41340494b0 100755
--- a/tests/qemu-iotests/312
+++ b/tests/qemu-iotests/312
@@ -114,6 +114,17 @@ $QEMU_IO -c "write -P 0 $((0x200000)) $((0x10000))" "$TEST_IMG.0" | _filter_qemu
 $QEMU_IO -c "write -z   $((0x200000)) $((0x30000))" "$TEST_IMG.1" | _filter_qemu_io
 $QEMU_IO -c "write -P 0 $((0x200000)) $((0x20000))" "$TEST_IMG.2" | _filter_qemu_io
 
+# Test 5: write data to a region and then zeroize it, doing it
+# directly on the quorum device instead of the individual images.
+# This has no effect on the end result but proves that the quorum driver
+# supports 'write -z'.
+$QEMU_IO -c "open -o $quorum" -c "write -P 1 $((0x250000)) $((0x10000))" | _filter_qemu_io
+# Verify the data that we just wrote
+$QEMU_IO -c "open -o $quorum" -c "read -P 1 $((0x250000)) $((0x10000))" | _filter_qemu_io
+$QEMU_IO -c "open -o $quorum" -c "write -z $((0x250000)) $((0x10000))" | _filter_qemu_io
+# Now it should read back as zeroes
+$QEMU_IO -c "open -o $quorum" -c "read -P 0 $((0x250000)) $((0x10000))" | _filter_qemu_io
+
 echo
 echo '### Launch the drive-mirror job'
 echo
diff --git a/tests/qemu-iotests/312.out b/tests/qemu-iotests/312.out
index 4ae749175b..cdd5c40e08 100644
--- a/tests/qemu-iotests/312.out
+++ b/tests/qemu-iotests/312.out
@@ -39,6 +39,14 @@ wrote 196608/196608 bytes at offset 2097152
 192 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 wrote 131072/131072 bytes at offset 2097152
 128 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+wrote 65536/65536 bytes at offset 2424832
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 65536/65536 bytes at offset 2424832
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+wrote 65536/65536 bytes at offset 2424832
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 65536/65536 bytes at offset 2424832
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 
 ### Launch the drive-mirror job
 
-- 
2.20.1


