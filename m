Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE1863AB16
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 15:35:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozf4i-0005Yy-5h; Mon, 28 Nov 2022 09:25:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ozf37-0004lA-S0
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 09:24:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ozf30-0006v7-Qq
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 09:23:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669645430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ybwrf7qofS/wjdaGBTsJ7rySfAUxRI++9qKC5i99MK4=;
 b=Bg1Hy8T8jbUrnX/Uk2Oka5Jt8Y73cK68Y3kd9Luo48SS4Wxmf7VZBGkjmKIhYK+1i2dCC0
 X93SirlAjku9U4+3VUuvLTmmL5JPU/HSP3knyg0FdQ/QeeQu3ptoy0ECr4MVenvTZtb+WQ
 jkWkztFYl67u+q4vkqjcl8U9tre99Tc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-uPeC7bR9O_-M1i9KUOgGxQ-1; Mon, 28 Nov 2022 09:23:47 -0500
X-MC-Unique: uPeC7bR9O_-M1i9KUOgGxQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86F723C0E444;
 Mon, 28 Nov 2022 14:23:46 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 245281401C22;
 Mon, 28 Nov 2022 14:23:46 +0000 (UTC)
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
Subject: [PATCH v7 14/14] block/dirty-bitmap: convert coroutine-only functions
 to co_wrapper
Date: Mon, 28 Nov 2022 09:23:37 -0500
Message-Id: <20221128142337.657646-15-eesposit@redhat.com>
In-Reply-To: <20221128142337.657646-1-eesposit@redhat.com>
References: <20221128142337.657646-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
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

bdrv_can_store_new_dirty_bitmap and bdrv_remove_persistent_dirty_bitmap
check if they are running in a coroutine, directly calling the
coroutine callback if it's the case.
Except that no coroutine calls such functions, therefore that check
can be removed, and function creation can be offloaded to
c_w.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 include/block/block-common.h |  5 +-
 include/block/block-io.h     | 10 +++-
 include/block/dirty-bitmap.h | 10 +++-
 block/dirty-bitmap.c         | 88 +-----------------------------------
 block/meson.build            |  1 +
 5 files changed, 22 insertions(+), 92 deletions(-)

diff --git a/include/block/block-common.h b/include/block/block-common.h
index 847e4d4626..6cf603ab06 100644
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
 
@@ -51,6 +49,9 @@
 #define co_wrapper
 #define co_wrapper_mixed
 
+#include "block/dirty-bitmap.h"
+#include "block/blockjob.h"
+
 /* block.c */
 typedef struct BlockDriver BlockDriver;
 typedef struct BdrvChild BdrvChild;
diff --git a/include/block/block-io.h b/include/block/block-io.h
index 72cf45975b..52869ea08e 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -215,8 +215,14 @@ AioContext *child_of_bds_get_parent_aio_context(BdrvChild *c);
 void bdrv_io_plug(BlockDriverState *bs);
 void bdrv_io_unplug(BlockDriverState *bs);
 
-bool bdrv_can_store_new_dirty_bitmap(BlockDriverState *bs, const char *name,
-                                     uint32_t granularity, Error **errp);
+bool coroutine_fn bdrv_co_can_store_new_dirty_bitmap(BlockDriverState *bs,
+                                                     const char *name,
+                                                     uint32_t granularity,
+                                                     Error **errp);
+bool co_wrapper bdrv_can_store_new_dirty_bitmap(BlockDriverState *bs,
+                                                const char *name,
+                                                uint32_t granularity,
+                                                Error **errp);
 
 /**
  *
diff --git a/include/block/dirty-bitmap.h b/include/block/dirty-bitmap.h
index 6528336c4c..c3700cec76 100644
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
+int co_wrapper bdrv_remove_persistent_dirty_bitmap(BlockDriverState *bs,
+                                                   const char *name,
+                                                   Error **errp);
+
 void bdrv_disable_dirty_bitmap(BdrvDirtyBitmap *bitmap);
 void bdrv_enable_dirty_bitmap(BdrvDirtyBitmap *bitmap);
 void bdrv_enable_dirty_bitmap_locked(BdrvDirtyBitmap *bitmap);
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
-- 
2.31.1


