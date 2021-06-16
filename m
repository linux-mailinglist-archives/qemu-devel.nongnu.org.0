Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF07F3AA599
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 22:49:52 +0200 (CEST)
Received: from localhost ([::1]:41302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltcTv-0002fs-HK
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 16:49:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iangelak@redhat.com>)
 id 1ltbOi-000363-Uz
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 15:40:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iangelak@redhat.com>)
 id 1ltbOg-0000hc-SZ
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 15:40:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623872415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EZvRji51nIav+fy8kQUz7X+kCloOXz7jK3LuPpoi8ms=;
 b=EYHcsaRMBBhgsPNvI9D05Z/6iA4+TM+/NKjY6q+ukMajiYlfFWec7wRlaA+V1mJhPudSGO
 ChJAPsj0BASmKQpXxWdnUuGxOHnThordvPLDmcbO1ZA9wcbuw69/BH4YZVe8MJ1FeAW2Ma
 /IrTB0UOwuCYSo66iZRj5i2ZkTAjAX8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-kwSBOM4EN0GKsOOTI6sJAQ-1; Wed, 16 Jun 2021 15:40:14 -0400
X-MC-Unique: kwSBOM4EN0GKsOOTI6sJAQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7AE7D1923762
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 19:40:13 +0000 (UTC)
Received: from iangelak.remote.csb (ovpn-113-44.rdu2.redhat.com [10.10.113.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D51DF60BF1;
 Wed, 16 Jun 2021 19:40:12 +0000 (UTC)
From: Ioannis Angelakopoulos <iangelak@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH 5/6] virtiofsd: Thread state cleanup when blocking posix locks
 are used
Date: Wed, 16 Jun 2021 15:39:20 -0400
Message-Id: <20210616193921.608720-6-iangelak@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=iangelak@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 16 Jun 2021 16:41:48 -0400
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

Stop virtiofsd thread from sending any notifications/messages through
the virtqueue while the guest hard-reboots.

If a guest attempts to hard reboot while a virtiofsd thread blocks
waiting for a lock held by another guest's virtiofsd process, then
QEMU will block the guest from rebooting until the lock is released.

When the virtiofsd thread acquires the lock it will not attempt to
send a message to the notification virtqueue since the queue is
now destroyed, due to the hard-reboot attempt of the guest. The thread
will only release the lock, without sending any notifications through the
virtqueue.

Then the cleanup process can proceed normally.

Signed-off-by: Ioannis Angelakopoulos <iangelak@redhat.com>
---
 tools/virtiofsd/fuse_i.h         |  1 +
 tools/virtiofsd/fuse_lowlevel.c  |  2 ++
 tools/virtiofsd/fuse_virtio.c    | 10 ++++++++++
 tools/virtiofsd/passthrough_ll.c | 23 +++++++++++++++++++----
 4 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/tools/virtiofsd/fuse_i.h b/tools/virtiofsd/fuse_i.h
index 4942d080da..269fd5e77b 100644
--- a/tools/virtiofsd/fuse_i.h
+++ b/tools/virtiofsd/fuse_i.h
@@ -62,6 +62,7 @@ struct fuse_session {
     pthread_mutex_t lock;
     pthread_rwlock_t init_rwlock;
     int got_destroy;
+    int in_cleanup;
     int broken_splice_nonblock;
     uint64_t notify_ctr;
     struct fuse_notify_req notify_list;
diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
index 4b03ec2f9f..a9f6ea61dc 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -1905,6 +1905,7 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
     se->conn.proto_minor = arg->minor;
     se->conn.capable = 0;
     se->conn.want = 0;
+    se->in_cleanup = 0;
 
     memset(&outarg, 0, sizeof(outarg));
     outarg.major = FUSE_KERNEL_VERSION;
@@ -2397,6 +2398,7 @@ void fuse_session_process_buf_int(struct fuse_session *se,
             fuse_log(FUSE_LOG_DEBUG, "%s: reinit\n", __func__);
             se->got_destroy = 1;
             se->got_init = 0;
+            se->in_cleanup = 0;
             if (se->op.destroy) {
                 se->op.destroy(se->userdata);
             }
diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index cb4dbafd91..7efaf9ae68 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -839,11 +839,14 @@ static void fv_queue_cleanup_thread(struct fv_VuDev *vud, int qidx)
         if (eventfd_write(ourqi->kill_fd, 1)) {
             fuse_log(FUSE_LOG_ERR, "Eventfd_read for queue: %m\n");
         }
+
         ret = pthread_join(ourqi->thread, NULL);
+
         if (ret) {
             fuse_log(FUSE_LOG_ERR, "%s: Failed to join thread idx %d err"
                      " %d\n", __func__, qidx, ret);
         }
+
         close(ourqi->kill_fd);
     }
     pthread_mutex_destroy(&ourqi->vq_lock);
@@ -929,6 +932,13 @@ static void fv_queue_set_started(VuDev *dev, int qidx, bool started)
          * the queue thread doesn't block in virtio_send_msg().
          */
         vu_dispatch_unlock(vud);
+        /*
+         * Indicate to any thread that was blocked and wakes up
+         * that we are in the thread cleanup process
+         */
+        if (!vud->se->in_cleanup) {
+            vud->se->in_cleanup = 1;
+        }
         fv_queue_cleanup_thread(vud, qidx);
         vu_dispatch_wrlock(vud);
     }
diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 8f24954a00..8a2aa10b9c 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -1971,9 +1971,6 @@ static struct lo_inode_plock *lookup_create_plock_ctx(struct lo_data *lo,
     plock =
         g_hash_table_lookup(inode->posix_locks, GUINT_TO_POINTER(lock_owner));
 
-    fuse_log(FUSE_LOG_DEBUG, "lookup_create_plock_ctx():"
-             " Inserted element in posix_locks hash table"
-             " with value pointer %p\n", plock);
     if (plock) {
         return plock;
     }
@@ -1997,6 +1994,10 @@ static struct lo_inode_plock *lookup_create_plock_ctx(struct lo_data *lo,
     plock->fd = fd;
     g_hash_table_insert(inode->posix_locks, GUINT_TO_POINTER(plock->lock_owner),
                         plock);
+    fuse_log(FUSE_LOG_DEBUG, "lookup_create_plock_ctx():"
+             " Inserted element in posix_locks hash table"
+             " with value pointer %p\n", plock);
+
     return plock;
 }
 
@@ -2133,7 +2134,21 @@ out:
     if (!async_lock) {
         fuse_reply_err(req, saverr);
     } else {
-        fuse_lowlevel_notify_lock(se, unique, saverr);
+        /*
+         * Before attempting to send any message through
+         * the thread should check if the queue actually
+         * exists
+         */
+        if (!se->in_cleanup) {
+            fuse_lowlevel_notify_lock(se, unique, saverr);
+        } else {
+            /* Release the locks */
+            lock->l_type = F_UNLCK;
+            lock->l_whence = SEEK_SET;
+            /* Unlock whole file */
+            lock->l_start = lock->l_len = 0;
+            fcntl(ofd, F_OFD_SETLKW, lock);
+        }
     }
 }
 
-- 
2.27.0


