Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFF6143DA6
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 14:07:59 +0100 (CET)
Received: from localhost ([::1]:53554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ittGA-0006To-Fl
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 08:07:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51729)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1itsdf-0008L7-07
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:28:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1itsdc-00032w-1v
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:28:10 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:36644
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1itsdb-00032Y-UJ
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:28:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579609687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j6jddntzfV/KdoxOqs4RBscG7vauLrJZ2UmFppe27Gw=;
 b=O2eNZTgVIWcBDsFRlMexqjVQstbZYoCFQNnbl3IbyEdvvoGmhLoAiuj38exltxxTMwbaM7
 mgM1Qd7KTMHBx8lIXXfuAHDxQH05WoAqK8NBPxKoI7YBOrtlkH3eyLg3a/bIULB0VsbV+Q
 FGSDscdlRVmyxdm2TRD9ZFlTiMWb0oE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-wrWvbZxEP06h84132n1-vw-1; Tue, 21 Jan 2020 07:28:05 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1169800D5A;
 Tue, 21 Jan 2020 12:28:04 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.118.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7986660BE0;
 Tue, 21 Jan 2020 12:28:00 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com,
 berrange@redhat.com, slp@redhat.com, philmd@redhat.com
Subject: [PATCH v2 041/109] virtiofsd: Pass write iov's all the way through
Date: Tue, 21 Jan 2020 12:23:25 +0000
Message-Id: <20200121122433.50803-42-dgilbert@redhat.com>
In-Reply-To: <20200121122433.50803-1-dgilbert@redhat.com>
References: <20200121122433.50803-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: wrWvbZxEP06h84132n1-vw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: m.mizuma@jp.fujitsu.com, misono.tomohiro@jp.fujitsu.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Pass the write iov pointing to guest RAM all the way through rather
than copying the data.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
---
 tools/virtiofsd/fuse_virtio.c | 79 ++++++++++++++++++++++++++++++++---
 1 file changed, 73 insertions(+), 6 deletions(-)

diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index fd588a4829..872968f2c8 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -454,6 +454,10 @@ static void *fv_queue_thread(void *opaque)
                  __func__, qi->qidx, (size_t)evalue, in_bytes, out_bytes);
=20
         while (1) {
+            bool allocated_bufv =3D false;
+            struct fuse_bufvec bufv;
+            struct fuse_bufvec *pbufv;
+
             /*
              * An element contains one request and the space to send our
              * response They're spread over multiple descriptors in a
@@ -495,14 +499,76 @@ static void *fv_queue_thread(void *opaque)
                          __func__, elem->index);
                 assert(0); /* TODO */
             }
-            copy_from_iov(&fbuf, out_num, out_sg);
-            fbuf.size =3D out_len;
+            /* Copy just the first element and look at it */
+            copy_from_iov(&fbuf, 1, out_sg);
+
+            if (out_num > 2 &&
+                out_sg[0].iov_len =3D=3D sizeof(struct fuse_in_header) &&
+                ((struct fuse_in_header *)fbuf.mem)->opcode =3D=3D FUSE_WR=
ITE &&
+                out_sg[1].iov_len =3D=3D sizeof(struct fuse_write_in)) {
+                /*
+                 * For a write we don't actually need to copy the
+                 * data, we can just do it straight out of guest memory
+                 * but we must still copy the headers in case the guest
+                 * was nasty and changed them while we were using them.
+                 */
+                fuse_log(FUSE_LOG_DEBUG, "%s: Write special case\n", __fun=
c__);
+
+                /* copy the fuse_write_in header after the fuse_in_header =
*/
+                fbuf.mem +=3D out_sg->iov_len;
+                copy_from_iov(&fbuf, 1, out_sg + 1);
+                fbuf.mem -=3D out_sg->iov_len;
+                fbuf.size =3D out_sg[0].iov_len + out_sg[1].iov_len;
+
+                /* Allocate the bufv, with space for the rest of the iov *=
/
+                allocated_bufv =3D true;
+                pbufv =3D malloc(sizeof(struct fuse_bufvec) +
+                               sizeof(struct fuse_buf) * (out_num - 2));
+                if (!pbufv) {
+                    vu_queue_unpop(dev, q, elem, 0);
+                    free(elem);
+                    fuse_log(FUSE_LOG_ERR, "%s: pbufv malloc failed\n",
+                             __func__);
+                    goto out;
+                }
+
+                pbufv->count =3D 1;
+                pbufv->buf[0] =3D fbuf;
+
+                size_t iovindex, pbufvindex;
+                iovindex =3D 2; /* 2 headers, separate iovs */
+                pbufvindex =3D 1; /* 2 headers, 1 fusebuf */
+
+                for (; iovindex < out_num; iovindex++, pbufvindex++) {
+                    pbufv->count++;
+                    pbufv->buf[pbufvindex].pos =3D ~0; /* Dummy */
+                    pbufv->buf[pbufvindex].flags =3D 0;
+                    pbufv->buf[pbufvindex].mem =3D out_sg[iovindex].iov_ba=
se;
+                    pbufv->buf[pbufvindex].size =3D out_sg[iovindex].iov_l=
en;
+                }
+            } else {
+                /* Normal (non fast write) path */
+
+                /* Copy the rest of the buffer */
+                fbuf.mem +=3D out_sg->iov_len;
+                copy_from_iov(&fbuf, out_num - 1, out_sg + 1);
+                fbuf.mem -=3D out_sg->iov_len;
+                fbuf.size =3D out_len;
=20
-            /* TODO! Endianness of header */
+                /* TODO! Endianness of header */
=20
-            /* TODO: Add checks for fuse_session_exited */
-            struct fuse_bufvec bufv =3D { .buf[0] =3D fbuf, .count =3D 1 }=
;
-            fuse_session_process_buf_int(se, &bufv, &ch);
+                /* TODO: Add checks for fuse_session_exited */
+                bufv.buf[0] =3D fbuf;
+                bufv.count =3D 1;
+                pbufv =3D &bufv;
+            }
+            pbufv->idx =3D 0;
+            pbufv->off =3D 0;
+            fuse_session_process_buf_int(se, pbufv, &ch);
+
+            if (allocated_bufv) {
+                free(pbufv);
+            }
=20
             if (!qi->reply_sent) {
                 fuse_log(FUSE_LOG_DEBUG, "%s: elem %d no reply sent\n",
@@ -516,6 +582,7 @@ static void *fv_queue_thread(void *opaque)
             elem =3D NULL;
         }
     }
+out:
     pthread_mutex_destroy(&ch.lock);
     free(fbuf.mem);
=20
--=20
2.24.1


