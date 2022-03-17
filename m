Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 461F64DCDE5
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 19:49:33 +0100 (CET)
Received: from localhost ([::1]:35474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUvBk-00063q-B3
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 14:49:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nUuo4-0001Q7-MF
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 14:25:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nUuo2-0006Db-Ne
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 14:25:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647541502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jm9CSuoNBVFc0RS5uG9jeyenGVAdiuZSmP7TrosYivs=;
 b=ABjPrBi2vME5UTibmV+VBrDWSGMyOXApCXFVuwd80WGdAUj3eZLQ2qpmerLuUxTZ/Lalg0
 KylrDGMJ06uG6Vbt2rm/Auj/yVWfEHi2GmcaFG+gpp4MxeUwvTDuaaeCE9waKYVD0jFTsg
 sWIUqunyot4mII0JcwOLKKXGmNYmRYA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-2-NSLT1xKsPuq5qeu2NOxKhw-1; Thu, 17 Mar 2022 14:24:59 -0400
X-MC-Unique: NSLT1xKsPuq5qeu2NOxKhw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8137429AA2EB;
 Thu, 17 Mar 2022 18:24:58 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DD8561454539;
 Thu, 17 Mar 2022 18:24:55 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 17/18] vdpa: Add asid attribute to vdpa device
Date: Thu, 17 Mar 2022 19:23:58 +0100
Message-Id: <20220317182400.651508-18-eperezma@redhat.com>
In-Reply-To: <20220317182400.651508-1-eperezma@redhat.com>
References: <20220317182400.651508-1-eperezma@redhat.com>
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
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Harpreet Singh Anand <hanand@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Liuxiangdong <liuxiangdong5@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can configure ASID per group, but we still use asid 0 for every vdpa
device. Multiple asid support for cvq will be introduced in next
patches.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/hw/virtio/vhost-vdpa.h |  3 +++
 hw/virtio/vhost-vdpa.c         | 47 ++++++++++++++++++++++++----------
 net/vhost-vdpa.c               | 10 ++++++--
 3 files changed, 45 insertions(+), 15 deletions(-)

diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index f1ba46a860..921edbf77b 100644
--- a/include/hw/virtio/vhost-vdpa.h
+++ b/include/hw/virtio/vhost-vdpa.h
@@ -28,10 +28,13 @@ typedef struct vhost_vdpa {
     int device_fd;
     int index;
     uint32_t msg_type;
+    uint32_t asid;
     bool iotlb_batch_begin_sent;
     MemoryListener listener;
     struct vhost_vdpa_iova_range iova_range;
     uint64_t acked_features;
+    /* one past the last vq index of this virtqueue group */
+    int vq_group_index_end;
     bool shadow_vqs_enabled;
     /* IOVA mapping used by the Shadow Virtqueue */
     VhostIOVATree *iova_tree;
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 600d006d6e..bd06662cee 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -79,6 +79,9 @@ static int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr size,
     int ret = 0;
 
     msg.type = v->msg_type;
+    if (v->dev->backend_cap & BIT_ULL(VHOST_BACKEND_F_IOTLB_ASID)) {
+        msg.asid = v->asid;
+    }
     msg.iotlb.iova = iova;
     msg.iotlb.size = size;
     msg.iotlb.uaddr = (uint64_t)(uintptr_t)vaddr;
@@ -104,6 +107,9 @@ static int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, hwaddr iova,
     int fd = v->device_fd;
     int ret = 0;
 
+    if (v->dev->backend_cap & BIT_ULL(VHOST_BACKEND_F_IOTLB_ASID)) {
+        msg.asid = v->asid;
+    }
     msg.type = v->msg_type;
     msg.iotlb.iova = iova;
     msg.iotlb.size = size;
@@ -129,6 +135,10 @@ static void vhost_vdpa_listener_begin_batch(struct vhost_vdpa *v)
         .iotlb.type = VHOST_IOTLB_BATCH_BEGIN,
     };
 
+    if (v->dev->backend_cap & BIT_ULL(VHOST_BACKEND_F_IOTLB_ASID)) {
+        msg.asid = v->asid;
+    }
+
     if (write(fd, &msg, sizeof(msg)) != sizeof(msg)) {
         error_report("failed to write, fd=%d, errno=%d (%s)",
                      fd, errno, strerror(errno));
@@ -161,6 +171,9 @@ static void vhost_vdpa_listener_commit(MemoryListener *listener)
     }
 
     msg.type = v->msg_type;
+    if (dev->backend_cap & (0x1ULL << VHOST_BACKEND_F_IOTLB_ASID)) {
+        msg.asid = v->asid;
+    }
     msg.iotlb.type = VHOST_IOTLB_BATCH_END;
 
     if (write(fd, &msg, sizeof(msg)) != sizeof(msg)) {
@@ -675,7 +688,8 @@ static int vhost_vdpa_set_backend_cap(struct vhost_dev *dev)
 {
     uint64_t features;
     uint64_t f = 0x1ULL << VHOST_BACKEND_F_IOTLB_MSG_V2 |
-        0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH;
+        0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH |
+        0x1ULL << VHOST_BACKEND_F_IOTLB_ASID;
     int r;
 
     if (vhost_vdpa_call(dev, VHOST_GET_BACKEND_FEATURES, &features)) {
@@ -1098,7 +1112,9 @@ static bool vhost_vdpa_svqs_stop(struct vhost_dev *dev)
 static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
 {
     struct vhost_vdpa *v = dev->opaque;
-    bool ok;
+    bool vq_group_end, ok;
+    int r = 0;
+
     trace_vhost_vdpa_dev_start(dev, started);
 
     if (started) {
@@ -1116,21 +1132,26 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
         vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
     }
 
-    if (dev->vq_index + dev->nvqs != dev->vq_index_end) {
-        return 0;
+    vq_group_end = dev->vq_index + dev->nvqs == v->vq_group_index_end;
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
index 6dc0ae8614..fae9a43b86 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -323,6 +323,8 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
                                        int vdpa_device_fd,
                                        int queue_pair_index,
                                        int nvqs,
+                                       uint32_t asid,
+                                       int vq_group_end,
                                        bool is_datapath,
                                        bool svq,
                                        VhostIOVATree *iova_tree)
@@ -344,6 +346,8 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
     s->vhost_vdpa.device_fd = vdpa_device_fd;
     s->vhost_vdpa.index = queue_pair_index;
     s->vhost_vdpa.shadow_vqs_enabled = svq;
+    s->vhost_vdpa.vq_group_index_end = vq_group_end;
+    s->vhost_vdpa.asid = asid;
     if (!is_datapath) {
         s->vhost_vdpa.shadow_vq_ops = &vhost_vdpa_net_svq_ops;
     }
@@ -454,7 +458,8 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
 
     for (i = 0; i < queue_pairs; i++) {
         ncs[i] = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
-                                     vdpa_device_fd, i, 2, true, opts->x_svq,
+                                     vdpa_device_fd, i, 2, 0,
+                                     queue_pairs + has_cvq, true, opts->x_svq,
                                      iova_tree);
         if (!ncs[i])
             goto err;
@@ -462,7 +467,8 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
 
     if (has_cvq) {
         nc = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
-                                 vdpa_device_fd, i, 1, false, opts->x_svq,
+                                 vdpa_device_fd, i, 1, 0,
+                                 queue_pairs + has_cvq, false, opts->x_svq,
                                  iova_tree);
         if (!nc)
             goto err;
-- 
2.27.0


