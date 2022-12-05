Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6A9642E5B
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 18:07:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2Ev0-00013C-Eu; Mon, 05 Dec 2022 12:06:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1p2EuK-0000gE-Hc
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 12:05:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1p2EuJ-0002zH-0j
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 12:05:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670259930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r4aycp4adEJGmL77aJql7l+0FzaWMcJzSCjVB4Nz7k4=;
 b=dlN+xdNVHXu0QNDgj1dhrtSm+795/jZpEm2NeRlGxVDAAUGrF+EZlFZhkfSX3/PVP41wFS
 g5cZQQwG+oZyEKguF5af0YUo999taRmkfSm9St0kf5imn4LYEB2XLGgebwobuAQGllANOj
 zbc86ggi4Kn074wyx5UExNJkbcCZ/TE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-163--MmRbQAjN-G9YZ8ZNzlS8A-1; Mon, 05 Dec 2022 12:05:25 -0500
X-MC-Unique: -MmRbQAjN-G9YZ8ZNzlS8A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8C7838164C3;
 Mon,  5 Dec 2022 17:05:23 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E56BFC15BA8;
 Mon,  5 Dec 2022 17:05:20 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Cindy Lu <lulu@redhat.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Parav Pandit <parav@mellanox.com>
Subject: [RFC PATCH for 8.0 13/13] vdpa: Recover inflight descriptors
Date: Mon,  5 Dec 2022 18:04:36 +0100
Message-Id: <20221205170436.2977336-14-eperezma@redhat.com>
In-Reply-To: <20221205170436.2977336-1-eperezma@redhat.com>
References: <20221205170436.2977336-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Finally recover the inflight descriptors at vhost_net_start.

TODO: Abstract it properly instead of using SVQ directly.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/net/vhost_net.c     | 34 ++++++++++++++++++++++++++++++++++
 hw/virtio/vhost-vdpa.c | 11 -----------
 2 files changed, 34 insertions(+), 11 deletions(-)

diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 480f4ac0a1..9a49046c53 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -428,6 +428,40 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
         }
     }
 
+    for (i = 0; i < data_queue_pairs; i++) {
+        struct vhost_vdpa *v;
+
+        peer = qemu_get_peer(ncs, i);
+        if (peer->info->type != NET_CLIENT_DRIVER_VHOST_VDPA) {
+            continue;
+        }
+        net = get_vhost_net(peer);
+        v = net->dev.opaque;
+
+        if (!v->shadow_vqs_enabled) {
+            return 0;
+        }
+
+        for (size_t i = 0; i < v->dev->nvqs; ++i) {
+            VirtIONetQueue *q = &n->vqs[(i + v->dev->vq_index) / 2];
+            size_t num = i % 2 ? q->tx_inflight_num : q->rx_inflight_num;
+            g_autofree VirtQueueElement **inflight = NULL;
+
+            assert(v->dev->vq_index % 2 == 0);
+            inflight = g_steal_pointer(i % 2 ? &q->tx_inflight
+                                             : &q->rx_inflight);
+            for (size_t j = 0; j < num; ++j) {
+                int r;
+
+                r = vhost_svq_add_element(g_ptr_array_index(v->shadow_vqs, i),
+                                          inflight[j]);
+
+                /* TODO: Proper error handling */
+                assert(r == 0);
+            }
+        }
+    }
+
     return 0;
 
 err_start:
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 7468e44b87..c54cb82cb5 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -1167,18 +1167,7 @@ static int vhost_vdpa_set_vring_base(struct vhost_dev *dev,
                                        struct vhost_vring_state *ring)
 {
     struct vhost_vdpa *v = dev->opaque;
-    VirtQueue *vq = virtio_get_queue(dev->vdev, ring->index);
 
-    /*
-     * vhost-vdpa devices does not support in-flight requests. Set all of them
-     * as available.
-     *
-     * TODO: This is ok for networking, but other kinds of devices might
-     * have problems with these retransmissions.
-     */
-    while (virtqueue_rewind(vq, 1)) {
-        continue;
-    }
     if (v->shadow_vqs_enabled) {
         /*
          * Device vring base was set at device start. SVQ base is handled by
-- 
2.31.1


