Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73883645AD7
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 14:25:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2uLC-0007u8-9G; Wed, 07 Dec 2022 08:20:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p2uL3-0007m3-Mr
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 08:19:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p2uKz-0006Vu-TU
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 08:19:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670419189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=svcgIprCS7PrddIjN66IqdnQ/Gfg6c9V5suBj/zmy3U=;
 b=SHXLoafxvutRiLBnrDrl93rJvBdR6fc9EO6WXk18cdK86rLLu5IJnWNMOHTzVst/V+WHSh
 FFCx33OuSPsG5vaGJQ56aO0QklxU9QN6Xf6nO+kl7WOVzbcTqzy7VECPg0uV9beb6aT/vk
 mBISoU2eY3L3ijTIhb3UNDyBBMf/Nng=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-flje4YaKMmGYy1NZDZ6I4Q-1; Wed, 07 Dec 2022 08:19:46 -0500
X-MC-Unique: flje4YaKMmGYy1NZDZ6I4Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7EDA386C046;
 Wed,  7 Dec 2022 13:19:45 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 61C001121314;
 Wed,  7 Dec 2022 13:19:44 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, eesposit@redhat.com,
 pbonzini@redhat.com, vsementsov@yandex-team.ru, qemu-devel@nongnu.org
Subject: [PATCH 17/18] block: use co_wrapper_mixed_bdrv_rdlock in functions
 taking the rdlock
Date: Wed,  7 Dec 2022 14:18:37 +0100
Message-Id: <20221207131838.239125-18-kwolf@redhat.com>
In-Reply-To: <20221207131838.239125-1-kwolf@redhat.com>
References: <20221207131838.239125-1-kwolf@redhat.com>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Take the rdlock already, before we add the assertions.

All these functions either read the graph recursively, or call
BlockDriver callbacks that will eventually need to be protected by the
graph rdlock.

Do it now to all functions together, because many of these recursively
call each other.

For example, bdrv_co_truncate calls BlockDriver->bdrv_co_truncate, and
some driver callbacks implement their own .bdrv_co_truncate by calling
bdrv_flush inside. So if bdrv_flush asserts but bdrv_truncate does not
take the rdlock yet, the assertion will always fail.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/coroutines.h       |  2 +-
 include/block/block-io.h | 53 +++++++++++++++++++++++-----------------
 2 files changed, 32 insertions(+), 23 deletions(-)

diff --git a/block/coroutines.h b/block/coroutines.h
index 17da4db963..48e9081aa1 100644
--- a/block/coroutines.h
+++ b/block/coroutines.h
@@ -71,7 +71,7 @@ nbd_co_do_establish_connection(BlockDriverState *bs, bool blocking,
  * the "I/O or GS" API.
  */
 
-int co_wrapper_mixed
+int co_wrapper_mixed_bdrv_rdlock
 bdrv_common_block_status_above(BlockDriverState *bs,
                                BlockDriverState *base,
                                bool include_base,
diff --git a/include/block/block-io.h b/include/block/block-io.h
index 52869ea08e..2ed6214909 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -39,19 +39,24 @@
  * to catch when they are accidentally called by the wrong API.
  */
 
-int co_wrapper_mixed bdrv_pwrite_zeroes(BdrvChild *child, int64_t offset,
-                                        int64_t bytes,
-                                        BdrvRequestFlags flags);
+int co_wrapper_mixed_bdrv_rdlock
+bdrv_pwrite_zeroes(BdrvChild *child, int64_t offset, int64_t bytes,
+                   BdrvRequestFlags flags);
+
 int bdrv_make_zero(BdrvChild *child, BdrvRequestFlags flags);
-int co_wrapper_mixed bdrv_pread(BdrvChild *child, int64_t offset,
-                                int64_t bytes, void *buf,
-                                BdrvRequestFlags flags);
-int co_wrapper_mixed bdrv_pwrite(BdrvChild *child, int64_t offset,
-                                 int64_t bytes, const void *buf,
-                                 BdrvRequestFlags flags);
-int co_wrapper_mixed bdrv_pwrite_sync(BdrvChild *child, int64_t offset,
-                                      int64_t bytes, const void *buf,
-                                      BdrvRequestFlags flags);
+
+int co_wrapper_mixed_bdrv_rdlock
+bdrv_pread(BdrvChild *child, int64_t offset, int64_t bytes, void *buf,
+           BdrvRequestFlags flags);
+
+int co_wrapper_mixed_bdrv_rdlock
+bdrv_pwrite(BdrvChild *child, int64_t offset,int64_t bytes,
+            const void *buf, BdrvRequestFlags flags);
+
+int co_wrapper_mixed_bdrv_rdlock
+bdrv_pwrite_sync(BdrvChild *child, int64_t offset, int64_t bytes,
+                 const void *buf, BdrvRequestFlags flags);
+
 int coroutine_fn bdrv_co_pwrite_sync(BdrvChild *child, int64_t offset,
                                      int64_t bytes, const void *buf,
                                      BdrvRequestFlags flags);
@@ -287,22 +292,26 @@ int coroutine_fn bdrv_co_copy_range(BdrvChild *src, int64_t src_offset,
 
 void bdrv_drain(BlockDriverState *bs);
 
-int co_wrapper_mixed
+int co_wrapper_mixed_bdrv_rdlock
 bdrv_truncate(BdrvChild *child, int64_t offset, bool exact,
               PreallocMode prealloc, BdrvRequestFlags flags, Error **errp);
 
-int co_wrapper_mixed bdrv_check(BlockDriverState *bs, BdrvCheckResult *res,
-                                BdrvCheckMode fix);
+int co_wrapper_mixed_bdrv_rdlock
+bdrv_check(BlockDriverState *bs, BdrvCheckResult *res, BdrvCheckMode fix);
 
 /* Invalidate any cached metadata used by image formats */
-int co_wrapper_mixed bdrv_invalidate_cache(BlockDriverState *bs,
-                                           Error **errp);
-int co_wrapper_mixed bdrv_flush(BlockDriverState *bs);
-int co_wrapper_mixed bdrv_pdiscard(BdrvChild *child, int64_t offset,
-                                   int64_t bytes);
-int co_wrapper_mixed
+int co_wrapper_mixed_bdrv_rdlock
+bdrv_invalidate_cache(BlockDriverState *bs, Error **errp);
+
+int co_wrapper_mixed_bdrv_rdlock bdrv_flush(BlockDriverState *bs);
+
+int co_wrapper_mixed_bdrv_rdlock
+bdrv_pdiscard(BdrvChild *child, int64_t offset, int64_t bytes);
+
+int co_wrapper_mixed_bdrv_rdlock
 bdrv_readv_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos);
-int co_wrapper_mixed
+
+int co_wrapper_mixed_bdrv_rdlock
 bdrv_writev_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos);
 
 /**
-- 
2.38.1


