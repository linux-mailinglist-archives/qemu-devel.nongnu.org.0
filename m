Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8EB949DC
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 18:29:31 +0200 (CEST)
Received: from localhost ([::1]:55326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzkXB-0008A9-PV
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 12:29:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35438)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1hzkLy-000359-6n
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 12:17:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hzkLw-0006OT-TR
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 12:17:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56352)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hzkLu-0006LL-DN; Mon, 19 Aug 2019 12:17:50 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AE201A2890A;
 Mon, 19 Aug 2019 16:17:49 +0000 (UTC)
Received: from localhost (ovpn-204-64.brq.redhat.com [10.40.204.64])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 484B81EE;
 Mon, 19 Aug 2019 16:17:49 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Mon, 19 Aug 2019 18:17:14 +0200
Message-Id: <20190819161723.7746-9-mreitz@redhat.com>
In-Reply-To: <20190819161723.7746-1-mreitz@redhat.com>
References: <20190819161723.7746-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.68]); Mon, 19 Aug 2019 16:17:49 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 08/17] vdi: Fix .bdrv_has_zero_init()
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
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Static VDI images cannot guarantee to be zero-initialized.  If the image
has been statically allocated, forward the call to the underlying
storage node.

Reported-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Acked-by: Stefano Garzarella <sgarzare@redhat.com>
Tested-by: Stefano Garzarella <sgarzare@redhat.com>
Message-id: 20190724171239.8764-8-mreitz@redhat.com
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
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


