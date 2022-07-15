Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3565F576630
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 19:38:50 +0200 (CEST)
Received: from localhost ([::1]:36688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCPH7-0006rG-48
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 13:38:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oCOyZ-00060x-TO
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 13:19:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oCOyW-0005wi-Qw
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 13:19:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657905575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hUMS8Ss2bLBWFkMg86cs0CTf8NmhtFszeCU06faAvQI=;
 b=PCSJfsZnxUIRBwzEdda1TWF5a3zcRFegq8u2cg9wIi9F5FNEnqDujARbyCYzPEyKFYM7k3
 xg6poef0JYYXt8CzQDBIlJMxkWBkY3XqgKrwPUeRVPJc9TjwKK3Bi5w+VJmZO8gtkM1DWE
 MGYvGJRJtOkRmgLu99ZwLHWQjUz9JpQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-sFS5vFXVMv64XjzqULhxjA-1; Fri, 15 Jul 2022 13:19:31 -0400
X-MC-Unique: sFS5vFXVMv64XjzqULhxjA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 16F4629AB44B;
 Fri, 15 Jul 2022 17:19:31 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2683440E8B04;
 Fri, 15 Jul 2022 17:19:27 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eli Cohen <eli@mellanox.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Parav Pandit <parav@mellanox.com>,
 Markus Armbruster <armbru@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Laurent Vivier <lvivier@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Eric Blake <eblake@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 16/19] vdpa: Buffer CVQ support on shadow virtqueue
Date: Fri, 15 Jul 2022 19:18:31 +0200
Message-Id: <20220715171834.2666455-17-eperezma@redhat.com>
In-Reply-To: <20220715171834.2666455-1-eperezma@redhat.com>
References: <20220715171834.2666455-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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

Virtio-net control VQ copies the descriptors to qemu's VA, so we avoid
TOCTOU with the guest's or device's memory every time there is a device
model change.  Otherwise, the guest could change the memory content in
the time between qemu and the device read it.

To demonstrate command handling, VIRTIO_NET_F_CTRL_MACADDR is
implemented.  If the virtio-net driver changes MAC the virtio-net device
model will be updated with the new one, and a rx filtering change event
will be raised.

More cvq commands could be added here straightforwardly but they have
not been tested.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 211 +++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 204 insertions(+), 7 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 2e3b6b10d8..3915b148c4 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -33,6 +33,9 @@ typedef struct VhostVDPAState {
     NetClientState nc;
     struct vhost_vdpa vhost_vdpa;
     VHostNetState *vhost_net;
+
+    /* Control commands shadow buffers */
+    void *cvq_cmd_out_buffer, *cvq_cmd_in_buffer;
     bool started;
 } VhostVDPAState;
 
@@ -131,6 +134,8 @@ static void vhost_vdpa_cleanup(NetClientState *nc)
 {
     VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
 
+    qemu_vfree(s->cvq_cmd_out_buffer);
+    qemu_vfree(s->cvq_cmd_in_buffer);
     if (s->vhost_net) {
         vhost_net_cleanup(s->vhost_net);
         g_free(s->vhost_net);
@@ -190,24 +195,191 @@ static NetClientInfo net_vhost_vdpa_info = {
         .check_peer_type = vhost_vdpa_check_peer_type,
 };
 
+static void vhost_vdpa_cvq_unmap_buf(struct vhost_vdpa *v, void *addr)
+{
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
+        return;
+    }
+
+    r = vhost_vdpa_dma_unmap(v, map->iova, map->size + 1);
+    if (unlikely(r != 0)) {
+        error_report("Device cannot unmap: %s(%d)", g_strerror(r), r);
+    }
+
+    vhost_iova_tree_remove(tree, map);
+}
+
+static size_t vhost_vdpa_net_cvq_cmd_len(void)
+{
+    /*
+     * MAC_TABLE_SET is the ctrl command that produces the longer out buffer.
+     * In buffer is always 1 byte, so it should fit here
+     */
+    return sizeof(struct virtio_net_ctrl_hdr) +
+           2 * sizeof(struct virtio_net_ctrl_mac) +
+           MAC_TABLE_ENTRIES * ETH_ALEN;
+}
+
+static size_t vhost_vdpa_net_cvq_cmd_page_len(void)
+{
+    return ROUND_UP(vhost_vdpa_net_cvq_cmd_len(), qemu_real_host_page_size());
+}
+
+/** Copy and map a guest buffer. */
+static bool vhost_vdpa_cvq_map_buf(struct vhost_vdpa *v,
+                                   const struct iovec *out_data,
+                                   size_t out_num, size_t data_len, void *buf,
+                                   size_t *written, bool write)
+{
+    DMAMap map = {};
+    int r;
+
+    if (unlikely(!data_len)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid legnth of %s buffer\n",
+                      __func__, write ? "in" : "out");
+        return false;
+    }
+
+    *written = iov_to_buf(out_data, out_num, 0, buf, data_len);
+    map.translated_addr = (hwaddr)(uintptr_t)buf;
+    map.size = vhost_vdpa_net_cvq_cmd_page_len() - 1;
+    map.perm = write ? IOMMU_RW : IOMMU_RO,
+    r = vhost_iova_tree_map_alloc(v->iova_tree, &map);
+    if (unlikely(r != IOVA_OK)) {
+        error_report("Cannot map injected element");
+        return false;
+    }
+
+    r = vhost_vdpa_dma_map(v, map.iova, vhost_vdpa_net_cvq_cmd_page_len(), buf,
+                           !write);
+    if (unlikely(r < 0)) {
+        goto dma_map_err;
+    }
+
+    return true;
+
+dma_map_err:
+    vhost_iova_tree_remove(v->iova_tree, &map);
+    return false;
+}
+
 /**
- * Forward buffer for the moment.
+ * Copy the guest element into a dedicated buffer suitable to be sent to NIC
+ *
+ * @iov: [0] is the out buffer, [1] is the in one
+ */
+static bool vhost_vdpa_net_cvq_map_elem(VhostVDPAState *s,
+                                        VirtQueueElement *elem,
+                                        struct iovec *iov)
+{
+    size_t in_copied;
+    bool ok;
+
+    iov[0].iov_base = s->cvq_cmd_out_buffer;
+    ok = vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, elem->out_sg, elem->out_num,
+                                vhost_vdpa_net_cvq_cmd_len(), iov[0].iov_base,
+                                &iov[0].iov_len, false);
+    if (unlikely(!ok)) {
+        return false;
+    }
+
+    iov[1].iov_base = s->cvq_cmd_in_buffer;
+    ok = vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, NULL, 0,
+                                sizeof(virtio_net_ctrl_ack), iov[1].iov_base,
+                                &in_copied, true);
+    if (unlikely(!ok)) {
+        vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->cvq_cmd_out_buffer);
+        return false;
+    }
+
+    iov[1].iov_len = sizeof(virtio_net_ctrl_ack);
+    return true;
+}
+
+/**
+ * Do not forward commands not supported by SVQ. Otherwise, the device could
+ * accept it and qemu would not know how to update the device model.
+ */
+static bool vhost_vdpa_net_cvq_validate_cmd(const struct iovec *out,
+                                            size_t out_num)
+{
+    struct virtio_net_ctrl_hdr ctrl;
+    size_t n;
+
+    n = iov_to_buf(out, out_num, 0, &ctrl, sizeof(ctrl));
+    if (unlikely(n < sizeof(ctrl))) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid legnth of out buffer %zu\n", __func__, n);
+        return false;
+    }
+
+    switch (ctrl.class) {
+    case VIRTIO_NET_CTRL_MAC:
+        switch (ctrl.cmd) {
+        case VIRTIO_NET_CTRL_MAC_ADDR_SET:
+            return true;
+        default:
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid mac cmd %u\n",
+                          __func__, ctrl.cmd);
+        };
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid control class %u\n",
+                      __func__, ctrl.class);
+    };
+
+    return false;
+}
+
+/**
+ * Validate and copy control virtqueue commands.
+ *
+ * Following QEMU guidelines, we offer a copy of the buffers to the device to
+ * prevent TOCTOU bugs.
  */
 static int vhost_vdpa_net_handle_ctrl_avail(VhostShadowVirtqueue *svq,
                                             VirtQueueElement *elem,
                                             void *opaque)
 {
-    unsigned int n = elem->out_num + elem->in_num;
-    g_autofree struct iovec *dev_buffers = g_new(struct iovec, n);
+    VhostVDPAState *s = opaque;
     size_t in_len, dev_written;
     virtio_net_ctrl_ack status = VIRTIO_NET_ERR;
+    /* out and in buffers sent to the device */
+    struct iovec dev_buffers[2] = {
+        { .iov_base = s->cvq_cmd_out_buffer },
+        { .iov_base = s->cvq_cmd_in_buffer },
+    };
+    /* in buffer used for device model */
+    const struct iovec in = {
+        .iov_base = &status,
+        .iov_len = sizeof(status),
+    };
     int r;
+    bool ok;
 
-    memcpy(dev_buffers, elem->out_sg, elem->out_num);
-    memcpy(dev_buffers + elem->out_num, elem->in_sg, elem->in_num);
+    ok = vhost_vdpa_net_cvq_map_elem(s, elem, dev_buffers);
+    if (unlikely(!ok)) {
+        goto out;
+    }
 
-    r = vhost_svq_add(svq, &dev_buffers[0], elem->out_num, &dev_buffers[1],
-                      elem->in_num, elem);
+    ok = vhost_vdpa_net_cvq_validate_cmd(&dev_buffers[0], 1);
+    if (unlikely(!ok)) {
+        goto out;
+    }
+
+    r = vhost_svq_add(svq, &dev_buffers[0], 1, &dev_buffers[1], 1, elem);
     if (unlikely(r != 0)) {
         if (unlikely(r == -ENOSPC)) {
             qemu_log_mask(LOG_GUEST_ERROR, "%s: No space on device queue\n",
@@ -224,6 +396,18 @@ static int vhost_vdpa_net_handle_ctrl_avail(VhostShadowVirtqueue *svq,
     dev_written = vhost_svq_poll(svq);
     if (unlikely(dev_written < sizeof(status))) {
         error_report("Insufficient written data (%zu)", dev_written);
+        goto out;
+    }
+
+    memcpy(&status, dev_buffers[1].iov_base, sizeof(status));
+    if (status != VIRTIO_NET_OK) {
+        goto out;
+    }
+
+    status = VIRTIO_NET_ERR;
+    virtio_net_handle_ctrl_iov(svq->vdev, &in, 1, dev_buffers, 1);
+    if (status != VIRTIO_NET_OK) {
+        error_report("Bad CVQ processing in model");
     }
 
 out:
@@ -234,6 +418,12 @@ out:
     }
     vhost_svq_push_elem(svq, elem, MIN(in_len, sizeof(status)));
     g_free(elem);
+    if (dev_buffers[0].iov_base) {
+        vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, dev_buffers[0].iov_base);
+    }
+    if (dev_buffers[1].iov_base) {
+        vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, dev_buffers[1].iov_base);
+    }
     return r;
 }
 
@@ -266,6 +456,13 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
     s->vhost_vdpa.device_fd = vdpa_device_fd;
     s->vhost_vdpa.index = queue_pair_index;
     if (!is_datapath) {
+        s->cvq_cmd_out_buffer = qemu_memalign(qemu_real_host_page_size(),
+                                            vhost_vdpa_net_cvq_cmd_page_len());
+        memset(s->cvq_cmd_out_buffer, 0, vhost_vdpa_net_cvq_cmd_page_len());
+        s->cvq_cmd_in_buffer = qemu_memalign(qemu_real_host_page_size(),
+                                            vhost_vdpa_net_cvq_cmd_page_len());
+        memset(s->cvq_cmd_in_buffer, 0, vhost_vdpa_net_cvq_cmd_page_len());
+
         s->vhost_vdpa.shadow_vq_ops = &vhost_vdpa_net_svq_ops;
         s->vhost_vdpa.shadow_vq_ops_opaque = s;
     }
-- 
2.31.1


