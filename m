Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F863DBBC7
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 17:11:49 +0200 (CEST)
Received: from localhost ([::1]:48670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9UAu-00063i-1l
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 11:11:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m9U2N-0006DN-Qj
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 11:02:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m9U2L-0007x4-Hh
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 11:02:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627657377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zj6FlfRk0Y1iH5pn3wm7uFE+2a56sGUjaPe4skrCOY8=;
 b=Sjv0I4INhrSMgN8vZ7z/h5OFMJZc7KCIBPNJJJww2K8aGqtH1OwVLwB9XPhSdJARBAqwgJ
 k0HR/ADSkBP/ZiwfRwAj0XdIiUOW/nowuhIT2jYyGrNvh8J9xbkwt6/Nep61ee5WPrnV46
 lluH/ctzwyDK+rhN3VHNoEQK7KEtyQA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-R8SrVj77NBeaBDyrMtrILw-1; Fri, 30 Jul 2021 11:02:55 -0400
X-MC-Unique: R8SrVj77NBeaBDyrMtrILw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF3188914F8
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 15:02:29 +0000 (UTC)
Received: from localhost (unknown [10.39.193.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6EC4710074FD;
 Fri, 30 Jul 2021 15:02:20 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH v3 06/10] virtiofsd: Let lo_inode_open() return a TempFd
Date: Fri, 30 Jul 2021 17:01:30 +0200
Message-Id: <20210730150134.216126-7-mreitz@redhat.com>
In-Reply-To: <20210730150134.216126-1-mreitz@redhat.com>
References: <20210730150134.216126-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Strictly speaking, this is not necessary, because lo_inode_open() will
always return a new FD owned by the caller, so TempFd.owned will always
be true.

However, auto-cleanup is nice, and in some cases this plays nicely with
an lo_inode_fd() call in another conditional branch (see lo_setattr()).

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 138 +++++++++++++------------------
 1 file changed, 59 insertions(+), 79 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 9e1bc37af8..292b7f7e27 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -291,10 +291,8 @@ static void temp_fd_clear(TempFd *temp_fd)
 /**
  * Return an owned fd from *temp_fd that will not be closed when
  * *temp_fd goes out of scope.
- *
- * (TODO: Remove __attribute__ once this is used.)
  */
-static __attribute__((unused)) int temp_fd_steal(TempFd *temp_fd)
+static int temp_fd_steal(TempFd *temp_fd)
 {
     if (temp_fd->owned) {
         temp_fd->owned = false;
@@ -673,9 +671,12 @@ static int lo_fd(fuse_req_t req, fuse_ino_t ino, TempFd *tfd)
  * when a malicious client opens special files such as block device nodes.
  * Symlink inodes are also rejected since symlinks must already have been
  * traversed on the client side.
+ *
+ * The fd is returned in tfd->fd.  The return value is 0 on success and -errno
+ * otherwise.
  */
-static int lo_inode_open(struct lo_data *lo, struct lo_inode *inode,
-                         int open_flags)
+static int lo_inode_open(const struct lo_data *lo, const struct lo_inode *inode,
+                         int open_flags, TempFd *tfd)
 {
     g_autofree char *fd_str = g_strdup_printf("%d", inode->fd);
     int fd;
@@ -694,7 +695,13 @@ static int lo_inode_open(struct lo_data *lo, struct lo_inode *inode,
     if (fd < 0) {
         return -errno;
     }
-    return fd;
+
+    *tfd = (TempFd) {
+        .fd = fd,
+        .owned = true,
+    };
+
+    return 0;
 }
 
 static void lo_init(void *userdata, struct fuse_conn_info *conn)
@@ -852,7 +859,12 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
         return;
     }
 
-    res = lo_inode_fd(inode, &inode_fd);
+    if (!fi && (valid & FUSE_SET_ATTR_SIZE)) {
+        /* We need an O_RDWR FD for ftruncate() */
+        res = lo_inode_open(lo, inode, O_RDWR, &inode_fd);
+    } else {
+        res = lo_inode_fd(inode, &inode_fd);
+    }
     if (res < 0) {
         saverr = -res;
         goto out_err;
@@ -900,18 +912,11 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
         if (fi) {
             truncfd = fd;
         } else {
-            truncfd = lo_inode_open(lo, inode, O_RDWR);
-            if (truncfd < 0) {
-                saverr = -truncfd;
-                goto out_err;
-            }
+            truncfd = inode_fd.fd;
         }
 
         saverr = drop_security_capability(lo, truncfd);
         if (saverr) {
-            if (!fi) {
-                close(truncfd);
-            }
             goto out_err;
         }
 
@@ -919,9 +924,6 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
             res = drop_effective_cap("FSETID", &cap_fsetid_dropped);
             if (res != 0) {
                 saverr = res;
-                if (!fi) {
-                    close(truncfd);
-                }
                 goto out_err;
             }
         }
@@ -934,9 +936,6 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
                 fuse_log(FUSE_LOG_ERR, "Failed to gain CAP_FSETID\n");
             }
         }
-        if (!fi) {
-            close(truncfd);
-        }
         if (res == -1) {
             goto out_err;
         }
@@ -1822,11 +1821,12 @@ static struct lo_dirp *lo_dirp(fuse_req_t req, struct fuse_file_info *fi)
 static void lo_opendir(fuse_req_t req, fuse_ino_t ino,
                        struct fuse_file_info *fi)
 {
+    g_auto(TempFd) inode_fd = TEMP_FD_INIT;
     int error = ENOMEM;
     struct lo_data *lo = lo_data(req);
     struct lo_inode *inode;
     struct lo_dirp *d = NULL;
-    int fd;
+    int res;
     ssize_t fh;
 
     inode = lo_inode(req, ino);
@@ -1840,13 +1840,13 @@ static void lo_opendir(fuse_req_t req, fuse_ino_t ino,
         goto out_err;
     }
 
-    fd = lo_inode_open(lo, inode, O_RDONLY);
-    if (fd < 0) {
-        error = -fd;
+    res = lo_inode_open(lo, inode, O_RDONLY, &inode_fd);
+    if (res < 0) {
+        error = -res;
         goto out_err;
     }
 
-    d->dp = fdopendir(fd);
+    d->dp = fdopendir(temp_fd_steal(&inode_fd));
     if (d->dp == NULL) {
         goto out_errno;
     }
@@ -1876,8 +1876,6 @@ out_err:
     if (d) {
         if (d->dp) {
             closedir(d->dp);
-        } else if (fd != -1) {
-            close(fd);
         }
         free(d);
     }
@@ -2077,6 +2075,7 @@ static void update_open_flags(int writeback, int allow_direct_io,
 static int lo_do_open(struct lo_data *lo, struct lo_inode *inode,
                       int existing_fd, struct fuse_file_info *fi)
 {
+    g_auto(TempFd) inode_fd = TEMP_FD_INIT;
     ssize_t fh;
     int fd = existing_fd;
     int err;
@@ -2093,16 +2092,18 @@ static int lo_do_open(struct lo_data *lo, struct lo_inode *inode,
             }
         }
 
-        fd = lo_inode_open(lo, inode, fi->flags);
+        err = lo_inode_open(lo, inode, fi->flags, &inode_fd);
 
         if (cap_fsetid_dropped) {
             if (gain_effective_cap("FSETID")) {
                 fuse_log(FUSE_LOG_ERR, "Failed to gain CAP_FSETID\n");
             }
         }
-        if (fd < 0) {
-            return -fd;
+        if (err < 0) {
+            return -err;
         }
+        fd = temp_fd_steal(&inode_fd);
+
         if (fi->flags & (O_TRUNC)) {
             int err = drop_security_capability(lo, fd);
             if (err) {
@@ -2212,8 +2213,9 @@ static struct lo_inode_plock *lookup_create_plock_ctx(struct lo_data *lo,
                                                       uint64_t lock_owner,
                                                       pid_t pid, int *err)
 {
+    g_auto(TempFd) inode_fd = TEMP_FD_INIT;
     struct lo_inode_plock *plock;
-    int fd;
+    int res;
 
     plock =
         g_hash_table_lookup(inode->posix_locks, GUINT_TO_POINTER(lock_owner));
@@ -2230,15 +2232,15 @@ static struct lo_inode_plock *lookup_create_plock_ctx(struct lo_data *lo,
 
     /* Open another instance of file which can be used for ofd locks. */
     /* TODO: What if file is not writable? */
-    fd = lo_inode_open(lo, inode, O_RDWR);
-    if (fd < 0) {
-        *err = -fd;
+    res = lo_inode_open(lo, inode, O_RDWR, &inode_fd);
+    if (res < 0) {
+        *err = -res;
         free(plock);
         return NULL;
     }
 
     plock->lock_owner = lock_owner;
-    plock->fd = fd;
+    plock->fd = temp_fd_steal(&inode_fd);
     g_hash_table_insert(inode->posix_locks, GUINT_TO_POINTER(plock->lock_owner),
                         plock);
     return plock;
@@ -2454,6 +2456,7 @@ static void lo_flush(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi)
 static void lo_fsync(fuse_req_t req, fuse_ino_t ino, int datasync,
                      struct fuse_file_info *fi)
 {
+    g_auto(TempFd) inode_fd = TEMP_FD_INIT;
     struct lo_inode *inode = lo_inode(req, ino);
     struct lo_data *lo = lo_data(req);
     int res;
@@ -2468,11 +2471,12 @@ static void lo_fsync(fuse_req_t req, fuse_ino_t ino, int datasync,
     }
 
     if (!fi) {
-        fd = lo_inode_open(lo, inode, O_RDWR);
-        if (fd < 0) {
-            res = -fd;
+        res = lo_inode_open(lo, inode, O_RDWR, &inode_fd);
+        if (res < 0) {
+            res = -res;
             goto out;
         }
+        fd = inode_fd.fd;
     } else {
         fd = lo_fi_fd(req, fi);
     }
@@ -2482,9 +2486,6 @@ static void lo_fsync(fuse_req_t req, fuse_ino_t ino, int datasync,
     } else {
         res = fsync(fd) == -1 ? errno : 0;
     }
-    if (!fi) {
-        close(fd);
-    }
 out:
     lo_inode_put(lo, &inode);
     fuse_reply_err(req, res);
@@ -3047,7 +3048,6 @@ static void lo_getxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
     struct lo_inode *inode;
     ssize_t ret;
     int saverr;
-    int fd = -1;
 
     if (block_xattr(lo, in_name)) {
         fuse_reply_err(req, EOPNOTSUPP);
@@ -3099,12 +3099,12 @@ static void lo_getxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
      * Otherwise, call fchdir() to avoid open().
      */
     if (S_ISREG(inode->filetype) || S_ISDIR(inode->filetype)) {
-        fd = lo_inode_open(lo, inode, O_RDONLY);
-        if (fd < 0) {
-            saverr = -fd;
+        ret = lo_inode_open(lo, inode, O_RDONLY, &inode_fd);
+        if (ret < 0) {
+            saverr = -ret;
             goto out;
         }
-        ret = fgetxattr(fd, name, value, size);
+        ret = fgetxattr(inode_fd.fd, name, value, size);
         saverr = ret == -1 ? errno : 0;
     } else {
         ret = lo_inode_fd(inode, &inode_fd);
@@ -3133,10 +3133,6 @@ static void lo_getxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
         fuse_reply_xattr(req, ret);
     }
 out_free:
-    if (fd >= 0) {
-        close(fd);
-    }
-
     lo_inode_put(lo, &inode);
     return;
 
@@ -3157,7 +3153,6 @@ static void lo_listxattr(fuse_req_t req, fuse_ino_t ino, size_t size)
     struct lo_inode *inode;
     ssize_t ret;
     int saverr;
-    int fd = -1;
 
     inode = lo_inode(req, ino);
     if (!inode) {
@@ -3181,12 +3176,12 @@ static void lo_listxattr(fuse_req_t req, fuse_ino_t ino, size_t size)
     }
 
     if (S_ISREG(inode->filetype) || S_ISDIR(inode->filetype)) {
-        fd = lo_inode_open(lo, inode, O_RDONLY);
-        if (fd < 0) {
-            saverr = -fd;
+        ret = lo_inode_open(lo, inode, O_RDONLY, &inode_fd);
+        if (ret < 0) {
+            saverr = -ret;
             goto out;
         }
-        ret = flistxattr(fd, value, size);
+        ret = flistxattr(inode_fd.fd, value, size);
         saverr = ret == -1 ? errno : 0;
     } else {
         ret = lo_inode_fd(inode, &inode_fd);
@@ -3273,10 +3268,6 @@ static void lo_listxattr(fuse_req_t req, fuse_ino_t ino, size_t size)
         fuse_reply_xattr(req, ret);
     }
 out_free:
-    if (fd >= 0) {
-        close(fd);
-    }
-
     lo_inode_put(lo, &inode);
     return;
 
@@ -3299,7 +3290,6 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
     struct lo_inode *inode;
     ssize_t ret;
     int saverr;
-    int fd = -1;
     bool switched_creds = false;
     bool cap_fsetid_dropped = false;
     struct lo_cred old = {};
@@ -3345,9 +3335,9 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
      */
     open_inode = S_ISREG(inode->filetype) || S_ISDIR(inode->filetype);
     if (open_inode) {
-        fd = lo_inode_open(lo, inode, O_RDONLY);
-        if (fd < 0) {
-            saverr = -fd;
+        ret = lo_inode_open(lo, inode, O_RDONLY, &inode_fd);
+        if (ret < 0) {
+            saverr = -ret;
             goto out;
         }
     } else {
@@ -3382,8 +3372,7 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
         switched_creds = true;
     }
     if (open_inode) {
-        assert(fd >= 0);
-        ret = fsetxattr(fd, name, value, size, flags);
+        ret = fsetxattr(inode_fd.fd, name, value, size, flags);
         saverr = ret == -1 ? errno : 0;
     } else {
         ret = setxattr(procname, name, value, size, flags);
@@ -3402,10 +3391,6 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
     }
 
 out:
-    if (fd >= 0) {
-        close(fd);
-    }
-
     lo_inode_put(lo, &inode);
     g_free(mapped_name);
     fuse_reply_err(req, saverr);
@@ -3421,7 +3406,6 @@ static void lo_removexattr(fuse_req_t req, fuse_ino_t ino, const char *in_name)
     struct lo_inode *inode;
     ssize_t ret;
     int saverr;
-    int fd = -1;
 
     if (block_xattr(lo, in_name)) {
         fuse_reply_err(req, EOPNOTSUPP);
@@ -3457,12 +3441,12 @@ static void lo_removexattr(fuse_req_t req, fuse_ino_t ino, const char *in_name)
              name);
 
     if (S_ISREG(inode->filetype) || S_ISDIR(inode->filetype)) {
-        fd = lo_inode_open(lo, inode, O_RDONLY);
-        if (fd < 0) {
-            saverr = -fd;
+        ret = lo_inode_open(lo, inode, O_RDONLY, &inode_fd);
+        if (ret < 0) {
+            saverr = -ret;
             goto out;
         }
-        ret = fremovexattr(fd, name);
+        ret = fremovexattr(inode_fd.fd, name);
         saverr = ret == -1 ? errno : 0;
     } else {
         ret = lo_inode_fd(inode, &inode_fd);
@@ -3479,10 +3463,6 @@ static void lo_removexattr(fuse_req_t req, fuse_ino_t ino, const char *in_name)
     }
 
 out:
-    if (fd >= 0) {
-        close(fd);
-    }
-
     lo_inode_put(lo, &inode);
     g_free(mapped_name);
     fuse_reply_err(req, saverr);
-- 
2.31.1


