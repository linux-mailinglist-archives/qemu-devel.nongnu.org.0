Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD89E143D3B
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 13:47:13 +0100 (CET)
Received: from localhost ([::1]:53286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itsw4-0001r6-06
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 07:47:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51215)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1itsbj-0006IF-Hw
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:26:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1itsbe-00023D-Rq
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:26:11 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:48357
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1itsbe-000234-ON
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:26:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579609566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AQltFcREjY9lT4b/x+npGaKIspnP1AyKwA0zFEDhKpc=;
 b=ZIAQ4FSHVkz94Zf35FszkV34iWfXbsv/NYGntoY0jZ7YmbJtde8mlJwKkj7rRA/s0dfqLU
 2SQ8bDNKvgzg+TodGxQg/UVRzJI34JEGPpm85myv5Wh25V+Sz6XaRIio+PCpYOzYxxzcIm
 zjmYWhPqGH0TYicTVbDYA7NR9ZbsOe4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-bcQ92fplMtOvJ5mz9sgq8g-1; Tue, 21 Jan 2020 07:26:02 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04341800D5B;
 Tue, 21 Jan 2020 12:26:01 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.118.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 92CDD60BE0;
 Tue, 21 Jan 2020 12:25:56 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com,
 berrange@redhat.com, slp@redhat.com, philmd@redhat.com
Subject: [PATCH v2 018/109] virtiofsd: Start wiring up vhost-user
Date: Tue, 21 Jan 2020 12:23:02 +0000
Message-Id: <20200121122433.50803-19-dgilbert@redhat.com>
In-Reply-To: <20200121122433.50803-1-dgilbert@redhat.com>
References: <20200121122433.50803-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: bcQ92fplMtOvJ5mz9sgq8g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: m.mizuma@jp.fujitsu.com, misono.tomohiro@jp.fujitsu.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Listen on our unix socket for the connection from QEMU, when we get it
initialise vhost-user and dive into our own loop variant (currently
dummy).

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 tools/virtiofsd/fuse_i.h         |  4 ++
 tools/virtiofsd/fuse_lowlevel.c  |  5 ++
 tools/virtiofsd/fuse_lowlevel.h  |  7 +++
 tools/virtiofsd/fuse_virtio.c    | 87 +++++++++++++++++++++++++++++++-
 tools/virtiofsd/fuse_virtio.h    |  2 +
 tools/virtiofsd/passthrough_ll.c |  7 +--
 6 files changed, 106 insertions(+), 6 deletions(-)

diff --git a/tools/virtiofsd/fuse_i.h b/tools/virtiofsd/fuse_i.h
index 82d6ac7115..ec04449069 100644
--- a/tools/virtiofsd/fuse_i.h
+++ b/tools/virtiofsd/fuse_i.h
@@ -13,6 +13,8 @@
 #include "fuse.h"
 #include "fuse_lowlevel.h"
=20
+struct fv_VuDev;
+
 struct fuse_req {
     struct fuse_session *se;
     uint64_t unique;
@@ -65,6 +67,8 @@ struct fuse_session {
     size_t bufsize;
     int error;
     char *vu_socket_path;
+    int   vu_socketfd;
+    struct fv_VuDev *virtio_dev;
 };
=20
 struct fuse_chan {
diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowleve=
l.c
index f8b22ce346..9b64cc1531 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -2260,6 +2260,11 @@ void fuse_session_unmount(struct fuse_session *se)
 {
 }
=20
+int fuse_lowlevel_is_virtio(struct fuse_session *se)
+{
+    return se->vu_socket_path !=3D NULL;
+}
+
 #ifdef linux
 int fuse_req_getgroups(fuse_req_t req, int size, gid_t list[])
 {
diff --git a/tools/virtiofsd/fuse_lowlevel.h b/tools/virtiofsd/fuse_lowleve=
l.h
index 3509790368..46c97edbe2 100644
--- a/tools/virtiofsd/fuse_lowlevel.h
+++ b/tools/virtiofsd/fuse_lowlevel.h
@@ -1786,6 +1786,13 @@ void fuse_req_interrupt_func(fuse_req_t req, fuse_in=
terrupt_func_t func,
  */
 int fuse_req_interrupted(fuse_req_t req);
=20
+/**
+ * Check if the session is connected via virtio
+ *
+ * @param se session object
+ * @return 1 if the session is a virtio session
+ */
+int fuse_lowlevel_is_virtio(struct fuse_session *se);
=20
 /*
  * Inquiry functions
diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index cbef6ffdda..2ae3c764dd 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -19,18 +19,78 @@
=20
 #include <stdint.h>
 #include <stdio.h>
+#include <stdlib.h>
 #include <string.h>
 #include <sys/socket.h>
 #include <sys/types.h>
 #include <sys/un.h>
 #include <unistd.h>
=20
+#include "contrib/libvhost-user/libvhost-user.h"
+
+/*
+ * We pass the dev element into libvhost-user
+ * and then use it to get back to the outer
+ * container for other data.
+ */
+struct fv_VuDev {
+    VuDev dev;
+    struct fuse_session *se;
+};
+
 /* From spec */
 struct virtio_fs_config {
     char tag[36];
     uint32_t num_queues;
 };
=20
+/*
+ * Callback from libvhost-user if there's a new fd we're supposed to liste=
n
+ * to, typically a queue kick?
+ */
+static void fv_set_watch(VuDev *dev, int fd, int condition, vu_watch_cb cb=
,
+                         void *data)
+{
+    fuse_log(FUSE_LOG_WARNING, "%s: TODO! fd=3D%d\n", __func__, fd);
+}
+
+/*
+ * Callback from libvhost-user if we're no longer supposed to listen on an=
 fd
+ */
+static void fv_remove_watch(VuDev *dev, int fd)
+{
+    fuse_log(FUSE_LOG_WARNING, "%s: TODO! fd=3D%d\n", __func__, fd);
+}
+
+/* Callback from libvhost-user to panic */
+static void fv_panic(VuDev *dev, const char *err)
+{
+    fuse_log(FUSE_LOG_ERR, "%s: libvhost-user: %s\n", __func__, err);
+    /* TODO: Allow reconnects?? */
+    exit(EXIT_FAILURE);
+}
+
+static bool fv_queue_order(VuDev *dev, int qidx)
+{
+    return false;
+}
+
+static const VuDevIface fv_iface =3D {
+    /* TODO: Add other callbacks */
+    .queue_is_processed_in_order =3D fv_queue_order,
+};
+
+int virtio_loop(struct fuse_session *se)
+{
+    fuse_log(FUSE_LOG_INFO, "%s: Entry\n", __func__);
+
+    while (1) {
+        /* TODO: Add stuffing */
+    }
+
+    fuse_log(FUSE_LOG_INFO, "%s: Exit\n", __func__);
+}
+
 int virtio_session_mount(struct fuse_session *se)
 {
     struct sockaddr_un un;
@@ -75,5 +135,30 @@ int virtio_session_mount(struct fuse_session *se)
         return -1;
     }
=20
-    return -1;
+    fuse_log(FUSE_LOG_INFO, "%s: Waiting for vhost-user socket connection.=
..\n",
+             __func__);
+    int data_sock =3D accept(listen_sock, NULL, NULL);
+    if (data_sock =3D=3D -1) {
+        fuse_log(FUSE_LOG_ERR, "vhost socket accept: %m\n");
+        close(listen_sock);
+        return -1;
+    }
+    close(listen_sock);
+    fuse_log(FUSE_LOG_INFO, "%s: Received vhost-user socket connection\n",
+             __func__);
+
+    /* TODO: Some cleanup/deallocation! */
+    se->virtio_dev =3D calloc(sizeof(struct fv_VuDev), 1);
+    if (!se->virtio_dev) {
+        fuse_log(FUSE_LOG_ERR, "%s: virtio_dev calloc failed\n", __func__)=
;
+        close(data_sock);
+        return -1;
+    }
+
+    se->vu_socketfd =3D data_sock;
+    se->virtio_dev->se =3D se;
+    vu_init(&se->virtio_dev->dev, 2, se->vu_socketfd, fv_panic, fv_set_wat=
ch,
+            fv_remove_watch, &fv_iface);
+
+    return 0;
 }
diff --git a/tools/virtiofsd/fuse_virtio.h b/tools/virtiofsd/fuse_virtio.h
index 8f2edb69ca..23026d6e4c 100644
--- a/tools/virtiofsd/fuse_virtio.h
+++ b/tools/virtiofsd/fuse_virtio.h
@@ -20,4 +20,6 @@ struct fuse_session;
=20
 int virtio_session_mount(struct fuse_session *se);
=20
+int virtio_loop(struct fuse_session *se);
+
 #endif
diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c
index ea7c2d96bb..fcb588f370 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -35,6 +35,7 @@
  * \include passthrough_ll.c
  */
=20
+#include "fuse_virtio.h"
 #include "fuse_lowlevel.h"
 #include <assert.h>
 #include <dirent.h>
@@ -1394,11 +1395,7 @@ int main(int argc, char *argv[])
     fuse_daemonize(opts.foreground);
=20
     /* Block until ctrl+c or fusermount -u */
-    if (opts.singlethread) {
-        ret =3D fuse_session_loop(se);
-    } else {
-        ret =3D fuse_session_loop_mt(se, opts.clone_fd);
-    }
+    ret =3D virtio_loop(se);
=20
     fuse_session_unmount(se);
 err_out3:
--=20
2.24.1


