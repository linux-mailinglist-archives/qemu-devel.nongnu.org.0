Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 199E3949CD
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 18:26:44 +0200 (CEST)
Received: from localhost ([::1]:55286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzkUU-0004Cg-Q1
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 12:26:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35347)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1hzkLr-0002uK-G9
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 12:17:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hzkLq-0006JY-3r
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 12:17:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58764)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hzkLn-0006II-U9; Mon, 19 Aug 2019 12:17:44 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 37837106E970;
 Mon, 19 Aug 2019 16:17:43 +0000 (UTC)
Received: from localhost (ovpn-204-64.brq.redhat.com [10.40.204.64])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C5AE11DB;
 Mon, 19 Aug 2019 16:17:42 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Mon, 19 Aug 2019 18:17:12 +0200
Message-Id: <20190819161723.7746-7-mreitz@redhat.com>
In-Reply-To: <20190819161723.7746-1-mreitz@redhat.com>
References: <20190819161723.7746-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.66]); Mon, 19 Aug 2019 16:17:43 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 06/17] block: Use bdrv_has_zero_init_truncate()
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

vhdx and parallels call bdrv_has_zero_init() when they do not really
care about an image's post-create state but only about what happens when
you grow an image.  That is a bit ugly, and also overly safe when
growing preallocated images without preallocating the new areas.

Let them use bdrv_has_zero_init_truncate() instead.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-id: 20190724171239.8764-6-mreitz@redhat.com
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
[mreitz: Added commit message]
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/parallels.c | 2 +-
 block/vhdx.c      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 00fae125d1..7cd2714b69 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -835,7 +835,7 @@ static int parallels_open(BlockDriverState *bs, QDict=
 *options, int flags,
         goto fail_options;
     }
=20
-    if (!bdrv_has_zero_init(bs->file->bs)) {
+    if (!bdrv_has_zero_init_truncate(bs->file->bs)) {
         s->prealloc_mode =3D PRL_PREALLOC_MODE_FALLOCATE;
     }
=20
diff --git a/block/vhdx.c b/block/vhdx.c
index d6070b6fa8..a02d1c99a7 100644
--- a/block/vhdx.c
+++ b/block/vhdx.c
@@ -1282,7 +1282,7 @@ static coroutine_fn int vhdx_co_writev(BlockDriverS=
tate *bs, int64_t sector_num,
                 /* Queue another write of zero buffers if the underlying=
 file
                  * does not zero-fill on file extension */
=20
-                if (bdrv_has_zero_init(bs->file->bs) =3D=3D 0) {
+                if (bdrv_has_zero_init_truncate(bs->file->bs) =3D=3D 0) =
{
                     use_zero_buffers =3D true;
=20
                     /* zero fill the front, if any */
--=20
2.21.0


