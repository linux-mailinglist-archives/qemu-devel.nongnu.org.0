Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 723E6EC105
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Nov 2019 11:08:02 +0100 (CET)
Received: from localhost ([::1]:37216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iQTqb-0003nb-Gu
	for lists+qemu-devel@lfdr.de; Fri, 01 Nov 2019 06:08:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40377)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iQTjX-000743-2l
 for qemu-devel@nongnu.org; Fri, 01 Nov 2019 06:00:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iQTjV-0005FX-Gh
 for qemu-devel@nongnu.org; Fri, 01 Nov 2019 06:00:42 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:33183
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1iQTjV-0005Ax-CQ
 for qemu-devel@nongnu.org; Fri, 01 Nov 2019 06:00:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572602440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tK6nGHtnBLwNSehBsJRlYIHpvmXJp/Go8FcoP4eXX78=;
 b=R1sIabNKXst6FGGuTfK8UnjtOlLOiiIYERCrCSLNBSsoYlwn0GYj1u8g/f6gime8Qr3A90
 ZVD+OsE62kgacSl6T6x7769RUDRBK6xhKtxP2TyuYI+ppDMG7RmmoteKEmAxZq/vJ5FvAB
 x+TsfvSsR108ty3sRyuBgzYb99hgedg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-2yKPsUPFNHuyRrIFuM5DRg-1; Fri, 01 Nov 2019 06:00:38 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BA1C800D49;
 Fri,  1 Nov 2019 10:00:37 +0000 (UTC)
Received: from localhost (ovpn-117-28.ams2.redhat.com [10.36.117.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B0DC11001B07;
 Fri,  1 Nov 2019 10:00:33 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH for-4.2 2/4] block: Make wait/mark serialising requests public
Date: Fri,  1 Nov 2019 11:00:17 +0100
Message-Id: <20191101100019.9512-3-mreitz@redhat.com>
In-Reply-To: <20191101100019.9512-1-mreitz@redhat.com>
References: <20191101100019.9512-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 2yKPsUPFNHuyRrIFuM5DRg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
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
Cc: Kevin Wolf <kwolf@redhat.com>, Anton Nefedov <anton.nefedov@virtuozzo.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make both bdrv_mark_request_serialising() and
bdrv_wait_serialising_requests() public so they can be used from block
drivers.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 include/block/block_int.h |  3 +++
 block/io.c                | 24 ++++++++++++------------
 2 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 02dc0034a2..32fa323b63 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -999,6 +999,9 @@ extern unsigned int bdrv_drain_all_count;
 void bdrv_apply_subtree_drain(BdrvChild *child, BlockDriverState *new_pare=
nt);
 void bdrv_unapply_subtree_drain(BdrvChild *child, BlockDriverState *old_pa=
rent);
=20
+bool coroutine_fn bdrv_wait_serialising_requests(BdrvTrackedRequest *self)=
;
+void bdrv_mark_request_serialising(BdrvTrackedRequest *req, uint64_t align=
);
+
 int get_tmp_filename(char *filename, int size);
 BlockDriver *bdrv_probe_all(const uint8_t *buf, int buf_size,
                             const char *filename);
diff --git a/block/io.c b/block/io.c
index 02659f994d..039c0d49c9 100644
--- a/block/io.c
+++ b/block/io.c
@@ -715,7 +715,7 @@ static void tracked_request_begin(BdrvTrackedRequest *r=
eq,
     qemu_co_mutex_unlock(&bs->reqs_lock);
 }
=20
-static void mark_request_serialising(BdrvTrackedRequest *req, uint64_t ali=
gn)
+void bdrv_mark_request_serialising(BdrvTrackedRequest *req, uint64_t align=
)
 {
     int64_t overlap_offset =3D req->offset & ~(align - 1);
     uint64_t overlap_bytes =3D ROUND_UP(req->offset + req->bytes, align)
@@ -805,7 +805,7 @@ void bdrv_dec_in_flight(BlockDriverState *bs)
     bdrv_wakeup(bs);
 }
=20
-static bool coroutine_fn wait_serialising_requests(BdrvTrackedRequest *sel=
f)
+bool coroutine_fn bdrv_wait_serialising_requests(BdrvTrackedRequest *self)
 {
     BlockDriverState *bs =3D self->bs;
     BdrvTrackedRequest *req;
@@ -1437,14 +1437,14 @@ static int coroutine_fn bdrv_aligned_preadv(BdrvChi=
ld *child,
          * with each other for the same cluster.  For example, in copy-on-=
read
          * it ensures that the CoR read and write operations are atomic an=
d
          * guest writes cannot interleave between them. */
-        mark_request_serialising(req, bdrv_get_cluster_size(bs));
+        bdrv_mark_request_serialising(req, bdrv_get_cluster_size(bs));
     }
=20
     /* BDRV_REQ_SERIALISING is only for write operation */
     assert(!(flags & BDRV_REQ_SERIALISING));
=20
     if (!(flags & BDRV_REQ_NO_SERIALISING)) {
-        wait_serialising_requests(req);
+        bdrv_wait_serialising_requests(req);
     }
=20
     if (flags & BDRV_REQ_COPY_ON_READ) {
@@ -1841,10 +1841,10 @@ bdrv_co_write_req_prepare(BdrvChild *child, int64_t=
 offset, uint64_t bytes,
     assert(!(flags & ~BDRV_REQ_MASK));
=20
     if (flags & BDRV_REQ_SERIALISING) {
-        mark_request_serialising(req, bdrv_get_cluster_size(bs));
+        bdrv_mark_request_serialising(req, bdrv_get_cluster_size(bs));
     }
=20
-    waited =3D wait_serialising_requests(req);
+    waited =3D bdrv_wait_serialising_requests(req);
=20
     assert(!waited || !req->serialising ||
            is_request_serialising_and_aligned(req));
@@ -2008,8 +2008,8 @@ static int coroutine_fn bdrv_co_do_zero_pwritev(BdrvC=
hild *child,
=20
     padding =3D bdrv_init_padding(bs, offset, bytes, &pad);
     if (padding) {
-        mark_request_serialising(req, align);
-        wait_serialising_requests(req);
+        bdrv_mark_request_serialising(req, align);
+        bdrv_wait_serialising_requests(req);
=20
         bdrv_padding_rmw_read(child, req, &pad, true);
=20
@@ -2111,8 +2111,8 @@ int coroutine_fn bdrv_co_pwritev_part(BdrvChild *chil=
d,
     }
=20
     if (bdrv_pad_request(bs, &qiov, &qiov_offset, &offset, &bytes, &pad)) =
{
-        mark_request_serialising(&req, align);
-        wait_serialising_requests(&req);
+        bdrv_mark_request_serialising(&req, align);
+        bdrv_wait_serialising_requests(&req);
         bdrv_padding_rmw_read(child, &req, &pad, false);
     }
=20
@@ -3205,7 +3205,7 @@ static int coroutine_fn bdrv_co_copy_range_internal(
         /* BDRV_REQ_SERIALISING is only for write operation */
         assert(!(read_flags & BDRV_REQ_SERIALISING));
         if (!(read_flags & BDRV_REQ_NO_SERIALISING)) {
-            wait_serialising_requests(&req);
+            bdrv_wait_serialising_requests(&req);
         }
=20
         ret =3D src->bs->drv->bdrv_co_copy_range_from(src->bs,
@@ -3336,7 +3336,7 @@ int coroutine_fn bdrv_co_truncate(BdrvChild *child, i=
nt64_t offset, bool exact,
      * new area, we need to make sure that no write requests are made to i=
t
      * concurrently or they might be overwritten by preallocation. */
     if (new_bytes) {
-        mark_request_serialising(&req, 1);
+        bdrv_mark_request_serialising(&req, 1);
     }
     if (bs->read_only) {
         error_setg(errp, "Image is read-only");
--=20
2.21.0


