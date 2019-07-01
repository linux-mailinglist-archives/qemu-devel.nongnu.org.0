Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 615E61323C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 May 2019 18:32:41 +0200 (CEST)
Received: from localhost ([127.0.0.1]:43600 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMb72-0004O8-IK
	for lists+qemu-devel@lfdr.de; Fri, 03 May 2019 12:32:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48780)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1hMb51-0003Ln-6V
	for qemu-devel@nongnu.org; Fri, 03 May 2019 12:30:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1hMb50-0005Iv-9D
	for qemu-devel@nongnu.org; Fri, 03 May 2019 12:30:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:11837)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sgarzare@redhat.com>)
	id 1hMb4y-00059c-3r; Fri, 03 May 2019 12:30:32 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 48BCB90B18;
	Fri,  3 May 2019 16:30:31 +0000 (UTC)
Received: from steredhat.redhat.com (unknown [10.36.118.31])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CC5785C231;
	Fri,  3 May 2019 16:30:29 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  3 May 2019 18:30:28 +0200
Message-Id: <20190503163028.213823-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 03 May 2019 16:30:31 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2] block/rbd: increase dynamically the image
 size
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
Cc: Kevin Wolf <kwolf@redhat.com>, Josh Durgin <jdurgin@redhat.com>,
	qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RBD APIs don't allow us to write more than the size set with
rbd_create() or rbd_resize().
In order to support growing images (eg. qcow2), we resize the
image before write operations that exceed the current size.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
v2:
  - use bs->total_sectors instead of adding a new field [Kevin]
  - resize the image only during write operation [Kevin]
    for read operation, the bdrv_aligned_preadv() already handles reads
    that exceed the length returned by bdrv_getlength(), so IMHO we can
    avoid to handle it in the rbd driver
---
 block/rbd.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/block/rbd.c b/block/rbd.c
index 0c549c9935..613e8f4982 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -934,13 +934,25 @@ static BlockAIOCB *rbd_start_aio(BlockDriverState *=
bs,
     }
=20
     switch (cmd) {
-    case RBD_AIO_WRITE:
+    case RBD_AIO_WRITE: {
+        /*
+         * RBD APIs don't allow us to write more than actual size, so in=
 order
+         * to support growing images, we resize the image before write
+         * operations that exceed the current size.
+         */
+        if (off + size > bs->total_sectors * BDRV_SECTOR_SIZE) {
+            r =3D rbd_resize(s->image, off + size);
+            if (r < 0) {
+                goto failed_completion;
+            }
+        }
 #ifdef LIBRBD_SUPPORTS_IOVEC
             r =3D rbd_aio_writev(s->image, qiov->iov, qiov->niov, off, c=
);
 #else
             r =3D rbd_aio_write(s->image, off, size, rcb->buf, c);
 #endif
         break;
+    }
     case RBD_AIO_READ:
 #ifdef LIBRBD_SUPPORTS_IOVEC
             r =3D rbd_aio_readv(s->image, qiov->iov, qiov->niov, off, c)=
;
--=20
2.20.1


