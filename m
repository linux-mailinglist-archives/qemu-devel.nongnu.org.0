Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 393E6147208
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 20:46:28 +0100 (CET)
Received: from localhost ([::1]:60500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuiQt-00034P-5X
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 14:46:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41274)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iufdv-0004wX-Ln
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:47:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iufdu-0006Wy-Cb
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:47:43 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:40339
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iufdu-0006Wg-9b
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:47:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579798061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BAgKUoDOCYqWYhUiYqdEzmNdZ2gs3y+kHjopAWZ7RIY=;
 b=YPaBAiBEKsB6LuDKL1qnnLEQUTtkywOGpd4Rzgsz/Q2GcXNHEc3q6Wx0BhKOZElLsm72IR
 7mwk0XZMhRt9oK5mo+ED7csmdrfy0bJKnG2ItLITBfywAM+Sz031DJTikpyn5MdlSD8ImI
 IZLVqkGziChv8Gqrk73uAACydt20h94=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-rxzC8u2KNNijLHIBGrHZGw-1; Thu, 23 Jan 2020 11:47:40 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76710800592
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 16:47:39 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-116-110.ams2.redhat.com
 [10.36.116.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C380A28993;
 Thu, 23 Jan 2020 16:47:38 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	stefanha@redhat.com
Subject: [PULL 042/108] virtiofsd: Pass write iov's all the way through
Date: Thu, 23 Jan 2020 16:45:24 +0000
Message-Id: <20200123164630.91498-43-dgilbert@redhat.com>
In-Reply-To: <20200123164630.91498-1-dgilbert@redhat.com>
References: <20200123164630.91498-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: rxzC8u2KNNijLHIBGrHZGw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Pass the write iov pointing to guest RAM all the way through rather
than copying the data.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
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


