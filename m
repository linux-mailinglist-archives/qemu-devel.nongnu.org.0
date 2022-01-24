Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 149CC499764
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 22:28:02 +0100 (CET)
Received: from localhost ([::1]:57700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC6sa-00073U-K4
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 16:28:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1nC6q5-0004Fg-Ji
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 16:25:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1nC6q2-0005Ja-3L
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 16:25:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643059519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3T5bD787+9LQh658bYXKz6+jsogqmxJULPNKoKazUno=;
 b=GM8JPL5kxqELFzaZSfRB3h2+1jBOgyGcprFGbBTyaNfzFc/6dSsE+4Nf3PO8MFoevsoSC7
 imY/eOD2IxhbfQUhxd9E+sYj1BD+ieQI0ofZfkiUxlm2b0H1m75nDWQA+wLjf1ovHi5D6u
 e9oJe+tPJQv2fhG9t44nzfokoH0VZKw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-552-aSM2ZHNIN-Cd8TmNkUQrkQ-1; Mon, 24 Jan 2022 16:25:15 -0500
X-MC-Unique: aSM2ZHNIN-Cd8TmNkUQrkQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBE4C100C665
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 21:25:14 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.16.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B90C54D738;
 Mon, 24 Jan 2022 21:25:14 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id D7A292241C9; Mon, 24 Jan 2022 16:25:13 -0500 (EST)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH v4 8/9] virtiofsd: Create new file using O_TMPFILE and set
 security context
Date: Mon, 24 Jan 2022 16:24:54 -0500
Message-Id: <20220124212455.83968-9-vgoyal@redhat.com>
In-Reply-To: <20220124212455.83968-1-vgoyal@redhat.com>
References: <20220124212455.83968-1-vgoyal@redhat.com>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: mszeredi@redhat.com, stefanha@redhat.com, dgilbert@redhat.com,
 vgoyal@redhat.com
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
 tools/virtiofsd/passthrough_ll.c | 80 ++++++++++++++++++++++++++++----
 1 file changed, 72 insertions(+), 8 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 7a714b1b5e..4505c0c363 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -2128,14 +2128,29 @@ static int lo_do_open(struct lo_data *lo, struct lo_inode *inode,
 
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
@@ -2166,7 +2181,7 @@ static int do_create_secctx_fscreate(fuse_req_t req,
         return err;
     }
 
-    err = do_create_nosecctx(req, parent_inode, name, mode, fi, &fd);
+    err = do_create_nosecctx(req, parent_inode, name, mode, fi, &fd, false);
 
     close_reset_proc_fscreate(fscreate_fd);
     if (!err) {
@@ -2175,6 +2190,44 @@ static int do_create_secctx_fscreate(fuse_req_t req,
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
@@ -2183,7 +2236,7 @@ static int do_create_secctx_noatomic(fuse_req_t req,
 {
     int err = 0, fd = -1;
 
-    err = do_create_nosecctx(req, parent_inode, name, mode, fi, &fd);
+    err = do_create_nosecctx(req, parent_inode, name, mode, fi, &fd, false);
     if (err) {
         goto out;
     }
@@ -2225,20 +2278,31 @@ static int do_lo_create(fuse_req_t req, struct lo_inode *parent_inode,
     if (secctx_enabled) {
         /*
          * If security.selinux has not been remapped and selinux is enabled,
-         * use fscreate to set context before file creation.
-         * Otherwise fallback to non-atomic method of file creation
-         * and xattr settting.
+         * use fscreate to set context before file creation. If not, use
+         * tmpfile method for regular files. Otherwise fallback to
+         * non-atomic method of file creation and xattr settting.
          */
         if (!mapped_name && lo->use_fscreate) {
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


