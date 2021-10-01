Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD1841E81C
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 09:14:50 +0200 (CEST)
Received: from localhost ([::1]:52470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWCkr-0007Nu-Mt
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 03:14:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mWCfL-0006et-Vo
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 03:09:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mWCfJ-0002RA-Uv
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 03:09:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633072145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0XBf7eYZBNcPvk4C25u+XXOlbYb3AydMit/+nLqh3iM=;
 b=BtBMfQ2n6vDDZobYkAmtBK5ghq0I1p6IPASiTT2alqIT7pAMEVE+binuz1wVcl2lSUJwyN
 k0DxZI6ZERbhwEDRdc9Cv1FTW4PcWhq9AK+NjyeQ7S3N9GkPF4eG7G2gHjPy/YglsOHnGz
 5LIGuZDuLyrVYmdXDZCNsdzW4j8Yyvc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-2C-kbHlFMVmdfsoatg9yXw-1; Fri, 01 Oct 2021 03:07:18 -0400
X-MC-Unique: 2C-kbHlFMVmdfsoatg9yXw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77AC2362FB;
 Fri,  1 Oct 2021 07:07:17 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F63B652A9;
 Fri,  1 Oct 2021 07:06:35 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v4 01/20] virtio: Add VIRTIO_F_QUEUE_STATE
Date: Fri,  1 Oct 2021 09:05:44 +0200
Message-Id: <20211001070603.307037-2-eperezma@redhat.com>
In-Reply-To: <20211001070603.307037-1-eperezma@redhat.com>
References: <20211001070603.307037-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Parav Pandit <parav@mellanox.com>, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Eric Blake <eblake@redhat.com>, Michael Lilja <ml@napatech.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

virtio: Add VIRTIO_F_QUEUE_STATE

Implementation of RFC of device state capability:
https://lists.oasis-open.org/archives/virtio-comment/202012/msg00005.html

With this capability, vdpa device can reset it's index so it can start
consuming from guest after disabling shadow virtqueue (SVQ), with state
not 0.

The use case is to test SVQ with virtio-pci vdpa (vp_vdpa) with nested
virtualization. Spawning a L0 qemu with a virtio-net device, use
vp_vdpa driver to handle it in the guest, and then spawn a L1 qemu using
that vdpa device. When L1 qemu calls device to set a new state though
vdpa ioctl, vp_vdpa should set each queue state though virtio
VIRTIO_PCI_COMMON_Q_AVAIL_STATE.

Since this is only for testing vhost-vdpa, it's added here before of
proposing to kernel code. No effort is done for checking that device
can actually change its state, its layout, or if the device even
supports to change state at all. These will be added in the future.

Also, a modified version of vp_vdpa that allows to set these in PCI
config is needed.

TODO: Check for feature enabled and split in virtio pci config

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/virtio-pci.h                         | 1 +
 include/hw/virtio/virtio.h                     | 4 +++-
 include/standard-headers/linux/virtio_config.h | 3 +++
 include/standard-headers/linux/virtio_pci.h    | 2 ++
 hw/virtio/virtio-pci.c                         | 9 +++++++++
 5 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/virtio-pci.h b/hw/virtio/virtio-pci.h
index 2446dcd9ae..019badbd7c 100644
--- a/hw/virtio/virtio-pci.h
+++ b/hw/virtio/virtio-pci.h
@@ -120,6 +120,7 @@ typedef struct VirtIOPCIQueue {
   uint32_t desc[2];
   uint32_t avail[2];
   uint32_t used[2];
+  uint16_t state;
 } VirtIOPCIQueue;
 
 struct VirtIOPCIProxy {
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 8bab9cfb75..5fe575b8f0 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -289,7 +289,9 @@ typedef struct VirtIORNGConf VirtIORNGConf;
     DEFINE_PROP_BIT64("iommu_platform", _state, _field, \
                       VIRTIO_F_IOMMU_PLATFORM, false), \
     DEFINE_PROP_BIT64("packed", _state, _field, \
-                      VIRTIO_F_RING_PACKED, false)
+                      VIRTIO_F_RING_PACKED, false), \
+    DEFINE_PROP_BIT64("save_restore_q_state", _state, _field, \
+                      VIRTIO_F_QUEUE_STATE, true)
 
 hwaddr virtio_queue_get_desc_addr(VirtIODevice *vdev, int n);
 bool virtio_queue_enabled_legacy(VirtIODevice *vdev, int n);
diff --git a/include/standard-headers/linux/virtio_config.h b/include/standard-headers/linux/virtio_config.h
index 22e3a85f67..59fad3eb45 100644
--- a/include/standard-headers/linux/virtio_config.h
+++ b/include/standard-headers/linux/virtio_config.h
@@ -90,4 +90,7 @@
  * Does the device support Single Root I/O Virtualization?
  */
 #define VIRTIO_F_SR_IOV			37
+
+/* Device support save and restore virtqueue state */
+#define VIRTIO_F_QUEUE_STATE            40
 #endif /* _LINUX_VIRTIO_CONFIG_H */
diff --git a/include/standard-headers/linux/virtio_pci.h b/include/standard-headers/linux/virtio_pci.h
index db7a8e2fcb..c8d9802a87 100644
--- a/include/standard-headers/linux/virtio_pci.h
+++ b/include/standard-headers/linux/virtio_pci.h
@@ -164,6 +164,7 @@ struct virtio_pci_common_cfg {
 	uint32_t queue_avail_hi;		/* read-write */
 	uint32_t queue_used_lo;		/* read-write */
 	uint32_t queue_used_hi;		/* read-write */
+	uint16_t queue_avail_state;     /* read-write */
 };
 
 /* Fields in VIRTIO_PCI_CAP_PCI_CFG: */
@@ -202,6 +203,7 @@ struct virtio_pci_cfg_cap {
 #define VIRTIO_PCI_COMMON_Q_AVAILHI	44
 #define VIRTIO_PCI_COMMON_Q_USEDLO	48
 #define VIRTIO_PCI_COMMON_Q_USEDHI	52
+#define VIRTIO_PCI_COMMON_Q_AVAIL_STATE	56
 
 #endif /* VIRTIO_PCI_NO_MODERN */
 
diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index b321604d9b..6f30118c4e 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1216,6 +1216,9 @@ static uint64_t virtio_pci_common_read(void *opaque, hwaddr addr,
     case VIRTIO_PCI_COMMON_Q_USEDHI:
         val = proxy->vqs[vdev->queue_sel].used[1];
         break;
+    case VIRTIO_PCI_COMMON_Q_AVAIL_STATE:
+        val = virtio_queue_get_last_avail_idx(vdev, vdev->queue_sel);
+        break;
     default:
         val = 0;
     }
@@ -1298,6 +1301,8 @@ static void virtio_pci_common_write(void *opaque, hwaddr addr,
                        proxy->vqs[vdev->queue_sel].avail[0],
                        ((uint64_t)proxy->vqs[vdev->queue_sel].used[1]) << 32 |
                        proxy->vqs[vdev->queue_sel].used[0]);
+            virtio_queue_set_last_avail_idx(vdev, vdev->queue_sel,
+                        proxy->vqs[vdev->queue_sel].state);
             proxy->vqs[vdev->queue_sel].enabled = 1;
         } else {
             virtio_error(vdev, "wrong value for queue_enable %"PRIx64, val);
@@ -1321,6 +1326,9 @@ static void virtio_pci_common_write(void *opaque, hwaddr addr,
     case VIRTIO_PCI_COMMON_Q_USEDHI:
         proxy->vqs[vdev->queue_sel].used[1] = val;
         break;
+    case VIRTIO_PCI_COMMON_Q_AVAIL_STATE:
+        proxy->vqs[vdev->queue_sel].state = val;
+        break;
     default:
         break;
     }
@@ -1909,6 +1917,7 @@ static void virtio_pci_reset(DeviceState *qdev)
         proxy->vqs[i].desc[0] = proxy->vqs[i].desc[1] = 0;
         proxy->vqs[i].avail[0] = proxy->vqs[i].avail[1] = 0;
         proxy->vqs[i].used[0] = proxy->vqs[i].used[1] = 0;
+        proxy->vqs[i].state = 0;
     }
 
     if (pci_is_express(dev)) {
-- 
2.27.0


