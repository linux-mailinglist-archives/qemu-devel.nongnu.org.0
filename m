Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EF539BDD0
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:58:34 +0200 (CEST)
Received: from localhost ([::1]:59824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpD9V-0007WP-QT
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:58:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lpCSy-0006om-1I
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:14:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lpCSw-00045i-5X
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:14:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622823273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=23ZgIgdo+LKV2NdBq3QxlBMplzgaGBKwMNDbm/K8//4=;
 b=OWtQ8Pr81Afb9bB1ez9cLn4qYXr3YS4j3Q+EjM4IkdW8RpcOcAAG/UYHgxcK59lH7QSgv8
 /BvRvIu7tpkm9bp0RDANflz19ckuxi65Np4Nl2dG0hGOwxd86Oo9tpCvYYgeK5aIEEW9R5
 fN2GU2sGl2ZFSV4LcUvyi+GXcAqY7XU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-3MCQiK3HMjCLXQAK6rfTxA-1; Fri, 04 Jun 2021 12:14:32 -0400
X-MC-Unique: 3MCQiK3HMjCLXQAK6rfTxA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E3D1101371C
 for <qemu-devel@nongnu.org>; Fri,  4 Jun 2021 16:14:31 +0000 (UTC)
Received: from localhost (ovpn-114-199.ams2.redhat.com [10.36.114.199])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7558E5C26D;
 Fri,  4 Jun 2021 16:14:24 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH 4/9] virtiofsd: Let lo_fd() return a TempFd
Date: Fri,  4 Jun 2021 18:13:32 +0200
Message-Id: <20210604161337.16048-5-mreitz@redhat.com>
In-Reply-To: <20210604161337.16048-1-mreitz@redhat.com>
References: <20210604161337.16048-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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

Accessing lo_inode.fd must generally happen through lo_inode_fd(), and
lo_fd() is no exception; and then it must pass on the TempFd it has
received from lo_inode_fd().

(Note that all lo_fd() calls now use proper error handling, where all of
them were in-line before; i.e. they were used in place of the fd
argument of some function call.  This only worked because the only error
that could occur was that lo_inode() failed to find the inode ID: Then
-1 would be passed as the fd, which would result in an EBADF error,
which is precisely what we would want to return to the guest for an
invalid inode ID.
Now, though, lo_inode_fd() might potentially invoke open_by_handle_at(),
which can return many different errors, and they should be properly
handled and returned to the guest.  So we can no longer allow lo_fd() to
be used in-line, and instead need to do proper error handling for it.)

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 55 +++++++++++++++++++++++++-------
 1 file changed, 44 insertions(+), 11 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 46c9dfe200..8f64bcd6c5 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -644,18 +644,19 @@ static int lo_inode_fd(const struct lo_inode *inode, TempFd *tfd)
  * they are done with the fd.  This will be done in a later patch to make
  * review easier.
  */
-static int lo_fd(fuse_req_t req, fuse_ino_t ino)
+static int lo_fd(fuse_req_t req, fuse_ino_t ino, TempFd *tfd)
 {
     struct lo_inode *inode = lo_inode(req, ino);
-    int fd;
+    int res;
 
     if (!inode) {
-        return -1;
+        return -EBADF;
     }
 
-    fd = inode->fd;
+    res = lo_inode_fd(inode, tfd);
+
     lo_inode_put(lo_data(req), &inode);
-    return fd;
+    return res;
 }
 
 /*
@@ -766,14 +767,19 @@ static void lo_init(void *userdata, struct fuse_conn_info *conn)
 static void lo_getattr(fuse_req_t req, fuse_ino_t ino,
                        struct fuse_file_info *fi)
 {
+    g_auto(TempFd) ino_fd = TEMP_FD_INIT;
     int res;
     struct stat buf;
     struct lo_data *lo = lo_data(req);
 
     (void)fi;
 
-    res =
-        fstatat(lo_fd(req, ino), "", &buf, AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW);
+    res = lo_fd(req, ino, &ino_fd);
+    if (res < 0) {
+        return (void)fuse_reply_err(req, -res);
+    }
+
+    res = fstatat(ino_fd.fd, "", &buf, AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW);
     if (res == -1) {
         return (void)fuse_reply_err(req, errno);
     }
@@ -1441,6 +1447,7 @@ static struct lo_inode *lookup_name(fuse_req_t req, fuse_ino_t parent,
 
 static void lo_rmdir(fuse_req_t req, fuse_ino_t parent, const char *name)
 {
+    g_auto(TempFd) parent_fd = TEMP_FD_INIT;
     int res;
     struct lo_inode *inode;
     struct lo_data *lo = lo_data(req);
@@ -1455,13 +1462,19 @@ static void lo_rmdir(fuse_req_t req, fuse_ino_t parent, const char *name)
         return;
     }
 
+    res = lo_fd(req, parent, &parent_fd);
+    if (res < 0) {
+        fuse_reply_err(req, -res);
+        return;
+    }
+
     inode = lookup_name(req, parent, name);
     if (!inode) {
         fuse_reply_err(req, EIO);
         return;
     }
 
-    res = unlinkat(lo_fd(req, parent), name, AT_REMOVEDIR);
+    res = unlinkat(parent_fd.fd, name, AT_REMOVEDIR);
 
     fuse_reply_err(req, res == -1 ? errno : 0);
     unref_inode_lolocked(lo, inode, 1);
@@ -1547,6 +1560,7 @@ out:
 
 static void lo_unlink(fuse_req_t req, fuse_ino_t parent, const char *name)
 {
+    g_auto(TempFd) parent_fd = TEMP_FD_INIT;
     int res;
     struct lo_inode *inode;
     struct lo_data *lo = lo_data(req);
@@ -1561,13 +1575,19 @@ static void lo_unlink(fuse_req_t req, fuse_ino_t parent, const char *name)
         return;
     }
 
+    res = lo_fd(req, parent, &parent_fd);
+    if (res < 0) {
+        fuse_reply_err(req, -res);
+        return;
+    }
+
     inode = lookup_name(req, parent, name);
     if (!inode) {
         fuse_reply_err(req, EIO);
         return;
     }
 
-    res = unlinkat(lo_fd(req, parent), name, 0);
+    res = unlinkat(parent_fd.fd, name, 0);
 
     fuse_reply_err(req, res == -1 ? errno : 0);
     unref_inode_lolocked(lo, inode, 1);
@@ -1647,10 +1667,16 @@ static void lo_forget_multi(fuse_req_t req, size_t count,
 
 static void lo_readlink(fuse_req_t req, fuse_ino_t ino)
 {
+    g_auto(TempFd) ino_fd = TEMP_FD_INIT;
     char buf[PATH_MAX + 1];
     int res;
 
-    res = readlinkat(lo_fd(req, ino), "", buf, sizeof(buf));
+    res = lo_fd(req, ino, &ino_fd);
+    if (res < 0) {
+        return (void)fuse_reply_err(req, -res);
+    }
+
+    res = readlinkat(ino_fd.fd, "", buf, sizeof(buf));
     if (res == -1) {
         return (void)fuse_reply_err(req, errno);
     }
@@ -2447,10 +2473,17 @@ static void lo_write_buf(fuse_req_t req, fuse_ino_t ino,
 
 static void lo_statfs(fuse_req_t req, fuse_ino_t ino)
 {
+    g_auto(TempFd) ino_fd = TEMP_FD_INIT;
     int res;
     struct statvfs stbuf;
 
-    res = fstatvfs(lo_fd(req, ino), &stbuf);
+    res = lo_fd(req, ino, &ino_fd);
+    if (res < 0) {
+        fuse_reply_err(req, -res);
+        return;
+    }
+
+    res = fstatvfs(ino_fd.fd, &stbuf);
     if (res == -1) {
         fuse_reply_err(req, errno);
     } else {
-- 
2.31.1


