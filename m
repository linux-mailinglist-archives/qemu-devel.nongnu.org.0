Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B75BD4A06
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 23:43:56 +0200 (CEST)
Received: from localhost ([::1]:57294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iJ2hW-0001gz-Td
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 17:43:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55453)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1iJ2Rn-0003lT-8v
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 17:27:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1iJ2Rm-0001Sd-11
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 17:27:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44122)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>)
 id 1iJ2Ri-0001Ps-KY; Fri, 11 Oct 2019 17:27:34 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C54CACCFE6;
 Fri, 11 Oct 2019 21:27:33 +0000 (UTC)
Received: from probe.bos.redhat.com (dhcp-17-173.bos.redhat.com [10.18.17.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A1331EC;
 Fri, 11 Oct 2019 21:27:30 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 17/19] qcow2-bitmap: move bitmap reopen-rw code to
 qcow2_reopen_commit
Date: Fri, 11 Oct 2019 17:25:48 -0400
Message-Id: <20191011212550.27269-18-jsnow@redhat.com>
In-Reply-To: <20191011212550.27269-1-jsnow@redhat.com>
References: <20191011212550.27269-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Fri, 11 Oct 2019 21:27:33 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, libvir-list@redhat.com,
 John Snow <jsnow@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

The only reason I can imagine for this strange code at the very-end of
bdrv_reopen_commit is the fact that bs->read_only updated after
calling drv->bdrv_reopen_commit in bdrv_reopen_commit. And in the same
time, prior to previous commit, qcow2_reopen_bitmaps_rw did a wrong
check for being writable, when actually it only need writable file
child not self.

So, as it's fixed, let's move things to correct place.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Acked-by: Max Reitz <mreitz@redhat.com>
Message-id: 20190927122355.7344-10-vsementsov@virtuozzo.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 include/block/block_int.h |  6 ------
 block.c                   | 19 -------------------
 block/qcow2.c             | 15 ++++++++++++++-
 3 files changed, 14 insertions(+), 26 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 1e54486ad14..9ceca23ef75 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -546,12 +546,6 @@ struct BlockDriver {
                              uint64_t parent_perm, uint64_t parent_share=
d,
                              uint64_t *nperm, uint64_t *nshared);
=20
-    /**
-     * Bitmaps should be marked as 'IN_USE' in the image on reopening im=
age
-     * as rw. This handler should realize it. It also should unset reado=
nly
-     * field of BlockDirtyBitmap's in case of success.
-     */
-    int (*bdrv_reopen_bitmaps_rw)(BlockDriverState *bs, Error **errp);
     bool (*bdrv_co_can_store_new_dirty_bitmap)(BlockDriverState *bs,
                                                const char *name,
                                                uint32_t granularity,
diff --git a/block.c b/block.c
index c548885608d..ba09d97e0a2 100644
--- a/block.c
+++ b/block.c
@@ -3935,16 +3935,12 @@ void bdrv_reopen_commit(BDRVReopenState *reopen_s=
tate)
     BlockDriver *drv;
     BlockDriverState *bs;
     BdrvChild *child;
-    bool old_can_write, new_can_write;
=20
     assert(reopen_state !=3D NULL);
     bs =3D reopen_state->bs;
     drv =3D bs->drv;
     assert(drv !=3D NULL);
=20
-    old_can_write =3D
-        !bdrv_is_read_only(bs) && !(bdrv_get_flags(bs) & BDRV_O_INACTIVE=
);
-
     /* If there are any driver level actions to take */
     if (drv->bdrv_reopen_commit) {
         drv->bdrv_reopen_commit(reopen_state);
@@ -3988,21 +3984,6 @@ void bdrv_reopen_commit(BDRVReopenState *reopen_st=
ate)
     }
=20
     bdrv_refresh_limits(bs, NULL);
-
-    new_can_write =3D
-        !bdrv_is_read_only(bs) && !(bdrv_get_flags(bs) & BDRV_O_INACTIVE=
);
-    if (!old_can_write && new_can_write && drv->bdrv_reopen_bitmaps_rw) =
{
-        Error *local_err =3D NULL;
-        if (drv->bdrv_reopen_bitmaps_rw(bs, &local_err) < 0) {
-            /* This is not fatal, bitmaps just left read-only, so all fo=
llowing
-             * writes will fail. User can remove read-only bitmaps to un=
block
-             * writes.
-             */
-            error_reportf_err(local_err,
-                              "%s: Failed to make dirty bitmaps writable=
: ",
-                              bdrv_get_node_name(bs));
-        }
-    }
 }
=20
 /*
diff --git a/block/qcow2.c b/block/qcow2.c
index 7ab1aad9779..b652bf884e5 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -1834,6 +1834,20 @@ fail:
 static void qcow2_reopen_commit(BDRVReopenState *state)
 {
     qcow2_update_options_commit(state->bs, state->opaque);
+    if (state->flags & BDRV_O_RDWR) {
+        Error *local_err =3D NULL;
+
+        if (qcow2_reopen_bitmaps_rw(state->bs, &local_err) < 0) {
+            /*
+             * This is not fatal, bitmaps just left read-only, so all fo=
llowing
+             * writes will fail. User can remove read-only bitmaps to un=
block
+             * writes or retry reopen.
+             */
+            error_reportf_err(local_err,
+                              "%s: Failed to make dirty bitmaps writable=
: ",
+                              bdrv_get_node_name(state->bs));
+        }
+    }
     g_free(state->opaque);
 }
=20
@@ -5262,7 +5276,6 @@ BlockDriver bdrv_qcow2 =3D {
     .bdrv_detach_aio_context  =3D qcow2_detach_aio_context,
     .bdrv_attach_aio_context  =3D qcow2_attach_aio_context,
=20
-    .bdrv_reopen_bitmaps_rw =3D qcow2_reopen_bitmaps_rw,
     .bdrv_co_can_store_new_dirty_bitmap =3D qcow2_co_can_store_new_dirty=
_bitmap,
     .bdrv_co_remove_persistent_dirty_bitmap =3D
             qcow2_co_remove_persistent_dirty_bitmap,
--=20
2.21.0


