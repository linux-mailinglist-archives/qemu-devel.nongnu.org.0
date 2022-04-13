Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6A44FFBD9
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 18:54:40 +0200 (CEST)
Received: from localhost ([::1]:38352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1negGN-0003oK-T2
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 12:54:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nefve-00027A-Co
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 12:33:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nefvc-0003Gd-6C
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 12:33:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649867591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LTpy20R1UK/f6DRaZkxOpfl1MvfeC1qnyvbkSEpmd7o=;
 b=aCE0Mv2mXsDdyygO6FvLuk9E3qnCEhVHnMYdEStFKj6M18RUYuOYMpEHiurGBHFOUOLLT5
 aY6aar+ViyaMf+PBpP9M5QoLkXXM9Zw4z1PtASHSYfVmI4lqjR6UxdLWv/7PFQKGQWeGE0
 foHSm4cx9UB2WIS16/lJWRznTaXSLpg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-wjhpLlW4Px-NehU5S_aG0w-1; Wed, 13 Apr 2022 12:33:08 -0400
X-MC-Unique: wjhpLlW4Px-NehU5S_aG0w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A2B33841D24;
 Wed, 13 Apr 2022 16:33:08 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0927B1415105;
 Wed, 13 Apr 2022 16:33:05 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v7 24/25] vdpa: Add asid attribute to vdpa device
Date: Wed, 13 Apr 2022 18:32:05 +0200
Message-Id: <20220413163206.1958254-25-eperezma@redhat.com>
In-Reply-To: <20220413163206.1958254-1-eperezma@redhat.com>
References: <20220413163206.1958254-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Eli Cohen <eli@mellanox.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can configure ASID per group, but we still use asid 0 for every vdpa
device. Multiple asid support for cvq will be introduced in next
patches

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/hw/virtio/vhost.h |  4 ++
 hw/net/vhost_net.c        |  5 +++
 hw/virtio/vhost-vdpa.c    | 95 ++++++++++++++++++++++++++++++++-------
 net/vhost-vdpa.c          |  4 +-
 hw/virtio/trace-events    |  9 ++--
 5 files changed, 94 insertions(+), 23 deletions(-)

diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 034868fa9e..640cf82168 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -76,8 +76,12 @@ struct vhost_dev {
     int vq_index;
     /* one past the last vq index for the virtio device (not vhost) */
     int vq_index_end;
+    /* one past the last vq index of this virtqueue group */
+    int vq_group_index_end;
     /* if non-zero, minimum required value for max_queues */
     int num_queues;
+    /* address space id */
+    uint32_t address_space_id;
     /* Must be a vq group different than any other vhost dev */
     bool independent_vq_group;
     uint64_t features;
diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 10480e19e5..a34df739a7 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -344,15 +344,20 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
 
     for (i = 0; i < nvhosts; i++) {
         bool cvq_idx = i >= data_queue_pairs;
+        uint32_t vq_group_end;
 
         if (!cvq_idx) {
             peer = qemu_get_peer(ncs, i);
+            vq_group_end = 2 * data_queue_pairs;
         } else { /* Control Virtqueue */
             peer = qemu_get_peer(ncs, n->max_queue_pairs);
+            vq_group_end = 2 * data_queue_pairs + 1;
         }
 
         net = get_vhost_net(peer);
+        net->dev.address_space_id = !!cvq_idx;
         net->dev.independent_vq_group = !!cvq_idx;
+        net->dev.vq_group_index_end = vq_group_end;
         vhost_net_set_vq_index(net, i * 2, index_end);
 
         /* Suppress the masking guest notifiers on vhost user
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 4096555242..5ed211287c 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -79,6 +79,9 @@ static int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr size,
     int ret = 0;
 
     msg.type = v->msg_type;
+    if (v->dev->backend_cap & BIT_ULL(VHOST_BACKEND_F_IOTLB_ASID)) {
+        msg.asid = v->dev->address_space_id;
+    }
     msg.iotlb.iova = iova;
     msg.iotlb.size = size;
     msg.iotlb.uaddr = (uint64_t)(uintptr_t)vaddr;
@@ -90,8 +93,9 @@ static int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr size,
         return 0;
     }
 
-   trace_vhost_vdpa_dma_map(v, fd, msg.type, msg.iotlb.iova, msg.iotlb.size,
-                            msg.iotlb.uaddr, msg.iotlb.perm, msg.iotlb.type);
+    trace_vhost_vdpa_dma_map(v, fd, msg.type, msg.asid, msg.iotlb.iova,
+                             msg.iotlb.size, msg.iotlb.uaddr, msg.iotlb.perm,
+                             msg.iotlb.type);
 
     if (write(fd, &msg, sizeof(msg)) != sizeof(msg)) {
         error_report("failed to write, fd=%d, errno=%d (%s)",
@@ -109,6 +113,9 @@ static int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, hwaddr iova,
     int fd = v->device_fd;
     int ret = 0;
 
+    if (v->dev->backend_cap & BIT_ULL(VHOST_BACKEND_F_IOTLB_ASID)) {
+        msg.asid = v->dev->address_space_id;
+    }
     msg.type = v->msg_type;
     msg.iotlb.iova = iova;
     msg.iotlb.size = size;
@@ -119,7 +126,7 @@ static int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, hwaddr iova,
         return 0;
     }
 
-    trace_vhost_vdpa_dma_unmap(v, fd, msg.type, msg.iotlb.iova,
+    trace_vhost_vdpa_dma_unmap(v, fd, msg.type, msg.asid, msg.iotlb.iova,
                                msg.iotlb.size, msg.iotlb.type);
 
     if (write(fd, &msg, sizeof(msg)) != sizeof(msg)) {
@@ -134,6 +141,7 @@ static int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, hwaddr iova,
 static void vhost_vdpa_listener_commit(MemoryListener *listener)
 {
     struct vhost_vdpa *v = container_of(listener, struct vhost_vdpa, listener);
+    struct vhost_dev *dev = v->dev;
     struct vhost_msg_v2 msg = {};
     int fd = v->device_fd;
     size_t num = v->iotlb_updates->len;
@@ -142,9 +150,14 @@ static void vhost_vdpa_listener_commit(MemoryListener *listener)
         return;
     }
 
+    if (dev->backend_cap & (0x1ULL << VHOST_BACKEND_F_IOTLB_ASID)) {
+        msg.asid = v->dev->address_space_id;
+    }
+
     msg.type = v->msg_type;
     msg.iotlb.type = VHOST_IOTLB_BATCH_BEGIN;
-    trace_vhost_vdpa_listener_begin_batch(v, fd, msg.type, msg.iotlb.type);
+    trace_vhost_vdpa_listener_begin_batch(v, fd, msg.type, msg.asid,
+                                          msg.iotlb.type);
     if (write(fd, &msg, sizeof(msg)) != sizeof(msg)) {
         error_report("failed to write BEGIN_BATCH, fd=%d, errno=%d (%s)",
                      fd, errno, strerror(errno));
@@ -162,7 +175,8 @@ static void vhost_vdpa_listener_commit(MemoryListener *listener)
     }
 
     msg.iotlb.type = VHOST_IOTLB_BATCH_END;
-    trace_vhost_vdpa_listener_commit(v, fd, msg.type, msg.iotlb.type);
+    trace_vhost_vdpa_listener_commit(v, fd, msg.type, msg.asid,
+                                     msg.iotlb.type);
     if (write(fd, &msg, sizeof(msg)) != sizeof(msg)) {
         error_report("failed to write, fd=%d, errno=%d (%s)",
                      fd, errno, strerror(errno));
@@ -1171,10 +1185,48 @@ call_err:
     return false;
 }
 
+static int vhost_vdpa_set_vq_group_address_space_id(struct vhost_dev *dev,
+                                                struct vhost_vring_state *asid)
+{
+    trace_vhost_vdpa_set_vq_group_address_space_id(dev, asid->index, asid->num);
+    return vhost_vdpa_call(dev, VHOST_VDPA_SET_GROUP_ASID, asid);
+}
+
+static int vhost_vdpa_set_address_space_id(struct vhost_dev *dev)
+{
+    struct vhost_vring_state vq_group = {
+        .index = dev->vq_index,
+    };
+    struct vhost_vring_state asid;
+    int ret;
+
+    if (!dev->address_space_id) {
+        return 0;
+    }
+
+    ret = vhost_vdpa_get_vring_group(dev, &vq_group);
+    if (unlikely(ret)) {
+        error_report("Can't read vq group, errno=%d (%s)", ret,
+                     g_strerror(-ret));
+        return ret;
+    }
+
+    asid.index = vq_group.num;
+    asid.num = dev->address_space_id;
+    ret = vhost_vdpa_set_vq_group_address_space_id(dev, &asid);
+    if (unlikely(ret)) {
+        error_report("Can't set vq group %u asid %u, errno=%d (%s)",
+            asid.index, asid.num, ret, g_strerror(-ret));
+    }
+    return ret;
+}
+
 static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
 {
     struct vhost_vdpa *v = dev->opaque;
-    bool ok;
+    bool vq_group_end, ok;
+    int r = 0;
+
     trace_vhost_vdpa_dev_start(dev, started);
 
     if (started) {
@@ -1183,6 +1235,10 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
             !vhost_dev_is_independent_group(dev)) {
             return -1;
         }
+        r = vhost_vdpa_set_address_space_id(dev);
+        if (unlikely(r)) {
+            return r;
+        }
         ok = vhost_vdpa_svqs_start(dev);
         if (unlikely(!ok)) {
             return -1;
@@ -1196,21 +1252,26 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
         vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
     }
 
-    if (dev->vq_index + dev->nvqs != dev->vq_index_end) {
-        return 0;
+    vq_group_end = dev->vq_index + dev->nvqs == dev->vq_group_index_end;
+    if (vq_group_end && started) {
+        memory_listener_register(&v->listener, &address_space_memory);
     }
 
-    if (started) {
-        memory_listener_register(&v->listener, &address_space_memory);
-        return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
-    } else {
-        vhost_vdpa_reset_device(dev);
-        vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
-                                   VIRTIO_CONFIG_S_DRIVER);
-        memory_listener_unregister(&v->listener);
+    if (dev->vq_index + dev->nvqs == dev->vq_index_end) {
+        if (started) {
+            r = vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
+        } else {
+            vhost_vdpa_reset_device(dev);
+            vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
+                                       VIRTIO_CONFIG_S_DRIVER);
+        }
+    }
 
-        return 0;
+    if (vq_group_end && !started) {
+        memory_listener_unregister(&v->listener);
     }
+
+    return r;
 }
 
 static int vhost_vdpa_set_log_base(struct vhost_dev *dev, uint64_t base,
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 15c3e4f703..a6f803ea4e 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -473,8 +473,8 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
 
     if (has_cvq) {
         nc = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
-                                 vdpa_device_fd, i, 1, false, opts->x_svq,
-                                 iova_tree);
+                                 vdpa_device_fd, i, 1,
+                                 false, opts->x_svq, iova_tree);
         if (!nc)
             goto err;
     }
diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index e6fdc03514..2858deac60 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -23,10 +23,10 @@ vhost_user_postcopy_waker_found(uint64_t client_addr) "0x%"PRIx64
 vhost_user_postcopy_waker_nomatch(const char *rb, uint64_t rb_offset) "%s + 0x%"PRIx64
 
 # vhost-vdpa.c
-vhost_vdpa_dma_map(void *vdpa, int fd, uint32_t msg_type, uint64_t iova, uint64_t size, uint64_t uaddr, uint8_t perm, uint8_t type) "vdpa:%p fd: %d msg_type: %"PRIu32" iova: 0x%"PRIx64" size: 0x%"PRIx64" uaddr: 0x%"PRIx64" perm: 0x%"PRIx8" type: %"PRIu8
-vhost_vdpa_dma_unmap(void *vdpa, int fd, uint32_t msg_type, uint64_t iova, uint64_t size, uint8_t type) "vdpa:%p fd: %d msg_type: %"PRIu32" iova: 0x%"PRIx64" size: 0x%"PRIx64" type: %"PRIu8
-vhost_vdpa_listener_begin_batch(void *v, int fd, uint32_t msg_type, uint8_t type)  "vdpa:%p fd: %d msg_type: %"PRIu32" type: %"PRIu8
-vhost_vdpa_listener_commit(void *v, int fd, uint32_t msg_type, uint8_t type)  "vdpa:%p fd: %d msg_type: %"PRIu32" type: %"PRIu8
+vhost_vdpa_dma_map(void *vdpa, int fd, uint32_t msg_type, uint32_t asid, uint64_t iova, uint64_t size, uint64_t uaddr, uint8_t perm, uint8_t type) "vdpa:%p fd: %d msg_type: %"PRIu32" asid: %"PRIu32" iova: 0x%"PRIx64" size: 0x%"PRIx64" uaddr: 0x%"PRIx64" perm: 0x%"PRIx8" type: %"PRIu8
+vhost_vdpa_dma_unmap(void *vdpa, int fd, uint32_t msg_type, uint32_t asid, uint64_t iova, uint64_t size, uint8_t type) "vdpa:%p fd: %d msg_type: %"PRIu32" asid: %"PRIu32" iova: 0x%"PRIx64" size: 0x%"PRIx64" type: %"PRIu8
+vhost_vdpa_listener_begin_batch(void *v, int fd, uint32_t msg_type, uint32_t asid, uint8_t type)  "vdpa:%p fd: %d msg_type: %"PRIu32" asid: %"PRIu32" type: %"PRIu8
+vhost_vdpa_listener_commit(void *v, int fd, uint32_t msg_type, uint32_t asid, uint8_t type)  "vdpa:%p fd: %d msg_type: %"PRIu32" asid: %"PRIu32" type: %"PRIu8
 vhost_vdpa_listener_region_add(void *vdpa, uint64_t iova, uint64_t llend, void *vaddr, bool readonly) "vdpa: %p iova 0x%"PRIx64" llend 0x%"PRIx64" vaddr: %p read-only: %d"
 vhost_vdpa_listener_region_del(void *vdpa, uint64_t iova, uint64_t llend) "vdpa: %p iova 0x%"PRIx64" llend 0x%"PRIx64
 vhost_vdpa_add_status(void *dev, uint8_t status) "dev: %p status: 0x%"PRIx8
@@ -44,6 +44,7 @@ vhost_vdpa_dump_config(void *dev, const char *line) "dev: %p %s"
 vhost_vdpa_set_config(void *dev, uint32_t offset, uint32_t size, uint32_t flags) "dev: %p offset: %"PRIu32" size: %"PRIu32" flags: 0x%"PRIx32
 vhost_vdpa_get_config(void *dev, void *config, uint32_t config_len) "dev: %p config: %p config_len: %"PRIu32
 vhost_vdpa_get_vring_group(void *dev, unsigned int index, unsigned int num) "dev: %p index: %u num: %u"
+vhost_vdpa_set_vq_group_address_space_id(void *dev, unsigned int index, unsigned int num) "dev: %p index: %u num: %u"
 vhost_vdpa_dev_start(void *dev, bool started) "dev: %p started: %d"
 vhost_vdpa_set_log_base(void *dev, uint64_t base, unsigned long long size, int refcnt, int fd, void *log) "dev: %p base: 0x%"PRIx64" size: %llu refcnt: %d fd: %d log: %p"
 vhost_vdpa_set_vring_addr(void *dev, unsigned int index, unsigned int flags, uint64_t desc_user_addr, uint64_t used_user_addr, uint64_t avail_user_addr, uint64_t log_guest_addr) "dev: %p index: %u flags: 0x%x desc_user_addr: 0x%"PRIx64" used_user_addr: 0x%"PRIx64" avail_user_addr: 0x%"PRIx64" log_guest_addr: 0x%"PRIx64
-- 
2.27.0


