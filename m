Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC5340D50D
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 10:50:56 +0200 (CEST)
Received: from localhost ([::1]:60082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQn6d-0001nh-BC
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 04:50:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQmxs-0004ve-1d
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 04:41:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQmxq-0004e0-7r
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 04:41:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631781705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GQq7PVfPt12HO8B/MZpLQYAZnvGez48Zdk7HM3HgHyQ=;
 b=QBVugky3j1ipUaocAhPjhkzcxOiMC4Fkvs6q1Xnz8w/+Yjkda5gMMMB5s0tlsfi5W773KK
 JcgsWrpZRJ7KjtwxjGpGivHwGdg5IDvmtrHkqrHofPOiyK4w7ucWHQxkul7m2n8/+3NIcF
 cJUbjB7pIQuLL+ZyjRK0YUEDxyd7/Jw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-5930drqdNxqDgstSVRwiRw-1; Thu, 16 Sep 2021 04:41:42 -0400
X-MC-Unique: 5930drqdNxqDgstSVRwiRw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7BF4108468C
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 08:41:41 +0000 (UTC)
Received: from localhost (unknown [10.39.192.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BC9296D981;
 Thu, 16 Sep 2021 08:41:32 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH v4 06/12] virtiofsd: Let lo_fd() return a TempFd
Date: Thu, 16 Sep 2021 10:40:39 +0200
Message-Id: <20210916084045.31684-7-hreitz@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
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

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 55 +++++++++++++++++++++++++-------
 1 file changed, 44 insertions(+), 11 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index c5baa752e4..3bf20b8659 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -666,18 +666,19 @@ static int lo_inode_fd(const struct lo_inode *inode, TempFd *tfd)
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
@@ -814,14 +815,19 @@ static void lo_init(void *userdata, struct fuse_conn_info *conn)
 static void lo_getattr(fuse_req_t req, fuse_ino_t ino,
                        struct fuse_file_info *fi)
 {
+    g_auto(TempFd) path_fd = TEMP_FD_INIT;
     int res;
     struct stat buf;
     struct lo_data *lo = lo_data(req);
 
     (void)fi;
 
-    res =
-        fstatat(lo_fd(req, ino), "", &buf, AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW);
+    res = lo_fd(req, ino, &path_fd);
+    if (res < 0) {
+        return (void)fuse_reply_err(req, -res);
+    }
+
+    res = fstatat(path_fd.fd, "", &buf, AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW);
     if (res == -1) {
         return (void)fuse_reply_err(req, errno);
     }
@@ -1547,6 +1553,7 @@ out:
 
 static void lo_rmdir(fuse_req_t req, fuse_ino_t parent, const char *name)
 {
+    g_auto(TempFd) parent_path_fd = TEMP_FD_INIT;
     int res;
     struct lo_inode *inode;
     struct lo_data *lo = lo_data(req);
@@ -1561,13 +1568,19 @@ static void lo_rmdir(fuse_req_t req, fuse_ino_t parent, const char *name)
         return;
     }
 
+    res = lo_fd(req, parent, &parent_path_fd);
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
+    res = unlinkat(parent_path_fd.fd, name, AT_REMOVEDIR);
 
     fuse_reply_err(req, res == -1 ? errno : 0);
     unref_inode_lolocked(lo, inode, 1);
@@ -1653,6 +1666,7 @@ out:
 
 static void lo_unlink(fuse_req_t req, fuse_ino_t parent, const char *name)
 {
+    g_auto(TempFd) parent_path_fd = TEMP_FD_INIT;
     int res;
     struct lo_inode *inode;
     struct lo_data *lo = lo_data(req);
@@ -1667,13 +1681,19 @@ static void lo_unlink(fuse_req_t req, fuse_ino_t parent, const char *name)
         return;
     }
 
+    res = lo_fd(req, parent, &parent_path_fd);
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
+    res = unlinkat(parent_path_fd.fd, name, 0);
 
     fuse_reply_err(req, res == -1 ? errno : 0);
     unref_inode_lolocked(lo, inode, 1);
@@ -1753,10 +1773,16 @@ static void lo_forget_multi(fuse_req_t req, size_t count,
 
 static void lo_readlink(fuse_req_t req, fuse_ino_t ino)
 {
+    g_auto(TempFd) path_fd = TEMP_FD_INIT;
     char buf[PATH_MAX + 1];
     int res;
 
-    res = readlinkat(lo_fd(req, ino), "", buf, sizeof(buf));
+    res = lo_fd(req, ino, &path_fd);
+    if (res < 0) {
+        return (void)fuse_reply_err(req, -res);
+    }
+
+    res = readlinkat(path_fd.fd, "", buf, sizeof(buf));
     if (res == -1) {
         return (void)fuse_reply_err(req, errno);
     }
@@ -2554,10 +2580,17 @@ static void lo_write_buf(fuse_req_t req, fuse_ino_t ino,
 
 static void lo_statfs(fuse_req_t req, fuse_ino_t ino)
 {
+    g_auto(TempFd) path_fd = TEMP_FD_INIT;
     int res;
     struct statvfs stbuf;
 
-    res = fstatvfs(lo_fd(req, ino), &stbuf);
+    res = lo_fd(req, ino, &path_fd);
+    if (res < 0) {
+        fuse_reply_err(req, -res);
+        return;
+    }
+
+    res = fstatvfs(path_fd.fd, &stbuf);
     if (res == -1) {
         fuse_reply_err(req, errno);
     } else {
-- 
2.31.1


