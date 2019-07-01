Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBFA265C8
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 16:31:44 +0200 (CEST)
Received: from localhost ([127.0.0.1]:44309 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTSHP-0000FW-6U
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 10:31:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53112)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1hTSF2-0007Zn-OT
	for qemu-devel@nongnu.org; Wed, 22 May 2019 10:29:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1hTSF1-00058o-Nf
	for qemu-devel@nongnu.org; Wed, 22 May 2019 10:29:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48204)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mreitz@redhat.com>)
	id 1hTSEz-00053S-Eg; Wed, 22 May 2019 10:29:13 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C7BDB6378;
	Wed, 22 May 2019 14:29:06 +0000 (UTC)
Received: from localhost (unknown [10.40.205.176])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 34186795A1;
	Wed, 22 May 2019 14:29:02 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Wed, 22 May 2019 16:28:53 +0200
Message-Id: <20190522142854.22983-2-mreitz@redhat.com>
In-Reply-To: <20190522142854.22983-1-mreitz@redhat.com>
References: <20190522142854.22983-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 22 May 2019 14:29:12 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 1/2] block/io: Delay decrementing the
 quiesce_counter
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When ending a drained section, bdrv_do_drained_end() currently first
decrements the quiesce_counter, and only then actually ends the drain.

The bdrv_drain_invoke(bs, false) call may cause graph changes.  Say the
graph change involves replacing an existing BB's ("blk") BDS
(blk_bs(blk)) by @bs.  Let us introducing the following values:
- bs_oqc =3D old_quiesce_counter
  (so bs->quiesce_counter =3D=3D bs_oqc - 1)
- obs_qc =3D blk_bs(blk)->quiesce_counter (before bdrv_drain_invoke())

Let us assume there is no blk_pthread_unthrottled() involved, so
blk->quiesce_counter =3D=3D obs_qc (before bdrv_drain_invoke()).

Now replacing blk_bs(blk) by @bs will reduce blk->quiesce_counter by
obs_qc (making it 0) and increase it by bs_oqc-1 (making it bs_oqc-1).

bdrv_drain_invoke() returns and we invoke bdrv_parent_drained_end().
This will decrement blk->quiesce_counter by one, so it would be -1 --
were there not an assertion against that in blk_root_drained_end().

We therefore have to keep the quiesce_counter up at least until
bdrv_drain_invoke() returns, so that bdrv_parent_drained_end() does the
right thing for the parents @bs got during bdrv_drain_invoke().

But let us delay it even further, namely until bdrv_parent_drained_end()
returns, because then it mirrors bdrv_do_drained_begin(): There, we
first increment the quiesce_counter, then begin draining the parents,
and then call bdrv_drain_invoke().  It makes sense to let
bdrv_do_drained_end() unravel this exactly in reverse.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/io.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/block/io.c b/block/io.c
index 150358c3b1..0f6ebd001c 100644
--- a/block/io.c
+++ b/block/io.c
@@ -422,11 +422,12 @@ static void bdrv_do_drained_end(BlockDriverState *b=
s, bool recursive,
         return;
     }
     assert(bs->quiesce_counter > 0);
-    old_quiesce_counter =3D atomic_fetch_dec(&bs->quiesce_counter);
=20
     /* Re-enable things in child-to-parent order */
     bdrv_drain_invoke(bs, false);
     bdrv_parent_drained_end(bs, parent, ignore_bds_parents);
+
+    old_quiesce_counter =3D atomic_fetch_dec(&bs->quiesce_counter);
     if (old_quiesce_counter =3D=3D 1) {
         aio_enable_external(bdrv_get_aio_context(bs));
     }
--=20
2.21.0


