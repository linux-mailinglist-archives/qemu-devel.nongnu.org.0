Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C44F55A3C0
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 23:40:04 +0200 (CEST)
Received: from localhost ([::1]:41290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4r23-00007i-5i
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 17:40:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o4qs6-0000aL-UL; Fri, 24 Jun 2022 17:29:48 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:44584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o4qs4-0004Tt-1j; Fri, 24 Jun 2022 17:29:46 -0400
Received: from myt5-4c5921969858.qloud-c.yandex.net
 (myt5-4c5921969858.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3b1a:0:640:4c59:2196])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 280752E1FC4;
 Sat, 25 Jun 2022 00:29:36 +0300 (MSK)
Received: from myt6-81d8ab6a9f9d.qloud-c.yandex.net
 (myt6-81d8ab6a9f9d.qloud-c.yandex.net [2a02:6b8:c12:520a:0:640:81d8:ab6a])
 by myt5-4c5921969858.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 6w2GFjeD5i-TZJmX0cr; Sat, 25 Jun 2022 00:29:36 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1656106176; bh=lijSqg5LJ1JaaZOfw6oh33ulutbTnqnyAmKUJfyqDPA=;
 h=Message-Id:References:Date:Subject:In-Reply-To:Cc:To:From;
 b=R4q2Ko/Uuf6iC0SjQuh0IGrnYsKZBvqscHVRpuybV+Eg6PA+3GxoFkKxligPxJePh
 yFmQ7x1CtRkSkjtKBn9LON4Jho0twS2nAkvvqphk4lnReZb3CuCCiSYeBr7LRrMMdU
 Uvi7vd7vOi+6GvkZaqmeCawnOyhCfj7C1mTEYI6Y=
Authentication-Results: myt5-4c5921969858.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:b64c::1:2c])
 by myt6-81d8ab6a9f9d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 KXs24KJ458-TZMSrw3v; Sat, 25 Jun 2022 00:29:35 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@yandex-team.ru
Subject: [PATCH v6 14/15] block/snapshot: drop indirection around
 bdrv_snapshot_fallback_ptr
Date: Sat, 25 Jun 2022 00:28:29 +0300
Message-Id: <20220624212830.316919-15-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220624212830.316919-1-vsementsov@yandex-team.ru>
References: <20220624212830.316919-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Now the indirection is not actually used, we can safely reduce it to
simple pointer. For consistency do a bit of refactoring to get rid of
_ptr suffixes that become meaningless.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
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
2.25.1


