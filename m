Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0F61468A4
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 14:03:55 +0100 (CET)
Received: from localhost ([::1]:56712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuc9J-0005Tu-Ig
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 08:03:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40434)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iub8x-0002DT-Qf
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:59:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iub8w-000568-EB
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:59:27 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:32681
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iub8w-00055u-AJ
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:59:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579780766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Wsvi6ylmggzuEttsW+S6YDpnrJ0gXoKZtapOr0FXpA=;
 b=h31+qk337zyZ3yCiXTEegNOQdNu31k/i7iA+GeLto1YoX3/SCmFLGG4htNQ9PtjwLOCsY/
 ygg7i/f03USw1sz/Xu1pn6rAcXg+mgkoURyUhKbAEOvTLAhVDruVXZDzqTSEPuqfXfuPwM
 dWpSgF6gOMpN8Ie+a782GL86Q5ToS3s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-srSBkL41ObWvX0l95OWhJw-1; Thu, 23 Jan 2020 06:59:24 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54E4C107ACC9
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 11:59:23 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.118.0])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 221E91CB;
 Thu, 23 Jan 2020 11:59:19 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	stefanha@redhat.com
Subject: [PULL 029/111] virtiofsd: add --fd=FDNUM fd passing option
Date: Thu, 23 Jan 2020 11:57:19 +0000
Message-Id: <20200123115841.138849-30-dgilbert@redhat.com>
In-Reply-To: <20200123115841.138849-1-dgilbert@redhat.com>
References: <20200123115841.138849-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: srSBkL41ObWvX0l95OWhJw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

Although --socket-path=3DPATH is useful for manual invocations, management
tools typically create the UNIX domain socket themselves and pass it to
the vhost-user device backend.  This way QEMU can be launched
immediately with a valid socket.  No waiting for the vhost-user device
backend is required when fd passing is used.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/fuse_i.h        |  1 +
 tools/virtiofsd/fuse_lowlevel.c | 16 ++++++++++++----
 tools/virtiofsd/fuse_virtio.c   | 31 +++++++++++++++++++++++++------
 3 files changed, 38 insertions(+), 10 deletions(-)

diff --git a/tools/virtiofsd/fuse_i.h b/tools/virtiofsd/fuse_i.h
index 1126723d18..45995f3246 100644
--- a/tools/virtiofsd/fuse_i.h
+++ b/tools/virtiofsd/fuse_i.h
@@ -68,6 +68,7 @@ struct fuse_session {
     size_t bufsize;
     int error;
     char *vu_socket_path;
+    int   vu_listen_fd;
     int   vu_socketfd;
     struct fv_VuDev *virtio_dev;
 };
diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowleve=
l.c
index 4f4684d942..95f4db8fcf 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -2130,6 +2130,7 @@ static const struct fuse_opt fuse_ll_opts[] =3D {
     LL_OPTION("--debug", debug, 1),
     LL_OPTION("allow_root", deny_others, 1),
     LL_OPTION("--socket-path=3D%s", vu_socket_path, 0),
+    LL_OPTION("--fd=3D%d", vu_listen_fd, 0),
     FUSE_OPT_END
 };
=20
@@ -2147,7 +2148,8 @@ void fuse_lowlevel_help(void)
      */
     printf(
         "    -o allow_root              allow access by root\n"
-        "    --socket-path=3DPATH         path for the vhost-user socket\n=
");
+        "    --socket-path=3DPATH         path for the vhost-user socket\n=
"
+        "    --fd=3DFDNUM                 fd number of vhost-user socket\n=
");
 }
=20
 void fuse_session_destroy(struct fuse_session *se)
@@ -2191,6 +2193,7 @@ struct fuse_session *fuse_session_new(struct fuse_arg=
s *args,
         goto out1;
     }
     se->fd =3D -1;
+    se->vu_listen_fd =3D -1;
     se->conn.max_write =3D UINT_MAX;
     se->conn.max_readahead =3D UINT_MAX;
=20
@@ -2212,8 +2215,13 @@ struct fuse_session *fuse_session_new(struct fuse_ar=
gs *args,
         goto out4;
     }
=20
-    if (!se->vu_socket_path) {
-        fprintf(stderr, "fuse: missing -o vhost_user_socket option\n");
+    if (!se->vu_socket_path && se->vu_listen_fd < 0) {
+        fuse_log(FUSE_LOG_ERR, "fuse: missing --socket-path or --fd option=
\n");
+        goto out4;
+    }
+    if (se->vu_socket_path && se->vu_listen_fd >=3D 0) {
+        fuse_log(FUSE_LOG_ERR,
+                 "fuse: --socket-path and --fd cannot be given together\n"=
);
         goto out4;
     }
=20
@@ -2253,7 +2261,7 @@ void fuse_session_unmount(struct fuse_session *se)
=20
 int fuse_lowlevel_is_virtio(struct fuse_session *se)
 {
-    return se->vu_socket_path !=3D NULL;
+    return !!se->virtio_dev;
 }
=20
 #ifdef linux
diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index 7e2711b504..635f87756a 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -638,18 +638,21 @@ int virtio_loop(struct fuse_session *se)
     return 0;
 }
=20
-int virtio_session_mount(struct fuse_session *se)
+static int fv_create_listen_socket(struct fuse_session *se)
 {
     struct sockaddr_un un;
     mode_t old_umask;
=20
+    /* Nothing to do if fd is already initialized */
+    if (se->vu_listen_fd >=3D 0) {
+        return 0;
+    }
+
     if (strlen(se->vu_socket_path) >=3D sizeof(un.sun_path)) {
         fuse_log(FUSE_LOG_ERR, "Socket path too long\n");
         return -1;
     }
=20
-    se->fd =3D -1;
-
     /*
      * Create the Unix socket to communicate with qemu
      * based on QEMU's vhost-user-bridge
@@ -682,15 +685,31 @@ int virtio_session_mount(struct fuse_session *se)
         return -1;
     }
=20
+    se->vu_listen_fd =3D listen_sock;
+    return 0;
+}
+
+int virtio_session_mount(struct fuse_session *se)
+{
+    int ret;
+
+    ret =3D fv_create_listen_socket(se);
+    if (ret < 0) {
+        return ret;
+    }
+
+    se->fd =3D -1;
+
     fuse_log(FUSE_LOG_INFO, "%s: Waiting for vhost-user socket connection.=
..\n",
              __func__);
-    int data_sock =3D accept(listen_sock, NULL, NULL);
+    int data_sock =3D accept(se->vu_listen_fd, NULL, NULL);
     if (data_sock =3D=3D -1) {
         fuse_log(FUSE_LOG_ERR, "vhost socket accept: %m\n");
-        close(listen_sock);
+        close(se->vu_listen_fd);
         return -1;
     }
-    close(listen_sock);
+    close(se->vu_listen_fd);
+    se->vu_listen_fd =3D -1;
     fuse_log(FUSE_LOG_INFO, "%s: Received vhost-user socket connection\n",
              __func__);
=20
--=20
2.24.1


