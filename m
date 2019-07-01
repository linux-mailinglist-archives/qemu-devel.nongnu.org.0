Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3681323D20
	for <lists+qemu-devel@lfdr.de>; Mon, 20 May 2019 18:21:58 +0200 (CEST)
Received: from localhost ([127.0.0.1]:38094 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSl2z-0004bl-Aa
	for lists+qemu-devel@lfdr.de; Mon, 20 May 2019 12:21:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38492)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hSkws-0008GU-6S
	for qemu-devel@nongnu.org; Mon, 20 May 2019 12:15:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hSkwq-0003ZR-SH
	for qemu-devel@nongnu.org; Mon, 20 May 2019 12:15:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45824)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1hSkwm-0003SB-JW; Mon, 20 May 2019 12:15:32 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0A39981DF1;
	Mon, 20 May 2019 16:15:23 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-208.ams2.redhat.com
	[10.36.117.208])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 23940704DB;
	Mon, 20 May 2019 16:15:19 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Date: Mon, 20 May 2019 18:14:39 +0200
Message-Id: <20190520161453.30723-11-kwolf@redhat.com>
In-Reply-To: <20190520161453.30723-1-kwolf@redhat.com>
References: <20190520161453.30723-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 20 May 2019 16:15:28 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 10/24] block: Propagate AioContext change to
 parents
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All block nodes and users in any connected component of the block graph
must be in the same AioContext, so changing the AioContext of one node
must not only change all of its children, but all of its parents (and
in turn their children etc.) as well.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block.h     |  2 ++
 include/block/block_int.h |  1 +
 block.c                   | 48 ++++++++++++++++++++++++++++++++++-----
 3 files changed, 45 insertions(+), 6 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index fc0239a887..9b083e2bca 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -586,6 +586,8 @@ void bdrv_coroutine_enter(BlockDriverState *bs, Corou=
tine *co);
  * This function must be called with iothread lock held.
  */
 void bdrv_set_aio_context(BlockDriverState *bs, AioContext *new_context)=
;
+void bdrv_set_aio_context_ignore(BlockDriverState *bs,
+                                 AioContext *new_context, GSList **ignor=
e);
 int bdrv_try_set_aio_context(BlockDriverState *bs, AioContext *ctx,
                              Error **errp);
 int bdrv_child_try_set_aio_context(BlockDriverState *bs, AioContext *ctx=
,
diff --git a/include/block/block_int.h b/include/block/block_int.h
index aa2c638b02..1eebc7c8f3 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -694,6 +694,7 @@ struct BdrvChildRole {
=20
     bool (*can_set_aio_ctx)(BdrvChild *child, AioContext *ctx,
                             GSList **ignore, Error **errp);
+    void (*set_aio_ctx)(BdrvChild *child, AioContext *ctx, GSList **igno=
re);
 };
=20
 extern const BdrvChildRole child_file;
diff --git a/block.c b/block.c
index 0ace673925..1e5230f98e 100644
--- a/block.c
+++ b/block.c
@@ -943,6 +943,13 @@ static bool bdrv_child_cb_can_set_aio_ctx(BdrvChild =
*child, AioContext *ctx,
     return bdrv_can_set_aio_context(bs, ctx, ignore, errp);
 }
=20
+static void bdrv_child_cb_set_aio_ctx(BdrvChild *child, AioContext *ctx,
+                                      GSList **ignore)
+{
+    BlockDriverState *bs =3D child->opaque;
+    return bdrv_set_aio_context_ignore(bs, ctx, ignore);
+}
+
 /*
  * Returns the options and flags that a temporary snapshot should get, b=
ased on
  * the originally requested flags (the originally requested image will h=
ave
@@ -1011,6 +1018,7 @@ const BdrvChildRole child_file =3D {
     .detach          =3D bdrv_child_cb_detach,
     .inactivate      =3D bdrv_child_cb_inactivate,
     .can_set_aio_ctx =3D bdrv_child_cb_can_set_aio_ctx,
+    .set_aio_ctx     =3D bdrv_child_cb_set_aio_ctx,
 };
=20
 /*
@@ -1038,6 +1046,7 @@ const BdrvChildRole child_format =3D {
     .detach          =3D bdrv_child_cb_detach,
     .inactivate      =3D bdrv_child_cb_inactivate,
     .can_set_aio_ctx =3D bdrv_child_cb_can_set_aio_ctx,
+    .set_aio_ctx     =3D bdrv_child_cb_set_aio_ctx,
 };
=20
 static void bdrv_backing_attach(BdrvChild *c)
@@ -1162,6 +1171,7 @@ const BdrvChildRole child_backing =3D {
     .inactivate      =3D bdrv_child_cb_inactivate,
     .update_filename =3D bdrv_backing_update_filename,
     .can_set_aio_ctx =3D bdrv_child_cb_can_set_aio_ctx,
+    .set_aio_ctx     =3D bdrv_child_cb_set_aio_ctx,
 };
=20
 static int bdrv_open_flags(BlockDriverState *bs, int flags)
@@ -5731,10 +5741,10 @@ static void bdrv_attach_aio_context(BlockDriverSt=
ate *bs,
     bs->walking_aio_notifiers =3D false;
 }
=20
-/* The caller must own the AioContext lock for the old AioContext of bs,=
 but it
- * must not own the AioContext lock for new_context (unless new_context =
is
- * the same as the current context of bs). */
-void bdrv_set_aio_context(BlockDriverState *bs, AioContext *new_context)
+/* @ignore will accumulate all visited BdrvChild object. The caller is
+ * responsible for freeing the list afterwards. */
+void bdrv_set_aio_context_ignore(BlockDriverState *bs,
+                                 AioContext *new_context, GSList **ignor=
e)
 {
     BdrvChild *child;
=20
@@ -5745,7 +5755,20 @@ void bdrv_set_aio_context(BlockDriverState *bs, Ai=
oContext *new_context)
     bdrv_drained_begin(bs);
=20
     QLIST_FOREACH(child, &bs->children, next) {
-        bdrv_set_aio_context(child->bs, new_context);
+        if (g_slist_find(*ignore, child)) {
+            continue;
+        }
+        *ignore =3D g_slist_prepend(*ignore, child);
+        bdrv_set_aio_context_ignore(child->bs, new_context, ignore);
+    }
+    QLIST_FOREACH(child, &bs->parents, next_parent) {
+        if (g_slist_find(*ignore, child)) {
+            continue;
+        }
+        if (child->role->set_aio_ctx) {
+            *ignore =3D g_slist_prepend(*ignore, child);
+            child->role->set_aio_ctx(child, new_context, ignore);
+        }
     }
=20
     bdrv_detach_aio_context(bs);
@@ -5759,6 +5782,16 @@ void bdrv_set_aio_context(BlockDriverState *bs, Ai=
oContext *new_context)
     aio_context_release(new_context);
 }
=20
+/* The caller must own the AioContext lock for the old AioContext of bs,=
 but it
+ * must not own the AioContext lock for new_context (unless new_context =
is
+ * the same as the current context of bs). */
+void bdrv_set_aio_context(BlockDriverState *bs, AioContext *new_context)
+{
+    GSList *ignore_list =3D NULL;
+    bdrv_set_aio_context_ignore(bs, new_context, &ignore_list);
+    g_slist_free(ignore_list);
+}
+
 static bool bdrv_parent_can_set_aio_context(BdrvChild *c, AioContext *ct=
x,
                                             GSList **ignore, Error **err=
p)
 {
@@ -5831,7 +5864,10 @@ int bdrv_child_try_set_aio_context(BlockDriverStat=
e *bs, AioContext *ctx,
         return -EPERM;
     }
=20
-    bdrv_set_aio_context(bs, ctx);
+    ignore =3D ignore_child ? g_slist_prepend(NULL, ignore_child) : NULL=
;
+    bdrv_set_aio_context_ignore(bs, ctx, &ignore);
+    g_slist_free(ignore);
+
     return 0;
 }
=20
--=20
2.20.1


