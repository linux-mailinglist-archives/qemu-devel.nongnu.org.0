Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D666F4FC015
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 17:16:10 +0200 (CEST)
Received: from localhost ([::1]:39422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndvlx-0003LF-Vb
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 11:16:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ndvNx-0006YI-W0
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 10:51:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ndvNw-0007nj-4B
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 10:51:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649688679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Da3BHGyAUkkYsbHgyZwVeZEaa40hKI/NVlYgdlhFTDU=;
 b=XiMQ+JJ7zsEvCQeEXBDN/wEbEzWjLugChvvq+CHSwXKfzDwT8n8dEieF9FvxyYHk9Lb10B
 5IYVo2KFjaMzigdUqHamf2vz6OCNAsoHxiB4PnnrserEjw7cYVr8hWEW08+Ax913R9W50F
 qIBWZAZVhMqakFMlaChNHe1bPulV8ig=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-505-15BRyczdPKKW7xhbulHpYQ-1; Mon, 11 Apr 2022 10:51:16 -0400
X-MC-Unique: 15BRyczdPKKW7xhbulHpYQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 05FD81C0BFA7;
 Mon, 11 Apr 2022 14:51:10 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DDCB254AC99;
 Mon, 11 Apr 2022 14:51:07 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v6 14/23] vdpa: control virtqueue support on shadow
 virtqueue
Date: Mon, 11 Apr 2022 16:50:17 +0200
Message-Id: <20220411145026.1618035-15-eperezma@redhat.com>
In-Reply-To: <20220411145026.1618035-1-eperezma@redhat.com>
References: <20220411145026.1618035-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Paolo Bonzini <pbonzini@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce the control virtqueue support for vDPA shadow virtqueue. This
is needed for advanced networking features like multiqueue.

To demonstrate command handling, VIRTIO_NET_F_CTRL_MACADDR and
VIRTIO_NET_CTRL_MQ are implemented. If vDPA device is started with SVQ
support and virtio-net driver changes MAC or the number of queues
virtio-net device model will be updated with the new one.

Others cvq commands could be added here straightforwardly but they have
been not tested.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 80 ++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 77 insertions(+), 3 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 290aa01e13..a83da4616c 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -11,6 +11,7 @@
 
 #include "qemu/osdep.h"
 #include "clients.h"
+#include "hw/virtio/virtio-net.h"
 #include "net/vhost_net.h"
 #include "net/vhost-vdpa.h"
 #include "hw/virtio/vhost-vdpa.h"
@@ -69,6 +70,30 @@ const int vdpa_feature_bits[] = {
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
+    BIT_ULL(VIRTIO_NET_F_MQ) |
+    BIT_ULL(VIRTIO_F_ANY_LAYOUT) |
+    BIT_ULL(VIRTIO_NET_F_CTRL_MAC_ADDR) |
+    BIT_ULL(VIRTIO_NET_F_RSC_EXT) |
+    BIT_ULL(VIRTIO_NET_F_STANDBY);
+
 VHostNetState *vhost_vdpa_get_vhost_net(NetClientState *nc)
 {
     VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
@@ -199,6 +224,46 @@ static int vhost_vdpa_get_iova_range(int fd,
     return ret < 0 ? -errno : 0;
 }
 
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
+    if (s != sizeof(ctrl.class)) {
+        return;
+    }
+
+    switch (ctrl.class) {
+    case VIRTIO_NET_CTRL_MAC_ADDR_SET:
+    case VIRTIO_NET_CTRL_MQ:
+        break;
+    default:
+        return;
+    };
+
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
+    .used_elem_handler = vhost_vdpa_net_handle_ctrl,
+};
+
 static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
                                        const char *device,
                                        const char *name,
@@ -226,6 +291,9 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
     s->vhost_vdpa.device_fd = vdpa_device_fd;
     s->vhost_vdpa.index = queue_pair_index;
     s->vhost_vdpa.shadow_vqs_enabled = svq;
+    if (!is_datapath) {
+        s->vhost_vdpa.shadow_vq_ops = &vhost_vdpa_net_svq_ops;
+    }
     s->vhost_vdpa.iova_tree = iova_tree;
     ret = vhost_vdpa_add(nc, (void *)&s->vhost_vdpa, queue_pair_index, nvqs);
     if (ret) {
@@ -314,9 +382,15 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
     }
     if (opts->x_svq) {
         struct vhost_vdpa_iova_range iova_range;
-
-        if (has_cvq) {
-            error_setg(errp, "vdpa svq does not work with cvq");
+        uint64_t invalid_dev_features =
+            features & ~vdpa_svq_device_features &
+            /* Transport are all accepted at this point */
+            ~MAKE_64BIT_MASK(VIRTIO_TRANSPORT_F_START,
+                             VIRTIO_TRANSPORT_F_END - VIRTIO_TRANSPORT_F_START);
+
+        if (invalid_dev_features) {
+            error_setg(errp, "vdpa svq does not work with features 0x%" PRIx64,
+                       invalid_dev_features);
             goto err_svq;
         }
         vhost_vdpa_get_iova_range(vdpa_device_fd, &iova_range);
-- 
2.27.0


