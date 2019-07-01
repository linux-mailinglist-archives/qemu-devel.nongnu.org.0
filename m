Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB8C23D30
	for <lists+qemu-devel@lfdr.de>; Mon, 20 May 2019 18:24:53 +0200 (CEST)
Received: from localhost ([127.0.0.1]:38132 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSl5o-0007C4-QL
	for lists+qemu-devel@lfdr.de; Mon, 20 May 2019 12:24:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38523)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hSkwt-0008IC-A6
	for qemu-devel@nongnu.org; Mon, 20 May 2019 12:15:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hSkws-0003ah-Aa
	for qemu-devel@nongnu.org; Mon, 20 May 2019 12:15:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50838)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1hSkwp-0003XQ-FB; Mon, 20 May 2019 12:15:35 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 762EB356F5;
	Mon, 20 May 2019 16:15:28 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-208.ams2.redhat.com
	[10.36.117.208])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8C06E78386;
	Mon, 20 May 2019 16:15:25 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Date: Mon, 20 May 2019 18:14:41 +0200
Message-Id: <20190520161453.30723-13-kwolf@redhat.com>
In-Reply-To: <20190520161453.30723-1-kwolf@redhat.com>
References: <20190520161453.30723-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 20 May 2019 16:15:29 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 12/24] block: Implement .(can_)set_aio_ctx for
 BlockBackend
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

bdrv_try_set_aio_context() currently fails if a BlockBackend is attached
to a node because it doesn't implement the BdrvChildRole callbacks for
AioContext management.

We can allow changing the AioContext of monitor-owned BlockBackends as
long as no device is attached to them.

When setting the AioContext of the root node of a BlockBackend, we now
need to pass blk->root as an ignored child because we don't want the
root node to recursively call back into BlockBackend and execute
blk_do_set_aio_context() a second time.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/block-backend.c | 45 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index f78e82a707..0e75fc8849 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -124,6 +124,11 @@ static void blk_root_drained_end(BdrvChild *child);
 static void blk_root_change_media(BdrvChild *child, bool load);
 static void blk_root_resize(BdrvChild *child);
=20
+static bool blk_root_can_set_aio_ctx(BdrvChild *child, AioContext *ctx,
+                                     GSList **ignore, Error **errp);
+static void blk_root_set_aio_ctx(BdrvChild *child, AioContext *ctx,
+                                 GSList **ignore);
+
 static char *blk_root_get_parent_desc(BdrvChild *child)
 {
     BlockBackend *blk =3D child->opaque;
@@ -300,6 +305,9 @@ static const BdrvChildRole child_root =3D {
=20
     .attach             =3D blk_root_attach,
     .detach             =3D blk_root_detach,
+
+    .can_set_aio_ctx    =3D blk_root_can_set_aio_ctx,
+    .set_aio_ctx        =3D blk_root_set_aio_ctx,
 };
=20
 /*
@@ -1852,7 +1860,8 @@ static AioContext *blk_aiocb_get_aio_context(BlockA=
IOCB *acb)
     return blk_get_aio_context(blk_acb->blk);
 }
=20
-void blk_set_aio_context(BlockBackend *blk, AioContext *new_context)
+static void blk_do_set_aio_context(BlockBackend *blk, AioContext *new_co=
ntext,
+                                   bool update_root_node)
 {
     BlockDriverState *bs =3D blk_bs(blk);
     ThrottleGroupMember *tgm =3D &blk->public.throttle_group_member;
@@ -1864,10 +1873,42 @@ void blk_set_aio_context(BlockBackend *blk, AioCo=
ntext *new_context)
             throttle_group_attach_aio_context(tgm, new_context);
             bdrv_drained_end(bs);
         }
-        bdrv_set_aio_context(bs, new_context);
+        if (update_root_node) {
+            GSList *ignore =3D g_slist_prepend(NULL, blk->root);
+            bdrv_set_aio_context_ignore(bs, new_context, &ignore);
+            g_slist_free(ignore);
+        }
     }
 }
=20
+void blk_set_aio_context(BlockBackend *blk, AioContext *new_context)
+{
+    blk_do_set_aio_context(blk, new_context, true);
+}
+
+static bool blk_root_can_set_aio_ctx(BdrvChild *child, AioContext *ctx,
+                                     GSList **ignore, Error **errp)
+{
+    BlockBackend *blk =3D child->opaque;
+
+    /* Only manually created BlockBackends that are not attached to anyt=
hing
+     * can change their AioContext without updating their user. */
+    if (!blk->name || blk->dev) {
+        /* TODO Add BB name/QOM path */
+        error_setg(errp, "Cannot change iothread of active block backend=
");
+        return false;
+    }
+
+    return true;
+}
+
+static void blk_root_set_aio_ctx(BdrvChild *child, AioContext *ctx,
+                                 GSList **ignore)
+{
+    BlockBackend *blk =3D child->opaque;
+    blk_do_set_aio_context(blk, ctx, false);
+}
+
 void blk_add_aio_context_notifier(BlockBackend *blk,
         void (*attached_aio_context)(AioContext *new_context, void *opaq=
ue),
         void (*detach_aio_context)(void *opaque), void *opaque)
--=20
2.20.1


