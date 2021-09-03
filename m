Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E723FFD00
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 11:24:41 +0200 (CEST)
Received: from localhost ([::1]:36156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM5RA-0003vP-Gj
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 05:24:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mM5FC-0004CD-Hc
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:12:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mM5F9-000412-OQ
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:12:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630660335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5wGFAQjeLmwsYhyPv3tJuebpW7JWWB/TgtneXPUrOHk=;
 b=YbqWxY/l2V31HHGqR1mrHlCNrA/ZN9LIZRtYNvTZc+v8rWSnJT0lCJK/xL1NgWnX9zeHuu
 ETsJKHCTWXvfWJP/eaS4IiLSiPS1Tb70QgdvtrQBIZhmlkocE7ffJANY1+epx24BiK/uGU
 1DePSr9dch1qbU8eAcYi8T7XOOBzaRI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-UkAeVUgVNw69gU_5V6t0AA-1; Fri, 03 Sep 2021 05:12:13 -0400
X-MC-Unique: UkAeVUgVNw69gU_5V6t0AA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A960E512C;
 Fri,  3 Sep 2021 09:12:12 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-217.pek2.redhat.com
 [10.72.13.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D2C1861093;
 Fri,  3 Sep 2021 09:12:09 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH V2 17/21] vhost-net: control virtqueue support
Date: Fri,  3 Sep 2021 17:10:27 +0800
Message-Id: <20210903091031.47303-18-jasowang@redhat.com>
In-Reply-To: <20210903091031.47303-1-jasowang@redhat.com>
References: <20210903091031.47303-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
---
 hw/net/vhost_net.c      | 43 ++++++++++++++++++++++++++++++-----------
 hw/net/virtio-net.c     |  4 ++--
 include/net/vhost_net.h |  6 ++++--
 3 files changed, 38 insertions(+), 15 deletions(-)

diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 386ec2eaa2..7e0b60b4d9 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -315,11 +315,14 @@ static void vhost_net_stop_one(struct vhost_net *net,
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
@@ -329,9 +332,14 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
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
+        if (i < data_qps) {
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
index 16d20cdee5..8fccbaa44c 100644
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


