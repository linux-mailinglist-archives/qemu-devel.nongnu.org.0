Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34794431B4
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 00:39:25 +0200 (CEST)
Received: from localhost ([::1]:35570 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbBts-0006q3-CG
	for lists+qemu-devel@lfdr.de; Wed, 12 Jun 2019 18:39:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45774)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hbBSN-0007xA-8S
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 18:11:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hbBSL-0007qn-7f
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 18:10:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33926)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hbBSF-0007mD-B2; Wed, 12 Jun 2019 18:10:51 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 83A62307C947;
 Wed, 12 Jun 2019 22:10:50 +0000 (UTC)
Received: from localhost (unknown [10.40.205.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D04606014E;
 Wed, 12 Jun 2019 22:10:49 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Thu, 13 Jun 2019 00:09:39 +0200
Message-Id: <20190612221004.2317-18-mreitz@redhat.com>
In-Reply-To: <20190612221004.2317-1-mreitz@redhat.com>
References: <20190612221004.2317-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Wed, 12 Jun 2019 22:10:50 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v5 17/42] block: Use CAFs in
 bdrv_refresh_limits()
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

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/io.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/block/io.c b/block/io.c
index 64408cf19a..659ea0c52a 100644
--- a/block/io.c
+++ b/block/io.c
@@ -151,6 +151,8 @@ static void bdrv_merge_limits(BlockLimits *dst, const=
 BlockLimits *src)
 void bdrv_refresh_limits(BlockDriverState *bs, Error **errp)
 {
     BlockDriver *drv =3D bs->drv;
+    BlockDriverState *storage_bs =3D bdrv_storage_bs(bs);
+    BlockDriverState *cow_bs =3D bdrv_filtered_cow_bs(bs);
     Error *local_err =3D NULL;
=20
     memset(&bs->bl, 0, sizeof(bs->bl));
@@ -164,13 +166,13 @@ void bdrv_refresh_limits(BlockDriverState *bs, Erro=
r **errp)
                                 drv->bdrv_aio_preadv) ? 1 : 512;
=20
     /* Take some limits from the children as a default */
-    if (bs->file) {
-        bdrv_refresh_limits(bs->file->bs, &local_err);
+    if (storage_bs) {
+        bdrv_refresh_limits(storage_bs, &local_err);
         if (local_err) {
             error_propagate(errp, local_err);
             return;
         }
-        bdrv_merge_limits(&bs->bl, &bs->file->bs->bl);
+        bdrv_merge_limits(&bs->bl, &storage_bs->bl);
     } else {
         bs->bl.min_mem_alignment =3D 512;
         bs->bl.opt_mem_alignment =3D getpagesize();
@@ -179,13 +181,13 @@ void bdrv_refresh_limits(BlockDriverState *bs, Erro=
r **errp)
         bs->bl.max_iov =3D IOV_MAX;
     }
=20
-    if (bs->backing) {
-        bdrv_refresh_limits(bs->backing->bs, &local_err);
+    if (cow_bs) {
+        bdrv_refresh_limits(cow_bs, &local_err);
         if (local_err) {
             error_propagate(errp, local_err);
             return;
         }
-        bdrv_merge_limits(&bs->bl, &bs->backing->bs->bl);
+        bdrv_merge_limits(&bs->bl, &cow_bs->bl);
     }
=20
     /* Then let the driver override it */
--=20
2.21.0


