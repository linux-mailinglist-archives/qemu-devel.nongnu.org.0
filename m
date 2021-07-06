Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A234A3BC801
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 10:40:36 +0200 (CEST)
Received: from localhost ([::1]:56188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0gd9-0000vY-Jh
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 04:40:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m0gRi-00028W-B6
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 04:28:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m0gRg-0002x6-4e
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 04:28:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625560123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/3/hczp8BppvusqQsFiKpipwkcWGSGfW8GclV7N4LTA=;
 b=e/rCvaqfeoQSZFMFn8PUXHcmFd03/jTZreaaUwkPvm1dvboGtjB5/U/EuLLFSEiT3fKD52
 RO0I+ENg8ifruQ9s1Jj/RNcrwwxMolWkgaxVQd+MpbzU1q1AUA0BqZwAh4PAQES9nT1u1v
 pk+mK99tqqh8tfLJIMifok0PfTWTWWE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-qavr-eD3O0mgMLocFv8WaA-1; Tue, 06 Jul 2021 04:28:41 -0400
X-MC-Unique: qavr-eD3O0mgMLocFv8WaA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84B23CC621;
 Tue,  6 Jul 2021 08:28:40 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-227.pek2.redhat.com
 [10.72.13.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F06E1E2C0;
 Tue,  6 Jul 2021 08:28:37 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	mst@redhat.com,
	jasowang@redhat.com
Subject: [PATCH V2 15/18] vhost-net: control virtqueue support
Date: Tue,  6 Jul 2021 16:27:14 +0800
Message-Id: <20210706082717.37730-16-jasowang@redhat.com>
In-Reply-To: <20210706082717.37730-1-jasowang@redhat.com>
References: <20210706082717.37730-1-jasowang@redhat.com>
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
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: eperezma@redhat.com, elic@nvidia.com, lingshan.zhu@intel.com,
 lulu@redhat.com
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
---
 hw/net/vhost_net.c      | 43 ++++++++++++++++++++++++++++++-----------
 hw/net/virtio-net.c     |  4 ++--
 include/net/vhost_net.h |  6 ++++--
 3 files changed, 38 insertions(+), 15 deletions(-)

diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index ef1370bd92..4294fb9fc9 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -311,11 +311,14 @@ static void vhost_net_stop_one(struct vhost_net *net,
 }
 
 int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
-                    int total_queues)
+                    int data_qps, int cvq)
 {
     BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(dev)));
     VirtioBusState *vbus = VIRTIO_BUS(qbus);
     VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(vbus);
+    int total_notifiers = data_qps * 2 + cvq;
+    VirtIONet *n = VIRTIO_NET(dev);
+    int nvhosts = data_qps + cvq;
     struct vhost_net *net;
     int r, e, i;
     NetClientState *peer;
@@ -325,9 +328,14 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
         return -ENOSYS;
     }
 
-    for (i = 0; i < total_queues; i++) {
+    for (i = 0; i < nvhosts; i++) {
+
+        if (i < data_qps) {
+            peer = qemu_get_peer(ncs, i);
+        } else { /* Control Virtqueue */
+            peer = qemu_get_peer(ncs, n->max_queues);
+        }
 
-        peer = qemu_get_peer(ncs, i);
         net = get_vhost_net(peer);
         vhost_net_set_vq_index(net, i * 2);
 
@@ -340,14 +348,18 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
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
+        if (i < data_qps) {
+            peer = qemu_get_peer(ncs, i);
+        } else {
+            peer = qemu_get_peer(ncs, n->max_queues);
+        }
         r = vhost_net_start_one(get_vhost_net(peer), dev);
 
         if (r < 0) {
@@ -371,7 +383,7 @@ err_start:
         peer = qemu_get_peer(ncs , i);
         vhost_net_stop_one(get_vhost_net(peer), dev);
     }
-    e = k->set_guest_notifiers(qbus->parent, total_queues * 2, false);
+    e = k->set_guest_notifiers(qbus->parent, total_notifiers, false);
     if (e < 0) {
         fprintf(stderr, "vhost guest notifier cleanup failed: %d\n", e);
         fflush(stderr);
@@ -381,18 +393,27 @@ err:
 }
 
 void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs,
-                    int total_queues)
+                    int data_qps, int cvq)
 {
     BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(dev)));
     VirtioBusState *vbus = VIRTIO_BUS(qbus);
     VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(vbus);
+    VirtIONet *n = VIRTIO_NET(dev);
+    NetClientState *peer;
+    int total_notifiers = data_qps * 2 + cvq;
+    int nvhosts = data_qps + cvq;
     int i, r;
 
-    for (i = 0; i < total_queues; i++) {
-        vhost_net_stop_one(get_vhost_net(ncs[i].peer), dev);
+    for (i = 0; i < nvhosts; i++) {
+        if (i < data_qps) {
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
index bd7958b9f0..614660274c 100644
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
index fba40cf695..e656e38af9 100644
--- a/include/net/vhost_net.h
+++ b/include/net/vhost_net.h
@@ -21,8 +21,10 @@ typedef struct VhostNetOptions {
 uint64_t vhost_net_get_max_queues(VHostNetState *net);
 struct vhost_net *vhost_net_init(VhostNetOptions *options);
 
-int vhost_net_start(VirtIODevice *dev, NetClientState *ncs, int total_queues);
-void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs, int total_queues);
+int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
+                    int data_qps, int cvq);
+void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs,
+                    int data_qps, int cvq);
 
 void vhost_net_cleanup(VHostNetState *net);
 
-- 
2.25.1


