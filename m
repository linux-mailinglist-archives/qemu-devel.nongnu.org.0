Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2642BB517
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 20:19:29 +0100 (CET)
Received: from localhost ([::1]:60050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgBwO-0003Pj-SL
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 14:19:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kgBaQ-00086G-Dd
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 13:56:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kgBaL-0008MG-Q4
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 13:56:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605898600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PTSVtxwsFfunaFRmsiJCHQSu2dQDXIap/g3V71hKaPI=;
 b=F9nhvc2IVK05wD3qnCCiNscMOhWYcpb0TqxjNLq+M9/9ZU89g0t597IdbfqkPYy8yGFsyT
 tsdcm0mEMFJGpw7Ec6mEUT1419A6b25NbefMPitsCxUheD/Hbbjv7kIwuyIHw3Gq5CEla+
 j19CGEmZA4/V/olEg0ty3owPsT1Il0Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-xXhwUuTlODSMizKH-YZFMg-1; Fri, 20 Nov 2020 13:56:39 -0500
X-MC-Unique: xXhwUuTlODSMizKH-YZFMg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4524A100C602;
 Fri, 20 Nov 2020 18:56:36 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-112-88.ams2.redhat.com [10.36.112.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6A8FF5C1D5;
 Fri, 20 Nov 2020 18:56:12 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 22/27] vhost: Add vhost_virtqueue_memory_map
Date: Fri, 20 Nov 2020 19:51:00 +0100
Message-Id: <20201120185105.279030-23-eperezma@redhat.com>
In-Reply-To: <20201120185105.279030-1-eperezma@redhat.com>
References: <20201120185105.279030-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Daniel Daly <dandaly0@gmail.com>,
 virtualization@lists.linux-foundation.org, Liran Alon <liralon@gmail.com>,
 Eli Cohen <eli@mellanox.com>, Nitin Shrivastav <nitin.shrivastav@broadcom.com>,
 Alex Barba <alex.barba@broadcom.com>,
 Christophe Fontaine <cfontain@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Lee Ballard <ballle98@gmail.com>, Lars Ganrot <lars.ganrot@gmail.com>,
 Rob Miller <rob.miller@broadcom.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Howard Cai <howard.cai@gmail.com>, Parav Pandit <parav@mellanox.com>,
 vm <vmireyno@marvell.com>, Salil Mehta <mehta.salil.lnk@gmail.com>,
 Stephen Finucane <stephenfin@redhat.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Sean Mooney <smooney@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Jim Harford <jim.harford@broadcom.com>,
 Dmytro Kazantsev <dmytro.kazantsev@gmail.com>, Siwei Liu <loseweigh@gmail.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Michael Lilja <ml@napatech.com>,
 Max Gurtovoy <maxgu14@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To make it symmetric with _unmap.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost.c | 68 ++++++++++++++++++++++++++++++-----------------
 1 file changed, 44 insertions(+), 24 deletions(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index eafbbaa751..f640d4edf0 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -827,6 +827,42 @@ static void vhost_virtqueue_memory_unmap(struct vhost_dev *dev,
     }
 }
 
+static int vhost_virtqueue_memory_map(struct vhost_dev *dev,
+                                      struct vhost_virtqueue *vq,
+                                      unsigned int vhost_vq_index)
+{
+    int r;
+    hwaddr a, l, s;
+
+    a = vq->desc_phys;
+    s = l = vq->desc_size;
+    vq->desc = vhost_memory_map(dev, a, &l, false);
+    if (!vq->desc || l != s) {
+        return -ENOMEM;
+    }
+
+    a = vq->avail_phys;
+    s = l = vq->avail_size;
+    vq->avail = vhost_memory_map(dev, a, &l, false);
+    if (!vq->avail || l != s) {
+        return -ENOMEM;
+    }
+
+    a = vq->used_phys;
+    s = l = vq->used_size;
+    vq->used = vhost_memory_map(dev, a, &l, true);
+    if (!vq->used || l != s) {
+        return -ENOMEM;
+    }
+
+    r = vhost_virtqueue_set_addr(dev, vq, vhost_vq_index, dev->log_enabled);
+    if (r < 0) {
+        return -errno;
+    }
+
+    return 0;
+}
+
 static int vhost_dev_set_features(struct vhost_dev *dev,
                                   bool enable_log)
 {
@@ -1271,7 +1307,7 @@ static int vhost_virtqueue_start(struct vhost_dev *dev,
     BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
     VirtioBusState *vbus = VIRTIO_BUS(qbus);
     VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(vbus);
-    hwaddr s, l, a;
+    hwaddr a;
     int r;
     int vhost_vq_index = dev->vhost_ops->vhost_get_vq_index(dev, idx);
     struct vhost_vring_file file = {
@@ -1311,31 +1347,15 @@ static int vhost_virtqueue_start(struct vhost_dev *dev,
         }
     }
 
-    vq->desc_size = s = l = virtio_queue_get_desc_size(vdev, idx);
+    vq->desc_size = virtio_queue_get_desc_size(vdev, idx);
     vq->desc_phys = a;
-    vq->desc = vhost_memory_map(dev, a, &l, false);
-    if (!vq->desc || l != s) {
-        r = -ENOMEM;
-        goto fail_alloc;
-    }
-    vq->avail_size = s = l = virtio_queue_get_avail_size(vdev, idx);
-    vq->avail_phys = a = virtio_queue_get_avail_addr(vdev, idx);
-    vq->avail = vhost_memory_map(dev, a, &l, false);
-    if (!vq->avail || l != s) {
-        r = -ENOMEM;
-        goto fail_alloc;
-    }
-    vq->used_size = s = l = virtio_queue_get_used_size(vdev, idx);
-    vq->used_phys = a = virtio_queue_get_used_addr(vdev, idx);
-    vq->used = vhost_memory_map(dev, a, &l, true);
-    if (!vq->used || l != s) {
-        r = -ENOMEM;
-        goto fail_alloc;
-    }
+    vq->avail_size = virtio_queue_get_avail_size(vdev, idx);
+    vq->avail_phys = virtio_queue_get_avail_addr(vdev, idx);
+    vq->used_size = virtio_queue_get_used_size(vdev, idx);
+    vq->used_phys = virtio_queue_get_used_addr(vdev, idx);
 
-    r = vhost_virtqueue_set_addr(dev, vq, vhost_vq_index, dev->log_enabled);
-    if (r < 0) {
-        r = -errno;
+    r = vhost_virtqueue_memory_map(dev, vq, vhost_vq_index);
+    if (r) {
         goto fail_alloc;
     }
 
-- 
2.18.4


