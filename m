Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D465F76190
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jul 2019 11:11:48 +0200 (CEST)
Received: from localhost ([::1]:37593 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqwGQ-00058s-Po
	for lists+qemu-devel@lfdr.de; Fri, 26 Jul 2019 05:11:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60125)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <stefanha@redhat.com>) id 1hqwG2-0003z9-Vd
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 05:11:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1hqwFy-0004NX-NT
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 05:11:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46730)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1hqwFy-0004G9-GP
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 05:11:18 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9D71E5AFE3
 for <qemu-devel@nongnu.org>; Fri, 26 Jul 2019 09:11:16 +0000 (UTC)
Received: from localhost (ovpn-117-212.ams2.redhat.com [10.36.117.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C9C4B101E24A;
 Fri, 26 Jul 2019 09:11:11 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: virtio-fs@redhat.com,
	qemu-devel@nongnu.org
Date: Fri, 26 Jul 2019 10:10:59 +0100
Message-Id: <20190726091103.23503-2-stefanha@redhat.com>
In-Reply-To: <20190726091103.23503-1-stefanha@redhat.com>
References: <20190726091103.23503-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Fri, 26 Jul 2019 09:11:16 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 1/5] virtiofsd: skip unnecessary
 vu_queue_get_avail_bytes()
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
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When debug output is disabled there is no need to calculate the number
of in/out bytes available.

There is also no need to skip a request if there are 0 out bytes.  The
request parsing code already handles invalid requests.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 contrib/virtiofsd/fuse_virtio.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/contrib/virtiofsd/fuse_virtio.c b/contrib/virtiofsd/fuse_vir=
tio.c
index 083e4fc317..d543c6d30f 100644
--- a/contrib/virtiofsd/fuse_virtio.c
+++ b/contrib/virtiofsd/fuse_virtio.c
@@ -507,18 +507,16 @@ static void *fv_queue_thread(void *opaque)
                ret =3D pthread_rwlock_rdlock(&qi->virtio_dev->vu_dispatc=
h_rwlock);
                assert(ret =3D=3D 0); /* there is no possible error case =
*/
=20
-               /* out is from guest, in is too guest */
-               unsigned int in_bytes, out_bytes;
-               vu_queue_get_avail_bytes(dev, q, &in_bytes, &out_bytes, ~=
0, ~0);
+               if (se->debug) {
+                       /* out is from guest, in is too guest */
+                       unsigned int in_bytes, out_bytes;
+                       vu_queue_get_avail_bytes(dev, q, &in_bytes, &out_=
bytes, ~0, ~0);
=20
-               if (se->debug)
                        fuse_debug("%s: Queue %d gave evalue: %zx availab=
le: in: %u out: %u\n",
 				  __func__, qi->qidx, (size_t)evalue, in_bytes,
 				  out_bytes);
-
-               if (!out_bytes) {
-                       goto next;
                }
+
                while (1) {
                        bool allocated_bufv =3D false;
                        struct fuse_bufvec bufv;
@@ -708,7 +706,6 @@ static void *fv_queue_thread(void *opaque)
                        elem =3D NULL;
                 }
=20
-next:
                 pthread_rwlock_unlock(&qi->virtio_dev->vu_dispatch_rwloc=
k);
         }
         pthread_mutex_destroy(&ch.lock);
--=20
2.21.0


