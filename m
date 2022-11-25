Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A8D638B52
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 14:36:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyYrs-0006Up-VG; Fri, 25 Nov 2022 08:35:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oyYrc-0006Rk-Bj
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 08:35:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oyYrY-0005Cr-2m
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 08:35:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669383327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ardzZcBk1n7NVeJCeLR1pwuuircUxVh1xjNhb/fRo/s=;
 b=Jvg7NuLJv6xiz/n5WGuAZVcTkGZiQhL8NyF+TJxMFEXT/zYBhip61QMZujxKRTHcf39vSo
 j9Q6cZN0z1i7L5YF/kLa++AOEht7M/8hIoU4/qupN3XuIvo9A+GQih+3hhpvRXNCt/5wRI
 AC8SRpGiWIPQmbvA/yLvqpSlrRcqoo8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-216-Q2F3_rQOP3a15yeX-7mF9w-1; Fri, 25 Nov 2022 08:35:23 -0500
X-MC-Unique: Q2F3_rQOP3a15yeX-7mF9w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53F61185A7AB;
 Fri, 25 Nov 2022 13:35:22 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E85012166B46;
 Fri, 25 Nov 2022 13:35:21 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Stefan Weil <sw@weilnetz.de>, Jeff Cody <codyprime@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v6 02/14] block-copy: add missing coroutine_fn annotations
Date: Fri, 25 Nov 2022 08:35:06 -0500
Message-Id: <20221125133518.418328-3-eesposit@redhat.com>
In-Reply-To: <20221125133518.418328-1-eesposit@redhat.com>
References: <20221125133518.418328-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
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

These functions end up calling bdrv_common_block_status_above(), a
generated_co_wrapper function.
In addition, they also happen to be always called in coroutine context,
meaning all callers are coroutine_fn.
This means that the g_c_w function will enter the qemu_in_coroutine()
case and eventually suspend (or in other words call qemu_coroutine_yield()).
Therefore we need to mark such functions coroutine_fn too.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 block/block-copy.c         | 21 ++++++++++++---------
 include/block/block-copy.h |  5 +++--
 2 files changed, 15 insertions(+), 11 deletions(-)

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
-- 
2.31.1


