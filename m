Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D33F510A48
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 22:20:12 +0200 (CEST)
Received: from localhost ([::1]:54896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njRfP-0000lV-OP
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 16:20:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1njRao-0008Iq-N8
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 16:15:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1njRam-0007fo-Hd
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 16:15:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651004124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ft/ilnNdQwlPwRASOzEt0hCHaG2JB3V0JR230KBSmK4=;
 b=NAlvnqCPkSX7Fw8ol5hnVBI+fAdYOUIqxF5TSkkON4DMbANy8tjXxd1VL1E6KCqSXxj96D
 56cukI6zKVFKMuSSo5AKQvhB+y/u3o4fS5+8IiyrOOmUDeIxgNTfSUrUph8R7HCsyTRd+K
 ul3BOx2y/f553o1J3g5kdePG9Yh1Zn4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-377-cdlkkqjrPYKmtOBL3sEJTw-1; Tue, 26 Apr 2022 16:15:20 -0400
X-MC-Unique: cdlkkqjrPYKmtOBL3sEJTw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E702B811E81;
 Tue, 26 Apr 2022 20:15:19 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F871556214;
 Tue, 26 Apr 2022 20:15:19 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/13] qapi: nbd-export: allow select bitmaps by node/name pair
Date: Tue, 26 Apr 2022 15:15:03 -0500
Message-Id: <20220426201514.170410-3-eblake@redhat.com>
In-Reply-To: <20220426201514.170410-1-eblake@redhat.com>
References: <20220426201514.170410-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>

Hi all! Current logic of relying on search through backing chain is not
safe neither convenient.

Sometimes it leads to necessity of extra bitmap copying. Also, we are
going to add "snapshot-access" driver, to access some snapshot state
through NBD. And this driver is not formally a filter, and of course
it's not a COW format driver. So, searching through backing chain will
not work. Instead of widening the workaround of bitmap searching, let's
extend the interface so that user can select bitmap precisely.

Note, that checking for bitmap active status is not copied to the new
API, I don't see a reason for it, user should understand the risks. And
anyway, bitmap from other node is unrelated to this export being
read-only or read-write.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Message-Id: <20220314213226.362217-3-v.sementsov-og@mail.ru>
[eblake: Adjust S-o-b to Vladimir's new email, with permission]
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 qapi/block-export.json |  5 +++-
 blockdev-nbd.c         |  8 +++++-
 nbd/server.c           | 63 +++++++++++++++++++++++++++---------------
 qemu-nbd.c             | 11 ++++++--
 4 files changed, 61 insertions(+), 26 deletions(-)

diff --git a/qapi/block-export.json b/qapi/block-export.json
index 1e34927f85e2..1de16d25899b 100644
--- a/qapi/block-export.json
+++ b/qapi/block-export.json
@@ -6,6 +6,7 @@
 ##

 { 'include': 'sockets.json' }
+{ 'include': 'block-core.json' }

 ##
 # @NbdServerOptions:
@@ -89,6 +90,7 @@
 #           @device, so the NBD client can use NBD_OPT_SET_META_CONTEXT with
 #           the metadata context name "qemu:dirty-bitmap:BITMAP" to inspect
 #           each bitmap.
+#           Since 7.1 bitmap may be specified by node/name pair.
 #
 # @allocation-depth: Also export the allocation depth map for @device, so
 #                    the NBD client can use NBD_OPT_SET_META_CONTEXT with
@@ -99,7 +101,8 @@
 ##
 { 'struct': 'BlockExportOptionsNbd',
   'base': 'BlockExportOptionsNbdBase',
-  'data': { '*bitmaps': ['str'], '*allocation-depth': 'bool' } }
+  'data': { '*bitmaps': ['BlockDirtyBitmapOrStr'],
+            '*allocation-depth': 'bool' } }

 ##
 # @BlockExportOptionsVhostUserBlk:
diff --git a/blockdev-nbd.c b/blockdev-nbd.c
index 9840d25a8298..7f6531cba00e 100644
--- a/blockdev-nbd.c
+++ b/blockdev-nbd.c
@@ -211,8 +211,14 @@ void qmp_nbd_server_add(NbdServerAddOptions *arg, Error **errp)
     QAPI_CLONE_MEMBERS(BlockExportOptionsNbdBase, &export_opts->u.nbd,
                        qapi_NbdServerAddOptions_base(arg));
     if (arg->has_bitmap) {
+        BlockDirtyBitmapOrStr *el = g_new(BlockDirtyBitmapOrStr, 1);
+
+        *el = (BlockDirtyBitmapOrStr) {
+            .type = QTYPE_QSTRING,
+            .u.local = g_strdup(arg->bitmap),
+        };
         export_opts->u.nbd.has_bitmaps = true;
-        QAPI_LIST_PREPEND(export_opts->u.nbd.bitmaps, g_strdup(arg->bitmap));
+        QAPI_LIST_PREPEND(export_opts->u.nbd.bitmaps, el);
     }

     /*
diff --git a/nbd/server.c b/nbd/server.c
index c5644fd3f6ad..4cdbc062c1bf 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -1643,7 +1643,7 @@ static int nbd_export_create(BlockExport *blk_exp, BlockExportOptions *exp_args,
     uint64_t perm, shared_perm;
     bool readonly = !exp_args->writable;
     bool shared = !exp_args->writable;
-    strList *bitmaps;
+    BlockDirtyBitmapOrStrList *bitmaps;
     size_t i;
     int ret;

@@ -1709,40 +1709,59 @@ static int nbd_export_create(BlockExport *blk_exp, BlockExportOptions *exp_args,
     }
     exp->export_bitmaps = g_new0(BdrvDirtyBitmap *, exp->nr_export_bitmaps);
     for (i = 0, bitmaps = arg->bitmaps; bitmaps;
-         i++, bitmaps = bitmaps->next) {
-        const char *bitmap = bitmaps->value;
+         i++, bitmaps = bitmaps->next)
+    {
+        const char *bitmap;
         BlockDriverState *bs = blk_bs(blk);
         BdrvDirtyBitmap *bm = NULL;

-        while (bs) {
-            bm = bdrv_find_dirty_bitmap(bs, bitmap);
-            if (bm != NULL) {
-                break;
+        switch (bitmaps->value->type) {
+        case QTYPE_QSTRING:
+            bitmap = bitmaps->value->u.local;
+            while (bs) {
+                bm = bdrv_find_dirty_bitmap(bs, bitmap);
+                if (bm != NULL) {
+                    break;
+                }
+
+                bs = bdrv_filter_or_cow_bs(bs);
             }

-            bs = bdrv_filter_or_cow_bs(bs);
-        }
+            if (bm == NULL) {
+                ret = -ENOENT;
+                error_setg(errp, "Bitmap '%s' is not found",
+                           bitmaps->value->u.local);
+                goto fail;
+            }

-        if (bm == NULL) {
-            ret = -ENOENT;
-            error_setg(errp, "Bitmap '%s' is not found", bitmap);
-            goto fail;
+            if (readonly && bdrv_is_writable(bs) &&
+                bdrv_dirty_bitmap_enabled(bm)) {
+                ret = -EINVAL;
+                error_setg(errp, "Enabled bitmap '%s' incompatible with "
+                           "readonly export", bitmap);
+                goto fail;
+            }
+            break;
+        case QTYPE_QDICT:
+            bitmap = bitmaps->value->u.external.name;
+            bm = block_dirty_bitmap_lookup(bitmaps->value->u.external.node,
+                                           bitmap, NULL, errp);
+            if (!bm) {
+                ret = -ENOENT;
+                goto fail;
+            }
+            break;
+        default:
+            abort();
         }

+        assert(bm);
+
         if (bdrv_dirty_bitmap_check(bm, BDRV_BITMAP_ALLOW_RO, errp)) {
             ret = -EINVAL;
             goto fail;
         }

-        if (readonly && bdrv_is_writable(bs) &&
-            bdrv_dirty_bitmap_enabled(bm)) {
-            ret = -EINVAL;
-            error_setg(errp,
-                       "Enabled bitmap '%s' incompatible with readonly export",
-                       bitmap);
-            goto fail;
-        }
-
         exp->export_bitmaps[i] = bm;
         assert(strlen(bitmap) <= BDRV_BITMAP_MAX_NAME_SIZE);
     }
diff --git a/qemu-nbd.c b/qemu-nbd.c
index 397ffa64d768..db63980df1e4 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -567,7 +567,7 @@ int main(int argc, char **argv)
     QDict *options = NULL;
     const char *export_name = NULL; /* defaults to "" later for server mode */
     const char *export_description = NULL;
-    strList *bitmaps = NULL;
+    BlockDirtyBitmapOrStrList *bitmaps = NULL;
     bool alloc_depth = false;
     const char *tlscredsid = NULL;
     const char *tlshostname = NULL;
@@ -687,7 +687,14 @@ int main(int argc, char **argv)
             alloc_depth = true;
             break;
         case 'B':
-            QAPI_LIST_PREPEND(bitmaps, g_strdup(optarg));
+            {
+                BlockDirtyBitmapOrStr *el = g_new(BlockDirtyBitmapOrStr, 1);
+                *el = (BlockDirtyBitmapOrStr) {
+                    .type = QTYPE_QSTRING,
+                    .u.local = g_strdup(optarg),
+                };
+                QAPI_LIST_PREPEND(bitmaps, el);
+            }
             break;
         case 'k':
             sockpath = optarg;
-- 
2.35.1


