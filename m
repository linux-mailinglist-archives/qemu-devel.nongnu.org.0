Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4EA2DB157
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 17:27:51 +0100 (CET)
Received: from localhost ([::1]:38646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpDB0-0006JE-38
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 11:27:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangjiachen.jaycee@bytedance.com>)
 id 1kpD5Z-0007Ch-Lg
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 11:22:13 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:41457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhangjiachen.jaycee@bytedance.com>)
 id 1kpD5X-0003AB-D6
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 11:22:13 -0500
Received: by mail-pl1-x642.google.com with SMTP id y8so11291723plp.8
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 08:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K+HpNZdpvxSaJdXGI4b5ygY1w69p6F0m5AP5b42TtLg=;
 b=y6jd9lA6t5fzFap5uBDeq4v4mt5GBSRrXCJ/yNs722GuI145IT7tKfnjOKsJ9idgW6
 wctStmTBUzUg4nBA7mQqfCi6aDHvUjY9YD+KcX946pTXi6L4wJ3ZXlK53jDMTW9XKlY2
 Kth7cCibiwKz6/xN/Y/BMJX/jkJ5BPST6/TI/SnDy1Dqy5iHNkyEVJpZmXkBZgirA5Td
 sxewPpoFxwSZiTRrapNXj8oj4pRFNTkadgcNnJ5zzQ2bWpA8mMmKNa2ldAQDHFv+pCPG
 F6tUC5zfX0qIuRq4RJQGsexLU6o8uHuKU9vBR7NOl2miTxaHnKwhbigzXPS28BnjlBEu
 NXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K+HpNZdpvxSaJdXGI4b5ygY1w69p6F0m5AP5b42TtLg=;
 b=jdhwW69o26Aj+idVEGXARSu0hLBhY0iV/Mxyzh6F/7NhtoEwC6Q4daIWsk5lrk6ABw
 7nCu1687vdN4GyunbdcMtENNfQvyoWeEpe9K1UxdcFTPFuRRJRLoBKJmXNnpel2ogU6x
 TatrThX0ifL2IdFUoy3AmCl3554XKjjSFl21hGU8z6vLlOoF0OMfDVEarr8VuCD1bjgN
 0cNngH7VD/H5orhLVNOA3lR4jG+bn8j+racsSt8EK6h8BNqQ6EMixjJJhPLg5rz8gHL6
 cc5TxHflyiNH/pzRMbIQL3HTZl1FevR+7pzR34nYWoccE22yaqGnkiUS4LO29CM4h7PC
 lLXQ==
X-Gm-Message-State: AOAM532eLLtWKE1tj11gjOwi831nDzmuk7W9cAQahu1Xf9KZQjZtKb2O
 Jw5LhSjRdVSWy5vlMfXMLFesM15Jq6j8oxWe
X-Google-Smtp-Source: ABdhPJx9dElWIq9UvxRqCwEQdLmbly/MWeiPhJO6lHAmLiXviC7ZKe4MM/P0Qa7oVGUqQBRrK4gNpw==
X-Received: by 2002:a17:902:a982:b029:da:e252:78d8 with SMTP id
 bh2-20020a170902a982b02900dae25278d8mr3293407plb.16.1608049330080; 
 Tue, 15 Dec 2020 08:22:10 -0800 (PST)
Received: from localhost.localdomain ([139.177.225.246])
 by smtp.gmail.com with ESMTPSA id c10sm24273508pfo.159.2020.12.15.08.22.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Dec 2020 08:22:09 -0800 (PST)
From: Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>
To: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Xie Yongji <xieyongji@bytedance.com>
Subject: [RFC PATCH 8/9] virtiofsd: Ensure crash consistency after reconnection
Date: Wed, 16 Dec 2020 00:21:18 +0800
Message-Id: <20201215162119.27360-9-zhangjiachen.jaycee@bytedance.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201215162119.27360-1-zhangjiachen.jaycee@bytedance.com>
References: <20201215162119.27360-1-zhangjiachen.jaycee@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=zhangjiachen.jaycee@bytedance.com; helo=mail-pl1-x642.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: virtio-fs@redhat.com, Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now the lo_maps are linked lists based on continuous arrays which are
shared between QEMU and virtiofsd. Elem adding, removing, or lo_map
growing all involve multi-step updating of the shared memory region.

So we need to maintain the fault-atomicity (or crash-consistency) issue
of these operations.

We could choose to use a redo / undo logging to handle this, but it is
rather complex and might sequentialize the concurrent virtiofsd request
handling. Therefore we employ a more relaxed scheme, specifically:

    - Ensure code execution order of the codelines involving consistency.
      We adjust some execution order to make sure that the lo_maps can be
      normally used after reconnections.

    - Relax some error handling. For example, lo_link, lo_symlink, lo_mkdir
      and lo_mknod should reply success when errno of the underlying FS
      syscalls (such as linkat and mknodat) is EEXIST; lo_rmdir, lo_unlink
      and lo_rename should succeed (rather than EIO) when lookup_name returns
      ENOENT error.

Signed-off-by: Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>
Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
---
 tools/virtiofsd/fuse_lowlevel.c  |   3 +
 tools/virtiofsd/fuse_virtio.c    |  28 +++++++
 tools/virtiofsd/passthrough_ll.c | 123 +++++++++++++++++++++++--------
 3 files changed, 123 insertions(+), 31 deletions(-)

diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
index f3358561e2..ddd8667e16 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -2521,6 +2521,9 @@ void fuse_session_process_buf_int(struct fuse_session *se,
     if (in->opcode == FUSE_WRITE && se->op.write_buf) {
         do_write_buf(req, in->nodeid, &iter, bufv);
     } else {
+        if (in->opcode == FUSE_FORGET || in->opcode == FUSE_BATCH_FORGET) {
+            virtio_send_msg(req->se, req->ch, NULL, 0);
+        }
         fuse_ll_ops[in->opcode].func(req, in->nodeid, &iter);
     }
 
diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index 03b03ddacf..8e8e9f48f3 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -203,6 +203,30 @@ static void copy_iov(struct iovec *src_iov, int src_count,
     }
 }
 
+static int virtio_no_msg(struct fuse_session *se, struct fuse_chan *ch)
+{
+    FVRequest *req = container_of(ch, FVRequest, ch);
+    struct fv_QueueInfo *qi = ch->qi;
+    VuDev *dev = &se->virtio_dev->dev;
+    VuVirtq *q = vu_get_queue(dev, qi->qidx);
+    VuVirtqElement *elem = &req->elem;
+    int ret = 0;
+
+    fuse_log(FUSE_LOG_DEBUG, "%s: elem %d no reply sent\n", __func__,
+             elem->index);
+
+    pthread_rwlock_rdlock(&qi->virtio_dev->vu_dispatch_rwlock);
+    pthread_mutex_lock(&qi->vq_lock);
+    vu_queue_push(dev, q, elem, 0);
+    vu_queue_notify(dev, q);
+    pthread_mutex_unlock(&qi->vq_lock);
+    pthread_rwlock_unlock(&qi->virtio_dev->vu_dispatch_rwlock);
+
+    req->reply_sent = true;
+
+    return ret;
+}
+
 /*
  * Called back by ll whenever it wants to send a reply/message back
  * The 1st element of the iov starts with the fuse_out_header
@@ -218,6 +242,10 @@ int virtio_send_msg(struct fuse_session *se, struct fuse_chan *ch,
     VuVirtqElement *elem = &req->elem;
     int ret = 0;
 
+    if (iov == NULL && count == 0) {
+        return virtio_no_msg(se, ch);
+    }
+
     assert(count >= 1);
     assert(iov[0].iov_len >= sizeof(struct fuse_out_header));
 
diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 8fee635396..b5750ef179 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -462,17 +462,22 @@ static int lo_map_grow(map_t map_type, size_t new_nelems)
     }
     lo.maps[map_type]->elems[new_nelems - 1].freelist = -1;
 
-    lo.maps[map_type]->freelist = lo.maps[map_type]->nelems;
-    lo.maps[map_type]->nelems = new_nelems;
-
      if (lo.reconnect && lo.connected) {
         /* sync the lo_map growing with QEMU */
         uint64_t map_size = sizeof(struct lo_map) +
                                 sizeof(struct lo_map_elem) * new_nelems;
         vu_slave_send_shm(virtio_get_dev(se), lo.maps[map_type]->memfd,
                           map_size, map_type);
+        /*
+         * A compiler barrier to ensure map_size is sent to QEMU
+         * before we update lo.maps[map_type]->nelems.
+         */
+        barrier();
     }
 
+    lo.maps[map_type]->freelist = lo.maps[map_type]->nelems;
+    lo.maps[map_type]->nelems = new_nelems;
+
     return 1;
 }
 
@@ -554,11 +559,15 @@ static void lo_map_remove(struct lo_map *map, size_t key)
         return;
     }
 
+    /*
+     * Crash consistency: we first set refcount to -1 (not in use),
+     * to invalidate the slot immediately, that may only cause a waste
+     * of space when crashing, instead of inconsistency.
+     */
     g_atomic_int_set(&elem->refcount, -1);
 
     elem->freelist = map->freelist;
     map->freelist = key;
-
 }
 
 /* Assumes lo->mutex is held */
@@ -571,10 +580,6 @@ static ssize_t lo_add_fd_mapping(fuse_req_t req, int fd)
         return -1;
     }
 
-    g_atomic_int_set(&elem->refcount, 1);
-
-    elem->fd = fd;
-
     ssize_t fh = ((unsigned long)elem -
                  (unsigned long)lo_data(req)->maps[FD_MAP]->elems) /
                  sizeof(struct lo_map_elem);
@@ -585,6 +590,9 @@ static ssize_t lo_add_fd_mapping(fuse_req_t req, int fd)
         vu_slave_send_fd_add(virtio_get_dev(se), fd, key);
     }
 
+    g_atomic_int_set(&elem->refcount, 1);
+    elem->fd = fd;
+
     return ((unsigned long)elem -
             (unsigned long)lo_data(req)->maps[FD_MAP]->elems) /
             sizeof(struct lo_map_elem);
@@ -1039,27 +1047,27 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
         struct lo_map_elem *elem;
         pthread_mutex_lock(&lo->mutex);
         elem = lo_add_inode_mapping(req, inode);
-
-        /*
-         * One for the caller and one for nlookup (released in
-         * unref_inode_lolocked())
-         */
-        g_atomic_int_set(&elem->refcount, 2);
-
         free(inode);
         inode = &elem->inode;
         inode->fuse_ino = ((unsigned long)elem -
                         (unsigned long)lo_data(req)->maps[INO_MAP]->elems) /
                                                 sizeof(struct lo_map_elem);
 
-        g_hash_table_insert(lo->inodes, &inode->key, inode);
-        pthread_mutex_unlock(&lo->mutex);
 
         if (lo->reconnect) {
             /* Send the newly opened fd to QEMU */
             int key = inode->fuse_ino << MAP_TYPE_SHIFT | INO_MAP;
             vu_slave_send_fd_add(virtio_get_dev(se), newfd, key);
         }
+
+        /*
+         * One for the caller and one for nlookup (released in
+         * unref_inode_lolocked())
+         */
+        g_atomic_int_set(&elem->refcount, 2);
+
+        g_hash_table_insert(lo->inodes, &inode->key, inode);
+        pthread_mutex_unlock(&lo->mutex);
     }
     e->ino = inode->fuse_ino;
     lo_inode_put(lo, inode);
@@ -1202,7 +1210,9 @@ static void lo_mknod_symlink(fuse_req_t req, fuse_ino_t parent,
     lo_restore_cred(&old);
 
     if (res == -1) {
-        goto out;
+        if (!(errno == EEXIST && lo->reconnect)) {
+            goto out;
+        }
     }
 
     saverr = lo_do_lookup(req, parent, name, &e);
@@ -1272,7 +1282,9 @@ static void lo_link(fuse_req_t req, fuse_ino_t ino, fuse_ino_t parent,
                  AT_SYMLINK_FOLLOW);
 
     if (res == -1) {
-        goto out_err;
+        if (!(errno == EEXIST && lo->reconnect)) {
+            goto out_err;
+        }
     }
 
     res = fstatat(inode->fd, "", &e.attr, AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW);
@@ -1337,13 +1349,22 @@ static void lo_rmdir(fuse_req_t req, fuse_ino_t parent, const char *name)
 
     inode = lookup_name(req, parent, name);
     if (!inode) {
-        fuse_reply_err(req, EIO);
-        return;
+        if (lo->reconnect && errno == ENOENT) {
+            /*
+             * Because we crashed in this function, so do not perform unlink and
+             * reply 0 to complete this request.
+             */
+            fuse_reply_err(req, 0);
+        } else {
+            fuse_reply_err(req, EIO);
+        }
+        goto out;
     }
 
     res = unlinkat(lo_fd(req, parent), name, AT_REMOVEDIR);
 
     fuse_reply_err(req, res == -1 ? errno : 0);
+out:
     unref_inode_lolocked(lo, inode, 1);
     lo_inode_put(lo, inode);
 }
@@ -1371,11 +1392,19 @@ static void lo_rename(fuse_req_t req, fuse_ino_t parent, const char *name,
         goto out;
     }
 
-    oldinode = lookup_name(req, parent, name);
     newinode = lookup_name(req, newparent, newname);
+    oldinode = lookup_name(req, parent, name);
 
     if (!oldinode) {
-        fuse_reply_err(req, EIO);
+        if (lo->reconnect && errno == ENOENT) {
+            /*
+             * Because we crashed in this function, so do not perform unlink and
+             * reply 0 to complete this request.
+             */
+            fuse_reply_err(req, 0);
+        } else {
+            fuse_reply_err(req, EIO);
+        }
         goto out;
     }
 
@@ -1419,13 +1448,22 @@ static void lo_unlink(fuse_req_t req, fuse_ino_t parent, const char *name)
 
     inode = lookup_name(req, parent, name);
     if (!inode) {
-        fuse_reply_err(req, EIO);
-        return;
+        if (lo->reconnect && errno == ENOENT) {
+            /*
+             * Because we crashed in this function, so do not perform unlink and
+             * reply 0 to complete this request.
+             */
+            fuse_reply_err(req, 0);
+        } else {
+            fuse_reply_err(req, EIO);
+        }
+        goto out;
     }
 
     res = unlinkat(lo_fd(req, parent), name, 0);
 
     fuse_reply_err(req, res == -1 ? errno : 0);
+out:
     unref_inode_lolocked(lo, inode, 1);
     lo_inode_put(lo, inode);
 }
@@ -1599,8 +1637,6 @@ static void lo_opendir(fuse_req_t req, fuse_ino_t ino,
     if (lo->cache == CACHE_ALWAYS) {
         fi->cache_readdir = 1;
     }
-    g_atomic_int_set(&elem->refcount, 1); /* paired with lo_releasedir() */
-    pthread_mutex_unlock(&lo->mutex);
 
     if (lo->reconnect) {
         /* Send the newly opened fd to QEMU */
@@ -1608,7 +1644,10 @@ static void lo_opendir(fuse_req_t req, fuse_ino_t ino,
         vu_slave_send_fd_add(virtio_get_dev(se), fd, key);
     }
 
+    g_atomic_int_set(&elem->refcount, 1); /* paired with lo_releasedir() */
+    pthread_mutex_unlock(&lo->mutex);
     fuse_reply_open(req, fi);
+
     return;
 
 out_errno:
@@ -1768,9 +1807,15 @@ static void lo_releasedir(fuse_req_t req, fuse_ino_t ino,
     d = &elem->dirp;
     pthread_mutex_unlock(&lo->mutex);
 
-    lo_dirp_put(d, fi->fh); /* paired with lo_opendir() */
-
+    /*
+     * Reply the request before releasing the lo_map slot. Because the
+     * fi->fh slot may be re-allocated to a valid elem right after the slot
+     * is released, reply after releaseing may cause double-removing after
+     * reconnection, and the valid elem may be mistakenly removed.
+     */
     fuse_reply_err(req, 0);
+
+    lo_dirp_put(d, fi->fh); /* paired with lo_opendir() */
 }
 
 static void update_open_flags(int writeback, int allow_direct_io,
@@ -2084,11 +2129,14 @@ static void lo_release(fuse_req_t req, fuse_ino_t ino,
     pthread_mutex_lock(&lo->mutex);
     elem = lo_map_get(lo->maps[FD_MAP], fi->fh);
     if (elem) {
+        /*
+         * Reply the request before releasing the lo_map slot. Because similar
+         * with the lo_releasedir case, we want to avoid false double-removing.
+         */
+        fuse_reply_err(req, 0);
         lo_map_remove(lo->maps[FD_MAP], fi->fh);
     }
     pthread_mutex_unlock(&lo->mutex);
-
-    fuse_reply_err(req, 0);
 }
 
 static void lo_flush(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi)
@@ -3159,6 +3207,19 @@ static bool vu_set_fs_map(VuDev *dev, VhostUserMsg *vmsg)
                                                         tmp_memfd, 0);
     lo.maps[map_type]->memfd = tmp_memfd;
 
+    /*
+     * Crash consistency: Check if virtiofsd is crashed in an inconsistent
+     * status when growing, and fix it when needed.
+     */
+    cur_map_size = sizeof(struct lo_map) +
+                        sizeof(struct lo_map_elem) * lo.maps[map_type]->nelems;
+    if (cur_map_size != vmsg->payload.shm.size) {
+        size_t new_nelems = (vmsg->payload.shm.size - cur_map_size) /
+                                                    sizeof(struct lo_map_elem);
+        lo_map_grow(map_type, lo.maps[map_type]->nelems + new_nelems);
+
+    }
+
     return false;
 }
 
-- 
2.20.1


