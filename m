Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E6452DDCF
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 21:28:41 +0200 (CEST)
Received: from localhost ([::1]:51738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrlp7-0003CE-Uw
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 15:28:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nrlb5-0005fd-BM
 for qemu-devel@nongnu.org; Thu, 19 May 2022 15:14:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nrlb2-0006Rj-CH
 for qemu-devel@nongnu.org; Thu, 19 May 2022 15:14:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652987643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aiTcdjC2t6j5hiouoPQWrXyl2OP5znNxEQhzZTT0NpM=;
 b=OxV3G7IRB61NTlt/jrt3cPzv6kC5HHutz8I68nXYGdTB12VNG7O3Ms4qMyL1me0ZvUXbrs
 Bg0dbdbZ8Qu9tVE8ZJn3va5BEO1MRAuXHSOzQHpu4RBDmH1t4JxjNuJWBpl4rhnMnCru/I
 1axVcL36quKpcf0gKTy/eN+bzZBVZxU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-65-vgTngYMQMR28pc7DQH5wWA-1; Thu, 19 May 2022 15:14:00 -0400
X-MC-Unique: vgTngYMQMR28pc7DQH5wWA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 153B11857F02;
 Thu, 19 May 2022 19:14:00 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7DD062026D6A;
 Thu, 19 May 2022 19:13:57 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gautam Dawar <gdawar@xilinx.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Cornelia Huck <cohuck@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Eric Blake <eblake@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Parav Pandit <parav@mellanox.com>
Subject: [RFC PATCH v8 17/21] vdpa: Add asid attribute to vdpa device
Date: Thu, 19 May 2022 21:13:02 +0200
Message-Id: <20220519191306.821774-18-eperezma@redhat.com>
In-Reply-To: <20220519191306.821774-1-eperezma@redhat.com>
References: <20220519191306.821774-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can configure ASID per group, but we still use asid 0 for every vdpa
device. Multiple asid support for cvq will be introduced in next
patches

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/hw/virtio/vhost.h |  1 +
 hw/net/vhost_net.c        |  1 +
 hw/virtio/vhost-vdpa.c    | 71 +++++++++++++++++++++++++++++++++++----
 hw/virtio/trace-events    |  9 ++---
 4 files changed, 72 insertions(+), 10 deletions(-)

diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index cebec1d817..eadaf055f0 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -84,6 +84,7 @@ struct vhost_dev {
     int vq_index_end;
     /* if non-zero, minimum required value for max_queues */
     int num_queues;
+    uint32_t address_space_id;
     /* Must be a vq group different than any other vhost dev */
     bool independent_vq_group;
     uint64_t features;
diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 1c2386c01c..4d79d622f7 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -348,6 +348,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
         }
 
         net = get_vhost_net(peer);
+        net->dev.address_space_id = !!cvq_idx;
         net->dev.independent_vq_group = !!cvq_idx;
         vhost_net_set_vq_index(net, i * 2, index_end);
 
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 52dd8baa8d..0208e36589 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -79,14 +79,18 @@ static int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr size,
     int ret = 0;
 
     msg.type = v->msg_type;
+    if (v->dev->backend_cap & BIT_ULL(VHOST_BACKEND_F_IOTLB_ASID)) {
+        msg.asid = v->dev->address_space_id;
+    }
     msg.iotlb.iova = iova;
     msg.iotlb.size = size;
     msg.iotlb.uaddr = (uint64_t)(uintptr_t)vaddr;
     msg.iotlb.perm = readonly ? VHOST_ACCESS_RO : VHOST_ACCESS_RW;
     msg.iotlb.type = VHOST_IOTLB_UPDATE;
 
-   trace_vhost_vdpa_dma_map(v, fd, msg.type, msg.iotlb.iova, msg.iotlb.size,
-                            msg.iotlb.uaddr, msg.iotlb.perm, msg.iotlb.type);
+    trace_vhost_vdpa_dma_map(v, fd, msg.type, msg.asid, msg.iotlb.iova,
+                             msg.iotlb.size, msg.iotlb.uaddr, msg.iotlb.perm,
+                             msg.iotlb.type);
 
     if (write(fd, &msg, sizeof(msg)) != sizeof(msg)) {
         error_report("failed to write, fd=%d, errno=%d (%s)",
@@ -104,12 +108,15 @@ static int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, hwaddr iova,
     int fd = v->device_fd;
     int ret = 0;
 
+    if (v->dev->backend_cap & BIT_ULL(VHOST_BACKEND_F_IOTLB_ASID)) {
+        msg.asid = v->dev->address_space_id;
+    }
     msg.type = v->msg_type;
     msg.iotlb.iova = iova;
     msg.iotlb.size = size;
     msg.iotlb.type = VHOST_IOTLB_INVALIDATE;
 
-    trace_vhost_vdpa_dma_unmap(v, fd, msg.type, msg.iotlb.iova,
+    trace_vhost_vdpa_dma_unmap(v, fd, msg.type, msg.asid, msg.iotlb.iova,
                                msg.iotlb.size, msg.iotlb.type);
 
     if (write(fd, &msg, sizeof(msg)) != sizeof(msg)) {
@@ -123,13 +130,19 @@ static int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, hwaddr iova,
 
 static void vhost_vdpa_listener_begin_batch(struct vhost_vdpa *v)
 {
+    struct vhost_dev *dev = v->dev;
     int fd = v->device_fd;
     struct vhost_msg_v2 msg = {
         .type = v->msg_type,
         .iotlb.type = VHOST_IOTLB_BATCH_BEGIN,
     };
 
-    trace_vhost_vdpa_listener_begin_batch(v, fd, msg.type, msg.iotlb.type);
+    if (dev->backend_cap & BIT_ULL(VHOST_BACKEND_F_IOTLB_ASID)) {
+        msg.asid = v->dev->address_space_id;
+    }
+
+    trace_vhost_vdpa_listener_begin_batch(v, fd, msg.type, msg.asid,
+                                          msg.iotlb.type);
     if (write(fd, &msg, sizeof(msg)) != sizeof(msg)) {
         error_report("failed to write, fd=%d, errno=%d (%s)",
                      fd, errno, strerror(errno));
@@ -161,10 +174,14 @@ static void vhost_vdpa_listener_commit(MemoryListener *listener)
         return;
     }
 
+    if (dev->backend_cap & BIT_ULL(VHOST_BACKEND_F_IOTLB_ASID)) {
+        msg.asid = v->dev->address_space_id;
+    }
+
     msg.type = v->msg_type;
     msg.iotlb.type = VHOST_IOTLB_BATCH_END;
-
-    trace_vhost_vdpa_listener_commit(v, fd, msg.type, msg.iotlb.type);
+    trace_vhost_vdpa_listener_commit(v, fd, msg.type, msg.asid,
+                                     msg.iotlb.type);
     if (write(fd, &msg, sizeof(msg)) != sizeof(msg)) {
         error_report("failed to write, fd=%d, errno=%d (%s)",
                      fd, errno, strerror(errno));
@@ -1183,10 +1200,48 @@ call_err:
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
     bool ok;
+    int r = 0;
+
     trace_vhost_vdpa_dev_start(dev, started);
 
     if (started) {
@@ -1195,6 +1250,10 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
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
diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index ffb8eb26e7..67adad8610 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -26,10 +26,10 @@ vhost_user_write(uint32_t req, uint32_t flags) "req:%d flags:0x%"PRIx32""
 vhost_user_create_notifier(int idx, void *n) "idx:%d n:%p"
 
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
@@ -47,6 +47,7 @@ vhost_vdpa_dump_config(void *dev, const char *line) "dev: %p %s"
 vhost_vdpa_set_config(void *dev, uint32_t offset, uint32_t size, uint32_t flags) "dev: %p offset: %"PRIu32" size: %"PRIu32" flags: 0x%"PRIx32
 vhost_vdpa_get_config(void *dev, void *config, uint32_t config_len) "dev: %p config: %p config_len: %"PRIu32
 vhost_vdpa_get_vring_group(void *dev, unsigned int index, unsigned int num) "dev: %p index: %u num: %u"
+vhost_vdpa_set_vq_group_address_space_id(void *dev, unsigned int index, unsigned int num) "dev: %p index: %u num: %u"
 vhost_vdpa_dev_start(void *dev, bool started) "dev: %p started: %d"
 vhost_vdpa_set_log_base(void *dev, uint64_t base, unsigned long long size, int refcnt, int fd, void *log) "dev: %p base: 0x%"PRIx64" size: %llu refcnt: %d fd: %d log: %p"
 vhost_vdpa_set_vring_addr(void *dev, unsigned int index, unsigned int flags, uint64_t desc_user_addr, uint64_t used_user_addr, uint64_t avail_user_addr, uint64_t log_guest_addr) "dev: %p index: %u flags: 0x%x desc_user_addr: 0x%"PRIx64" used_user_addr: 0x%"PRIx64" avail_user_addr: 0x%"PRIx64" log_guest_addr: 0x%"PRIx64
-- 
2.27.0


