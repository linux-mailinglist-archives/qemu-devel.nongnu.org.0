Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAAC147276
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 21:16:22 +0100 (CET)
Received: from localhost ([::1]:33166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuitp-0005YB-7k
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 15:16:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42685)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iuff5-0006H8-UI
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:48:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iuff3-0000Fe-6M
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:48:55 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:31385
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iuff2-0000EH-32
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:48:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579798131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QI0z+SHu3+O7I/SzHjc7y9nEf+OUeQPwBPC7ev0Fn/k=;
 b=JtFxbesx6f3ODyZOD0pY2kx2SvYVNRg9aifvGY5Elb86eD1a6mhMWTkCD15P7I7P3LUFLz
 40fZnmSR007Uub/tv9karxPOvOYr8Qq+dGy4uhZ6pND3kJ5mLS3mNi9H5XkWUlGLh4ecWb
 LUbmJQAfp39GoVKlQD19QuKJ438IdqM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-HS_nOYioON6zu01NN5zS_w-1; Thu, 23 Jan 2020 11:48:50 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D1FB1005513
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 16:48:49 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-116-110.ams2.redhat.com
 [10.36.116.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78FFC19C69;
 Thu, 23 Jan 2020 16:48:48 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	stefanha@redhat.com
Subject: [PULL 101/108] virtiofsd: process requests in a thread pool
Date: Thu, 23 Jan 2020 16:46:23 +0000
Message-Id: <20200123164630.91498-102-dgilbert@redhat.com>
In-Reply-To: <20200123164630.91498-1-dgilbert@redhat.com>
References: <20200123164630.91498-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: HS_nOYioON6zu01NN5zS_w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.120
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

From: Stefan Hajnoczi <stefanha@redhat.com>

Introduce a thread pool so that fv_queue_thread() just pops
VuVirtqElements and hands them to the thread pool.  For the time being
only one worker thread is allowed since passthrough_ll.c is not
thread-safe yet.  Future patches will lift this restriction so that
multiple FUSE requests can be processed in parallel.

The main new concept is struct FVRequest, which contains both
VuVirtqElement and struct fuse_chan.  We now have fv_VuDev for a device,
fv_QueueInfo for a virtqueue, and FVRequest for a request.  Some of
fv_QueueInfo's fields are moved into FVRequest because they are
per-request.  The name FVRequest conforms to QEMU coding style and I
expect the struct fv_* types will be renamed in a future refactoring.

This patch series is not optimal.  fbuf reuse is dropped so each request
does malloc(se->bufsize), but there is no clean and cheap way to keep
this with a thread pool.  The vq_lock mutex is held for longer than
necessary, especially during the eventfd_write() syscall.  Performance
can be improved in the future.

prctl(2) had to be added to the seccomp whitelist because glib invokes
it.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/fuse_virtio.c | 359 +++++++++++++++++++---------------
 1 file changed, 201 insertions(+), 158 deletions(-)

diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index f6242f9338..0dcf2ef57a 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -22,6 +22,7 @@
=20
 #include <assert.h>
 #include <errno.h>
+#include <glib.h>
 #include <stdint.h>
 #include <stdio.h>
 #include <stdlib.h>
@@ -37,17 +38,28 @@
 struct fv_VuDev;
 struct fv_QueueInfo {
     pthread_t thread;
+    /*
+     * This lock protects the VuVirtq preventing races between
+     * fv_queue_thread() and fv_queue_worker().
+     */
+    pthread_mutex_t vq_lock;
+
     struct fv_VuDev *virtio_dev;
=20
     /* Our queue index, corresponds to array position */
     int qidx;
     int kick_fd;
     int kill_fd; /* For killing the thread */
+};
=20
-    /* The element for the command currently being processed */
-    VuVirtqElement *qe;
+/* A FUSE request */
+typedef struct {
+    VuVirtqElement elem;
+    struct fuse_chan ch;
+
+    /* Used to complete requests that involve no reply */
     bool reply_sent;
-};
+} FVRequest;
=20
 /*
  * We pass the dev element into libvhost-user
@@ -191,8 +203,11 @@ static void copy_iov(struct iovec *src_iov, int src_co=
unt,
 int virtio_send_msg(struct fuse_session *se, struct fuse_chan *ch,
                     struct iovec *iov, int count)
 {
-    VuVirtqElement *elem;
-    VuVirtq *q;
+    FVRequest *req =3D container_of(ch, FVRequest, ch);
+    struct fv_QueueInfo *qi =3D ch->qi;
+    VuDev *dev =3D &se->virtio_dev->dev;
+    VuVirtq *q =3D vu_get_queue(dev, qi->qidx);
+    VuVirtqElement *elem =3D &req->elem;
     int ret =3D 0;
=20
     assert(count >=3D 1);
@@ -205,11 +220,7 @@ int virtio_send_msg(struct fuse_session *se, struct fu=
se_chan *ch,
=20
     /* unique =3D=3D 0 is notification, which we don't support */
     assert(out->unique);
-    /* For virtio we always have ch */
-    assert(ch);
-    assert(!ch->qi->reply_sent);
-    elem =3D ch->qi->qe;
-    q =3D &ch->qi->virtio_dev->dev.vq[ch->qi->qidx];
+    assert(!req->reply_sent);
=20
     /* The 'in' part of the elem is to qemu */
     unsigned int in_num =3D elem->in_num;
@@ -236,9 +247,15 @@ int virtio_send_msg(struct fuse_session *se, struct fu=
se_chan *ch,
     }
=20
     copy_iov(iov, count, in_sg, in_num, tosend_len);
-    vu_queue_push(&se->virtio_dev->dev, q, elem, tosend_len);
-    vu_queue_notify(&se->virtio_dev->dev, q);
-    ch->qi->reply_sent =3D true;
+
+    pthread_rwlock_rdlock(&qi->virtio_dev->vu_dispatch_rwlock);
+    pthread_mutex_lock(&qi->vq_lock);
+    vu_queue_push(dev, q, elem, tosend_len);
+    vu_queue_notify(dev, q);
+    pthread_mutex_unlock(&qi->vq_lock);
+    pthread_rwlock_unlock(&qi->virtio_dev->vu_dispatch_rwlock);
+
+    req->reply_sent =3D true;
=20
 err:
     return ret;
@@ -254,9 +271,12 @@ int virtio_send_data_iov(struct fuse_session *se, stru=
ct fuse_chan *ch,
                          struct iovec *iov, int count, struct fuse_bufvec =
*buf,
                          size_t len)
 {
+    FVRequest *req =3D container_of(ch, FVRequest, ch);
+    struct fv_QueueInfo *qi =3D ch->qi;
+    VuDev *dev =3D &se->virtio_dev->dev;
+    VuVirtq *q =3D vu_get_queue(dev, qi->qidx);
+    VuVirtqElement *elem =3D &req->elem;
     int ret =3D 0;
-    VuVirtqElement *elem;
-    VuVirtq *q;
=20
     assert(count >=3D 1);
     assert(iov[0].iov_len >=3D sizeof(struct fuse_out_header));
@@ -275,11 +295,7 @@ int virtio_send_data_iov(struct fuse_session *se, stru=
ct fuse_chan *ch,
     /* unique =3D=3D 0 is notification which we don't support */
     assert(out->unique);
=20
-    /* For virtio we always have ch */
-    assert(ch);
-    assert(!ch->qi->reply_sent);
-    elem =3D ch->qi->qe;
-    q =3D &ch->qi->virtio_dev->dev.vq[ch->qi->qidx];
+    assert(!req->reply_sent);
=20
     /* The 'in' part of the elem is to qemu */
     unsigned int in_num =3D elem->in_num;
@@ -395,33 +411,175 @@ int virtio_send_data_iov(struct fuse_session *se, st=
ruct fuse_chan *ch,
=20
     ret =3D 0;
=20
-    vu_queue_push(&se->virtio_dev->dev, q, elem, tosend_len);
-    vu_queue_notify(&se->virtio_dev->dev, q);
+    pthread_rwlock_rdlock(&qi->virtio_dev->vu_dispatch_rwlock);
+    pthread_mutex_lock(&qi->vq_lock);
+    vu_queue_push(dev, q, elem, tosend_len);
+    vu_queue_notify(dev, q);
+    pthread_mutex_unlock(&qi->vq_lock);
+    pthread_rwlock_unlock(&qi->virtio_dev->vu_dispatch_rwlock);
=20
 err:
     if (ret =3D=3D 0) {
-        ch->qi->reply_sent =3D true;
+        req->reply_sent =3D true;
     }
=20
     return ret;
 }
=20
+/* Process one FVRequest in a thread pool */
+static void fv_queue_worker(gpointer data, gpointer user_data)
+{
+    struct fv_QueueInfo *qi =3D user_data;
+    struct fuse_session *se =3D qi->virtio_dev->se;
+    struct VuDev *dev =3D &qi->virtio_dev->dev;
+    FVRequest *req =3D data;
+    VuVirtqElement *elem =3D &req->elem;
+    struct fuse_buf fbuf =3D {};
+    bool allocated_bufv =3D false;
+    struct fuse_bufvec bufv;
+    struct fuse_bufvec *pbufv;
+
+    assert(se->bufsize > sizeof(struct fuse_in_header));
+
+    /*
+     * An element contains one request and the space to send our response
+     * They're spread over multiple descriptors in a scatter/gather set
+     * and we can't trust the guest to keep them still; so copy in/out.
+     */
+    fbuf.mem =3D malloc(se->bufsize);
+    assert(fbuf.mem);
+
+    fuse_mutex_init(&req->ch.lock);
+    req->ch.fd =3D -1;
+    req->ch.qi =3D qi;
+
+    /* The 'out' part of the elem is from qemu */
+    unsigned int out_num =3D elem->out_num;
+    struct iovec *out_sg =3D elem->out_sg;
+    size_t out_len =3D iov_size(out_sg, out_num);
+    fuse_log(FUSE_LOG_DEBUG,
+             "%s: elem %d: with %d out desc of length %zd\n",
+             __func__, elem->index, out_num, out_len);
+
+    /*
+     * The elem should contain a 'fuse_in_header' (in to fuse)
+     * plus the data based on the len in the header.
+     */
+    if (out_len < sizeof(struct fuse_in_header)) {
+        fuse_log(FUSE_LOG_ERR, "%s: elem %d too short for in_header\n",
+                 __func__, elem->index);
+        assert(0); /* TODO */
+    }
+    if (out_len > se->bufsize) {
+        fuse_log(FUSE_LOG_ERR, "%s: elem %d too large for buffer\n", __fun=
c__,
+                 elem->index);
+        assert(0); /* TODO */
+    }
+    /* Copy just the first element and look at it */
+    copy_from_iov(&fbuf, 1, out_sg);
+
+    pbufv =3D NULL; /* Compiler thinks an unitialised path */
+    if (out_num > 2 &&
+        out_sg[0].iov_len =3D=3D sizeof(struct fuse_in_header) &&
+        ((struct fuse_in_header *)fbuf.mem)->opcode =3D=3D FUSE_WRITE &&
+        out_sg[1].iov_len =3D=3D sizeof(struct fuse_write_in)) {
+        /*
+         * For a write we don't actually need to copy the
+         * data, we can just do it straight out of guest memory
+         * but we must still copy the headers in case the guest
+         * was nasty and changed them while we were using them.
+         */
+        fuse_log(FUSE_LOG_DEBUG, "%s: Write special case\n", __func__);
+
+        /* copy the fuse_write_in header afte rthe fuse_in_header */
+        fbuf.mem +=3D out_sg->iov_len;
+        copy_from_iov(&fbuf, 1, out_sg + 1);
+        fbuf.mem -=3D out_sg->iov_len;
+        fbuf.size =3D out_sg[0].iov_len + out_sg[1].iov_len;
+
+        /* Allocate the bufv, with space for the rest of the iov */
+        pbufv =3D malloc(sizeof(struct fuse_bufvec) +
+                       sizeof(struct fuse_buf) * (out_num - 2));
+        if (!pbufv) {
+            fuse_log(FUSE_LOG_ERR, "%s: pbufv malloc failed\n",
+                    __func__);
+            goto out;
+        }
+
+        allocated_bufv =3D true;
+        pbufv->count =3D 1;
+        pbufv->buf[0] =3D fbuf;
+
+        size_t iovindex, pbufvindex;
+        iovindex =3D 2; /* 2 headers, separate iovs */
+        pbufvindex =3D 1; /* 2 headers, 1 fusebuf */
+
+        for (; iovindex < out_num; iovindex++, pbufvindex++) {
+            pbufv->count++;
+            pbufv->buf[pbufvindex].pos =3D ~0; /* Dummy */
+            pbufv->buf[pbufvindex].flags =3D 0;
+            pbufv->buf[pbufvindex].mem =3D out_sg[iovindex].iov_base;
+            pbufv->buf[pbufvindex].size =3D out_sg[iovindex].iov_len;
+        }
+    } else {
+        /* Normal (non fast write) path */
+
+        /* Copy the rest of the buffer */
+        fbuf.mem +=3D out_sg->iov_len;
+        copy_from_iov(&fbuf, out_num - 1, out_sg + 1);
+        fbuf.mem -=3D out_sg->iov_len;
+        fbuf.size =3D out_len;
+
+        /* TODO! Endianness of header */
+
+        /* TODO: Add checks for fuse_session_exited */
+        bufv.buf[0] =3D fbuf;
+        bufv.count =3D 1;
+        pbufv =3D &bufv;
+    }
+    pbufv->idx =3D 0;
+    pbufv->off =3D 0;
+    fuse_session_process_buf_int(se, pbufv, &req->ch);
+
+out:
+    if (allocated_bufv) {
+        free(pbufv);
+    }
+
+    /* If the request has no reply, still recycle the virtqueue element */
+    if (!req->reply_sent) {
+        struct VuVirtq *q =3D vu_get_queue(dev, qi->qidx);
+
+        fuse_log(FUSE_LOG_DEBUG, "%s: elem %d no reply sent\n", __func__,
+                 elem->index);
+
+        pthread_rwlock_rdlock(&qi->virtio_dev->vu_dispatch_rwlock);
+        pthread_mutex_lock(&qi->vq_lock);
+        vu_queue_push(dev, q, elem, 0);
+        vu_queue_notify(dev, q);
+        pthread_mutex_unlock(&qi->vq_lock);
+        pthread_rwlock_unlock(&qi->virtio_dev->vu_dispatch_rwlock);
+    }
+
+    pthread_mutex_destroy(&req->ch.lock);
+    free(fbuf.mem);
+    free(req);
+}
+
 /* Thread function for individual queues, created when a queue is 'started=
' */
 static void *fv_queue_thread(void *opaque)
 {
     struct fv_QueueInfo *qi =3D opaque;
     struct VuDev *dev =3D &qi->virtio_dev->dev;
     struct VuVirtq *q =3D vu_get_queue(dev, qi->qidx);
-    struct fuse_session *se =3D qi->virtio_dev->se;
-    struct fuse_chan ch;
-    struct fuse_buf fbuf;
+    GThreadPool *pool;
=20
-    fbuf.mem =3D NULL;
-    fbuf.flags =3D 0;
-
-    fuse_mutex_init(&ch.lock);
-    ch.fd =3D (int)0xdaff0d111;
-    ch.qi =3D qi;
+    pool =3D g_thread_pool_new(fv_queue_worker, qi, 1 /* TODO max_threads =
*/,
+                             TRUE, NULL);
+    if (!pool) {
+        fuse_log(FUSE_LOG_ERR, "%s: g_thread_pool_new failed\n", __func__)=
;
+        return NULL;
+    }
=20
     fuse_log(FUSE_LOG_INFO, "%s: Start for queue %d kick_fd %d\n", __func_=
_,
              qi->qidx, qi->kick_fd);
@@ -478,6 +636,7 @@ static void *fv_queue_thread(void *opaque)
         /* Mutual exclusion with virtio_loop() */
         ret =3D pthread_rwlock_rdlock(&qi->virtio_dev->vu_dispatch_rwlock)=
;
         assert(ret =3D=3D 0); /* there is no possible error case */
+        pthread_mutex_lock(&qi->vq_lock);
         /* out is from guest, in is too guest */
         unsigned int in_bytes, out_bytes;
         vu_queue_get_avail_bytes(dev, q, &in_bytes, &out_bytes, ~0, ~0);
@@ -486,141 +645,22 @@ static void *fv_queue_thread(void *opaque)
                  "%s: Queue %d gave evalue: %zx available: in: %u out: %u\=
n",
                  __func__, qi->qidx, (size_t)evalue, in_bytes, out_bytes);
=20
-
         while (1) {
-            bool allocated_bufv =3D false;
-            struct fuse_bufvec bufv;
-            struct fuse_bufvec *pbufv;
-
-            /*
-             * An element contains one request and the space to send our
-             * response They're spread over multiple descriptors in a
-             * scatter/gather set and we can't trust the guest to keep the=
m
-             * still; so copy in/out.
-             */
-            VuVirtqElement *elem =3D vu_queue_pop(dev, q, sizeof(VuVirtqEl=
ement));
-            if (!elem) {
+            FVRequest *req =3D vu_queue_pop(dev, q, sizeof(FVRequest));
+            if (!req) {
                 break;
             }
=20
-            qi->qe =3D elem;
-            qi->reply_sent =3D false;
+            req->reply_sent =3D false;
=20
-            if (!fbuf.mem) {
-                fbuf.mem =3D malloc(se->bufsize);
-                assert(fbuf.mem);
-                assert(se->bufsize > sizeof(struct fuse_in_header));
-            }
-            /* The 'out' part of the elem is from qemu */
-            unsigned int out_num =3D elem->out_num;
-            struct iovec *out_sg =3D elem->out_sg;
-            size_t out_len =3D iov_size(out_sg, out_num);
-            fuse_log(FUSE_LOG_DEBUG,
-                     "%s: elem %d: with %d out desc of length %zd\n", __fu=
nc__,
-                     elem->index, out_num, out_len);
-
-            /*
-             * The elem should contain a 'fuse_in_header' (in to fuse)
-             * plus the data based on the len in the header.
-             */
-            if (out_len < sizeof(struct fuse_in_header)) {
-                fuse_log(FUSE_LOG_ERR, "%s: elem %d too short for in_heade=
r\n",
-                         __func__, elem->index);
-                assert(0); /* TODO */
-            }
-            if (out_len > se->bufsize) {
-                fuse_log(FUSE_LOG_ERR, "%s: elem %d too large for buffer\n=
",
-                         __func__, elem->index);
-                assert(0); /* TODO */
-            }
-            /* Copy just the first element and look at it */
-            copy_from_iov(&fbuf, 1, out_sg);
-
-            if (out_num > 2 &&
-                out_sg[0].iov_len =3D=3D sizeof(struct fuse_in_header) &&
-                ((struct fuse_in_header *)fbuf.mem)->opcode =3D=3D FUSE_WR=
ITE &&
-                out_sg[1].iov_len =3D=3D sizeof(struct fuse_write_in)) {
-                /*
-                 * For a write we don't actually need to copy the
-                 * data, we can just do it straight out of guest memory
-                 * but we must still copy the headers in case the guest
-                 * was nasty and changed them while we were using them.
-                 */
-                fuse_log(FUSE_LOG_DEBUG, "%s: Write special case\n", __fun=
c__);
-
-                /* copy the fuse_write_in header after the fuse_in_header =
*/
-                fbuf.mem +=3D out_sg->iov_len;
-                copy_from_iov(&fbuf, 1, out_sg + 1);
-                fbuf.mem -=3D out_sg->iov_len;
-                fbuf.size =3D out_sg[0].iov_len + out_sg[1].iov_len;
-
-                /* Allocate the bufv, with space for the rest of the iov *=
/
-                allocated_bufv =3D true;
-                pbufv =3D malloc(sizeof(struct fuse_bufvec) +
-                               sizeof(struct fuse_buf) * (out_num - 2));
-                if (!pbufv) {
-                    vu_queue_unpop(dev, q, elem, 0);
-                    free(elem);
-                    fuse_log(FUSE_LOG_ERR, "%s: pbufv malloc failed\n",
-                             __func__);
-                    goto out;
-                }
-
-                pbufv->count =3D 1;
-                pbufv->buf[0] =3D fbuf;
-
-                size_t iovindex, pbufvindex;
-                iovindex =3D 2; /* 2 headers, separate iovs */
-                pbufvindex =3D 1; /* 2 headers, 1 fusebuf */
-
-                for (; iovindex < out_num; iovindex++, pbufvindex++) {
-                    pbufv->count++;
-                    pbufv->buf[pbufvindex].pos =3D ~0; /* Dummy */
-                    pbufv->buf[pbufvindex].flags =3D 0;
-                    pbufv->buf[pbufvindex].mem =3D out_sg[iovindex].iov_ba=
se;
-                    pbufv->buf[pbufvindex].size =3D out_sg[iovindex].iov_l=
en;
-                }
-            } else {
-                /* Normal (non fast write) path */
-
-                /* Copy the rest of the buffer */
-                fbuf.mem +=3D out_sg->iov_len;
-                copy_from_iov(&fbuf, out_num - 1, out_sg + 1);
-                fbuf.mem -=3D out_sg->iov_len;
-                fbuf.size =3D out_len;
-
-                /* TODO! Endianness of header */
-
-                /* TODO: Add checks for fuse_session_exited */
-                bufv.buf[0] =3D fbuf;
-                bufv.count =3D 1;
-                pbufv =3D &bufv;
-            }
-            pbufv->idx =3D 0;
-            pbufv->off =3D 0;
-            fuse_session_process_buf_int(se, pbufv, &ch);
-
-            if (allocated_bufv) {
-                free(pbufv);
-            }
-
-            if (!qi->reply_sent) {
-                fuse_log(FUSE_LOG_DEBUG, "%s: elem %d no reply sent\n",
-                         __func__, elem->index);
-                /* I think we've still got to recycle the element */
-                vu_queue_push(dev, q, elem, 0);
-                vu_queue_notify(dev, q);
-            }
-            qi->qe =3D NULL;
-            free(elem);
-            elem =3D NULL;
+            g_thread_pool_push(pool, req, NULL);
         }
=20
+        pthread_mutex_unlock(&qi->vq_lock);
         pthread_rwlock_unlock(&qi->virtio_dev->vu_dispatch_rwlock);
     }
-out:
-    pthread_mutex_destroy(&ch.lock);
-    free(fbuf.mem);
+
+    g_thread_pool_free(pool, FALSE, TRUE);
=20
     return NULL;
 }
@@ -643,6 +683,7 @@ static void fv_queue_cleanup_thread(struct fv_VuDev *vu=
d, int qidx)
         fuse_log(FUSE_LOG_ERR, "%s: Failed to join thread idx %d err %d\n"=
,
                  __func__, qidx, ret);
     }
+    pthread_mutex_destroy(&ourqi->vq_lock);
     close(ourqi->kill_fd);
     ourqi->kick_fd =3D -1;
     free(vud->qi[qidx]);
@@ -696,6 +737,8 @@ static void fv_queue_set_started(VuDev *dev, int qidx, =
bool started)
=20
         ourqi->kill_fd =3D eventfd(0, EFD_CLOEXEC | EFD_SEMAPHORE);
         assert(ourqi->kill_fd !=3D -1);
+        pthread_mutex_init(&ourqi->vq_lock, NULL);
+
         if (pthread_create(&ourqi->thread, NULL, fv_queue_thread, ourqi)) =
{
             fuse_log(FUSE_LOG_ERR, "%s: Failed to create thread for queue =
%d\n",
                      __func__, qidx);
--=20
2.24.1


