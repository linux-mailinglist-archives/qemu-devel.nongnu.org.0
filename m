Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 680F516267F
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Feb 2020 13:54:39 +0100 (CET)
Received: from localhost ([::1]:34078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j42Oa-0006Tu-UR
	for lists+qemu-devel@lfdr.de; Tue, 18 Feb 2020 07:54:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39424)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1j42EQ-0006Jr-Ds
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 07:44:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1j42EM-0001gR-02
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 07:44:06 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:30059
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1j42EL-0001gF-SW
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 07:44:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582029841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WfcYn3NPJfCa89MEqWlhaSxaTCgY1X4skqTlo4SozOU=;
 b=QXXW5ssvXu92AXG46Z4bc+Zr6wBEfkNMxqxGMM40VeS9SiQ6JnJloiAytqF/ITyIF4B0f4
 i6eXP6x2n0o/sz0y/Au2b4IF5mZrc5DmY3BEYv5ZRrTt+yij15w6at2n68R7ds66XKoT9b
 sIIsbf/CIAR5x62kRcKtgcaTVrkQWvw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-pQ4GCu0qOPCvMrJp1D_nVg-1; Tue, 18 Feb 2020 07:43:57 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E0C418A5508;
 Tue, 18 Feb 2020 12:43:56 +0000 (UTC)
Received: from localhost (unknown [10.36.118.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D15F8B565;
 Tue, 18 Feb 2020 12:43:55 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 22/33] block: Make backing files child_of_bds children
Date: Tue, 18 Feb 2020 13:42:31 +0100
Message-Id: <20200218124242.584644-23-mreitz@redhat.com>
In-Reply-To: <20200218124242.584644-1-mreitz@redhat.com>
References: <20200218124242.584644-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: pQ4GCu0qOPCvMrJp1D_nVg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make all parents of backing files pass the appropriate BdrvChildRole.
By doing so, we can switch their BdrvChildClass over to the generic
child_of_bds, which will do the right thing when given a correct
BdrvChildRole.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block.c                 | 26 ++++++++++++++++++++------
 block/backup-top.c      |  2 +-
 block/vvfat.c           |  3 ++-
 tests/test-bdrv-drain.c | 13 +++++++------
 4 files changed, 30 insertions(+), 14 deletions(-)

diff --git a/block.c b/block.c
index 43df38ca30..31affcb4ee 100644
--- a/block.c
+++ b/block.c
@@ -2770,6 +2770,20 @@ static bool bdrv_inherits_from_recursive(BlockDriver=
State *child,
     return child !=3D NULL;
 }
=20
+/*
+ * Return the BdrvChildRole for @bs's backing child.  bs->backing is
+ * mostly used for COW backing children (role =3D COW), but also for
+ * filtered children (role =3D FILTERED | PRIMARY).
+ */
+static BdrvChildRole bdrv_backing_role(BlockDriverState *bs)
+{
+    if (bs->drv && bs->drv->is_filter) {
+        return BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY;
+    } else {
+        return BDRV_CHILD_COW;
+    }
+}
+
 /*
  * Sets the backing file link of a BDS. A new reference is created; caller=
s
  * which don't need their own reference any more must call bdrv_unref().
@@ -2797,8 +2811,8 @@ void bdrv_set_backing_hd(BlockDriverState *bs, BlockD=
riverState *backing_hd,
         goto out;
     }
=20
-    bs->backing =3D bdrv_attach_child(bs, backing_hd, "backing", &child_ba=
cking,
-                                    0, errp);
+    bs->backing =3D bdrv_attach_child(bs, backing_hd, "backing", &child_of=
_bds,
+                                    bdrv_backing_role(bs), errp);
     /* If backing_hd was already part of bs's backing chain, and
      * inherits_from pointed recursively to bs then let's update it to
      * point directly to bs (else it will become NULL). */
@@ -2895,7 +2909,7 @@ int bdrv_open_backing_file(BlockDriverState *bs, QDic=
t *parent_options,
     }
=20
     backing_hd =3D bdrv_open_inherit(backing_filename, reference, options,=
 0, bs,
-                                   &child_backing, 0, errp);
+                                   &child_of_bds, BDRV_CHILD_COW, errp);
     if (!backing_hd) {
         bs->open_flags |=3D BDRV_O_NO_BACKING;
         error_prepend(errp, "Could not open backing file: ");
@@ -3731,8 +3745,8 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, =
Error **errp)
         if (state->replace_backing_bs && state->new_backing_bs) {
             uint64_t nperm, nshared;
             bdrv_child_perm(state->bs, state->new_backing_bs,
-                            NULL, &child_backing, 0, bs_queue,
-                            state->perm, state->shared_perm,
+                            NULL, &child_of_bds, bdrv_backing_role(state->=
bs),
+                            bs_queue, state->perm, state->shared_perm,
                             &nperm, &nshared);
             ret =3D bdrv_check_update_perm(state->new_backing_bs, NULL,
                                          nperm, nshared, NULL, NULL, errp)=
;
@@ -6679,7 +6693,7 @@ void bdrv_refresh_filename(BlockDriverState *bs)
         drv->bdrv_gather_child_options(bs, opts, backing_overridden);
     } else {
         QLIST_FOREACH(child, &bs->children, next) {
-            if (child->klass =3D=3D &child_backing && !backing_overridden)=
 {
+            if (child =3D=3D bs->backing && !backing_overridden) {
                 /* We can skip the backing BDS if it has not been overridd=
en */
                 continue;
             }
diff --git a/block/backup-top.c b/block/backup-top.c
index 9dd89c2fde..c173e61250 100644
--- a/block/backup-top.c
+++ b/block/backup-top.c
@@ -142,7 +142,7 @@ static void backup_top_child_perm(BlockDriverState *bs,=
 BdrvChild *c,
         return;
     }
=20
-    if (child_class =3D=3D &child_file) {
+    if (!(role & BDRV_CHILD_FILTERED)) {
         /*
          * Target child
          *
diff --git a/block/vvfat.c b/block/vvfat.c
index a945eeb635..8f4ff5a97e 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -3221,7 +3221,8 @@ static void vvfat_child_perm(BlockDriverState *bs, Bd=
rvChild *c,
 {
     BDRVVVFATState *s =3D bs->opaque;
=20
-    assert(c =3D=3D s->qcow || child_class =3D=3D &child_backing);
+    assert(c =3D=3D s->qcow ||
+           (child_class =3D=3D &child_of_bds && (role & BDRV_CHILD_COW)));
=20
     if (c =3D=3D s->qcow) {
         /* This is a private node, nobody should try to attach to it */
diff --git a/tests/test-bdrv-drain.c b/tests/test-bdrv-drain.c
index b3d7960bd0..15393a0140 100644
--- a/tests/test-bdrv-drain.c
+++ b/tests/test-bdrv-drain.c
@@ -96,7 +96,7 @@ static void bdrv_test_child_perm(BlockDriverState *bs, Bd=
rvChild *c,
      * bdrv_format_default_perms() accepts only these two, so disguise
      * detach_by_driver_cb_parent as one of them.
      */
-    if (child_class !=3D &child_file && child_class !=3D &child_backing) {
+    if (child_class !=3D &child_file && child_class !=3D &child_of_bds) {
         child_class =3D &child_file;
     }
=20
@@ -1399,8 +1399,8 @@ static void test_detach_indirect(bool by_parent_cb)
     bdrv_ref(a);
     child_b =3D bdrv_attach_child(parent_b, b, "PB-B", &child_file, 0,
                                 &error_abort);
-    child_a =3D bdrv_attach_child(parent_b, a, "PB-A", &child_backing, 0,
-                                &error_abort);
+    child_a =3D bdrv_attach_child(parent_b, a, "PB-A", &child_of_bds,
+                                BDRV_CHILD_COW, &error_abort);
=20
     bdrv_ref(a);
     bdrv_attach_child(parent_a, a, "PA-A",
@@ -1793,7 +1793,7 @@ static void test_drop_intermediate_poll(void)
     int i;
     int ret;
=20
-    chain_child_class =3D child_backing;
+    chain_child_class =3D child_of_bds;
     chain_child_class.update_filename =3D drop_intermediate_poll_update_fi=
lename;
=20
     for (i =3D 0; i < 3; i++) {
@@ -1816,7 +1816,7 @@ static void test_drop_intermediate_poll(void)
             /* Takes the reference to chain[i - 1] */
             chain[i]->backing =3D bdrv_attach_child(chain[i], chain[i - 1]=
,
                                                   "chain", &chain_child_cl=
ass,
-                                                  0, &error_abort);
+                                                  BDRV_CHILD_COW, &error_a=
bort);
         }
     }
=20
@@ -2034,7 +2034,8 @@ static void do_test_replace_child_mid_drain(int old_d=
rain_count,
=20
     bdrv_ref(old_child_bs);
     parent_bs->backing =3D bdrv_attach_child(parent_bs, old_child_bs, "chi=
ld",
-                                           &child_backing, 0, &error_abort=
);
+                                           &child_of_bds, BDRV_CHILD_COW,
+                                           &error_abort);
=20
     for (i =3D 0; i < old_drain_count; i++) {
         bdrv_drained_begin(old_child_bs);
--=20
2.24.1


