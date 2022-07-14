Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DA35754CC
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 20:18:14 +0200 (CEST)
Received: from localhost ([::1]:35482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC3Pi-0005Q0-2U
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 14:18:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oC3N2-0002aG-NS
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:15:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oC3My-00088L-C2
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:15:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657822523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=PbbzDdWvImk5jrECfSxmv0XnAkpcrUDq6S1Z+Ttu670=;
 b=B+dn4VQ29NbA0IF9kQALQ06elpYbRpbCKMUabs6sUO39OYmmp84kxWr2X5LHOaxHGv6P2f
 x/bVUU/IssdFl03NXLYEjIeCio6NdpyhHTVgDPGTlAyFr4cwzCyCjmhzbN0Gdf7mi2rcjK
 4u895hnmB5Rcq0P6MbmOCo7AnPj6Jl4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-601-4ZVReUd8PGeCXb4tlUFb6Q-1; Thu, 14 Jul 2022 14:15:22 -0400
X-MC-Unique: 4ZVReUd8PGeCXb4tlUFb6Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BB2501C05135
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 18:15:21 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 02B60140EBE3;
 Thu, 14 Jul 2022 18:15:20 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: [RFC] vhost: Move svq avail handler to virtio_net_handle_ctrl
Date: Thu, 14 Jul 2022 20:15:18 +0200
Message-Id: <20220714181518.2562331-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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

DO NOT MERGE THIS RFC

... so we can evaluate if it is worth to move.

Answering [1].

It basically makes SVQ work in two different modes:
* data virtqueues works with the SVQ loop, intercepting guest's kicks
and device's call.
* CVQ does not move to that. Instead
  - It "forbid" to vhost-dev to register guest notifier
  - VirtIONet need to know about SVQ, making it possible to use the
    external functions _add, _push...

The idea is good and it would avoid to add callbacks to SVQ, but
VirtIONet should use SVQ in a different way than routing through
vhost-vdpa. Also, we are playing (more) with the guest to host
notifiers, giving vhost devices a new status (started but guest
notifications go to queue handler directly).

SVQ would start working very differently depending if we are using from
the data vqs or the control one, so we need to make it easier to use
correctly. We could start doing that for the next development cycle so
we keep VirtIONet not knowing about SVQ for this one, and have more time
to test.

To provide SVQ to VirtIONet should be easy, probably adding a
VhostShadowVirtqueue cvq_svq member to VirtIONet.

Comments are welcome, thanks!

[1] https://lists.gnu.org/archive/html/qemu-devel/2022-07/msg02640.html
---
 include/hw/virtio/vhost.h |  2 ++
 hw/net/vhost_net.c        |  6 +++++-
 hw/net/virtio-net.c       | 23 ++++++++++++++++++++---
 hw/virtio/vhost-vdpa.c    |  8 +++++++-
 hw/virtio/vhost.c         |  8 ++++++++
 net/vhost-vdpa.c          | 22 +++++++++++++++-------
 6 files changed, 57 insertions(+), 12 deletions(-)

diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index a346f23d13..634fd1bb25 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -85,6 +85,8 @@ struct vhost_dev {
     int vq_index_end;
     /* if non-zero, minimum required value for max_queues */
     int num_queues;
+    /* Disable acquiring the host notifiers */
+    bool not_enable_notifiers;
     uint64_t features;
     uint64_t acked_features;
     uint64_t backend_features;
diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index ccac5b7a64..70cec99960 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -367,10 +367,14 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
     for (i = 0; i < nvhosts; i++) {
         if (i < data_queue_pairs) {
             peer = qemu_get_peer(ncs, i);
+            net = get_vhost_net(peer);
+            net->dev.not_enable_notifiers = false;
         } else {
             peer = qemu_get_peer(ncs, n->max_queue_pairs);
+            net = get_vhost_net(peer);
+            net->dev.not_enable_notifiers = true;
         }
-        r = vhost_net_start_one(get_vhost_net(peer), dev);
+        r = vhost_net_start_one(net, dev);
 
         if (r < 0) {
             goto err_start;
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index dd0d056fde..52883b5f0e 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -46,6 +46,7 @@
 #include "net_rx_pkt.h"
 #include "hw/virtio/vhost.h"
 #include "sysemu/qtest.h"
+#include "hw/virtio/vhost-vdpa.h"
 
 #define VIRTIO_NET_VM_VERSION    11
 
@@ -1476,17 +1477,33 @@ size_t virtio_net_handle_ctrl_iov(VirtIODevice *vdev,
     return sizeof(status);
 }
 
+typedef struct VhostVDPAState {
+    NetClientState nc;
+    struct vhost_vdpa vhost_vdpa;
+    VHostNetState *vhost_net;
+
+    /* Control commands shadow buffers */
+    void *cvq_cmd_out_buffer, *cvq_cmd_in_buffer;
+    bool started;
+} VhostVDPAState;
+extern VhostVDPAState *cvq_s;
+int vhost_vdpa_net_handle_ctrl_avail(VhostShadowVirtqueue *svq,
+                                            SVQElement *svq_elem, void *opaque);
 static void virtio_net_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
 {
-    VirtQueueElement *elem;
+    SVQElement *svq_elem;
 
     for (;;) {
         size_t written;
-        elem = virtqueue_pop(vq, sizeof(VirtQueueElement));
-        if (!elem) {
+        svq_elem = virtqueue_pop(vq, sizeof(SVQElement));
+        if (!svq_elem) {
             break;
         }
 
+        VhostShadowVirtqueue *svq = g_ptr_array_index(cvq_s->vhost_vdpa.shadow_vqs, 0);
+        vhost_vdpa_net_handle_ctrl_avail(svq, svq_elem, cvq_s);
+
+        VirtQueueElement *elem = &svq_elem->elem;
         written = virtio_net_handle_ctrl_iov(vdev, elem->in_sg, elem->in_num,
                                              elem->out_sg, elem->out_num);
         if (written > 0) {
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 795ed5a049..33aace6e7c 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -1222,10 +1222,16 @@ static int vhost_vdpa_set_vring_kick(struct vhost_dev *dev,
 {
     struct vhost_vdpa *v = dev->opaque;
     int vdpa_idx = file->index - dev->vq_index;
+    struct vhost_vring_file file2 = *file;
+
+    if (dev->not_enable_notifiers) {
+        /* We don't want to route this ever */
+        file2.fd = -1;
+    }
 
     if (v->shadow_vqs_enabled) {
         VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, vdpa_idx);
-        vhost_svq_set_svq_kick_fd(svq, file->fd);
+        vhost_svq_set_svq_kick_fd(svq, file2.fd);
         return 0;
     } else {
         return vhost_vdpa_set_vring_dev_kick(dev, file);
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 0827d631c0..414567c9b1 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1503,6 +1503,10 @@ int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev)
     BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
     int i, r, e;
 
+    if (hdev->not_enable_notifiers) {
+        return 0;
+    }
+
     /* We will pass the notifiers to the kernel, make sure that QEMU
      * doesn't interfere.
      */
@@ -1547,6 +1551,10 @@ void vhost_dev_disable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev)
     BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
     int i, r;
 
+    if (hdev->not_enable_notifiers) {
+        return;
+    }
+
     for (i = 0; i < hdev->nvqs; ++i) {
         r = virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), hdev->vq_index + i,
                                          false);
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 85148a5114..8b5e974d16 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -375,7 +375,9 @@ static bool vhost_vdpa_net_cvq_validate_cmd(const struct iovec *out,
  * Following QEMU guidelines, we offer a copy of the buffers to the device to
  * prevent TOCTOU bugs.
  */
-static int vhost_vdpa_net_handle_ctrl_avail(VhostShadowVirtqueue *svq,
+int vhost_vdpa_net_handle_ctrl_avail(VhostShadowVirtqueue *svq,
+                                            SVQElement *svq_elem, void *opaque);
+int vhost_vdpa_net_handle_ctrl_avail(VhostShadowVirtqueue *svq,
                                             SVQElement *svq_elem, void *opaque)
 {
     VirtQueueElement *elem = &svq_elem->elem;
@@ -388,10 +390,10 @@ static int vhost_vdpa_net_handle_ctrl_avail(VhostShadowVirtqueue *svq,
         { .iov_base = s->cvq_cmd_in_buffer },
     };
     /* in buffer used for device model */
-    const struct iovec in = {
-        .iov_base = &status,
-        .iov_len = sizeof(status),
-    };
+    // const struct iovec in = {
+    //     .iov_base = &status,
+    //     .iov_len = sizeof(status),
+    // };
     int r;
     bool ok;
 
@@ -430,11 +432,13 @@ static int vhost_vdpa_net_handle_ctrl_avail(VhostShadowVirtqueue *svq,
         goto out;
     }
 
+#if 0
     status = VIRTIO_NET_ERR;
     virtio_net_handle_ctrl_iov(svq->vdev, &in, 1, dev_buffers, 1);
     if (status != VIRTIO_NET_OK) {
         error_report("Bad CVQ processing in model");
     }
+#endif
 
 out:
     in_len = iov_from_buf(elem->in_sg, elem->in_num, 0, &status,
@@ -442,8 +446,8 @@ out:
     if (unlikely(in_len < sizeof(status))) {
         error_report("Bad device CVQ written length");
     }
-    vhost_svq_push_elem(svq, svq_elem, MIN(in_len, sizeof(status)));
-    g_free(svq_elem);
+    // vhost_svq_push_elem(svq, svq_elem, MIN(in_len, sizeof(status)));
+    // g_free(svq_elem);
     if (dev_buffers[0].iov_base) {
         vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, dev_buffers[0].iov_base);
     }
@@ -457,6 +461,9 @@ static const VhostShadowVirtqueueOps vhost_vdpa_net_svq_ops = {
     .avail_handler = vhost_vdpa_net_handle_ctrl_avail,
 };
 
+extern VhostVDPAState *cvq_s;
+VhostVDPAState *cvq_s;
+
 static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
                                            const char *device,
                                            const char *name,
@@ -486,6 +493,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
     s->vhost_vdpa.shadow_vqs_enabled = svq;
     s->vhost_vdpa.iova_tree = iova_tree;
     if (!is_datapath) {
+        cvq_s = s;
         s->cvq_cmd_out_buffer = qemu_memalign(qemu_real_host_page_size(),
                                             vhost_vdpa_net_cvq_cmd_page_len());
         memset(s->cvq_cmd_out_buffer, 0, vhost_vdpa_net_cvq_cmd_page_len());
-- 
2.31.1


