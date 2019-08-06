Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8A48312A
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Aug 2019 14:05:51 +0200 (CEST)
Received: from localhost ([::1]:60968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1huyDu-0000iZ-UE
	for lists+qemu-devel@lfdr.de; Tue, 06 Aug 2019 08:05:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60334)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1huy8X-00018k-SJ
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 08:00:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1huy8W-0001ry-Pv
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 08:00:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58916)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1huy8U-0001q1-2I; Tue, 06 Aug 2019 08:00:14 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 221C43001A65;
 Tue,  6 Aug 2019 12:00:13 +0000 (UTC)
Received: from localhost (ovpn-204-49.brq.redhat.com [10.40.204.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DDE295D6D0;
 Tue,  6 Aug 2019 12:00:05 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Tue,  6 Aug 2019 13:59:50 +0200
Message-Id: <20190806115952.8456-6-mreitz@redhat.com>
In-Reply-To: <20190806115952.8456-1-mreitz@redhat.com>
References: <20190806115952.8456-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Tue, 06 Aug 2019 12:00:13 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL v2 5/7] mirror: Only mirror granularity-aligned
 chunks
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-stable@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In write-blocking mode, all writes to the top node directly go to the
target.  We must only mirror chunks of data that are aligned to the
job's granularity, because that is how the dirty bitmap works.
Therefore, the request alignment for writes must be the job's
granularity (in write-blocking mode).

Unfortunately, this forces all reads and writes to have the same
granularity (we only need this alignment for writes to the target, not
the source), but that is something to be fixed another time.

Cc: qemu-stable@nongnu.org
Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-id: 20190805153308.2657-1-mreitz@redhat.com
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Fixes: d06107ade0ce74dc39739bac80de84b51ec18546
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/mirror.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/block/mirror.c b/block/mirror.c
index 8cb75fb409..9f5c59ece1 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1481,6 +1481,15 @@ static void bdrv_mirror_top_child_perm(BlockDriver=
State *bs, BdrvChild *c,
     *nshared =3D BLK_PERM_ALL;
 }
=20
+static void bdrv_mirror_top_refresh_limits(BlockDriverState *bs, Error *=
*errp)
+{
+    MirrorBDSOpaque *s =3D bs->opaque;
+
+    if (s && s->job && s->job->copy_mode =3D=3D MIRROR_COPY_MODE_WRITE_B=
LOCKING) {
+        bs->bl.request_alignment =3D s->job->granularity;
+    }
+}
+
 /* Dummy node that provides consistent read to its users without requiri=
ng it
  * from its backing file and that allows writes on the backing file chai=
n. */
 static BlockDriver bdrv_mirror_top =3D {
@@ -1493,6 +1502,7 @@ static BlockDriver bdrv_mirror_top =3D {
     .bdrv_co_block_status       =3D bdrv_co_block_status_from_backing,
     .bdrv_refresh_filename      =3D bdrv_mirror_top_refresh_filename,
     .bdrv_child_perm            =3D bdrv_mirror_top_child_perm,
+    .bdrv_refresh_limits        =3D bdrv_mirror_top_refresh_limits,
 };
=20
 static BlockJob *mirror_start_job(
@@ -1637,6 +1647,25 @@ static BlockJob *mirror_start_job(
         s->should_complete =3D true;
     }
=20
+    /*
+     * Must be called before we start tracking writes, but after
+     *
+     *     ((MirrorBlockJob *)
+     *         ((MirrorBDSOpaque *)
+     *             mirror_top_bs->opaque
+     *         )->job
+     *     )->copy_mode
+     *
+     * has the correct value.
+     * (We start tracking writes as of the following
+     * bdrv_create_dirty_bitmap() call.)
+     */
+    bdrv_refresh_limits(mirror_top_bs, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        goto fail;
+    }
+
     s->dirty_bitmap =3D bdrv_create_dirty_bitmap(bs, granularity, NULL, =
errp);
     if (!s->dirty_bitmap) {
         goto fail;
--=20
2.21.0


