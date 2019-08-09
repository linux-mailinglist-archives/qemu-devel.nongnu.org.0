Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2466387F3A
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Aug 2019 18:15:27 +0200 (CEST)
Received: from localhost ([::1]:60790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hw7Y6-0002Lo-4j
	for lists+qemu-devel@lfdr.de; Fri, 09 Aug 2019 12:15:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56677)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hw7X3-0000JY-1e
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 12:14:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hw7X0-0003s7-Pe
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 12:14:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60956)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hw7Wx-0003pS-P2; Fri, 09 Aug 2019 12:14:15 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1971C307D921;
 Fri,  9 Aug 2019 16:14:14 +0000 (UTC)
Received: from localhost (unknown [10.40.205.179])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AB1FC608C2;
 Fri,  9 Aug 2019 16:14:13 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Fri,  9 Aug 2019 18:13:27 +0200
Message-Id: <20190809161407.11920-3-mreitz@redhat.com>
In-Reply-To: <20190809161407.11920-1-mreitz@redhat.com>
References: <20190809161407.11920-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Fri, 09 Aug 2019 16:14:14 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v6 02/42] copy-on-read: Support compressed
 writes
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
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/copy-on-read.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index 6631f30205..16bdf630b6 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -113,6 +113,16 @@ static int coroutine_fn cor_co_pdiscard(BlockDriverS=
tate *bs,
 }
=20
=20
+static int coroutine_fn cor_co_pwritev_compressed(BlockDriverState *bs,
+                                                  uint64_t offset,
+                                                  uint64_t bytes,
+                                                  QEMUIOVector *qiov)
+{
+    return bdrv_co_pwritev(bs->file, offset, bytes, qiov,
+                           BDRV_REQ_WRITE_COMPRESSED);
+}
+
+
 static void cor_eject(BlockDriverState *bs, bool eject_flag)
 {
     bdrv_eject(bs->file->bs, eject_flag);
@@ -145,6 +155,7 @@ static BlockDriver bdrv_copy_on_read =3D {
     .bdrv_co_pwritev                    =3D cor_co_pwritev,
     .bdrv_co_pwrite_zeroes              =3D cor_co_pwrite_zeroes,
     .bdrv_co_pdiscard                   =3D cor_co_pdiscard,
+    .bdrv_co_pwritev_compressed         =3D cor_co_pwritev_compressed,
=20
     .bdrv_eject                         =3D cor_eject,
     .bdrv_lock_medium                   =3D cor_lock_medium,
--=20
2.21.0


