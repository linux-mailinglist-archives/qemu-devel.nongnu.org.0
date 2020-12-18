Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC222DE6BB
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 16:37:02 +0100 (CET)
Received: from localhost ([::1]:47354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqHoT-0004QY-MZ
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 10:37:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqHSB-0002xI-LA
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:13:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqHS8-0005b7-Ga
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:13:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608304435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R/hOmvFwDOtIOQGX7c1jZLrvK6WQnrE3kQaHrbdYWaU=;
 b=AY1d+yeQrNjCXR9SH1e9SNygsU3INcuzMd5Qm5eYX+1sRBQGRgT3WyRccdoF4Np1WkrMOJ
 ReIcRs0yKTIoQHj/YgOmFP/EX1XQtEQqan/KmJAJpU/OotlQLFAoo7U8oEyVCCF7Fn/cPA
 UApH8m/ON/gMvlICD+WI6f320o09uzE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-ALHM8o1KPuec-4m5DX6waw-1; Fri, 18 Dec 2020 10:13:54 -0500
X-MC-Unique: ALHM8o1KPuec-4m5DX6waw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D12F6190B2A1;
 Fri, 18 Dec 2020 15:13:52 +0000 (UTC)
Received: from localhost (ovpn-114-84.ams2.redhat.com [10.36.114.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7150210016FF;
 Fri, 18 Dec 2020 15:13:52 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 27/30] quorum: Implement bdrv_co_pwrite_zeroes()
Date: Fri, 18 Dec 2020 16:12:46 +0100
Message-Id: <20201218151249.715731-28-mreitz@redhat.com>
In-Reply-To: <20201218151249.715731-1-mreitz@redhat.com>
References: <20201218151249.715731-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alberto Garcia <berto@igalia.com>

This simply calls bdrv_co_pwrite_zeroes() in all children.

bs->supported_zero_flags is also set to the flags that are supported
by all children.

Signed-off-by: Alberto Garcia <berto@igalia.com>
Message-Id: <2f09c842781fe336b4c2e40036bba577b7430190.1605286097.git.berto@igalia.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/quorum.c             | 36 ++++++++++++++++++++++++++++++++++--
 tests/qemu-iotests/312     | 11 +++++++++++
 tests/qemu-iotests/312.out |  8 ++++++++
 3 files changed, 53 insertions(+), 2 deletions(-)

diff --git a/block/quorum.c b/block/quorum.c
index ae62b206c9..0bd75450de 100644
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
 
@@ -1256,6 +1287,7 @@ static BlockDriver bdrv_quorum = {
 
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
2.29.2


