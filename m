Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 575C0417BF4
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 21:52:47 +0200 (CEST)
Received: from localhost ([::1]:51998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTrFW-000723-DV
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 15:52:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mTrCd-0004A5-QZ
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 15:49:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mTrCU-0004IA-Ty
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 15:49:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632512978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hPZv9fa1wAYA04Oc+LTlSMKlKsKreUVAHthCd47+yh0=;
 b=f6SduxUjHpiDP6+Ri2Zb44Z3HfrtrOXzb3MNsic3wqVqVwvRS3tMmY9h/dH+AkcVjrg1g7
 G/K/mPJdJlLknxfrfuP+84ehZjsrJjOJAKy+MafeVGr4Mqxk6LbCGKXaa525Ip0bjoDocO
 axkl8z1MA5uCD2O8cu0zIeDNYaGqHiU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-kka5oMm5O_StCSJ8ihBkeQ-1; Fri, 24 Sep 2021 15:49:37 -0400
X-MC-Unique: kka5oMm5O_StCSJ8ihBkeQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D443109A5AD;
 Fri, 24 Sep 2021 19:49:07 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.32.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C26155BB15;
 Fri, 24 Sep 2021 19:49:06 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 62F81228283; Fri, 24 Sep 2021 15:49:06 -0400 (EDT)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH 4/5] virtiofsd: Create new file with fscreate set
Date: Fri, 24 Sep 2021 15:48:53 -0400
Message-Id: <20210924194854.919414-5-vgoyal@redhat.com>
In-Reply-To: <20210924194854.919414-1-vgoyal@redhat.com>
References: <20210924194854.919414-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: miklos@szeredi.hu, chirantan@chromium.org, stephen.smalley.work@gmail.com,
 dwalsh@redhat.com, dgilbert@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds support to set /proc/thread-self/attr/fscreate before
file creation. It is set to a value as sent by client. This will allow
for atomic creation of security context on files w.r.t file creation.

This is primarily useful when either there is no SELinux enabled on
host or host and guest policies are in sync and don't conflict.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 284 ++++++++++++++++++++++++++++---
 1 file changed, 257 insertions(+), 27 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 54978b7fae..d8c14d3220 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -172,6 +172,8 @@ struct lo_data {
 
     /* An O_PATH file descriptor to /proc/self/fd/ */
     int proc_self_fd;
+    /* An O_PATH file descriptor to /proc/self/task/ */
+    int proc_self_task;
     int user_killpriv_v2, killpriv_v2;
     /* If set, virtiofsd is responsible for setting umask during creation */
     bool change_umask;
@@ -229,6 +231,11 @@ static struct lo_inode *lo_find(struct lo_data *lo, struct stat *st,
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
@@ -1259,16 +1266,140 @@ static void lo_restore_cred_gain_cap(struct lo_cred *old, bool restore_umask,
     }
 }
 
+/* Helpers to set/reset fscreate */
+static int open_set_proc_fscreate(struct lo_data *lo, const void *ctx,
+                                  size_t ctxlen, int *fd)
+{
+    char procname[64];
+    int fscreate_fd, err = 0;
+    size_t written;
+
+    sprintf(procname, "%d/attr/fscreate", gettid());
+    fscreate_fd = openat(lo->proc_self_task, procname, O_WRONLY);
+    err = fscreate_fd == -1 ? errno : 0;
+    if (err) {
+        return err;
+    }
+
+    written = write(fscreate_fd, ctx, ctxlen);
+    err = written == -1 ? errno : 0;
+    if (err) {
+        goto out;
+    }
+
+    *fd = fscreate_fd;
+    return 0;
+out:
+    close(fscreate_fd);
+    return err;
+}
+
+static void close_reset_proc_fscreate(int fd)
+{
+    if ((write(fd, NULL, 0)) == -1) {
+        fuse_log(FUSE_LOG_WARNING, "Failed to reset fscreate. err=%d\n", errno);
+    }
+    close(fd);
+    return;
+}
+
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
+     * If security xattr has not been remapped, set fscreate and no
+     * need to do a setxattr() after file creation
+     */
+    if (secctx_enabled && !mapped_name) {
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
@@ -1286,21 +1417,11 @@ static void lo_mknod_symlink(fuse_req_t req, fuse_ino_t parent,
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
@@ -1976,13 +2097,16 @@ static int lo_do_open(struct lo_data *lo, struct lo_inode *inode,
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
@@ -1990,13 +2114,106 @@ static int do_lo_create(fuse_req_t req, struct lo_inode *parent_inode,
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
+         * If security.selinux has not been remapped. Use fscreate to set
+         * context before file creation.
+         * Otherwise fallback to non-atomic method of file creation
+         * and xattr settting.
+         */
+        if (!mapped_name) {
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
 
@@ -2831,11 +3048,6 @@ static int xattr_map_server(const struct lo_data *lo, const char *server_name,
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
@@ -3497,6 +3709,13 @@ static void setup_namespaces(struct lo_data *lo, struct fuse_session *se)
         exit(1);
     }
 
+    /* Get the /proc/self/task descriptor */
+    lo->proc_self_task = open("/proc/self/task/", O_PATH);
+    if (lo->proc_self_task == -1) {
+        fuse_log(FUSE_LOG_ERR, "open(/proc/self/task, O_PATH): %m\n");
+        exit(1);
+    }
+
     /*
      * We only need /proc/self/fd. Prevent ".." from accessing parent
      * directories of /proc/self/fd by bind-mounting it over /proc. Since / was
@@ -3713,6 +3932,12 @@ static void setup_chroot(struct lo_data *lo)
         exit(1);
     }
 
+    lo->proc_self_task = open("/proc/self/task", O_PATH);
+    if (lo->proc_self_fd == -1) {
+        fuse_log(FUSE_LOG_ERR, "open(\"/proc/self/task\", O_PATH): %m\n");
+        exit(1);
+    }
+
     /*
      * Make the shared directory the file system root so that FUSE_OPEN
      * (lo_open()) cannot escape the shared directory by opening a symlink.
@@ -3898,6 +4123,10 @@ static void fuse_lo_data_cleanup(struct lo_data *lo)
         close(lo->proc_self_fd);
     }
 
+    if (lo->proc_self_task >= 0) {
+        close(lo->proc_self_task);
+    }
+
     if (lo->root.fd >= 0) {
         close(lo->root.fd);
     }
@@ -3925,6 +4154,7 @@ int main(int argc, char *argv[])
         .posix_lock = 0,
         .allow_direct_io = 0,
         .proc_self_fd = -1,
+        .proc_self_task = -1,
         .user_killpriv_v2 = -1,
         .user_posix_acl = -1,
     };
-- 
2.31.1


