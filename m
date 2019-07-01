Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED3343194
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 00:14:50 +0200 (CEST)
Received: from localhost ([::1]:35388 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbBW5-0001Gm-NM
	for lists+qemu-devel@lfdr.de; Wed, 12 Jun 2019 18:14:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45212)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hbBRk-0007Ao-Jf
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 18:10:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hbBRj-0007P2-8z
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 18:10:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:1652)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hbBRf-0007Hl-Er; Wed, 12 Jun 2019 18:10:15 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B5CC430860B8;
 Wed, 12 Jun 2019 22:10:14 +0000 (UTC)
Received: from localhost (unknown [10.40.205.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 461905DEDF;
 Wed, 12 Jun 2019 22:10:14 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Thu, 13 Jun 2019 00:09:25 +0200
Message-Id: <20190612221004.2317-4-mreitz@redhat.com>
In-Reply-To: <20190612221004.2317-1-mreitz@redhat.com>
References: <20190612221004.2317-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Wed, 12 Jun 2019 22:10:14 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v5 03/42] throttle: Support compressed writes
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

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/throttle.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/block/throttle.c b/block/throttle.c
index f64dcc27b9..de1b6bd7e8 100644
--- a/block/throttle.c
+++ b/block/throttle.c
@@ -152,6 +152,15 @@ static int coroutine_fn throttle_co_pdiscard(BlockDr=
iverState *bs,
     return bdrv_co_pdiscard(bs->file, offset, bytes);
 }
=20
+static int coroutine_fn throttle_co_pwritev_compressed(BlockDriverState =
*bs,
+                                                       uint64_t offset,
+                                                       uint64_t bytes,
+                                                       QEMUIOVector *qio=
v)
+{
+    return throttle_co_pwritev(bs, offset, bytes, qiov,
+                               BDRV_REQ_WRITE_COMPRESSED);
+}
+
 static int throttle_co_flush(BlockDriverState *bs)
 {
     return bdrv_co_flush(bs->file->bs);
@@ -250,6 +259,7 @@ static BlockDriver bdrv_throttle =3D {
=20
     .bdrv_co_pwrite_zeroes              =3D   throttle_co_pwrite_zeroes,
     .bdrv_co_pdiscard                   =3D   throttle_co_pdiscard,
+    .bdrv_co_pwritev_compressed         =3D   throttle_co_pwritev_compre=
ssed,
=20
     .bdrv_recurse_is_first_non_filter   =3D   throttle_recurse_is_first_=
non_filter,
=20
--=20
2.21.0


