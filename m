Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B85BFD4B
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Apr 2019 17:57:07 +0200 (CEST)
Received: from localhost ([127.0.0.1]:49017 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLV7y-0001nj-2r
	for lists+qemu-devel@lfdr.de; Tue, 30 Apr 2019 11:57:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49070)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hLUv0-0008CD-DY
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 11:43:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hLUuz-0002ET-Dm
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 11:43:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49908)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1hLUuv-0002BD-Id; Tue, 30 Apr 2019 11:43:37 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BF3C12D7FE;
	Tue, 30 Apr 2019 15:43:36 +0000 (UTC)
Received: from linux.fritz.box.com (unknown [10.36.118.15])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EF3D64C7;
	Tue, 30 Apr 2019 15:43:34 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Date: Tue, 30 Apr 2019 17:42:39 +0200
Message-Id: <20190430154244.30083-23-kwolf@redhat.com>
In-Reply-To: <20190430154244.30083-1-kwolf@redhat.com>
References: <20190430154244.30083-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 30 Apr 2019 15:43:36 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 22/27] block/commit: use buffer-based io
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/commit.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/block/commit.c b/block/commit.c
index ba60fef58a..08204fa6f8 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -48,16 +48,15 @@ static int coroutine_fn commit_populate(BlockBackend =
*bs, BlockBackend *base,
                                         void *buf)
 {
     int ret =3D 0;
-    QEMUIOVector qiov =3D QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
=20
     assert(bytes < SIZE_MAX);
=20
-    ret =3D blk_co_preadv(bs, offset, qiov.size, &qiov, 0);
+    ret =3D blk_co_pread(bs, offset, bytes, buf, 0);
     if (ret < 0) {
         return ret;
     }
=20
-    ret =3D blk_co_pwritev(base, offset, qiov.size, &qiov, 0);
+    ret =3D blk_co_pwrite(base, offset, bytes, buf, 0);
     if (ret < 0) {
         return ret;
     }
--=20
2.20.1


