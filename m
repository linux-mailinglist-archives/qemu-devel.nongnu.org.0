Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9172635C17
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 12:49:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxo9Q-0002lI-JL; Wed, 23 Nov 2022 06:42:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oxo9M-0002jD-9j
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 06:42:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oxo9I-00063T-7H
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 06:42:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669203759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cpdeJ0GQ/AW9+6XpODaVV8J7WRqcl4aHv9+5JtE0F98=;
 b=BvzJOT2CKgAx1Jp8wtw5iDOUo0+F55o/eZNF4kr0vwGGKtxuVTnj/kWohidFy2bhctvDtq
 Co+9y0Tmo5oMdrenRzIJTR39Z5aaB7J+IiVFycw1vuayrkVg1NcdilF78wW2bMCndlHt7Z
 kUUKZC2bNhvOI8boucrio0pgn6X1aJg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-372-2JkuMp0OPuGcRkmvH1yFzw-1; Wed, 23 Nov 2022 06:42:36 -0500
X-MC-Unique: 2JkuMp0OPuGcRkmvH1yFzw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 00C8A811E87;
 Wed, 23 Nov 2022 11:42:36 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 99163C2C8C5;
 Wed, 23 Nov 2022 11:42:35 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Stefan Weil <sw@weilnetz.de>, Jeff Cody <codyprime@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v5 15/15] block/dirty-bitmap: convert coroutine-only functions
 to generated_co_wrapper_simple
Date: Wed, 23 Nov 2022 06:42:27 -0500
Message-Id: <20221123114227.85757-16-eesposit@redhat.com>
In-Reply-To: <20221123114227.85757-1-eesposit@redhat.com>
References: <20221123114227.85757-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
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

bdrv_can_store_new_dirty_bitmap and bdrv_remove_persistent_dirty_bitmap
check if they are running in a coroutine, directly calling the
coroutine callback if it's the case.
Except that no coroutine calls such functions, therefore that check
can be removed, and function creation can be offloaded to
g_c_w_simple.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 block/dirty-bitmap.c         | 88 +-----------------------------------
 block/meson.build            |  1 +
 include/block/block-common.h |  5 +-
 include/block/block-io.h     |  9 +++-
 include/block/dirty-bitmap.h | 10 +++-
 5 files changed, 21 insertions(+), 92 deletions(-)

diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
index bf3dc0512a..21cf592889 100644
--- a/block/dirty-bitmap.c
+++ b/block/dirty-bitmap.c
@@ -388,7 +388,7 @@ void bdrv_release_named_dirty_bitmaps(BlockDriverState *bs)
  * not fail.
  * This function doesn't release corresponding BdrvDirtyBitmap.
  */
-static int coroutine_fn
+int coroutine_fn
 bdrv_co_remove_persistent_dirty_bitmap(BlockDriverState *bs, const char *name,
                                        Error **errp)
 {
@@ -399,45 +399,6 @@ bdrv_co_remove_persistent_dirty_bitmap(BlockDriverState *bs, const char *name,
     return 0;
 }
 
-typedef struct BdrvRemovePersistentDirtyBitmapCo {
-    BlockDriverState *bs;
-    const char *name;
-    Error **errp;
-    int ret;
-} BdrvRemovePersistentDirtyBitmapCo;
-
-static void coroutine_fn
-bdrv_co_remove_persistent_dirty_bitmap_entry(void *opaque)
-{
-    BdrvRemovePersistentDirtyBitmapCo *s = opaque;
-
-    s->ret = bdrv_co_remove_persistent_dirty_bitmap(s->bs, s->name, s->errp);
-    aio_wait_kick();
-}
-
-int bdrv_remove_persistent_dirty_bitmap(BlockDriverState *bs, const char *name,
-                                        Error **errp)
-{
-    if (qemu_in_coroutine()) {
-        return bdrv_co_remove_persistent_dirty_bitmap(bs, name, errp);
-    } else {
-        Coroutine *co;
-        BdrvRemovePersistentDirtyBitmapCo s = {
-            .bs = bs,
-            .name = name,
-            .errp = errp,
-            .ret = -EINPROGRESS,
-        };
-
-        co = qemu_coroutine_create(bdrv_co_remove_persistent_dirty_bitmap_entry,
-                                   &s);
-        bdrv_coroutine_enter(bs, co);
-        BDRV_POLL_WHILE(bs, s.ret == -EINPROGRESS);
-
-        return s.ret;
-    }
-}
-
 bool
 bdrv_supports_persistent_dirty_bitmap(BlockDriverState *bs)
 {
@@ -447,7 +408,7 @@ bdrv_supports_persistent_dirty_bitmap(BlockDriverState *bs)
     return false;
 }
 
-static bool coroutine_fn
+bool coroutine_fn
 bdrv_co_can_store_new_dirty_bitmap(BlockDriverState *bs, const char *name,
                                    uint32_t granularity, Error **errp)
 {
@@ -470,51 +431,6 @@ bdrv_co_can_store_new_dirty_bitmap(BlockDriverState *bs, const char *name,
     return drv->bdrv_co_can_store_new_dirty_bitmap(bs, name, granularity, errp);
 }
 
-typedef struct BdrvCanStoreNewDirtyBitmapCo {
-    BlockDriverState *bs;
-    const char *name;
-    uint32_t granularity;
-    Error **errp;
-    bool ret;
-
-    bool in_progress;
-} BdrvCanStoreNewDirtyBitmapCo;
-
-static void coroutine_fn bdrv_co_can_store_new_dirty_bitmap_entry(void *opaque)
-{
-    BdrvCanStoreNewDirtyBitmapCo *s = opaque;
-
-    s->ret = bdrv_co_can_store_new_dirty_bitmap(s->bs, s->name, s->granularity,
-                                                s->errp);
-    s->in_progress = false;
-    aio_wait_kick();
-}
-
-bool bdrv_can_store_new_dirty_bitmap(BlockDriverState *bs, const char *name,
-                                     uint32_t granularity, Error **errp)
-{
-    IO_CODE();
-    if (qemu_in_coroutine()) {
-        return bdrv_co_can_store_new_dirty_bitmap(bs, name, granularity, errp);
-    } else {
-        Coroutine *co;
-        BdrvCanStoreNewDirtyBitmapCo s = {
-            .bs = bs,
-            .name = name,
-            .granularity = granularity,
-            .errp = errp,
-            .in_progress = true,
-        };
-
-        co = qemu_coroutine_create(bdrv_co_can_store_new_dirty_bitmap_entry,
-                                   &s);
-        bdrv_coroutine_enter(bs, co);
-        BDRV_POLL_WHILE(bs, s.in_progress);
-
-        return s.ret;
-    }
-}
-
 void bdrv_disable_dirty_bitmap(BdrvDirtyBitmap *bitmap)
 {
     bdrv_dirty_bitmaps_lock(bitmap->bs);
diff --git a/block/meson.build b/block/meson.build
index b7c68b83a3..c48a59571e 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -137,6 +137,7 @@ block_gen_c = custom_target('block-gen.c',
                             output: 'block-gen.c',
                             input: files(
                                       '../include/block/block-io.h',
+                                      '../include/block/dirty-bitmap.h',
                                       '../include/block/block-global-state.h',
                                       '../include/sysemu/block-backend-io.h',
                                       'coroutines.h'
diff --git a/include/block/block-common.h b/include/block/block-common.h
index 46b57501d8..ea5505e28f 100644
--- a/include/block/block-common.h
+++ b/include/block/block-common.h
@@ -29,8 +29,6 @@
 #include "qemu/iov.h"
 #include "qemu/coroutine.h"
 #include "block/accounting.h"
-#include "block/dirty-bitmap.h"
-#include "block/blockjob.h"
 #include "qemu/hbitmap.h"
 #include "qemu/transactions.h"
 
@@ -56,6 +54,9 @@
 #define generated_co_wrapper
 #define generated_co_wrapper_simple
 
+#include "block/dirty-bitmap.h"
+#include "block/blockjob.h"
+
 /* block.c */
 typedef struct BlockDriver BlockDriver;
 typedef struct BdrvChild BdrvChild;
diff --git a/include/block/block-io.h b/include/block/block-io.h
index 72919254cd..3c71329f01 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -215,8 +215,13 @@ AioContext *child_of_bds_get_parent_aio_context(BdrvChild *c);
 void bdrv_io_plug(BlockDriverState *bs);
 void bdrv_io_unplug(BlockDriverState *bs);
 
-bool bdrv_can_store_new_dirty_bitmap(BlockDriverState *bs, const char *name,
-                                     uint32_t granularity, Error **errp);
+bool coroutine_fn bdrv_co_can_store_new_dirty_bitmap(BlockDriverState *bs,
+                                                     const char *name,
+                                                     uint32_t granularity,
+                                                     Error **errp);
+bool generated_co_wrapper_simple
+bdrv_can_store_new_dirty_bitmap(BlockDriverState *bs, const char *name,
+                                uint32_t granularity, Error **errp);
 
 /**
  *
diff --git a/include/block/dirty-bitmap.h b/include/block/dirty-bitmap.h
index 6528336c4c..2290e7fa28 100644
--- a/include/block/dirty-bitmap.h
+++ b/include/block/dirty-bitmap.h
@@ -34,8 +34,14 @@ int bdrv_dirty_bitmap_check(const BdrvDirtyBitmap *bitmap, uint32_t flags,
                             Error **errp);
 void bdrv_release_dirty_bitmap(BdrvDirtyBitmap *bitmap);
 void bdrv_release_named_dirty_bitmaps(BlockDriverState *bs);
-int bdrv_remove_persistent_dirty_bitmap(BlockDriverState *bs, const char *name,
-                                        Error **errp);
+
+int coroutine_fn bdrv_co_remove_persistent_dirty_bitmap(BlockDriverState *bs,
+                                                        const char *name,
+                                                        Error **errp);
+int generated_co_wrapper_simple
+bdrv_remove_persistent_dirty_bitmap(BlockDriverState *bs, const char *name,
+                                    Error **errp);
+
 void bdrv_disable_dirty_bitmap(BdrvDirtyBitmap *bitmap);
 void bdrv_enable_dirty_bitmap(BdrvDirtyBitmap *bitmap);
 void bdrv_enable_dirty_bitmap_locked(BdrvDirtyBitmap *bitmap);
-- 
2.31.1


