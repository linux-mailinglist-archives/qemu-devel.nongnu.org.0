Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E55D0B4C84
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Sep 2019 13:07:13 +0200 (CEST)
Received: from localhost ([::1]:44288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iABKC-0005io-MR
	for lists+qemu-devel@lfdr.de; Tue, 17 Sep 2019 07:07:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52424)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iABI6-0004Mk-P0
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 07:05:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iABI4-00078B-Vf
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 07:05:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56098)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1iABHx-00073l-5g; Tue, 17 Sep 2019 07:04:55 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6B0E0309175F;
 Tue, 17 Sep 2019 11:04:52 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-202.ams2.redhat.com
 [10.36.116.202])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 36E6860606;
 Tue, 17 Sep 2019 11:04:51 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Date: Tue, 17 Sep 2019 13:04:42 +0200
Message-Id: <20190917110443.2029-2-kwolf@redhat.com>
In-Reply-To: <20190917110443.2029-1-kwolf@redhat.com>
References: <20190917110443.2029-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Tue, 17 Sep 2019 11:04:52 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 1/2] block/snapshot: Restrict set of snapshot
 nodes
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Nodes involved in internal snapshots were those that were returned by
bdrv_next(), inserted and not read-only. bdrv_next() in turn returns all
nodes that are either the root node of a BlockBackend or monitor-owned
nodes.

With the typical -drive use, this worked well enough. However, in the
typical -blockdev case, the user defines one node per option, making all
nodes monitor-owned nodes. This includes protocol nodes etc. which often
are not snapshottable, so "savevm" only returns an error.

Change the conditions so that internal snapshot still include all nodes
that have a BlockBackend attached (we definitely want to snapshot
anything attached to a guest device and probably also the built-in NBD
server; snapshotting block job BlockBackends is more of an accident, but
a preexisting one), but other monitor-owned nodes are only included if
they have no parents.

This makes internal snapshots usable again with typical -blockdev
configurations.

Cc: qemu-stable@nongnu.org
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/snapshot.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/block/snapshot.c b/block/snapshot.c
index f2f48f926a..8081616ae9 100644
--- a/block/snapshot.c
+++ b/block/snapshot.c
@@ -31,6 +31,7 @@
 #include "qapi/qmp/qerror.h"
 #include "qapi/qmp/qstring.h"
 #include "qemu/option.h"
+#include "sysemu/block-backend.h"
=20
 QemuOptsList internal_snapshot_opts =3D {
     .name =3D "snapshot",
@@ -384,6 +385,16 @@ int bdrv_snapshot_load_tmp_by_id_or_name(BlockDriver=
State *bs,
     return ret;
 }
=20
+static bool bdrv_all_snapshots_includes_bs(BlockDriverState *bs)
+{
+    if (!bdrv_is_inserted(bs) || bdrv_is_read_only(bs)) {
+        return false;
+    }
+
+    /* Include all nodes that are either in use by a BlockBackend, or th=
at
+     * aren't attached to any node, but owned by the monitor. */
+    return bdrv_has_blk(bs) || QLIST_EMPTY(&bs->parents);
+}
=20
 /* Group operations. All block drivers are involved.
  * These functions will properly handle dataplane (take aio_context_acqu=
ire
@@ -399,7 +410,7 @@ bool bdrv_all_can_snapshot(BlockDriverState **first_b=
ad_bs)
         AioContext *ctx =3D bdrv_get_aio_context(bs);
=20
         aio_context_acquire(ctx);
-        if (bdrv_is_inserted(bs) && !bdrv_is_read_only(bs)) {
+        if (bdrv_all_snapshots_includes_bs(bs)) {
             ok =3D bdrv_can_snapshot(bs);
         }
         aio_context_release(ctx);
@@ -426,8 +437,9 @@ int bdrv_all_delete_snapshot(const char *name, BlockD=
riverState **first_bad_bs,
         AioContext *ctx =3D bdrv_get_aio_context(bs);
=20
         aio_context_acquire(ctx);
-        if (bdrv_can_snapshot(bs) &&
-                bdrv_snapshot_find(bs, snapshot, name) >=3D 0) {
+        if (bdrv_all_snapshots_includes_bs(bs) &&
+            bdrv_snapshot_find(bs, snapshot, name) >=3D 0)
+        {
             ret =3D bdrv_snapshot_delete(bs, snapshot->id_str,
                                        snapshot->name, err);
         }
@@ -455,7 +467,7 @@ int bdrv_all_goto_snapshot(const char *name, BlockDri=
verState **first_bad_bs,
         AioContext *ctx =3D bdrv_get_aio_context(bs);
=20
         aio_context_acquire(ctx);
-        if (bdrv_can_snapshot(bs)) {
+        if (bdrv_all_snapshots_includes_bs(bs)) {
             ret =3D bdrv_snapshot_goto(bs, name, errp);
         }
         aio_context_release(ctx);
@@ -481,7 +493,7 @@ int bdrv_all_find_snapshot(const char *name, BlockDri=
verState **first_bad_bs)
         AioContext *ctx =3D bdrv_get_aio_context(bs);
=20
         aio_context_acquire(ctx);
-        if (bdrv_can_snapshot(bs)) {
+        if (bdrv_all_snapshots_includes_bs(bs)) {
             err =3D bdrv_snapshot_find(bs, &sn, name);
         }
         aio_context_release(ctx);
@@ -512,7 +524,7 @@ int bdrv_all_create_snapshot(QEMUSnapshotInfo *sn,
         if (bs =3D=3D vm_state_bs) {
             sn->vm_state_size =3D vm_state_size;
             err =3D bdrv_snapshot_create(bs, sn);
-        } else if (bdrv_can_snapshot(bs)) {
+        } else if (bdrv_all_snapshots_includes_bs(bs)) {
             sn->vm_state_size =3D 0;
             err =3D bdrv_snapshot_create(bs, sn);
         }
@@ -538,7 +550,7 @@ BlockDriverState *bdrv_all_find_vmstate_bs(void)
         bool found;
=20
         aio_context_acquire(ctx);
-        found =3D bdrv_can_snapshot(bs);
+        found =3D bdrv_all_snapshots_includes_bs(bs) && bdrv_can_snapsho=
t(bs);
         aio_context_release(ctx);
=20
         if (found) {
--=20
2.20.1


