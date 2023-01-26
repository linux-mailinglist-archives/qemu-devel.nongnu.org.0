Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5C467D313
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 18:26:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL5zd-0005a9-Kl; Thu, 26 Jan 2023 12:24:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pL5zb-0005Z1-NK
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 12:24:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pL5zZ-0005Zb-UI
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 12:24:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674753892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8OHHnKZasdsaefZ9Vtdx31JCMGSeVCGSQ+Uyhmia6uk=;
 b=W0p1QDlbOPGsYsAqBIS9y8LQyP+Wbe0tcbs6vn3n3IL9SE2agpzuuwYS2sQvaQvhraOK8c
 f3YYWjP8VKtrZk/Jg/XG1xQGwwwJKOYA7aHYf6B1EypQMGSW5yHFshtZJZ/vepshkOIuYT
 eCJrjx3WFictXv26qA81G0Y6RjYr49Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-99-Q_aKdMXHNomdjPkmrW4x5g-1; Thu, 26 Jan 2023 12:24:51 -0500
X-MC-Unique: Q_aKdMXHNomdjPkmrW4x5g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9EB080D183;
 Thu, 26 Jan 2023 17:24:50 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F3B0D492C14;
 Thu, 26 Jan 2023 17:24:49 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, eesposit@redhat.com,
 pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH 02/13] block: Create no_co_wrappers for open functions
Date: Thu, 26 Jan 2023 18:24:21 +0100
Message-Id: <20230126172432.436111-3-kwolf@redhat.com>
In-Reply-To: <20230126172432.436111-1-kwolf@redhat.com>
References: <20230126172432.436111-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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

Images can't be opened in coroutine context because opening needs to
change the block graph. Add no_co_wrappers so that coroutines have a
simple way of opening images in a BH instead.

At the same time, mark the wrapped functions as no_coroutine_fn.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block-global-state.h          | 35 +++++++++++++++------
 include/sysemu/block-backend-global-state.h | 21 ++++++++++---
 block/meson.build                           |  1 +
 3 files changed, 44 insertions(+), 13 deletions(-)

diff --git a/include/block/block-global-state.h b/include/block/block-global-state.h
index a38f86dc15..447176414e 100644
--- a/include/block/block-global-state.h
+++ b/include/block/block-global-state.h
@@ -77,16 +77,26 @@ BlockDriverState *bdrv_insert_node(BlockDriverState *bs, QDict *node_options,
                                    int flags, Error **errp);
 int bdrv_drop_filter(BlockDriverState *bs, Error **errp);
 
-BdrvChild *bdrv_open_child(const char *filename,
-                           QDict *options, const char *bdref_key,
-                           BlockDriverState *parent,
-                           const BdrvChildClass *child_class,
-                           BdrvChildRole child_role,
-                           bool allow_none, Error **errp);
+BdrvChild * no_coroutine_fn
+bdrv_open_child(const char *filename, QDict *options, const char *bdref_key,
+                BlockDriverState *parent, const BdrvChildClass *child_class,
+                BdrvChildRole child_role, bool allow_none, Error **errp);
+
+BdrvChild * coroutine_fn no_co_wrapper
+bdrv_co_open_child(const char *filename, QDict *options, const char *bdref_key,
+                BlockDriverState *parent, const BdrvChildClass *child_class,
+                BdrvChildRole child_role, bool allow_none, Error **errp);
+
 int bdrv_open_file_child(const char *filename,
                          QDict *options, const char *bdref_key,
                          BlockDriverState *parent, Error **errp);
-BlockDriverState *bdrv_open_blockdev_ref(BlockdevRef *ref, Error **errp);
+
+BlockDriverState * no_coroutine_fn
+bdrv_open_blockdev_ref(BlockdevRef *ref, Error **errp);
+
+BlockDriverState * coroutine_fn no_co_wrapper
+bdrv_co_open_blockdev_ref(BlockdevRef *ref, Error **errp);
+
 int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
                         Error **errp);
 int bdrv_set_backing_hd_drained(BlockDriverState *bs,
@@ -94,8 +104,15 @@ int bdrv_set_backing_hd_drained(BlockDriverState *bs,
                                 Error **errp);
 int bdrv_open_backing_file(BlockDriverState *bs, QDict *parent_options,
                            const char *bdref_key, Error **errp);
-BlockDriverState *bdrv_open(const char *filename, const char *reference,
-                            QDict *options, int flags, Error **errp);
+
+BlockDriverState * no_coroutine_fn
+bdrv_open(const char *filename, const char *reference, QDict *options,
+          int flags, Error **errp);
+
+BlockDriverState * coroutine_fn no_co_wrapper
+bdrv_co_open(const char *filename, const char *reference,
+             QDict *options, int flags, Error **errp);
+
 BlockDriverState *bdrv_new_open_driver_opts(BlockDriver *drv,
                                             const char *node_name,
                                             QDict *options, int flags,
diff --git a/include/sysemu/block-backend-global-state.h b/include/sysemu/block-backend-global-state.h
index 6858e39cb6..2b6d27db7c 100644
--- a/include/sysemu/block-backend-global-state.h
+++ b/include/sysemu/block-backend-global-state.h
@@ -23,10 +23,23 @@
  */
 
 BlockBackend *blk_new(AioContext *ctx, uint64_t perm, uint64_t shared_perm);
-BlockBackend *blk_new_with_bs(BlockDriverState *bs, uint64_t perm,
-                              uint64_t shared_perm, Error **errp);
-BlockBackend *blk_new_open(const char *filename, const char *reference,
-                           QDict *options, int flags, Error **errp);
+
+BlockBackend * no_coroutine_fn
+blk_new_with_bs(BlockDriverState *bs, uint64_t perm, uint64_t shared_perm,
+                Error **errp);
+
+BlockBackend * coroutine_fn no_co_wrapper
+blk_co_new_with_bs(BlockDriverState *bs, uint64_t perm, uint64_t shared_perm,
+                   Error **errp);
+
+BlockBackend * no_coroutine_fn
+blk_new_open(const char *filename, const char *reference, QDict *options,
+             int flags, Error **errp);
+
+BlockBackend * coroutine_fn no_co_wrapper
+blk_co_new_open(const char *filename, const char *reference, QDict *options,
+                int flags, Error **errp);
+
 int blk_get_refcnt(BlockBackend *blk);
 void blk_ref(BlockBackend *blk);
 void blk_unref(BlockBackend *blk);
diff --git a/block/meson.build b/block/meson.build
index 3662852dc2..382bec0e7d 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -141,6 +141,7 @@ block_gen_c = custom_target('block-gen.c',
                                       '../include/block/dirty-bitmap.h',
                                       '../include/block/block_int-io.h',
                                       '../include/block/block-global-state.h',
+                                      '../include/sysemu/block-backend-global-state.h',
                                       '../include/sysemu/block-backend-io.h',
                                       'coroutines.h'
                                       ),
-- 
2.38.1


