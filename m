Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2197E728B
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Oct 2019 14:21:40 +0100 (CET)
Received: from localhost ([::1]:53688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iP4xn-0004Qs-5n
	for lists+qemu-devel@lfdr.de; Mon, 28 Oct 2019 09:21:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51194)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iP3xY-0003kU-Py
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 08:17:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iP3xX-0002NV-DV
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 08:17:20 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:52095
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1iP3xX-0002MZ-5K
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 08:17:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572265038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cQcWinhkCWGpNGRCGIX778zf+/fAN8/KiI2OgoQdaJc=;
 b=hrgeKGLMoUhr1DUp2klZNjdsM+G2giu1NhjbC0iBsmfW+R45jhuADSvs2AX1UDfpwZhsYt
 U8SY7TfpjzbR1U+gKPhJID9wVWPjWX5v2D5a7SwFXHsoSDQ35c6GR9KK1KeJdT6jIBB0z7
 vazRE+bIUpiPMJrvKm8rnnJyXf4OTog=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-ym_DuMvsM3-H66AlGGUwFg-1; Mon, 28 Oct 2019 08:17:14 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F2FA180496E;
 Mon, 28 Oct 2019 12:17:14 +0000 (UTC)
Received: from localhost (ovpn-117-83.ams2.redhat.com [10.36.117.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A952D6084E;
 Mon, 28 Oct 2019 12:17:13 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 62/69] block/cor: Drop cor_co_truncate()
Date: Mon, 28 Oct 2019 13:14:54 +0100
Message-Id: <20191028121501.15279-63-mreitz@redhat.com>
In-Reply-To: <20191028121501.15279-1-mreitz@redhat.com>
References: <20191028121501.15279-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: ym_DuMvsM3-H66AlGGUwFg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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

No other filter driver has a .bdrv_co_truncate() implementation, and
there is no need to because the general block layer code can handle it
just as well.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-id: 20190918095144.955-3-mreitz@redhat.com
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
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
-static int coroutine_fn cor_co_truncate(BlockDriverState *bs, int64_t offs=
et,
-                                        PreallocMode prealloc, Error **err=
p)
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


