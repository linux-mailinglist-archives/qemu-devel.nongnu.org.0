Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B11C73A1A60
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 18:02:12 +0200 (CEST)
Received: from localhost ([::1]:34716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr0eg-00088A-GH
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 12:02:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lr0ZT-0004mi-Nf
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 11:56:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lr0ZR-00076u-Da
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 11:56:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623254204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o6D4yTXUmptWWqJQrdPx8oWLxR5NxBLjQbwOmLBawuY=;
 b=EHM1U4SDJ4oXcvRSydeOio6HJXtpCkrUF+tYqDS3cB7hnuEQCFoE7niBWHY16J+mfVuSqG
 radrvk2bUMy5BLazdfUlQK4hlTcKbs0d7kuRJHMpGJpEefjt8w1Ne0YMuhXbo0XZkH6kS3
 D+bqVB46rJ7ymX4tI+AQsH98VfDtcGQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-ZmeZf8IJOZi3UOvKiEbqjg-1; Wed, 09 Jun 2021 11:56:43 -0400
X-MC-Unique: ZmeZf8IJOZi3UOvKiEbqjg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1E5919251A1
 for <qemu-devel@nongnu.org>; Wed,  9 Jun 2021 15:56:42 +0000 (UTC)
Received: from localhost (ovpn-114-102.ams2.redhat.com [10.36.114.102])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C7FD4105C860;
 Wed,  9 Jun 2021 15:56:35 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH v2 5/9] virtiofsd: Let lo_inode_open() return a TempFd
Date: Wed,  9 Jun 2021 17:55:47 +0200
Message-Id: <20210609155551.44437-6-mreitz@redhat.com>
In-Reply-To: <20210609155551.44437-1-mreitz@redhat.com>
References: <20210609155551.44437-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01 autolearn=ham autolearn_force=no
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
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Strictly speaking, this is not necessary, because lo_inode_open() will
always return a new FD owned by the caller, so TempFd.owned will always
be true.

However, auto-cleanup is nice, and in some cases this plays nicely with
an lo_inode_fd() call in another conditional branch (see lo_setattr()).

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 137 +++++++++++++------------------
 1 file changed, 59 insertions(+), 78 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 8f64bcd6c5..3014e8baf8 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -285,10 +285,8 @@ static void temp_fd_clear(TempFd *temp_fd)
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
@@ -667,9 +665,12 @@ static int lo_fd(fuse_req_t req, fuse_ino_t ino, TempFd *tfd)
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
@@ -688,7 +689,13 @@ static int lo_inode_open(struct lo_data *lo, struct lo_inode *inode,
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
@@ -820,7 +827,12 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
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
@@ -868,18 +880,11 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
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
 
@@ -887,9 +892,6 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
             res = drop_effective_cap("FSETID", &cap_fsetid_dropped);
             if (res != 0) {
                 saverr = res;
-                if (!fi) {
-                    close(truncfd);
-                }
                 goto out_err;
             }
         }
@@ -902,9 +904,6 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
                 fuse_log(FUSE_LOG_ERR, "Failed to gain CAP_FSETID\n");
             }
         }
-        if (!fi) {
-            close(truncfd);
-        }
         if (res == -1) {
             goto out_err;
         }
@@ -1734,11 +1733,12 @@ static struct lo_dirp *lo_dirp(fuse_req_t req, struct fuse_file_info *fi)
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
@@ -1752,13 +1752,13 @@ static void lo_opendir(fuse_req_t req, fuse_ino_t ino,
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
@@ -1788,8 +1788,6 @@ out_err:
     if (d) {
         if (d->dp) {
             closedir(d->dp);
-        } else if (fd != -1) {
-            close(fd);
         }
         free(d);
     }
@@ -1989,6 +1987,7 @@ static void update_open_flags(int writeback, int allow_direct_io,
 static int lo_do_open(struct lo_data *lo, struct lo_inode *inode,
                       int existing_fd, struct fuse_file_info *fi)
 {
+    g_auto(TempFd) inode_fd = TEMP_FD_INIT;
     ssize_t fh;
     int fd = existing_fd;
     int err;
@@ -2005,16 +2004,18 @@ static int lo_do_open(struct lo_data *lo, struct lo_inode *inode,
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
@@ -2124,8 +2125,9 @@ static struct lo_inode_plock *lookup_create_plock_ctx(struct lo_data *lo,
                                                       uint64_t lock_owner,
                                                       pid_t pid, int *err)
 {
+    g_auto(TempFd) inode_fd = TEMP_FD_INIT;
     struct lo_inode_plock *plock;
-    int fd;
+    int res;
 
     plock =
         g_hash_table_lookup(inode->posix_locks, GUINT_TO_POINTER(lock_owner));
@@ -2142,15 +2144,15 @@ static struct lo_inode_plock *lookup_create_plock_ctx(struct lo_data *lo,
 
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
@@ -2366,6 +2368,7 @@ static void lo_flush(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi)
 static void lo_fsync(fuse_req_t req, fuse_ino_t ino, int datasync,
                      struct fuse_file_info *fi)
 {
+    g_auto(TempFd) inode_fd = TEMP_FD_INIT;
     struct lo_inode *inode = lo_inode(req, ino);
     struct lo_data *lo = lo_data(req);
     int res;
@@ -2380,11 +2383,12 @@ static void lo_fsync(fuse_req_t req, fuse_ino_t ino, int datasync,
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
@@ -2394,9 +2398,6 @@ static void lo_fsync(fuse_req_t req, fuse_ino_t ino, int datasync,
     } else {
         res = fsync(fd) == -1 ? errno : 0;
     }
-    if (!fi) {
-        close(fd);
-    }
 out:
     lo_inode_put(lo, &inode);
     fuse_reply_err(req, res);
@@ -2902,7 +2903,6 @@ static void lo_getxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
     struct lo_inode *inode;
     ssize_t ret;
     int saverr;
-    int fd = -1;
 
     mapped_name = NULL;
     name = in_name;
@@ -2949,12 +2949,12 @@ static void lo_getxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
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
     } else {
         ret = lo_inode_fd(inode, &inode_fd);
         if (ret < 0) {
@@ -2981,10 +2981,6 @@ static void lo_getxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
         fuse_reply_xattr(req, ret);
     }
 out_free:
-    if (fd >= 0) {
-        close(fd);
-    }
-
     lo_inode_put(lo, &inode);
     return;
 
@@ -3005,7 +3001,6 @@ static void lo_listxattr(fuse_req_t req, fuse_ino_t ino, size_t size)
     struct lo_inode *inode;
     ssize_t ret;
     int saverr;
-    int fd = -1;
 
     inode = lo_inode(req, ino);
     if (!inode) {
@@ -3029,12 +3024,12 @@ static void lo_listxattr(fuse_req_t req, fuse_ino_t ino, size_t size)
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
     } else {
         ret = lo_inode_fd(inode, &inode_fd);
         if (ret < 0) {
@@ -3113,10 +3108,6 @@ static void lo_listxattr(fuse_req_t req, fuse_ino_t ino, size_t size)
         fuse_reply_xattr(req, ret);
     }
 out_free:
-    if (fd >= 0) {
-        close(fd);
-    }
-
     lo_inode_put(lo, &inode);
     return;
 
@@ -3138,7 +3129,6 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
     struct lo_inode *inode;
     ssize_t ret;
     int saverr;
-    int fd = -1;
 
     mapped_name = NULL;
     name = in_name;
@@ -3169,12 +3159,12 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
              ", name=%s value=%s size=%zd)\n", ino, name, value, size);
 
     if (S_ISREG(inode->filetype) || S_ISDIR(inode->filetype)) {
-        fd = lo_inode_open(lo, inode, O_RDONLY);
-        if (fd < 0) {
-            saverr = -fd;
+        ret = lo_inode_open(lo, inode, O_RDONLY, &inode_fd);
+        if (ret < 0) {
+            saverr = -ret;
             goto out;
         }
-        ret = fsetxattr(fd, name, value, size, flags);
+        ret = fsetxattr(inode_fd.fd, name, value, size, flags);
     } else {
         ret = lo_inode_fd(inode, &inode_fd);
         if (ret < 0) {
@@ -3191,10 +3181,6 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
     saverr = ret == -1 ? errno : 0;
 
 out:
-    if (fd >= 0) {
-        close(fd);
-    }
-
     lo_inode_put(lo, &inode);
     g_free(mapped_name);
     fuse_reply_err(req, saverr);
@@ -3210,7 +3196,6 @@ static void lo_removexattr(fuse_req_t req, fuse_ino_t ino, const char *in_name)
     struct lo_inode *inode;
     ssize_t ret;
     int saverr;
-    int fd = -1;
 
     mapped_name = NULL;
     name = in_name;
@@ -3241,12 +3226,12 @@ static void lo_removexattr(fuse_req_t req, fuse_ino_t ino, const char *in_name)
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
     } else {
         ret = lo_inode_fd(inode, &inode_fd);
         if (ret < 0) {
@@ -3263,10 +3248,6 @@ static void lo_removexattr(fuse_req_t req, fuse_ino_t ino, const char *in_name)
     saverr = ret == -1 ? errno : 0;
 
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


