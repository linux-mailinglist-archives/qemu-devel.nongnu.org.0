Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E6E2604C6
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Sep 2020 20:37:19 +0200 (CEST)
Received: from localhost ([::1]:47474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFM10-0001qD-2a
	for lists+qemu-devel@lfdr.de; Mon, 07 Sep 2020 14:37:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kFLlN-00061R-OG
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 14:21:09 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:24298
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kFLlL-0004hF-2P
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 14:21:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599502866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D0N2NhlgLlCFAnqbQRrr7HbUI8CkQbKjXKrwgSYYvVI=;
 b=RJ4ASBt1r1/sxA9Bh/Ppqcdh1ym/sIVygtTCfsCcPtC987iyc9SvwVf8/PGNcYqX9NUTxs
 jtZnPqtEMlZiaNfNZwVPB/6driCMp2yKNZsy9+WcUtbXQj6S69DWlVtdwKQShua2iVNK27
 fhobw86WZBTAv7mXjIvUSYpYgMFgKXI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-_kJDE4fdMZKAtwksHPpAkQ-1; Mon, 07 Sep 2020 14:21:02 -0400
X-MC-Unique: _kJDE4fdMZKAtwksHPpAkQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9392818B9F0A;
 Mon,  7 Sep 2020 18:21:01 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-114-154.ams2.redhat.com
 [10.36.114.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7AB8360C0F;
 Mon,  7 Sep 2020 18:21:00 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 26/29] nbd: Merge nbd_export_new() and nbd_export_create()
Date: Mon,  7 Sep 2020 20:20:08 +0200
Message-Id: <20200907182011.521007-27-kwolf@redhat.com>
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

There is no real reason any more why nbd_export_new() and
nbd_export_create() should be separate functions. The latter only
performs a few checks before it calls the former. Move all the checks to
nbd/server.c and make the resulting function static.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/nbd.h |  7 +-----
 blockdev-nbd.c      | 40 +++++----------------------------
 nbd/server.c        | 54 ++++++++++++++++++++++++++++++++-------------
 3 files changed, 45 insertions(+), 56 deletions(-)

diff --git a/include/block/nbd.h b/include/block/nbd.h
index 5270b7eadd..3dd9a04546 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -330,12 +330,6 @@ int nbd_errno_to_system_errno(int err);
 typedef struct NBDExport NBDExport;
 typedef struct NBDClient NBDClient;
 
-int nbd_export_create(BlockExport *exp, BlockExportOptions *exp_args,
-                      Error **errp);
-int nbd_export_new(BlockExport *blk_exp,
-                   const char *name, const char *desc,
-                   const char *bitmap, bool readonly, bool shared,
-                   Error **errp);
 void nbd_export_set_on_eject_blk(BlockExport *exp, BlockBackend *blk);
 
 AioContext *nbd_export_aio_context(NBDExport *exp);
@@ -349,6 +343,7 @@ void nbd_client_get(NBDClient *client);
 void nbd_client_put(NBDClient *client);
 
 void nbd_server_is_qemu_nbd(bool value);
+bool nbd_server_is_running(void);
 void nbd_server_start(SocketAddress *addr, const char *tls_creds,
                       const char *tls_authz, uint32_t max_connections,
                       Error **errp);
diff --git a/blockdev-nbd.c b/blockdev-nbd.c
index 30e165c23f..8174023e5c 100644
--- a/blockdev-nbd.c
+++ b/blockdev-nbd.c
@@ -37,6 +37,11 @@ void nbd_server_is_qemu_nbd(bool value)
     is_qemu_nbd = value;
 }
 
+bool nbd_server_is_running(void)
+{
+    return nbd_server || is_qemu_nbd;
+}
+
 static void nbd_blockdev_client_closed(NBDClient *client, bool ignored)
 {
     nbd_client_put(client);
@@ -173,41 +178,6 @@ void qmp_nbd_server_start(SocketAddressLegacy *addr,
     qapi_free_SocketAddress(addr_flat);
 }
 
-int nbd_export_create(BlockExport *exp, BlockExportOptions *exp_args,
-                      Error **errp)
-{
-    BlockExportOptionsNbd *arg = &exp_args->u.nbd;
-
-    assert(exp_args->type == BLOCK_EXPORT_TYPE_NBD);
-
-    if (!nbd_server && !is_qemu_nbd) {
-        error_setg(errp, "NBD server not running");
-        return -EINVAL;
-    }
-
-    if (!arg->has_name) {
-        arg->name = exp_args->node_name;
-    }
-
-    if (strlen(arg->name) > NBD_MAX_STRING_SIZE) {
-        error_setg(errp, "export name '%s' too long", arg->name);
-        return -EINVAL;
-    }
-
-    if (arg->description && strlen(arg->description) > NBD_MAX_STRING_SIZE) {
-        error_setg(errp, "description '%s' too long", arg->description);
-        return -EINVAL;
-    }
-
-    if (nbd_export_find(arg->name)) {
-        error_setg(errp, "NBD server already has export named '%s'", arg->name);
-        return -EEXIST;
-    }
-
-    return nbd_export_new(exp, arg->name, arg->description, arg->bitmap,
-                          !exp_args->writable, !exp_args->writable, errp);
-}
-
 void qmp_nbd_server_add(NbdServerAddOptions *arg, Error **errp)
 {
     BlockExport *export;
diff --git a/nbd/server.c b/nbd/server.c
index 465ec9e762..f74766add7 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -1507,17 +1507,44 @@ void nbd_export_set_on_eject_blk(BlockExport *exp, BlockBackend *blk)
     blk_add_remove_bs_notifier(blk, &nbd_exp->eject_notifier);
 }
 
-int nbd_export_new(BlockExport *blk_exp,
-                   const char *name, const char *desc,
-                   const char *bitmap, bool readonly, bool shared,
-                   Error **errp)
+static int nbd_export_create(BlockExport *blk_exp, BlockExportOptions *exp_args,
+                             Error **errp)
 {
     NBDExport *exp = container_of(blk_exp, NBDExport, common);
+    BlockExportOptionsNbd *arg = &exp_args->u.nbd;
     BlockBackend *blk = blk_exp->blk;
     int64_t size;
     uint64_t perm, shared_perm;
+    bool readonly = !exp_args->writable;
+    bool shared = !exp_args->writable;
     int ret;
 
+    assert(exp_args->type == BLOCK_EXPORT_TYPE_NBD);
+
+    if (!nbd_server_is_running()) {
+        error_setg(errp, "NBD server not running");
+        return -EINVAL;
+    }
+
+    if (!arg->has_name) {
+        arg->name = exp_args->node_name;
+    }
+
+    if (strlen(arg->name) > NBD_MAX_STRING_SIZE) {
+        error_setg(errp, "export name '%s' too long", arg->name);
+        return -EINVAL;
+    }
+
+    if (arg->description && strlen(arg->description) > NBD_MAX_STRING_SIZE) {
+        error_setg(errp, "description '%s' too long", arg->description);
+        return -EINVAL;
+    }
+
+    if (nbd_export_find(arg->name)) {
+        error_setg(errp, "NBD server already has export named '%s'", arg->name);
+        return -EEXIST;
+    }
+
     size = blk_getlength(blk);
     if (size < 0) {
         error_setg_errno(errp, -size,
@@ -1525,8 +1552,6 @@ int nbd_export_new(BlockExport *blk_exp,
         return size;
     }
 
-    assert(name && strlen(name) <= NBD_MAX_STRING_SIZE);
-
     /* Don't allow resize while the NBD server is running, otherwise we don't
      * care what happens with the node. */
     blk_get_perm(blk, &perm, &shared_perm);
@@ -1538,9 +1563,8 @@ int nbd_export_new(BlockExport *blk_exp,
     blk_set_allow_aio_context_change(blk, true);
 
     QTAILQ_INIT(&exp->clients);
-    exp->name = g_strdup(name);
-    assert(!desc || strlen(desc) <= NBD_MAX_STRING_SIZE);
-    exp->description = g_strdup(desc);
+    exp->name = g_strdup(arg->name);
+    exp->description = g_strdup(arg->description);
     exp->nbdflags = (NBD_FLAG_HAS_FLAGS | NBD_FLAG_SEND_FLUSH |
                      NBD_FLAG_SEND_FUA | NBD_FLAG_SEND_CACHE);
     if (readonly) {
@@ -1554,12 +1578,12 @@ int nbd_export_new(BlockExport *blk_exp,
     }
     exp->size = QEMU_ALIGN_DOWN(size, BDRV_SECTOR_SIZE);
 
-    if (bitmap) {
+    if (arg->bitmap) {
         BlockDriverState *bs = blk_bs(blk);
         BdrvDirtyBitmap *bm = NULL;
 
         while (bs) {
-            bm = bdrv_find_dirty_bitmap(bs, bitmap);
+            bm = bdrv_find_dirty_bitmap(bs, arg->bitmap);
             if (bm != NULL) {
                 break;
             }
@@ -1569,7 +1593,7 @@ int nbd_export_new(BlockExport *blk_exp,
 
         if (bm == NULL) {
             ret = -ENOENT;
-            error_setg(errp, "Bitmap '%s' is not found", bitmap);
+            error_setg(errp, "Bitmap '%s' is not found", arg->bitmap);
             goto fail;
         }
 
@@ -1583,15 +1607,15 @@ int nbd_export_new(BlockExport *blk_exp,
             ret = -EINVAL;
             error_setg(errp,
                        "Enabled bitmap '%s' incompatible with readonly export",
-                       bitmap);
+                       arg->bitmap);
             goto fail;
         }
 
         bdrv_dirty_bitmap_set_busy(bm, true);
         exp->export_bitmap = bm;
-        assert(strlen(bitmap) <= BDRV_BITMAP_MAX_NAME_SIZE);
+        assert(strlen(arg->bitmap) <= BDRV_BITMAP_MAX_NAME_SIZE);
         exp->export_bitmap_context = g_strdup_printf("qemu:dirty-bitmap:%s",
-                                                     bitmap);
+                                                     arg->bitmap);
         assert(strlen(exp->export_bitmap_context) < NBD_MAX_STRING_SIZE);
     }
 
-- 
2.25.4


