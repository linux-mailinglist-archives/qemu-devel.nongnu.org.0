Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F2F64CBE2
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 15:14:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5S5e-0005OB-Mv; Wed, 14 Dec 2022 08:46:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5S4m-0004O3-Ks
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 08:45:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5S4i-0003XQ-6F
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 08:45:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671025531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=53QcFJ+9M3sueuUYD7j+v9oOfKeqt7oq3E1FlrzJDiQ=;
 b=KiO/qScVpDF7murSzCtBuBxI10tnv8ur9i8P1qlk2kHy24R/nasK1CJoxgN6xZ+7MzAPf9
 DlULXNBk1tUkgNVgFInhpUPvzzYXctblNdI6peYp+w0P+mIx9NFrr11JiPlTfS7is2dPMu
 gP4M/RCm+9jRa7xAlIWE92iwZMDmYgw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-60-UKcOsGjWN_idTirGaxU0tg-1; Wed, 14 Dec 2022 08:45:30 -0500
X-MC-Unique: UKcOsGjWN_idTirGaxU0tg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8BF93858F09;
 Wed, 14 Dec 2022 13:45:29 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB2D214171BE;
 Wed, 14 Dec 2022 13:45:28 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 21/51] block-copy: add coroutine_fn annotations
Date: Wed, 14 Dec 2022 14:44:23 +0100
Message-Id: <20221214134453.31665-22-kwolf@redhat.com>
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

These functions end up calling bdrv_common_block_status_above(), a
generated_co_wrapper function.
In addition, they also happen to be always called in coroutine context,
meaning all callers are coroutine_fn.
This means that the g_c_w function will enter the qemu_in_coroutine()
case and eventually suspend (or in other words call qemu_coroutine_yield()).
Therefore we can mark such functions coroutine_fn too.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Message-Id: <20221128142337.657646-3-eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block-copy.h |  5 +++--
 block/block-copy.c         | 21 ++++++++++++---------
 2 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index ba0b425d78..8cea4f9b90 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -36,8 +36,9 @@ void block_copy_set_progress_meter(BlockCopyState *s, ProgressMeter *pm);
 void block_copy_state_free(BlockCopyState *s);
 
 void block_copy_reset(BlockCopyState *s, int64_t offset, int64_t bytes);
-int64_t block_copy_reset_unallocated(BlockCopyState *s,
-                                     int64_t offset, int64_t *count);
+int64_t coroutine_fn block_copy_reset_unallocated(BlockCopyState *s,
+                                                  int64_t offset,
+                                                  int64_t *count);
 
 int coroutine_fn block_copy(BlockCopyState *s, int64_t offset, int64_t bytes,
                             bool ignore_ratelimit, uint64_t timeout_ns,
diff --git a/block/block-copy.c b/block/block-copy.c
index bb947afdda..5e59d6262f 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -577,8 +577,9 @@ static coroutine_fn int block_copy_task_entry(AioTask *task)
     return ret;
 }
 
-static int block_copy_block_status(BlockCopyState *s, int64_t offset,
-                                   int64_t bytes, int64_t *pnum)
+static coroutine_fn int block_copy_block_status(BlockCopyState *s,
+                                                int64_t offset,
+                                                int64_t bytes, int64_t *pnum)
 {
     int64_t num;
     BlockDriverState *base;
@@ -590,8 +591,8 @@ static int block_copy_block_status(BlockCopyState *s, int64_t offset,
         base = NULL;
     }
 
-    ret = bdrv_block_status_above(s->source->bs, base, offset, bytes, &num,
-                                  NULL, NULL);
+    ret = bdrv_co_block_status_above(s->source->bs, base, offset, bytes, &num,
+                                     NULL, NULL);
     if (ret < 0 || num < s->cluster_size) {
         /*
          * On error or if failed to obtain large enough chunk just fallback to
@@ -613,8 +614,9 @@ static int block_copy_block_status(BlockCopyState *s, int64_t offset,
  * Check if the cluster starting at offset is allocated or not.
  * return via pnum the number of contiguous clusters sharing this allocation.
  */
-static int block_copy_is_cluster_allocated(BlockCopyState *s, int64_t offset,
-                                           int64_t *pnum)
+static int coroutine_fn block_copy_is_cluster_allocated(BlockCopyState *s,
+                                                        int64_t offset,
+                                                        int64_t *pnum)
 {
     BlockDriverState *bs = s->source->bs;
     int64_t count, total_count = 0;
@@ -624,7 +626,7 @@ static int block_copy_is_cluster_allocated(BlockCopyState *s, int64_t offset,
     assert(QEMU_IS_ALIGNED(offset, s->cluster_size));
 
     while (true) {
-        ret = bdrv_is_allocated(bs, offset, bytes, &count);
+        ret = bdrv_co_is_allocated(bs, offset, bytes, &count);
         if (ret < 0) {
             return ret;
         }
@@ -669,8 +671,9 @@ void block_copy_reset(BlockCopyState *s, int64_t offset, int64_t bytes)
  * @return 0 when the cluster at @offset was unallocated,
  *         1 otherwise, and -ret on error.
  */
-int64_t block_copy_reset_unallocated(BlockCopyState *s,
-                                     int64_t offset, int64_t *count)
+int64_t coroutine_fn block_copy_reset_unallocated(BlockCopyState *s,
+                                                  int64_t offset,
+                                                  int64_t *count)
 {
     int ret;
     int64_t clusters, bytes;
-- 
2.38.1


