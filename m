Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D471146AD8
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 15:06:38 +0100 (CET)
Received: from localhost ([::1]:57648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iud80-0000cd-DI
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 09:06:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41095)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iub9z-0003fQ-S6
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 07:00:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iub9y-0005uk-H7
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 07:00:31 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:48963
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iub9y-0005uZ-Da
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 07:00:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579780830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A1ZIGOFSVxZZlfcS1KkwYJ8eZPN9KsNnSOn1WzU0TM8=;
 b=g6Lyg0bgBduFFs8bTGC9D5lyI4mWqfUmFyro0rev/vDXbBoOlnmAp8ZGMrrKdx48fcKIig
 o3jNfbS4zDNDQZ1ICXIXZAnybhlNr8xwJjsnITMwnCf3HE4geFgGDJbyE8BO9ciA2TcPSH
 g+GdpJ6B3etxibSHtABiC8HXuJLqqPE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-Ago3axJ3Oy2ddaqdKAiTJQ-1; Thu, 23 Jan 2020 07:00:24 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B79ACDB63
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 12:00:23 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.118.0])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 64B791CB;
 Thu, 23 Jan 2020 12:00:21 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	stefanha@redhat.com
Subject: [PULL 066/111] virtiofsd: Kill threads when queues are stopped
Date: Thu, 23 Jan 2020 11:57:56 +0000
Message-Id: <20200123115841.138849-67-dgilbert@redhat.com>
In-Reply-To: <20200123115841.138849-1-dgilbert@redhat.com>
References: <20200123115841.138849-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: Ago3axJ3Oy2ddaqdKAiTJQ-1
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

Kill the threads we've started when the queues get stopped.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
With improvements by:
Signed-off-by: Eryu Guan <eguan@linux.alibaba.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/fuse_virtio.c | 51 ++++++++++++++++++++++++++++++-----
 1 file changed, 44 insertions(+), 7 deletions(-)

diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index 872968f2c8..7a8774a3ee 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -41,6 +41,7 @@ struct fv_QueueInfo {
     /* Our queue index, corresponds to array position */
     int qidx;
     int kick_fd;
+    int kill_fd; /* For killing the thread */
=20
     /* The element for the command currently being processed */
     VuVirtqElement *qe;
@@ -412,14 +413,17 @@ static void *fv_queue_thread(void *opaque)
     fuse_log(FUSE_LOG_INFO, "%s: Start for queue %d kick_fd %d\n", __func_=
_,
              qi->qidx, qi->kick_fd);
     while (1) {
-        struct pollfd pf[1];
+        struct pollfd pf[2];
         pf[0].fd =3D qi->kick_fd;
         pf[0].events =3D POLLIN;
         pf[0].revents =3D 0;
+        pf[1].fd =3D qi->kill_fd;
+        pf[1].events =3D POLLIN;
+        pf[1].revents =3D 0;
=20
         fuse_log(FUSE_LOG_DEBUG, "%s: Waiting for Queue %d event\n", __fun=
c__,
                  qi->qidx);
-        int poll_res =3D ppoll(pf, 1, NULL, NULL);
+        int poll_res =3D ppoll(pf, 2, NULL, NULL);
=20
         if (poll_res =3D=3D -1) {
             if (errno =3D=3D EINTR) {
@@ -430,12 +434,23 @@ static void *fv_queue_thread(void *opaque)
             fuse_log(FUSE_LOG_ERR, "fv_queue_thread ppoll: %m\n");
             break;
         }
-        assert(poll_res =3D=3D 1);
+        assert(poll_res >=3D 1);
         if (pf[0].revents & (POLLERR | POLLHUP | POLLNVAL)) {
             fuse_log(FUSE_LOG_ERR, "%s: Unexpected poll revents %x Queue %=
d\n",
                      __func__, pf[0].revents, qi->qidx);
             break;
         }
+        if (pf[1].revents & (POLLERR | POLLHUP | POLLNVAL)) {
+            fuse_log(FUSE_LOG_ERR,
+                     "%s: Unexpected poll revents %x Queue %d killfd\n",
+                     __func__, pf[1].revents, qi->qidx);
+            break;
+        }
+        if (pf[1].revents) {
+            fuse_log(FUSE_LOG_INFO, "%s: kill event on queue %d - quitting=
\n",
+                     __func__, qi->qidx);
+            break;
+        }
         assert(pf[0].revents & POLLIN);
         fuse_log(FUSE_LOG_DEBUG, "%s: Got queue event on Queue %d\n", __fu=
nc__,
                  qi->qidx);
@@ -589,6 +604,28 @@ out:
     return NULL;
 }
=20
+static void fv_queue_cleanup_thread(struct fv_VuDev *vud, int qidx)
+{
+    int ret;
+    struct fv_QueueInfo *ourqi;
+
+    assert(qidx < vud->nqueues);
+    ourqi =3D vud->qi[qidx];
+
+    /* Kill the thread */
+    if (eventfd_write(ourqi->kill_fd, 1)) {
+        fuse_log(FUSE_LOG_ERR, "Eventfd_write for queue %d: %s\n",
+                 qidx, strerror(errno));
+    }
+    ret =3D pthread_join(ourqi->thread, NULL);
+    if (ret) {
+        fuse_log(FUSE_LOG_ERR, "%s: Failed to join thread idx %d err %d\n"=
,
+                 __func__, qidx, ret);
+    }
+    close(ourqi->kill_fd);
+    ourqi->kick_fd =3D -1;
+}
+
 /* Callback from libvhost-user on start or stop of a queue */
 static void fv_queue_set_started(VuDev *dev, int qidx, bool started)
 {
@@ -633,16 +670,16 @@ static void fv_queue_set_started(VuDev *dev, int qidx=
, bool started)
         }
         ourqi =3D vud->qi[qidx];
         ourqi->kick_fd =3D dev->vq[qidx].kick_fd;
+
+        ourqi->kill_fd =3D eventfd(0, EFD_CLOEXEC | EFD_SEMAPHORE);
+        assert(ourqi->kill_fd !=3D -1);
         if (pthread_create(&ourqi->thread, NULL, fv_queue_thread, ourqi)) =
{
             fuse_log(FUSE_LOG_ERR, "%s: Failed to create thread for queue =
%d\n",
                      __func__, qidx);
             assert(0);
         }
     } else {
-        /* TODO: Kill the thread */
-        assert(qidx < vud->nqueues);
-        ourqi =3D vud->qi[qidx];
-        ourqi->kick_fd =3D -1;
+        fv_queue_cleanup_thread(vud, qidx);
     }
 }
=20
--=20
2.24.1


