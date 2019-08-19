Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2920694D6A
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 21:01:25 +0200 (CEST)
Received: from localhost ([::1]:56614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzmuC-0007L1-4o
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 15:01:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60750)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1hzmpF-0001Y6-Ta
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 14:56:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hzmpE-0001vv-Qd
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 14:56:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54192)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hzmpC-0001u9-2x; Mon, 19 Aug 2019 14:56:14 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 64309315C013;
 Mon, 19 Aug 2019 18:56:13 +0000 (UTC)
Received: from localhost (ovpn-204-64.brq.redhat.com [10.40.204.64])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E94481DA;
 Mon, 19 Aug 2019 18:56:12 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Mon, 19 Aug 2019 20:55:49 +0200
Message-Id: <20190819185602.4267-4-mreitz@redhat.com>
In-Reply-To: <20190819185602.4267-1-mreitz@redhat.com>
References: <20190819185602.4267-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Mon, 19 Aug 2019 18:56:13 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 03/16] qcow2: Add Error ** to
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
Reviewed-by: Eric Blake <eblake@redhat.com>
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
index 752883e5c3..80d32e4504 100644
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
@@ -107,6 +109,7 @@ int qcow2_read_snapshots(BlockDriverState *bs)
         sn->id_str =3D g_malloc(id_str_size + 1);
         ret =3D bdrv_pread(bs->file, offset, sn->id_str, id_str_size);
         if (ret < 0) {
+            error_setg_errno(errp, -ret, "Failed to read snapshot table"=
);
             goto fail;
         }
         offset +=3D id_str_size;
@@ -116,6 +119,7 @@ int qcow2_read_snapshots(BlockDriverState *bs)
         sn->name =3D g_malloc(name_size + 1);
         ret =3D bdrv_pread(bs->file, offset, sn->name, name_size);
         if (ret < 0) {
+            error_setg_errno(errp, -ret, "Failed to read snapshot table"=
);
             goto fail;
         }
         offset +=3D name_size;
@@ -123,6 +127,7 @@ int qcow2_read_snapshots(BlockDriverState *bs)
=20
         if (offset - s->snapshots_offset > QCOW_MAX_SNAPSHOTS_SIZE) {
             ret =3D -EFBIG;
+            error_setg(errp, "Snapshot table is too big");
             goto fail;
         }
     }
diff --git a/block/qcow2.c b/block/qcow2.c
index 7c5a4859f7..dbb50bc2f8 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -1578,9 +1578,8 @@ static int coroutine_fn qcow2_do_open(BlockDriverSt=
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


