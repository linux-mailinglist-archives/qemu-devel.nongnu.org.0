Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B109431AE
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 00:34:05 +0200 (CEST)
Received: from localhost ([::1]:35538 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbBoi-00028W-GS
	for lists+qemu-devel@lfdr.de; Wed, 12 Jun 2019 18:34:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45607)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hbBSB-0007kA-DV
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 18:10:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hbBSA-0007iz-2x
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 18:10:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37240)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hbBS7-0007hF-Dz; Wed, 12 Jun 2019 18:10:43 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B778780461;
 Wed, 12 Jun 2019 22:10:42 +0000 (UTC)
Received: from localhost (unknown [10.40.205.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 468887E692;
 Wed, 12 Jun 2019 22:10:42 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Thu, 13 Jun 2019 00:09:36 +0200
Message-Id: <20190612221004.2317-15-mreitz@redhat.com>
In-Reply-To: <20190612221004.2317-1-mreitz@redhat.com>
References: <20190612221004.2317-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Wed, 12 Jun 2019 22:10:42 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v5 14/42] block: Use CAFs when working with
 backing chains
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use child access functions when iterating through backing chains so
filters do not break the chain.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block.c | 40 ++++++++++++++++++++++++++++------------
 1 file changed, 28 insertions(+), 12 deletions(-)

diff --git a/block.c b/block.c
index 11f37983d9..505b3e9a01 100644
--- a/block.c
+++ b/block.c
@@ -4261,7 +4261,8 @@ int bdrv_change_backing_file(BlockDriverState *bs,
 }
=20
 /*
- * Finds the image layer in the chain that has 'bs' as its backing file.
+ * Finds the image layer in the chain that has 'bs' (or a filter on
+ * top of it) as its backing file.
  *
  * active is the current topmost image.
  *
@@ -4273,11 +4274,18 @@ int bdrv_change_backing_file(BlockDriverState *bs=
,
 BlockDriverState *bdrv_find_overlay(BlockDriverState *active,
                                     BlockDriverState *bs)
 {
-    while (active && bs !=3D backing_bs(active)) {
-        active =3D backing_bs(active);
+    bs =3D bdrv_skip_rw_filters(bs);
+    active =3D bdrv_skip_rw_filters(active);
+
+    while (active) {
+        BlockDriverState *next =3D bdrv_backing_chain_next(active);
+        if (bs =3D=3D next) {
+            return active;
+        }
+        active =3D next;
     }
=20
-    return active;
+    return NULL;
 }
=20
 /* Given a BDS, searches for the base layer. */
@@ -4421,9 +4429,7 @@ int bdrv_drop_intermediate(BlockDriverState *top, B=
lockDriverState *base,
      * other intermediate nodes have been dropped.
      * If 'top' is an implicit node (e.g. "commit_top") we should skip
      * it because no one inherits from it. We use explicit_top for that.=
 */
-    while (explicit_top && explicit_top->implicit) {
-        explicit_top =3D backing_bs(explicit_top);
-    }
+    explicit_top =3D bdrv_skip_implicit_filters(explicit_top);
     update_inherits_from =3D bdrv_inherits_from_recursive(base, explicit=
_top);
=20
     /* success - we can delete the intermediate states, and link top->ba=
se */
@@ -4902,7 +4908,7 @@ BlockDriverState *bdrv_lookup_bs(const char *device=
,
 bool bdrv_chain_contains(BlockDriverState *top, BlockDriverState *base)
 {
     while (top && top !=3D base) {
-        top =3D backing_bs(top);
+        top =3D bdrv_filtered_bs(top);
     }
=20
     return top !=3D NULL;
@@ -5141,7 +5147,17 @@ BlockDriverState *bdrv_find_backing_image(BlockDri=
verState *bs,
=20
     is_protocol =3D path_has_protocol(backing_file);
=20
-    for (curr_bs =3D bs; curr_bs->backing; curr_bs =3D curr_bs->backing-=
>bs) {
+    /*
+     * Being largely a legacy function, skip any filters here
+     * (because filters do not have normal filenames, so they cannot
+     * match anyway; and allowing json:{} filenames is a bit out of
+     * scope).
+     */
+    for (curr_bs =3D bdrv_skip_rw_filters(bs);
+         bdrv_filtered_cow_child(curr_bs) !=3D NULL;
+         curr_bs =3D bdrv_backing_chain_next(curr_bs))
+    {
+        BlockDriverState *bs_below =3D bdrv_backing_chain_next(curr_bs);
=20
         /* If either of the filename paths is actually a protocol, then
          * compare unmodified paths; otherwise make paths relative */
@@ -5149,7 +5165,7 @@ BlockDriverState *bdrv_find_backing_image(BlockDriv=
erState *bs,
             char *backing_file_full_ret;
=20
             if (strcmp(backing_file, curr_bs->backing_file) =3D=3D 0) {
-                retval =3D curr_bs->backing->bs;
+                retval =3D bs_below;
                 break;
             }
             /* Also check against the full backing filename for the imag=
e */
@@ -5159,7 +5175,7 @@ BlockDriverState *bdrv_find_backing_image(BlockDriv=
erState *bs,
                 bool equal =3D strcmp(backing_file, backing_file_full_re=
t) =3D=3D 0;
                 g_free(backing_file_full_ret);
                 if (equal) {
-                    retval =3D curr_bs->backing->bs;
+                    retval =3D bs_below;
                     break;
                 }
             }
@@ -5185,7 +5201,7 @@ BlockDriverState *bdrv_find_backing_image(BlockDriv=
erState *bs,
             g_free(filename_tmp);
=20
             if (strcmp(backing_file_full, filename_full) =3D=3D 0) {
-                retval =3D curr_bs->backing->bs;
+                retval =3D bs_below;
                 break;
             }
         }
--=20
2.21.0


