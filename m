Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6E9243D84
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Aug 2020 18:37:04 +0200 (CEST)
Received: from localhost ([::1]:45486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k6GDv-0006LP-1v
	for lists+qemu-devel@lfdr.de; Thu, 13 Aug 2020 12:37:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1k6G7V-0002cg-Jd
 for qemu-devel@nongnu.org; Thu, 13 Aug 2020 12:30:25 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:52262
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1k6G7T-0001OJ-1u
 for qemu-devel@nongnu.org; Thu, 13 Aug 2020 12:30:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597336222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kEGx+KPcTlaXBRNwmivDGLy9B4IdsJsvz0H5MbS0GGI=;
 b=UcW9uS5HaTVKyytB4PTsIwFIt4gUA9E7O6IWBKWqoOt31W3M+iXmB8fbwAtyxMAVmaTZTR
 tyCm7OZnuTDF/9cqIl16HDmCEr8oEFzuQVJpzyPrS/GNKCAk+BX8ouBlObLTgc4LenLhQQ
 YoJj1IXHyxI/MFqXs5N58/5eMrlTEH4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-4QujbiJUM3akIKyn0-gHBw-1; Thu, 13 Aug 2020 12:30:20 -0400
X-MC-Unique: 4QujbiJUM3akIKyn0-gHBw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9AB761005504;
 Thu, 13 Aug 2020 16:30:19 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-113-97.ams2.redhat.com [10.36.113.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 79EB85C1A3;
 Thu, 13 Aug 2020 16:30:18 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH 16/22] block/export: Allocate BlockExport in blk_exp_add()
Date: Thu, 13 Aug 2020 18:29:29 +0200
Message-Id: <20200813162935.210070-17-kwolf@redhat.com>
In-Reply-To: <20200813162935.210070-1-kwolf@redhat.com>
References: <20200813162935.210070-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/13 03:45:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
---
 include/block/export.h |  3 ++-
 include/block/nbd.h    | 11 ++++++-----
 block/export/export.c  | 17 ++++++++++++++++-
 blockdev-nbd.c         | 24 +++++++++++++-----------
 nbd/server.c           | 30 +++++++++++++-----------------
 5 files changed, 50 insertions(+), 35 deletions(-)

diff --git a/include/block/export.h b/include/block/export.h
index 5459f79469..597fc58245 100644
--- a/include/block/export.h
+++ b/include/block/export.h
@@ -20,7 +20,8 @@ typedef struct BlockExport BlockExport;
 
 typedef struct BlockExportDriver {
     BlockExportType type;
-    BlockExport *(*create)(BlockExportOptions *, Error **);
+    size_t instance_size;
+    int (*create)(BlockExport *, BlockExportOptions *, Error **);
     void (*delete)(BlockExport *);
 } BlockExportDriver;
 
diff --git a/include/block/nbd.h b/include/block/nbd.h
index af8509ab70..602536feb2 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -328,11 +328,12 @@ int nbd_errno_to_system_errno(int err);
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
index ef86bf892b..9de108cbc1 100644
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
@@ -46,7 +48,19 @@ BlockExport *blk_exp_add(BlockExportOptions *export, Error **errp)
         return NULL;
     }
 
-    return drv->create(export, errp);
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
 
 void blk_exp_ref(BlockExport *exp)
@@ -60,6 +74,7 @@ void blk_exp_unref(BlockExport *exp)
     assert(exp->refcount > 0);
     if (--exp->refcount == 0) {
         exp->drv->delete(exp);
+        g_free(exp);
     }
 }
 
diff --git a/blockdev-nbd.c b/blockdev-nbd.c
index 5e97975c80..f97deba424 100644
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
 
     bs = bdrv_lookup_bs(exp_args->device, exp_args->device, errp);
     if (!bs) {
-        return NULL;
+        return -ENOENT;
     }
 
     aio_context = bdrv_get_aio_context(bs);
@@ -218,14 +219,15 @@ BlockExport *nbd_export_create(BlockExportOptions *exp_args, Error **errp)
         arg->writable = false;
     }
     if (bdrv_is_read_only(bs) && arg->writable) {
+        ret = -EINVAL;
         error_setg(errp, "Cannot export read-only node as writable");
         goto out;
     }
 
-    exp = nbd_export_new(bs, arg->name, arg->description, arg->bitmap,
+    ret = nbd_export_new(exp, bs, arg->name, arg->description, arg->bitmap,
                          !arg->writable, !arg->writable,
                          exp_args->writethrough, errp);
-    if (!exp) {
+    if (ret < 0) {
         goto out;
     }
 
@@ -234,10 +236,10 @@ BlockExport *nbd_export_create(BlockExportOptions *exp_args, Error **errp)
      * the strong reference that is @exp. */
     blk_exp_unref((BlockExport*) exp);
 
+    ret = 0;
  out:
     aio_context_release(aio_context);
-    /* TODO Remove the cast: Move to server.c which can access fields of exp */
-    return (BlockExport*) exp;
+    return ret;
 }
 
 void qmp_nbd_server_remove(const char *name,
diff --git a/nbd/server.c b/nbd/server.c
index b735a68429..6a58297557 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -1513,14 +1513,14 @@ void nbd_export_set_on_eject_blk(BlockExport *exp, BlockBackend *blk)
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
@@ -1529,17 +1529,11 @@ NBDExport *nbd_export_new(BlockDriverState *bs,
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


