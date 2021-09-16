Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E3D40D51A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 10:52:30 +0200 (CEST)
Received: from localhost ([::1]:34444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQn89-0003YB-Ot
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 04:52:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQmy6-0005Vn-3M
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 04:42:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQmy4-0004vK-7F
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 04:42:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631781723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QK4Ko1a0HV1/11qX46Shrs3wSZtvo4iD4h0aQ3Iaf/s=;
 b=ImQPIazp6C0hn4ZCOr2vHKyr3BbwbN6UysB92LWauTsX0XXo1+YpVRlHcAV06KpEDXLjn6
 p8z1R7lpH7HS7WjuMepWN0tMOJierwOKMv4w+rVvTeZ0mUeCbr5YjeDStbTd7hwCc13oZM
 rLPPBEecFSYABCoNmgs5lvPmeJsChfU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463--YpCZLupM4-abStfmzQusg-1; Thu, 16 Sep 2021 04:42:02 -0400
X-MC-Unique: -YpCZLupM4-abStfmzQusg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2276E835DE0
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 08:42:01 +0000 (UTC)
Received: from localhost (unknown [10.39.192.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CD4CA10027C4;
 Thu, 16 Sep 2021 08:41:52 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH v4 08/12] virtiofsd: Pass lo_data to lo_inode_{fd,open}()
Date: Thu, 16 Sep 2021 10:40:41 +0200
Message-Id: <20210916084045.31684-9-hreitz@redhat.com>
In-Reply-To: <20210916084045.31684-1-hreitz@redhat.com>
References: <20210916084045.31684-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

In order to be able to use file handles for identifying lo_inode
objects, we will add some global state to lo_data, which we will need in
a future function to be called from lo_inode_fd() and lo_inode_open().

To prepare for this, pass a (non-const) lo_data pointer to lo_inode_fd()
and lo_inode_open().

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 34 +++++++++++++++++---------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index d257eda129..bc3b803d46 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -647,7 +647,8 @@ static struct lo_inode *lo_inode(fuse_req_t req, fuse_ino_t ino)
     return elem->inode;
 }
 
-static int lo_inode_fd(const struct lo_inode *inode, TempFd *tfd)
+static int lo_inode_fd(struct lo_data *lo, const struct lo_inode *inode,
+                       TempFd *tfd)
 {
     *tfd = (TempFd) {
         .fd = inode->fd,
@@ -665,15 +666,16 @@ static int lo_inode_fd(const struct lo_inode *inode, TempFd *tfd)
 static int lo_fd(fuse_req_t req, fuse_ino_t ino, TempFd *tfd)
 {
     struct lo_inode *inode = lo_inode(req, ino);
+    struct lo_data *lo = lo_data(req);
     int res;
 
     if (!inode) {
         return -EBADF;
     }
 
-    res = lo_inode_fd(inode, tfd);
+    res = lo_inode_fd(lo, inode, tfd);
 
-    lo_inode_put(lo_data(req), &inode);
+    lo_inode_put(lo, &inode);
     return res;
 }
 
@@ -881,7 +883,7 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
             temp_fd_copy(&rw_fd, &path_fd);
         }
     } else {
-        res = lo_inode_fd(inode, &path_fd);
+        res = lo_inode_fd(lo, inode, &path_fd);
     }
     if (res < 0) {
         saverr = -res;
@@ -1128,7 +1130,7 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
         name = ".";
     }
 
-    res = lo_inode_fd(dir, &dir_path_fd);
+    res = lo_inode_fd(lo, dir, &dir_path_fd);
     if (res < 0) {
         saverr = -res;
         goto out;
@@ -1383,7 +1385,7 @@ static void lo_mknod_symlink(fuse_req_t req, fuse_ino_t parent,
         return;
     }
 
-    res = lo_inode_fd(dir, &dir_path_fd);
+    res = lo_inode_fd(lo, dir, &dir_path_fd);
     if (res < 0) {
         saverr = -res;
         goto out;
@@ -1469,13 +1471,13 @@ static void lo_link(fuse_req_t req, fuse_ino_t ino, fuse_ino_t parent,
         goto out;
     }
 
-    res = lo_inode_fd(inode, &path_fd);
+    res = lo_inode_fd(lo, inode, &path_fd);
     if (res < 0) {
         saverr = -res;
         goto out;
     }
 
-    res = lo_inode_fd(parent_inode, &parent_path_fd);
+    res = lo_inode_fd(lo, parent_inode, &parent_path_fd);
     if (res < 0) {
         saverr = -res;
         goto out;
@@ -1535,7 +1537,7 @@ static struct lo_inode *lookup_name(fuse_req_t req, fuse_ino_t parent,
         goto out;
     }
 
-    res = lo_inode_fd(dir, &dir_path_fd);
+    res = lo_inode_fd(lo, dir, &dir_path_fd);
     if (res < 0) {
         goto out;
     }
@@ -1627,13 +1629,13 @@ static void lo_rename(fuse_req_t req, fuse_ino_t parent, const char *name,
         goto out;
     }
 
-    res = lo_inode_fd(parent_inode, &parent_path_fd);
+    res = lo_inode_fd(lo, parent_inode, &parent_path_fd);
     if (res < 0) {
         fuse_reply_err(req, -res);
         goto out;
     }
 
-    res = lo_inode_fd(newparent_inode, &newparent_path_fd);
+    res = lo_inode_fd(lo, newparent_inode, &newparent_path_fd);
     if (res < 0) {
         fuse_reply_err(req, -res);
         goto out;
@@ -2181,7 +2183,7 @@ static void lo_create(fuse_req_t req, fuse_ino_t parent, const char *name,
         return;
     }
 
-    err = lo_inode_fd(parent_inode, &parent_path_fd);
+    err = lo_inode_fd(lo, parent_inode, &parent_path_fd);
     if (err < 0) {
         err = -err;
         goto out;
@@ -3135,7 +3137,7 @@ static void lo_getxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
     } else {
         g_auto(TempFd) path_fd = TEMP_FD_INIT;
 
-        ret = lo_inode_fd(inode, &path_fd);
+        ret = lo_inode_fd(lo, inode, &path_fd);
         if (ret < 0) {
             saverr = -ret;
             goto out;
@@ -3215,7 +3217,7 @@ static void lo_listxattr(fuse_req_t req, fuse_ino_t ino, size_t size)
     } else {
         g_auto(TempFd) path_fd = TEMP_FD_INIT;
 
-        ret = lo_inode_fd(inode, &path_fd);
+        ret = lo_inode_fd(lo, inode, &path_fd);
         if (ret < 0) {
             saverr = -ret;
             goto out;
@@ -3371,7 +3373,7 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
             goto out;
         }
     } else {
-        ret = lo_inode_fd(inode, &path_fd);
+        ret = lo_inode_fd(lo, inode, &path_fd);
         if (ret < 0) {
             saverr = -ret;
             goto out;
@@ -3486,7 +3488,7 @@ static void lo_removexattr(fuse_req_t req, fuse_ino_t ino, const char *in_name)
     } else {
         g_auto(TempFd) path_fd = TEMP_FD_INIT;
 
-        ret = lo_inode_fd(inode, &path_fd);
+        ret = lo_inode_fd(lo, inode, &path_fd);
         if (ret < 0) {
             saverr = -ret;
             goto out;
-- 
2.31.1


