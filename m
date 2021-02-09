Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE40315677
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 20:07:12 +0100 (CET)
Received: from localhost ([::1]:47312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9YLu-0003SS-MA
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 14:07:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l9YHl-0001jz-V4
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:02:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l9YHi-0001ZV-Bg
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:02:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612897367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q8pEUQ5FwlT0wragKtjYtr65kguSGvb6UgV7rba+aMM=;
 b=OYER9qPSdYxeEJRcgWi/YsGPKdFA1wTlevwRXcOomtDPbiieoLO6fdk/e1svcxMr86R7fA
 X139Lea4ujlxL8yzLOOTzMLiu9qbvwj2eiaED94IrIS0S1ugmgNgJYwYUX1Z7NW7J33rwX
 xPenPMYQn5WqU+QsB4ueXbVj98qNhA4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-n8pSb7C0NH6sVg1fx-2eUA-1; Tue, 09 Feb 2021 14:02:45 -0500
X-MC-Unique: n8pSb7C0NH6sVg1fx-2eUA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A02FE801976
 for <qemu-devel@nongnu.org>; Tue,  9 Feb 2021 19:02:44 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-112-66.ams2.redhat.com
 [10.36.112.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0650360C04;
 Tue,  9 Feb 2021 19:02:42 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, vgoyal@redhat.com, stefanha@redhat.com,
 virtio-fs@redhat.com, marcandre.lureau@redhat.com, mst@redhat.com
Subject: [PATCH 01/24] DAX: vhost-user: Rework slave return values
Date: Tue,  9 Feb 2021 19:02:01 +0000
Message-Id: <20210209190224.62827-2-dgilbert@redhat.com>
In-Reply-To: <20210209190224.62827-1-dgilbert@redhat.com>
References: <20210209190224.62827-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

All the current slave handlers on the qemu side generate an 'int'
return value that's squashed down to a bool (!!ret) and stuffed into
a uint64_t (field of a union) to be returned.

Move the uint64_t type back up through the individual handlers so
that we can mkae one actually return a full uint64_t.

Note that the definition in the interop spec says most of these
cases are defined as returning 0 on success and non-0 for failure,
so it's OK to change from a bool to another non-0.

Vivek:
This is needed because upcoming patches in series will add new functions
which want to return full error code. Existing functions continue to
return true/false so, it should not lead to change of behavior for
existing users.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 hw/virtio/vhost-backend.c         |  4 ++--
 hw/virtio/vhost-user.c            | 32 ++++++++++++++++---------------
 include/hw/virtio/vhost-backend.h |  2 +-
 3 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/hw/virtio/vhost-backend.c b/hw/virtio/vhost-backend.c
index 31b33bde37..21082084ea 100644
--- a/hw/virtio/vhost-backend.c
+++ b/hw/virtio/vhost-backend.c
@@ -401,7 +401,7 @@ int vhost_backend_invalidate_device_iotlb(struct vhost_dev *dev,
     return -ENODEV;
 }
 
-int vhost_backend_handle_iotlb_msg(struct vhost_dev *dev,
+uint64_t vhost_backend_handle_iotlb_msg(struct vhost_dev *dev,
                                           struct vhost_iotlb_msg *imsg)
 {
     int ret = 0;
@@ -429,5 +429,5 @@ int vhost_backend_handle_iotlb_msg(struct vhost_dev *dev,
         break;
     }
 
-    return ret;
+    return !!ret;
 }
diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 2fdd5daf74..13789cc55e 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1317,24 +1317,25 @@ static int vhost_user_reset_device(struct vhost_dev *dev)
     return 0;
 }
 
-static int vhost_user_slave_handle_config_change(struct vhost_dev *dev)
+static uint64_t vhost_user_slave_handle_config_change(struct vhost_dev *dev)
 {
     int ret = -1;
 
     if (!dev->config_ops) {
-        return -1;
+        return true;
     }
 
     if (dev->config_ops->vhost_dev_config_notifier) {
         ret = dev->config_ops->vhost_dev_config_notifier(dev);
     }
 
-    return ret;
+    return !!ret;
 }
 
-static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
-                                                       VhostUserVringArea *area,
-                                                       int fd)
+static uint64_t vhost_user_slave_handle_vring_host_notifier(
+                struct vhost_dev *dev,
+               VhostUserVringArea *area,
+               int fd)
 {
     int queue_idx = area->u64 & VHOST_USER_VRING_IDX_MASK;
     size_t page_size = qemu_real_host_page_size;
@@ -1348,7 +1349,7 @@ static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
     if (!virtio_has_feature(dev->protocol_features,
                             VHOST_USER_PROTOCOL_F_HOST_NOTIFIER) ||
         vdev == NULL || queue_idx >= virtio_get_num_queues(vdev)) {
-        return -1;
+        return true;
     }
 
     n = &user->notifier[queue_idx];
@@ -1361,18 +1362,18 @@ static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
     }
 
     if (area->u64 & VHOST_USER_VRING_NOFD_MASK) {
-        return 0;
+        return false;
     }
 
     /* Sanity check. */
     if (area->size != page_size) {
-        return -1;
+        return true;
     }
 
     addr = mmap(NULL, page_size, PROT_READ | PROT_WRITE, MAP_SHARED,
                 fd, area->offset);
     if (addr == MAP_FAILED) {
-        return -1;
+        return true;
     }
 
     name = g_strdup_printf("vhost-user/host-notifier@%p mmaps[%d]",
@@ -1383,13 +1384,13 @@ static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
 
     if (virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, true)) {
         munmap(addr, page_size);
-        return -1;
+        return true;
     }
 
     n->addr = addr;
     n->set = true;
 
-    return 0;
+    return false;
 }
 
 static void slave_read(void *opaque)
@@ -1398,7 +1399,8 @@ static void slave_read(void *opaque)
     struct vhost_user *u = dev->opaque;
     VhostUserHeader hdr = { 0, };
     VhostUserPayload payload = { 0, };
-    int size, ret = 0;
+    int size;
+    uint64_t ret = 0;
     struct iovec iov;
     struct msghdr msgh;
     int fd[VHOST_USER_SLAVE_MAX_FDS];
@@ -1472,7 +1474,7 @@ static void slave_read(void *opaque)
         break;
     default:
         error_report("Received unexpected msg type: %d.", hdr.request);
-        ret = -EINVAL;
+        ret = (uint64_t)-EINVAL;
     }
 
     /* Close the remaining file descriptors. */
@@ -1493,7 +1495,7 @@ static void slave_read(void *opaque)
         hdr.flags &= ~VHOST_USER_NEED_REPLY_MASK;
         hdr.flags |= VHOST_USER_REPLY_MASK;
 
-        payload.u64 = !!ret;
+        payload.u64 = ret;
         hdr.size = sizeof(payload.u64);
 
         iovec[0].iov_base = &hdr;
diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
index 8a6f8e2a7a..64ac6b6444 100644
--- a/include/hw/virtio/vhost-backend.h
+++ b/include/hw/virtio/vhost-backend.h
@@ -186,7 +186,7 @@ int vhost_backend_update_device_iotlb(struct vhost_dev *dev,
 int vhost_backend_invalidate_device_iotlb(struct vhost_dev *dev,
                                                  uint64_t iova, uint64_t len);
 
-int vhost_backend_handle_iotlb_msg(struct vhost_dev *dev,
+uint64_t vhost_backend_handle_iotlb_msg(struct vhost_dev *dev,
                                           struct vhost_iotlb_msg *imsg);
 
 int vhost_user_gpu_set_socket(struct vhost_dev *dev, int fd);
-- 
2.29.2


