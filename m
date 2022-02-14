Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B394B5AA1
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 20:44:49 +0100 (CET)
Received: from localhost ([::1]:42444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJhHE-0006NB-Bt
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 14:44:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nJgqI-0002dy-RK
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 14:16:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nJgqG-0001Cq-Mx
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 14:16:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644866215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y7Elc4mWMixGdGSkYMfwRZ2DSvxjccf19y5bT0QA/iI=;
 b=D0jQflQE8XLx/GlUPW4G8WIGcQIyw6cHPtKeucui2csX9ptIjwJH2d3BpPrsdIEBCzGLV3
 jj/xIaLTiNeOpEZ08oXMjJXq4IJZisFkH7vABSYoJnHTimqf5vqlj6bdqXA97NPB5D5t1R
 pxU7xJ32LNIUGEl6SP13T4GVkkVzR+o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-1uwT9f6eOTm1kwiaBJ2aPg-1; Mon, 14 Feb 2022 14:16:52 -0500
X-MC-Unique: 1uwT9f6eOTm1kwiaBJ2aPg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF4EC100C662;
 Mon, 14 Feb 2022 19:16:50 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.195.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF8425C22B;
 Mon, 14 Feb 2022 19:16:45 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 1/9] virtio-net: Expose ctrl virtqueue logic
Date: Mon, 14 Feb 2022 20:16:27 +0100
Message-Id: <20220214191635.1604932-2-eperezma@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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

This allows external vhost-net devices to modify the state of the
VirtIO device model once vhost-vdpa device has acknowledge the control
commands.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/hw/virtio/virtio-net.h |  3 ++
 hw/net/virtio-net.c            | 83 ++++++++++++++++++++--------------
 2 files changed, 52 insertions(+), 34 deletions(-)

diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
index eb87032627..e62f9e227f 100644
--- a/include/hw/virtio/virtio-net.h
+++ b/include/hw/virtio/virtio-net.h
@@ -218,6 +218,9 @@ struct VirtIONet {
     struct EBPFRSSContext ebpf_rss;
 };
 
+unsigned virtio_net_handle_ctrl_iov(VirtIODevice *vdev,
+                                    const struct iovec *in_sg, size_t in_num,
+                                    struct iovec *out_sg, unsigned out_num);
 void virtio_net_set_netclient_name(VirtIONet *n, const char *name,
                                    const char *type);
 
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 49cd13314a..a9027b3373 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -1417,56 +1417,71 @@ static int virtio_net_handle_mq(VirtIONet *n, uint8_t cmd,
     return VIRTIO_NET_OK;
 }
 
-static void virtio_net_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
+unsigned virtio_net_handle_ctrl_iov(VirtIODevice *vdev,
+                                    const struct iovec *in_sg, size_t in_num,
+                                    struct iovec *out_sg, unsigned out_num)
 {
     VirtIONet *n = VIRTIO_NET(vdev);
     struct virtio_net_ctrl_hdr ctrl;
     virtio_net_ctrl_ack status = VIRTIO_NET_ERR;
-    VirtQueueElement *elem;
     size_t s;
     struct iovec *iov, *iov2;
-    unsigned int iov_cnt;
+
+    if (iov_size(in_sg, in_num) < sizeof(status) ||
+        iov_size(out_sg, out_num) < sizeof(ctrl)) {
+        virtio_error(vdev, "virtio-net ctrl missing headers");
+        return 0;
+    }
+
+    iov2 = iov = g_memdup(out_sg, sizeof(struct iovec) * out_num);
+    s = iov_to_buf(iov, out_num, 0, &ctrl, sizeof(ctrl));
+    iov_discard_front(&iov, &out_num, sizeof(ctrl));
+    if (s != sizeof(ctrl)) {
+        status = VIRTIO_NET_ERR;
+    } else if (ctrl.class == VIRTIO_NET_CTRL_RX) {
+        status = virtio_net_handle_rx_mode(n, ctrl.cmd, iov, out_num);
+    } else if (ctrl.class == VIRTIO_NET_CTRL_MAC) {
+        status = virtio_net_handle_mac(n, ctrl.cmd, iov, out_num);
+    } else if (ctrl.class == VIRTIO_NET_CTRL_VLAN) {
+        status = virtio_net_handle_vlan_table(n, ctrl.cmd, iov, out_num);
+    } else if (ctrl.class == VIRTIO_NET_CTRL_ANNOUNCE) {
+        status = virtio_net_handle_announce(n, ctrl.cmd, iov, out_num);
+    } else if (ctrl.class == VIRTIO_NET_CTRL_MQ) {
+        status = virtio_net_handle_mq(n, ctrl.cmd, iov, out_num);
+    } else if (ctrl.class == VIRTIO_NET_CTRL_GUEST_OFFLOADS) {
+        status = virtio_net_handle_offloads(n, ctrl.cmd, iov, out_num);
+    }
+
+    s = iov_from_buf(in_sg, in_num, 0, &status, sizeof(status));
+    assert(s == sizeof(status));
+
+    g_free(iov2);
+    return sizeof(status);
+}
+
+static void virtio_net_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
+{
+    VirtQueueElement *elem;
 
     for (;;) {
+        unsigned written;
         elem = virtqueue_pop(vq, sizeof(VirtQueueElement));
         if (!elem) {
             break;
         }
-        if (iov_size(elem->in_sg, elem->in_num) < sizeof(status) ||
-            iov_size(elem->out_sg, elem->out_num) < sizeof(ctrl)) {
-            virtio_error(vdev, "virtio-net ctrl missing headers");
+
+        written = virtio_net_handle_ctrl_iov(vdev, elem->in_sg, elem->in_num,
+                                             elem->out_sg, elem->out_num);
+        if (written > 0) {
+            virtqueue_push(vq, elem, written);
+            virtio_notify(vdev, vq);
+            g_free(elem);
+        } else {
             virtqueue_detach_element(vq, elem, 0);
             g_free(elem);
             break;
-        }
 
-        iov_cnt = elem->out_num;
-        iov2 = iov = g_memdup(elem->out_sg, sizeof(struct iovec) * elem->out_num);
-        s = iov_to_buf(iov, iov_cnt, 0, &ctrl, sizeof(ctrl));
-        iov_discard_front(&iov, &iov_cnt, sizeof(ctrl));
-        if (s != sizeof(ctrl)) {
-            status = VIRTIO_NET_ERR;
-        } else if (ctrl.class == VIRTIO_NET_CTRL_RX) {
-            status = virtio_net_handle_rx_mode(n, ctrl.cmd, iov, iov_cnt);
-        } else if (ctrl.class == VIRTIO_NET_CTRL_MAC) {
-            status = virtio_net_handle_mac(n, ctrl.cmd, iov, iov_cnt);
-        } else if (ctrl.class == VIRTIO_NET_CTRL_VLAN) {
-            status = virtio_net_handle_vlan_table(n, ctrl.cmd, iov, iov_cnt);
-        } else if (ctrl.class == VIRTIO_NET_CTRL_ANNOUNCE) {
-            status = virtio_net_handle_announce(n, ctrl.cmd, iov, iov_cnt);
-        } else if (ctrl.class == VIRTIO_NET_CTRL_MQ) {
-            status = virtio_net_handle_mq(n, ctrl.cmd, iov, iov_cnt);
-        } else if (ctrl.class == VIRTIO_NET_CTRL_GUEST_OFFLOADS) {
-            status = virtio_net_handle_offloads(n, ctrl.cmd, iov, iov_cnt);
-        }
-
-        s = iov_from_buf(elem->in_sg, elem->in_num, 0, &status, sizeof(status));
-        assert(s == sizeof(status));
-
-        virtqueue_push(vq, elem, sizeof(status));
-        virtio_notify(vdev, vq);
-        g_free(iov2);
-        g_free(elem);
+        }
     }
 }
 
-- 
2.27.0


