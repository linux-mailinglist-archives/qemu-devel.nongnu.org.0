Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7336F1624BB
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Feb 2020 11:40:00 +0100 (CET)
Received: from localhost ([::1]:60626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j40IJ-00029g-HP
	for lists+qemu-devel@lfdr.de; Tue, 18 Feb 2020 05:39:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52147)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1j40Ds-0001WU-Fu
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 05:35:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1j40Dr-0007Pk-D4
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 05:35:24 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:43403
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1j40Dr-0007PM-85
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 05:35:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582022122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lyBO0LHcnSgut5s8ijX92IhUO31aC59wxCEUTOSlOFo=;
 b=Nh1xrKljuRz6KXOY5NcxkprUCHxxox2jzs++JLakz9FqnkBf+1d4JNGzpInQvEExnUZVS9
 L/VElxOssoR9Odt3ezlJ6Xn6BaNvFKsqv88VFF6PPkwZi/rw+mFFxUvFz2ecf3GkQsj5lI
 nRsTJ2/tvu8LJx+3s5t1Q666rxfj+Co=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-sNFd9L_xMNO1bsHI031s7A-1; Tue, 18 Feb 2020 05:35:19 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22AD31005514;
 Tue, 18 Feb 2020 10:35:18 +0000 (UTC)
Received: from localhost (unknown [10.36.118.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 93AF019481;
 Tue, 18 Feb 2020 10:35:17 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 07/19] blkverify: Implement .bdrv_recurse_can_replace()
Date: Tue, 18 Feb 2020 11:34:42 +0100
Message-Id: <20200218103454.296704-8-mreitz@redhat.com>
In-Reply-To: <20200218103454.296704-1-mreitz@redhat.com>
References: <20200218103454.296704-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: sNFd9L_xMNO1bsHI031s7A-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
 block/blkverify.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/block/blkverify.c b/block/blkverify.c
index 304b0a1368..0add3ab483 100644
--- a/block/blkverify.c
+++ b/block/blkverify.c
@@ -282,6 +282,20 @@ static bool blkverify_recurse_is_first_non_filter(Bloc=
kDriverState *bs,
     return bdrv_recurse_is_first_non_filter(s->test_file->bs, candidate);
 }
=20
+static bool blkverify_recurse_can_replace(BlockDriverState *bs,
+                                          BlockDriverState *to_replace)
+{
+    BDRVBlkverifyState *s =3D bs->opaque;
+
+    /*
+     * blkverify quits the whole qemu process if there is a mismatch
+     * between bs->file->bs and s->test_file->bs.  Therefore, we know
+     * know that both must match bs and we can recurse down to either.
+     */
+    return bdrv_recurse_can_replace(bs->file->bs, to_replace) ||
+           bdrv_recurse_can_replace(s->test_file->bs, to_replace);
+}
+
 static void blkverify_refresh_filename(BlockDriverState *bs)
 {
     BDRVBlkverifyState *s =3D bs->opaque;
@@ -328,6 +342,7 @@ static BlockDriver bdrv_blkverify =3D {
=20
     .is_filter                        =3D true,
     .bdrv_recurse_is_first_non_filter =3D blkverify_recurse_is_first_non_f=
ilter,
+    .bdrv_recurse_can_replace         =3D blkverify_recurse_can_replace,
 };
=20
 static void bdrv_blkverify_init(void)
--=20
2.24.1


