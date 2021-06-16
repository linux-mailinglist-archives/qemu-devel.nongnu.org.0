Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D42173AA582
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 22:44:06 +0200 (CEST)
Received: from localhost ([::1]:52300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltcOL-0007oM-Ri
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 16:44:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iangelak@redhat.com>)
 id 1ltbOh-00035o-LL
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 15:40:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iangelak@redhat.com>)
 id 1ltbOd-0000fA-Ka
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 15:40:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623872409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SH9aHa4y7IKWCLMThg+01m769L9XohG50OjHZwT3zpk=;
 b=KVIAQC2zmTpCoG7TyqDIfdMt6x3bNTaD2iEhrXRbet4AulUV5qQ29rm6bi7UpEp91E56Nr
 nV5AQyC9xvpgLo9PF+MqXJMHM4f5Er90lU30Cw21t63FAHjj3rJH7vI8k9ndPX6Hb93LML
 o0ouEHBGshfT7mhFEhzxVIu3ZIQA7yk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-5ogt5sKgPFiuwfx1_029YQ-1; Wed, 16 Jun 2021 15:40:08 -0400
X-MC-Unique: 5ogt5sKgPFiuwfx1_029YQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 545779F92C
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 19:40:07 +0000 (UTC)
Received: from iangelak.remote.csb (ovpn-113-44.rdu2.redhat.com [10.10.113.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9980360BF1;
 Wed, 16 Jun 2021 19:40:06 +0000 (UTC)
From: Ioannis Angelakopoulos <iangelak@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH 4/6] virtiofsd: Implement blocking posix locks
Date: Wed, 16 Jun 2021 15:39:19 -0400
Message-Id: <20210616193921.608720-5-iangelak@redhat.com>
In-Reply-To: <20210616193921.608720-1-iangelak@redhat.com>
References: <20210616193921.608720-1-iangelak@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=iangelak@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=iangelak@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 16 Jun 2021 16:41:47 -0400
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
Cc: iangelak@redhat.com, stefanha@redhat.com, dgilbert@redhat.com,
 vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vivek Goyal <vgoyal@redhat.com>

As of now we don't support fcntl(F_SETLKW) and if we see one, we return
-EOPNOTSUPP.

Change that by accepting these requests and returning a reply
immediately asking caller to wait. Once lock is available, send a
notification to the waiter indicating lock is available.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
Signed-off-by: Ioannis Angelakopoulos <iangelak@redhat.com>
---
 include/standard-headers/linux/fuse.h |   8 ++
 tools/virtiofsd/fuse_lowlevel.c       |  38 +++++++++-
 tools/virtiofsd/fuse_lowlevel.h       |  26 +++++++
 tools/virtiofsd/fuse_virtio.c         | 101 ++++++++++++++++++++++++--
 tools/virtiofsd/passthrough_ll.c      |  59 ++++++++++-----
 5 files changed, 207 insertions(+), 25 deletions(-)

diff --git a/include/standard-headers/linux/fuse.h b/include/standard-headers/linux/fuse.h
index 950d7edb7e..4680efc531 100644
--- a/include/standard-headers/linux/fuse.h
+++ b/include/standard-headers/linux/fuse.h
@@ -511,6 +511,7 @@ enum fuse_notify_code {
 	FUSE_NOTIFY_STORE = 4,
 	FUSE_NOTIFY_RETRIEVE = 5,
 	FUSE_NOTIFY_DELETE = 6,
+        FUSE_NOTIFY_LOCK = 7,
 	FUSE_NOTIFY_CODE_MAX,
 };
 
@@ -898,6 +899,13 @@ struct fuse_notify_retrieve_in {
 	uint64_t	dummy4;
 };
 
+struct fuse_notify_lock_out {
+	uint64_t	unique;
+	int32_t		error;
+	int32_t		padding;
+};
+
+
 /* Device ioctls: */
 #define FUSE_DEV_IOC_CLONE	_IOR(229, 0, uint32_t)
 
diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
index 7fe2cef1eb..4b03ec2f9f 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -179,8 +179,8 @@ int fuse_send_reply_iov_nofree(fuse_req_t req, int error, struct iovec *iov,
         .unique = req->unique,
         .error = error,
     };
-
-    if (error <= -1000 || error > 0) {
+    /* error = 1 has been used to signal client to wait for notificaiton */
+    if (error <= -1000 || error > 1) {
         fuse_log(FUSE_LOG_ERR, "fuse: bad error value: %i\n", error);
         out.error = -ERANGE;
     }
@@ -290,6 +290,12 @@ int fuse_reply_err(fuse_req_t req, int err)
     return send_reply(req, -err, NULL, 0);
 }
 
+int fuse_reply_wait(fuse_req_t req)
+{
+    /* TODO: This is a hack. Fix it */
+    return send_reply(req, 1, NULL, 0);
+}
+
 void fuse_reply_none(fuse_req_t req)
 {
     fuse_free_req(req);
@@ -2145,6 +2151,34 @@ static void do_destroy(fuse_req_t req, fuse_ino_t nodeid,
     send_reply_ok(req, NULL, 0);
 }
 
+static int send_notify_iov(struct fuse_session *se, int notify_code,
+                           struct iovec *iov, int count)
+{
+    struct fuse_out_header out;
+    if (!se->got_init) {
+        return -ENOTCONN;
+    }
+    out.unique = 0;
+    out.error = notify_code;
+    iov[0].iov_base = &out;
+    iov[0].iov_len = sizeof(struct fuse_out_header);
+    return fuse_send_msg(se, NULL, iov, count);
+}
+
+int fuse_lowlevel_notify_lock(struct fuse_session *se, uint64_t unique,
+                  int32_t error)
+{
+    struct fuse_notify_lock_out outarg = {0};
+    struct iovec iov[2];
+
+    outarg.unique = unique;
+    outarg.error = -error;
+
+    iov[1].iov_base = &outarg;
+    iov[1].iov_len = sizeof(outarg);
+    return send_notify_iov(se, FUSE_NOTIFY_LOCK, iov, 2);
+}
+
 int fuse_lowlevel_notify_store(struct fuse_session *se, fuse_ino_t ino,
                                off_t offset, struct fuse_bufvec *bufv)
 {
diff --git a/tools/virtiofsd/fuse_lowlevel.h b/tools/virtiofsd/fuse_lowlevel.h
index 3bf786b034..1e8b3d2c35 100644
--- a/tools/virtiofsd/fuse_lowlevel.h
+++ b/tools/virtiofsd/fuse_lowlevel.h
@@ -1250,6 +1250,22 @@ struct fuse_lowlevel_ops {
  */
 int fuse_reply_err(fuse_req_t req, int err);
 
+/**
+ * Ask caller to wait for lock.
+ *
+ * Possible requests:
+ *   setlkw
+ *
+ * If caller sends a blocking lock request (setlkw), then reply to caller
+ * that wait for lock to be available. Once lock is available caller will
+ * receive a notification with request's unique id. Notification will
+ * carry info whether lock was successfully obtained or not.
+ *
+ * @param req request handle
+ * @return zero for success, -errno for failure to send reply
+ */
+int fuse_reply_wait(fuse_req_t req);
+
 /**
  * Don't send reply
  *
@@ -1684,6 +1700,16 @@ int fuse_lowlevel_notify_delete(struct fuse_session *se, fuse_ino_t parent,
 int fuse_lowlevel_notify_store(struct fuse_session *se, fuse_ino_t ino,
                                off_t offset, struct fuse_bufvec *bufv);
 
+/**
+ * Notify event related to previous lock request
+ *
+ * @param se the session object
+ * @param unique the unique id of the request which requested setlkw
+ * @param error zero for success, -errno for the failure
+ */
+int fuse_lowlevel_notify_lock(struct fuse_session *se, uint64_t unique,
+                              int32_t error);
+
 /*
  * Utility functions
  */
diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index f16801bbee..cb4dbafd91 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -233,6 +233,86 @@ static void copy_iov(struct iovec *src_iov, int src_count,
     }
 }
 
+static int virtio_send_notify_msg(struct fuse_session *se, struct iovec *iov,
+                                  int count)
+{
+    struct fv_QueueInfo *qi;
+    VuDev *dev = &se->virtio_dev->dev;
+    VuVirtq *q;
+    FVRequest *req;
+    VuVirtqElement *elem;
+    unsigned int in_num;
+    struct fuse_out_header *out = iov[0].iov_base;
+    size_t in_len, tosend_len = iov_size(iov, count);
+    struct iovec *in_sg;
+    int ret = 0;
+
+    /* Notifications have unique == 0 */
+    assert(!out->unique);
+
+    if (!se->notify_enabled) {
+        return -EOPNOTSUPP;
+    }
+
+    /* If notifications are enabled, queue index 1 is notification queue */
+    qi = se->virtio_dev->qi[1];
+    q = vu_get_queue(dev, qi->qidx);
+
+    pthread_rwlock_rdlock(&qi->virtio_dev->vu_dispatch_rwlock);
+    pthread_mutex_lock(&qi->vq_lock);
+    /* Pop an element from queue */
+    req = vu_queue_pop(dev, q, sizeof(FVRequest));
+    if (!req) {
+        /*
+         * TODO: Implement some sort of ring buffer and queue notifications
+         * on that and send these later when notification queue has space
+         * available.
+         */
+        ret = -ENOSPC;
+    }
+    pthread_mutex_unlock(&qi->vq_lock);
+    pthread_rwlock_unlock(&qi->virtio_dev->vu_dispatch_rwlock);
+
+    if (ret) {
+        return ret;
+    }
+
+    out->len = tosend_len;
+    elem = &req->elem;
+    in_num = elem->in_num;
+    in_sg = elem->in_sg;
+    in_len = iov_size(in_sg, in_num);
+    fuse_log(FUSE_LOG_DEBUG, "%s: elem %d: with %d in desc of length %zd\n",
+             __func__, elem->index, in_num,  in_len);
+
+    if (in_len < sizeof(struct fuse_out_header)) {
+        fuse_log(FUSE_LOG_ERR, "%s: elem %d too short for out_header\n",
+                 __func__, elem->index);
+        ret = -E2BIG;
+        goto out;
+    }
+
+    if (in_len < tosend_len) {
+        fuse_log(FUSE_LOG_ERR, "%s: elem %d too small for data len"
+                 " %zd\n", __func__, elem->index, tosend_len);
+        ret = -E2BIG;
+        goto out;
+    }
+
+    /* First copy the header data from iov->in_sg */
+    copy_iov(iov, count, in_sg, in_num, tosend_len);
+
+    pthread_rwlock_rdlock(&qi->virtio_dev->vu_dispatch_rwlock);
+    pthread_mutex_lock(&qi->vq_lock);
+    vu_queue_push(dev, q, elem, tosend_len);
+    vu_queue_notify(dev, q);
+    pthread_mutex_unlock(&qi->vq_lock);
+    pthread_rwlock_unlock(&qi->virtio_dev->vu_dispatch_rwlock);
+out:
+    free(req);
+    return ret;
+}
+
 /*
  * pthread_rwlock_rdlock() and pthread_rwlock_wrlock can fail if
  * a deadlock condition is detected or the current thread already
@@ -266,11 +346,11 @@ static void vu_dispatch_unlock(struct fv_VuDev *vud)
 int virtio_send_msg(struct fuse_session *se, struct fuse_chan *ch,
                     struct iovec *iov, int count)
 {
-    FVRequest *req = container_of(ch, FVRequest, ch);
-    struct fv_QueueInfo *qi = ch->qi;
+    FVRequest *req;
+    struct fv_QueueInfo *qi;
     VuDev *dev = &se->virtio_dev->dev;
-    VuVirtq *q = vu_get_queue(dev, qi->qidx);
-    VuVirtqElement *elem = &req->elem;
+    VuVirtq *q;
+    VuVirtqElement *elem;
     int ret = 0;
 
     assert(count >= 1);
@@ -281,8 +361,16 @@ int virtio_send_msg(struct fuse_session *se, struct fuse_chan *ch,
 
     size_t tosend_len = iov_size(iov, count);
 
-    /* unique == 0 is notification, which we don't support */
-    assert(out->unique);
+    /* unique == 0 is notification */
+    if (!out->unique) {
+        return virtio_send_notify_msg(se, iov, count);
+    }
+
+    assert(ch);
+    req = container_of(ch, FVRequest, ch);
+    elem = &req->elem;
+    qi = ch->qi;
+    q = vu_get_queue(dev, qi->qidx);
     assert(!req->reply_sent);
 
     /* The 'in' part of the elem is to qemu */
@@ -867,6 +955,7 @@ static int fv_get_config(VuDev *dev, uint8_t *config, uint32_t len)
         struct fuse_notify_delete_out       delete_out;
         struct fuse_notify_store_out        store_out;
         struct fuse_notify_retrieve_out     retrieve_out;
+        struct fuse_notify_lock_out         lock_out;
     };
 
     notify_size = sizeof(struct fuse_out_header) +
diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index f2fa9d95bb..8f24954a00 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -968,14 +968,6 @@ static int do_statx(struct lo_data *lo, int dirfd, const char *pathname,
     return 0;
 }
 
-static void posix_locks_value_destroy(gpointer data)
-{
-    struct lo_inode_plock *plock = data;
-
-    close(plock->fd);
-    free(plock);
-}
-
 /*
  * Increments nlookup on the inode on success. unref_inode_lolocked() must be
  * called eventually to decrement nlookup again. If inodep is non-NULL, the
@@ -2064,7 +2056,10 @@ static void lo_setlk(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi,
     struct lo_data *lo = lo_data(req);
     struct lo_inode *inode;
     struct lo_inode_plock *plock;
-    int ret, saverr = 0;
+    int ret, saverr = 0, ofd;
+    uint64_t unique;
+    struct fuse_session *se = req->se;
+    bool async_lock = false;
 
     fuse_log(FUSE_LOG_DEBUG,
              "lo_setlk(ino=%" PRIu64 ", flags=%d)"
@@ -2078,11 +2073,6 @@ static void lo_setlk(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi,
         return;
     }
 
-    if (sleep) {
-        fuse_reply_err(req, EOPNOTSUPP);
-        return;
-    }
-
     inode = lo_inode(req, ino);
     if (!inode) {
         fuse_reply_err(req, EBADF);
@@ -2095,21 +2085,56 @@ static void lo_setlk(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi,
 
     if (!plock) {
         saverr = ret;
+        pthread_mutex_unlock(&inode->plock_mutex);
         goto out;
     }
 
+    /*
+     * plock is now released when inode is going away. We already have
+     * a reference on inode, so it is guaranteed that plock->fd is
+     * still around even after dropping inode->plock_mutex lock
+     */
+    ofd = plock->fd;
+    pthread_mutex_unlock(&inode->plock_mutex);
+
+    /*
+     * If this lock request can block, request caller to wait for
+     * notification. Do not access req after this. Once lock is
+     * available, send a notification instead.
+     */
+    if (sleep && lock->l_type != F_UNLCK) {
+        /*
+         * If notification queue is not enabled, can't support async
+         * locks.
+         */
+        if (!se->notify_enabled) {
+            saverr = EOPNOTSUPP;
+            goto out;
+        }
+        async_lock = true;
+        unique = req->unique;
+        fuse_reply_wait(req);
+    }
+
     /* TODO: Is it alright to modify flock? */
     lock->l_pid = 0;
-    ret = fcntl(plock->fd, F_OFD_SETLK, lock);
+    if (async_lock) {
+        ret = fcntl(ofd, F_OFD_SETLKW, lock);
+    } else {
+        ret = fcntl(ofd, F_OFD_SETLK, lock);
+    }
     if (ret == -1) {
         saverr = errno;
     }
 
 out:
-    pthread_mutex_unlock(&inode->plock_mutex);
     lo_inode_put(lo, &inode);
 
-    fuse_reply_err(req, saverr);
+    if (!async_lock) {
+        fuse_reply_err(req, saverr);
+    } else {
+        fuse_lowlevel_notify_lock(se, unique, saverr);
+    }
 }
 
 static void lo_fsyncdir(fuse_req_t req, fuse_ino_t ino, int datasync,
-- 
2.27.0


