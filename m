Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B945D68743
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jul 2019 12:46:11 +0200 (CEST)
Received: from localhost ([::1]:36824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hmyUk-0004EO-Bl
	for lists+qemu-devel@lfdr.de; Mon, 15 Jul 2019 06:46:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39389)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hmyU1-0002ZE-Qz
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 06:45:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hmyU0-0001iw-Bd
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 06:45:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32908)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hmyTy-0001hN-3N; Mon, 15 Jul 2019 06:45:22 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 52EE6C057EC6;
 Mon, 15 Jul 2019 10:45:21 +0000 (UTC)
Received: from localhost (unknown [10.40.205.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C9D806012C;
 Mon, 15 Jul 2019 10:45:20 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Mon, 15 Jul 2019 12:45:07 +0200
Message-Id: <20190715104508.7568-4-mreitz@redhat.com>
In-Reply-To: <20190715104508.7568-1-mreitz@redhat.com>
References: <20190715104508.7568-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Mon, 15 Jul 2019 10:45:21 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH for-4.1? 3/4] vhdx: Fix .bdrv_has_zero_init()
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

Fixed VHDX images cannot guarantee to be zero-initialized.  If the image
has the "fixed" subformat, forward the call to the underlying storage
node.

Reported-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/vhdx.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/block/vhdx.c b/block/vhdx.c
index d6070b6fa8..cc9c25d1c4 100644
--- a/block/vhdx.c
+++ b/block/vhdx.c
@@ -2075,6 +2075,25 @@ static int coroutine_fn vhdx_co_check(BlockDriverS=
tate *bs,
     return 0;
 }
=20
+static int vhdx_has_zero_init(BlockDriverState *bs)
+{
+    BDRVVHDXState *s =3D bs->opaque;
+    uint32_t bat_i;
+
+    /* Check the subformat (fixed or dynamic) */
+    for (bat_i =3D 0; bat_i < s->bat_entries; bat_i++) {
+        int state =3D s->bat[bat_i] & VHDX_BAT_STATE_BIT_MASK;
+
+        if (state =3D=3D PAYLOAD_BLOCK_FULLY_PRESENT) {
+            /* Fixed subformat */
+            return bdrv_has_zero_init(bs->file->bs);
+        }
+    }
+
+    /* Dynamic subformat */
+    return 1;
+}
+
 static QemuOptsList vhdx_create_opts =3D {
     .name =3D "vhdx-create-opts",
     .head =3D QTAILQ_HEAD_INITIALIZER(vhdx_create_opts.head),
@@ -2128,7 +2147,7 @@ static BlockDriver bdrv_vhdx =3D {
     .bdrv_co_create_opts    =3D vhdx_co_create_opts,
     .bdrv_get_info          =3D vhdx_get_info,
     .bdrv_co_check          =3D vhdx_co_check,
-    .bdrv_has_zero_init     =3D bdrv_has_zero_init_1,
+    .bdrv_has_zero_init     =3D vhdx_has_zero_init,
=20
     .create_opts            =3D &vhdx_create_opts,
 };
--=20
2.21.0


