Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 455E731D063
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 19:47:55 +0100 (CET)
Received: from localhost ([::1]:55654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC5O6-00024k-Cm
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 13:47:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lC5ER-0004Lg-5x
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 13:37:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lC5EO-0000Ft-FD
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 13:37:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613500671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ePzcSXu+xFi0EtP7a7da9l5xGiaV91m8gitJFP8nLz8=;
 b=f//VeBAi7JjokHY2qOBz+Kr8EvWoO2xNCRDHjtO2TPmEJwdsYQa4oKUKNYkhC0+jLw/BJK
 nJHeVsiuoNPEmRt98i2WiWppzNHj171Izgag6d/yCZxGeXV+uRxYpv+b5N3VV4DMRWBSOf
 x11Amb6ItwcTV7VYQqW88dYcdB4C67s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-67X2meu2NY2J_NedlqFjaQ-1; Tue, 16 Feb 2021 13:37:47 -0500
X-MC-Unique: 67X2meu2NY2J_NedlqFjaQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9945B107ACE4;
 Tue, 16 Feb 2021 18:37:46 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-109.ams2.redhat.com
 [10.36.115.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 422D35C1B4;
 Tue, 16 Feb 2021 18:37:45 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, wainersm@redhat.com, groug@kaod.org,
 philmd@redhat.com, vgoyal@redhat.com
Subject: [PULL 2/6] virtiofsd: vu_dispatch locking should never fail
Date: Tue, 16 Feb 2021 18:37:30 +0000
Message-Id: <20210216183734.57810-3-dgilbert@redhat.com>
In-Reply-To: <20210216183734.57810-1-dgilbert@redhat.com>
References: <20210216183734.57810-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: virtio-fs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

pthread_rwlock_rdlock() and pthread_rwlock_wrlock() can fail if a
deadlock condition is detected or the current thread already owns
the lock. They can also fail, like pthread_rwlock_unlock(), if the
mutex wasn't properly initialized. None of these are ever expected
to happen with fv_VuDev::vu_dispatch_rwlock.

Some users already check the return value and assert, some others
don't. Introduce rdlock/wrlock/unlock wrappers that just do the
former and use them everywhere for improved consistency and
robustness.

This is just cleanup. It doesn't fix any actual issue.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20210203182434.93870-1-groug@kaod.org>
Reviewed-by: Vivek Goyal <vgoyal@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/fuse_virtio.c | 49 +++++++++++++++++++++++++----------
 1 file changed, 35 insertions(+), 14 deletions(-)

diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index ddcefee427..523ee64fb7 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -187,6 +187,31 @@ static void copy_iov(struct iovec *src_iov, int src_count,
     }
 }
 
+/*
+ * pthread_rwlock_rdlock() and pthread_rwlock_wrlock can fail if
+ * a deadlock condition is detected or the current thread already
+ * owns the lock. They can also fail, like pthread_rwlock_unlock(),
+ * if the mutex wasn't properly initialized. None of these are ever
+ * expected to happen.
+ */
+static void vu_dispatch_rdlock(struct fv_VuDev *vud)
+{
+    int ret = pthread_rwlock_rdlock(&vud->vu_dispatch_rwlock);
+    assert(ret == 0);
+}
+
+static void vu_dispatch_wrlock(struct fv_VuDev *vud)
+{
+    int ret = pthread_rwlock_wrlock(&vud->vu_dispatch_rwlock);
+    assert(ret == 0);
+}
+
+static void vu_dispatch_unlock(struct fv_VuDev *vud)
+{
+    int ret = pthread_rwlock_unlock(&vud->vu_dispatch_rwlock);
+    assert(ret == 0);
+}
+
 /*
  * Called back by ll whenever it wants to send a reply/message back
  * The 1st element of the iov starts with the fuse_out_header
@@ -240,12 +265,12 @@ int virtio_send_msg(struct fuse_session *se, struct fuse_chan *ch,
 
     copy_iov(iov, count, in_sg, in_num, tosend_len);
 
-    pthread_rwlock_rdlock(&qi->virtio_dev->vu_dispatch_rwlock);
+    vu_dispatch_rdlock(qi->virtio_dev);
     pthread_mutex_lock(&qi->vq_lock);
     vu_queue_push(dev, q, elem, tosend_len);
     vu_queue_notify(dev, q);
     pthread_mutex_unlock(&qi->vq_lock);
-    pthread_rwlock_unlock(&qi->virtio_dev->vu_dispatch_rwlock);
+    vu_dispatch_unlock(qi->virtio_dev);
 
     req->reply_sent = true;
 
@@ -403,12 +428,12 @@ int virtio_send_data_iov(struct fuse_session *se, struct fuse_chan *ch,
 
     ret = 0;
 
-    pthread_rwlock_rdlock(&qi->virtio_dev->vu_dispatch_rwlock);
+    vu_dispatch_rdlock(qi->virtio_dev);
     pthread_mutex_lock(&qi->vq_lock);
     vu_queue_push(dev, q, elem, tosend_len);
     vu_queue_notify(dev, q);
     pthread_mutex_unlock(&qi->vq_lock);
-    pthread_rwlock_unlock(&qi->virtio_dev->vu_dispatch_rwlock);
+    vu_dispatch_unlock(qi->virtio_dev);
 
 err:
     if (ret == 0) {
@@ -558,12 +583,12 @@ out:
         fuse_log(FUSE_LOG_DEBUG, "%s: elem %d no reply sent\n", __func__,
                  elem->index);
 
-        pthread_rwlock_rdlock(&qi->virtio_dev->vu_dispatch_rwlock);
+        vu_dispatch_rdlock(qi->virtio_dev);
         pthread_mutex_lock(&qi->vq_lock);
         vu_queue_push(dev, q, elem, 0);
         vu_queue_notify(dev, q);
         pthread_mutex_unlock(&qi->vq_lock);
-        pthread_rwlock_unlock(&qi->virtio_dev->vu_dispatch_rwlock);
+        vu_dispatch_unlock(qi->virtio_dev);
     }
 
     pthread_mutex_destroy(&req->ch.lock);
@@ -596,7 +621,6 @@ static void *fv_queue_thread(void *opaque)
              qi->qidx, qi->kick_fd);
     while (1) {
         struct pollfd pf[2];
-        int ret;
 
         pf[0].fd = qi->kick_fd;
         pf[0].events = POLLIN;
@@ -645,8 +669,7 @@ static void *fv_queue_thread(void *opaque)
             break;
         }
         /* Mutual exclusion with virtio_loop() */
-        ret = pthread_rwlock_rdlock(&qi->virtio_dev->vu_dispatch_rwlock);
-        assert(ret == 0); /* there is no possible error case */
+        vu_dispatch_rdlock(qi->virtio_dev);
         pthread_mutex_lock(&qi->vq_lock);
         /* out is from guest, in is too guest */
         unsigned int in_bytes, out_bytes;
@@ -672,7 +695,7 @@ static void *fv_queue_thread(void *opaque)
         }
 
         pthread_mutex_unlock(&qi->vq_lock);
-        pthread_rwlock_unlock(&qi->virtio_dev->vu_dispatch_rwlock);
+        vu_dispatch_unlock(qi->virtio_dev);
 
         /* Process all the requests. */
         if (!se->thread_pool_size && req_list != NULL) {
@@ -799,7 +822,6 @@ int virtio_loop(struct fuse_session *se)
     while (!fuse_session_exited(se)) {
         struct pollfd pf[1];
         bool ok;
-        int ret;
         pf[0].fd = se->vu_socketfd;
         pf[0].events = POLLIN;
         pf[0].revents = 0;
@@ -825,12 +847,11 @@ int virtio_loop(struct fuse_session *se)
         assert(pf[0].revents & POLLIN);
         fuse_log(FUSE_LOG_DEBUG, "%s: Got VU event\n", __func__);
         /* Mutual exclusion with fv_queue_thread() */
-        ret = pthread_rwlock_wrlock(&se->virtio_dev->vu_dispatch_rwlock);
-        assert(ret == 0); /* there is no possible error case */
+        vu_dispatch_wrlock(se->virtio_dev);
 
         ok = vu_dispatch(&se->virtio_dev->dev);
 
-        pthread_rwlock_unlock(&se->virtio_dev->vu_dispatch_rwlock);
+        vu_dispatch_unlock(se->virtio_dev);
 
         if (!ok) {
             fuse_log(FUSE_LOG_ERR, "%s: vu_dispatch failed\n", __func__);
-- 
2.29.2


