Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3EE4B8FAC
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 18:49:11 +0100 (CET)
Received: from localhost ([::1]:49960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKOQQ-000455-LR
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 12:49:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nKOHX-0002zS-MH
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 12:39:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nKOHV-0000QT-Gn
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 12:39:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645033195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dqdecusREavUBeyKw7p2kUYN8+WUdUfNV0RWIIg8yLc=;
 b=g/E1D8IePyJqFgZml9bT+9gu+SVnBfT2P1fqkRynQeb0H3iRlskRb2eEc+NN0uN0mPQdMI
 aOhopsJt9Y3+Dc0VDzi9sr7RVWfto1G2bKEQGHMXx7c4+tOomamjlAobyizNjODuoleAm7
 18cRWWQWZ6soQmrXlXV0n5e6KYNZzN4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-Gc-nFP6POd2DnkQIM8fR5Q-1; Wed, 16 Feb 2022 12:39:52 -0500
X-MC-Unique: Gc-nFP6POd2DnkQIM8fR5Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CDB988144E1;
 Wed, 16 Feb 2022 17:39:50 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.195.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 308886F11C;
 Wed, 16 Feb 2022 17:39:23 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, vgoyal@redhat.com, groug@kaod.org,
 sebastian.hasler@stuvus.uni-stuttgart.de
Subject: [PULL 09/12] virtiofsd: Create new file with security context
Date: Wed, 16 Feb 2022 17:36:22 +0000
Message-Id: <20220216173625.128109-10-dgilbert@redhat.com>
In-Reply-To: <20220216173625.128109-1-dgilbert@redhat.com>
References: <20220216173625.128109-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: virtio-fs@redhat.com, stefanha@redhat.com, slp@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vivek Goyal <vgoyal@redhat.com>

This patch adds support for creating new file with security context
as sent by client. It basically takes three paths.

- If no security context enabled, then it continues to create files without
  security context.

- If security context is enabled and but security.selinux has not been
  remapped, then it uses /proc/thread-self/attr/fscreate knob to set
  security context and then create the file. This will make sure that
  newly created file gets the security context as set in "fscreate" and
  this is atomic w.r.t file creation.

  This is useful and host and guest SELinux policies don't conflict and
  can work with each other. In that case, guest security.selinux xattr
  is not remapped and it is passthrough as "security.selinux" xattr
  on host.

- If security context is enabled but security.selinux xattr has been
  remapped to something else, then it first creates the file and then
  uses setxattr() to set the remapped xattr with the security context.
  This is a non-atomic operation w.r.t file creation.

  This mode will be most versatile and allow host and guest to have their
  own separate SELinux xattrs and have their own separate SELinux policies.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
Message-Id: <20220208204813.682906-9-vgoyal@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 229 +++++++++++++++++++++++++++----
 1 file changed, 200 insertions(+), 29 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index ea8c367207..d171fd2842 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -234,6 +234,11 @@ static struct lo_inode *lo_find(struct lo_data *lo, struct stat *st,
 static int xattr_map_client(const struct lo_data *lo, const char *client_name,
                             char **out_name);
 
+#define FCHDIR_NOFAIL(fd) do {                         \
+        int fchdir_res = fchdir(fd);                   \
+        assert(fchdir_res == 0);                       \
+    } while (0)
+
 static bool is_dot_or_dotdot(const char *name)
 {
     return name[0] == '.' &&
@@ -288,7 +293,6 @@ static bool is_fscreate_usable(struct lo_data *lo)
 }
 
 /* Helpers to set/reset fscreate */
-__attribute__((unused))
 static int open_set_proc_fscreate(struct lo_data *lo, const void *ctx,
                                   size_t ctxlen,int *fd)
 {
@@ -316,7 +320,6 @@ out:
     return err;
 }
 
-__attribute__((unused))
 static void close_reset_proc_fscreate(int fd)
 {
     if ((write(fd, NULL, 0)) == -1) {
@@ -1354,16 +1357,103 @@ static void lo_restore_cred_gain_cap(struct lo_cred *old, bool restore_umask,
     }
 }
 
+static int do_mknod_symlink_secctx(fuse_req_t req, struct lo_inode *dir,
+                                   const char *name, const char *secctx_name)
+{
+    int path_fd, err;
+    char procname[64];
+    struct lo_data *lo = lo_data(req);
+
+    if (!req->secctx.ctxlen) {
+        return 0;
+    }
+
+    /* Open newly created element with O_PATH */
+    path_fd = openat(dir->fd, name, O_PATH | O_NOFOLLOW);
+    err = path_fd == -1 ? errno : 0;
+    if (err) {
+        return err;
+    }
+    sprintf(procname, "%i", path_fd);
+    FCHDIR_NOFAIL(lo->proc_self_fd);
+    /* Set security context. This is not atomic w.r.t file creation */
+    err = setxattr(procname, secctx_name, req->secctx.ctx, req->secctx.ctxlen,
+                   0);
+    if (err) {
+        err = errno;
+    }
+    FCHDIR_NOFAIL(lo->root.fd);
+    close(path_fd);
+    return err;
+}
+
+static int do_mknod_symlink(fuse_req_t req, struct lo_inode *dir,
+                            const char *name, mode_t mode, dev_t rdev,
+                            const char *link)
+{
+    int err, fscreate_fd = -1;
+    const char *secctx_name = req->secctx.name;
+    struct lo_cred old = {};
+    struct lo_data *lo = lo_data(req);
+    char *mapped_name = NULL;
+    bool secctx_enabled = req->secctx.ctxlen;
+    bool do_fscreate = false;
+
+    if (secctx_enabled && lo->xattrmap) {
+        err = xattr_map_client(lo, req->secctx.name, &mapped_name);
+        if (err < 0) {
+            return -err;
+        }
+        secctx_name = mapped_name;
+    }
+
+    /*
+     * If security xattr has not been remapped and selinux is enabled on
+     * host, set fscreate and no need to do a setxattr() after file creation
+     */
+    if (secctx_enabled && !mapped_name && lo->use_fscreate) {
+        do_fscreate = true;
+        err = open_set_proc_fscreate(lo, req->secctx.ctx, req->secctx.ctxlen,
+                                     &fscreate_fd);
+        if (err) {
+            goto out;
+        }
+    }
+
+    err = lo_change_cred(req, &old, lo->change_umask && !S_ISLNK(mode));
+    if (err) {
+        goto out;
+    }
+
+    err = mknod_wrapper(dir->fd, name, link, mode, rdev);
+    err = err == -1 ? errno : 0;
+    lo_restore_cred(&old, lo->change_umask && !S_ISLNK(mode));
+    if (err) {
+        goto out;
+    }
+
+    if (!do_fscreate) {
+        err = do_mknod_symlink_secctx(req, dir, name, secctx_name);
+        if (err) {
+            unlinkat(dir->fd, name, S_ISDIR(mode) ? AT_REMOVEDIR : 0);
+        }
+    }
+out:
+    if (fscreate_fd != -1) {
+        close_reset_proc_fscreate(fscreate_fd);
+    }
+    g_free(mapped_name);
+    return err;
+}
+
 static void lo_mknod_symlink(fuse_req_t req, fuse_ino_t parent,
                              const char *name, mode_t mode, dev_t rdev,
                              const char *link)
 {
-    int res;
     int saverr;
     struct lo_data *lo = lo_data(req);
     struct lo_inode *dir;
     struct fuse_entry_param e;
-    struct lo_cred old = {};
 
     if (is_empty(name)) {
         fuse_reply_err(req, ENOENT);
@@ -1381,21 +1471,11 @@ static void lo_mknod_symlink(fuse_req_t req, fuse_ino_t parent,
         return;
     }
 
-    saverr = lo_change_cred(req, &old, lo->change_umask && !S_ISLNK(mode));
+    saverr = do_mknod_symlink(req, dir, name, mode, rdev, link);
     if (saverr) {
         goto out;
     }
 
-    res = mknod_wrapper(dir->fd, name, link, mode, rdev);
-
-    saverr = errno;
-
-    lo_restore_cred(&old, lo->change_umask && !S_ISLNK(mode));
-
-    if (res == -1) {
-        goto out;
-    }
-
     saverr = lo_do_lookup(req, parent, name, &e, NULL);
     if (saverr) {
         goto out;
@@ -2071,13 +2151,16 @@ static int lo_do_open(struct lo_data *lo, struct lo_inode *inode,
     return 0;
 }
 
-static int do_lo_create(fuse_req_t req, struct lo_inode *parent_inode,
-                        const char *name, mode_t mode,
-                        struct fuse_file_info *fi, int* open_fd)
+static int do_create_nosecctx(fuse_req_t req, struct lo_inode *parent_inode,
+                               const char *name, mode_t mode,
+                               struct fuse_file_info *fi, int *open_fd)
 {
-    int err = 0, fd;
+    int err, fd;
     struct lo_cred old = {};
     struct lo_data *lo = lo_data(req);
+    int flags;
+
+    flags = fi->flags | O_CREAT | O_EXCL;
 
     err = lo_change_cred(req, &old, lo->change_umask);
     if (err) {
@@ -2085,13 +2168,106 @@ static int do_lo_create(fuse_req_t req, struct lo_inode *parent_inode,
     }
 
     /* Try to create a new file but don't open existing files */
-    fd = openat(parent_inode->fd, name, fi->flags | O_CREAT | O_EXCL, mode);
-    if (fd == -1) {
-        err = errno;
-    } else {
+    fd = openat(parent_inode->fd, name, flags, mode);
+    err = fd == -1 ? errno : 0;
+    lo_restore_cred(&old, lo->change_umask);
+    if (!err) {
         *open_fd = fd;
     }
-    lo_restore_cred(&old, lo->change_umask);
+    return err;
+}
+
+static int do_create_secctx_fscreate(fuse_req_t req,
+                                     struct lo_inode *parent_inode,
+                                     const char *name, mode_t mode,
+                                     struct fuse_file_info *fi, int *open_fd)
+{
+    int err = 0, fd = -1, fscreate_fd = -1;
+    struct lo_data *lo = lo_data(req);
+
+    err = open_set_proc_fscreate(lo, req->secctx.ctx, req->secctx.ctxlen,
+                                 &fscreate_fd);
+    if (err) {
+        return err;
+    }
+
+    err = do_create_nosecctx(req, parent_inode, name, mode, fi, &fd);
+
+    close_reset_proc_fscreate(fscreate_fd);
+    if (!err) {
+        *open_fd = fd;
+    }
+    return err;
+}
+
+static int do_create_secctx_noatomic(fuse_req_t req,
+                                     struct lo_inode *parent_inode,
+                                     const char *name, mode_t mode,
+                                     struct fuse_file_info *fi,
+                                     const char *secctx_name, int *open_fd)
+{
+    int err = 0, fd = -1;
+
+    err = do_create_nosecctx(req, parent_inode, name, mode, fi, &fd);
+    if (err) {
+        goto out;
+    }
+
+    /* Set security context. This is not atomic w.r.t file creation */
+    err = fsetxattr(fd, secctx_name, req->secctx.ctx, req->secctx.ctxlen, 0);
+    err = err == -1 ? errno : 0;
+out:
+    if (!err) {
+        *open_fd = fd;
+    } else {
+        if (fd != -1) {
+            close(fd);
+            unlinkat(parent_inode->fd, name, 0);
+        }
+    }
+    return err;
+}
+
+static int do_lo_create(fuse_req_t req, struct lo_inode *parent_inode,
+                        const char *name, mode_t mode,
+                        struct fuse_file_info *fi, int *open_fd)
+{
+    struct lo_data *lo = lo_data(req);
+    char *mapped_name = NULL;
+    int err;
+    const char *ctxname = req->secctx.name;
+    bool secctx_enabled = req->secctx.ctxlen;
+
+    if (secctx_enabled && lo->xattrmap) {
+        err = xattr_map_client(lo, req->secctx.name, &mapped_name);
+        if (err < 0) {
+            return -err;
+        }
+
+        ctxname = mapped_name;
+    }
+
+    if (secctx_enabled) {
+        /*
+         * If security.selinux has not been remapped and selinux is enabled,
+         * use fscreate to set context before file creation.
+         * Otherwise fallback to non-atomic method of file creation
+         * and xattr settting.
+         */
+        if (!mapped_name && lo->use_fscreate) {
+            err = do_create_secctx_fscreate(req, parent_inode, name, mode, fi,
+                                            open_fd);
+            goto out;
+        }
+
+        err = do_create_secctx_noatomic(req, parent_inode, name, mode, fi,
+                                        ctxname, open_fd);
+    } else {
+        err = do_create_nosecctx(req, parent_inode, name, mode, fi, open_fd);
+    }
+
+out:
+    g_free(mapped_name);
     return err;
 }
 
@@ -2935,11 +3111,6 @@ static int xattr_map_server(const struct lo_data *lo, const char *server_name,
     return -ENODATA;
 }
 
-#define FCHDIR_NOFAIL(fd) do {                         \
-        int fchdir_res = fchdir(fd);                   \
-        assert(fchdir_res == 0);                       \
-    } while (0)
-
 static bool block_xattr(struct lo_data *lo, const char *name)
 {
     /*
-- 
2.35.1


