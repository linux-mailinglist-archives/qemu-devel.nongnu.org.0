Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8233AA583
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 22:44:06 +0200 (CEST)
Received: from localhost ([::1]:52308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltcOL-0007oW-U3
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 16:44:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iangelak@redhat.com>)
 id 1ltbOM-00034I-47
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 15:40:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iangelak@redhat.com>)
 id 1ltbOF-0000VF-NW
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 15:40:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623872393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MQqb/8n9ImY0HAJx1kYCZ22vklzLbARBOLz3KyeFMQ4=;
 b=XBKI5LtY1zQ+M0qnhBwBkcYYH66V9YJoEfiNm4w2DXIOsIinYh6vkudBjv3NuxLa98t+Uz
 MfFGq6/F7i9bBLD1I22nAm3rpMRmFp4m39GBjMCfrwAQ/3Tw3Aar+v8U/3ZZGjpNau7ING
 s56uKnYtrRJBnG9XSOIYG8gfkeAiwog=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-P9OB3ZPCN1m980M-PivtYg-1; Wed, 16 Jun 2021 15:39:52 -0400
X-MC-Unique: P9OB3ZPCN1m980M-PivtYg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A03971084F47
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 19:39:51 +0000 (UTC)
Received: from iangelak.remote.csb (ovpn-113-44.rdu2.redhat.com [10.10.113.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E57FA60BF1;
 Wed, 16 Jun 2021 19:39:50 +0000 (UTC)
From: Ioannis Angelakopoulos <iangelak@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH 2/6] virtiofsd: Create a notification queue
Date: Wed, 16 Jun 2021 15:39:17 -0400
Message-Id: <20210616193921.608720-3-iangelak@redhat.com>
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

Add a notification queue which will be used to send async notifications
for file lock availability.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
Signed-off-by: Ioannis Angelakopoulos <iangelak@redhat.com>
---
 hw/virtio/vhost-user-fs.c                  | 30 ++++++--
 include/hw/virtio/vhost-user-fs.h          |  2 +-
 include/standard-headers/linux/virtio_fs.h |  3 +
 tools/virtiofsd/fuse_i.h                   |  1 +
 tools/virtiofsd/fuse_virtio.c              | 79 +++++++++++++++-------
 5 files changed, 85 insertions(+), 30 deletions(-)

diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
index 6f7f91533d..c7fd5f3123 100644
--- a/hw/virtio/vhost-user-fs.c
+++ b/hw/virtio/vhost-user-fs.c
@@ -31,6 +31,7 @@ static const int user_feature_bits[] = {
     VIRTIO_F_NOTIFY_ON_EMPTY,
     VIRTIO_F_RING_PACKED,
     VIRTIO_F_IOMMU_PLATFORM,
+    VIRTIO_FS_F_NOTIFICATION,
 
     VHOST_INVALID_FEATURE_BIT
 };
@@ -145,9 +146,20 @@ static uint64_t vuf_get_features(VirtIODevice *vdev,
 {
     VHostUserFS *fs = VHOST_USER_FS(vdev);
 
+    virtio_add_feature(&features, VIRTIO_FS_F_NOTIFICATION);
+
     return vhost_get_features(&fs->vhost_dev, user_feature_bits, features);
 }
 
+static void vuf_set_features(VirtIODevice *vdev, uint64_t features)
+{
+    VHostUserFS *fs = VHOST_USER_FS(vdev);
+
+    if (virtio_has_feature(features, VIRTIO_FS_F_NOTIFICATION)) {
+        fs->notify_enabled = true;
+    }
+}
+
 static void vuf_handle_output(VirtIODevice *vdev, VirtQueue *vq)
 {
     /*
@@ -223,16 +235,25 @@ static void vuf_device_realize(DeviceState *dev, Error **errp)
                 sizeof(struct virtio_fs_config));
 
     /* Hiprio queue */
-    fs->hiprio_vq = virtio_add_queue(vdev, fs->conf.queue_size, vuf_handle_output);
+    fs->hiprio_vq = virtio_add_queue(vdev, fs->conf.queue_size,
+                                     vuf_handle_output);
+
+    /*
+     * Notification queue. Feature negotiation happens later. So at this
+     * point of time we don't know if driver will use notification queue
+     * or not.
+     */
+    virtio_add_queue(vdev, fs->conf.queue_size, vuf_handle_output);
 
     /* Request queues */
     fs->req_vqs = g_new(VirtQueue *, fs->conf.num_request_queues);
     for (i = 0; i < fs->conf.num_request_queues; i++) {
-        fs->req_vqs[i] = virtio_add_queue(vdev, fs->conf.queue_size, vuf_handle_output);
+        fs->req_vqs[i] = virtio_add_queue(vdev, fs->conf.queue_size,
+                                          vuf_handle_output);
     }
 
-    /* 1 high prio queue, plus the number configured */
-    fs->vhost_dev.nvqs = 1 + fs->conf.num_request_queues;
+    /* 1 high prio queue, 1 notification queue plus the number configured */
+    fs->vhost_dev.nvqs = 2 + fs->conf.num_request_queues;
     fs->vhost_dev.vqs = g_new0(struct vhost_virtqueue, fs->vhost_dev.nvqs);
     ret = vhost_dev_init(&fs->vhost_dev, &fs->vhost_user,
                          VHOST_BACKEND_TYPE_USER, 0);
@@ -311,6 +332,7 @@ static void vuf_class_init(ObjectClass *klass, void *data)
     vdc->realize = vuf_device_realize;
     vdc->unrealize = vuf_device_unrealize;
     vdc->get_features = vuf_get_features;
+    vdc->set_features = vuf_set_features;
     vdc->get_config = vuf_get_config;
     vdc->set_status = vuf_set_status;
     vdc->guest_notifier_mask = vuf_guest_notifier_mask;
diff --git a/include/hw/virtio/vhost-user-fs.h b/include/hw/virtio/vhost-user-fs.h
index 0d62834c25..13e2cbc48e 100644
--- a/include/hw/virtio/vhost-user-fs.h
+++ b/include/hw/virtio/vhost-user-fs.h
@@ -40,7 +40,7 @@ struct VHostUserFS {
     VirtQueue **req_vqs;
     VirtQueue *hiprio_vq;
     int32_t bootindex;
-
+    bool notify_enabled;
     /*< public >*/
 };
 
diff --git a/include/standard-headers/linux/virtio_fs.h b/include/standard-headers/linux/virtio_fs.h
index a32fe8a64c..6383d723a3 100644
--- a/include/standard-headers/linux/virtio_fs.h
+++ b/include/standard-headers/linux/virtio_fs.h
@@ -8,6 +8,9 @@
 #include "standard-headers/linux/virtio_config.h"
 #include "standard-headers/linux/virtio_types.h"
 
+/* Feature bits */
+#define VIRTIO_FS_F_NOTIFICATION 0   /* Notification queue supported */
+
 struct virtio_fs_config {
 	/* Filesystem name (UTF-8, not NUL-terminated, padded with NULs) */
 	uint8_t tag[36];
diff --git a/tools/virtiofsd/fuse_i.h b/tools/virtiofsd/fuse_i.h
index 492e002181..4942d080da 100644
--- a/tools/virtiofsd/fuse_i.h
+++ b/tools/virtiofsd/fuse_i.h
@@ -73,6 +73,7 @@ struct fuse_session {
     int   vu_socketfd;
     struct fv_VuDev *virtio_dev;
     int thread_pool_size;
+    bool notify_enabled;
 };
 
 struct fuse_chan {
diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index fa4aff9b0e..3ff4cc1430 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -14,6 +14,7 @@
 #include "qemu/osdep.h"
 #include "qemu/iov.h"
 #include "qapi/error.h"
+#include "standard-headers/linux/virtio_fs.h"
 #include "fuse_i.h"
 #include "standard-headers/linux/fuse.h"
 #include "fuse_misc.h"
@@ -80,23 +81,31 @@ struct fv_VuDev {
      */
     size_t nqueues;
     struct fv_QueueInfo **qi;
-};
-
-/* From spec */
-struct virtio_fs_config {
-    char tag[36];
-    uint32_t num_queues;
+    /* True if notification queue is being used */
+    bool notify_enabled;
 };
 
 /* Callback from libvhost-user */
 static uint64_t fv_get_features(VuDev *dev)
 {
-    return 1ULL << VIRTIO_F_VERSION_1;
+    uint64_t features;
+
+    features = 1ull << VIRTIO_F_VERSION_1 |
+               1ull << VIRTIO_FS_F_NOTIFICATION;
+
+    return features;
 }
 
 /* Callback from libvhost-user */
 static void fv_set_features(VuDev *dev, uint64_t features)
 {
+    struct fv_VuDev *vud = container_of(dev, struct fv_VuDev, dev);
+    struct fuse_session *se = vud->se;
+
+    if ((1ull << VIRTIO_FS_F_NOTIFICATION) & features) {
+        vud->notify_enabled = true;
+        se->notify_enabled = true;
+    }
 }
 
 /*
@@ -736,19 +745,20 @@ static void fv_queue_cleanup_thread(struct fv_VuDev *vud, int qidx)
 
     assert(qidx < vud->nqueues);
     ourqi = vud->qi[qidx];
-
-    /* Kill the thread */
-    if (eventfd_write(ourqi->kill_fd, 1)) {
-        fuse_log(FUSE_LOG_ERR, "Eventfd_write for queue %d: %s\n",
-                 qidx, strerror(errno));
-    }
-    ret = pthread_join(ourqi->thread, NULL);
-    if (ret) {
-        fuse_log(FUSE_LOG_ERR, "%s: Failed to join thread idx %d err %d\n",
-                 __func__, qidx, ret);
+    /* qidx == 1 is the notification queue  */
+    if (qidx != 1) {
+        /* Kill the thread */
+        if (eventfd_write(ourqi->kill_fd, 1)) {
+            fuse_log(FUSE_LOG_ERR, "Eventfd_read for queue: %m\n");
+        }
+        ret = pthread_join(ourqi->thread, NULL);
+        if (ret) {
+            fuse_log(FUSE_LOG_ERR, "%s: Failed to join thread idx %d err"
+                     " %d\n", __func__, qidx, ret);
+        }
+        close(ourqi->kill_fd);
     }
     pthread_mutex_destroy(&ourqi->vq_lock);
-    close(ourqi->kill_fd);
     ourqi->kick_fd = -1;
     g_free(vud->qi[qidx]);
     vud->qi[qidx] = NULL;
@@ -759,6 +769,9 @@ static void fv_queue_set_started(VuDev *dev, int qidx, bool started)
 {
     struct fv_VuDev *vud = container_of(dev, struct fv_VuDev, dev);
     struct fv_QueueInfo *ourqi;
+    void * (*thread_func) (void *) = fv_queue_thread;
+    int valid_queues = 2; /* One hiprio queue and one request queue */
+    bool notification_q = false;
 
     fuse_log(FUSE_LOG_INFO, "%s: qidx=%d started=%d\n", __func__, qidx,
              started);
@@ -770,10 +783,19 @@ static void fv_queue_set_started(VuDev *dev, int qidx, bool started)
      * well-behaved client in mind and may not protect against all types of
      * races yet.
      */
-    if (qidx > 1) {
-        fuse_log(FUSE_LOG_ERR,
-                 "%s: multiple request queues not yet implemented, please only "
-                 "configure 1 request queue\n",
+    if (vud->notify_enabled) {
+        valid_queues++;
+        /*
+         * If notification queue is enabled, then qidx 1 is notificaiton queue.
+         */
+        if (qidx == 1) {
+            notification_q = true;
+        }
+    }
+
+    if (qidx >= valid_queues) {
+        fuse_log(FUSE_LOG_ERR, "%s: multiple request queues not yet"
+                 "implemented, please only configure 1 request queue\n",
                  __func__);
         exit(EXIT_FAILURE);
     }
@@ -795,13 +817,20 @@ static void fv_queue_set_started(VuDev *dev, int qidx, bool started)
             assert(vud->qi[qidx]->kick_fd == -1);
         }
         ourqi = vud->qi[qidx];
+        pthread_mutex_init(&ourqi->vq_lock, NULL);
+        /*
+         * For notification queue, we don't have to start a thread yet.
+         */
+        if (notification_q) {
+            return;
+        }
+
         ourqi->kick_fd = dev->vq[qidx].kick_fd;
 
         ourqi->kill_fd = eventfd(0, EFD_CLOEXEC | EFD_SEMAPHORE);
         assert(ourqi->kill_fd != -1);
-        pthread_mutex_init(&ourqi->vq_lock, NULL);
 
-        if (pthread_create(&ourqi->thread, NULL, fv_queue_thread, ourqi)) {
+        if (pthread_create(&ourqi->thread, NULL, thread_func, ourqi)) {
             fuse_log(FUSE_LOG_ERR, "%s: Failed to create thread for queue %d\n",
                      __func__, qidx);
             assert(0);
@@ -1058,7 +1087,7 @@ int virtio_session_mount(struct fuse_session *se)
     se->vu_socketfd = data_sock;
     se->virtio_dev->se = se;
     pthread_rwlock_init(&se->virtio_dev->vu_dispatch_rwlock, NULL);
-    if (!vu_init(&se->virtio_dev->dev, 2, se->vu_socketfd, fv_panic, NULL,
+    if (!vu_init(&se->virtio_dev->dev, 3, se->vu_socketfd, fv_panic, NULL,
                  fv_set_watch, fv_remove_watch, &fv_iface)) {
         fuse_log(FUSE_LOG_ERR, "%s: vu_init failed\n", __func__);
         return -1;
-- 
2.27.0


