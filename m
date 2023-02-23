Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A37AC6A0FE5
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 19:56:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVGhb-00070G-G5; Thu, 23 Feb 2023 13:52:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVGhX-0006wO-Mu
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:52:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVGhV-0003DX-MA
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:52:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677178337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nC3ovy7qtk9aruUXNIG3lMrB0IpueMp54Ynv+J0TinI=;
 b=QfZlzUy2Yt0glwUgT0RzJxzP9RGS3W0NUb+BW9aOvbKXvBLa/74+LfRb87eIP4rxP9Y7FP
 MK5Z8E9b9FxMqkJAhu1f314n90xn1UqzAd53adf91+enj8sQTHSvlXUQ/2j3kA3YvzLgCo
 Z7iB4C//bqcMR6zg61pgGO6g6wVQyBA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-320-dAab6fNxOQey4-lKR2bznw-1; Thu, 23 Feb 2023 13:52:13 -0500
X-MC-Unique: dAab6fNxOQey4-lKR2bznw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD473858F0E;
 Thu, 23 Feb 2023 18:52:12 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.192.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 242E81121314;
 Thu, 23 Feb 2023 18:52:12 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 23/29] block: Mark bdrv_co_refresh_total_sectors() and callers
 GRAPH_RDLOCK
Date: Thu, 23 Feb 2023 19:51:40 +0100
Message-Id: <20230223185146.306454-24-kwolf@redhat.com>
In-Reply-To: <20230223185146.306454-1-kwolf@redhat.com>
References: <20230223185146.306454-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This adds GRAPH_RDLOCK annotations to declare that callers of
bdrv_co_refresh_total_sectors() need to hold a reader lock for the
graph.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20230203152202.49054-24-kwolf@redhat.com>
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block-io.h         | 8 ++++----
 include/block/block_int-common.h | 4 +++-
 include/block/block_int-io.h     | 7 ++++---
 block.c                          | 3 +++
 block/blkdebug.c                 | 3 ++-
 block/blklogwrites.c             | 3 ++-
 block/blkreplay.c                | 3 ++-
 block/blkverify.c                | 3 ++-
 block/copy-on-read.c             | 2 +-
 block/crypto.c                   | 3 ++-
 block/filter-compress.c          | 3 ++-
 block/mirror.c                   | 3 +++
 block/preallocate.c              | 3 ++-
 block/quorum.c                   | 3 ++-
 block/raw-format.c               | 3 ++-
 block/replication.c              | 3 ++-
 block/stream.c                   | 8 +++++---
 block/throttle.c                 | 3 ++-
 18 files changed, 45 insertions(+), 23 deletions(-)

diff --git a/include/block/block-io.h b/include/block/block-io.h
index 95bcc79b75..5da99d4d60 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -78,11 +78,11 @@ int coroutine_fn GRAPH_RDLOCK
 bdrv_co_truncate(BdrvChild *child, int64_t offset, bool exact,
                  PreallocMode prealloc, BdrvRequestFlags flags, Error **errp);
 
-int64_t coroutine_fn bdrv_co_nb_sectors(BlockDriverState *bs);
-int64_t co_wrapper_mixed bdrv_nb_sectors(BlockDriverState *bs);
+int64_t coroutine_fn GRAPH_RDLOCK bdrv_co_nb_sectors(BlockDriverState *bs);
+int64_t co_wrapper_mixed_bdrv_rdlock bdrv_nb_sectors(BlockDriverState *bs);
 
-int64_t coroutine_fn bdrv_co_getlength(BlockDriverState *bs);
-int64_t co_wrapper_mixed bdrv_getlength(BlockDriverState *bs);
+int64_t coroutine_fn GRAPH_RDLOCK bdrv_co_getlength(BlockDriverState *bs);
+int64_t co_wrapper_mixed_bdrv_rdlock bdrv_getlength(BlockDriverState *bs);
 
 int64_t coroutine_fn bdrv_co_get_allocated_file_size(BlockDriverState *bs);
 int64_t co_wrapper bdrv_get_allocated_file_size(BlockDriverState *bs);
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index d72e31aba3..d419017328 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -684,7 +684,9 @@ struct BlockDriver {
         BlockDriverState *bs, int64_t offset, bool exact,
         PreallocMode prealloc, BdrvRequestFlags flags, Error **errp);
 
-    int64_t coroutine_fn (*bdrv_co_getlength)(BlockDriverState *bs);
+    int64_t coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_getlength)(
+        BlockDriverState *bs);
+
     int64_t coroutine_fn (*bdrv_co_get_allocated_file_size)(
         BlockDriverState *bs);
 
diff --git a/include/block/block_int-io.h b/include/block/block_int-io.h
index 612e5ddf99..eb0da7232e 100644
--- a/include/block/block_int-io.h
+++ b/include/block/block_int-io.h
@@ -124,9 +124,10 @@ bdrv_co_copy_range_to(BdrvChild *src, int64_t src_offset,
                       int64_t bytes, BdrvRequestFlags read_flags,
                       BdrvRequestFlags write_flags);
 
-int coroutine_fn bdrv_co_refresh_total_sectors(BlockDriverState *bs,
-                                               int64_t hint);
-int co_wrapper_mixed
+int coroutine_fn GRAPH_RDLOCK
+bdrv_co_refresh_total_sectors(BlockDriverState *bs, int64_t hint);
+
+int co_wrapper_mixed_bdrv_rdlock
 bdrv_refresh_total_sectors(BlockDriverState *bs, int64_t hint);
 
 BdrvChild *bdrv_cow_child(BlockDriverState *bs);
diff --git a/block.c b/block.c
index c4c67d09d4..0dd604d0f6 100644
--- a/block.c
+++ b/block.c
@@ -1042,6 +1042,7 @@ int coroutine_fn bdrv_co_refresh_total_sectors(BlockDriverState *bs,
 {
     BlockDriver *drv = bs->drv;
     IO_CODE();
+    assert_bdrv_graph_readable();
 
     if (!drv) {
         return -ENOMEDIUM;
@@ -5843,6 +5844,7 @@ int64_t coroutine_fn bdrv_co_nb_sectors(BlockDriverState *bs)
 {
     BlockDriver *drv = bs->drv;
     IO_CODE();
+    assert_bdrv_graph_readable();
 
     if (!drv)
         return -ENOMEDIUM;
@@ -5864,6 +5866,7 @@ int64_t coroutine_fn bdrv_co_getlength(BlockDriverState *bs)
 {
     int64_t ret;
     IO_CODE();
+    assert_bdrv_graph_readable();
 
     ret = bdrv_co_nb_sectors(bs);
     if (ret < 0) {
diff --git a/block/blkdebug.c b/block/blkdebug.c
index f418a90873..978c8cff9e 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -967,7 +967,8 @@ static bool blkdebug_debug_is_suspended(BlockDriverState *bs, const char *tag)
     return false;
 }
 
-static int64_t coroutine_fn blkdebug_co_getlength(BlockDriverState *bs)
+static int64_t coroutine_fn GRAPH_RDLOCK
+blkdebug_co_getlength(BlockDriverState *bs)
 {
     return bdrv_co_getlength(bs->file->bs);
 }
diff --git a/block/blklogwrites.c b/block/blklogwrites.c
index 93086c31e1..3ea7141cb5 100644
--- a/block/blklogwrites.c
+++ b/block/blklogwrites.c
@@ -267,7 +267,8 @@ static void blk_log_writes_close(BlockDriverState *bs)
     s->log_file = NULL;
 }
 
-static int64_t coroutine_fn blk_log_writes_co_getlength(BlockDriverState *bs)
+static int64_t coroutine_fn GRAPH_RDLOCK
+blk_log_writes_co_getlength(BlockDriverState *bs)
 {
     return bdrv_co_getlength(bs->file->bs);
 }
diff --git a/block/blkreplay.c b/block/blkreplay.c
index bc96bbd41e..04f53eea41 100644
--- a/block/blkreplay.c
+++ b/block/blkreplay.c
@@ -40,7 +40,8 @@ fail:
     return ret;
 }
 
-static int64_t coroutine_fn blkreplay_co_getlength(BlockDriverState *bs)
+static int64_t coroutine_fn GRAPH_RDLOCK
+blkreplay_co_getlength(BlockDriverState *bs)
 {
     return bdrv_co_getlength(bs->file->bs);
 }
diff --git a/block/blkverify.c b/block/blkverify.c
index 8c11c2eae4..1c16f86b2e 100644
--- a/block/blkverify.c
+++ b/block/blkverify.c
@@ -155,7 +155,8 @@ static void blkverify_close(BlockDriverState *bs)
     s->test_file = NULL;
 }
 
-static int64_t coroutine_fn blkverify_co_getlength(BlockDriverState *bs)
+static int64_t coroutine_fn GRAPH_RDLOCK
+blkverify_co_getlength(BlockDriverState *bs)
 {
     BDRVBlkverifyState *s = bs->opaque;
 
diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index 20215cff93..cc0f848b0f 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -121,7 +121,7 @@ static void cor_child_perm(BlockDriverState *bs, BdrvChild *c,
 }
 
 
-static int64_t coroutine_fn cor_co_getlength(BlockDriverState *bs)
+static int64_t coroutine_fn GRAPH_RDLOCK cor_co_getlength(BlockDriverState *bs)
 {
     return bdrv_co_getlength(bs->file->bs);
 }
diff --git a/block/crypto.c b/block/crypto.c
index e77790ac8a..ca67289187 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -530,7 +530,8 @@ static void block_crypto_refresh_limits(BlockDriverState *bs, Error **errp)
 }
 
 
-static int64_t coroutine_fn block_crypto_co_getlength(BlockDriverState *bs)
+static int64_t coroutine_fn GRAPH_RDLOCK
+block_crypto_co_getlength(BlockDriverState *bs)
 {
     BlockCrypto *crypto = bs->opaque;
     int64_t len = bdrv_co_getlength(bs->file->bs);
diff --git a/block/filter-compress.c b/block/filter-compress.c
index c7d50a67a7..ac285f4b66 100644
--- a/block/filter-compress.c
+++ b/block/filter-compress.c
@@ -55,7 +55,8 @@ static int compress_open(BlockDriverState *bs, QDict *options, int flags,
 }
 
 
-static int64_t coroutine_fn compress_co_getlength(BlockDriverState *bs)
+static int64_t coroutine_fn GRAPH_RDLOCK
+compress_co_getlength(BlockDriverState *bs)
 {
     return bdrv_co_getlength(bs->file->bs);
 }
diff --git a/block/mirror.c b/block/mirror.c
index ec5cd22a7c..97c6a5777d 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -917,7 +917,10 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
         goto immediate_exit;
     }
 
+    bdrv_graph_co_rdlock();
     s->bdev_length = bdrv_co_getlength(bs);
+    bdrv_graph_co_rdunlock();
+
     if (s->bdev_length < 0) {
         ret = s->bdev_length;
         goto immediate_exit;
diff --git a/block/preallocate.c b/block/preallocate.c
index 63a296882d..71c3601809 100644
--- a/block/preallocate.c
+++ b/block/preallocate.c
@@ -443,7 +443,8 @@ static int coroutine_fn GRAPH_RDLOCK preallocate_co_flush(BlockDriverState *bs)
     return bdrv_co_flush(bs->file->bs);
 }
 
-static int64_t coroutine_fn preallocate_co_getlength(BlockDriverState *bs)
+static int64_t coroutine_fn GRAPH_RDLOCK
+preallocate_co_getlength(BlockDriverState *bs)
 {
     int64_t ret;
     BDRVPreallocateState *s = bs->opaque;
diff --git a/block/quorum.c b/block/quorum.c
index d58f86d3a5..ff5a0a2da3 100644
--- a/block/quorum.c
+++ b/block/quorum.c
@@ -764,7 +764,8 @@ quorum_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset, int64_t bytes,
                              flags | BDRV_REQ_ZERO_WRITE);
 }
 
-static int64_t coroutine_fn quorum_co_getlength(BlockDriverState *bs)
+static int64_t coroutine_fn GRAPH_RDLOCK
+quorum_co_getlength(BlockDriverState *bs)
 {
     BDRVQuorumState *s = bs->opaque;
     int64_t result;
diff --git a/block/raw-format.c b/block/raw-format.c
index f4203d4806..66783ed8e7 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -317,7 +317,8 @@ raw_co_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes)
     return bdrv_co_pdiscard(bs->file, offset, bytes);
 }
 
-static int64_t coroutine_fn raw_co_getlength(BlockDriverState *bs)
+static int64_t coroutine_fn GRAPH_RDLOCK
+raw_co_getlength(BlockDriverState *bs)
 {
     int64_t len;
     BDRVRawState *s = bs->opaque;
diff --git a/block/replication.c b/block/replication.c
index f9f899bfc8..de01f96184 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -179,7 +179,8 @@ static void replication_child_perm(BlockDriverState *bs, BdrvChild *c,
     return;
 }
 
-static int64_t coroutine_fn replication_co_getlength(BlockDriverState *bs)
+static int64_t coroutine_fn GRAPH_RDLOCK
+replication_co_getlength(BlockDriverState *bs)
 {
     return bdrv_co_getlength(bs->file->bs);
 }
diff --git a/block/stream.c b/block/stream.c
index 22368ce186..68018699de 100644
--- a/block/stream.c
+++ b/block/stream.c
@@ -141,9 +141,11 @@ static int coroutine_fn stream_run(Job *job, Error **errp)
         return 0;
     }
 
-    len = bdrv_getlength(s->target_bs);
-    if (len < 0) {
-        return len;
+    WITH_GRAPH_RDLOCK_GUARD() {
+        len = bdrv_co_getlength(s->target_bs);
+        if (len < 0) {
+            return len;
+        }
     }
     job_progress_set_remaining(&s->common.job, len);
 
diff --git a/block/throttle.c b/block/throttle.c
index 5cfea3d5f8..3aaef18d4e 100644
--- a/block/throttle.c
+++ b/block/throttle.c
@@ -106,7 +106,8 @@ static void throttle_close(BlockDriverState *bs)
 }
 
 
-static int64_t coroutine_fn throttle_co_getlength(BlockDriverState *bs)
+static int64_t coroutine_fn GRAPH_RDLOCK
+throttle_co_getlength(BlockDriverState *bs)
 {
     return bdrv_co_getlength(bs->file->bs);
 }
-- 
2.39.2


