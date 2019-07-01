Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD42268E3
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 19:11:30 +0200 (CEST)
Received: from localhost ([127.0.0.1]:48042 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTUm1-0008GF-Bg
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 13:11:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40697)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1hTUfE-0003a7-GO
	for qemu-devel@nongnu.org; Wed, 22 May 2019 13:04:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1hTUfC-0007nO-EA
	for qemu-devel@nongnu.org; Wed, 22 May 2019 13:04:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48842)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mreitz@redhat.com>)
	id 1hTUf8-0007ei-Hk; Wed, 22 May 2019 13:04:22 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D184A9F758;
	Wed, 22 May 2019 17:04:20 +0000 (UTC)
Received: from localhost (ovpn-204-123.brq.redhat.com [10.40.204.123])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C90760BE5;
	Wed, 22 May 2019 17:04:20 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Wed, 22 May 2019 19:03:51 +0200
Message-Id: <20190522170352.12020-8-mreitz@redhat.com>
In-Reply-To: <20190522170352.12020-1-mreitz@redhat.com>
References: <20190522170352.12020-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 22 May 2019 17:04:20 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 7/8] block: Ignore loosening perm
 restrictions failures
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
	Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We generally assume that loosening permission restrictions can never
fail.  We have seen in the past that this assumption is wrong.  This has
led to crashes because we generally pass &error_abort when loosening
permissions.

However, a failure in such a case should actually be handled in quite
the opposite way: It is very much not fatal, so qemu may report it, but
still consider the operation successful.  The only realistic problem is
that qemu may then retain permissions and thus locks on images it
actually does not require.  But again, that is not fatal.

To implement this behavior, we make all functions that change
permissions and that pass &error_abort to the initiating function
(bdrv_check_perm() or bdrv_child_check_perm()) evaluate the
@loosen_restrictions value introduced in the previous patch.  If it is
true and an error did occur, we abort the permission update, discard the
error, and instead report success to the caller.

bdrv_child_try_set_perm() itself does not pass &error_abort, but it is
the only public function to change permissions.  As such, callers may
pass &error_abort to it, expecting dropping permission restrictions to
never fail.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block.c | 44 ++++++++++++++++++++++++++++++++++++++------
 1 file changed, 38 insertions(+), 6 deletions(-)

diff --git a/block.c b/block.c
index f5d7f4d971..58e1e3ce14 100644
--- a/block.c
+++ b/block.c
@@ -2121,11 +2121,26 @@ static void bdrv_child_abort_perm_update(BdrvChil=
d *c)
 int bdrv_child_try_set_perm(BdrvChild *c, uint64_t perm, uint64_t shared=
,
                             Error **errp)
 {
+    Error *local_err =3D NULL;
     int ret;
+    bool tighten_restrictions;
=20
-    ret =3D bdrv_child_check_perm(c, NULL, perm, shared, NULL, NULL, err=
p);
+    ret =3D bdrv_child_check_perm(c, NULL, perm, shared, NULL,
+                                &tighten_restrictions, &local_err);
     if (ret < 0) {
         bdrv_child_abort_perm_update(c);
+        if (tighten_restrictions) {
+            error_propagate(errp, local_err);
+        } else {
+            /*
+             * Our caller may intend to only loosen restrictions and
+             * does not expect this function to fail.  Errors are not
+             * fatal in such a case, so we can just hide them from our
+             * caller.
+             */
+            error_free(local_err);
+            ret =3D 0;
+        }
         return ret;
     }
=20
@@ -2308,10 +2323,19 @@ static void bdrv_replace_child(BdrvChild *child, =
BlockDriverState *new_bs)
         /* Update permissions for old node. This is guaranteed to succee=
d
          * because we're just taking a parent away, so we're loosening
          * restrictions. */
+        bool tighten_restrictions;
+        int ret;
+
         bdrv_get_cumulative_perm(old_bs, &perm, &shared_perm);
-        bdrv_check_perm(old_bs, NULL, perm, shared_perm, NULL,
-                        NULL, &error_abort);
-        bdrv_set_perm(old_bs, perm, shared_perm);
+        ret =3D bdrv_check_perm(old_bs, NULL, perm, shared_perm, NULL,
+                              &tighten_restrictions, NULL);
+        assert(tighten_restrictions =3D=3D false);
+        if (ret < 0) {
+            /* We only tried to loosen restrictions, so errors are not f=
atal */
+            bdrv_abort_perm_update(old_bs);
+        } else {
+            bdrv_set_perm(old_bs, perm, shared_perm);
+        }
     }
 }
=20
@@ -5352,6 +5376,7 @@ static bool bdrv_has_bds_parent(BlockDriverState *b=
s, bool only_active)
 static int bdrv_inactivate_recurse(BlockDriverState *bs)
 {
     BdrvChild *child, *parent;
+    bool tighten_restrictions;
     uint64_t perm, shared_perm;
     int ret;
=20
@@ -5388,8 +5413,15 @@ static int bdrv_inactivate_recurse(BlockDriverStat=
e *bs)
=20
     /* Update permissions, they may differ for inactive nodes */
     bdrv_get_cumulative_perm(bs, &perm, &shared_perm);
-    bdrv_check_perm(bs, NULL, perm, shared_perm, NULL, NULL, &error_abor=
t);
-    bdrv_set_perm(bs, perm, shared_perm);
+    ret =3D bdrv_check_perm(bs, NULL, perm, shared_perm, NULL,
+                          &tighten_restrictions, NULL);
+    assert(tighten_restrictions =3D=3D false);
+    if (ret < 0) {
+        /* We only tried to loosen restrictions, so errors are not fatal=
 */
+        bdrv_abort_perm_update(bs);
+    } else {
+        bdrv_set_perm(bs, perm, shared_perm);
+    }
=20
=20
     /* Recursively inactivate children */
--=20
2.21.0


