Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F8F57B15E
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 09:07:22 +0200 (CEST)
Received: from localhost ([::1]:40742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE3nl-00039z-MO
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 03:07:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oE3gp-0000Md-6B
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 03:00:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oE3gm-0006RL-1W
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 03:00:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658300407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h3mO/9TxV/PKzNbYdTqanE3vzAOu/fz5OE4rIndnbN0=;
 b=RluJ/pFPFsnK6J67xF0RxEPvXYBeCS232g6V5UKZ+uzs9spVbU26xPg0VPcrKSsaCY5bWf
 gMvSR/5mSCGznVLA1fy4YUzlHf8p2xmEpnnLhdn0FV0Uh4nf/vBKqXT4J4FwOIFZG/AwWb
 kPgu9254kAbZrdl+jQ+Bctgn19wQRXw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-527-hIN5agUPPtGdbBg2ydXQyQ-1; Wed, 20 Jul 2022 03:00:03 -0400
X-MC-Unique: hIN5agUPPtGdbBg2ydXQyQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 54A788037AC;
 Wed, 20 Jul 2022 07:00:03 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A5A290A04;
 Wed, 20 Jul 2022 06:59:59 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefano Garzarella <sgarzare@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Cindy Lu <lulu@redhat.com>,
 Eric Blake <eblake@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Jason Wang <jasowang@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
Subject: [PATCH v6 03/21] virtio-net: Expose ctrl virtqueue logic
Date: Wed, 20 Jul 2022 08:59:28 +0200
Message-Id: <20220720065946.3122611-4-eperezma@redhat.com>
In-Reply-To: <20220720065946.3122611-1-eperezma@redhat.com>
References: <20220720065946.3122611-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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

This allows external vhost-net devices to modify the state of the
VirtIO device model once the vhost-vdpa device has acknowledged the
control commands.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/hw/virtio/virtio-net.h |  4 ++
 hw/net/virtio-net.c            | 84 ++++++++++++++++++++--------------
 2 files changed, 53 insertions(+), 35 deletions(-)

diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
index cce1c554f7..ef234ffe7e 100644
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
 
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index f83e96e4ce..dd0d056fde 100644
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
 
-- 
2.31.1


