Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FE9417BF2
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 21:52:44 +0200 (CEST)
Received: from localhost ([::1]:51774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTrFT-0006rc-Ci
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 15:52:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mTrCd-00049r-Gc
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 15:49:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mTrCV-0004I7-6t
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 15:49:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632512978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CXnOCJc0zCqSN0TB99jBNe7ZLRHAc8j+BmGoV7yK9Bs=;
 b=N1QZWizs//43hGhDFgDvjtnGWVYOYbw0D7JypTnQgyfpl3ChquyRpuRXeviqMvIOI8L6tZ
 0t51cQOWHl8j6jIrVGx6eZ4OFOlTqk4fTrudWHALGBGpYi/KpSpjwZjWzwfZ1l990dj0rz
 wxw8wXhovO5csgXCInZz4FolvsOg8QY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-RQ0JiS_5MCGtjW_NHFLETg-1; Fri, 24 Sep 2021 15:49:34 -0400
X-MC-Unique: RQ0JiS_5MCGtjW_NHFLETg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC5F21860184;
 Fri, 24 Sep 2021 19:49:07 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.32.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F4E15BAEA;
 Fri, 24 Sep 2021 19:49:07 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 67B00228284; Fri, 24 Sep 2021 15:49:06 -0400 (EDT)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH 5/5] virtiofsd: Create new file using O_TMPFILE and set
 security context
Date: Fri, 24 Sep 2021 15:48:54 -0400
Message-Id: <20210924194854.919414-6-vgoyal@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIMWL_WL_HIGH=-1.473, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

If guest and host policies can't work with each other, then guest security
context (selinux label) needs to be set into an xattr. Say remap guest
security.selinux xattr to trusted.virtiofs.security.selinux.

That means setting "fscreate" is not going to help as that's ony useful
for security.selinux xattr on host.

So we need another method which is atomic. Use O_TMPFILE to create new
file, set xattr and then linkat() to proper place.

But this works only for regular files. So dir, symlinks will continue
to be non-atomic.

Also if host filesystem does not support O_TMPFILE, we fallback to
non-atomic behavior.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 78 +++++++++++++++++++++++++++++---
 1 file changed, 71 insertions(+), 7 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index d8c14d3220..f5c3746510 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -2099,14 +2099,29 @@ static int lo_do_open(struct lo_data *lo, struct lo_inode *inode,
 
 static int do_create_nosecctx(fuse_req_t req, struct lo_inode *parent_inode,
                                const char *name, mode_t mode,
-                               struct fuse_file_info *fi, int *open_fd)
+                               struct fuse_file_info *fi, int *open_fd,
+                              bool tmpfile)
 {
     int err, fd;
     struct lo_cred old = {};
     struct lo_data *lo = lo_data(req);
     int flags;
 
-    flags = fi->flags | O_CREAT | O_EXCL;
+    if (tmpfile) {
+        flags = fi->flags | O_TMPFILE;
+        /*
+         * Don't use O_EXCL as we want to link file later. Also reset O_CREAT
+         * otherwise openat() returns -EINVAL.
+         */
+        flags &= ~(O_CREAT | O_EXCL);
+
+        /* O_TMPFILE needs either O_RDWR or O_WRONLY */
+        if ((flags & O_ACCMODE) == O_RDONLY) {
+            flags |= O_RDWR;
+        }
+    } else {
+        flags = fi->flags | O_CREAT | O_EXCL;
+    }
 
     err = lo_change_cred(req, &old, lo->change_umask);
     if (err) {
@@ -2137,7 +2152,7 @@ static int do_create_secctx_fscreate(fuse_req_t req,
         return err;
     }
 
-    err = do_create_nosecctx(req, parent_inode, name, mode, fi, &fd);
+    err = do_create_nosecctx(req, parent_inode, name, mode, fi, &fd, false);
 
     close_reset_proc_fscreate(fscreate_fd);
     if (!err) {
@@ -2146,6 +2161,44 @@ static int do_create_secctx_fscreate(fuse_req_t req,
     return err;
 }
 
+static int do_create_secctx_tmpfile(fuse_req_t req,
+                                    struct lo_inode *parent_inode,
+                                    const char *name, mode_t mode,
+                                    struct fuse_file_info *fi,
+                                    const char *secctx_name, int *open_fd)
+{
+    int err, fd = -1;
+    struct lo_data *lo = lo_data(req);
+    char procname[64];
+
+    err = do_create_nosecctx(req, parent_inode, ".", mode, fi, &fd, true);
+    if (err) {
+        return err;
+    }
+
+    err = fsetxattr(fd, secctx_name, req->secctx.ctx, req->secctx.ctxlen, 0);
+    if (err) {
+        err = errno;
+        goto out;
+    }
+
+    /* Security context set on file. Link it in place */
+    sprintf(procname, "%d", fd);
+    FCHDIR_NOFAIL(lo->proc_self_fd);
+    err = linkat(AT_FDCWD, procname, parent_inode->fd, name,
+                 AT_SYMLINK_FOLLOW);
+    err = err == -1 ? errno : 0;
+    FCHDIR_NOFAIL(lo->root.fd);
+
+out:
+    if (!err) {
+        *open_fd = fd;
+    } else if (fd != -1) {
+        close(fd);
+    }
+    return err;
+}
+
 static int do_create_secctx_noatomic(fuse_req_t req,
                                      struct lo_inode *parent_inode,
                                      const char *name, mode_t mode,
@@ -2154,7 +2207,7 @@ static int do_create_secctx_noatomic(fuse_req_t req,
 {
     int err = 0, fd = -1;
 
-    err = do_create_nosecctx(req, parent_inode, name, mode, fi, &fd);
+    err = do_create_nosecctx(req, parent_inode, name, mode, fi, &fd, false);
     if (err) {
         goto out;
     }
@@ -2196,20 +2249,31 @@ static int do_lo_create(fuse_req_t req, struct lo_inode *parent_inode,
     if (secctx_enabled) {
         /*
          * If security.selinux has not been remapped. Use fscreate to set
-         * context before file creation.
-         * Otherwise fallback to non-atomic method of file creation
+         * context before file creation. Use tempfile method for regular
+         * files. Otherwise fallback to non-atomic method of file creation
          * and xattr settting.
          */
         if (!mapped_name) {
             err = do_create_secctx_fscreate(req, parent_inode, name, mode, fi,
                                             open_fd);
             goto out;
+        } else if (S_ISREG(mode)) {
+            err = do_create_secctx_tmpfile(req, parent_inode, name, mode, fi,
+                                           ctxname, open_fd);
+            /*
+             * If filesystem does not support O_TMPFILE, fallback to non-atomic
+             * method.
+             */
+            if (!err || err != EOPNOTSUPP) {
+                goto out;
+            }
         }
 
         err = do_create_secctx_noatomic(req, parent_inode, name, mode, fi,
                                         ctxname, open_fd);
     } else {
-        err = do_create_nosecctx(req, parent_inode, name, mode, fi, open_fd);
+        err = do_create_nosecctx(req, parent_inode, name, mode, fi, open_fd,
+                                 false);
     }
 
 out:
-- 
2.31.1


