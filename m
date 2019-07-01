Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6064BCEA
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jun 2019 17:36:10 +0200 (CEST)
Received: from localhost ([::1]:39516 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdcd7-0004YD-FR
	for lists+qemu-devel@lfdr.de; Wed, 19 Jun 2019 11:36:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42524)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hdcTy-0003Ln-Kh
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 11:26:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hdcTx-0002Dg-Hq
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 11:26:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46356)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hdcTv-0002BR-4s; Wed, 19 Jun 2019 11:26:39 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4BEB8305E237;
 Wed, 19 Jun 2019 15:26:33 +0000 (UTC)
Received: from localhost (ovpn-116-121.ams2.redhat.com [10.36.116.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 82841608C2;
 Wed, 19 Jun 2019 15:26:29 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Wed, 19 Jun 2019 17:26:01 +0200
Message-Id: <20190619152603.5937-8-mreitz@redhat.com>
In-Reply-To: <20190619152603.5937-1-mreitz@redhat.com>
References: <20190619152603.5937-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Wed, 19 Jun 2019 15:26:33 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 7/9] block: Fix BDS children's .drained_end()
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
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

BdrvChildRole.drained_end() must not poll, bdrv_child_cb_drained_end()
should use bdrv_drained_end_no_poll() instead of bdrv_drained_end().

The existing implementation works perfectly well for
.drained_end_unquiesce(), though, so use it there.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/block.c b/block.c
index 31b85df0f0..1652f3d29b 100644
--- a/block.c
+++ b/block.c
@@ -912,6 +912,12 @@ static bool bdrv_child_cb_drained_poll(BdrvChild *ch=
ild)
 }
=20
 static void bdrv_child_cb_drained_end(BdrvChild *child)
+{
+    BlockDriverState *bs =3D child->opaque;
+    bdrv_drained_end_no_poll(bs);
+}
+
+static void bdrv_child_cb_drained_end_unquiesce(BdrvChild *child)
 {
     BlockDriverState *bs =3D child->opaque;
     bdrv_drained_end(bs);
@@ -1014,6 +1020,7 @@ const BdrvChildRole child_file =3D {
     .drained_begin   =3D bdrv_child_cb_drained_begin,
     .drained_poll    =3D bdrv_child_cb_drained_poll,
     .drained_end     =3D bdrv_child_cb_drained_end,
+    .drained_end_unquiesce =3D bdrv_child_cb_drained_end_unquiesce,
     .attach          =3D bdrv_child_cb_attach,
     .detach          =3D bdrv_child_cb_detach,
     .inactivate      =3D bdrv_child_cb_inactivate,
@@ -1042,6 +1049,7 @@ const BdrvChildRole child_format =3D {
     .drained_begin   =3D bdrv_child_cb_drained_begin,
     .drained_poll    =3D bdrv_child_cb_drained_poll,
     .drained_end     =3D bdrv_child_cb_drained_end,
+    .drained_end_unquiesce =3D bdrv_child_cb_drained_end_unquiesce,
     .attach          =3D bdrv_child_cb_attach,
     .detach          =3D bdrv_child_cb_detach,
     .inactivate      =3D bdrv_child_cb_inactivate,
@@ -1168,6 +1176,7 @@ const BdrvChildRole child_backing =3D {
     .drained_begin   =3D bdrv_child_cb_drained_begin,
     .drained_poll    =3D bdrv_child_cb_drained_poll,
     .drained_end     =3D bdrv_child_cb_drained_end,
+    .drained_end_unquiesce =3D bdrv_child_cb_drained_end_unquiesce,
     .inactivate      =3D bdrv_child_cb_inactivate,
     .update_filename =3D bdrv_backing_update_filename,
     .can_set_aio_ctx =3D bdrv_child_cb_can_set_aio_ctx,
--=20
2.21.0


