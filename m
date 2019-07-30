Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C88B27AFDB
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jul 2019 19:29:03 +0200 (CEST)
Received: from localhost ([::1]:34920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsVvr-0004m9-12
	for lists+qemu-devel@lfdr.de; Tue, 30 Jul 2019 13:29:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33459)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hsVsI-0006eG-Hi
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 13:25:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hsVsH-0002Wc-Ed
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 13:25:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57972)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hsVsA-0002Pg-D0; Tue, 30 Jul 2019 13:25:14 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3B68E3083391;
 Tue, 30 Jul 2019 17:25:13 +0000 (UTC)
Received: from localhost (ovpn-116-164.ams2.redhat.com [10.36.116.164])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A398F60856;
 Tue, 30 Jul 2019 17:25:12 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Tue, 30 Jul 2019 19:24:56 +0200
Message-Id: <20190730172508.19911-2-mreitz@redhat.com>
In-Reply-To: <20190730172508.19911-1-mreitz@redhat.com>
References: <20190730172508.19911-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Tue, 30 Jul 2019 17:25:13 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH for-4.2 01/13] qcow2: Add Error ** to
 qcow2_read_snapshots()
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

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/qcow2.h          | 2 +-
 block/qcow2-snapshot.c | 7 ++++++-
 block/qcow2.c          | 3 +--
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index fc1b0d3c1e..175708cee0 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -704,7 +704,7 @@ int qcow2_snapshot_load_tmp(BlockDriverState *bs,
                             Error **errp);
=20
 void qcow2_free_snapshots(BlockDriverState *bs);
-int qcow2_read_snapshots(BlockDriverState *bs);
+int qcow2_read_snapshots(BlockDriverState *bs, Error **errp);
=20
 /* qcow2-cache.c functions */
 Qcow2Cache *qcow2_cache_create(BlockDriverState *bs, int num_tables,
diff --git a/block/qcow2-snapshot.c b/block/qcow2-snapshot.c
index d0e7fa9311..6295ba4c9c 100644
--- a/block/qcow2-snapshot.c
+++ b/block/qcow2-snapshot.c
@@ -43,7 +43,7 @@ void qcow2_free_snapshots(BlockDriverState *bs)
     s->nb_snapshots =3D 0;
 }
=20
-int qcow2_read_snapshots(BlockDriverState *bs)
+int qcow2_read_snapshots(BlockDriverState *bs, Error **errp)
 {
     BDRVQcow2State *s =3D bs->opaque;
     QCowSnapshotHeader h;
@@ -68,6 +68,7 @@ int qcow2_read_snapshots(BlockDriverState *bs)
         offset =3D ROUND_UP(offset, 8);
         ret =3D bdrv_pread(bs->file, offset, &h, sizeof(h));
         if (ret < 0) {
+            error_setg_errno(errp, -ret, "Failed to read snapshot table"=
);
             goto fail;
         }
=20
@@ -88,6 +89,7 @@ int qcow2_read_snapshots(BlockDriverState *bs)
         ret =3D bdrv_pread(bs->file, offset, &extra,
                          MIN(sizeof(extra), extra_data_size));
         if (ret < 0) {
+            error_setg_errno(errp, -ret, "Failed to read snapshot table"=
);
             goto fail;
         }
         offset +=3D extra_data_size;
@@ -106,6 +108,7 @@ int qcow2_read_snapshots(BlockDriverState *bs)
         sn->id_str =3D g_malloc(id_str_size + 1);
         ret =3D bdrv_pread(bs->file, offset, sn->id_str, id_str_size);
         if (ret < 0) {
+            error_setg_errno(errp, -ret, "Failed to read snapshot table"=
);
             goto fail;
         }
         offset +=3D id_str_size;
@@ -115,6 +118,7 @@ int qcow2_read_snapshots(BlockDriverState *bs)
         sn->name =3D g_malloc(name_size + 1);
         ret =3D bdrv_pread(bs->file, offset, sn->name, name_size);
         if (ret < 0) {
+            error_setg_errno(errp, -ret, "Failed to read snapshot table"=
);
             goto fail;
         }
         offset +=3D name_size;
@@ -122,6 +126,7 @@ int qcow2_read_snapshots(BlockDriverState *bs)
=20
         if (offset - s->snapshots_offset > QCOW_MAX_SNAPSHOTS_SIZE) {
             ret =3D -EFBIG;
+            error_setg(errp, "Snapshot table is too big");
             goto fail;
         }
     }
diff --git a/block/qcow2.c b/block/qcow2.c
index 039bdc2f7e..0336deaf2c 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -1577,9 +1577,8 @@ static int coroutine_fn qcow2_do_open(BlockDriverSt=
ate *bs, QDict *options,
     s->snapshots_offset =3D header.snapshots_offset;
     s->nb_snapshots =3D header.nb_snapshots;
=20
-    ret =3D qcow2_read_snapshots(bs);
+    ret =3D qcow2_read_snapshots(bs, errp);
     if (ret < 0) {
-        error_setg_errno(errp, -ret, "Could not read snapshots");
         goto fail;
     }
=20
--=20
2.21.0


