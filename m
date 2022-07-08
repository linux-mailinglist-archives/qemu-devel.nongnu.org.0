Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 234DE56B800
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 13:09:17 +0200 (CEST)
Received: from localhost ([::1]:47422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9lrI-0002pe-6w
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 07:09:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o9la5-0000tH-17
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 06:51:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o9la0-0008CU-SO
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 06:51:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657277484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m6U+r3QVzxO0bP7jXccVqtF6sELeaUZQi0hECAWbShs=;
 b=XcUz/Tscfwva/ojOs5pWQhu5cIEMJccLUbnud0lrOaMyZbZfByYxGEBHHXDUJHZ5y1Zosz
 L5NQvCscbpj5G6Ok5tPb4G2u2Ss94IxAR2dv5qZUirLCSSPQHOC1nSaeJY/i1aM+wAmytv
 iNSFGQUd7s5dgizSncq/wIDXPRvsUXU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-98-NBWqXNtCxbda4AtXmQg-1; Fri, 08 Jul 2022 06:51:17 -0400
X-MC-Unique: 98-NBWqXNtCxbda4AtXmQg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74AEE1C05EC1;
 Fri,  8 Jul 2022 10:51:16 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE8F01121314;
 Fri,  8 Jul 2022 10:51:13 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Cindy Lu <lulu@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Laurent Vivier <lvivier@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Parav Pandit <parav@mellanox.com>, Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH 19/22] vdpa: Buffer CVQ support on shadow virtqueue
Date: Fri,  8 Jul 2022 12:50:10 +0200
Message-Id: <20220708105013.1899854-20-eperezma@redhat.com>
In-Reply-To: <20220708105013.1899854-1-eperezma@redhat.com>
References: <20220708105013.1899854-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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

Introduce the control virtqueue support for vDPA shadow virtqueue. This
is needed for advanced networking features like rx filtering.

Virtio-net control VQ copies now the descriptors to qemu's VA, so we
avoid TOCTOU with the guest's or device's memory every time there is a
device model change. Otherwise, the guest could change the memory
content in the time between qemu and the device reads it.

Likewise, qemu does not share the memory of the command with the device:
it exposes another copy to it.

To demonstrate command handling, VIRTIO_NET_F_CTRL_MACADDR is
implemented.  If virtio-net driver changes MAC the virtio-net device
model will be updated with the new one, and a rx filtering change event
will be raised.

Others cvq commands could be added here straightforwardly but they have
been not tested.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 334 +++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 322 insertions(+), 12 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 8558ad7a01..3ae74f7fb5 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -28,6 +28,26 @@
 #include "monitor/monitor.h"
 #include "hw/virtio/vhost.h"
 
+typedef struct CVQElement {
+    /* Device's in and out buffer */
+    void *in_buf, *out_buf;
+
+    /* Optional guest element from where this cvqelement was created */
+    VirtQueueElement *guest_elem;
+
+    /* Control header sent by the guest. */
+    struct virtio_net_ctrl_hdr ctrl;
+
+    /* vhost-vdpa device, for cleanup reasons */
+    struct vhost_vdpa *vdpa;
+
+    /* Length of out data */
+    size_t out_len;
+
+    /* Copy of the out data sent by the guest excluding ctrl. */
+    uint8_t out_data[];
+} CVQElement;
+
 /* Todo:need to add the multiqueue support here */
 typedef struct VhostVDPAState {
     NetClientState nc;
@@ -191,29 +211,277 @@ static NetClientInfo net_vhost_vdpa_info = {
 };
 
 /**
- * Forward buffer for the moment.
+ * Unmap a descriptor chain of a SVQ element, optionally copying its in buffers
+ *
+ * @svq: Shadow VirtQueue
+ * @iova: SVQ IO Virtual address of descriptor
+ * @iov: Optional iovec to store device writable buffer
+ * @iov_cnt: iov length
+ * @buf_len: Length written by the device
+ *
+ * TODO: Use me! and adapt to net/vhost-vdpa format
+ * Print error message in case of error
+ */
+static void vhost_vdpa_cvq_unmap_buf(CVQElement *elem, void *addr)
+{
+    struct vhost_vdpa *v = elem->vdpa;
+    VhostIOVATree *tree = v->iova_tree;
+    DMAMap needle = {
+        /*
+         * No need to specify size or to look for more translations since
+         * this contiguous chunk was allocated by us.
+         */
+        .translated_addr = (hwaddr)(uintptr_t)addr,
+    };
+    const DMAMap *map = vhost_iova_tree_find_iova(tree, &needle);
+    int r;
+
+    if (unlikely(!map)) {
+        error_report("Cannot locate expected map");
+        goto err;
+    }
+
+    r = vhost_vdpa_dma_unmap(v, map->iova, map->size + 1);
+    if (unlikely(r != 0)) {
+        error_report("Device cannot unmap: %s(%d)", g_strerror(r), r);
+    }
+
+    vhost_iova_tree_remove(tree, map);
+
+err:
+    qemu_vfree(addr);
+}
+
+static void vhost_vdpa_cvq_delete_elem(CVQElement *elem)
+{
+    if (elem->out_buf) {
+        vhost_vdpa_cvq_unmap_buf(elem, g_steal_pointer(&elem->out_buf));
+    }
+
+    if (elem->in_buf) {
+        vhost_vdpa_cvq_unmap_buf(elem, g_steal_pointer(&elem->in_buf));
+    }
+
+    /* Guest element must have been returned to the guest or free otherway */
+    assert(!elem->guest_elem);
+
+    g_free(elem);
+}
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(CVQElement, vhost_vdpa_cvq_delete_elem);
+
+static int vhost_vdpa_net_cvq_svq_inject(VhostShadowVirtqueue *svq,
+                                         CVQElement *cvq_elem,
+                                         size_t out_len)
+{
+    const struct iovec iov[] = {
+        {
+            .iov_base = cvq_elem->out_buf,
+            .iov_len = out_len,
+        },{
+            .iov_base = cvq_elem->in_buf,
+            .iov_len = sizeof(virtio_net_ctrl_ack),
+        }
+    };
+
+    return vhost_svq_inject(svq, iov, 1, 1, cvq_elem);
+}
+
+static void *vhost_vdpa_cvq_alloc_buf(struct vhost_vdpa *v,
+                                      const uint8_t *out_data, size_t data_len,
+                                      bool write)
+{
+    DMAMap map = {};
+    size_t buf_len = ROUND_UP(data_len, qemu_real_host_page_size());
+    void *buf = qemu_memalign(qemu_real_host_page_size(), buf_len);
+    int r;
+
+    if (!write) {
+        memcpy(buf, out_data, data_len);
+        memset(buf + data_len, 0, buf_len - data_len);
+    } else {
+        memset(buf, 0, data_len);
+    }
+
+    map.translated_addr = (hwaddr)(uintptr_t)buf;
+    map.size = buf_len - 1;
+    map.perm = write ? IOMMU_RW : IOMMU_RO,
+    r = vhost_iova_tree_map_alloc(v->iova_tree, &map);
+    if (unlikely(r != IOVA_OK)) {
+        error_report("Cannot map injected element");
+        goto err;
+    }
+
+    r = vhost_vdpa_dma_map(v, map.iova, buf_len, buf, !write);
+    if (unlikely(r < 0)) {
+        goto dma_map_err;
+    }
+
+    return buf;
+
+dma_map_err:
+    vhost_iova_tree_remove(v->iova_tree, &map);
+
+err:
+    qemu_vfree(buf);
+    return NULL;
+}
+
+/**
+ * Allocate an element suitable to be injected
+ *
+ * @iov: The iovec
+ * @out_num: Number of out elements, placed first in iov
+ * @in_num: Number of in elements, placed after out ones
+ * @elem: Optional guest element from where this one was created
+ *
+ * TODO: Do we need a sg for out_num? I think not
+ */
+static CVQElement *vhost_vdpa_cvq_alloc_elem(VhostVDPAState *s,
+                                             struct virtio_net_ctrl_hdr ctrl,
+                                             const struct iovec *out_sg,
+                                             size_t out_num, size_t out_size,
+                                             VirtQueueElement *elem)
+{
+    g_autoptr(CVQElement) cvq_elem = g_malloc(sizeof(CVQElement) + out_size);
+    g_autofree VirtQueueElement *guest_elem = elem;
+    uint8_t *out_cursor = cvq_elem->out_data;
+    struct vhost_vdpa *v = &s->vhost_vdpa;
+
+    /* Start with a clean base */
+    memset(cvq_elem, 0, sizeof(*cvq_elem));
+    cvq_elem->vdpa = &s->vhost_vdpa;
+
+    /*
+     * Linearize element. If guest had a descriptor chain, we expose the device
+     * a single buffer.
+     */
+    cvq_elem->out_len = out_size;
+    memcpy(out_cursor, &ctrl, sizeof(ctrl));
+    out_size -= sizeof(ctrl);
+    out_cursor += sizeof(ctrl);
+    iov_to_buf(out_sg, out_num, 0, out_cursor, out_size);
+
+    cvq_elem->out_buf = vhost_vdpa_cvq_alloc_buf(v, cvq_elem->out_data,
+                                                 out_size, false);
+    if (unlikely(!cvq_elem->out_buf)) {
+        return NULL;
+    }
+
+    cvq_elem->in_buf = vhost_vdpa_cvq_alloc_buf(v, NULL,
+                                                sizeof(virtio_net_ctrl_ack),
+                                                true);
+    if (unlikely(!cvq_elem->in_buf)) {
+        return NULL;
+    }
+
+    cvq_elem->guest_elem = g_steal_pointer(&guest_elem);
+    cvq_elem->ctrl = ctrl;
+    return g_steal_pointer(&cvq_elem);
+}
+
+/**
+ * iov_size with an upper limit. It's assumed UINT64_MAX is an invalid
+ * iov_size.
+ */
+static uint64_t vhost_vdpa_net_iov_len(const struct iovec *iov,
+                                       unsigned int iov_cnt, size_t max)
+{
+    uint64_t len = 0;
+
+    for (unsigned int i = 0; len < max && i < iov_cnt; i++) {
+        bool overflow = uadd64_overflow(iov[i].iov_len, len, &len);
+        if (unlikely(overflow)) {
+            return UINT64_MAX;
+        }
+    }
+
+    return len;
+}
+
+static CVQElement *vhost_vdpa_net_cvq_copy_elem(VhostVDPAState *s,
+                                                VirtQueueElement *elem)
+{
+    struct virtio_net_ctrl_hdr ctrl;
+    g_autofree struct iovec *iov = NULL;
+    struct iovec *iov2;
+    unsigned int out_num = elem->out_num;
+    size_t n, out_size = 0;
+
+    /* TODO: in buffer MUST have only a single entry with a char? size */
+    if (unlikely(vhost_vdpa_net_iov_len(elem->in_sg, elem->in_num,
+                                        sizeof(virtio_net_ctrl_ack))
+                                              < sizeof(virtio_net_ctrl_ack))) {
+        return NULL;
+    }
+
+    n = iov_to_buf(elem->out_sg, out_num, 0, &ctrl, sizeof(ctrl));
+    if (unlikely(n != sizeof(ctrl))) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid out size\n", __func__);
+        return NULL;
+    }
+
+    iov = iov2 = g_memdup2(elem->out_sg, sizeof(struct iovec) * elem->out_num);
+    iov_discard_front(&iov2, &out_num, sizeof(ctrl));
+    switch (ctrl.class) {
+    case VIRTIO_NET_CTRL_MAC:
+        switch (ctrl.cmd) {
+        case VIRTIO_NET_CTRL_MAC_ADDR_SET:
+            if (likely(vhost_vdpa_net_iov_len(iov2, out_num, 6))) {
+                out_size += 6;
+                break;
+            }
+
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid mac size\n", __func__);
+            return NULL;
+        default:
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid mac cmd %u\n",
+                          __func__, ctrl.cmd);
+            return NULL;
+        };
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid control class %u\n",
+                      __func__, ctrl.class);
+        return NULL;
+    };
+
+    return vhost_vdpa_cvq_alloc_elem(s, ctrl, iov2, out_num,
+                                     sizeof(ctrl) + out_size, elem);
+}
+
+/**
+ * Validate and copy control virtqueue commands.
+ *
+ * Following QEMU guidelines, we offer a copy of the buffers to the device to
+ * prevent TOCTOU bugs.  This functions check that the buffers length are
+ * expected too.
  */
 static bool vhost_vdpa_net_handle_ctrl_avail(VhostShadowVirtqueue *svq,
                                              VirtQueueElement *guest_elem,
                                              void *opaque)
 {
+    VhostVDPAState *s = opaque;
+    g_autoptr(CVQElement) cvq_elem = NULL;
     g_autofree VirtQueueElement *elem = guest_elem;
-    unsigned int n = elem->out_num + elem->in_num;
-    g_autofree struct iovec *iov = g_new(struct iovec, n);
-    size_t in_len;
+    size_t out_size, in_len;
     virtio_net_ctrl_ack status = VIRTIO_NET_ERR;
     int r;
 
-    memcpy(iov, elem->out_sg, elem->out_num);
-    memcpy(iov + elem->out_num, elem->in_sg, elem->in_num);
+    cvq_elem = vhost_vdpa_net_cvq_copy_elem(s, elem);
+    if (unlikely(!cvq_elem)) {
+        goto err;
+    }
 
-    r = vhost_svq_inject(svq, iov, elem->out_num, elem->in_num, elem);
+    /* out size validated at vhost_vdpa_net_cvq_copy_elem */
+    out_size = iov_size(elem->out_sg, elem->out_num);
+    r = vhost_vdpa_net_cvq_svq_inject(svq, cvq_elem, out_size);
     if (unlikely(r != 0)) {
         goto err;
     }
 
-    /* Now elem belongs to SVQ */
-    g_steal_pointer(&elem);
+    cvq_elem->guest_elem = g_steal_pointer(&elem);
+    /* Now CVQ elem belongs to SVQ */
+    g_steal_pointer(&cvq_elem);
     return true;
 
 err:
@@ -225,15 +493,57 @@ err:
 
 static VirtQueueElement *vhost_vdpa_net_handle_ctrl_detach(void *elem_opaque)
 {
-    return elem_opaque;
+    g_autoptr(CVQElement) cvq_elem = elem_opaque;
+    return g_steal_pointer(&cvq_elem->guest_elem);
 }
 
 static void vhost_vdpa_net_handle_ctrl_used(VhostShadowVirtqueue *svq,
                                             void *vq_elem_opaque,
                                             uint32_t dev_written)
 {
-    g_autofree VirtQueueElement *guest_elem = vq_elem_opaque;
-    vhost_svq_push_elem(svq, guest_elem, sizeof(virtio_net_ctrl_ack));
+    g_autoptr(CVQElement) cvq_elem = vq_elem_opaque;
+    virtio_net_ctrl_ack status = VIRTIO_NET_ERR;
+    const struct iovec out = {
+        .iov_base = cvq_elem->out_data,
+        .iov_len = cvq_elem->out_len,
+    };
+    const struct iovec in = {
+        .iov_base = &status,
+        .iov_len = sizeof(status),
+    };
+    g_autofree VirtQueueElement *guest_elem = NULL;
+
+    if (unlikely(dev_written < sizeof(status))) {
+        error_report("Insufficient written data (%llu)",
+                     (long long unsigned)dev_written);
+        goto out;
+    }
+
+    switch (cvq_elem->ctrl.class) {
+    case VIRTIO_NET_CTRL_MAC_ADDR_SET:
+        break;
+    default:
+        error_report("Unexpected ctrl class %u", cvq_elem->ctrl.class);
+        goto out;
+    };
+
+    memcpy(&status, cvq_elem->in_buf, sizeof(status));
+    if (status != VIRTIO_NET_OK) {
+        goto out;
+    }
+
+    status = VIRTIO_NET_ERR;
+    virtio_net_handle_ctrl_iov(svq->vdev, &in, 1, &out, 1);
+    if (status != VIRTIO_NET_OK) {
+        error_report("Bad CVQ processing in model");
+        goto out;
+    }
+
+out:
+    guest_elem = g_steal_pointer(&cvq_elem->guest_elem);
+    iov_from_buf(guest_elem->in_sg, guest_elem->in_num, 0, &status,
+                 sizeof(status));
+    vhost_svq_push_elem(svq, guest_elem, sizeof(status));
 }
 
 static const VhostShadowVirtqueueOps vhost_vdpa_net_svq_ops = {
-- 
2.31.1


