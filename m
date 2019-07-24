Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DA6734CE
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jul 2019 19:15:15 +0200 (CEST)
Received: from localhost ([::1]:53664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqKrB-00042O-Ce
	for lists+qemu-devel@lfdr.de; Wed, 24 Jul 2019 13:15:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49763)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hqKpF-0004x1-Vq
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 13:13:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hqKpE-0005yQ-Pl
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 13:13:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54412)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hqKpB-0005kZ-Mm; Wed, 24 Jul 2019 13:13:09 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0BE3913A98;
 Wed, 24 Jul 2019 17:13:09 +0000 (UTC)
Received: from localhost (ovpn-204-115.brq.redhat.com [10.40.204.115])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 17AF319C70;
 Wed, 24 Jul 2019 17:13:06 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Wed, 24 Jul 2019 19:12:36 +0200
Message-Id: <20190724171239.8764-9-mreitz@redhat.com>
In-Reply-To: <20190724171239.8764-1-mreitz@redhat.com>
References: <20190724171239.8764-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Wed, 24 Jul 2019 17:13:09 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 08/11] vhdx: Fix .bdrv_has_zero_init()
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixed VHDX images cannot guarantee to be zero-initialized.  If the image
has the "fixed" subformat, forward the call to the underlying storage
node.

Reported-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/vhdx.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/block/vhdx.c b/block/vhdx.c
index a02d1c99a7..6a09d0a55c 100644
--- a/block/vhdx.c
+++ b/block/vhdx.c
@@ -2075,6 +2075,30 @@ static int coroutine_fn vhdx_co_check(BlockDriverS=
tate *bs,
     return 0;
 }
=20
+static int vhdx_has_zero_init(BlockDriverState *bs)
+{
+    BDRVVHDXState *s =3D bs->opaque;
+    int state;
+
+    /*
+     * Check the subformat: Fixed images have all BAT entries present,
+     * dynamic images have none (right after creation).  It is
+     * therefore enough to check the first BAT entry.
+     */
+    if (!s->bat_entries) {
+        return 1;
+    }
+
+    state =3D s->bat[0] & VHDX_BAT_STATE_BIT_MASK;
+    if (state =3D=3D PAYLOAD_BLOCK_FULLY_PRESENT) {
+        /* Fixed subformat */
+        return bdrv_has_zero_init(bs->file->bs);
+    }
+
+    /* Dynamic subformat */
+    return 1;
+}
+
 static QemuOptsList vhdx_create_opts =3D {
     .name =3D "vhdx-create-opts",
     .head =3D QTAILQ_HEAD_INITIALIZER(vhdx_create_opts.head),
@@ -2128,7 +2152,7 @@ static BlockDriver bdrv_vhdx =3D {
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


