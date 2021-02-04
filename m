Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA39E30FC71
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 20:19:31 +0100 (CET)
Received: from localhost ([::1]:51006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7kA6-0002qH-Vu
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 14:19:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7jTb-0002UD-T1
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 13:35:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7jTO-0004T9-C1
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 13:35:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612463720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=34bn4iYROhYf74704WZ1pi7p7y8NX/XWdva2PxfrYeo=;
 b=hjkL5IjuhPfum8Dm2Z+85+Cpv10+SqPab00rQv9iqyWrwyMv74526oJplOS50Aum7rUmqh
 gfb/WEd8wFgIc/JhZiW6aHPnEHMcz4s5ZKqNlsbqQmjexPvEkhXQgeL237l3wEaI7zg3ky
 k+PjZknMXm47jVc+b0U2T9GBsO+ZU30=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-5e8DL4jWPHW_SArQ2uFebw-1; Thu, 04 Feb 2021 13:35:16 -0500
X-MC-Unique: 5e8DL4jWPHW_SArQ2uFebw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42A5B8799EC;
 Thu,  4 Feb 2021 18:35:15 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-21.ams2.redhat.com
 [10.36.114.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1581870483;
 Thu,  4 Feb 2021 18:35:13 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, virtio-fs@redhat.com, stefanha@redhat.com,
 groug@kaod.org, qemu-stable@nongnu.org
Subject: [PULL 1/5] virtiofsd: extract lo_do_open() from lo_open()
Date: Thu,  4 Feb 2021 18:34:35 +0000
Message-Id: <20210204183439.546918-2-dgilbert@redhat.com>
In-Reply-To: <20210204183439.546918-1-dgilbert@redhat.com>
References: <20210204183439.546918-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

Both lo_open() and lo_create() have similar code to open a file. Extract
a common lo_do_open() function from lo_open() that will be used by
lo_create() in a later commit.

Since lo_do_open() does not otherwise need fuse_req_t req, convert
lo_add_fd_mapping() to use struct lo_data *lo instead.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20210204150208.367837-2-stefanha@redhat.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 73 ++++++++++++++++++++------------
 1 file changed, 46 insertions(+), 27 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 5fb36d9407..f14fa5124d 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -459,17 +459,17 @@ static void lo_map_remove(struct lo_map *map, size_t key)
 }
 
 /* Assumes lo->mutex is held */
-static ssize_t lo_add_fd_mapping(fuse_req_t req, int fd)
+static ssize_t lo_add_fd_mapping(struct lo_data *lo, int fd)
 {
     struct lo_map_elem *elem;
 
-    elem = lo_map_alloc_elem(&lo_data(req)->fd_map);
+    elem = lo_map_alloc_elem(&lo->fd_map);
     if (!elem) {
         return -1;
     }
 
     elem->fd = fd;
-    return elem - lo_data(req)->fd_map.elems;
+    return elem - lo->fd_map.elems;
 }
 
 /* Assumes lo->mutex is held */
@@ -1651,6 +1651,38 @@ static void update_open_flags(int writeback, int allow_direct_io,
     }
 }
 
+static int lo_do_open(struct lo_data *lo, struct lo_inode *inode,
+                      struct fuse_file_info *fi)
+{
+    char buf[64];
+    ssize_t fh;
+    int fd;
+
+    update_open_flags(lo->writeback, lo->allow_direct_io, fi);
+
+    sprintf(buf, "%i", inode->fd);
+    fd = openat(lo->proc_self_fd, buf, fi->flags & ~O_NOFOLLOW);
+    if (fd == -1) {
+        return errno;
+    }
+
+    pthread_mutex_lock(&lo->mutex);
+    fh = lo_add_fd_mapping(lo, fd);
+    pthread_mutex_unlock(&lo->mutex);
+    if (fh == -1) {
+        close(fd);
+        return ENOMEM;
+    }
+
+    fi->fh = fh;
+    if (lo->cache == CACHE_NONE) {
+        fi->direct_io = 1;
+    } else if (lo->cache == CACHE_ALWAYS) {
+        fi->keep_cache = 1;
+    }
+    return 0;
+}
+
 static void lo_create(fuse_req_t req, fuse_ino_t parent, const char *name,
                       mode_t mode, struct fuse_file_info *fi)
 {
@@ -1691,7 +1723,7 @@ static void lo_create(fuse_req_t req, fuse_ino_t parent, const char *name,
         ssize_t fh;
 
         pthread_mutex_lock(&lo->mutex);
-        fh = lo_add_fd_mapping(req, fd);
+        fh = lo_add_fd_mapping(lo, fd);
         pthread_mutex_unlock(&lo->mutex);
         if (fh == -1) {
             close(fd);
@@ -1892,38 +1924,25 @@ static void lo_fsyncdir(fuse_req_t req, fuse_ino_t ino, int datasync,
 
 static void lo_open(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi)
 {
-    int fd;
-    ssize_t fh;
-    char buf[64];
     struct lo_data *lo = lo_data(req);
+    struct lo_inode *inode = lo_inode(req, ino);
+    int err;
 
     fuse_log(FUSE_LOG_DEBUG, "lo_open(ino=%" PRIu64 ", flags=%d)\n", ino,
              fi->flags);
 
-    update_open_flags(lo->writeback, lo->allow_direct_io, fi);
-
-    sprintf(buf, "%i", lo_fd(req, ino));
-    fd = openat(lo->proc_self_fd, buf, fi->flags & ~O_NOFOLLOW);
-    if (fd == -1) {
-        return (void)fuse_reply_err(req, errno);
-    }
-
-    pthread_mutex_lock(&lo->mutex);
-    fh = lo_add_fd_mapping(req, fd);
-    pthread_mutex_unlock(&lo->mutex);
-    if (fh == -1) {
-        close(fd);
-        fuse_reply_err(req, ENOMEM);
+    if (!inode) {
+        fuse_reply_err(req, EBADF);
         return;
     }
 
-    fi->fh = fh;
-    if (lo->cache == CACHE_NONE) {
-        fi->direct_io = 1;
-    } else if (lo->cache == CACHE_ALWAYS) {
-        fi->keep_cache = 1;
+    err = lo_do_open(lo, inode, fi);
+    lo_inode_put(lo, &inode);
+    if (err) {
+        fuse_reply_err(req, err);
+    } else {
+        fuse_reply_open(req, fi);
     }
-    fuse_reply_open(req, fi);
 }
 
 static void lo_release(fuse_req_t req, fuse_ino_t ino,
-- 
2.29.2


