Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 401B7260481
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Sep 2020 20:29:08 +0200 (CEST)
Received: from localhost ([::1]:40712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFLt5-0003ag-8N
	for lists+qemu-devel@lfdr.de; Mon, 07 Sep 2020 14:29:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kFLlD-0005XO-B4
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 14:20:59 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:27516
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kFLl6-0004bD-1v
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 14:20:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599502851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KFn+seHG9Pe5lAtHhudek2bNVJXt/o+71Y+zluxojOI=;
 b=G5agh7AM8YjjDiton0Or68l/L7xwP8OjdkgNDijHzBZam/+D1qnGCGOkP+NoNSfNB47WJp
 KSkD0rP++M+eqAUejZbm/POumHNmSn3QR57nzJ37GSjuuLsSODNT8iS4ktCYbP8JIWnN0y
 iooJYr+U02yp9hxvpg6sL+NgIdKNLEA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-1ivyUc3iO1G1MA3xFoP0AA-1; Mon, 07 Sep 2020 14:20:49 -0400
X-MC-Unique: 1ivyUc3iO1G1MA3xFoP0AA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9951393B1;
 Mon,  7 Sep 2020 18:20:48 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-114-154.ams2.redhat.com
 [10.36.114.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F53060BF3;
 Mon,  7 Sep 2020 18:20:47 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 17/29] block/export: Add blk_exp_close_all(_type)
Date: Mon,  7 Sep 2020 20:19:59 +0200
Message-Id: <20200907182011.521007-18-kwolf@redhat.com>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This adds a function to shut down all block exports, and another one to
shut down the block exports of a single type. The latter is used for now
when stopping the NBD server. As soon as we implement support for
multiple NBD servers, we'll need a per-server list of exports and it
will be replaced by a function using that.

As a side effect, the BlockExport layer has a list tracking all existing
exports now. closed_exports loses its only user and can go away.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/export.h | 15 ++++++++
 include/block/nbd.h    |  2 --
 block.c                |  2 +-
 block/export/export.c  | 79 ++++++++++++++++++++++++++++++++++++++++--
 blockdev-nbd.c         |  2 +-
 nbd/server.c           | 34 +++---------------
 qemu-nbd.c             |  2 +-
 7 files changed, 100 insertions(+), 36 deletions(-)

diff --git a/include/block/export.h b/include/block/export.h
index cf9b1c9dad..6fffcb5651 100644
--- a/include/block/export.h
+++ b/include/block/export.h
@@ -15,6 +15,7 @@
 #define BLOCK_EXPORT_H
 
 #include "qapi/qapi-types-block-export.h"
+#include "qemu/queue.h"
 
 typedef struct BlockExport BlockExport;
 
@@ -36,6 +37,14 @@ typedef struct BlockExportDriver {
      * references have been dropped.
      */
     void (*delete)(BlockExport *);
+
+    /*
+     * Start to disconnect all clients and drop other references held
+     * internally by the export driver. When the function returns, there may
+     * still be active references while the export is in the process of
+     * shutting down.
+     */
+    void (*request_shutdown)(BlockExport *);
 } BlockExportDriver;
 
 struct BlockExport {
@@ -50,10 +59,16 @@ struct BlockExport {
 
     /* The AioContext whose lock protects this BlockExport object. */
     AioContext *ctx;
+
+    /* List entry for block_exports */
+    QLIST_ENTRY(BlockExport) next;
 };
 
 BlockExport *blk_exp_add(BlockExportOptions *export, Error **errp);
 void blk_exp_ref(BlockExport *exp);
 void blk_exp_unref(BlockExport *exp);
+void blk_exp_request_shutdown(BlockExport *exp);
+void blk_exp_close_all(void);
+void blk_exp_close_all_type(BlockExportType type);
 
 #endif
diff --git a/include/block/nbd.h b/include/block/nbd.h
index fc2c153d5b..0b9f3e5d4e 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -337,12 +337,10 @@ int nbd_export_new(BlockExport *blk_exp, BlockDriverState *bs,
                    const char *bitmap, bool readonly, bool shared,
                    bool writethrough, Error **errp);
 void nbd_export_set_on_eject_blk(BlockExport *exp, BlockBackend *blk);
-void nbd_export_close(NBDExport *exp);
 void nbd_export_remove(NBDExport *exp, NbdServerRemoveMode mode, Error **errp);
 
 AioContext *nbd_export_aio_context(NBDExport *exp);
 NBDExport *nbd_export_find(const char *name);
-void nbd_export_close_all(void);
 
 void nbd_client_new(QIOChannelSocket *sioc,
                     QCryptoTLSCreds *tlscreds,
diff --git a/block.c b/block.c
index 9538af4884..acde53f92a 100644
--- a/block.c
+++ b/block.c
@@ -4462,7 +4462,7 @@ static void bdrv_close(BlockDriverState *bs)
 void bdrv_close_all(void)
 {
     assert(job_next(NULL) == NULL);
-    nbd_export_close_all();
+    blk_exp_close_all();
 
     /* Drop references from requests still in flight, such as canceled block
      * jobs whose AIO context has not been polled yet */
diff --git a/block/export/export.c b/block/export/export.c
index 03ff155f97..1b36286010 100644
--- a/block/export/export.c
+++ b/block/export/export.c
@@ -24,6 +24,10 @@ static const BlockExportDriver *blk_exp_drivers[] = {
     &blk_exp_nbd,
 };
 
+/* Only accessed from the main thread */
+static QLIST_HEAD(, BlockExport) block_exports =
+    QLIST_HEAD_INITIALIZER(block_exports);
+
 static const BlockExportDriver *blk_exp_find_driver(BlockExportType type)
 {
     int i;
@@ -61,6 +65,7 @@ BlockExport *blk_exp_add(BlockExportOptions *export, Error **errp)
         return NULL;
     }
 
+    QLIST_INSERT_HEAD(&block_exports, exp, next);
     return exp;
 }
 
@@ -71,16 +76,86 @@ void blk_exp_ref(BlockExport *exp)
     exp->refcount++;
 }
 
+/* Runs in the main thread */
+static void blk_exp_delete_bh(void *opaque)
+{
+    BlockExport *exp = opaque;
+    AioContext *aio_context = exp->ctx;
+
+    aio_context_acquire(aio_context);
+
+    assert(exp->refcount == 0);
+    QLIST_REMOVE(exp, next);
+    exp->drv->delete(exp);
+    g_free(exp);
+
+    aio_context_release(aio_context);
+}
+
 /* Callers must hold exp->ctx lock */
 void blk_exp_unref(BlockExport *exp)
 {
     assert(exp->refcount > 0);
     if (--exp->refcount == 0) {
-        exp->drv->delete(exp);
-        g_free(exp);
+        /* Touch the block_exports list only in the main thread */
+        aio_bh_schedule_oneshot(qemu_get_aio_context(), blk_exp_delete_bh,
+                                exp);
     }
 }
 
+/* Acquires exp->ctx internally. Callers must *not* hold the lock. */
+void blk_exp_request_shutdown(BlockExport *exp)
+{
+    AioContext *aio_context = exp->ctx;
+
+    aio_context_acquire(aio_context);
+    exp->drv->request_shutdown(exp);
+    aio_context_release(aio_context);
+}
+
+/*
+ * Returns whether a block export of the given type exists.
+ * type == BLOCK_EXPORT_TYPE__MAX checks for an export of any type.
+ */
+static bool blk_exp_has_type(BlockExportType type)
+{
+    BlockExport *exp;
+
+    if (type == BLOCK_EXPORT_TYPE__MAX) {
+        return !QLIST_EMPTY(&block_exports);
+    }
+
+    QLIST_FOREACH(exp, &block_exports, next) {
+        if (exp->drv->type == type) {
+            return true;
+        }
+    }
+
+    return false;
+}
+
+/* type == BLOCK_EXPORT_TYPE__MAX for all types */
+void blk_exp_close_all_type(BlockExportType type)
+{
+    BlockExport *exp, *next;
+
+    assert(in_aio_context_home_thread(qemu_get_aio_context()));
+
+    QLIST_FOREACH_SAFE(exp, &block_exports, next, next) {
+        if (type != BLOCK_EXPORT_TYPE__MAX && exp->drv->type != type) {
+            continue;
+        }
+        blk_exp_request_shutdown(exp);
+    }
+
+    AIO_WAIT_WHILE(NULL, blk_exp_has_type(type));
+}
+
+void blk_exp_close_all(void)
+{
+    blk_exp_close_all_type(BLOCK_EXPORT_TYPE__MAX);
+}
+
 void qmp_block_export_add(BlockExportOptions *export, Error **errp)
 {
     blk_exp_add(export, errp);
diff --git a/blockdev-nbd.c b/blockdev-nbd.c
index b34f159888..f927264777 100644
--- a/blockdev-nbd.c
+++ b/blockdev-nbd.c
@@ -345,7 +345,7 @@ void qmp_nbd_server_stop(Error **errp)
         return;
     }
 
-    nbd_export_close_all();
+    blk_exp_close_all_type(BLOCK_EXPORT_TYPE_NBD);
 
     nbd_server_free(nbd_server);
     nbd_server = NULL;
diff --git a/nbd/server.c b/nbd/server.c
index f31d8bbb60..32147e4871 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -100,8 +100,6 @@ struct NBDExport {
 };
 
 static QTAILQ_HEAD(, NBDExport) exports = QTAILQ_HEAD_INITIALIZER(exports);
-static QTAILQ_HEAD(, NBDExport) closed_exports =
-        QTAILQ_HEAD_INITIALIZER(closed_exports);
 
 /* NBDExportMetaContexts represents a list of contexts to be exported,
  * as selected by NBD_OPT_SET_META_CONTEXT. Also used for
@@ -1494,12 +1492,8 @@ static void blk_aio_detach(void *opaque)
 static void nbd_eject_notifier(Notifier *n, void *data)
 {
     NBDExport *exp = container_of(n, NBDExport, eject_notifier);
-    AioContext *aio_context;
 
-    aio_context = exp->common.ctx;
-    aio_context_acquire(aio_context);
-    nbd_export_close(exp);
-    aio_context_release(aio_context);
+    blk_exp_request_shutdown(&exp->common);
 }
 
 void nbd_export_set_on_eject_blk(BlockExport *exp, BlockBackend *blk)
@@ -1652,8 +1646,9 @@ nbd_export_aio_context(NBDExport *exp)
     return exp->common.ctx;
 }
 
-void nbd_export_close(NBDExport *exp)
+static void nbd_export_request_shutdown(BlockExport *blk_exp)
 {
+    NBDExport *exp = container_of(blk_exp, NBDExport, common);
     NBDClient *client, *next;
 
     blk_exp_ref(&exp->common);
@@ -1672,7 +1667,6 @@ void nbd_export_close(NBDExport *exp)
         g_free(exp->name);
         exp->name = NULL;
         QTAILQ_REMOVE(&exports, exp, next);
-        QTAILQ_INSERT_TAIL(&closed_exports, exp, next);
     }
     blk_exp_unref(&exp->common);
 }
@@ -1681,7 +1675,7 @@ void nbd_export_remove(NBDExport *exp, NbdServerRemoveMode mode, Error **errp)
 {
     ERRP_GUARD();
     if (mode == NBD_SERVER_REMOVE_MODE_HARD || QTAILQ_EMPTY(&exp->clients)) {
-        nbd_export_close(exp);
+        nbd_export_request_shutdown(&exp->common);
         return;
     }
 
@@ -1716,9 +1710,6 @@ static void nbd_export_delete(BlockExport *blk_exp)
         bdrv_dirty_bitmap_set_busy(exp->export_bitmap, false);
         g_free(exp->export_bitmap_context);
     }
-
-    QTAILQ_REMOVE(&closed_exports, exp, next);
-    aio_wait_kick();
 }
 
 const BlockExportDriver blk_exp_nbd = {
@@ -1726,24 +1717,9 @@ const BlockExportDriver blk_exp_nbd = {
     .instance_size      = sizeof(NBDExport),
     .create             = nbd_export_create,
     .delete             = nbd_export_delete,
+    .request_shutdown   = nbd_export_request_shutdown,
 };
 
-void nbd_export_close_all(void)
-{
-    NBDExport *exp, *next;
-    AioContext *aio_context;
-
-    QTAILQ_FOREACH_SAFE(exp, &exports, next, next) {
-        aio_context = exp->common.ctx;
-        aio_context_acquire(aio_context);
-        nbd_export_close(exp);
-        aio_context_release(aio_context);
-    }
-
-    AIO_WAIT_WHILE(NULL, !(QTAILQ_EMPTY(&exports) &&
-                           QTAILQ_EMPTY(&closed_exports)));
-}
-
 static int coroutine_fn nbd_co_send_iov(NBDClient *client, struct iovec *iov,
                                         unsigned niov, Error **errp)
 {
diff --git a/qemu-nbd.c b/qemu-nbd.c
index 23c2b7da8e..c64f83618b 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -1119,7 +1119,7 @@ int main(int argc, char **argv)
     do {
         main_loop_wait(false);
         if (state == TERMINATE) {
-            nbd_export_close_all();
+            blk_exp_close_all();
             state = TERMINATED;
         }
     } while (state != TERMINATED);
-- 
2.25.4


