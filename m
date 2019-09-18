Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA43B6102
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Sep 2019 12:03:27 +0200 (CEST)
Received: from localhost ([::1]:56828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAWo1-0001qc-VV
	for lists+qemu-devel@lfdr.de; Wed, 18 Sep 2019 06:03:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59242)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iAWd6-00014j-Rh
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 05:52:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iAWd4-0005dp-P8
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 05:52:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41814)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iAWcx-0005WD-Pe; Wed, 18 Sep 2019 05:52:00 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9E9A43086268;
 Wed, 18 Sep 2019 09:51:58 +0000 (UTC)
Received: from localhost (ovpn-116-168.ams2.redhat.com [10.36.116.168])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1AFF35C221;
 Wed, 18 Sep 2019 09:51:57 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Wed, 18 Sep 2019 11:51:38 +0200
Message-Id: <20190918095144.955-3-mreitz@redhat.com>
In-Reply-To: <20190918095144.955-1-mreitz@redhat.com>
References: <20190918095144.955-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Wed, 18 Sep 2019 09:51:58 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 2/8] block/cor: Drop cor_co_truncate()
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No other filter driver has a .bdrv_co_truncate() implementation, and
there is no need to because the general block layer code can handle it
just as well.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/copy-on-read.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index 6631f30205..e95223d3cb 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -73,13 +73,6 @@ static int64_t cor_getlength(BlockDriverState *bs)
 }
=20
=20
-static int coroutine_fn cor_co_truncate(BlockDriverState *bs, int64_t of=
fset,
-                                        PreallocMode prealloc, Error **e=
rrp)
-{
-    return bdrv_co_truncate(bs->file, offset, prealloc, errp);
-}
-
-
 static int coroutine_fn cor_co_preadv(BlockDriverState *bs,
                                       uint64_t offset, uint64_t bytes,
                                       QEMUIOVector *qiov, int flags)
@@ -139,7 +132,6 @@ static BlockDriver bdrv_copy_on_read =3D {
     .bdrv_child_perm                    =3D cor_child_perm,
=20
     .bdrv_getlength                     =3D cor_getlength,
-    .bdrv_co_truncate                   =3D cor_co_truncate,
=20
     .bdrv_co_preadv                     =3D cor_co_preadv,
     .bdrv_co_pwritev                    =3D cor_co_pwritev,
--=20
2.21.0


