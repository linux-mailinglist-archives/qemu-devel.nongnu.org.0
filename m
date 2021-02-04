Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E624030FC55
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 20:14:31 +0100 (CET)
Received: from localhost ([::1]:43266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7k5G-0007sn-VH
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 14:14:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7jTo-0002gC-8q
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 13:35:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7jTk-0004bA-LA
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 13:35:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612463742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4xyWBz8hsV6CyasCJf2n7ihL/CITpCMqcKrKncUSwAA=;
 b=T3jNDWklIkk4zUczoFuqnn4fChLOX4qWrPyFVOp7wWLspecOl2K4jJDBbeXYEdIJxPSHqX
 9589H48Lt/2w2RQXH5R73w+5x0uztl/bfktT5hy7RkbF4y/f6ufJrYRBBy6M14Yk7DImmT
 ZqHmzVPmvQm3kKEBQODZ4d53yV1mdJU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-bsc1v3leO_edffnYKDVoWg-1; Thu, 04 Feb 2021 13:35:39 -0500
X-MC-Unique: bsc1v3leO_edffnYKDVoWg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99BE5189DF4E;
 Thu,  4 Feb 2021 18:35:38 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-21.ams2.redhat.com
 [10.36.114.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE3C5722D9;
 Thu,  4 Feb 2021 18:35:24 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, virtio-fs@redhat.com, stefanha@redhat.com,
 groug@kaod.org, qemu-stable@nongnu.org
Subject: [PULL 3/5] virtiofsd: prevent opening of special files
 (CVE-2020-35517)
Date: Thu,  4 Feb 2021 18:34:37 +0000
Message-Id: <20210204183439.546918-4-dgilbert@redhat.com>
In-Reply-To: <20210204183439.546918-1-dgilbert@redhat.com>
References: <20210204183439.546918-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

A well-behaved FUSE client does not attempt to open special files with
FUSE_OPEN because they are handled on the client side (e.g. device nodes
are handled by client-side device drivers).

The check to prevent virtiofsd from opening special files is missing in
a few cases, most notably FUSE_OPEN. A malicious client can cause
virtiofsd to open a device node, potentially allowing the guest to
escape. This can be exploited by a modified guest device driver. It is
not exploitable from guest userspace since the guest kernel will handle
special files inside the guest instead of sending FUSE requests.

This patch fixes this issue by introducing the lo_inode_open() function
to check the file type before opening it. This is a short-term solution
because it does not prevent a compromised virtiofsd process from opening
device nodes on the host.

Restructure lo_create() to try O_CREAT | O_EXCL first. Note that O_CREAT
| O_EXCL does not follow symlinks, so O_NOFOLLOW masking is not
necessary here. If the file exists and the user did not specify O_EXCL,
open it via lo_do_open().

Reported-by: Alex Xu <alex@alxu.ca>
Fixes: CVE-2020-35517
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Vivek Goyal <vgoyal@redhat.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20210204150208.367837-4-stefanha@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 144 ++++++++++++++++++++-----------
 1 file changed, 92 insertions(+), 52 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index aa35fc6ba5..147b59338a 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -555,6 +555,38 @@ static int lo_fd(fuse_req_t req, fuse_ino_t ino)
     return fd;
 }
 
+/*
+ * Open a file descriptor for an inode. Returns -EBADF if the inode is not a
+ * regular file or a directory.
+ *
+ * Use this helper function instead of raw openat(2) to prevent security issues
+ * when a malicious client opens special files such as block device nodes.
+ * Symlink inodes are also rejected since symlinks must already have been
+ * traversed on the client side.
+ */
+static int lo_inode_open(struct lo_data *lo, struct lo_inode *inode,
+                         int open_flags)
+{
+    g_autofree char *fd_str = g_strdup_printf("%d", inode->fd);
+    int fd;
+
+    if (!S_ISREG(inode->filetype) && !S_ISDIR(inode->filetype)) {
+        return -EBADF;
+    }
+
+    /*
+     * The file is a symlink so O_NOFOLLOW must be ignored. We checked earlier
+     * that the inode is not a special file but if an external process races
+     * with us then symlinks are traversed here. It is not possible to escape
+     * the shared directory since it is mounted as "/" though.
+     */
+    fd = openat(lo->proc_self_fd, fd_str, open_flags & ~O_NOFOLLOW);
+    if (fd < 0) {
+        return -errno;
+    }
+    return fd;
+}
+
 static void lo_init(void *userdata, struct fuse_conn_info *conn)
 {
     struct lo_data *lo = (struct lo_data *)userdata;
@@ -684,9 +716,9 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
         if (fi) {
             truncfd = fd;
         } else {
-            sprintf(procname, "%i", ifd);
-            truncfd = openat(lo->proc_self_fd, procname, O_RDWR);
+            truncfd = lo_inode_open(lo, inode, O_RDWR);
             if (truncfd < 0) {
+                errno = -truncfd;
                 goto out_err;
             }
         }
@@ -848,7 +880,7 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
     struct lo_inode *dir = lo_inode(req, parent);
 
     if (inodep) {
-        *inodep = NULL;
+        *inodep = NULL; /* in case there is an error */
     }
 
     /*
@@ -1664,19 +1696,26 @@ static void update_open_flags(int writeback, int allow_direct_io,
     }
 }
 
+/*
+ * Open a regular file, set up an fd mapping, and fill out the struct
+ * fuse_file_info for it. If existing_fd is not negative, use that fd instead
+ * opening a new one. Takes ownership of existing_fd.
+ *
+ * Returns 0 on success or a positive errno.
+ */
 static int lo_do_open(struct lo_data *lo, struct lo_inode *inode,
-                      struct fuse_file_info *fi)
+                      int existing_fd, struct fuse_file_info *fi)
 {
-    char buf[64];
     ssize_t fh;
-    int fd;
+    int fd = existing_fd;
 
     update_open_flags(lo->writeback, lo->allow_direct_io, fi);
 
-    sprintf(buf, "%i", inode->fd);
-    fd = openat(lo->proc_self_fd, buf, fi->flags & ~O_NOFOLLOW);
-    if (fd == -1) {
-        return errno;
+    if (fd < 0) {
+        fd = lo_inode_open(lo, inode, fi->flags);
+        if (fd < 0) {
+            return -fd;
+        }
     }
 
     pthread_mutex_lock(&lo->mutex);
@@ -1699,9 +1738,10 @@ static int lo_do_open(struct lo_data *lo, struct lo_inode *inode,
 static void lo_create(fuse_req_t req, fuse_ino_t parent, const char *name,
                       mode_t mode, struct fuse_file_info *fi)
 {
-    int fd;
+    int fd = -1;
     struct lo_data *lo = lo_data(req);
     struct lo_inode *parent_inode;
+    struct lo_inode *inode = NULL;
     struct fuse_entry_param e;
     int err;
     struct lo_cred old = {};
@@ -1727,36 +1767,38 @@ static void lo_create(fuse_req_t req, fuse_ino_t parent, const char *name,
 
     update_open_flags(lo->writeback, lo->allow_direct_io, fi);
 
-    fd = openat(parent_inode->fd, name, (fi->flags | O_CREAT) & ~O_NOFOLLOW,
-                mode);
+    /* Try to create a new file but don't open existing files */
+    fd = openat(parent_inode->fd, name, fi->flags | O_CREAT | O_EXCL, mode);
     err = fd == -1 ? errno : 0;
-    lo_restore_cred(&old);
 
-    if (!err) {
-        ssize_t fh;
+    lo_restore_cred(&old);
 
-        pthread_mutex_lock(&lo->mutex);
-        fh = lo_add_fd_mapping(lo, fd);
-        pthread_mutex_unlock(&lo->mutex);
-        if (fh == -1) {
-            close(fd);
-            err = ENOMEM;
-            goto out;
-        }
+    /* Ignore the error if file exists and O_EXCL was not given */
+    if (err && (err != EEXIST || (fi->flags & O_EXCL))) {
+        goto out;
+    }
 
-        fi->fh = fh;
-        err = lo_do_lookup(req, parent, name, &e, NULL);
+    err = lo_do_lookup(req, parent, name, &e, &inode);
+    if (err) {
+        goto out;
     }
-    if (lo->cache == CACHE_NONE) {
-        fi->direct_io = 1;
-    } else if (lo->cache == CACHE_ALWAYS) {
-        fi->keep_cache = 1;
+
+    err = lo_do_open(lo, inode, fd, fi);
+    fd = -1; /* lo_do_open() takes ownership of fd */
+    if (err) {
+        /* Undo lo_do_lookup() nlookup ref */
+        unref_inode_lolocked(lo, inode, 1);
     }
 
 out:
+    lo_inode_put(lo, &inode);
     lo_inode_put(lo, &parent_inode);
 
     if (err) {
+        if (fd >= 0) {
+            close(fd);
+        }
+
         fuse_reply_err(req, err);
     } else {
         fuse_reply_create(req, &e, fi);
@@ -1770,7 +1812,6 @@ static struct lo_inode_plock *lookup_create_plock_ctx(struct lo_data *lo,
                                                       pid_t pid, int *err)
 {
     struct lo_inode_plock *plock;
-    char procname[64];
     int fd;
 
     plock =
@@ -1787,12 +1828,10 @@ static struct lo_inode_plock *lookup_create_plock_ctx(struct lo_data *lo,
     }
 
     /* Open another instance of file which can be used for ofd locks. */
-    sprintf(procname, "%i", inode->fd);
-
     /* TODO: What if file is not writable? */
-    fd = openat(lo->proc_self_fd, procname, O_RDWR);
-    if (fd == -1) {
-        *err = errno;
+    fd = lo_inode_open(lo, inode, O_RDWR);
+    if (fd < 0) {
+        *err = -fd;
         free(plock);
         return NULL;
     }
@@ -1949,7 +1988,7 @@ static void lo_open(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi)
         return;
     }
 
-    err = lo_do_open(lo, inode, fi);
+    err = lo_do_open(lo, inode, -1, fi);
     lo_inode_put(lo, &inode);
     if (err) {
         fuse_reply_err(req, err);
@@ -2014,39 +2053,40 @@ static void lo_flush(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi)
 static void lo_fsync(fuse_req_t req, fuse_ino_t ino, int datasync,
                      struct fuse_file_info *fi)
 {
+    struct lo_inode *inode = lo_inode(req, ino);
+    struct lo_data *lo = lo_data(req);
     int res;
     int fd;
-    char *buf;
 
     fuse_log(FUSE_LOG_DEBUG, "lo_fsync(ino=%" PRIu64 ", fi=0x%p)\n", ino,
              (void *)fi);
 
-    if (!fi) {
-        struct lo_data *lo = lo_data(req);
-
-        res = asprintf(&buf, "%i", lo_fd(req, ino));
-        if (res == -1) {
-            return (void)fuse_reply_err(req, errno);
-        }
+    if (!inode) {
+        fuse_reply_err(req, EBADF);
+        return;
+    }
 
-        fd = openat(lo->proc_self_fd, buf, O_RDWR);
-        free(buf);
-        if (fd == -1) {
-            return (void)fuse_reply_err(req, errno);
+    if (!fi) {
+        fd = lo_inode_open(lo, inode, O_RDWR);
+        if (fd < 0) {
+            res = -fd;
+            goto out;
         }
     } else {
         fd = lo_fi_fd(req, fi);
     }
 
     if (datasync) {
-        res = fdatasync(fd);
+        res = fdatasync(fd) == -1 ? errno : 0;
     } else {
-        res = fsync(fd);
+        res = fsync(fd) == -1 ? errno : 0;
     }
     if (!fi) {
         close(fd);
     }
-    fuse_reply_err(req, res == -1 ? errno : 0);
+out:
+    lo_inode_put(lo, &inode);
+    fuse_reply_err(req, res);
 }
 
 static void lo_read(fuse_req_t req, fuse_ino_t ino, size_t size, off_t offset,
-- 
2.29.2


