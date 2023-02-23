Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A216A0FDF
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 19:56:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVGhc-00070Z-7H; Thu, 23 Feb 2023 13:52:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVGhV-0006u5-Uz
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:52:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVGhU-0003Cv-35
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:52:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677178335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nI+mVlP2GuKEDS80xw+uJKrxQXToY80jWjpuvbDatLE=;
 b=Syj+c5CVv4Ru0UcW+2rNRBsIO5ML5yIsgmERNGwlQP77F0UWip3quWWH0ovMIKWS0VnZG6
 Ae64XHKkYW0od9D1zPEXSI6gBzRTIKnu23qR9RLTq7bMOKjKF7cZurhJDQQaBvxVLjVoKO
 2Q8mn+huZyw+XwllwGzbZiPpdrZ51bc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-344-DqdCHW21MbKat-2-HCpm7g-1; Thu, 23 Feb 2023 13:52:12 -0500
X-MC-Unique: DqdCHW21MbKat-2-HCpm7g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E1458811E6E;
 Thu, 23 Feb 2023 18:52:11 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.192.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 38C5E1121314;
 Thu, 23 Feb 2023 18:52:11 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 22/29] block: Mark bdrv_*_dirty_bitmap() and callers
 GRAPH_RDLOCK
Date: Thu, 23 Feb 2023 19:51:39 +0100
Message-Id: <20230223185146.306454-23-kwolf@redhat.com>
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
bdrv_*_dirty_bitmap() need to hold a reader lock for the graph.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20230203152202.49054-23-kwolf@redhat.com>
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block-io.h         | 14 ++++++--------
 include/block/block_int-common.h |  6 ++++--
 include/block/dirty-bitmap.h     | 12 ++++++------
 block/dirty-bitmap.c             |  2 ++
 4 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/include/block/block-io.h b/include/block/block-io.h
index a195a9fb11..95bcc79b75 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -243,14 +243,12 @@ AioContext *child_of_bds_get_parent_aio_context(BdrvChild *c);
 void coroutine_fn GRAPH_RDLOCK bdrv_co_io_plug(BlockDriverState *bs);
 void coroutine_fn GRAPH_RDLOCK bdrv_co_io_unplug(BlockDriverState *bs);
 
-bool coroutine_fn bdrv_co_can_store_new_dirty_bitmap(BlockDriverState *bs,
-                                                     const char *name,
-                                                     uint32_t granularity,
-                                                     Error **errp);
-bool co_wrapper bdrv_can_store_new_dirty_bitmap(BlockDriverState *bs,
-                                                const char *name,
-                                                uint32_t granularity,
-                                                Error **errp);
+bool coroutine_fn GRAPH_RDLOCK
+bdrv_co_can_store_new_dirty_bitmap(BlockDriverState *bs, const char *name,
+                                   uint32_t granularity, Error **errp);
+bool co_wrapper_bdrv_rdlock
+bdrv_can_store_new_dirty_bitmap(BlockDriverState *bs, const char *name,
+                                uint32_t granularity, Error **errp);
 
 /**
  *
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 257a9d18c6..d72e31aba3 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -759,10 +759,12 @@ struct BlockDriver {
     void (*bdrv_drain_end)(BlockDriverState *bs);
 
     bool (*bdrv_supports_persistent_dirty_bitmap)(BlockDriverState *bs);
-    bool coroutine_fn (*bdrv_co_can_store_new_dirty_bitmap)(
+
+    bool coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_can_store_new_dirty_bitmap)(
         BlockDriverState *bs, const char *name, uint32_t granularity,
         Error **errp);
-    int coroutine_fn (*bdrv_co_remove_persistent_dirty_bitmap)(
+
+    int coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_remove_persistent_dirty_bitmap)(
         BlockDriverState *bs, const char *name, Error **errp);
 };
 
diff --git a/include/block/dirty-bitmap.h b/include/block/dirty-bitmap.h
index 233535ef2d..fa956debfb 100644
--- a/include/block/dirty-bitmap.h
+++ b/include/block/dirty-bitmap.h
@@ -36,12 +36,12 @@ int bdrv_dirty_bitmap_check(const BdrvDirtyBitmap *bitmap, uint32_t flags,
 void bdrv_release_dirty_bitmap(BdrvDirtyBitmap *bitmap);
 void bdrv_release_named_dirty_bitmaps(BlockDriverState *bs);
 
-int coroutine_fn bdrv_co_remove_persistent_dirty_bitmap(BlockDriverState *bs,
-                                                        const char *name,
-                                                        Error **errp);
-int co_wrapper bdrv_remove_persistent_dirty_bitmap(BlockDriverState *bs,
-                                                   const char *name,
-                                                   Error **errp);
+int coroutine_fn GRAPH_RDLOCK
+bdrv_co_remove_persistent_dirty_bitmap(BlockDriverState *bs, const char *name,
+                                       Error **errp);
+int co_wrapper_bdrv_rdlock
+bdrv_remove_persistent_dirty_bitmap(BlockDriverState *bs, const char *name,
+                                    Error **errp);
 
 void bdrv_disable_dirty_bitmap(BdrvDirtyBitmap *bitmap);
 void bdrv_enable_dirty_bitmap(BdrvDirtyBitmap *bitmap);
diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
index 1e7aee4010..13a1979755 100644
--- a/block/dirty-bitmap.c
+++ b/block/dirty-bitmap.c
@@ -394,6 +394,7 @@ int coroutine_fn
 bdrv_co_remove_persistent_dirty_bitmap(BlockDriverState *bs, const char *name,
                                        Error **errp)
 {
+    assert_bdrv_graph_readable();
     if (bs->drv && bs->drv->bdrv_co_remove_persistent_dirty_bitmap) {
         return bs->drv->bdrv_co_remove_persistent_dirty_bitmap(bs, name, errp);
     }
@@ -415,6 +416,7 @@ bdrv_co_can_store_new_dirty_bitmap(BlockDriverState *bs, const char *name,
                                    uint32_t granularity, Error **errp)
 {
     BlockDriver *drv = bs->drv;
+    assert_bdrv_graph_readable();
 
     if (!drv) {
         error_setg_errno(errp, ENOMEDIUM,
-- 
2.39.2


