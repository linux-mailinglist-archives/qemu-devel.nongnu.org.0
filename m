Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6866143D9B
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 14:04:15 +0100 (CET)
Received: from localhost ([::1]:53512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ittCY-0002k9-64
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 08:04:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51556)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1itsd5-0007ds-2j
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:27:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1itsd3-0002nM-AY
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:27:34 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:58771
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1itsd3-0002n7-6X
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:27:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579609652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pVe7wvHKBehhCA55QXV1xkHtVCb1hkmnn0QWjHEjOXY=;
 b=DBzIqdiVw5FvkYgLuVh+IvXFfnzYitWx9zRB+ujK9fd+IS0/UQqCRbgnIsjk/rqkhi9x0e
 iuu2QRDImdk2erOuxfOTQHm/eQLNP+f5MdcTsSHEalGTP60oRlHTKDWMvZEwwVTnBvK3Jd
 1vQ3TOYyCJkQwLPdSNr5fjCof3YRtBw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-wv6TpE9FOx-ZbxFOxgLJmA-1; Tue, 21 Jan 2020 07:27:31 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3EE8F10054E3;
 Tue, 21 Jan 2020 12:27:30 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.118.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 60A9E60CD0;
 Tue, 21 Jan 2020 12:27:18 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com,
 berrange@redhat.com, slp@redhat.com, philmd@redhat.com
Subject: [PATCH v2 037/109] virtiofsd: passthrough_ll: add fd_map to hide file
 descriptors
Date: Tue, 21 Jan 2020 12:23:21 +0000
Message-Id: <20200121122433.50803-38-dgilbert@redhat.com>
In-Reply-To: <20200121122433.50803-1-dgilbert@redhat.com>
References: <20200121122433.50803-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: wv6TpE9FOx-ZbxFOxgLJmA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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

Do not expose file descriptor numbers to clients.  This prevents the
abuse of internal file descriptors (like stdin/stdout).

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Fix from:
Signed-off-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
dgilbert:
  Added lseek
Reviewed-by: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>
---
 tools/virtiofsd/passthrough_ll.c | 116 +++++++++++++++++++++++++------
 1 file changed, 94 insertions(+), 22 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c
index 927473d74a..327b5c1bf8 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -59,6 +59,7 @@ struct lo_map_elem {
     union {
         struct lo_inode *inode;
         struct lo_dirp *dirp;
+        int fd;
         ssize_t freelist;
     };
     bool in_use;
@@ -106,6 +107,7 @@ struct lo_data {
     struct lo_inode root; /* protected by lo->mutex */
     struct lo_map ino_map; /* protected by lo->mutex */
     struct lo_map dirp_map; /* protected by lo->mutex */
+    struct lo_map fd_map; /* protected by lo->mutex */
 };
=20
 static const struct fuse_opt lo_opts[] =3D {
@@ -235,6 +237,20 @@ static void lo_map_remove(struct lo_map *map, size_t k=
ey)
     map->freelist =3D key;
 }
=20
+/* Assumes lo->mutex is held */
+static ssize_t lo_add_fd_mapping(fuse_req_t req, int fd)
+{
+    struct lo_map_elem *elem;
+
+    elem =3D lo_map_alloc_elem(&lo_data(req)->fd_map);
+    if (!elem) {
+        return -1;
+    }
+
+    elem->fd =3D fd;
+    return elem - lo_data(req)->fd_map.elems;
+}
+
 /* Assumes lo->mutex is held */
 static ssize_t lo_add_dirp_mapping(fuse_req_t req, struct lo_dirp *dirp)
 {
@@ -349,6 +365,22 @@ static int utimensat_empty_nofollow(struct lo_inode *i=
node,
     return utimensat(AT_FDCWD, procname, tv, 0);
 }
=20
+static int lo_fi_fd(fuse_req_t req, struct fuse_file_info *fi)
+{
+    struct lo_data *lo =3D lo_data(req);
+    struct lo_map_elem *elem;
+
+    pthread_mutex_lock(&lo->mutex);
+    elem =3D lo_map_get(&lo->fd_map, fi->fh);
+    pthread_mutex_unlock(&lo->mutex);
+
+    if (!elem) {
+        return -1;
+    }
+
+    return elem->fd;
+}
+
 static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
                        int valid, struct fuse_file_info *fi)
 {
@@ -357,6 +389,7 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, =
struct stat *attr,
     struct lo_inode *inode;
     int ifd;
     int res;
+    int fd;
=20
     inode =3D lo_inode(req, ino);
     if (!inode) {
@@ -366,9 +399,14 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino,=
 struct stat *attr,
=20
     ifd =3D inode->fd;
=20
+    /* If fi->fh is invalid we'll report EBADF later */
+    if (fi) {
+        fd =3D lo_fi_fd(req, fi);
+    }
+
     if (valid & FUSE_SET_ATTR_MODE) {
         if (fi) {
-            res =3D fchmod(fi->fh, attr->st_mode);
+            res =3D fchmod(fd, attr->st_mode);
         } else {
             sprintf(procname, "/proc/self/fd/%i", ifd);
             res =3D chmod(procname, attr->st_mode);
@@ -388,7 +426,7 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, =
struct stat *attr,
     }
     if (valid & FUSE_SET_ATTR_SIZE) {
         if (fi) {
-            res =3D ftruncate(fi->fh, attr->st_size);
+            res =3D ftruncate(fd, attr->st_size);
         } else {
             sprintf(procname, "/proc/self/fd/%i", ifd);
             res =3D truncate(procname, attr->st_size);
@@ -418,7 +456,7 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, =
struct stat *attr,
         }
=20
         if (fi) {
-            res =3D futimens(fi->fh, tv);
+            res =3D futimens(fd, tv);
         } else {
             res =3D utimensat_empty_nofollow(inode, tv);
         }
@@ -1095,7 +1133,18 @@ static void lo_create(fuse_req_t req, fuse_ino_t par=
ent, const char *name,
     lo_restore_cred(&old);
=20
     if (!err) {
-        fi->fh =3D fd;
+        ssize_t fh;
+
+        pthread_mutex_lock(&lo->mutex);
+        fh =3D lo_add_fd_mapping(req, fd);
+        pthread_mutex_unlock(&lo->mutex);
+        if (fh =3D=3D -1) {
+            close(fd);
+            fuse_reply_err(req, ENOMEM);
+            return;
+        }
+
+        fi->fh =3D fh;
         err =3D lo_do_lookup(req, parent, name, &e);
     }
     if (lo->cache =3D=3D CACHE_NEVER) {
@@ -1139,6 +1188,7 @@ static void lo_fsyncdir(fuse_req_t req, fuse_ino_t in=
o, int datasync,
 static void lo_open(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info =
*fi)
 {
     int fd;
+    ssize_t fh;
     char buf[64];
     struct lo_data *lo =3D lo_data(req);
=20
@@ -1174,7 +1224,16 @@ static void lo_open(fuse_req_t req, fuse_ino_t ino, =
struct fuse_file_info *fi)
         return (void)fuse_reply_err(req, errno);
     }
=20
-    fi->fh =3D fd;
+    pthread_mutex_lock(&lo->mutex);
+    fh =3D lo_add_fd_mapping(req, fd);
+    pthread_mutex_unlock(&lo->mutex);
+    if (fh =3D=3D -1) {
+        close(fd);
+        fuse_reply_err(req, ENOMEM);
+        return;
+    }
+
+    fi->fh =3D fh;
     if (lo->cache =3D=3D CACHE_NEVER) {
         fi->direct_io =3D 1;
     } else if (lo->cache =3D=3D CACHE_ALWAYS) {
@@ -1186,9 +1245,18 @@ static void lo_open(fuse_req_t req, fuse_ino_t ino, =
struct fuse_file_info *fi)
 static void lo_release(fuse_req_t req, fuse_ino_t ino,
                        struct fuse_file_info *fi)
 {
+    struct lo_data *lo =3D lo_data(req);
+    int fd;
+
     (void)ino;
=20
-    close(fi->fh);
+    fd =3D lo_fi_fd(req, fi);
+
+    pthread_mutex_lock(&lo->mutex);
+    lo_map_remove(&lo->fd_map, fi->fh);
+    pthread_mutex_unlock(&lo->mutex);
+
+    close(fd);
     fuse_reply_err(req, 0);
 }
=20
@@ -1196,7 +1264,7 @@ static void lo_flush(fuse_req_t req, fuse_ino_t ino, =
struct fuse_file_info *fi)
 {
     int res;
     (void)ino;
-    res =3D close(dup(fi->fh));
+    res =3D close(dup(lo_fi_fd(req, fi)));
     fuse_reply_err(req, res =3D=3D -1 ? errno : 0);
 }
=20
@@ -1223,7 +1291,7 @@ static void lo_fsync(fuse_req_t req, fuse_ino_t ino, =
int datasync,
             return (void)fuse_reply_err(req, errno);
         }
     } else {
-        fd =3D fi->fh;
+        fd =3D lo_fi_fd(req, fi);
     }
=20
     if (datasync) {
@@ -1250,7 +1318,7 @@ static void lo_read(fuse_req_t req, fuse_ino_t ino, s=
ize_t size, off_t offset,
     }
=20
     buf.buf[0].flags =3D FUSE_BUF_IS_FD | FUSE_BUF_FD_SEEK;
-    buf.buf[0].fd =3D fi->fh;
+    buf.buf[0].fd =3D lo_fi_fd(req, fi);
     buf.buf[0].pos =3D offset;
=20
     fuse_reply_data(req, &buf, FUSE_BUF_SPLICE_MOVE);
@@ -1265,7 +1333,7 @@ static void lo_write_buf(fuse_req_t req, fuse_ino_t i=
no,
     struct fuse_bufvec out_buf =3D FUSE_BUFVEC_INIT(fuse_buf_size(in_buf))=
;
=20
     out_buf.buf[0].flags =3D FUSE_BUF_IS_FD | FUSE_BUF_FD_SEEK;
-    out_buf.buf[0].fd =3D fi->fh;
+    out_buf.buf[0].fd =3D lo_fi_fd(req, fi);
     out_buf.buf[0].pos =3D off;
=20
     if (lo_debug(req)) {
@@ -1302,7 +1370,7 @@ static void lo_fallocate(fuse_req_t req, fuse_ino_t i=
no, int mode, off_t offset,
     (void)ino;
=20
 #ifdef CONFIG_FALLOCATE
-    err =3D fallocate(fi->fh, mode, offset, length);
+    err =3D fallocate(lo_fi_fd(req, fi), mode, offset, length);
     if (err < 0) {
         err =3D errno;
     }
@@ -1313,7 +1381,7 @@ static void lo_fallocate(fuse_req_t req, fuse_ino_t i=
no, int mode, off_t offset,
         return;
     }
=20
-    err =3D posix_fallocate(fi->fh, offset, length);
+    err =3D posix_fallocate(lo_fi_fd(req, fi), offset, length);
 #endif
=20
     fuse_reply_err(req, err);
@@ -1325,7 +1393,7 @@ static void lo_flock(fuse_req_t req, fuse_ino_t ino, =
struct fuse_file_info *fi,
     int res;
     (void)ino;
=20
-    res =3D flock(fi->fh, op);
+    res =3D flock(lo_fi_fd(req, fi), op);
=20
     fuse_reply_err(req, res =3D=3D -1 ? errno : 0);
 }
@@ -1550,17 +1618,19 @@ static void lo_copy_file_range(fuse_req_t req, fuse=
_ino_t ino_in, off_t off_in,
                                off_t off_out, struct fuse_file_info *fi_ou=
t,
                                size_t len, int flags)
 {
+    int in_fd, out_fd;
     ssize_t res;
=20
-    if (lo_debug(req))
-        fuse_log(FUSE_LOG_DEBUG,
-                 "lo_copy_file_range(ino=3D%" PRIu64 "/fd=3D%lu, "
-                 "off=3D%lu, ino=3D%" PRIu64 "/fd=3D%lu, "
-                 "off=3D%lu, size=3D%zd, flags=3D0x%x)\n",
-                 ino_in, fi_in->fh, off_in, ino_out, fi_out->fh, off_out, =
len,
-                 flags);
+    in_fd =3D lo_fi_fd(req, fi_in);
+    out_fd =3D lo_fi_fd(req, fi_out);
+
+    fuse_log(FUSE_LOG_DEBUG,
+             "lo_copy_file_range(ino=3D%" PRIu64 "/fd=3D%d, "
+             "off=3D%lu, ino=3D%" PRIu64 "/fd=3D%d, "
+             "off=3D%lu, size=3D%zd, flags=3D0x%x)\n",
+             ino_in, in_fd, off_in, ino_out, out_fd, off_out, len, flags);
=20
-    res =3D copy_file_range(fi_in->fh, &off_in, fi_out->fh, &off_out, len,=
 flags);
+    res =3D copy_file_range(in_fd, &off_in, out_fd, &off_out, len, flags);
     if (res < 0) {
         fuse_reply_err(req, -errno);
     } else {
@@ -1575,7 +1645,7 @@ static void lo_lseek(fuse_req_t req, fuse_ino_t ino, =
off_t off, int whence,
     off_t res;
=20
     (void)ino;
-    res =3D lseek(fi->fh, off, whence);
+    res =3D lseek(lo_fi_fd(req, fi), off, whence);
     if (res !=3D -1) {
         fuse_reply_lseek(req, res);
     } else {
@@ -1660,6 +1730,7 @@ int main(int argc, char *argv[])
     root_elem->inode =3D &lo.root;
=20
     lo_map_init(&lo.dirp_map);
+    lo_map_init(&lo.fd_map);
=20
     if (fuse_parse_cmdline(&args, &opts) !=3D 0) {
         return 1;
@@ -1757,6 +1828,7 @@ err_out2:
 err_out1:
     fuse_opt_free_args(&args);
=20
+    lo_map_destroy(&lo.fd_map);
     lo_map_destroy(&lo.dirp_map);
     lo_map_destroy(&lo.ino_map);
=20
--=20
2.24.1


