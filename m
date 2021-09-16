Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F46940D4E7
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 10:47:37 +0200 (CEST)
Received: from localhost ([::1]:52056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQn3Q-0004nq-6N
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 04:47:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQmxf-0004of-5s
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 04:41:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQmxZ-0004V9-K9
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 04:41:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631781693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KNa5+OFXRM0dhhLk4K19fDaQ19QxKdz1U0WGF9RJei0=;
 b=bLFaZlOTsRHrWW9NKv51jvDMBbHlyAR2MoDXpfTof6U5eyfn0uhPT5iQ1kcRVBxj4N5y82
 7fs0xTaUkBMKTnWQM9fGj5l9Ikr5AxKD0nuExtdGtQsh9fAUsbdwqxfaFpKoAPJk3iB1xx
 M3tS/M6D16VxtCAb4bJJqs4v0CT/upc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-BYa3lhkJM3-PoO-zyb62lw-1; Thu, 16 Sep 2021 04:41:31 -0400
X-MC-Unique: BYa3lhkJM3-PoO-zyb62lw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19FFF1084684
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 08:41:31 +0000 (UTC)
Received: from localhost (unknown [10.39.192.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D608B6A908;
 Thu, 16 Sep 2021 08:41:23 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH v4 05/12] virtiofsd: Add lo_inode_fd() helper
Date: Thu, 16 Sep 2021 10:40:38 +0200
Message-Id: <20210916084045.31684-6-hreitz@redhat.com>
In-Reply-To: <20210916084045.31684-1-hreitz@redhat.com>
References: <20210916084045.31684-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Once we let lo_inode.fd be optional, we will need its users to open the
file handle stored in lo_inode instead.  This function will do that.

For now, it just returns lo_inode.fd, though.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 159 +++++++++++++++++++++++++------
 1 file changed, 132 insertions(+), 27 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index d76283d080..c5baa752e4 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -651,6 +651,16 @@ static struct lo_inode *lo_inode(fuse_req_t req, fuse_ino_t ino)
     return elem->inode;
 }
 
+static int lo_inode_fd(const struct lo_inode *inode, TempFd *tfd)
+{
+    *tfd = (TempFd) {
+        .fd = inode->fd,
+        .owned = false,
+    };
+
+    return 0;
+}
+
 /*
  * TODO Remove this helper and force callers to hold an inode refcount until
  * they are done with the fd.  This will be done in a later patch to make
@@ -838,11 +848,11 @@ static int lo_fi_fd(fuse_req_t req, struct fuse_file_info *fi)
 static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
                        int valid, struct fuse_file_info *fi)
 {
+    g_auto(TempFd) path_fd = TEMP_FD_INIT;
     int saverr;
     char procname[64];
     struct lo_data *lo = lo_data(req);
     struct lo_inode *inode;
-    int ifd;
     int res;
     int fd = -1;
 
@@ -852,7 +862,11 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
         return;
     }
 
-    ifd = inode->fd;
+    res = lo_inode_fd(inode, &path_fd);
+    if (res < 0) {
+        saverr = -res;
+        goto out_err;
+    }
 
     /* If fi->fh is invalid we'll report EBADF later */
     if (fi) {
@@ -863,7 +877,7 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
         if (fi) {
             res = fchmod(fd, attr->st_mode);
         } else {
-            sprintf(procname, "%i", ifd);
+            sprintf(procname, "%i", path_fd.fd);
             res = fchmodat(lo->proc_self_fd, procname, attr->st_mode, 0);
         }
         if (res == -1) {
@@ -875,12 +889,13 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
         uid_t uid = (valid & FUSE_SET_ATTR_UID) ? attr->st_uid : (uid_t)-1;
         gid_t gid = (valid & FUSE_SET_ATTR_GID) ? attr->st_gid : (gid_t)-1;
 
-        saverr = drop_security_capability(lo, ifd);
+        saverr = drop_security_capability(lo, path_fd.fd);
         if (saverr) {
             goto out_err;
         }
 
-        res = fchownat(ifd, "", uid, gid, AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW);
+        res = fchownat(path_fd.fd, "", uid, gid,
+                       AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW);
         if (res == -1) {
             saverr = errno;
             goto out_err;
@@ -959,7 +974,7 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
         if (fi) {
             res = futimens(fd, tv);
         } else {
-            sprintf(procname, "%i", inode->fd);
+            sprintf(procname, "%i", path_fd.fd);
             res = utimensat(lo->proc_self_fd, procname, tv, 0);
         }
         if (res == -1) {
@@ -1074,7 +1089,8 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
                         struct fuse_entry_param *e,
                         struct lo_inode **inodep)
 {
-    int newfd;
+    g_auto(TempFd) dir_path_fd = TEMP_FD_INIT;
+    int newfd = -1;
     int res;
     int saverr;
     uint64_t mnt_id;
@@ -1104,7 +1120,13 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
         name = ".";
     }
 
-    newfd = openat(dir->fd, name, O_PATH | O_NOFOLLOW);
+    res = lo_inode_fd(dir, &dir_path_fd);
+    if (res < 0) {
+        saverr = -res;
+        goto out;
+    }
+
+    newfd = openat(dir_path_fd.fd, name, O_PATH | O_NOFOLLOW);
     if (newfd == -1) {
         goto out_err;
     }
@@ -1171,6 +1193,7 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
 
 out_err:
     saverr = errno;
+out:
     if (newfd != -1) {
         close(newfd);
     }
@@ -1328,6 +1351,7 @@ static void lo_mknod_symlink(fuse_req_t req, fuse_ino_t parent,
                              const char *name, mode_t mode, dev_t rdev,
                              const char *link)
 {
+    g_auto(TempFd) dir_path_fd = TEMP_FD_INIT;
     int res;
     int saverr;
     struct lo_data *lo = lo_data(req);
@@ -1351,12 +1375,18 @@ static void lo_mknod_symlink(fuse_req_t req, fuse_ino_t parent,
         return;
     }
 
+    res = lo_inode_fd(dir, &dir_path_fd);
+    if (res < 0) {
+        saverr = -res;
+        goto out;
+    }
+
     saverr = lo_change_cred(req, &old, lo->change_umask && !S_ISLNK(mode));
     if (saverr) {
         goto out;
     }
 
-    res = mknod_wrapper(dir->fd, name, link, mode, rdev);
+    res = mknod_wrapper(dir_path_fd.fd, name, link, mode, rdev);
 
     saverr = errno;
 
@@ -1404,6 +1434,8 @@ static void lo_symlink(fuse_req_t req, const char *link, fuse_ino_t parent,
 static void lo_link(fuse_req_t req, fuse_ino_t ino, fuse_ino_t parent,
                     const char *name)
 {
+    g_auto(TempFd) path_fd = TEMP_FD_INIT;
+    g_auto(TempFd) parent_path_fd = TEMP_FD_INIT;
     int res;
     struct lo_data *lo = lo_data(req);
     struct lo_inode *parent_inode;
@@ -1425,22 +1457,35 @@ static void lo_link(fuse_req_t req, fuse_ino_t ino, fuse_ino_t parent,
     parent_inode = lo_inode(req, parent);
     inode = lo_inode(req, ino);
     if (!parent_inode || !inode) {
-        errno = EBADF;
-        goto out_err;
+        saverr = EBADF;
+        goto out;
+    }
+
+    res = lo_inode_fd(inode, &path_fd);
+    if (res < 0) {
+        saverr = -res;
+        goto out;
+    }
+
+    res = lo_inode_fd(parent_inode, &parent_path_fd);
+    if (res < 0) {
+        saverr = -res;
+        goto out;
     }
 
     memset(&e, 0, sizeof(struct fuse_entry_param));
     e.attr_timeout = lo->timeout;
     e.entry_timeout = lo->timeout;
 
-    sprintf(procname, "%i", inode->fd);
-    res = linkat(lo->proc_self_fd, procname, parent_inode->fd, name,
+    sprintf(procname, "%i", path_fd.fd);
+    res = linkat(lo->proc_self_fd, procname, parent_path_fd.fd, name,
                  AT_SYMLINK_FOLLOW);
     if (res == -1) {
         goto out_err;
     }
 
-    res = fstatat(inode->fd, "", &e.attr, AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW);
+    res = fstatat(path_fd.fd, "", &e.attr,
+                  AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW);
     if (res == -1) {
         goto out_err;
     }
@@ -1460,6 +1505,7 @@ static void lo_link(fuse_req_t req, fuse_ino_t ino, fuse_ino_t parent,
 
 out_err:
     saverr = errno;
+out:
     lo_inode_put(lo, &parent_inode);
     lo_inode_put(lo, &inode);
     fuse_reply_err(req, saverr);
@@ -1469,23 +1515,34 @@ out_err:
 static struct lo_inode *lookup_name(fuse_req_t req, fuse_ino_t parent,
                                     const char *name)
 {
+    g_auto(TempFd) dir_path_fd = TEMP_FD_INIT;
     int res;
     uint64_t mnt_id;
     struct stat attr;
     struct lo_data *lo = lo_data(req);
     struct lo_inode *dir = lo_inode(req, parent);
+    struct lo_inode *inode = NULL;
 
     if (!dir) {
-        return NULL;
+        goto out;
     }
 
-    res = do_statx(lo, dir->fd, name, &attr, AT_SYMLINK_NOFOLLOW, &mnt_id);
-    lo_inode_put(lo, &dir);
+    res = lo_inode_fd(dir, &dir_path_fd);
+    if (res < 0) {
+        goto out;
+    }
+
+    res = do_statx(lo, dir_path_fd.fd, name, &attr, AT_SYMLINK_NOFOLLOW,
+                   &mnt_id);
     if (res == -1) {
-        return NULL;
+        goto out;
     }
 
-    return lo_find(lo, &attr, mnt_id);
+    inode = lo_find(lo, &attr, mnt_id);
+
+out:
+    lo_inode_put(lo, &dir);
+    return inode;
 }
 
 static void lo_rmdir(fuse_req_t req, fuse_ino_t parent, const char *name)
@@ -1521,6 +1578,8 @@ static void lo_rename(fuse_req_t req, fuse_ino_t parent, const char *name,
                       fuse_ino_t newparent, const char *newname,
                       unsigned int flags)
 {
+    g_auto(TempFd) parent_path_fd = TEMP_FD_INIT;
+    g_auto(TempFd) newparent_path_fd = TEMP_FD_INIT;
     int res;
     struct lo_inode *parent_inode;
     struct lo_inode *newparent_inode;
@@ -1553,12 +1612,24 @@ static void lo_rename(fuse_req_t req, fuse_ino_t parent, const char *name,
         goto out;
     }
 
+    res = lo_inode_fd(parent_inode, &parent_path_fd);
+    if (res < 0) {
+        fuse_reply_err(req, -res);
+        goto out;
+    }
+
+    res = lo_inode_fd(newparent_inode, &newparent_path_fd);
+    if (res < 0) {
+        fuse_reply_err(req, -res);
+        goto out;
+    }
+
     if (flags) {
 #ifndef SYS_renameat2
         fuse_reply_err(req, EINVAL);
 #else
-        res = syscall(SYS_renameat2, parent_inode->fd, name,
-                        newparent_inode->fd, newname, flags);
+        res = syscall(SYS_renameat2, parent_path_fd.fd, name,
+                        newparent_path_fd.fd, newname, flags);
         if (res == -1 && errno == ENOSYS) {
             fuse_reply_err(req, EINVAL);
         } else {
@@ -1568,7 +1639,7 @@ static void lo_rename(fuse_req_t req, fuse_ino_t parent, const char *name,
         goto out;
     }
 
-    res = renameat(parent_inode->fd, name, newparent_inode->fd, newname);
+    res = renameat(parent_path_fd.fd, name, newparent_path_fd.fd, newname);
 
     fuse_reply_err(req, res == -1 ? errno : 0);
 out:
@@ -2054,6 +2125,7 @@ static int lo_do_open(struct lo_data *lo, struct lo_inode *inode,
 static void lo_create(fuse_req_t req, fuse_ino_t parent, const char *name,
                       mode_t mode, struct fuse_file_info *fi)
 {
+    g_auto(TempFd) parent_path_fd = TEMP_FD_INIT;
     int fd = -1;
     struct lo_data *lo = lo_data(req);
     struct lo_inode *parent_inode;
@@ -2076,6 +2148,12 @@ static void lo_create(fuse_req_t req, fuse_ino_t parent, const char *name,
         return;
     }
 
+    err = lo_inode_fd(parent_inode, &parent_path_fd);
+    if (err < 0) {
+        err = -err;
+        goto out;
+    }
+
     err = lo_change_cred(req, &old, lo->change_umask);
     if (err) {
         goto out;
@@ -2084,7 +2162,7 @@ static void lo_create(fuse_req_t req, fuse_ino_t parent, const char *name,
     update_open_flags(lo->writeback, lo->allow_direct_io, fi);
 
     /* Try to create a new file but don't open existing files */
-    fd = openat(parent_inode->fd, name, fi->flags | O_CREAT | O_EXCL, mode);
+    fd = openat(parent_path_fd.fd, name, fi->flags | O_CREAT | O_EXCL, mode);
     err = fd == -1 ? errno : 0;
 
     lo_restore_cred(&old, lo->change_umask);
@@ -3014,7 +3092,14 @@ static void lo_getxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
         ret = fgetxattr(fd, name, value, size);
         saverr = ret == -1 ? errno : 0;
     } else {
-        sprintf(procname, "%i", inode->fd);
+        g_auto(TempFd) path_fd = TEMP_FD_INIT;
+
+        ret = lo_inode_fd(inode, &path_fd);
+        if (ret < 0) {
+            saverr = -ret;
+            goto out;
+        }
+        sprintf(procname, "%i", path_fd.fd);
         /* fchdir should not fail here */
         FCHDIR_NOFAIL(lo->proc_self_fd);
         ret = getxattr(procname, name, value, size);
@@ -3090,7 +3175,14 @@ static void lo_listxattr(fuse_req_t req, fuse_ino_t ino, size_t size)
         ret = flistxattr(fd, value, size);
         saverr = ret == -1 ? errno : 0;
     } else {
-        sprintf(procname, "%i", inode->fd);
+        g_auto(TempFd) path_fd = TEMP_FD_INIT;
+
+        ret = lo_inode_fd(inode, &path_fd);
+        if (ret < 0) {
+            saverr = -ret;
+            goto out;
+        }
+        sprintf(procname, "%i", path_fd.fd);
         /* fchdir should not fail here */
         FCHDIR_NOFAIL(lo->proc_self_fd);
         ret = listxattr(procname, value, size);
@@ -3187,6 +3279,7 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
                         const char *value, size_t size, int flags,
                         uint32_t extra_flags)
 {
+    g_auto(TempFd) path_fd = TEMP_FD_INIT;
     const char *name;
     char *mapped_name;
     struct lo_data *lo = lo_data(req);
@@ -3244,6 +3337,11 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
             goto out;
         }
     } else {
+        ret = lo_inode_fd(inode, &path_fd);
+        if (ret < 0) {
+            saverr = -ret;
+            goto out;
+        }
         /* fchdir should not fail here */
         FCHDIR_NOFAIL(lo->proc_self_fd);
         /* Set flag so the clean-up path will chdir back */
@@ -3276,7 +3374,7 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
     } else {
         char procname[64];
 
-        sprintf(procname, "%i", inode->fd);
+        sprintf(procname, "%i", path_fd.fd);
         ret = setxattr(procname, name, value, size, flags);
         saverr = ret == -1 ? errno : 0;
     }
@@ -3355,7 +3453,14 @@ static void lo_removexattr(fuse_req_t req, fuse_ino_t ino, const char *in_name)
         ret = fremovexattr(fd, name);
         saverr = ret == -1 ? errno : 0;
     } else {
-        sprintf(procname, "%i", inode->fd);
+        g_auto(TempFd) path_fd = TEMP_FD_INIT;
+
+        ret = lo_inode_fd(inode, &path_fd);
+        if (ret < 0) {
+            saverr = -ret;
+            goto out;
+        }
+        sprintf(procname, "%i", path_fd.fd);
         /* fchdir should not fail here */
         FCHDIR_NOFAIL(lo->proc_self_fd);
         ret = removexattr(procname, name);
-- 
2.31.1


