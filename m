Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FF03A1A6E
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 18:04:48 +0200 (CEST)
Received: from localhost ([::1]:45664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr0hD-0006wz-3Y
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 12:04:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lr0Z9-00042G-Nm
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 11:56:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lr0Z7-0006xe-N2
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 11:56:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623254185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zBNV20/rfrCAEeRG/biHZJ+6Oc8sUFzI+/cPDrPFG+k=;
 b=D93U9Axyn0QZKwSQSvjpgVTMLbIxHLLUCqChCZiQymPVV3Ljp8tM1KrCKr+twKBNp8awJ1
 RfF6l/9qDSacr4PnWp74g3j7oDnF6+reGdBmu1MYbu2Ozk4ivUqcllYZa209jB84/dmq42
 28yWVGT6Fw2q591SUqambyX4ZaisX4k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-FEGHfs4wPhGR3W5Rv_WnmA-1; Wed, 09 Jun 2021 11:56:23 -0400
X-MC-Unique: FEGHfs4wPhGR3W5Rv_WnmA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 048F8100CA8C
 for <qemu-devel@nongnu.org>; Wed,  9 Jun 2021 15:56:23 +0000 (UTC)
Received: from localhost (ovpn-114-102.ams2.redhat.com [10.36.114.102])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 94E0D100238C;
 Wed,  9 Jun 2021 15:56:12 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH v2 2/9] virtiofsd: Use lo_inode_open() instead of openat()
Date: Wed,  9 Jun 2021 17:55:44 +0200
Message-Id: <20210609155551.44437-3-mreitz@redhat.com>
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
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
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

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 43 ++++++++++++++++++++------------
 1 file changed, 27 insertions(+), 16 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index a4674aba80..436f771d2a 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -1645,18 +1645,26 @@ static void lo_opendir(fuse_req_t req, fuse_ino_t ino,
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
@@ -1685,6 +1693,7 @@ static void lo_opendir(fuse_req_t req, fuse_ino_t ino,
 out_errno:
     error = errno;
 out_err:
+    lo_inode_put(lo, &inode);
     if (d) {
         if (d->dp) {
             closedir(d->dp);
@@ -2827,7 +2836,6 @@ static void lo_getxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
         }
     }
 
-    sprintf(procname, "%i", inode->fd);
     /*
      * It is not safe to open() non-regular/non-dir files in file server
      * unless O_PATH is used, so use that method for regular files/dir
@@ -2835,12 +2843,14 @@ static void lo_getxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
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
     } else {
+        sprintf(procname, "%i", inode->fd);
         /* fchdir should not fail here */
         FCHDIR_NOFAIL(lo->proc_self_fd);
         ret = getxattr(procname, name, value, size);
@@ -2906,14 +2916,15 @@ static void lo_listxattr(fuse_req_t req, fuse_ino_t ino, size_t size)
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
     } else {
+        sprintf(procname, "%i", inode->fd);
         /* fchdir should not fail here */
         FCHDIR_NOFAIL(lo->proc_self_fd);
         ret = listxattr(procname, value, size);
@@ -3039,15 +3050,15 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
     fuse_log(FUSE_LOG_DEBUG, "lo_setxattr(ino=%" PRIu64
              ", name=%s value=%s size=%zd)\n", ino, name, value, size);
 
-    sprintf(procname, "%i", inode->fd);
     if (S_ISREG(inode->filetype) || S_ISDIR(inode->filetype)) {
-        fd = openat(lo->proc_self_fd, procname, O_RDONLY);
+        fd = lo_inode_open(lo, inode, O_RDONLY);
         if (fd < 0) {
-            saverr = errno;
+            saverr = -fd;
             goto out;
         }
         ret = fsetxattr(fd, name, value, size, flags);
     } else {
+        sprintf(procname, "%i", inode->fd);
         /* fchdir should not fail here */
         FCHDIR_NOFAIL(lo->proc_self_fd);
         ret = setxattr(procname, name, value, size, flags);
@@ -3105,15 +3116,15 @@ static void lo_removexattr(fuse_req_t req, fuse_ino_t ino, const char *in_name)
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
     } else {
+        sprintf(procname, "%i", inode->fd);
         /* fchdir should not fail here */
         FCHDIR_NOFAIL(lo->proc_self_fd);
         ret = removexattr(procname, name);
-- 
2.31.1


