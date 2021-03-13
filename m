Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75551339F37
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 17:50:04 +0100 (CET)
Received: from localhost ([::1]:46064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL7Sl-00037Y-F1
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 11:50:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lL7HR-0002cw-Ti
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 11:38:21 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:44163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lL7HN-0007NW-BT
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 11:38:21 -0500
Received: by mail-wr1-x42b.google.com with SMTP id o14so2647721wrm.11
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 08:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mktypJvu/1F6oyY228R0OtNNmqjKKSzXTpTB6Y2kEiY=;
 b=LRVezUWwkD//9War1RbONH8jWzRpq2xti47gZZX1R26CxwHolq8xlM9v6Jbt/2J2uI
 8nSFTFGtmcdLlgFkh5cakh5qqnRTl+wWQwfYUkqxqKlBkgXgZgsKs65D/dfp3R+UDSsL
 rbmCLbONtmtDzeqiCTF6RFgtZOVxIXEpaSoeBr+whP+vjfD5hGixz+snsLPGxEJ8PLxo
 U1TLvPGd4nDZikY2sv/C6L++PS7TIwhfFMFNjXvSP7+aeRhC/ev+Tr596K0mIz3zrqya
 MAKvbKR5jSs6pFOa58TXPKP9Nznlo6Y0ZZi3NaNOcFGZP0LZyYWC41ECdtt8olsRljC7
 GZcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mktypJvu/1F6oyY228R0OtNNmqjKKSzXTpTB6Y2kEiY=;
 b=G+gxSYMpvmuCns67iYitkr4wl58J8IwFgZnpWr3kTBhbwpNdHKNWchrYIQwNtXRALV
 eZoMjhxJIm2BPbVl9tR7KNcfMbTTS9b8m9NmomkRDEJFVZBzvVzoM0HxKpobEVi+iy00
 rR+4KNRMCJfoO0LXHEu5b+x8rCbxvmPs6AcYThdX/OlP7sIG/NGkgQm3dQU2wfcYfH2Q
 H7SMDoujk4d3y4dtOFmZa8cEYQCrSX8kOpGyFkko8a+RhWS5z1XNPlL3ePHeTHj8XbSF
 BYXWaYnyq3rbIe6y6HcIx4wSd13cwoAqVwB2v09mr4NBBcHO0AxmFhCTvH3jIOhm72QW
 BuXg==
X-Gm-Message-State: AOAM532TMF7/AS5Kb9puHMrMGLbSoTC3uvqqzLHWS3U9s1wQPJNzcNK9
 3qq8RFXf4eThsfJgWCQUh1+EYsN/guQ=
X-Google-Smtp-Source: ABdhPJx5noi/B54EU76sZt0MYK0Zu1w6LhvOAtqG+DRe/kO7D6Q4PtxdIbbSony2EYOfLZcWHyl7kg==
X-Received: by 2002:a5d:6684:: with SMTP id l4mr19570945wru.381.1615653494995; 
 Sat, 13 Mar 2021 08:38:14 -0800 (PST)
Received: from localhost.localdomain ([197.61.164.30])
 by smtp.googlemail.com with ESMTPSA id n6sm13173441wrt.1.2021.03.13.08.38.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 08:38:14 -0800 (PST)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 9/9] tools/virtiofsd: Replacing malloc-like calls with GLib's
 variants
Date: Sat, 13 Mar 2021 18:36:53 +0200
Message-Id: <20210313163653.37089-10-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210313163653.37089-1-ma.mandourr@gmail.com>
References: <20210313163653.37089-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changed calls to malloc(), calloc(), and realloc() with their
equivalent allocation functions in GLib, and replaced their
respective free() calls with g_free().

Allocation and deallocation of fuse_req structs, fuse_pollhandle
structs, fuse_session structs and many local variables are now
established through GLib's functions.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 tools/virtiofsd/fuse_lowlevel.c  | 30 ++++++++++++++--------------
 tools/virtiofsd/fuse_virtio.c    | 34 ++++++++++++++++----------------
 tools/virtiofsd/passthrough_ll.c | 32 +++++++++++++++---------------
 3 files changed, 48 insertions(+), 48 deletions(-)

diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
index 1aa26c6333..5e188f8d8f 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -106,7 +106,7 @@ static void list_add_req(struct fuse_req *req, struct fuse_req *next)
 static void destroy_req(fuse_req_t req)
 {
     pthread_mutex_destroy(&req->lock);
-    free(req);
+    g_free(req);
 }
 
 void fuse_free_req(fuse_req_t req)
@@ -130,7 +130,7 @@ static struct fuse_req *fuse_ll_alloc_req(struct fuse_session *se)
 {
     struct fuse_req *req;
 
-    req = (struct fuse_req *)calloc(1, sizeof(struct fuse_req));
+    req = g_try_new(struct fuse_req, 1);
     if (req == NULL) {
         fuse_log(FUSE_LOG_ERR, "fuse: failed to allocate request\n");
     } else {
@@ -219,7 +219,7 @@ int fuse_reply_iov(fuse_req_t req, const struct iovec *iov, int count)
     int res;
     struct iovec *padded_iov;
 
-    padded_iov = malloc((count + 1) * sizeof(struct iovec));
+    padded_iov = g_try_new(struct iovec, count + 1);
     if (padded_iov == NULL) {
         return fuse_reply_err(req, ENOMEM);
     }
@@ -228,7 +228,7 @@ int fuse_reply_iov(fuse_req_t req, const struct iovec *iov, int count)
     count++;
 
     res = send_reply_iov(req, 0, padded_iov, count);
-    free(padded_iov);
+    g_free(padded_iov);
 
     return res;
 }
@@ -568,7 +568,7 @@ static struct fuse_ioctl_iovec *fuse_ioctl_iovec_copy(const struct iovec *iov,
     struct fuse_ioctl_iovec *fiov;
     size_t i;
 
-    fiov = malloc(sizeof(fiov[0]) * count);
+    fiov = g_try_new(struct fuse_ioctl_iovec, count);
     if (!fiov) {
         return NULL;
     }
@@ -629,8 +629,8 @@ int fuse_reply_ioctl_retry(fuse_req_t req, const struct iovec *in_iov,
 
     res = send_reply_iov(req, 0, iov, count);
 out:
-    free(in_fiov);
-    free(out_fiov);
+    g_free(in_fiov);
+    g_free(out_fiov);
 
     return res;
 
@@ -667,7 +667,7 @@ int fuse_reply_ioctl_iov(fuse_req_t req, int result, const struct iovec *iov,
     struct fuse_ioctl_out arg;
     int res;
 
-    padded_iov = malloc((count + 2) * sizeof(struct iovec));
+    padded_iov = g_try_new(struct iovec, count + 2);
     if (padded_iov == NULL) {
         return fuse_reply_err(req, ENOMEM);
     }
@@ -680,7 +680,7 @@ int fuse_reply_ioctl_iov(fuse_req_t req, int result, const struct iovec *iov,
     memcpy(&padded_iov[2], iov, count * sizeof(struct iovec));
 
     res = send_reply_iov(req, 0, padded_iov, count + 2);
-    free(padded_iov);
+    g_free(padded_iov);
 
     return res;
 }
@@ -1684,7 +1684,7 @@ static struct fuse_req *check_interrupt(struct fuse_session *se,
         if (curr->u.i.unique == req->unique) {
             req->interrupted = 1;
             list_del_req(curr);
-            free(curr);
+            g_free(curr);
             return NULL;
         }
     }
@@ -1760,7 +1760,7 @@ static void do_ioctl(fuse_req_t req, fuse_ino_t nodeid,
 
 void fuse_pollhandle_destroy(struct fuse_pollhandle *ph)
 {
-    free(ph);
+    g_free(ph);
 }
 
 static void do_poll(fuse_req_t req, fuse_ino_t nodeid,
@@ -1783,7 +1783,7 @@ static void do_poll(fuse_req_t req, fuse_ino_t nodeid,
         struct fuse_pollhandle *ph = NULL;
 
         if (arg->flags & FUSE_POLL_SCHEDULE_NOTIFY) {
-            ph = malloc(sizeof(struct fuse_pollhandle));
+            ph = g_try_new(struct fuse_pollhandle, 1);
             if (ph == NULL) {
                 fuse_reply_err(req, ENOMEM);
                 return;
@@ -2476,7 +2476,7 @@ void fuse_session_destroy(struct fuse_session *se)
     free(se->vu_socket_path);
     se->vu_socket_path = NULL;
 
-    free(se);
+    g_free(se);
 }
 
 
@@ -2499,7 +2499,7 @@ struct fuse_session *fuse_session_new(struct fuse_args *args,
         return NULL;
     }
 
-    se = (struct fuse_session *)calloc(1, sizeof(struct fuse_session));
+    se = g_try_new0(struct fuse_session, 1);
     if (se == NULL) {
         fuse_log(FUSE_LOG_ERR, "fuse: failed to allocate fuse object\n");
         goto out1;
@@ -2559,7 +2559,7 @@ struct fuse_session *fuse_session_new(struct fuse_args *args,
 out4:
     fuse_opt_free_args(args);
 out2:
-    free(se);
+    g_free(se);
 out1:
     return NULL;
 }
diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index 523ee64fb7..598c97db1f 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -347,7 +347,7 @@ int virtio_send_data_iov(struct fuse_session *se, struct fuse_chan *ch,
      * Build a copy of the the in_sg iov so we can skip bits in it,
      * including changing the offsets
      */
-    struct iovec *in_sg_cpy = calloc(sizeof(struct iovec), in_num);
+    struct iovec *in_sg_cpy = g_try_new0(struct iovec, in_num);
     assert(in_sg_cpy);
     memcpy(in_sg_cpy, in_sg, sizeof(struct iovec) * in_num);
     /* These get updated as we skip */
@@ -386,7 +386,7 @@ int virtio_send_data_iov(struct fuse_session *se, struct fuse_chan *ch,
             ret = errno;
             fuse_log(FUSE_LOG_DEBUG, "%s: preadv failed (%m) len=%zd\n",
                      __func__, len);
-            free(in_sg_cpy);
+            g_free(in_sg_cpy);
             goto err;
         }
         fuse_log(FUSE_LOG_DEBUG, "%s: preadv ret=%d len=%zd\n", __func__,
@@ -410,13 +410,13 @@ int virtio_send_data_iov(struct fuse_session *se, struct fuse_chan *ch,
         if (ret != len) {
             fuse_log(FUSE_LOG_DEBUG, "%s: ret!=len\n", __func__);
             ret = EIO;
-            free(in_sg_cpy);
+            g_free(in_sg_cpy);
             goto err;
         }
         in_sg_left -= ret;
         len -= ret;
     } while (in_sg_left);
-    free(in_sg_cpy);
+    g_free(in_sg_cpy);
 
     /* Need to fix out->len on EOF */
     if (len) {
@@ -476,7 +476,7 @@ static void fv_queue_worker(gpointer data, gpointer user_data)
      * They're spread over multiple descriptors in a scatter/gather set
      * and we can't trust the guest to keep them still; so copy in/out.
      */
-    fbuf.mem = malloc(se->bufsize);
+    fbuf.mem = g_try_malloc(se->bufsize);
     assert(fbuf.mem);
 
     fuse_mutex_init(&req->ch.lock);
@@ -528,10 +528,10 @@ static void fv_queue_worker(gpointer data, gpointer user_data)
         fbuf.size = out_sg[0].iov_len + out_sg[1].iov_len;
 
         /* Allocate the bufv, with space for the rest of the iov */
-        pbufv = malloc(sizeof(struct fuse_bufvec) +
+        pbufv = g_try_malloc(sizeof(struct fuse_bufvec) +
                        sizeof(struct fuse_buf) * (out_num - 2));
         if (!pbufv) {
-            fuse_log(FUSE_LOG_ERR, "%s: pbufv malloc failed\n",
+            fuse_log(FUSE_LOG_ERR, "%s: pbufv g_try_malloc failed\n",
                     __func__);
             goto out;
         }
@@ -573,7 +573,7 @@ static void fv_queue_worker(gpointer data, gpointer user_data)
 
 out:
     if (allocated_bufv) {
-        free(pbufv);
+        g_free(pbufv);
     }
 
     /* If the request has no reply, still recycle the virtqueue element */
@@ -592,8 +592,8 @@ out:
     }
 
     pthread_mutex_destroy(&req->ch.lock);
-    free(fbuf.mem);
-    free(req);
+    g_free(fbuf.mem);
+    g_free(req);
 }
 
 /* Thread function for individual queues, created when a queue is 'started' */
@@ -733,7 +733,7 @@ static void fv_queue_cleanup_thread(struct fv_VuDev *vud, int qidx)
     pthread_mutex_destroy(&ourqi->vq_lock);
     close(ourqi->kill_fd);
     ourqi->kick_fd = -1;
-    free(vud->qi[qidx]);
+    g_free(vud->qi[qidx]);
     vud->qi[qidx] = NULL;
 }
 
@@ -764,14 +764,14 @@ static void fv_queue_set_started(VuDev *dev, int qidx, bool started)
     if (started) {
         /* Fire up a thread to watch this queue */
         if (qidx >= vud->nqueues) {
-            vud->qi = realloc(vud->qi, (qidx + 1) * sizeof(vud->qi[0]));
+            vud->qi = g_try_realloc_n(vud->qi, (qidx + 1), sizeof(vud->qi[0]));
             assert(vud->qi);
             memset(vud->qi + vud->nqueues, 0,
                    sizeof(vud->qi[0]) * (1 + (qidx - vud->nqueues)));
             vud->nqueues = qidx + 1;
         }
         if (!vud->qi[qidx]) {
-            vud->qi[qidx] = calloc(sizeof(struct fv_QueueInfo), 1);
+            vud->qi[qidx] = g_try_new0(struct fv_QueueInfo, 1);
             assert(vud->qi[qidx]);
             vud->qi[qidx]->virtio_dev = vud;
             vud->qi[qidx]->qidx = qidx;
@@ -1032,9 +1032,9 @@ int virtio_session_mount(struct fuse_session *se)
              __func__);
 
     /* TODO: Some cleanup/deallocation! */
-    se->virtio_dev = calloc(sizeof(struct fv_VuDev), 1);
+    se->virtio_dev = g_try_new0(struct fv_VuDev, 1);
     if (!se->virtio_dev) {
-        fuse_log(FUSE_LOG_ERR, "%s: virtio_dev calloc failed\n", __func__);
+        fuse_log(FUSE_LOG_ERR, "%s: virtio_dev g_try_new0 failed\n", __func__);
         close(data_sock);
         return -1;
     }
@@ -1059,8 +1059,8 @@ void virtio_session_close(struct fuse_session *se)
         return;
     }
 
-    free(se->virtio_dev->qi);
+    g_free(se->virtio_dev->qi);
     pthread_rwlock_destroy(&se->virtio_dev->vu_dispatch_rwlock);
-    free(se->virtio_dev);
+    g_free(se->virtio_dev);
     se->virtio_dev = NULL;
 }
diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index fc7e1b1e8e..5c475a30af 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -399,7 +399,7 @@ static void lo_map_init(struct lo_map *map)
 
 static void lo_map_destroy(struct lo_map *map)
 {
-    free(map->elems);
+    g_free(map->elems);
 }
 
 static int lo_map_grow(struct lo_map *map, size_t new_nelems)
@@ -411,7 +411,7 @@ static int lo_map_grow(struct lo_map *map, size_t new_nelems)
         return 1;
     }
 
-    new_elems = realloc(map->elems, sizeof(map->elems[0]) * new_nelems);
+    new_elems = g_realloc_n(map->elems, new_nelems, sizeof(map->elems[0]));
     if (!new_elems) {
         return 0;
     }
@@ -549,7 +549,7 @@ static void lo_inode_put(struct lo_data *lo, struct lo_inode **inodep)
 
     if (g_atomic_int_dec_and_test(&inode->refcount)) {
         close(inode->fd);
-        free(inode);
+        g_free(inode);
     }
 }
 
@@ -904,7 +904,7 @@ static void posix_locks_value_destroy(gpointer data)
      * closing this fd should release all OFD locks.
      */
     close(plock->fd);
-    free(plock);
+    g_free(plock);
 }
 
 static int do_statx(struct lo_data *lo, int dirfd, const char *pathname,
@@ -1020,7 +1020,7 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
     if (inode) {
         close(newfd);
     } else {
-        inode = calloc(1, sizeof(struct lo_inode));
+        inode = g_try_new0(struct lo_inode, 1);
         if (!inode) {
             goto out_err;
         }
@@ -1532,7 +1532,7 @@ static void lo_dirp_put(struct lo_dirp **dp)
 
     if (g_atomic_int_dec_and_test(&d->refcount)) {
         closedir(d->dp);
-        free(d);
+        g_free(d);
     }
 }
 
@@ -1564,7 +1564,7 @@ static void lo_opendir(fuse_req_t req, fuse_ino_t ino,
     int fd;
     ssize_t fh;
 
-    d = calloc(1, sizeof(struct lo_dirp));
+    d = g_try_new0(struct lo_dirp, 1);
     if (d == NULL) {
         goto out_err;
     }
@@ -1606,7 +1606,7 @@ out_err:
         } else if (fd != -1) {
             close(fd);
         }
-        free(d);
+        g_free(d);
     }
     fuse_reply_err(req, error);
 }
@@ -1633,7 +1633,7 @@ static void lo_do_readdir(fuse_req_t req, fuse_ino_t ino, size_t size,
     }
 
     err = ENOMEM;
-    buf = calloc(1, size);
+    buf = g_try_malloc0(size);
     if (!buf) {
         goto error;
     }
@@ -1719,7 +1719,7 @@ error:
     } else {
         fuse_reply_buf(req, buf, size - rem);
     }
-    free(buf);
+    g_free(buf);
 }
 
 static void lo_readdir(fuse_req_t req, fuse_ino_t ino, size_t size,
@@ -1943,7 +1943,7 @@ static struct lo_inode_plock *lookup_create_plock_ctx(struct lo_data *lo,
         return plock;
     }
 
-    plock = malloc(sizeof(struct lo_inode_plock));
+    plock = g_try_new(struct lo_inode_plock, 1);
     if (!plock) {
         *err = ENOMEM;
         return NULL;
@@ -1954,7 +1954,7 @@ static struct lo_inode_plock *lookup_create_plock_ctx(struct lo_data *lo,
     fd = lo_inode_open(lo, inode, O_RDWR);
     if (fd < 0) {
         *err = -fd;
-        free(plock);
+        g_free(plock);
         return NULL;
     }
 
@@ -2731,7 +2731,7 @@ static void lo_getxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
              ino, name, size);
 
     if (size) {
-        value = malloc(size);
+        value = g_try_malloc(size);
         if (!value) {
             goto out_err;
         }
@@ -2770,7 +2770,7 @@ static void lo_getxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
         fuse_reply_xattr(req, ret);
     }
 out_free:
-    free(value);
+    g_free(value);
 
     if (fd >= 0) {
         close(fd);
@@ -2812,7 +2812,7 @@ static void lo_listxattr(fuse_req_t req, fuse_ino_t ino, size_t size)
              size);
 
     if (size) {
-        value = malloc(size);
+        value = g_try_malloc(size);
         if (!value) {
             goto out_err;
         }
@@ -2897,7 +2897,7 @@ static void lo_listxattr(fuse_req_t req, fuse_ino_t ino, size_t size)
         fuse_reply_xattr(req, ret);
     }
 out_free:
-    free(value);
+    g_free(value);
 
     if (fd >= 0) {
         close(fd);
-- 
2.25.1


