Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F7240D4D2
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 10:44:32 +0200 (CEST)
Received: from localhost ([::1]:43412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQn0R-0007Nq-E4
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 04:44:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQmxV-0004mm-Ug
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 04:41:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQmxU-0004Mt-6a
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 04:41:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631781687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b8JCe2/MxdzLsWsSz1R0KzEI7jC387lZ5OvEsfnLoEs=;
 b=L+EPephdEbQpSLjPbU5zjoHhuMcRELB8AqOnkph1HRfo7c6l+GKArJbU8Pj+Ntr1PhGTBw
 rPPdmX1Jk5O4NEFSfWVdYdlVkn4R7+YthFzh1Bz8uXrSEh5xd9yy2TGSBCoLGUD/2V12Pv
 2+XKZ8SxfkmFvEf3Rjy2/MYzBmBnqrU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-Erqfs7dPOSW7LPrOC0ZgmA-1; Thu, 16 Sep 2021 04:41:23 -0400
X-MC-Unique: Erqfs7dPOSW7LPrOC0ZgmA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A6031006AA1
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 08:41:22 +0000 (UTC)
Received: from localhost (unknown [10.39.192.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AA3145B4BC;
 Thu, 16 Sep 2021 08:41:21 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH v4 04/12] virtiofsd: Use lo_inode_open() instead of openat()
Date: Thu, 16 Sep 2021 10:40:37 +0200
Message-Id: <20210916084045.31684-5-hreitz@redhat.com>
In-Reply-To: <20210916084045.31684-1-hreitz@redhat.com>
References: <20210916084045.31684-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

The xattr functions want a non-O_PATH FD, so they reopen the lo_inode.fd
with the flags they need through /proc/self/fd.

Similarly, lo_opendir() needs an O_RDONLY FD.  Instead of the
/proc/self/fd trick, it just uses openat(fd, "."), because the FD is
guaranteed to be a directory, so this works.

All cases have one problem in common, though: In the future, when we may
have a file handle in the lo_inode instead of an FD, querying an
lo_inode FD may incur an open_by_handle_at() call.  It does not make
sense to then reopen that FD with custom flags, those should have been
passed to open_by_handle_at() instead.

Use lo_inode_open() instead of openat().  As part of the file handle
change, lo_inode_open() will be made to invoke openat() only if
lo_inode.fd is valid.  Otherwise, it will invoke open_by_handle_at()
with the right flags from the start.

Consequently, after this patch, lo_inode_open() is the only place to
invoke openat() to reopen an existing FD with different flags.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 47 ++++++++++++++++++++------------
 1 file changed, 30 insertions(+), 17 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 88318a4ba9..d76283d080 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -1745,18 +1745,26 @@ static void lo_opendir(fuse_req_t req, fuse_ino_t ino,
 {
     int error = ENOMEM;
     struct lo_data *lo = lo_data(req);
-    struct lo_dirp *d;
+    struct lo_inode *inode;
+    struct lo_dirp *d = NULL;
     int fd;
     ssize_t fh;
 
+    inode = lo_inode(req, ino);
+    if (!inode) {
+        error = EBADF;
+        goto out_err;
+    }
+
     d = calloc(1, sizeof(struct lo_dirp));
     if (d == NULL) {
         goto out_err;
     }
 
-    fd = openat(lo_fd(req, ino), ".", O_RDONLY);
-    if (fd == -1) {
-        goto out_errno;
+    fd = lo_inode_open(lo, inode, O_RDONLY);
+    if (fd < 0) {
+        error = -fd;
+        goto out_err;
     }
 
     d->dp = fdopendir(fd);
@@ -1780,11 +1788,13 @@ static void lo_opendir(fuse_req_t req, fuse_ino_t ino,
         fi->cache_readdir = 1;
     }
     fuse_reply_open(req, fi);
+    lo_inode_put(lo, &inode);
     return;
 
 out_errno:
     error = errno;
 out_err:
+    lo_inode_put(lo, &inode);
     if (d) {
         if (d->dp) {
             closedir(d->dp);
@@ -2989,7 +2999,6 @@ static void lo_getxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
         }
     }
 
-    sprintf(procname, "%i", inode->fd);
     /*
      * It is not safe to open() non-regular/non-dir files in file server
      * unless O_PATH is used, so use that method for regular files/dir
@@ -2997,13 +3006,15 @@ static void lo_getxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
      * Otherwise, call fchdir() to avoid open().
      */
     if (S_ISREG(inode->filetype) || S_ISDIR(inode->filetype)) {
-        fd = openat(lo->proc_self_fd, procname, O_RDONLY);
+        fd = lo_inode_open(lo, inode, O_RDONLY);
         if (fd < 0) {
-            goto out_err;
+            saverr = -fd;
+            goto out;
         }
         ret = fgetxattr(fd, name, value, size);
         saverr = ret == -1 ? errno : 0;
     } else {
+        sprintf(procname, "%i", inode->fd);
         /* fchdir should not fail here */
         FCHDIR_NOFAIL(lo->proc_self_fd);
         ret = getxattr(procname, name, value, size);
@@ -3070,15 +3081,16 @@ static void lo_listxattr(fuse_req_t req, fuse_ino_t ino, size_t size)
         }
     }
 
-    sprintf(procname, "%i", inode->fd);
     if (S_ISREG(inode->filetype) || S_ISDIR(inode->filetype)) {
-        fd = openat(lo->proc_self_fd, procname, O_RDONLY);
+        fd = lo_inode_open(lo, inode, O_RDONLY);
         if (fd < 0) {
-            goto out_err;
+            saverr = -fd;
+            goto out;
         }
         ret = flistxattr(fd, value, size);
         saverr = ret == -1 ? errno : 0;
     } else {
+        sprintf(procname, "%i", inode->fd);
         /* fchdir should not fail here */
         FCHDIR_NOFAIL(lo->proc_self_fd);
         ret = listxattr(procname, value, size);
@@ -3175,7 +3187,6 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
                         const char *value, size_t size, int flags,
                         uint32_t extra_flags)
 {
-    char procname[64];
     const char *name;
     char *mapped_name;
     struct lo_data *lo = lo_data(req);
@@ -3221,16 +3232,15 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
     fuse_log(FUSE_LOG_DEBUG, "lo_setxattr(ino=%" PRIu64
              ", name=%s value=%s size=%zd)\n", ino, name, value, size);
 
-    sprintf(procname, "%i", inode->fd);
     /*
      * We can only open regular files or directories.  If the inode is
      * something else, we have to enter /proc/self/fd and use
      * setxattr() on the link's filename there.
      */
     if (S_ISREG(inode->filetype) || S_ISDIR(inode->filetype)) {
-        fd = openat(lo->proc_self_fd, procname, O_RDONLY);
+        fd = lo_inode_open(lo, inode, O_RDONLY);
         if (fd < 0) {
-            saverr = errno;
+            saverr = -fd;
             goto out;
         }
     } else {
@@ -3264,6 +3274,9 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
         ret = fsetxattr(fd, name, value, size, flags);
         saverr = ret == -1 ? errno : 0;
     } else {
+        char procname[64];
+
+        sprintf(procname, "%i", inode->fd);
         ret = setxattr(procname, name, value, size, flags);
         saverr = ret == -1 ? errno : 0;
     }
@@ -3333,16 +3346,16 @@ static void lo_removexattr(fuse_req_t req, fuse_ino_t ino, const char *in_name)
     fuse_log(FUSE_LOG_DEBUG, "lo_removexattr(ino=%" PRIu64 ", name=%s)\n", ino,
              name);
 
-    sprintf(procname, "%i", inode->fd);
     if (S_ISREG(inode->filetype) || S_ISDIR(inode->filetype)) {
-        fd = openat(lo->proc_self_fd, procname, O_RDONLY);
+        fd = lo_inode_open(lo, inode, O_RDONLY);
         if (fd < 0) {
-            saverr = errno;
+            saverr = -fd;
             goto out;
         }
         ret = fremovexattr(fd, name);
         saverr = ret == -1 ? errno : 0;
     } else {
+        sprintf(procname, "%i", inode->fd);
         /* fchdir should not fail here */
         FCHDIR_NOFAIL(lo->proc_self_fd);
         ret = removexattr(procname, name);
-- 
2.31.1


