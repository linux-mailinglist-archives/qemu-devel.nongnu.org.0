Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7350A1471BB
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 20:29:08 +0100 (CET)
Received: from localhost ([::1]:35750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuiA6-0001Zm-MP
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 14:29:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42114)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iufeU-0005d4-5E
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:48:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iufeS-0007Np-S9
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:48:17 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:52668
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iufeS-0007Mu-Or
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:48:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579798096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VSzDD1T68sc1qq0LKBetdDzbj80uqbDTHQQMIsQOILs=;
 b=OZJo3X+XmKENctJuAbRHdI6gdm/DgtJB2irbUvfXYTjlcE5MVduDKH0UtD61U6AcCbWDyR
 dLXzbdExJIEqB/270/t1i6BBQFs7Q68l+B7K/9uNNxn183rThrVoJ0V716vx1TkgDF15ou
 IZDHiZ1DJCtPcPA6wpFdLVJwWf39W5M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-Z_x53C8bPZqSBb8HNCJbgw-1; Thu, 23 Jan 2020 11:48:15 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E570092762
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 16:48:13 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-116-110.ams2.redhat.com
 [10.36.116.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A31919C69;
 Thu, 23 Jan 2020 16:48:13 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	stefanha@redhat.com
Subject: [PULL 072/108] virtiofsd: extract root inode init into setup_root()
Date: Thu, 23 Jan 2020 16:45:54 +0000
Message-Id: <20200123164630.91498-73-dgilbert@redhat.com>
In-Reply-To: <20200123164630.91498-1-dgilbert@redhat.com>
References: <20200123164630.91498-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: Z_x53C8bPZqSBb8HNCJbgw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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

From: Miklos Szeredi <mszeredi@redhat.com>

Inititialize the root inode in a single place.

Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
dgilbert:
with fix suggested by Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
Reviewed-by: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 35 +++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c
index 33bfb4d1f4..9e7191eb75 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -2351,6 +2351,30 @@ static void log_func(enum fuse_log_level level, cons=
t char *fmt, va_list ap)
     }
 }
=20
+static void setup_root(struct lo_data *lo, struct lo_inode *root)
+{
+    int fd, res;
+    struct stat stat;
+
+    fd =3D open("/", O_PATH);
+    if (fd =3D=3D -1) {
+        fuse_log(FUSE_LOG_ERR, "open(%s, O_PATH): %m\n", lo->source);
+        exit(1);
+    }
+
+    res =3D fstatat(fd, "", &stat, AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW);
+    if (res =3D=3D -1) {
+        fuse_log(FUSE_LOG_ERR, "fstatat(%s): %m\n", lo->source);
+        exit(1);
+    }
+
+    root->is_symlink =3D false;
+    root->fd =3D fd;
+    root->ino =3D stat.st_ino;
+    root->dev =3D stat.st_dev;
+    root->refcount =3D 2;
+}
+
 int main(int argc, char *argv[])
 {
     struct fuse_args args =3D FUSE_ARGS_INIT(argc, argv);
@@ -2426,8 +2450,6 @@ int main(int argc, char *argv[])
     if (lo.debug) {
         current_log_level =3D FUSE_LOG_DEBUG;
     }
-    lo.root.refcount =3D 2;
-
     if (lo.source) {
         struct stat stat;
         int res;
@@ -2446,7 +2468,6 @@ int main(int argc, char *argv[])
     } else {
         lo.source =3D "/";
     }
-    lo.root.is_symlink =3D false;
     if (!lo.timeout_set) {
         switch (lo.cache) {
         case CACHE_NEVER:
@@ -2466,13 +2487,6 @@ int main(int argc, char *argv[])
         exit(1);
     }
=20
-    lo.root.fd =3D open(lo.source, O_PATH);
-
-    if (lo.root.fd =3D=3D -1) {
-        fuse_log(FUSE_LOG_ERR, "open(\"%s\", O_PATH): %m\n", lo.source);
-        exit(1);
-    }
-
     se =3D fuse_session_new(&args, &lo_oper, sizeof(lo_oper), &lo);
     if (se =3D=3D NULL) {
         goto err_out1;
@@ -2495,6 +2509,7 @@ int main(int argc, char *argv[])
=20
     setup_sandbox(&lo, se, opts.syslog);
=20
+    setup_root(&lo, &lo.root);
     /* Block until ctrl+c or fusermount -u */
     ret =3D virtio_loop(se);
=20
--=20
2.24.1


