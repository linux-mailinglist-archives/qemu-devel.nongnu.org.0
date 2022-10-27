Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F55610050
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 20:35:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7hY-00042e-TM; Thu, 27 Oct 2022 14:34:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7gS-0001sS-L1
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:32:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7gB-0002Sp-NL
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:32:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666895555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F4k2946KOJ5ESPuTKYPhKBbiqcawoYlngtEc6I8hSJs=;
 b=NLrM/aFWGLzEvMqtKciMVcCRWYjNpMo5r7GqE2cevfsGXHLVrcAkT/lRPruBEZ3Racgev/
 6enyZ1vlRWD4QBz7LTrEG0tbURy52pHQe5DMmjXars0Y++ELYOw0CR1KOEy73Dbtkx2NIK
 5KCuzMnjsQyY5DrYW4j4NSaGcmRBoxg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-qgoMI4I0NOirA_iLDizFuQ-1; Thu, 27 Oct 2022 14:32:32 -0400
X-MC-Unique: qgoMI4I0NOirA_iLDizFuQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E00813C0F677;
 Thu, 27 Oct 2022 18:32:31 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 284031121320;
 Thu, 27 Oct 2022 18:32:31 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 21/58] block/snapshot: drop indirection around
 bdrv_snapshot_fallback_ptr
Date: Thu, 27 Oct 2022 20:31:09 +0200
Message-Id: <20221027183146.463129-22-kwolf@redhat.com>
In-Reply-To: <20221027183146.463129-1-kwolf@redhat.com>
References: <20221027183146.463129-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Now the indirection is not actually used, we can safely reduce it to
simple pointer. For consistency do a bit of refactoring to get rid of
_ptr suffixes that become meaningless.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220726201134.924743-15-vsementsov@yandex-team.ru>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/snapshot.c | 38 ++++++++++++++++----------------------
 1 file changed, 16 insertions(+), 22 deletions(-)

diff --git a/block/snapshot.c b/block/snapshot.c
index f3971ac2bd..e22ac3eac6 100644
--- a/block/snapshot.c
+++ b/block/snapshot.c
@@ -151,34 +151,29 @@ bool bdrv_snapshot_find_by_id_and_name(BlockDriverState *bs,
 }
 
 /**
- * Return a pointer to the child BDS pointer to which we can fall
+ * Return a pointer to child of given BDS to which we can fall
  * back if the given BDS does not support snapshots.
  * Return NULL if there is no BDS to (safely) fall back to.
- *
- * We need to return an indirect pointer because bdrv_snapshot_goto()
- * has to modify the BdrvChild pointer.
  */
-static BdrvChild **bdrv_snapshot_fallback_ptr(BlockDriverState *bs)
+static BdrvChild *bdrv_snapshot_fallback_child(BlockDriverState *bs)
 {
-    BdrvChild **fallback;
-    BdrvChild *child = bdrv_primary_child(bs);
+    BdrvChild *fallback = bdrv_primary_child(bs);
+    BdrvChild *child;
 
     /* We allow fallback only to primary child */
-    if (!child) {
+    if (!fallback) {
         return NULL;
     }
-    fallback = (child == bs->file ? &bs->file : &bs->backing);
-    assert(*fallback == child);
 
     /*
      * Check that there are no other children that would need to be
      * snapshotted.  If there are, it is not safe to fall back to
-     * *fallback.
+     * fallback.
      */
     QLIST_FOREACH(child, &bs->children, next) {
         if (child->role & (BDRV_CHILD_DATA | BDRV_CHILD_METADATA |
                            BDRV_CHILD_FILTERED) &&
-            child != *fallback)
+            child != fallback)
         {
             return NULL;
         }
@@ -189,8 +184,7 @@ static BdrvChild **bdrv_snapshot_fallback_ptr(BlockDriverState *bs)
 
 static BlockDriverState *bdrv_snapshot_fallback(BlockDriverState *bs)
 {
-    BdrvChild **child_ptr = bdrv_snapshot_fallback_ptr(bs);
-    return child_ptr ? (*child_ptr)->bs : NULL;
+    return child_bs(bdrv_snapshot_fallback_child(bs));
 }
 
 int bdrv_can_snapshot(BlockDriverState *bs)
@@ -237,7 +231,7 @@ int bdrv_snapshot_goto(BlockDriverState *bs,
                        Error **errp)
 {
     BlockDriver *drv = bs->drv;
-    BdrvChild **fallback_ptr;
+    BdrvChild *fallback;
     int ret, open_ret;
 
     GLOBAL_STATE_CODE();
@@ -260,13 +254,13 @@ int bdrv_snapshot_goto(BlockDriverState *bs,
         return ret;
     }
 
-    fallback_ptr = bdrv_snapshot_fallback_ptr(bs);
-    if (fallback_ptr) {
+    fallback = bdrv_snapshot_fallback_child(bs);
+    if (fallback) {
         QDict *options;
         QDict *file_options;
         Error *local_err = NULL;
-        BlockDriverState *fallback_bs = (*fallback_ptr)->bs;
-        char *subqdict_prefix = g_strdup_printf("%s.", (*fallback_ptr)->name);
+        BlockDriverState *fallback_bs = fallback->bs;
+        char *subqdict_prefix = g_strdup_printf("%s.", fallback->name);
 
         options = qdict_clone_shallow(bs->options);
 
@@ -277,8 +271,8 @@ int bdrv_snapshot_goto(BlockDriverState *bs,
         qobject_unref(file_options);
         g_free(subqdict_prefix);
 
-        /* Force .bdrv_open() below to re-attach fallback_bs on *fallback_ptr */
-        qdict_put_str(options, (*fallback_ptr)->name,
+        /* Force .bdrv_open() below to re-attach fallback_bs on fallback */
+        qdict_put_str(options, fallback->name,
                       bdrv_get_node_name(fallback_bs));
 
         /* Now close bs, apply the snapshot on fallback_bs, and re-open bs */
@@ -287,7 +281,7 @@ int bdrv_snapshot_goto(BlockDriverState *bs,
         }
 
         /* .bdrv_open() will re-attach it */
-        bdrv_unref_child(bs, *fallback_ptr);
+        bdrv_unref_child(bs, fallback);
 
         ret = bdrv_snapshot_goto(fallback_bs, snapshot_id, errp);
         open_ret = drv->bdrv_open(bs, options, bs->open_flags, &local_err);
-- 
2.37.3


