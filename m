Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E1D260487
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Sep 2020 20:29:23 +0200 (CEST)
Received: from localhost ([::1]:42454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFLtK-0004Jk-FN
	for lists+qemu-devel@lfdr.de; Mon, 07 Sep 2020 14:29:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kFLlH-0005kK-Qs
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 14:21:03 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40954
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kFLlE-0004fQ-Oz
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 14:21:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599502860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c5sfUBCH2WZ6Pr9oyVfA+dDUR62cIP5v3kxspULHqBw=;
 b=LYWLXz/MLyNeRUpYmcTfMPDVEx1nqt8CQxUCZHvNhhO0ostuhC2VfWkUIPhWeNhrJhUY1g
 XwtQdohhoshAL5qnsCYDztIUIoaDkler2rh/TAIkAohfq3tcDLUQ2EXhkCh2xvqAR4M/uT
 MfMhNOLXfafNs6s2EqeEMebvTmLnwHI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-6N6DXNO6MuKQn_3f3Z__fw-1; Mon, 07 Sep 2020 14:20:58 -0400
X-MC-Unique: 6N6DXNO6MuKQn_3f3Z__fw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4CAD48015A8;
 Mon,  7 Sep 2020 18:20:57 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-114-154.ams2.redhat.com
 [10.36.114.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 33DF060C17;
 Mon,  7 Sep 2020 18:20:56 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 23/29] block/export: Create BlockBackend in blk_exp_add()
Date: Mon,  7 Sep 2020 20:20:05 +0200
Message-Id: <20200907182011.521007-24-kwolf@redhat.com>
In-Reply-To: <20200907182011.521007-1-kwolf@redhat.com>
References: <20200907182011.521007-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/07 02:54:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Every export type will need a BlockBackend, so creating it centrally in
blk_exp_add() instead of the .create driver callback avoids duplication.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/nbd.h   |  4 ++--
 block/export/export.c | 49 +++++++++++++++++++++++++++++++++++++++----
 blockdev-nbd.c        | 33 ++++-------------------------
 nbd/server.c          | 38 +++++++++++----------------------
 4 files changed, 63 insertions(+), 61 deletions(-)

diff --git a/include/block/nbd.h b/include/block/nbd.h
index a4dc1f9e54..5270b7eadd 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -332,10 +332,10 @@ typedef struct NBDClient NBDClient;
 
 int nbd_export_create(BlockExport *exp, BlockExportOptions *exp_args,
                       Error **errp);
-int nbd_export_new(BlockExport *blk_exp, BlockDriverState *bs,
+int nbd_export_new(BlockExport *blk_exp,
                    const char *name, const char *desc,
                    const char *bitmap, bool readonly, bool shared,
-                   bool writethrough, Error **errp);
+                   Error **errp);
 void nbd_export_set_on_eject_blk(BlockExport *exp, BlockBackend *blk);
 
 AioContext *nbd_export_aio_context(NBDExport *exp);
diff --git a/block/export/export.c b/block/export/export.c
index 40fc9d505f..52ec00dfcf 100644
--- a/block/export/export.c
+++ b/block/export/export.c
@@ -58,7 +58,10 @@ static const BlockExportDriver *blk_exp_find_driver(BlockExportType type)
 BlockExport *blk_exp_add(BlockExportOptions *export, Error **errp)
 {
     const BlockExportDriver *drv;
-    BlockExport *exp;
+    BlockExport *exp = NULL;
+    BlockDriverState *bs;
+    BlockBackend *blk;
+    AioContext *ctx;
     int ret;
 
     if (!id_wellformed(export->id)) {
@@ -76,6 +79,33 @@ BlockExport *blk_exp_add(BlockExportOptions *export, Error **errp)
         return NULL;
     }
 
+    bs = bdrv_lookup_bs(NULL, export->node_name, errp);
+    if (!bs) {
+        return NULL;
+    }
+
+    ctx = bdrv_get_aio_context(bs);
+    aio_context_acquire(ctx);
+
+    /*
+     * Block exports are used for non-shared storage migration. Make sure
+     * that BDRV_O_INACTIVE is cleared and the image is ready for write
+     * access since the export could be available before migration handover.
+     * ctx was acquired in the caller.
+     */
+    bdrv_invalidate_cache(bs, NULL);
+
+    blk = blk_new(ctx, BLK_PERM_CONSISTENT_READ, BLK_PERM_ALL);
+    ret = blk_insert_bs(blk, bs, errp);
+    if (ret < 0) {
+        goto fail;
+    }
+
+    if (!export->has_writethrough) {
+        export->writethrough = false;
+    }
+    blk_set_enable_write_cache(blk, !export->writethrough);
+
     assert(drv->instance_size >= sizeof(BlockExport));
     exp = g_malloc0(drv->instance_size);
     *exp = (BlockExport) {
@@ -83,19 +113,30 @@ BlockExport *blk_exp_add(BlockExportOptions *export, Error **errp)
         .refcount   = 1,
         .user_owned = true,
         .id         = g_strdup(export->id),
+        .ctx        = ctx,
+        .blk        = blk,
     };
 
     ret = drv->create(exp, export, errp);
     if (ret < 0) {
-        g_free(exp->id);
-        g_free(exp);
-        return NULL;
+        goto fail;
     }
 
     assert(exp->blk != NULL);
 
     QLIST_INSERT_HEAD(&block_exports, exp, next);
+
+    aio_context_release(ctx);
     return exp;
+
+fail:
+    blk_unref(blk);
+    aio_context_release(ctx);
+    if (exp) {
+        g_free(exp->id);
+        g_free(exp);
+    }
+    return NULL;
 }
 
 /* Callers must hold exp->ctx lock */
diff --git a/blockdev-nbd.c b/blockdev-nbd.c
index 4a9a1be571..cdbbcdb958 100644
--- a/blockdev-nbd.c
+++ b/blockdev-nbd.c
@@ -177,9 +177,6 @@ int nbd_export_create(BlockExport *exp, BlockExportOptions *exp_args,
                       Error **errp)
 {
     BlockExportOptionsNbd *arg = &exp_args->u.nbd;
-    BlockDriverState *bs = NULL;
-    AioContext *aio_context;
-    int ret;
 
     assert(exp_args->type == BLOCK_EXPORT_TYPE_NBD);
 
@@ -207,38 +204,16 @@ int nbd_export_create(BlockExport *exp, BlockExportOptions *exp_args,
         return -EEXIST;
     }
 
-    bs = bdrv_lookup_bs(NULL, exp_args->node_name, errp);
-    if (!bs) {
-        return -ENOENT;
-    }
-
-    aio_context = bdrv_get_aio_context(bs);
-    aio_context_acquire(aio_context);
-
     if (!arg->has_writable) {
         arg->writable = false;
     }
-    if (bdrv_is_read_only(bs) && arg->writable) {
-        ret = -EINVAL;
+    if (blk_is_read_only(exp->blk) && arg->writable) {
         error_setg(errp, "Cannot export read-only node as writable");
-        goto out;
-    }
-
-    if (!exp_args->has_writethrough) {
-        exp_args->writethrough = false;
-    }
-
-    ret = nbd_export_new(exp, bs, arg->name, arg->description, arg->bitmap,
-                         !arg->writable, !arg->writable,
-                         exp_args->writethrough, errp);
-    if (ret < 0) {
-        goto out;
+        return -EINVAL;
     }
 
-    ret = 0;
- out:
-    aio_context_release(aio_context);
-    return ret;
+    return nbd_export_new(exp, arg->name, arg->description, arg->bitmap,
+                          !arg->writable, !arg->writable, errp);
 }
 
 void qmp_nbd_server_add(NbdServerAddOptions *arg, Error **errp)
diff --git a/nbd/server.c b/nbd/server.c
index f9af45c480..6c8532de23 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -1507,56 +1507,42 @@ void nbd_export_set_on_eject_blk(BlockExport *exp, BlockBackend *blk)
     blk_add_remove_bs_notifier(blk, &nbd_exp->eject_notifier);
 }
 
-int nbd_export_new(BlockExport *blk_exp, BlockDriverState *bs,
+int nbd_export_new(BlockExport *blk_exp,
                    const char *name, const char *desc,
                    const char *bitmap, bool readonly, bool shared,
-                   bool writethrough, Error **errp)
+                   Error **errp)
 {
     NBDExport *exp = container_of(blk_exp, NBDExport, common);
-    AioContext *ctx;
-    BlockBackend *blk;
+    BlockBackend *blk = blk_exp->blk;
     int64_t size;
-    uint64_t perm;
+    uint64_t perm, shared_perm;
     int ret;
 
-    size = bdrv_getlength(bs);
+    size = blk_getlength(blk);
     if (size < 0) {
         error_setg_errno(errp, -size,
                          "Failed to determine the NBD export's length");
         return size;
     }
 
-    ctx = bdrv_get_aio_context(bs);
-    blk_exp->ctx = ctx;
-
-    /*
-     * NBD exports are used for non-shared storage migration.  Make sure
-     * that BDRV_O_INACTIVE is cleared and the image is ready for write
-     * access since the export could be available before migration handover.
-     * ctx was acquired in the caller.
-     */
     assert(name && strlen(name) <= NBD_MAX_STRING_SIZE);
 
-    bdrv_invalidate_cache(bs, NULL);
-
     /* Don't allow resize while the NBD server is running, otherwise we don't
      * care what happens with the node. */
-    perm = BLK_PERM_CONSISTENT_READ;
+    blk_get_perm(blk, &perm, &shared_perm);
+
     if (!readonly) {
         perm |= BLK_PERM_WRITE;
     }
-    blk = blk_new(ctx, perm,
-                  BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE_UNCHANGED |
-                  BLK_PERM_WRITE | BLK_PERM_GRAPH_MOD);
-    ret = blk_insert_bs(blk, bs, errp);
+
+    ret = blk_set_perm(blk, perm, shared_perm & ~BLK_PERM_RESIZE, errp);
     if (ret < 0) {
-        goto fail;
+        return ret;
     }
-    blk_set_enable_write_cache(blk, !writethrough);
+
     blk_set_allow_aio_context_change(blk, true);
 
     QTAILQ_INIT(&exp->clients);
-    exp->common.blk = blk;
     exp->name = g_strdup(name);
     assert(!desc || strlen(desc) <= NBD_MAX_STRING_SIZE);
     exp->description = g_strdup(desc);
@@ -1574,6 +1560,7 @@ int nbd_export_new(BlockExport *blk_exp, BlockDriverState *bs,
     exp->size = QEMU_ALIGN_DOWN(size, BDRV_SECTOR_SIZE);
 
     if (bitmap) {
+        BlockDriverState *bs = blk_bs(blk);
         BdrvDirtyBitmap *bm = NULL;
 
         while (bs) {
@@ -1620,7 +1607,6 @@ int nbd_export_new(BlockExport *blk_exp, BlockDriverState *bs,
     return 0;
 
 fail:
-    blk_unref(blk);
     g_free(exp->name);
     g_free(exp->description);
     return ret;
-- 
2.25.4


