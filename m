Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2636410756B
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Nov 2019 17:07:56 +0100 (CET)
Received: from localhost ([::1]:52524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iYBTO-0002Dm-LN
	for lists+qemu-devel@lfdr.de; Fri, 22 Nov 2019 11:07:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47760)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iYBR2-0000CJ-DU
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 11:05:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iYBR0-0002iS-0I
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 11:05:27 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:25155
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1iYBQz-0002hJ-Ri
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 11:05:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574438724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D3OK9Ld0gd/B0T+lw61N3zerjG3eHIwgOUwt+QI4d6s=;
 b=KH4qJO3PwslvpVTHtF8llpYa9fTX2wHbRKpf5U2gAgxfcO5qULmcyUYwAqbYfCTH46lNmU
 UuUFID18o9jjrobZIM+GkoDUBKvMe+SgWy+kyBxf54/as4n7w7JFeGNu2g3QcYvzaJw/RQ
 D6HOcwqJgf/7AQ8R5OFrt9icDbECtBw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-LODmYaM-POGhBk-Qs3u2VA-1; Fri, 22 Nov 2019 11:05:23 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47723188352F;
 Fri, 22 Nov 2019 16:05:22 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-117-252.ams2.redhat.com
 [10.36.117.252])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C5CD100032E;
 Fri, 22 Nov 2019 16:05:20 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 1/8] block: bdrv_co_do_pwrite_zeroes: 64 bit 'bytes'
 parameter
Date: Fri, 22 Nov 2019 17:05:04 +0100
Message-Id: <20191122160511.8377-2-kwolf@redhat.com>
In-Reply-To: <20191122160511.8377-1-kwolf@redhat.com>
References: <20191122160511.8377-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: LODmYaM-POGhBk-Qs3u2VA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

bdrv_co_do_pwrite_zeroes() can already cope with maximum request sizes
by calling the driver in a loop until everything is done. Make the small
remaining change that is necessary to let it accept a 64 bit byte count.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/io.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/block/io.c b/block/io.c
index f75777f5ea..003f4ea38c 100644
--- a/block/io.c
+++ b/block/io.c
@@ -42,7 +42,7 @@
=20
 static void bdrv_parent_cb_resize(BlockDriverState *bs);
 static int coroutine_fn bdrv_co_do_pwrite_zeroes(BlockDriverState *bs,
-    int64_t offset, int bytes, BdrvRequestFlags flags);
+    int64_t offset, int64_t bytes, BdrvRequestFlags flags);
=20
 static void bdrv_parent_drained_begin(BlockDriverState *bs, BdrvChild *ign=
ore,
                                       bool ignore_bds_parents)
@@ -1730,7 +1730,7 @@ int coroutine_fn bdrv_co_preadv_part(BdrvChild *child=
,
 }
=20
 static int coroutine_fn bdrv_co_do_pwrite_zeroes(BlockDriverState *bs,
-    int64_t offset, int bytes, BdrvRequestFlags flags)
+    int64_t offset, int64_t bytes, BdrvRequestFlags flags)
 {
     BlockDriver *drv =3D bs->drv;
     QEMUIOVector qiov;
@@ -1760,7 +1760,7 @@ static int coroutine_fn bdrv_co_do_pwrite_zeroes(Bloc=
kDriverState *bs,
     assert(max_write_zeroes >=3D bs->bl.request_alignment);
=20
     while (bytes > 0 && !ret) {
-        int num =3D bytes;
+        int num =3D MIN(bytes, BDRV_REQUEST_MAX_BYTES);
=20
         /* Align request.  Block drivers can expect the "bulk" of the requ=
est
          * to be aligned, and that unaligned requests do not cross cluster
--=20
2.20.1


