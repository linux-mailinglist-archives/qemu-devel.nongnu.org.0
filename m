Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AC2330F16
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 14:26:47 +0100 (CET)
Received: from localhost ([::1]:45078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJFuI-0001Fz-P8
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 08:26:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lJF3Q-0000TT-J7
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 07:32:08 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:50749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lJF3O-0001ve-Iy
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 07:32:08 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-AvdlgY69OYurw77E-E1bOg-1; Mon, 08 Mar 2021 07:31:54 -0500
X-MC-Unique: AvdlgY69OYurw77E-E1bOg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1DBC9108BD06;
 Mon,  8 Mar 2021 12:31:53 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-113-236.ams2.redhat.com [10.36.113.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C569A5D9D0;
 Mon,  8 Mar 2021 12:31:51 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] vhost-user: Convert slave channel to QIOChannelSocket
Date: Mon,  8 Mar 2021 13:31:39 +0100
Message-Id: <20210308123141.26444-3-groug@kaod.org>
In-Reply-To: <20210308123141.26444-1-groug@kaod.org>
References: <20210308123141.26444-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
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
Cc: Greg Kurz <groug@kaod.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The slave channel is implemented with socketpair() : QEMU creates
the pair, passes one of the socket to virtiofsd and monitors the
other one with the main event loop using qemu_set_fd_handler().

In order to fix a potential deadlock between QEMU and a vhost-user
external process (e.g. virtiofsd with DAX), we want the nested
event loop in vhost_user_read() to monitor the slave channel as
well.

Prepare ground for this by converting the slave channel to be a
QIOChannelSocket. This will make monitoring of the slave channel
as simple as calling qio_channel_add_watch_source() from
vhost_user_read() instead of open-coding it.

This also allows to get rid of the ancillary data parsing since
QIOChannelSocket can do this for us. Note that the MSG_CTRUNC
check is dropped on the way because QIOChannelSocket ignores this
case. This isn't a problem since slave_read() provisions space for
8 file descriptors, but affected vhost-user slave protocol messages
generally only convey one. If for some reason a buggy implementation
passes more file descriptors, no need to break the connection, just
like we don't break it if some other type of ancillary data is
received : this isn't explicitely violating the protocol per-se so
it seems better to ignore it.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/virtio/vhost-user.c | 99 ++++++++++++++++++------------------------
 1 file changed, 42 insertions(+), 57 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 8a0574d5f959..e395d0d1fd81 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -16,6 +16,7 @@
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/virtio-net.h"
 #include "chardev/char-fe.h"
+#include "io/channel-socket.h"
 #include "sysemu/kvm.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
@@ -237,7 +238,8 @@ struct vhost_user {
     struct vhost_dev *dev;
     /* Shared between vhost devs of the same virtio device */
     VhostUserState *user;
-    int slave_fd;
+    QIOChannel *slave_ioc;
+    GSource *slave_src;
     NotifierWithReturn postcopy_notifier;
     struct PostCopyFD  postcopy_fd;
     uint64_t           postcopy_client_bases[VHOST_USER_MAX_RAM_SLOTS];
@@ -1441,56 +1443,33 @@ static int vhost_user_slave_handle_vring_host_notif=
ier(struct vhost_dev *dev,
     return 0;
 }
=20
-static void slave_read(void *opaque)
+static gboolean slave_read(QIOChannel *ioc, GIOCondition condition,
+                           gpointer opaque)
 {
     struct vhost_dev *dev =3D opaque;
     struct vhost_user *u =3D dev->opaque;
     VhostUserHeader hdr =3D { 0, };
     VhostUserPayload payload =3D { 0, };
-    int size, ret =3D 0;
+    ssize_t size;
+    int ret =3D 0;
     struct iovec iov;
-    struct msghdr msgh;
-    int fd[VHOST_USER_SLAVE_MAX_FDS];
-    char control[CMSG_SPACE(sizeof(fd))];
-    struct cmsghdr *cmsg;
-    int i, fdsize =3D 0;
-
-    memset(&msgh, 0, sizeof(msgh));
-    msgh.msg_iov =3D &iov;
-    msgh.msg_iovlen =3D 1;
-    msgh.msg_control =3D control;
-    msgh.msg_controllen =3D sizeof(control);
-
-    memset(fd, -1, sizeof(fd));
+    g_autofree int *fd =3D NULL;
+    size_t fdsize =3D 0;
+    int i;
=20
     /* Read header */
     iov.iov_base =3D &hdr;
     iov.iov_len =3D VHOST_USER_HDR_SIZE;
=20
     do {
-        size =3D recvmsg(u->slave_fd, &msgh, 0);
-    } while (size < 0 && (errno =3D=3D EINTR || errno =3D=3D EAGAIN));
+        size =3D qio_channel_readv_full(ioc, &iov, 1, &fd, &fdsize, NULL);
+    } while (size =3D=3D QIO_CHANNEL_ERR_BLOCK);
=20
     if (size !=3D VHOST_USER_HDR_SIZE) {
         error_report("Failed to read from slave.");
         goto err;
     }
=20
-    if (msgh.msg_flags & MSG_CTRUNC) {
-        error_report("Truncated message.");
-        goto err;
-    }
-
-    for (cmsg =3D CMSG_FIRSTHDR(&msgh); cmsg !=3D NULL;
-         cmsg =3D CMSG_NXTHDR(&msgh, cmsg)) {
-            if (cmsg->cmsg_level =3D=3D SOL_SOCKET &&
-                cmsg->cmsg_type =3D=3D SCM_RIGHTS) {
-                    fdsize =3D cmsg->cmsg_len - CMSG_LEN(0);
-                    memcpy(fd, CMSG_DATA(cmsg), fdsize);
-                    break;
-            }
-    }
-
     if (hdr.size > VHOST_USER_PAYLOAD_SIZE) {
         error_report("Failed to read msg header."
                 " Size %d exceeds the maximum %zu.", hdr.size,
@@ -1500,8 +1479,8 @@ static void slave_read(void *opaque)
=20
     /* Read payload */
     do {
-        size =3D read(u->slave_fd, &payload, hdr.size);
-    } while (size < 0 && (errno =3D=3D EINTR || errno =3D=3D EAGAIN));
+        size =3D qio_channel_read(ioc, (char *) &payload, hdr.size, NULL);
+    } while (size =3D=3D QIO_CHANNEL_ERR_BLOCK);
=20
     if (size !=3D hdr.size) {
         error_report("Failed to read payload from slave.");
@@ -1517,7 +1496,7 @@ static void slave_read(void *opaque)
         break;
     case VHOST_USER_SLAVE_VRING_HOST_NOTIFIER_MSG:
         ret =3D vhost_user_slave_handle_vring_host_notifier(dev, &payload.=
area,
-                                                          fd[0]);
+                                                          fd ? fd[0] : -1)=
;
         break;
     default:
         error_report("Received unexpected msg type: %d.", hdr.request);
@@ -1525,8 +1504,8 @@ static void slave_read(void *opaque)
     }
=20
     /* Close the remaining file descriptors. */
-    for (i =3D 0; i < fdsize; i++) {
-        if (fd[i] !=3D -1) {
+    if (fd) {
+        for (i =3D 0; i < fdsize; i++) {
             close(fd[i]);
         }
     }
@@ -1551,8 +1530,8 @@ static void slave_read(void *opaque)
         iovec[1].iov_len =3D hdr.size;
=20
         do {
-            size =3D writev(u->slave_fd, iovec, ARRAY_SIZE(iovec));
-        } while (size < 0 && (errno =3D=3D EINTR || errno =3D=3D EAGAIN));
+            size =3D qio_channel_writev(ioc, iovec, ARRAY_SIZE(iovec), NUL=
L);
+        } while (size =3D=3D QIO_CHANNEL_ERR_BLOCK);
=20
         if (size !=3D VHOST_USER_HDR_SIZE + hdr.size) {
             error_report("Failed to send msg reply to slave.");
@@ -1560,18 +1539,20 @@ static void slave_read(void *opaque)
         }
     }
=20
-    return;
+    return G_SOURCE_CONTINUE;
=20
 err:
-    qemu_set_fd_handler(u->slave_fd, NULL, NULL, NULL);
-    close(u->slave_fd);
-    u->slave_fd =3D -1;
-    for (i =3D 0; i < fdsize; i++) {
-        if (fd[i] !=3D -1) {
+    g_source_destroy(u->slave_src);
+    g_source_unref(u->slave_src);
+    u->slave_src =3D NULL;
+    object_unref(OBJECT(ioc));
+    u->slave_ioc =3D NULL;
+    if (fd) {
+        for (i =3D 0; i < fdsize; i++) {
             close(fd[i]);
         }
     }
-    return;
+    return G_SOURCE_REMOVE;
 }
=20
 static int vhost_setup_slave_channel(struct vhost_dev *dev)
@@ -1595,8 +1576,9 @@ static int vhost_setup_slave_channel(struct vhost_dev=
 *dev)
         return -1;
     }
=20
-    u->slave_fd =3D sv[0];
-    qemu_set_fd_handler(u->slave_fd, slave_read, NULL, dev);
+    u->slave_ioc =3D QIO_CHANNEL(qio_channel_socket_new_fd(sv[0], &error_a=
bort));
+    u->slave_src =3D qio_channel_add_watch_source(u->slave_ioc, G_IO_IN,
+                                                slave_read, dev, NULL, NUL=
L);
=20
     if (reply_supported) {
         msg.hdr.flags |=3D VHOST_USER_NEED_REPLY_MASK;
@@ -1614,9 +1596,11 @@ static int vhost_setup_slave_channel(struct vhost_de=
v *dev)
 out:
     close(sv[1]);
     if (ret) {
-        qemu_set_fd_handler(u->slave_fd, NULL, NULL, NULL);
-        close(u->slave_fd);
-        u->slave_fd =3D -1;
+        g_source_destroy(u->slave_src);
+        g_source_unref(u->slave_src);
+        u->slave_src =3D NULL;
+        object_unref(OBJECT(u->slave_ioc));
+        u->slave_ioc =3D NULL;
     }
=20
     return ret;
@@ -1853,7 +1837,6 @@ static int vhost_user_backend_init(struct vhost_dev *=
dev, void *opaque)
=20
     u =3D g_new0(struct vhost_user, 1);
     u->user =3D opaque;
-    u->slave_fd =3D -1;
     u->dev =3D dev;
     dev->opaque =3D u;
=20
@@ -1968,10 +1951,12 @@ static int vhost_user_backend_cleanup(struct vhost_=
dev *dev)
         close(u->postcopy_fd.fd);
         u->postcopy_fd.handler =3D NULL;
     }
-    if (u->slave_fd >=3D 0) {
-        qemu_set_fd_handler(u->slave_fd, NULL, NULL, NULL);
-        close(u->slave_fd);
-        u->slave_fd =3D -1;
+    if (u->slave_ioc) {
+        g_source_destroy(u->slave_src);
+        g_source_unref(u->slave_src);
+        u->slave_src =3D NULL;
+        object_unref(OBJECT(u->slave_ioc));
+        u->slave_ioc =3D NULL;
     }
     g_free(u->region_rb);
     u->region_rb =3D NULL;
--=20
2.26.2


