Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB6A26047C
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Sep 2020 20:27:10 +0200 (CEST)
Received: from localhost ([::1]:60646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFLrB-0000BI-V7
	for lists+qemu-devel@lfdr.de; Mon, 07 Sep 2020 14:27:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kFLlC-0005Up-6V
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 14:20:58 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:30388
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kFLl4-0004a9-U3
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 14:20:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599502850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WumjEgzugIfV1came3+RhVaDYwoEJ5pBYskc3cUJ2Ns=;
 b=EpFNA6ArAD6n3hjHYMZIlWDT2+3+sUCue2yAnDYtF4dxskMP2UsCCU/9RztJD+98DSWwCy
 ccZfd36pjieyNSr6q/3TJX8GO3aGJ0rlClE+hSG3sdJctpmv3YHS0VT1WqYH8h3WKAa+8t
 iTUX2BqpMZkl8ZZH6t6YSvjz4owYy/Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-hBmB4tyZPFW-WkhFmqK81g-1; Mon, 07 Sep 2020 14:20:48 -0400
X-MC-Unique: hBmB4tyZPFW-WkhFmqK81g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 539F01084C85;
 Mon,  7 Sep 2020 18:20:47 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-114-154.ams2.redhat.com
 [10.36.114.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B6D760BF3;
 Mon,  7 Sep 2020 18:20:46 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 16/29] block/export: Allocate BlockExport in blk_exp_add()
Date: Mon,  7 Sep 2020 20:19:58 +0200
Message-Id: <20200907182011.521007-17-kwolf@redhat.com>
In-Reply-To: <20200907182011.521007-1-kwolf@redhat.com>
References: <20200907182011.521007-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/07 03:05:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Instead of letting the driver allocate and return the BlockExport
object, allocate it already in blk_exp_add() and pass it. This allows us
to initialise the generic part before calling into the driver so that
the driver can just use these values instead of having to parse the
options a second time.

For symmetry, move freeing the BlockExport to blk_exp_unref().

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 include/block/export.h |  8 +++++++-
 include/block/nbd.h    | 11 ++++++-----
 block/export/export.c  | 18 +++++++++++++++++-
 blockdev-nbd.c         | 26 ++++++++++++++------------
 nbd/server.c           | 30 +++++++++++++-----------------
 5 files changed, 57 insertions(+), 36 deletions(-)

diff --git a/include/block/export.h b/include/block/export.h
index e6f96f4e1e..cf9b1c9dad 100644
--- a/include/block/export.h
+++ b/include/block/export.h
@@ -22,8 +22,14 @@ typedef struct BlockExportDriver {
     /* The export type that this driver services */
     BlockExportType type;
 
+    /*
+     * The size of the driver-specific state that contains BlockExport as its
+     * first field.
+     */
+    size_t instance_size;
+
     /* Creates and starts a new block export */
-    BlockExport *(*create)(BlockExportOptions *, Error **);
+    int (*create)(BlockExport *, BlockExportOptions *, Error **);
 
     /*
      * Frees a removed block export. This function is only called after all
diff --git a/include/block/nbd.h b/include/block/nbd.h
index e3bd112227..fc2c153d5b 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -330,11 +330,12 @@ int nbd_errno_to_system_errno(int err);
 typedef struct NBDExport NBDExport;
 typedef struct NBDClient NBDClient;
 
-BlockExport *nbd_export_create(BlockExportOptions *exp_args, Error **errp);
-NBDExport *nbd_export_new(BlockDriverState *bs,
-                          const char *name, const char *desc,
-                          const char *bitmap, bool readonly, bool shared,
-                          bool writethrough, Error **errp);
+int nbd_export_create(BlockExport *exp, BlockExportOptions *exp_args,
+                      Error **errp);
+int nbd_export_new(BlockExport *blk_exp, BlockDriverState *bs,
+                   const char *name, const char *desc,
+                   const char *bitmap, bool readonly, bool shared,
+                   bool writethrough, Error **errp);
 void nbd_export_set_on_eject_blk(BlockExport *exp, BlockBackend *blk);
 void nbd_export_close(NBDExport *exp);
 void nbd_export_remove(NBDExport *exp, NbdServerRemoveMode mode, Error **errp);
diff --git a/block/export/export.c b/block/export/export.c
index 8635318ef1..03ff155f97 100644
--- a/block/export/export.c
+++ b/block/export/export.c
@@ -39,6 +39,8 @@ static const BlockExportDriver *blk_exp_find_driver(BlockExportType type)
 BlockExport *blk_exp_add(BlockExportOptions *export, Error **errp)
 {
     const BlockExportDriver *drv;
+    BlockExport *exp;
+    int ret;
 
     drv = blk_exp_find_driver(export->type);
     if (!drv) {
@@ -46,7 +48,20 @@ BlockExport *blk_exp_add(BlockExportOptions *export, Error **errp)
         return NULL;
     }
 
-    return drv->create(export, errp);
+    assert(drv->instance_size >= sizeof(BlockExport));
+    exp = g_malloc0(drv->instance_size);
+    *exp = (BlockExport) {
+        .drv        = &blk_exp_nbd,
+        .refcount   = 1,
+    };
+
+    ret = drv->create(exp, export, errp);
+    if (ret < 0) {
+        g_free(exp);
+        return NULL;
+    }
+
+    return exp;
 }
 
 /* Callers must hold exp->ctx lock */
@@ -62,6 +77,7 @@ void blk_exp_unref(BlockExport *exp)
     assert(exp->refcount > 0);
     if (--exp->refcount == 0) {
         exp->drv->delete(exp);
+        g_free(exp);
     }
 }
 
diff --git a/blockdev-nbd.c b/blockdev-nbd.c
index ef14303b25..b34f159888 100644
--- a/blockdev-nbd.c
+++ b/blockdev-nbd.c
@@ -173,18 +173,19 @@ void qmp_nbd_server_start(SocketAddressLegacy *addr,
     qapi_free_SocketAddress(addr_flat);
 }
 
-BlockExport *nbd_export_create(BlockExportOptions *exp_args, Error **errp)
+int nbd_export_create(BlockExport *exp, BlockExportOptions *exp_args,
+                      Error **errp)
 {
     BlockExportOptionsNbd *arg = &exp_args->u.nbd;
     BlockDriverState *bs = NULL;
-    NBDExport *exp = NULL;
     AioContext *aio_context;
+    int ret;
 
     assert(exp_args->type == BLOCK_EXPORT_TYPE_NBD);
 
     if (!nbd_server && !is_qemu_nbd) {
         error_setg(errp, "NBD server not running");
-        return NULL;
+        return -EINVAL;
     }
 
     if (!arg->has_name) {
@@ -193,22 +194,22 @@ BlockExport *nbd_export_create(BlockExportOptions *exp_args, Error **errp)
 
     if (strlen(arg->name) > NBD_MAX_STRING_SIZE) {
         error_setg(errp, "export name '%s' too long", arg->name);
-        return NULL;
+        return -EINVAL;
     }
 
     if (arg->description && strlen(arg->description) > NBD_MAX_STRING_SIZE) {
         error_setg(errp, "description '%s' too long", arg->description);
-        return NULL;
+        return -EINVAL;
     }
 
     if (nbd_export_find(arg->name)) {
         error_setg(errp, "NBD server already has export named '%s'", arg->name);
-        return NULL;
+        return -EEXIST;
     }
 
     bs = bdrv_lookup_bs(NULL, exp_args->node_name, errp);
     if (!bs) {
-        return NULL;
+        return -ENOENT;
     }
 
     aio_context = bdrv_get_aio_context(bs);
@@ -218,6 +219,7 @@ BlockExport *nbd_export_create(BlockExportOptions *exp_args, Error **errp)
         arg->writable = false;
     }
     if (bdrv_is_read_only(bs) && arg->writable) {
+        ret = -EINVAL;
         error_setg(errp, "Cannot export read-only node as writable");
         goto out;
     }
@@ -226,22 +228,22 @@ BlockExport *nbd_export_create(BlockExportOptions *exp_args, Error **errp)
         exp_args->writethrough = false;
     }
 
-    exp = nbd_export_new(bs, arg->name, arg->description, arg->bitmap,
+    ret = nbd_export_new(exp, bs, arg->name, arg->description, arg->bitmap,
                          !arg->writable, !arg->writable,
                          exp_args->writethrough, errp);
-    if (!exp) {
+    if (ret < 0) {
         goto out;
     }
 
     /* The list of named exports has a strong reference to this export now and
      * our only way of accessing it is through nbd_export_find(), so we can drop
      * the strong reference that is @exp. */
-    blk_exp_unref((BlockExport*) exp);
+    blk_exp_unref(exp);
 
+    ret = 0;
  out:
     aio_context_release(aio_context);
-    /* TODO Remove the cast: nbd_export_new() will return a BlockExport. */
-    return (BlockExport*) exp;
+    return ret;
 }
 
 void qmp_nbd_server_add(NbdServerAddOptions *arg, Error **errp)
diff --git a/nbd/server.c b/nbd/server.c
index 7cf81646fc..f31d8bbb60 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -1514,14 +1514,14 @@ void nbd_export_set_on_eject_blk(BlockExport *exp, BlockBackend *blk)
     blk_add_remove_bs_notifier(blk, &nbd_exp->eject_notifier);
 }
 
-NBDExport *nbd_export_new(BlockDriverState *bs,
-                          const char *name, const char *desc,
-                          const char *bitmap, bool readonly, bool shared,
-                          bool writethrough, Error **errp)
+int nbd_export_new(BlockExport *blk_exp, BlockDriverState *bs,
+                   const char *name, const char *desc,
+                   const char *bitmap, bool readonly, bool shared,
+                   bool writethrough, Error **errp)
 {
+    NBDExport *exp = container_of(blk_exp, NBDExport, common);
     AioContext *ctx;
     BlockBackend *blk;
-    NBDExport *exp;
     int64_t size;
     uint64_t perm;
     int ret;
@@ -1530,17 +1530,11 @@ NBDExport *nbd_export_new(BlockDriverState *bs,
     if (size < 0) {
         error_setg_errno(errp, -size,
                          "Failed to determine the NBD export's length");
-        return NULL;
+        return size;
     }
 
     ctx = bdrv_get_aio_context(bs);
-
-    exp = g_new0(NBDExport, 1);
-    exp->common = (BlockExport) {
-        .drv        = &blk_exp_nbd,
-        .refcount   = 1,
-        .ctx        = ctx,
-    };
+    blk_exp->ctx = ctx;
 
     /*
      * NBD exports are used for non-shared storage migration.  Make sure
@@ -1599,16 +1593,19 @@ NBDExport *nbd_export_new(BlockDriverState *bs,
         }
 
         if (bm == NULL) {
+            ret = -ENOENT;
             error_setg(errp, "Bitmap '%s' is not found", bitmap);
             goto fail;
         }
 
         if (bdrv_dirty_bitmap_check(bm, BDRV_BITMAP_ALLOW_RO, errp)) {
+            ret = -EINVAL;
             goto fail;
         }
 
         if (readonly && bdrv_is_writable(bs) &&
             bdrv_dirty_bitmap_enabled(bm)) {
+            ret = -EINVAL;
             error_setg(errp,
                        "Enabled bitmap '%s' incompatible with readonly export",
                        bitmap);
@@ -1628,14 +1625,13 @@ NBDExport *nbd_export_new(BlockDriverState *bs,
     blk_exp_ref(&exp->common);
     QTAILQ_INSERT_TAIL(&exports, exp, next);
 
-    return exp;
+    return 0;
 
 fail:
     blk_unref(blk);
     g_free(exp->name);
     g_free(exp->description);
-    g_free(exp);
-    return NULL;
+    return ret;
 }
 
 NBDExport *nbd_export_find(const char *name)
@@ -1722,12 +1718,12 @@ static void nbd_export_delete(BlockExport *blk_exp)
     }
 
     QTAILQ_REMOVE(&closed_exports, exp, next);
-    g_free(exp);
     aio_wait_kick();
 }
 
 const BlockExportDriver blk_exp_nbd = {
     .type               = BLOCK_EXPORT_TYPE_NBD,
+    .instance_size      = sizeof(NBDExport),
     .create             = nbd_export_create,
     .delete             = nbd_export_delete,
 };
-- 
2.25.4


