Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 575881471CB
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 20:32:35 +0100 (CET)
Received: from localhost ([::1]:35804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuiDS-0006HB-D3
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 14:32:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41097)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iufdd-0004hR-5b
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:47:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iufdb-0006NR-Tr
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:47:25 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:57875
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iufdb-0006NK-RO
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:47:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579798043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4/luSFC0Scb1tJiHVL8JbhKYpBfi5RN4yDfWbpW0TAY=;
 b=Ty4JwjI2z9z5TCY9Q2pQCIo4xZK6BOFjoGb/IdJSQw/2CLeqinkafm5Bv0oYGvGUOfObvZ
 L+TxCSJcmF0IVeAGq2h9nhYRWonk2gcn5fNqgtmc5y3DCMle31aga1hYoybN7wRfmipnli
 E2P5DYXLabAOCf2M/Z+6x68KSPftQQc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-EN46nL4uOXSEQzkyvB-g3w-1; Thu, 23 Jan 2020 11:47:22 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C636100F7AC
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 16:47:20 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-116-110.ams2.redhat.com
 [10.36.116.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6606328DD4;
 Thu, 23 Jan 2020 16:47:19 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	stefanha@redhat.com
Subject: [PULL 025/108] virtiofsd: Send replies to messages
Date: Thu, 23 Jan 2020 16:45:07 +0000
Message-Id: <20200123164630.91498-26-dgilbert@redhat.com>
In-Reply-To: <20200123164630.91498-1-dgilbert@redhat.com>
References: <20200123164630.91498-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: EN46nL4uOXSEQzkyvB-g3w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Route fuse out messages back through the same queue elements
that had the command that triggered the request.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/fuse_lowlevel.c |   4 ++
 tools/virtiofsd/fuse_virtio.c   | 107 ++++++++++++++++++++++++++++++--
 tools/virtiofsd/fuse_virtio.h   |   4 ++
 3 files changed, 111 insertions(+), 4 deletions(-)

diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowleve=
l.c
index af09fa2b94..380d93bd01 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -171,6 +171,10 @@ static int fuse_send_msg(struct fuse_session *se, stru=
ct fuse_chan *ch,
         }
     }
=20
+    if (fuse_lowlevel_is_virtio(se)) {
+        return virtio_send_msg(se, ch, iov, count);
+    }
+
     abort(); /* virtio should have taken it before here */
     return 0;
 }
diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index 3841b20129..05d0e29f12 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -41,6 +41,9 @@ struct fv_QueueInfo {
     /* Our queue index, corresponds to array position */
     int qidx;
     int kick_fd;
+
+    /* The element for the command currently being processed */
+    VuVirtqElement *qe;
 };
=20
 /*
@@ -121,6 +124,105 @@ static void copy_from_iov(struct fuse_buf *buf, size_=
t out_num,
     }
 }
=20
+/*
+ * Copy from one iov to another, the given number of bytes
+ * The caller must have checked sizes.
+ */
+static void copy_iov(struct iovec *src_iov, int src_count,
+                     struct iovec *dst_iov, int dst_count, size_t to_copy)
+{
+    size_t dst_offset =3D 0;
+    /* Outer loop copies 'src' elements */
+    while (to_copy) {
+        assert(src_count);
+        size_t src_len =3D src_iov[0].iov_len;
+        size_t src_offset =3D 0;
+
+        if (src_len > to_copy) {
+            src_len =3D to_copy;
+        }
+        /* Inner loop copies contents of one 'src' to maybe multiple dst. =
*/
+        while (src_len) {
+            assert(dst_count);
+            size_t dst_len =3D dst_iov[0].iov_len - dst_offset;
+            if (dst_len > src_len) {
+                dst_len =3D src_len;
+            }
+
+            memcpy(dst_iov[0].iov_base + dst_offset,
+                   src_iov[0].iov_base + src_offset, dst_len);
+            src_len -=3D dst_len;
+            to_copy -=3D dst_len;
+            src_offset +=3D dst_len;
+            dst_offset +=3D dst_len;
+
+            assert(dst_offset <=3D dst_iov[0].iov_len);
+            if (dst_offset =3D=3D dst_iov[0].iov_len) {
+                dst_offset =3D 0;
+                dst_iov++;
+                dst_count--;
+            }
+        }
+        src_iov++;
+        src_count--;
+    }
+}
+
+/*
+ * Called back by ll whenever it wants to send a reply/message back
+ * The 1st element of the iov starts with the fuse_out_header
+ * 'unique'=3D=3D0 means it's a notify message.
+ */
+int virtio_send_msg(struct fuse_session *se, struct fuse_chan *ch,
+                    struct iovec *iov, int count)
+{
+    VuVirtqElement *elem;
+    VuVirtq *q;
+
+    assert(count >=3D 1);
+    assert(iov[0].iov_len >=3D sizeof(struct fuse_out_header));
+
+    struct fuse_out_header *out =3D iov[0].iov_base;
+    /* TODO: Endianness! */
+
+    size_t tosend_len =3D iov_size(iov, count);
+
+    /* unique =3D=3D 0 is notification, which we don't support */
+    assert(out->unique);
+    /* For virtio we always have ch */
+    assert(ch);
+    elem =3D ch->qi->qe;
+    q =3D &ch->qi->virtio_dev->dev.vq[ch->qi->qidx];
+
+    /* The 'in' part of the elem is to qemu */
+    unsigned int in_num =3D elem->in_num;
+    struct iovec *in_sg =3D elem->in_sg;
+    size_t in_len =3D iov_size(in_sg, in_num);
+    fuse_log(FUSE_LOG_DEBUG, "%s: elem %d: with %d in desc of length %zd\n=
",
+             __func__, elem->index, in_num, in_len);
+
+    /*
+     * The elem should have room for a 'fuse_out_header' (out from fuse)
+     * plus the data based on the len in the header.
+     */
+    if (in_len < sizeof(struct fuse_out_header)) {
+        fuse_log(FUSE_LOG_ERR, "%s: elem %d too short for out_header\n",
+                 __func__, elem->index);
+        return -E2BIG;
+    }
+    if (in_len < tosend_len) {
+        fuse_log(FUSE_LOG_ERR, "%s: elem %d too small for data len %zd\n",
+                 __func__, elem->index, tosend_len);
+        return -E2BIG;
+    }
+
+    copy_iov(iov, count, in_sg, in_num, tosend_len);
+    vu_queue_push(&se->virtio_dev->dev, q, elem, tosend_len);
+    vu_queue_notify(&se->virtio_dev->dev, q);
+
+    return 0;
+}
+
 /* Thread function for individual queues, created when a queue is 'started=
' */
 static void *fv_queue_thread(void *opaque)
 {
@@ -226,13 +328,10 @@ static void *fv_queue_thread(void *opaque)
=20
             /* TODO! Endianness of header */
=20
-            /* TODO: Fixup fuse_send_msg */
             /* TODO: Add checks for fuse_session_exited */
             fuse_session_process_buf_int(se, &fbuf, &ch);
=20
-            /* TODO: vu_queue_push(dev, q, elem, qi->write_count); */
-            vu_queue_notify(dev, q);
-
+            qi->qe =3D NULL;
             free(elem);
             elem =3D NULL;
         }
diff --git a/tools/virtiofsd/fuse_virtio.h b/tools/virtiofsd/fuse_virtio.h
index 23026d6e4c..135a14875a 100644
--- a/tools/virtiofsd/fuse_virtio.h
+++ b/tools/virtiofsd/fuse_virtio.h
@@ -22,4 +22,8 @@ int virtio_session_mount(struct fuse_session *se);
=20
 int virtio_loop(struct fuse_session *se);
=20
+
+int virtio_send_msg(struct fuse_session *se, struct fuse_chan *ch,
+                    struct iovec *iov, int count);
+
 #endif
--=20
2.24.1


