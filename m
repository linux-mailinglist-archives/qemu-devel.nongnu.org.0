Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD14143D60
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 13:57:14 +0100 (CET)
Received: from localhost ([::1]:53418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itt5l-0004NV-5X
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 07:57:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51822)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1itse5-0000DM-0B
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:28:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1itse1-0003ES-6w
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:28:36 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:60948
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1itse0-0003E1-VF
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:28:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579609712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KXUmF+JaaLkjBNCQITvqnO/hMDhsU03dR7T+jZPJMkc=;
 b=QsrLFaw9GgtbOXaYCODF4bQBQQsAHvji/U9KNtZBn/0OFQFMcv9AxTW5XemZjkmWqO3j9U
 vNLssRLoQCsEKrnnnKgNS1zs8+UU2Ko1ly3gpgBsnxXWKkoNip3zB1GOzGIUVTz/tj0xXl
 t85bh9Wa2StD0XXlu42EyFraIRY+QEk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-dUl41kDsPWaqnPxZAdlefQ-1; Tue, 21 Jan 2020 07:28:30 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6AA11922960;
 Tue, 21 Jan 2020 12:28:29 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.118.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F1D260BE0;
 Tue, 21 Jan 2020 12:28:25 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com,
 berrange@redhat.com, slp@redhat.com, philmd@redhat.com
Subject: [PATCH v2 047/109] virtiofsd: use /proc/self/fd/ O_PATH file
 descriptor
Date: Tue, 21 Jan 2020 12:23:31 +0000
Message-Id: <20200121122433.50803-48-dgilbert@redhat.com>
In-Reply-To: <20200121122433.50803-1-dgilbert@redhat.com>
References: <20200121122433.50803-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: dUl41kDsPWaqnPxZAdlefQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: m.mizuma@jp.fujitsu.com, misono.tomohiro@jp.fujitsu.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

Sandboxing will remove /proc from the mount namespace so we can no
longer build string paths into "/proc/self/fd/...".

Keep an O_PATH file descriptor so we can still re-open fds via
/proc/self/fd.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 130 ++++++++++++++++++++++++-------
 1 file changed, 103 insertions(+), 27 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c
index 7a16e6b4d6..322205ba3a 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -109,6 +109,9 @@ struct lo_data {
     struct lo_map ino_map; /* protected by lo->mutex */
     struct lo_map dirp_map; /* protected by lo->mutex */
     struct lo_map fd_map; /* protected by lo->mutex */
+
+    /* An O_PATH file descriptor to /proc/self/fd/ */
+    int proc_self_fd;
 };
=20
 static const struct fuse_opt lo_opts[] =3D {
@@ -378,9 +381,9 @@ static int lo_parent_and_name(struct lo_data *lo, struc=
t lo_inode *inode,
     int res;
=20
 retry:
-    sprintf(procname, "/proc/self/fd/%i", inode->fd);
+    sprintf(procname, "%i", inode->fd);
=20
-    res =3D readlink(procname, path, PATH_MAX);
+    res =3D readlinkat(lo->proc_self_fd, procname, path, PATH_MAX);
     if (res < 0) {
         fuse_log(FUSE_LOG_WARNING, "%s: readlink failed: %m\n", __func__);
         goto fail_noretry;
@@ -476,9 +479,9 @@ static int utimensat_empty(struct lo_data *lo, struct l=
o_inode *inode,
         }
         return res;
     }
-    sprintf(path, "/proc/self/fd/%i", inode->fd);
+    sprintf(path, "%i", inode->fd);
=20
-    return utimensat(AT_FDCWD, path, tv, 0);
+    return utimensat(lo->proc_self_fd, path, tv, 0);
=20
 fallback:
     res =3D lo_parent_and_name(lo, inode, path, &parent);
@@ -534,8 +537,8 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, =
struct stat *attr,
         if (fi) {
             res =3D fchmod(fd, attr->st_mode);
         } else {
-            sprintf(procname, "/proc/self/fd/%i", ifd);
-            res =3D chmod(procname, attr->st_mode);
+            sprintf(procname, "%i", ifd);
+            res =3D fchmodat(lo->proc_self_fd, procname, attr->st_mode, 0)=
;
         }
         if (res =3D=3D -1) {
             goto out_err;
@@ -551,11 +554,23 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino=
, struct stat *attr,
         }
     }
     if (valid & FUSE_SET_ATTR_SIZE) {
+        int truncfd;
+
         if (fi) {
-            res =3D ftruncate(fd, attr->st_size);
+            truncfd =3D fd;
         } else {
-            sprintf(procname, "/proc/self/fd/%i", ifd);
-            res =3D truncate(procname, attr->st_size);
+            sprintf(procname, "%i", ifd);
+            truncfd =3D openat(lo->proc_self_fd, procname, O_RDWR);
+            if (truncfd < 0) {
+                goto out_err;
+            }
+        }
+
+        res =3D ftruncate(truncfd, attr->st_size);
+        if (!fi) {
+            saverr =3D errno;
+            close(truncfd);
+            errno =3D saverr;
         }
         if (res =3D=3D -1) {
             goto out_err;
@@ -873,9 +888,9 @@ static int linkat_empty_nofollow(struct lo_data *lo, st=
ruct lo_inode *inode,
         return res;
     }
=20
-    sprintf(path, "/proc/self/fd/%i", inode->fd);
+    sprintf(path, "%i", inode->fd);
=20
-    return linkat(AT_FDCWD, path, dfd, name, AT_SYMLINK_FOLLOW);
+    return linkat(lo->proc_self_fd, path, dfd, name, AT_SYMLINK_FOLLOW);
=20
 fallback:
     res =3D lo_parent_and_name(lo, inode, path, &parent);
@@ -1403,8 +1418,8 @@ static void lo_open(fuse_req_t req, fuse_ino_t ino, s=
truct fuse_file_info *fi)
         fi->flags &=3D ~O_APPEND;
     }
=20
-    sprintf(buf, "/proc/self/fd/%i", lo_fd(req, ino));
-    fd =3D open(buf, fi->flags & ~O_NOFOLLOW);
+    sprintf(buf, "%i", lo_fd(req, ino));
+    fd =3D openat(lo->proc_self_fd, buf, fi->flags & ~O_NOFOLLOW);
     if (fd =3D=3D -1) {
         return (void)fuse_reply_err(req, errno);
     }
@@ -1457,7 +1472,6 @@ static void lo_fsync(fuse_req_t req, fuse_ino_t ino, =
int datasync,
                      struct fuse_file_info *fi)
 {
     int res;
-    (void)ino;
     int fd;
     char *buf;
=20
@@ -1465,12 +1479,14 @@ static void lo_fsync(fuse_req_t req, fuse_ino_t ino=
, int datasync,
              (void *)fi);
=20
     if (!fi) {
-        res =3D asprintf(&buf, "/proc/self/fd/%i", lo_fd(req, ino));
+        struct lo_data *lo =3D lo_data(req);
+
+        res =3D asprintf(&buf, "%i", lo_fd(req, ino));
         if (res =3D=3D -1) {
             return (void)fuse_reply_err(req, errno);
         }
=20
-        fd =3D open(buf, O_RDWR);
+        fd =3D openat(lo->proc_self_fd, buf, O_RDWR);
         free(buf);
         if (fd =3D=3D -1) {
             return (void)fuse_reply_err(req, errno);
@@ -1586,11 +1602,13 @@ static void lo_flock(fuse_req_t req, fuse_ino_t ino=
, struct fuse_file_info *fi,
 static void lo_getxattr(fuse_req_t req, fuse_ino_t ino, const char *name,
                         size_t size)
 {
+    struct lo_data *lo =3D lo_data(req);
     char *value =3D NULL;
     char procname[64];
     struct lo_inode *inode;
     ssize_t ret;
     int saverr;
+    int fd =3D -1;
=20
     inode =3D lo_inode(req, ino);
     if (!inode) {
@@ -1615,7 +1633,11 @@ static void lo_getxattr(fuse_req_t req, fuse_ino_t i=
no, const char *name,
         goto out;
     }
=20
-    sprintf(procname, "/proc/self/fd/%i", inode->fd);
+    sprintf(procname, "%i", inode->fd);
+    fd =3D openat(lo->proc_self_fd, procname, O_RDONLY);
+    if (fd < 0) {
+        goto out_err;
+    }
=20
     if (size) {
         value =3D malloc(size);
@@ -1623,7 +1645,7 @@ static void lo_getxattr(fuse_req_t req, fuse_ino_t in=
o, const char *name,
             goto out_err;
         }
=20
-        ret =3D getxattr(procname, name, value, size);
+        ret =3D fgetxattr(fd, name, value, size);
         if (ret =3D=3D -1) {
             goto out_err;
         }
@@ -1634,7 +1656,7 @@ static void lo_getxattr(fuse_req_t req, fuse_ino_t in=
o, const char *name,
=20
         fuse_reply_buf(req, value, ret);
     } else {
-        ret =3D getxattr(procname, name, NULL, 0);
+        ret =3D fgetxattr(fd, name, NULL, 0);
         if (ret =3D=3D -1) {
             goto out_err;
         }
@@ -1643,6 +1665,10 @@ static void lo_getxattr(fuse_req_t req, fuse_ino_t i=
no, const char *name,
     }
 out_free:
     free(value);
+
+    if (fd >=3D 0) {
+        close(fd);
+    }
     return;
=20
 out_err:
@@ -1654,11 +1680,13 @@ out:
=20
 static void lo_listxattr(fuse_req_t req, fuse_ino_t ino, size_t size)
 {
+    struct lo_data *lo =3D lo_data(req);
     char *value =3D NULL;
     char procname[64];
     struct lo_inode *inode;
     ssize_t ret;
     int saverr;
+    int fd =3D -1;
=20
     inode =3D lo_inode(req, ino);
     if (!inode) {
@@ -1682,7 +1710,11 @@ static void lo_listxattr(fuse_req_t req, fuse_ino_t =
ino, size_t size)
         goto out;
     }
=20
-    sprintf(procname, "/proc/self/fd/%i", inode->fd);
+    sprintf(procname, "%i", inode->fd);
+    fd =3D openat(lo->proc_self_fd, procname, O_RDONLY);
+    if (fd < 0) {
+        goto out_err;
+    }
=20
     if (size) {
         value =3D malloc(size);
@@ -1690,7 +1722,7 @@ static void lo_listxattr(fuse_req_t req, fuse_ino_t i=
no, size_t size)
             goto out_err;
         }
=20
-        ret =3D listxattr(procname, value, size);
+        ret =3D flistxattr(fd, value, size);
         if (ret =3D=3D -1) {
             goto out_err;
         }
@@ -1701,7 +1733,7 @@ static void lo_listxattr(fuse_req_t req, fuse_ino_t i=
no, size_t size)
=20
         fuse_reply_buf(req, value, ret);
     } else {
-        ret =3D listxattr(procname, NULL, 0);
+        ret =3D flistxattr(fd, NULL, 0);
         if (ret =3D=3D -1) {
             goto out_err;
         }
@@ -1710,6 +1742,10 @@ static void lo_listxattr(fuse_req_t req, fuse_ino_t =
ino, size_t size)
     }
 out_free:
     free(value);
+
+    if (fd >=3D 0) {
+        close(fd);
+    }
     return;
=20
 out_err:
@@ -1723,9 +1759,11 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t i=
no, const char *name,
                         const char *value, size_t size, int flags)
 {
     char procname[64];
+    struct lo_data *lo =3D lo_data(req);
     struct lo_inode *inode;
     ssize_t ret;
     int saverr;
+    int fd =3D -1;
=20
     inode =3D lo_inode(req, ino);
     if (!inode) {
@@ -1750,21 +1788,31 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t =
ino, const char *name,
         goto out;
     }
=20
-    sprintf(procname, "/proc/self/fd/%i", inode->fd);
+    sprintf(procname, "%i", inode->fd);
+    fd =3D openat(lo->proc_self_fd, procname, O_RDWR);
+    if (fd < 0) {
+        saverr =3D errno;
+        goto out;
+    }
=20
-    ret =3D setxattr(procname, name, value, size, flags);
+    ret =3D fsetxattr(fd, name, value, size, flags);
     saverr =3D ret =3D=3D -1 ? errno : 0;
=20
 out:
+    if (fd >=3D 0) {
+        close(fd);
+    }
     fuse_reply_err(req, saverr);
 }
=20
 static void lo_removexattr(fuse_req_t req, fuse_ino_t ino, const char *nam=
e)
 {
     char procname[64];
+    struct lo_data *lo =3D lo_data(req);
     struct lo_inode *inode;
     ssize_t ret;
     int saverr;
+    int fd =3D -1;
=20
     inode =3D lo_inode(req, ino);
     if (!inode) {
@@ -1788,12 +1836,20 @@ static void lo_removexattr(fuse_req_t req, fuse_ino=
_t ino, const char *name)
         goto out;
     }
=20
-    sprintf(procname, "/proc/self/fd/%i", inode->fd);
+    sprintf(procname, "%i", inode->fd);
+    fd =3D openat(lo->proc_self_fd, procname, O_RDWR);
+    if (fd < 0) {
+        saverr =3D errno;
+        goto out;
+    }
=20
-    ret =3D removexattr(procname, name);
+    ret =3D fremovexattr(fd, name);
     saverr =3D ret =3D=3D -1 ? errno : 0;
=20
 out:
+    if (fd >=3D 0) {
+        close(fd);
+    }
     fuse_reply_err(req, saverr);
 }
=20
@@ -1886,12 +1942,25 @@ static void print_capabilities(void)
     printf("}\n");
 }
=20
+static void setup_proc_self_fd(struct lo_data *lo)
+{
+    lo->proc_self_fd =3D open("/proc/self/fd", O_PATH);
+    if (lo->proc_self_fd =3D=3D -1) {
+        fuse_log(FUSE_LOG_ERR, "open(/proc/self/fd, O_PATH): %m\n");
+        exit(1);
+    }
+}
+
 int main(int argc, char *argv[])
 {
     struct fuse_args args =3D FUSE_ARGS_INIT(argc, argv);
     struct fuse_session *se;
     struct fuse_cmdline_opts opts;
-    struct lo_data lo =3D { .debug =3D 0, .writeback =3D 0 };
+    struct lo_data lo =3D {
+        .debug =3D 0,
+        .writeback =3D 0,
+        .proc_self_fd =3D -1,
+    };
     struct lo_map_elem *root_elem;
     int ret =3D -1;
=20
@@ -2002,6 +2071,9 @@ int main(int argc, char *argv[])
=20
     fuse_daemonize(opts.foreground);
=20
+    /* Must be after daemonize to get the right /proc/self/fd */
+    setup_proc_self_fd(&lo);
+
     /* Block until ctrl+c or fusermount -u */
     ret =3D virtio_loop(se);
=20
@@ -2017,6 +2089,10 @@ err_out1:
     lo_map_destroy(&lo.dirp_map);
     lo_map_destroy(&lo.ino_map);
=20
+    if (lo.proc_self_fd >=3D 0) {
+        close(lo.proc_self_fd);
+    }
+
     if (lo.root.fd >=3D 0) {
         close(lo.root.fd);
     }
--=20
2.24.1


