Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BC4B940A
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Sep 2019 17:34:05 +0200 (CEST)
Received: from localhost ([::1]:60920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iBKv5-0003mb-SU
	for lists+qemu-devel@lfdr.de; Fri, 20 Sep 2019 11:34:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43921)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iBKph-0000m7-Vv
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 11:28:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iBKpg-0004UH-Ur
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 11:28:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47246)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iBKpc-0004PL-MJ; Fri, 20 Sep 2019 11:28:26 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E5CD3328E;
 Fri, 20 Sep 2019 15:28:22 +0000 (UTC)
Received: from localhost (unknown [10.40.205.102])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 80DC9600C6;
 Fri, 20 Sep 2019 15:28:22 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 07/22] blkverify: Implement .bdrv_recurse_can_replace()
Date: Fri, 20 Sep 2019 17:27:49 +0200
Message-Id: <20190920152804.12875-8-mreitz@redhat.com>
In-Reply-To: <20190920152804.12875-1-mreitz@redhat.com>
References: <20190920152804.12875-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Fri, 20 Sep 2019 15:28:22 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alberto Garcia <berto@igalia.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/blkverify.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/block/blkverify.c b/block/blkverify.c
index 304b0a1368..0add3ab483 100644
--- a/block/blkverify.c
+++ b/block/blkverify.c
@@ -282,6 +282,20 @@ static bool blkverify_recurse_is_first_non_filter(Bl=
ockDriverState *bs,
     return bdrv_recurse_is_first_non_filter(s->test_file->bs, candidate)=
;
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
     .bdrv_recurse_is_first_non_filter =3D blkverify_recurse_is_first_non=
_filter,
+    .bdrv_recurse_can_replace         =3D blkverify_recurse_can_replace,
 };
=20
 static void bdrv_blkverify_init(void)
--=20
2.21.0


