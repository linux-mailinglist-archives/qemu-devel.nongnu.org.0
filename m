Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64049308A1A
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 16:54:26 +0100 (CET)
Received: from localhost ([::1]:34660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5W6L-0006Rp-B6
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 10:54:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l5W5Q-0005jb-HB
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 10:53:28 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:30843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l5W5M-0005nb-IT
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 10:53:28 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-KWEpAsTnPDW_QfAK1F7gFg-1; Fri, 29 Jan 2021 10:53:19 -0500
X-MC-Unique: KWEpAsTnPDW_QfAK1F7gFg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2DC88066E9;
 Fri, 29 Jan 2021 15:53:18 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-112-162.ams2.redhat.com [10.36.112.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EFB7C60C15;
 Fri, 29 Jan 2021 15:53:13 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] virtiofsd: vu_dispatch locking should never fail
Date: Fri, 29 Jan 2021 16:53:12 +0100
Message-Id: <20210129155312.595980-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

pthread_rwlock_rdlock() and pthread_rwlock_wrlock() can fail if a
deadlock condition is detected or the current thread already owns
the lock. They can also fail, like pthread_rwlock_unlock(), if the
mutex wasn't properly initialized. None of these are ever expected
to happen with fv_VuDev::vu_dispatch_rwlock.

Some users already check the return value and assert, some others
don't. Introduce rdlock/wrlock/unlock wrappers that just do the
former and use them everywhere.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 tools/virtiofsd/fuse_virtio.c | 42 +++++++++++++++++++++++------------
 1 file changed, 28 insertions(+), 14 deletions(-)

diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index ddcefee4272f..7ea269c4b65d 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -187,6 +187,24 @@ static void copy_iov(struct iovec *src_iov, int src_co=
unt,
     }
 }
=20
+/*
+ * pthread_rwlock_rdlock() and pthread_rwlock_wrlock can fail if
+ * a deadlock condition is detected or the current thread already
+ * owns the lock. They can also fail, like pthread_rwlock_unlock(),
+ * if the mutex wasn't properly initialized. None of these are ever
+ * expected to happen.
+ */
+#define VU_DISPATCH_LOCK_OP(op)                              \
+static inline void vu_dispatch_##op(struct fv_VuDev *vud)    \
+{                                                            \
+    int ret =3D pthread_rwlock_##op(&vud->vu_dispatch_rwlock); \
+    assert(ret =3D=3D 0);                                        \
+}
+
+VU_DISPATCH_LOCK_OP(rdlock);
+VU_DISPATCH_LOCK_OP(wrlock);
+VU_DISPATCH_LOCK_OP(unlock);
+
 /*
  * Called back by ll whenever it wants to send a reply/message back
  * The 1st element of the iov starts with the fuse_out_header
@@ -240,12 +258,12 @@ int virtio_send_msg(struct fuse_session *se, struct f=
use_chan *ch,
=20
     copy_iov(iov, count, in_sg, in_num, tosend_len);
=20
-    pthread_rwlock_rdlock(&qi->virtio_dev->vu_dispatch_rwlock);
+    vu_dispatch_rdlock(qi->virtio_dev);
     pthread_mutex_lock(&qi->vq_lock);
     vu_queue_push(dev, q, elem, tosend_len);
     vu_queue_notify(dev, q);
     pthread_mutex_unlock(&qi->vq_lock);
-    pthread_rwlock_unlock(&qi->virtio_dev->vu_dispatch_rwlock);
+    vu_dispatch_unlock(qi->virtio_dev);
=20
     req->reply_sent =3D true;
=20
@@ -403,12 +421,12 @@ int virtio_send_data_iov(struct fuse_session *se, str=
uct fuse_chan *ch,
=20
     ret =3D 0;
=20
-    pthread_rwlock_rdlock(&qi->virtio_dev->vu_dispatch_rwlock);
+    vu_dispatch_rdlock(qi->virtio_dev);
     pthread_mutex_lock(&qi->vq_lock);
     vu_queue_push(dev, q, elem, tosend_len);
     vu_queue_notify(dev, q);
     pthread_mutex_unlock(&qi->vq_lock);
-    pthread_rwlock_unlock(&qi->virtio_dev->vu_dispatch_rwlock);
+    vu_dispatch_unlock(qi->virtio_dev);
=20
 err:
     if (ret =3D=3D 0) {
@@ -558,12 +576,12 @@ out:
         fuse_log(FUSE_LOG_DEBUG, "%s: elem %d no reply sent\n", __func__,
                  elem->index);
=20
-        pthread_rwlock_rdlock(&qi->virtio_dev->vu_dispatch_rwlock);
+        vu_dispatch_rdlock(qi->virtio_dev);
         pthread_mutex_lock(&qi->vq_lock);
         vu_queue_push(dev, q, elem, 0);
         vu_queue_notify(dev, q);
         pthread_mutex_unlock(&qi->vq_lock);
-        pthread_rwlock_unlock(&qi->virtio_dev->vu_dispatch_rwlock);
+        vu_dispatch_unlock(qi->virtio_dev);
     }
=20
     pthread_mutex_destroy(&req->ch.lock);
@@ -596,7 +614,6 @@ static void *fv_queue_thread(void *opaque)
              qi->qidx, qi->kick_fd);
     while (1) {
         struct pollfd pf[2];
-        int ret;
=20
         pf[0].fd =3D qi->kick_fd;
         pf[0].events =3D POLLIN;
@@ -645,8 +662,7 @@ static void *fv_queue_thread(void *opaque)
             break;
         }
         /* Mutual exclusion with virtio_loop() */
-        ret =3D pthread_rwlock_rdlock(&qi->virtio_dev->vu_dispatch_rwlock)=
;
-        assert(ret =3D=3D 0); /* there is no possible error case */
+        vu_dispatch_wrlock(qi->virtio_dev);
         pthread_mutex_lock(&qi->vq_lock);
         /* out is from guest, in is too guest */
         unsigned int in_bytes, out_bytes;
@@ -672,7 +688,7 @@ static void *fv_queue_thread(void *opaque)
         }
=20
         pthread_mutex_unlock(&qi->vq_lock);
-        pthread_rwlock_unlock(&qi->virtio_dev->vu_dispatch_rwlock);
+        vu_dispatch_unlock(qi->virtio_dev);
=20
         /* Process all the requests. */
         if (!se->thread_pool_size && req_list !=3D NULL) {
@@ -799,7 +815,6 @@ int virtio_loop(struct fuse_session *se)
     while (!fuse_session_exited(se)) {
         struct pollfd pf[1];
         bool ok;
-        int ret;
         pf[0].fd =3D se->vu_socketfd;
         pf[0].events =3D POLLIN;
         pf[0].revents =3D 0;
@@ -825,12 +840,11 @@ int virtio_loop(struct fuse_session *se)
         assert(pf[0].revents & POLLIN);
         fuse_log(FUSE_LOG_DEBUG, "%s: Got VU event\n", __func__);
         /* Mutual exclusion with fv_queue_thread() */
-        ret =3D pthread_rwlock_wrlock(&se->virtio_dev->vu_dispatch_rwlock)=
;
-        assert(ret =3D=3D 0); /* there is no possible error case */
+        vu_dispatch_wrlock(se->virtio_dev);
=20
         ok =3D vu_dispatch(&se->virtio_dev->dev);
=20
-        pthread_rwlock_unlock(&se->virtio_dev->vu_dispatch_rwlock);
+        vu_dispatch_unlock(se->virtio_dev);
=20
         if (!ok) {
             fuse_log(FUSE_LOG_ERR, "%s: vu_dispatch failed\n", __func__);
--=20
2.26.2


