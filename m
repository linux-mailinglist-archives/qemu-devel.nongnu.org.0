Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69362559D83
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 17:43:25 +0200 (CEST)
Received: from localhost ([::1]:41096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4lSu-0001Cj-6B
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 11:43:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1o4lR0-000617-Dw
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:41:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1o4lQv-0000oJ-1G
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:41:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656085279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qKURiMB5mXsc/snLL+3hfk33KA6vKCmW/7tv4A9nLyQ=;
 b=bBdry9GwgF+1ms50FXIo4jrEsjh4JC6xYzklb5p6EcxIXhU55JMc/ubmXlWDaGKsUQzVuo
 2vdRKIBIcPkL7Cq9c8Ul/DuKw6FWX5cJgb6fLu6VNsV/EFOnBbBE1BJOlc0zL8j4gEZAcQ
 pfeyUccj3xWVn2J+1SY9Mt0PXLXLHnw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-416-DD1VcZEcOUCjAOZ1haIMIA-1; Fri, 24 Jun 2022 11:41:18 -0400
X-MC-Unique: DD1VcZEcOUCjAOZ1haIMIA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC63D1C05143;
 Fri, 24 Jun 2022 15:41:17 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57D2D492C3B;
 Fri, 24 Jun 2022 15:41:17 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL v2 04/20] block: improve block_dirty_bitmap_merge(): don't
 allocate extra bitmap
Date: Fri, 24 Jun 2022 17:40:47 +0200
Message-Id: <20220624154103.185902-5-kwolf@redhat.com>
In-Reply-To: <20220624154103.185902-1-kwolf@redhat.com>
References: <20220624154103.185902-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>

We don't need extra bitmap. All we need is to backup the original
bitmap when we do first merge. So, drop extra temporary bitmap and work
directly with target and backup.

Still to keep old semantics, that on failure target is unchanged and
user don't need to restore, we need a local_backup variable and do
restore ourselves on failure path.

Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
Message-Id: <20220517111206.23585-3-v.sementsov-og@mail.ru>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/monitor/bitmap-qmp-cmds.c | 41 +++++++++++++++++----------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/block/monitor/bitmap-qmp-cmds.c b/block/monitor/bitmap-qmp-cmds.c
index bd10468596..282363606f 100644
--- a/block/monitor/bitmap-qmp-cmds.c
+++ b/block/monitor/bitmap-qmp-cmds.c
@@ -261,8 +261,9 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
                                           HBitmap **backup, Error **errp)
 {
     BlockDriverState *bs;
-    BdrvDirtyBitmap *dst, *src, *anon;
+    BdrvDirtyBitmap *dst, *src;
     BlockDirtyBitmapOrStrList *lst;
+    HBitmap *local_backup = NULL;
 
     GLOBAL_STATE_CODE();
 
@@ -271,12 +272,6 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
         return NULL;
     }
 
-    anon = bdrv_create_dirty_bitmap(bs, bdrv_dirty_bitmap_granularity(dst),
-                                    NULL, errp);
-    if (!anon) {
-        return NULL;
-    }
-
     for (lst = bms; lst; lst = lst->next) {
         switch (lst->value->type) {
             const char *name, *node;
@@ -285,8 +280,7 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
             src = bdrv_find_dirty_bitmap(bs, name);
             if (!src) {
                 error_setg(errp, "Dirty bitmap '%s' not found", name);
-                dst = NULL;
-                goto out;
+                goto fail;
             }
             break;
         case QTYPE_QDICT:
@@ -294,29 +288,36 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
             name = lst->value->u.external.name;
             src = block_dirty_bitmap_lookup(node, name, NULL, errp);
             if (!src) {
-                dst = NULL;
-                goto out;
+                goto fail;
             }
             break;
         default:
             abort();
         }
 
-        if (!bdrv_merge_dirty_bitmap(anon, src, NULL, errp)) {
-            dst = NULL;
-            goto out;
+        /* We do backup only for first merge operation */
+        if (!bdrv_merge_dirty_bitmap(dst, src,
+                                     local_backup ? NULL : &local_backup,
+                                     errp))
+        {
+            goto fail;
         }
     }
 
-    /* Merge into dst; dst is unchanged on failure. */
-    if (!bdrv_merge_dirty_bitmap(dst, anon, backup, errp)) {
-        dst = NULL;
-        goto out;
+    if (backup) {
+        *backup = local_backup;
+    } else {
+        hbitmap_free(local_backup);
     }
 
- out:
-    bdrv_release_dirty_bitmap(anon);
     return dst;
+
+fail:
+    if (local_backup) {
+        bdrv_restore_dirty_bitmap(dst, local_backup);
+    }
+
+    return NULL;
 }
 
 void qmp_block_dirty_bitmap_merge(const char *node, const char *target,
-- 
2.35.3


