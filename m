Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BB54319C
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 00:22:06 +0200 (CEST)
Received: from localhost ([::1]:35438 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbBd6-00061K-TG
	for lists+qemu-devel@lfdr.de; Wed, 12 Jun 2019 18:22:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45156)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hbBRg-00075u-94
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 18:10:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hbBRf-0007I6-7h
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 18:10:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32802)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hbBRc-0007Fv-Vs; Wed, 12 Jun 2019 18:10:13 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 362A13003A4D;
 Wed, 12 Jun 2019 22:10:12 +0000 (UTC)
Received: from localhost (unknown [10.40.205.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B94247E672;
 Wed, 12 Jun 2019 22:10:11 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Thu, 13 Jun 2019 00:09:24 +0200
Message-Id: <20190612221004.2317-3-mreitz@redhat.com>
In-Reply-To: <20190612221004.2317-1-mreitz@redhat.com>
References: <20190612221004.2317-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Wed, 12 Jun 2019 22:10:12 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v5 02/42] copy-on-read: Support compressed
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
---
 block/copy-on-read.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index 53972b1da3..88e1c1f538 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -114,6 +114,16 @@ static int coroutine_fn cor_co_pdiscard(BlockDriverS=
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
@@ -146,6 +156,7 @@ static BlockDriver bdrv_copy_on_read =3D {
     .bdrv_co_pwritev                    =3D cor_co_pwritev,
     .bdrv_co_pwrite_zeroes              =3D cor_co_pwrite_zeroes,
     .bdrv_co_pdiscard                   =3D cor_co_pdiscard,
+    .bdrv_co_pwritev_compressed         =3D cor_co_pwritev_compressed,
=20
     .bdrv_eject                         =3D cor_eject,
     .bdrv_lock_medium                   =3D cor_lock_medium,
--=20
2.21.0


