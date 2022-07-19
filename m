Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D48D579F8C
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 15:23:39 +0200 (CEST)
Received: from localhost ([::1]:50920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDnCL-000242-Un
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 09:23:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oDn61-000739-9U
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 09:17:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oDn5z-0004oV-BY
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 09:17:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658236622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qx4O63vQebB/eHlIzps2qcOgx5CD1xyJef2NC1lNKug=;
 b=S/GW3bjieB4+XvRFWRa1Mn01qKo5dR10J+Tl5b8jtobiwoeCghiVIpR7V+Vw1oaGSrGXWu
 d6puEEIUt+zZtg5yo14b5+DAj6D/RuUhgqHDtfQmPWyjOmQQR1hUjVGhVMy84JUMuCQpQ9
 h8aDcCkQgoaguVrDDULwgMUwV03mOv8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-_az1LHK2Ou6qbAc7xwMT1w-1; Tue, 19 Jul 2022 09:16:59 -0400
X-MC-Unique: _az1LHK2Ou6qbAc7xwMT1w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7286D1C0BDE6;
 Tue, 19 Jul 2022 13:16:59 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-77.pek2.redhat.com [10.72.12.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3314540CFD0A;
 Tue, 19 Jul 2022 13:16:56 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 03/24] virtio-net: Expose ctrl virtqueue logic
Date: Tue, 19 Jul 2022 21:16:16 +0800
Message-Id: <20220719131637.46131-4-jasowang@redhat.com>
In-Reply-To: <20220719131637.46131-1-jasowang@redhat.com>
References: <20220719131637.46131-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

From: Eugenio Pérez <eperezma@redhat.com>

This allows external vhost-net devices to modify the state of the
VirtIO device model once the vhost-vdpa device has acknowledged the
control commands.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/virtio-net.c            | 84 ++++++++++++++++++++++++------------------
 include/hw/virtio/virtio-net.h |  4 ++
 2 files changed, 53 insertions(+), 35 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index f83e96e..dd0d056 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -1433,57 +1433,71 @@ static int virtio_net_handle_mq(VirtIONet *n, uint8_t cmd,
     return VIRTIO_NET_OK;
 }
 
-static void virtio_net_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
+size_t virtio_net_handle_ctrl_iov(VirtIODevice *vdev,
+                                  const struct iovec *in_sg, unsigned in_num,
+                                  const struct iovec *out_sg,
+                                  unsigned out_num)
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
+    iov2 = iov = g_memdup2(out_sg, sizeof(struct iovec) * out_num);
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
+        size_t written;
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
         }
-
-        iov_cnt = elem->out_num;
-        iov2 = iov = g_memdup2(elem->out_sg,
-                               sizeof(struct iovec) * elem->out_num);
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
     }
 }
 
diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
index cce1c55..ef234ff 100644
--- a/include/hw/virtio/virtio-net.h
+++ b/include/hw/virtio/virtio-net.h
@@ -221,6 +221,10 @@ struct VirtIONet {
     struct EBPFRSSContext ebpf_rss;
 };
 
+size_t virtio_net_handle_ctrl_iov(VirtIODevice *vdev,
+                                  const struct iovec *in_sg, unsigned in_num,
+                                  const struct iovec *out_sg,
+                                  unsigned out_num);
 void virtio_net_set_netclient_name(VirtIONet *n, const char *name,
                                    const char *type);
 
-- 
2.7.4


