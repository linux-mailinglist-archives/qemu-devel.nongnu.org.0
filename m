Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C8264CB9F
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 14:51:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5S5d-0005N8-Qf; Wed, 14 Dec 2022 08:46:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5S4n-0004O8-E9
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 08:45:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5S4l-0003Xt-Id
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 08:45:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671025532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b8L5Yoo19GM/YYMx3SPjYgCO+cmj66/GA4eW4anHw+c=;
 b=PpOhiB85e1AiQVvDxdRW4N7kewfiYxISJQkwZNra2t8bCeooQ6Qij2DLJRX5bdoDNFAYfN
 HQBD0NUAvUtE2OJtHjFUkpp04iTV88NqZCfu8MKwBi7gLLtIeCROyclez9Pr/MDxvLzkrm
 vVAuzHTkwY+i/5W6DzMEI/jRTVDriTA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-138-ZZEfrlTxMsGrvE1JRmPneg-1; Wed, 14 Dec 2022 08:45:29 -0500
X-MC-Unique: ZZEfrlTxMsGrvE1JRmPneg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91EA818A64E0;
 Wed, 14 Dec 2022 13:45:28 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D1C7D140E949;
 Wed, 14 Dec 2022 13:45:27 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 20/51] block-io: introduce coroutine_fn duplicates for
 bdrv_common_block_status_above callers
Date: Wed, 14 Dec 2022 14:44:22 +0100
Message-Id: <20221214134453.31665-21-kwolf@redhat.com>
In-Reply-To: <20221214134453.31665-1-kwolf@redhat.com>
References: <20221214134453.31665-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

bdrv_common_block_status_above() is a g_c_w, and it is being called by
many "wrapper" functions like bdrv_is_allocated(),
bdrv_is_allocated_above() and bdrv_block_status_above().

Because we want to eventually split the coroutine from non-coroutine
case in g_c_w, create duplicate wrappers that take care of directly
calling the same coroutine functions called in the g_c_w.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Message-Id: <20221128142337.657646-2-eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block-io.h | 15 +++++++++++
 block/io.c               | 58 +++++++++++++++++++++++++++++++++++++---
 2 files changed, 70 insertions(+), 3 deletions(-)

diff --git a/include/block/block-io.h b/include/block/block-io.h
index 92aaa7c1e9..72919254cd 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -94,14 +94,29 @@ bool bdrv_can_write_zeroes_with_unmap(BlockDriverState *bs);
 int bdrv_block_status(BlockDriverState *bs, int64_t offset,
                       int64_t bytes, int64_t *pnum, int64_t *map,
                       BlockDriverState **file);
+
+int coroutine_fn bdrv_co_block_status_above(BlockDriverState *bs,
+                                            BlockDriverState *base,
+                                            int64_t offset, int64_t bytes,
+                                            int64_t *pnum, int64_t *map,
+                                            BlockDriverState **file);
 int bdrv_block_status_above(BlockDriverState *bs, BlockDriverState *base,
                             int64_t offset, int64_t bytes, int64_t *pnum,
                             int64_t *map, BlockDriverState **file);
+
+int coroutine_fn bdrv_co_is_allocated(BlockDriverState *bs, int64_t offset,
+                                      int64_t bytes, int64_t *pnum);
 int bdrv_is_allocated(BlockDriverState *bs, int64_t offset, int64_t bytes,
                       int64_t *pnum);
+
+int coroutine_fn bdrv_co_is_allocated_above(BlockDriverState *top,
+                                            BlockDriverState *base,
+                                            bool include_base, int64_t offset,
+                                            int64_t bytes, int64_t *pnum);
 int bdrv_is_allocated_above(BlockDriverState *top, BlockDriverState *base,
                             bool include_base, int64_t offset, int64_t bytes,
                             int64_t *pnum);
+
 int coroutine_fn bdrv_co_is_zero_fast(BlockDriverState *bs, int64_t offset,
                                       int64_t bytes);
 
diff --git a/block/io.c b/block/io.c
index 38e57d1f67..f4444b7777 100644
--- a/block/io.c
+++ b/block/io.c
@@ -2533,6 +2533,17 @@ bdrv_co_common_block_status_above(BlockDriverState *bs,
     return ret;
 }
 
+int coroutine_fn bdrv_co_block_status_above(BlockDriverState *bs,
+                                            BlockDriverState *base,
+                                            int64_t offset, int64_t bytes,
+                                            int64_t *pnum, int64_t *map,
+                                            BlockDriverState **file)
+{
+    IO_CODE();
+    return bdrv_co_common_block_status_above(bs, base, false, true, offset,
+                                             bytes, pnum, map, file, NULL);
+}
+
 int bdrv_block_status_above(BlockDriverState *bs, BlockDriverState *base,
                             int64_t offset, int64_t bytes, int64_t *pnum,
                             int64_t *map, BlockDriverState **file)
@@ -2578,6 +2589,22 @@ int coroutine_fn bdrv_co_is_zero_fast(BlockDriverState *bs, int64_t offset,
     return (pnum == bytes) && (ret & BDRV_BLOCK_ZERO);
 }
 
+int coroutine_fn bdrv_co_is_allocated(BlockDriverState *bs, int64_t offset,
+                                      int64_t bytes, int64_t *pnum)
+{
+    int ret;
+    int64_t dummy;
+    IO_CODE();
+
+    ret = bdrv_co_common_block_status_above(bs, bs, true, false, offset,
+                                            bytes, pnum ? pnum : &dummy, NULL,
+                                            NULL, NULL);
+    if (ret < 0) {
+        return ret;
+    }
+    return !!(ret & BDRV_BLOCK_ALLOCATED);
+}
+
 int bdrv_is_allocated(BlockDriverState *bs, int64_t offset, int64_t bytes,
                       int64_t *pnum)
 {
@@ -2594,6 +2621,29 @@ int bdrv_is_allocated(BlockDriverState *bs, int64_t offset, int64_t bytes,
     return !!(ret & BDRV_BLOCK_ALLOCATED);
 }
 
+/* See bdrv_is_allocated_above for documentation */
+int coroutine_fn bdrv_co_is_allocated_above(BlockDriverState *top,
+                                            BlockDriverState *base,
+                                            bool include_base, int64_t offset,
+                                            int64_t bytes, int64_t *pnum)
+{
+    int depth;
+    int ret;
+    IO_CODE();
+
+    ret = bdrv_co_common_block_status_above(top, base, include_base, false,
+                                            offset, bytes, pnum, NULL, NULL,
+                                            &depth);
+    if (ret < 0) {
+        return ret;
+    }
+
+    if (ret & BDRV_BLOCK_ALLOCATED) {
+        return depth;
+    }
+    return 0;
+}
+
 /*
  * Given an image chain: ... -> [BASE] -> [INTER1] -> [INTER2] -> [TOP]
  *
@@ -2617,10 +2667,12 @@ int bdrv_is_allocated_above(BlockDriverState *top,
                             int64_t bytes, int64_t *pnum)
 {
     int depth;
-    int ret = bdrv_common_block_status_above(top, base, include_base, false,
-                                             offset, bytes, pnum, NULL, NULL,
-                                             &depth);
+    int ret;
     IO_CODE();
+
+    ret = bdrv_common_block_status_above(top, base, include_base, false,
+                                         offset, bytes, pnum, NULL, NULL,
+                                         &depth);
     if (ret < 0) {
         return ret;
     }
-- 
2.38.1


