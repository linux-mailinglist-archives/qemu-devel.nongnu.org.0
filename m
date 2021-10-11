Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 735794285F2
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 06:34:19 +0200 (CEST)
Received: from localhost ([::1]:40756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZn0y-00010U-R2
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 00:34:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mZmw4-000170-Ir
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 00:29:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mZmw2-0002NB-Oi
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 00:29:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633926550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lTEe2V4rOl6EVTF92adXF17NFDv10xkwRTOey5196Ms=;
 b=goZWeaP1U9nMWcTbuGDUaqrDCjqCHfD3vs32z6LUr7/BgtNf/Z082ik514d1v+Z52StWs8
 exbprMdWOpCcB6yzomnJzSZe0Fh0RMqc0sPljv0RXIhMLd5E5F1US2CXLAoZYS/zUhDhss
 jGC0cQCw07On+TBA9KflQxd2T7jOm0U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-v_j9jMh9MQ2VaGwIgEeutw-1; Mon, 11 Oct 2021 00:29:06 -0400
X-MC-Unique: v_j9jMh9MQ2VaGwIgEeutw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B8F3824FA7;
 Mon, 11 Oct 2021 04:29:05 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-160.pek2.redhat.com
 [10.72.13.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 815D81F6;
 Mon, 11 Oct 2021 04:29:01 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH V4 06/10] vhost-net: control virtqueue support
Date: Mon, 11 Oct 2021 12:28:25 +0800
Message-Id: <20211011042829.4159-7-jasowang@redhat.com>
In-Reply-To: <20211011042829.4159-1-jasowang@redhat.com>
References: <20211011042829.4159-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: eperezma@redhat.com, elic@nvidia.com, gdawar@xilinx.com,
 lingshan.zhu@intel.com, lulu@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We assume there's no cvq in the past, this is not true when we need
control virtqueue support for vhost-user backends. So this patch
implements the control virtqueue support for vhost-net. As datapath,
the control virtqueue is also required to be coupled with the
NetClientState. The vhost_net_start/stop() are tweaked to accept the
number of datapath queue pairs plus the the number of control
virtqueue for us to start and stop the vhost device.

Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20210907090322.1756-7-jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/net/vhost_net-stub.c |  4 ++--
 hw/net/vhost_net.c      | 43 ++++++++++++++++++++++++++++++-----------
 hw/net/virtio-net.c     |  4 ++--
 include/net/vhost_net.h |  6 ++++--
 4 files changed, 40 insertions(+), 17 deletions(-)

diff --git a/hw/net/vhost_net-stub.c b/hw/net/vhost_net-stub.c
index a7f4252630..89d71cfb8e 100644
--- a/hw/net/vhost_net-stub.c
+++ b/hw/net/vhost_net-stub.c
@@ -33,13 +33,13 @@ struct vhost_net *vhost_net_init(VhostNetOptions *options)
 
 int vhost_net_start(VirtIODevice *dev,
                     NetClientState *ncs,
-                    int total_queues)
+                    int data_queue_pairs, int cvq)
 {
     return -ENOSYS;
 }
 void vhost_net_stop(VirtIODevice *dev,
                     NetClientState *ncs,
-                    int total_queues)
+                    int data_queue_pairs, int cvq)
 {
 }
 
diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 386ec2eaa2..e1e9d1ec89 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -315,11 +315,14 @@ static void vhost_net_stop_one(struct vhost_net *net,
 }
 
 int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
-                    int total_queues)
+                    int data_queue_pairs, int cvq)
 {
     BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(dev)));
     VirtioBusState *vbus = VIRTIO_BUS(qbus);
     VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(vbus);
+    int total_notifiers = data_queue_pairs * 2 + cvq;
+    VirtIONet *n = VIRTIO_NET(dev);
+    int nvhosts = data_queue_pairs + cvq;
     struct vhost_net *net;
     int r, e, i;
     NetClientState *peer;
@@ -329,9 +332,14 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
         return -ENOSYS;
     }
 
-    for (i = 0; i < total_queues; i++) {
+    for (i = 0; i < nvhosts; i++) {
+
+        if (i < data_queue_pairs) {
+            peer = qemu_get_peer(ncs, i);
+        } else { /* Control Virtqueue */
+            peer = qemu_get_peer(ncs, n->max_queues);
+        }
 
-        peer = qemu_get_peer(ncs, i);
         net = get_vhost_net(peer);
         vhost_net_set_vq_index(net, i * 2);
 
@@ -344,14 +352,18 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
         }
      }
 
-    r = k->set_guest_notifiers(qbus->parent, total_queues * 2, true);
+    r = k->set_guest_notifiers(qbus->parent, total_notifiers, true);
     if (r < 0) {
         error_report("Error binding guest notifier: %d", -r);
         goto err;
     }
 
-    for (i = 0; i < total_queues; i++) {
-        peer = qemu_get_peer(ncs, i);
+    for (i = 0; i < nvhosts; i++) {
+        if (i < data_queue_pairs) {
+            peer = qemu_get_peer(ncs, i);
+        } else {
+            peer = qemu_get_peer(ncs, n->max_queues);
+        }
         r = vhost_net_start_one(get_vhost_net(peer), dev);
 
         if (r < 0) {
@@ -375,7 +387,7 @@ err_start:
         peer = qemu_get_peer(ncs , i);
         vhost_net_stop_one(get_vhost_net(peer), dev);
     }
-    e = k->set_guest_notifiers(qbus->parent, total_queues * 2, false);
+    e = k->set_guest_notifiers(qbus->parent, total_notifiers, false);
     if (e < 0) {
         fprintf(stderr, "vhost guest notifier cleanup failed: %d\n", e);
         fflush(stderr);
@@ -385,18 +397,27 @@ err:
 }
 
 void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs,
-                    int total_queues)
+                    int data_queue_pairs, int cvq)
 {
     BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(dev)));
     VirtioBusState *vbus = VIRTIO_BUS(qbus);
     VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(vbus);
+    VirtIONet *n = VIRTIO_NET(dev);
+    NetClientState *peer;
+    int total_notifiers = data_queue_pairs * 2 + cvq;
+    int nvhosts = data_queue_pairs + cvq;
     int i, r;
 
-    for (i = 0; i < total_queues; i++) {
-        vhost_net_stop_one(get_vhost_net(ncs[i].peer), dev);
+    for (i = 0; i < nvhosts; i++) {
+        if (i < data_queue_pairs) {
+            peer = qemu_get_peer(ncs, i);
+        } else {
+            peer = qemu_get_peer(ncs, n->max_queues);
+        }
+        vhost_net_stop_one(get_vhost_net(peer), dev);
     }
 
-    r = k->set_guest_notifiers(qbus->parent, total_queues * 2, false);
+    r = k->set_guest_notifiers(qbus->parent, total_notifiers, false);
     if (r < 0) {
         fprintf(stderr, "vhost guest notifier cleanup failed: %d\n", r);
         fflush(stderr);
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index f205331dcf..f1119cf0ad 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -285,14 +285,14 @@ static void virtio_net_vhost_status(VirtIONet *n, uint8_t status)
         }
 
         n->vhost_started = 1;
-        r = vhost_net_start(vdev, n->nic->ncs, queues);
+        r = vhost_net_start(vdev, n->nic->ncs, queues, 0);
         if (r < 0) {
             error_report("unable to start vhost net: %d: "
                          "falling back on userspace virtio", -r);
             n->vhost_started = 0;
         }
     } else {
-        vhost_net_stop(vdev, n->nic->ncs, queues);
+        vhost_net_stop(vdev, n->nic->ncs, queues, 0);
         n->vhost_started = 0;
     }
 }
diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
index fba40cf695..387e913e4e 100644
--- a/include/net/vhost_net.h
+++ b/include/net/vhost_net.h
@@ -21,8 +21,10 @@ typedef struct VhostNetOptions {
 uint64_t vhost_net_get_max_queues(VHostNetState *net);
 struct vhost_net *vhost_net_init(VhostNetOptions *options);
 
-int vhost_net_start(VirtIODevice *dev, NetClientState *ncs, int total_queues);
-void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs, int total_queues);
+int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
+                    int data_queue_pairs, int cvq);
+void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs,
+                    int data_queue_pairs, int cvq);
 
 void vhost_net_cleanup(VHostNetState *net);
 
-- 
2.25.1


