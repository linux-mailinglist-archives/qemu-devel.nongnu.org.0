Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 826F84B5AC0
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 20:57:29 +0100 (CET)
Received: from localhost ([::1]:41294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJhTU-0007Ye-Lc
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 14:57:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nJgrP-0003wj-W8
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 14:18:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nJgrB-0001JM-3g
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 14:17:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644866272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qxt4bKH70M6S4V71+R1R40IcKs14iIETamtfBhNL80o=;
 b=TASYMbucq5GrpQ2zZFxUBs14tg7Tw8JMM2rA3gZjtpVLZFSzcBbk/k0Umnzh4SZFpZtwdW
 rH1LnmK+hrn7HKrzsgJbfLTAIomvw1kowOgMan68dEWJmwhrhiUeIeDjtT5MN4zd/EqF0a
 ymakEQbF2fGCZlP4uhqHiYFtlibAF4I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-VQVpq5XoMtK4ZLKzoouOrg-1; Mon, 14 Feb 2022 14:17:48 -0500
X-MC-Unique: VQVpq5XoMtK4ZLKzoouOrg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3431018397BE;
 Mon, 14 Feb 2022 19:17:47 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.195.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EDCA15F9B0;
 Mon, 14 Feb 2022 19:17:40 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 9/9] vdpa: control virtqueue support on shadow virtqueue
Date: Mon, 14 Feb 2022 20:16:35 +0100
Message-Id: <20220214191635.1604932-10-eperezma@redhat.com>
In-Reply-To: <20220214191635.1604932-1-eperezma@redhat.com>
References: <20220214191635.1604932-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce the control virtqueue support for vDPA shadow virtqueue. This
is needed for advanced networking features like multiqueue.

To demonstrate command handling, VIRTIO_NET_F_CTROL_MACADDR is
implemented. If vDPA device is started with SVQ support, and MAC changes
in the source VM, it will be transfered with the rest of properties in
the emulated virtio-net device model.

A new CVQ command will be reproduced at destination so that NIC is aware
of the changed MAC.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 110 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 108 insertions(+), 2 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index fc844a7ce6..ea4e489070 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -11,6 +11,7 @@
 
 #include "qemu/osdep.h"
 #include "clients.h"
+#include "hw/virtio/virtio-net.h"
 #include "net/vhost_net.h"
 #include "net/vhost-vdpa.h"
 #include "hw/virtio/vhost-vdpa.h"
@@ -70,6 +71,28 @@ const int vdpa_feature_bits[] = {
     VHOST_INVALID_FEATURE_BIT
 };
 
+/** Supported device specific feature bits with SVQ */
+static const uint64_t vdpa_svq_device_features =
+    BIT_ULL(VIRTIO_NET_F_CSUM) |
+    BIT_ULL(VIRTIO_NET_F_GUEST_CSUM) |
+    BIT_ULL(VIRTIO_NET_F_CTRL_GUEST_OFFLOADS) |
+    BIT_ULL(VIRTIO_NET_F_MTU) |
+    BIT_ULL(VIRTIO_NET_F_MAC) |
+    BIT_ULL(VIRTIO_NET_F_GUEST_TSO4) |
+    BIT_ULL(VIRTIO_NET_F_GUEST_TSO6) |
+    BIT_ULL(VIRTIO_NET_F_GUEST_ECN) |
+    BIT_ULL(VIRTIO_NET_F_GUEST_UFO) |
+    BIT_ULL(VIRTIO_NET_F_HOST_TSO4) |
+    BIT_ULL(VIRTIO_NET_F_HOST_TSO6) |
+    BIT_ULL(VIRTIO_NET_F_HOST_ECN) |
+    BIT_ULL(VIRTIO_NET_F_HOST_UFO) |
+    BIT_ULL(VIRTIO_NET_F_MRG_RXBUF) |
+    BIT_ULL(VIRTIO_NET_F_STATUS) |
+    BIT_ULL(VIRTIO_NET_F_CTRL_VQ) |
+    BIT_ULL(VIRTIO_NET_F_CTRL_MAC_ADDR) |
+    BIT_ULL(VIRTIO_NET_F_RSC_EXT) |
+    BIT_ULL(VIRTIO_NET_F_STANDBY);
+
 VHostNetState *vhost_vdpa_get_vhost_net(NetClientState *nc)
 {
     VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
@@ -203,6 +226,79 @@ static void vhost_vdpa_get_iova_range(int fd,
     }
 }
 
+static bool vhost_vdpa_start_control_svq(VhostShadowVirtqueue *svq,
+                                        VirtIODevice *vdev)
+{
+    VirtIONet *n = VIRTIO_NET(vdev);
+    NetClientState *nc = qemu_get_subqueue(n->nic, n->max_queue_pairs);
+    VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc->peer);
+    uint64_t features = vdev->host_features;
+    assert(s->nc.info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
+
+    if (features & BIT_ULL(VIRTIO_NET_F_CTRL_MAC_ADDR)) {
+        const struct virtio_net_ctrl_hdr ctrl = {
+            .class = VIRTIO_NET_CTRL_MAC,
+            .cmd = VIRTIO_NET_CTRL_MAC_ADDR_SET,
+        };
+        uint8_t mac[6];
+        const struct iovec data[] = {
+            {
+                .iov_base = (void *)&ctrl,
+                .iov_len = sizeof(ctrl),
+            },{
+                .iov_base = mac,
+                .iov_len = sizeof(mac),
+            },{
+                .iov_base = NULL,
+                .iov_len = sizeof(virtio_net_ctrl_ack),
+            }
+        };
+        bool ret;
+
+        /* TODO: Only best effort? */
+        memcpy(mac, n->mac, sizeof(mac));
+        ret = vhost_svq_inject(svq, data, 2, 1);
+        if (!ret) {
+            return false;
+        }
+    }
+
+    return true;
+}
+
+static void vhost_vdpa_net_handle_ctrl(VirtIODevice *vdev,
+                                       const VirtQueueElement *elem)
+{
+    struct virtio_net_ctrl_hdr ctrl;
+    virtio_net_ctrl_ack status = VIRTIO_NET_ERR;
+    size_t s;
+    struct iovec in = {
+        .iov_base = &status,
+        .iov_len = sizeof(status),
+    };
+
+    s = iov_to_buf(elem->out_sg, elem->out_num, 0, &ctrl, sizeof(ctrl.class));
+    if (s != sizeof(ctrl.class) ||
+        ctrl.class != VIRTIO_NET_CTRL_MAC_ADDR_SET) {
+        return;
+    }
+    s = iov_to_buf(elem->in_sg, elem->in_num, 0, &status, sizeof(status));
+    if (s != sizeof(status) || status != VIRTIO_NET_OK) {
+        return;
+    }
+
+    status = VIRTIO_NET_ERR;
+    virtio_net_handle_ctrl_iov(vdev, &in, 1, elem->out_sg, elem->out_num);
+    if (status != VIRTIO_NET_OK) {
+        error_report("Bad CVQ processing in model");
+    }
+}
+
+static const VhostShadowVirtqueueOps vhost_vdpa_net_svq_ops = {
+    .start = vhost_vdpa_start_control_svq,
+    .used_elem_handler = vhost_vdpa_net_handle_ctrl,
+};
+
 static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
                                        const char *device,
                                        const char *name,
@@ -232,6 +328,9 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
     s->vhost_vdpa.index = queue_pair_index;
     s->vhost_vdpa.iova_range = iova_range;
     s->vhost_vdpa.shadow_vqs_enabled = svq;
+    if (!is_datapath) {
+        s->vhost_vdpa.shadow_vq_ops = &vhost_vdpa_net_svq_ops;
+    }
     s->vhost_vdpa.iova_tree = iova_tree;
     ret = vhost_vdpa_add(nc, (void *)&s->vhost_vdpa, queue_pair_index, nvqs);
     if (ret) {
@@ -322,8 +421,15 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
     }
     vhost_vdpa_get_iova_range(vdpa_device_fd, &iova_range);
     if (opts->x_svq) {
-        if (has_cvq) {
-            error_setg(errp, "vdpa svq does not work with cvq");
+        uint64_t invalid_dev_features = features &
+            ~vdpa_svq_device_features &
+            /* Transport are all accepted at this point */
+            ~MAKE_64BIT_MASK(VIRTIO_TRANSPORT_F_START,
+                            VIRTIO_TRANSPORT_F_END - VIRTIO_TRANSPORT_F_START);
+
+        if (invalid_dev_features) {
+            error_setg(errp, "vdpa svq does not work with features 0x%" PRIx64,
+                       invalid_dev_features);
             goto err_svq;
         }
         iova_tree = vhost_iova_tree_new(iova_range.first, iova_range.last);
-- 
2.27.0


