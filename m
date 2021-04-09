Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2723E359B4B
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 12:08:38 +0200 (CEST)
Received: from localhost ([::1]:37704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUo44-0004wL-NI
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 06:08:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lUo2H-0004K7-8m
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 06:06:45 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:60840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lUo2F-0003pf-Ew
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 06:06:45 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29--VfArW0eNkCQDIEwQfDM9g-1; Fri, 09 Apr 2021 06:06:37 -0400
X-MC-Unique: -VfArW0eNkCQDIEwQfDM9g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C97B6D4E0;
 Fri,  9 Apr 2021 10:06:36 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-112-136.ams2.redhat.com [10.36.112.136])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AA80960BE5;
 Fri,  9 Apr 2021 10:06:28 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] virtiofsd: Fix side-effect in assert()
Date: Fri,  9 Apr 2021 12:06:27 +0200
Message-Id: <20210409100627.451573-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: virtio-fs@redhat.com, misono.tomohiro@jp.fujitsu.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is bad practice to put an expression with a side-effect in
assert() because the side-effect won't happen if the code is
compiled with -DNDEBUG.

Use an intermediate variable. Consolidate this in an macro to
have proper line numbers when the assertion is hit.

virtiofsd: ../../tools/virtiofsd/passthrough_ll.c:2797: lo_getxattr:
 Assertion `fchdir_res =3D=3D 0' failed.
Aborted

  2796          /* fchdir should not fail here */
=3D>2797          FCHDIR_NOFAIL(lo->proc_self_fd);
  2798          ret =3D getxattr(procname, name, value, size);
  2799          FCHDIR_NOFAIL(lo->root.fd);

Fixes: bdfd66788349 ("virtiofsd: Fix xattr operations")
Cc: misono.tomohiro@jp.fujitsu.com
Signed-off-by: Greg Kurz <groug@kaod.org>
---
 tools/virtiofsd/passthrough_ll.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c
index 1553d2ef454f..6592f96f685e 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -2723,6 +2723,11 @@ static int xattr_map_server(const struct lo_data *lo=
, const char *server_name,
     return -ENODATA;
 }
=20
+#define FCHDIR_NOFAIL(fd) do {                         \
+        int fchdir_res =3D fchdir(fd);                   \
+        assert(fchdir_res =3D=3D 0);                       \
+    } while (0)
+
 static void lo_getxattr(fuse_req_t req, fuse_ino_t ino, const char *in_nam=
e,
                         size_t size)
 {
@@ -2789,9 +2794,9 @@ static void lo_getxattr(fuse_req_t req, fuse_ino_t in=
o, const char *in_name,
         ret =3D fgetxattr(fd, name, value, size);
     } else {
         /* fchdir should not fail here */
-        assert(fchdir(lo->proc_self_fd) =3D=3D 0);
+        FCHDIR_NOFAIL(lo->proc_self_fd);
         ret =3D getxattr(procname, name, value, size);
-        assert(fchdir(lo->root.fd) =3D=3D 0);
+        FCHDIR_NOFAIL(lo->root.fd);
     }
=20
     if (ret =3D=3D -1) {
@@ -2864,9 +2869,9 @@ static void lo_listxattr(fuse_req_t req, fuse_ino_t i=
no, size_t size)
         ret =3D flistxattr(fd, value, size);
     } else {
         /* fchdir should not fail here */
-        assert(fchdir(lo->proc_self_fd) =3D=3D 0);
+        FCHDIR_NOFAIL(lo->proc_self_fd);
         ret =3D listxattr(procname, value, size);
-        assert(fchdir(lo->root.fd) =3D=3D 0);
+        FCHDIR_NOFAIL(lo->root.fd);
     }
=20
     if (ret =3D=3D -1) {
@@ -3000,9 +3005,9 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t in=
o, const char *in_name,
         ret =3D fsetxattr(fd, name, value, size, flags);
     } else {
         /* fchdir should not fail here */
-        assert(fchdir(lo->proc_self_fd) =3D=3D 0);
+        FCHDIR_NOFAIL(lo->proc_self_fd);
         ret =3D setxattr(procname, name, value, size, flags);
-        assert(fchdir(lo->root.fd) =3D=3D 0);
+        FCHDIR_NOFAIL(lo->root.fd);
     }
=20
     saverr =3D ret =3D=3D -1 ? errno : 0;
@@ -3066,9 +3071,9 @@ static void lo_removexattr(fuse_req_t req, fuse_ino_t=
 ino, const char *in_name)
         ret =3D fremovexattr(fd, name);
     } else {
         /* fchdir should not fail here */
-        assert(fchdir(lo->proc_self_fd) =3D=3D 0);
+        FCHDIR_NOFAIL(lo->proc_self_fd);
         ret =3D removexattr(procname, name);
-        assert(fchdir(lo->root.fd) =3D=3D 0);
+        FCHDIR_NOFAIL(lo->root.fd);
     }
=20
     saverr =3D ret =3D=3D -1 ? errno : 0;
--=20
2.26.3


