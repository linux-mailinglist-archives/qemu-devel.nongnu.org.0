Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F842BB4C1
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 20:05:06 +0100 (CET)
Received: from localhost ([::1]:58416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgBiT-0007Vy-Gu
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 14:05:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kgBWr-00050M-7r
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 13:53:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kgBWh-0007Cn-0f
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 13:53:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605898374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PHs7w9gRWn5Mh5hB2N7v2usauab9QEU61xYfrhNJnDI=;
 b=alqDTXGfrJTpNAPLNvDSicdLpX/hRZXQhDf46ZOg4dRtIngwveUWDTHWMcxEgSX0z9MSAr
 pfp+fMd/a/sWe3wUu4J0GwKHZionJ1gR3e9GAub1jx9ih+tQ5dracp0FB2yMbqTBCvgBx9
 PqJ50GO99si1geZxZSPsV96jcCLR6O4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-GxLlklPmNPC1LNXpQGTGGQ-1; Fri, 20 Nov 2020 13:52:51 -0500
X-MC-Unique: GxLlklPmNPC1LNXpQGTGGQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5249C5B36A;
 Fri, 20 Nov 2020 18:52:48 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-112-88.ams2.redhat.com [10.36.112.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D1B785C1D5;
 Fri, 20 Nov 2020 18:52:32 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 07/27] vhost: Route guest->host notification through qemu
Date: Fri, 20 Nov 2020 19:50:45 +0100
Message-Id: <20201120185105.279030-8-eperezma@redhat.com>
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
 hw/virtio/vhost-sw-lm-ring.h |  26 +++++++++
 include/hw/virtio/vhost.h    |   3 ++
 hw/virtio/vhost-sw-lm-ring.c |  60 +++++++++++++++++++++
 hw/virtio/vhost.c            | 100 +++++++++++++++++++++++++++++++++--
 hw/virtio/meson.build        |   2 +-
 5 files changed, 187 insertions(+), 4 deletions(-)
 create mode 100644 hw/virtio/vhost-sw-lm-ring.h
 create mode 100644 hw/virtio/vhost-sw-lm-ring.c

diff --git a/hw/virtio/vhost-sw-lm-ring.h b/hw/virtio/vhost-sw-lm-ring.h
new file mode 100644
index 0000000000..86dc081b93
--- /dev/null
+++ b/hw/virtio/vhost-sw-lm-ring.h
@@ -0,0 +1,26 @@
+/*
+ * vhost software live migration ring
+ *
+ * SPDX-FileCopyrightText: Red Hat, Inc. 2020
+ * SPDX-FileContributor: Author: Eugenio Pérez <eperezma@redhat.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef VHOST_SW_LM_RING_H
+#define VHOST_SW_LM_RING_H
+
+#include "qemu/osdep.h"
+
+#include "hw/virtio/virtio.h"
+#include "hw/virtio/vhost.h"
+
+typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
+
+bool vhost_vring_kick(VhostShadowVirtqueue *vq);
+
+VhostShadowVirtqueue *vhost_sw_lm_shadow_vq(struct vhost_dev *dev, int idx);
+
+void vhost_sw_lm_shadow_vq_free(VhostShadowVirtqueue *vq);
+
+#endif
diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index b5b7496537..93cc3f1ae3 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -54,6 +54,8 @@ struct vhost_iommu {
     QLIST_ENTRY(vhost_iommu) iommu_next;
 };
 
+typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
+
 typedef struct VhostDevConfigOps {
     /* Vhost device config space changed callback
      */
@@ -83,6 +85,7 @@ struct vhost_dev {
     bool started;
     bool log_enabled;
     uint64_t log_size;
+    VhostShadowVirtqueue *sw_lm_shadow_vq[2];
     VirtIOHandleOutput sw_lm_vq_handler;
     Error *migration_blocker;
     const VhostOps *vhost_ops;
diff --git a/hw/virtio/vhost-sw-lm-ring.c b/hw/virtio/vhost-sw-lm-ring.c
new file mode 100644
index 0000000000..0192e77831
--- /dev/null
+++ b/hw/virtio/vhost-sw-lm-ring.c
@@ -0,0 +1,60 @@
+/*
+ * vhost software live migration ring
+ *
+ * SPDX-FileCopyrightText: Red Hat, Inc. 2020
+ * SPDX-FileContributor: Author: Eugenio Pérez <eperezma@redhat.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "hw/virtio/vhost-sw-lm-ring.h"
+#include "hw/virtio/vhost.h"
+
+#include "standard-headers/linux/vhost_types.h"
+#include "standard-headers/linux/virtio_ring.h"
+
+#include "qemu/event_notifier.h"
+
+typedef struct VhostShadowVirtqueue {
+    EventNotifier hdev_notifier;
+    VirtQueue *vq;
+} VhostShadowVirtqueue;
+
+static inline bool vhost_vring_should_kick(VhostShadowVirtqueue *vq)
+{
+    return virtio_queue_get_used_notify_split(vq->vq);
+}
+
+bool vhost_vring_kick(VhostShadowVirtqueue *vq)
+{
+    return vhost_vring_should_kick(vq) ? event_notifier_set(&vq->hdev_notifier)
+                                       : true;
+}
+
+VhostShadowVirtqueue *vhost_sw_lm_shadow_vq(struct vhost_dev *dev, int idx)
+{
+    struct vhost_vring_file file = {
+        .index = idx
+    };
+    VirtQueue *vq = virtio_get_queue(dev->vdev, idx);
+    VhostShadowVirtqueue *svq;
+    int r;
+
+    svq = g_new0(VhostShadowVirtqueue, 1);
+    svq->vq = vq;
+
+    r = event_notifier_init(&svq->hdev_notifier, 0);
+    assert(r == 0);
+
+    file.fd = event_notifier_get_fd(&svq->hdev_notifier);
+    r = dev->vhost_ops->vhost_set_vring_kick(dev, &file);
+    assert(r == 0);
+
+    return svq;
+}
+
+void vhost_sw_lm_shadow_vq_free(VhostShadowVirtqueue *vq)
+{
+    event_notifier_cleanup(&vq->hdev_notifier);
+    g_free(vq);
+}
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 9cbd52a7f1..a55b684b5f 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -13,6 +13,8 @@
  * GNU GPL, version 2 or (at your option) any later version.
  */
 
+#include "hw/virtio/vhost-sw-lm-ring.h"
+
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/virtio/vhost.h"
@@ -61,6 +63,20 @@ bool vhost_has_free_slot(void)
     return slots_limit > used_memslots;
 }
 
+static struct vhost_dev *vhost_dev_from_virtio(const VirtIODevice *vdev)
+{
+    struct vhost_dev *hdev;
+
+    QLIST_FOREACH(hdev, &vhost_devices, entry) {
+        if (hdev->vdev == vdev) {
+            return hdev;
+        }
+    }
+
+    assert(hdev);
+    return NULL;
+}
+
 static bool vhost_dev_can_log(const struct vhost_dev *hdev)
 {
     return hdev->features & (0x1ULL << VHOST_F_LOG_ALL);
@@ -148,6 +164,12 @@ static int vhost_sync_dirty_bitmap(struct vhost_dev *dev,
     return 0;
 }
 
+static void vhost_log_sync_nop(MemoryListener *listener,
+                               MemoryRegionSection *section)
+{
+    return;
+}
+
 static void vhost_log_sync(MemoryListener *listener,
                           MemoryRegionSection *section)
 {
@@ -928,6 +950,71 @@ static void vhost_log_global_stop(MemoryListener *listener)
     }
 }
 
+static void handle_sw_lm_vq(VirtIODevice *vdev, VirtQueue *vq)
+{
+    struct vhost_dev *hdev = vhost_dev_from_virtio(vdev);
+    uint16_t idx = virtio_get_queue_index(vq);
+
+    VhostShadowVirtqueue *svq = hdev->sw_lm_shadow_vq[idx];
+
+    vhost_vring_kick(svq);
+}
+
+static int vhost_sw_live_migration_stop(struct vhost_dev *dev)
+{
+    int idx;
+
+    vhost_dev_enable_notifiers(dev, dev->vdev);
+    for (idx = 0; idx < dev->nvqs; ++idx) {
+        vhost_sw_lm_shadow_vq_free(dev->sw_lm_shadow_vq[idx]);
+    }
+
+    return 0;
+}
+
+static int vhost_sw_live_migration_start(struct vhost_dev *dev)
+{
+    int idx;
+
+    for (idx = 0; idx < dev->nvqs; ++idx) {
+        dev->sw_lm_shadow_vq[idx] = vhost_sw_lm_shadow_vq(dev, idx);
+    }
+
+    vhost_dev_disable_notifiers(dev, dev->vdev);
+
+    return 0;
+}
+
+static int vhost_sw_live_migration_enable(struct vhost_dev *dev,
+                                          bool enable_lm)
+{
+    if (enable_lm) {
+        return vhost_sw_live_migration_start(dev);
+    } else {
+        return vhost_sw_live_migration_stop(dev);
+    }
+}
+
+static void vhost_sw_lm_global_start(MemoryListener *listener)
+{
+    int r;
+
+    r = vhost_migration_log(listener, true, vhost_sw_live_migration_enable);
+    if (r < 0) {
+        abort();
+    }
+}
+
+static void vhost_sw_lm_global_stop(MemoryListener *listener)
+{
+    int r;
+
+    r = vhost_migration_log(listener, false, vhost_sw_live_migration_enable);
+    if (r < 0) {
+        abort();
+    }
+}
+
 static void vhost_log_start(MemoryListener *listener,
                             MemoryRegionSection *section,
                             int old, int new)
@@ -1334,9 +1421,14 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
         .region_nop = vhost_region_addnop,
         .log_start = vhost_log_start,
         .log_stop = vhost_log_stop,
-        .log_sync = vhost_log_sync,
-        .log_global_start = vhost_log_global_start,
-        .log_global_stop = vhost_log_global_stop,
+        .log_sync = !vhost_dev_can_log(hdev) ?
+                    vhost_log_sync_nop :
+                    vhost_log_sync,
+        .log_global_start = !vhost_dev_can_log(hdev) ?
+                            vhost_sw_lm_global_start :
+                            vhost_log_global_start,
+        .log_global_stop = !vhost_dev_can_log(hdev) ? vhost_sw_lm_global_stop :
+                                                      vhost_log_global_stop,
         .eventfd_add = vhost_eventfd_add,
         .eventfd_del = vhost_eventfd_del,
         .priority = 10
@@ -1364,6 +1456,8 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
             error_free(hdev->migration_blocker);
             goto fail_busyloop;
         }
+    } else {
+        hdev->sw_lm_vq_handler = handle_sw_lm_vq;
     }
 
     hdev->mem = g_malloc0(offsetof(struct vhost_memory, regions));
diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index fbff9bc9d4..17419cb13e 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -11,7 +11,7 @@ softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('vhost-stub.c'))
 
 virtio_ss = ss.source_set()
 virtio_ss.add(files('virtio.c'))
-virtio_ss.add(when: 'CONFIG_VHOST', if_true: files('vhost.c', 'vhost-backend.c'))
+virtio_ss.add(when: 'CONFIG_VHOST', if_true: files('vhost.c', 'vhost-backend.c', 'vhost-sw-lm-ring.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_USER', if_true: files('vhost-user.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_VDPA', if_true: files('vhost-vdpa.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_BALLOON', if_true: files('virtio-balloon.c'))
-- 
2.18.4


