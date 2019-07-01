Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7776B1A094
	for <lists+qemu-devel@lfdr.de>; Fri, 10 May 2019 17:53:33 +0200 (CEST)
Received: from localhost ([127.0.0.1]:45477 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hP7q0-0003qn-KN
	for lists+qemu-devel@lfdr.de; Fri, 10 May 2019 11:53:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59559)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1hP7X3-0004G1-Up
	for qemu-devel@nongnu.org; Fri, 10 May 2019 11:33:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1hP7X2-0002vy-OA
	for qemu-devel@nongnu.org; Fri, 10 May 2019 11:33:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48320)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sgarzare@redhat.com>)
	id 1hP7Ww-0002qQ-MT; Fri, 10 May 2019 11:33:50 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 88639308FBAF;
	Fri, 10 May 2019 15:33:49 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-202.ams2.redhat.com
	[10.36.117.202])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 829E85D9D4;
	Fri, 10 May 2019 15:33:47 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 10 May 2019 17:33:46 +0200
Message-Id: <20190510153346.238366-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Fri, 10 May 2019 15:33:49 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2] block/rbd: implement
 .bdrv_get_allocated_file_size callback
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
Cc: Kevin Wolf <kwolf@redhat.com>, Josh Durgin <jdurgin@redhat.com>,
	Jason Dillaman <jdillama@redhat.com>, qemu-block@nongnu.org,
	Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch allows 'qemu-img info' to show the 'disk size' for
the RBD images that have the fast-diff feature enabled.

If this feature is enabled, we use the rbd_diff_iterate2() API
to calculate the allocated size for the image.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
v2:
  - calculate the actual usage only if the fast-diff feature is
    enabled [Jason]
---
 block/rbd.c | 54 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/block/rbd.c b/block/rbd.c
index 0c549c9935..f1bc76ab80 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -1046,6 +1046,59 @@ static int64_t qemu_rbd_getlength(BlockDriverState=
 *bs)
     return info.size;
 }
=20
+static int rbd_allocated_size_cb(uint64_t offset, size_t len, int exists=
,
+                                 void *arg)
+{
+    int64_t *alloc_size =3D (int64_t *) arg;
+
+    if (exists) {
+        (*alloc_size) +=3D len;
+    }
+
+    return 0;
+}
+
+static int64_t qemu_rbd_get_allocated_file_size(BlockDriverState *bs)
+{
+    BDRVRBDState *s =3D bs->opaque;
+    uint64_t flags, features;
+    int64_t alloc_size =3D 0;
+    int r;
+
+    r =3D rbd_get_flags(s->image, &flags);
+    if (r < 0) {
+        return r;
+    }
+
+    r =3D rbd_get_features(s->image, &features);
+    if (r < 0) {
+        return r;
+    }
+
+    /*
+     * We use rbd_diff_iterate2() only if the RBD image have fast-diff
+     * feature enabled. If it is disabled, rbd_diff_iterate2() could be
+     * very slow on a big image.
+     */
+    if (!(features & RBD_FEATURE_FAST_DIFF) ||
+        (flags & RBD_FLAG_FAST_DIFF_INVALID)) {
+        return -1;
+    }
+
+    /*
+     * rbd_diff_iterate2(), if the source snapshot name is NULL, invokes
+     * the callback on all allocated regions of the image.
+     */
+    r =3D rbd_diff_iterate2(s->image, NULL, 0,
+                          bs->total_sectors * BDRV_SECTOR_SIZE, 0, 1,
+                          &rbd_allocated_size_cb, &alloc_size);
+    if (r < 0) {
+        return r;
+    }
+
+    return alloc_size;
+}
+
 static int coroutine_fn qemu_rbd_co_truncate(BlockDriverState *bs,
                                              int64_t offset,
                                              PreallocMode prealloc,
@@ -1254,6 +1307,7 @@ static BlockDriver bdrv_rbd =3D {
     .bdrv_get_info          =3D qemu_rbd_getinfo,
     .create_opts            =3D &qemu_rbd_create_opts,
     .bdrv_getlength         =3D qemu_rbd_getlength,
+    .bdrv_get_allocated_file_size =3D qemu_rbd_get_allocated_file_size,
     .bdrv_co_truncate       =3D qemu_rbd_co_truncate,
     .protocol_name          =3D "rbd",
=20
--=20
2.20.1


