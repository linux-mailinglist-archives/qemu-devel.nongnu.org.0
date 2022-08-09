Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F305558DD98
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 20:02:12 +0200 (CEST)
Received: from localhost ([::1]:60266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLTYS-0000VS-2Z
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 14:02:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oLTD1-00032w-Dw
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 13:40:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oLTCz-0007eh-9e
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 13:40:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660066800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3FsjrR35VUICwni+eOo1fTEjzVIWIjo7tm34p2LxWDM=;
 b=VoKDO8xvHTiaVm0/ih5jLbjVQcDAg1PEJI3yYHrAJHVCTkQHlDmMywYGTXN3oZtkbMzBPo
 HL+z3rirneUik/fGSrGd8zkolhz8vjFRZx57DRlK9bygeZyKeCh+XMS8cdL5GRGSvSbdtb
 DlTR9rvqj8PkcH7olEX4YoYXwNK8Oxg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-270-C6z4qa8EObyNO1lDPdLKig-1; Tue, 09 Aug 2022 13:39:57 -0400
X-MC-Unique: C6z4qa8EObyNO1lDPdLKig-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E02201824602;
 Tue,  9 Aug 2022 17:39:56 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B2679457F;
 Tue,  9 Aug 2022 17:39:53 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Jason Wang <jasowang@redhat.com>,
 Cindy Lu <lulu@redhat.com>, "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Eric Blake <eblake@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>
Subject: [PATCH v8 08/12] vdpa: Move command buffers map to start of net device
Date: Tue,  9 Aug 2022 19:39:22 +0200
Message-Id: <20220809173926.1695280-9-eperezma@redhat.com>
In-Reply-To: <20220809173926.1695280-1-eperezma@redhat.com>
References: <20220809173926.1695280-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

As this series will reuse them to restore the device state at the end of
a migration (or a device start), let's allocate only once at the device
start so we don't duplicate their map and unmap.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 123 ++++++++++++++++++++++-------------------------
 1 file changed, 58 insertions(+), 65 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 55e8a39a56..5254b58bdc 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -263,29 +263,20 @@ static size_t vhost_vdpa_net_cvq_cmd_page_len(void)
     return ROUND_UP(vhost_vdpa_net_cvq_cmd_len(), qemu_real_host_page_size());
 }
 
-/** Copy and map a guest buffer. */
-static bool vhost_vdpa_cvq_map_buf(struct vhost_vdpa *v,
-                                   const struct iovec *out_data,
-                                   size_t out_num, size_t data_len, void *buf,
-                                   size_t *written, bool write)
+/** Map CVQ buffer. */
+static int vhost_vdpa_cvq_map_buf(struct vhost_vdpa *v, void *buf, size_t size,
+                                  bool write)
 {
     DMAMap map = {};
     int r;
 
-    if (unlikely(!data_len)) {
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid legnth of %s buffer\n",
-                      __func__, write ? "in" : "out");
-        return false;
-    }
-
-    *written = iov_to_buf(out_data, out_num, 0, buf, data_len);
     map.translated_addr = (hwaddr)(uintptr_t)buf;
-    map.size = vhost_vdpa_net_cvq_cmd_page_len() - 1;
+    map.size = size - 1;
     map.perm = write ? IOMMU_RW : IOMMU_RO,
     r = vhost_iova_tree_map_alloc(v->iova_tree, &map);
     if (unlikely(r != IOVA_OK)) {
         error_report("Cannot map injected element");
-        return false;
+        return r;
     }
 
     r = vhost_vdpa_dma_map(v, map.iova, vhost_vdpa_net_cvq_cmd_page_len(), buf,
@@ -294,50 +285,58 @@ static bool vhost_vdpa_cvq_map_buf(struct vhost_vdpa *v,
         goto dma_map_err;
     }
 
-    return true;
+    return 0;
 
 dma_map_err:
     vhost_iova_tree_remove(v->iova_tree, &map);
-    return false;
+    return r;
 }
 
-/**
- * Copy the guest element into a dedicated buffer suitable to be sent to NIC
- *
- * @iov: [0] is the out buffer, [1] is the in one
- */
-static bool vhost_vdpa_net_cvq_map_elem(VhostVDPAState *s,
-                                        VirtQueueElement *elem,
-                                        struct iovec *iov)
+static int vhost_vdpa_net_cvq_start(NetClientState *nc)
 {
-    size_t in_copied;
-    bool ok;
+    VhostVDPAState *s;
+    int r;
 
-    iov[0].iov_base = s->cvq_cmd_out_buffer;
-    ok = vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, elem->out_sg, elem->out_num,
-                                vhost_vdpa_net_cvq_cmd_len(), iov[0].iov_base,
-                                &iov[0].iov_len, false);
-    if (unlikely(!ok)) {
-        return false;
+    assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
+
+    s = DO_UPCAST(VhostVDPAState, nc, nc);
+    if (!s->vhost_vdpa.shadow_vqs_enabled) {
+        return 0;
     }
 
-    iov[1].iov_base = s->cvq_cmd_in_buffer;
-    ok = vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, NULL, 0,
-                                sizeof(virtio_net_ctrl_ack), iov[1].iov_base,
-                                &in_copied, true);
-    if (unlikely(!ok)) {
+    r = vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, s->cvq_cmd_out_buffer,
+                               vhost_vdpa_net_cvq_cmd_page_len(), false);
+    if (unlikely(r < 0)) {
+        return r;
+    }
+
+    r = vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, s->cvq_cmd_in_buffer,
+                               vhost_vdpa_net_cvq_cmd_page_len(), true);
+    if (unlikely(r < 0)) {
         vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->cvq_cmd_out_buffer);
-        return false;
     }
 
-    iov[1].iov_len = sizeof(virtio_net_ctrl_ack);
-    return true;
+    return r;
+}
+
+static void vhost_vdpa_net_cvq_stop(NetClientState *nc)
+{
+    VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
+
+    assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
+
+    if (s->vhost_vdpa.shadow_vqs_enabled) {
+        vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->cvq_cmd_out_buffer);
+        vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->cvq_cmd_in_buffer);
+    }
 }
 
 static NetClientInfo net_vhost_vdpa_cvq_info = {
     .type = NET_CLIENT_DRIVER_VHOST_VDPA,
     .size = sizeof(VhostVDPAState),
     .receive = vhost_vdpa_receive,
+    .start = vhost_vdpa_net_cvq_start,
+    .stop = vhost_vdpa_net_cvq_stop,
     .cleanup = vhost_vdpa_cleanup,
     .has_vnet_hdr = vhost_vdpa_has_vnet_hdr,
     .has_ufo = vhost_vdpa_has_ufo,
@@ -348,19 +347,17 @@ static NetClientInfo net_vhost_vdpa_cvq_info = {
  * Do not forward commands not supported by SVQ. Otherwise, the device could
  * accept it and qemu would not know how to update the device model.
  */
-static bool vhost_vdpa_net_cvq_validate_cmd(const struct iovec *out,
-                                            size_t out_num)
+static bool vhost_vdpa_net_cvq_validate_cmd(const void *out_buf, size_t len)
 {
     struct virtio_net_ctrl_hdr ctrl;
-    size_t n;
 
-    n = iov_to_buf(out, out_num, 0, &ctrl, sizeof(ctrl));
-    if (unlikely(n < sizeof(ctrl))) {
+    if (unlikely(len < sizeof(ctrl))) {
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid legnth of out buffer %zu\n", __func__, n);
+                      "%s: invalid legnth of out buffer %zu\n", __func__, len);
         return false;
     }
 
+    memcpy(&ctrl, out_buf, sizeof(ctrl));
     switch (ctrl.class) {
     case VIRTIO_NET_CTRL_MAC:
         switch (ctrl.cmd) {
@@ -392,10 +389,14 @@ static int vhost_vdpa_net_handle_ctrl_avail(VhostShadowVirtqueue *svq,
     VhostVDPAState *s = opaque;
     size_t in_len, dev_written;
     virtio_net_ctrl_ack status = VIRTIO_NET_ERR;
-    /* out and in buffers sent to the device */
-    struct iovec dev_buffers[2] = {
-        { .iov_base = s->cvq_cmd_out_buffer },
-        { .iov_base = s->cvq_cmd_in_buffer },
+    /* Out buffer sent to both the vdpa device and the device model */
+    struct iovec out = {
+        .iov_base = s->cvq_cmd_out_buffer,
+    };
+    /* In buffer sent to the device */
+    const struct iovec dev_in = {
+        .iov_base = s->cvq_cmd_in_buffer,
+        .iov_len = sizeof(virtio_net_ctrl_ack),
     };
     /* in buffer used for device model */
     const struct iovec in = {
@@ -405,17 +406,15 @@ static int vhost_vdpa_net_handle_ctrl_avail(VhostShadowVirtqueue *svq,
     int r = -EINVAL;
     bool ok;
 
-    ok = vhost_vdpa_net_cvq_map_elem(s, elem, dev_buffers);
-    if (unlikely(!ok)) {
-        goto out;
-    }
-
-    ok = vhost_vdpa_net_cvq_validate_cmd(&dev_buffers[0], 1);
+    out.iov_len = iov_to_buf(elem->out_sg, elem->out_num, 0,
+                             s->cvq_cmd_out_buffer,
+                             vhost_vdpa_net_cvq_cmd_len());
+    ok = vhost_vdpa_net_cvq_validate_cmd(s->cvq_cmd_out_buffer, out.iov_len);
     if (unlikely(!ok)) {
         goto out;
     }
 
-    r = vhost_svq_add(svq, &dev_buffers[0], 1, &dev_buffers[1], 1, elem);
+    r = vhost_svq_add(svq, &out, 1, &dev_in, 1, elem);
     if (unlikely(r != 0)) {
         if (unlikely(r == -ENOSPC)) {
             qemu_log_mask(LOG_GUEST_ERROR, "%s: No space on device queue\n",
@@ -435,13 +434,13 @@ static int vhost_vdpa_net_handle_ctrl_avail(VhostShadowVirtqueue *svq,
         goto out;
     }
 
-    memcpy(&status, dev_buffers[1].iov_base, sizeof(status));
+    memcpy(&status, s->cvq_cmd_in_buffer, sizeof(status));
     if (status != VIRTIO_NET_OK) {
         goto out;
     }
 
     status = VIRTIO_NET_ERR;
-    virtio_net_handle_ctrl_iov(svq->vdev, &in, 1, dev_buffers, 1);
+    virtio_net_handle_ctrl_iov(svq->vdev, &in, 1, &out, 1);
     if (status != VIRTIO_NET_OK) {
         error_report("Bad CVQ processing in model");
     }
@@ -454,12 +453,6 @@ out:
     }
     vhost_svq_push_elem(svq, elem, MIN(in_len, sizeof(status)));
     g_free(elem);
-    if (dev_buffers[0].iov_base) {
-        vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, dev_buffers[0].iov_base);
-    }
-    if (dev_buffers[1].iov_base) {
-        vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, dev_buffers[1].iov_base);
-    }
     return r;
 }
 
-- 
2.31.1


