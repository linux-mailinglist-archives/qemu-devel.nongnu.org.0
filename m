Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E4475344
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jul 2019 17:55:51 +0200 (CEST)
Received: from localhost ([::1]:33280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqg5u-0007jj-Ix
	for lists+qemu-devel@lfdr.de; Thu, 25 Jul 2019 11:55:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54049)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hqg5S-0006Z1-FB
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 11:55:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hqg5R-000593-Ie
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 11:55:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36940)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hqg5P-000583-Ie; Thu, 25 Jul 2019 11:55:19 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DD01C81F10;
 Thu, 25 Jul 2019 15:55:18 +0000 (UTC)
Received: from localhost (ovpn-117-225.ams2.redhat.com [10.36.117.225])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5904C5DE80;
 Thu, 25 Jul 2019 15:55:18 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Thu, 25 Jul 2019 17:55:10 +0200
Message-Id: <20190725155512.9827-2-mreitz@redhat.com>
In-Reply-To: <20190725155512.9827-1-mreitz@redhat.com>
References: <20190725155512.9827-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Thu, 25 Jul 2019 15:55:18 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 1/3] vdi: Make block_status recurse for fixed
 images
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Fixes: 69f47505ee66afaa513305de0c1895a224e52c45
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/vdi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/block/vdi.c b/block/vdi.c
index b9845a4cbd..40d40c34d5 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -542,7 +542,8 @@ static int coroutine_fn vdi_co_block_status(BlockDriv=
erState *bs,
     *map =3D s->header.offset_data + (uint64_t)bmap_entry * s->block_siz=
e +
         index_in_block;
     *file =3D bs->file->bs;
-    return BDRV_BLOCK_DATA | BDRV_BLOCK_OFFSET_VALID;
+    return BDRV_BLOCK_DATA | BDRV_BLOCK_OFFSET_VALID |
+        (s->header.image_type =3D=3D VDI_TYPE_STATIC ? BDRV_BLOCK_RECURS=
E : 0);
 }
=20
 static int coroutine_fn
--=20
2.21.0


