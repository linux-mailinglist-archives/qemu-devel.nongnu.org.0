Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 313EF2BB4C8
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 20:09:57 +0100 (CET)
Received: from localhost ([::1]:38756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgBnA-0002pS-6T
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 14:09:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kgBXP-0005P7-2r
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 13:53:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kgBXK-0007LJ-UH
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 13:53:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605898412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u/Ojn4cpi7xAVMskNFT0feT7MkBDEW4NMg9WWPtVNhY=;
 b=ee8D6rCEOQJnungZiScW+nZ8NWam0KBxqbj8e9H5gFlvVZYB91Vjcawm+DMunipMmS3caQ
 R1mqqf1DH8YfDuY2Xbe13AY0zObcczSobLExm0bHLvl3FTPIEHFeXvNeG4FX8fBtHDFXDU
 s875UpWOvYwUGGkqwqftne4FcDneZ8Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-syOVuANoOUy-jKfm_jOXDg-1; Fri, 20 Nov 2020 13:53:27 -0500
X-MC-Unique: syOVuANoOUy-jKfm_jOXDg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3EFBC8145E2;
 Fri, 20 Nov 2020 18:53:24 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-112-88.ams2.redhat.com [10.36.112.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 66FD25C230;
 Fri, 20 Nov 2020 18:53:08 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 09/27] vhost: Route host->guest notification through qemu
Date: Fri, 20 Nov 2020 19:50:47 +0100
Message-Id: <20201120185105.279030-10-eperezma@redhat.com>
In-Reply-To: <20201120185105.279030-1-eperezma@redhat.com>
References: <20201120185105.279030-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-sw-lm-ring.c |  3 +++
 hw/virtio/vhost.c            | 20 ++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/hw/virtio/vhost-sw-lm-ring.c b/hw/virtio/vhost-sw-lm-ring.c
index 0192e77831..cbf53965cd 100644
--- a/hw/virtio/vhost-sw-lm-ring.c
+++ b/hw/virtio/vhost-sw-lm-ring.c
@@ -50,6 +50,9 @@ VhostShadowVirtqueue *vhost_sw_lm_shadow_vq(struct vhost_dev *dev, int idx)
     r = dev->vhost_ops->vhost_set_vring_kick(dev, &file);
     assert(r == 0);
 
+    vhost_virtqueue_mask(dev, dev->vdev, idx, true);
+    vhost_virtqueue_pending(dev, idx);
+
     return svq;
 }
 
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 1d55e26d45..9352c56bfa 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -960,12 +960,29 @@ static void handle_sw_lm_vq(VirtIODevice *vdev, VirtQueue *vq)
     vhost_vring_kick(svq);
 }
 
+static void vhost_handle_call(EventNotifier *n)
+{
+    struct vhost_virtqueue *hvq = container_of(n,
+                                              struct vhost_virtqueue,
+                                              masked_notifier);
+    struct vhost_dev *vdev = hvq->dev;
+    int idx = vdev->vq_index + (hvq == &vdev->vqs[0] ? 0 : 1);
+    VirtQueue *vq = virtio_get_queue(vdev->vdev, idx);
+
+    if (event_notifier_test_and_clear(n)) {
+        virtio_queue_invalidate_signalled_used(vdev->vdev, idx);
+        virtio_notify_irqfd(vdev->vdev, vq);
+    }
+}
+
 static int vhost_sw_live_migration_stop(struct vhost_dev *dev)
 {
     int idx;
 
     vhost_dev_enable_notifiers(dev, dev->vdev);
     for (idx = 0; idx < dev->nvqs; ++idx) {
+        vhost_virtqueue_mask(dev, dev->vdev, idx, false);
+        vhost_virtqueue_pending(dev, idx);
         vhost_sw_lm_shadow_vq_free(dev->sw_lm_shadow_vq[idx]);
     }
 
@@ -977,7 +994,10 @@ static int vhost_sw_live_migration_start(struct vhost_dev *dev)
     int idx;
 
     for (idx = 0; idx < dev->nvqs; ++idx) {
+        struct vhost_virtqueue *vq = &dev->vqs[idx];
+
         dev->sw_lm_shadow_vq[idx] = vhost_sw_lm_shadow_vq(dev, idx);
+        event_notifier_set_handler(&vq->masked_notifier, vhost_handle_call);
     }
 
     vhost_dev_disable_notifiers(dev, dev->vdev);
-- 
2.18.4


