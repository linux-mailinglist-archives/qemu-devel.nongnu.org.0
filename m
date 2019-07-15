Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FB168741
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jul 2019 12:46:06 +0200 (CEST)
Received: from localhost ([::1]:36822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hmyUf-0003yP-Ck
	for lists+qemu-devel@lfdr.de; Mon, 15 Jul 2019 06:46:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39350)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hmyTy-0002L9-EO
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 06:45:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hmyTx-0001hH-Df
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 06:45:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42280)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hmyTu-0001fR-Oq; Mon, 15 Jul 2019 06:45:18 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 15AC2308FC4B;
 Mon, 15 Jul 2019 10:45:18 +0000 (UTC)
Received: from localhost (unknown [10.40.205.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8603945C3;
 Mon, 15 Jul 2019 10:45:17 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Mon, 15 Jul 2019 12:45:06 +0200
Message-Id: <20190715104508.7568-3-mreitz@redhat.com>
In-Reply-To: <20190715104508.7568-1-mreitz@redhat.com>
References: <20190715104508.7568-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Mon, 15 Jul 2019 10:45:18 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH for-4.1? 2/4] vdi: Fix .bdrv_has_zero_init()
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
Cc: Kevin Wolf <kwolf@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Static VDI images cannot guarantee to be zero-initialized.  If the image
has been statically allocated, forward the call to the underlying
storage node.

Reported-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/vdi.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/block/vdi.c b/block/vdi.c
index b9845a4cbd..0caa3f281d 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -988,6 +988,17 @@ static void vdi_close(BlockDriverState *bs)
     error_free(s->migration_blocker);
 }
=20
+static int vdi_has_zero_init(BlockDriverState *bs)
+{
+    BDRVVdiState *s =3D bs->opaque;
+
+    if (s->header.image_type =3D=3D VDI_TYPE_STATIC) {
+        return bdrv_has_zero_init(bs->file->bs);
+    } else {
+        return 1;
+    }
+}
+
 static QemuOptsList vdi_create_opts =3D {
     .name =3D "vdi-create-opts",
     .head =3D QTAILQ_HEAD_INITIALIZER(vdi_create_opts.head),
@@ -1028,7 +1039,7 @@ static BlockDriver bdrv_vdi =3D {
     .bdrv_child_perm          =3D bdrv_format_default_perms,
     .bdrv_co_create      =3D vdi_co_create,
     .bdrv_co_create_opts =3D vdi_co_create_opts,
-    .bdrv_has_zero_init =3D bdrv_has_zero_init_1,
+    .bdrv_has_zero_init  =3D vdi_has_zero_init,
     .bdrv_co_block_status =3D vdi_co_block_status,
     .bdrv_make_empty =3D vdi_make_empty,
=20
--=20
2.21.0


