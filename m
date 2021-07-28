Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 185223D8F9B
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 15:52:43 +0200 (CEST)
Received: from localhost ([::1]:60110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8jzG-0000p8-68
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 09:52:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1m8ju3-00052Y-PI
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 09:47:19 -0400
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3]:51748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1m8ju1-0005SM-UY
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 09:47:19 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: fahien) with ESMTPSA id B8C021F43849
From: Antonio Caggiano <antonio.caggiano@collabora.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/8] virtio-gpu: Shared memory capability
Date: Wed, 28 Jul 2021 15:46:30 +0200
Message-Id: <20210728134634.2142156-5-antonio.caggiano@collabora.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210728134634.2142156-1-antonio.caggiano@collabora.com>
References: <20210728134634.2142156-1-antonio.caggiano@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1098:0:82:1000:25:2eeb:e3e3;
 envelope-from=antonio.caggiano@collabora.com; helo=bhuna.collabora.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use VIRTIO_GPU_SHM_ID_HOST_VISIBLE as id for virtio-gpu. Also, remove
struct virtio_pci_shm_cap as virtio_pci_cap64 can be used instead.

Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
---
 hw/display/virtio-gpu-pci.c                 | 2 +-
 hw/display/virtio-vga.c                     | 2 +-
 hw/virtio/virtio-pci.c                      | 4 ++--
 include/standard-headers/linux/virtio_pci.h | 7 -------
 4 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/hw/display/virtio-gpu-pci.c b/hw/display/virtio-gpu-pci.c
index 9808663d05..a79bd751b2 100644
--- a/hw/display/virtio-gpu-pci.c
+++ b/hw/display/virtio-gpu-pci.c
@@ -43,7 +43,7 @@ static void virtio_gpu_pci_base_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
                          PCI_BASE_ADDRESS_MEM_PREFETCH |
                          PCI_BASE_ADDRESS_MEM_TYPE_64,
                          &g->hostmem);
-        virtio_pci_add_shm_cap(vpci_dev, 4, 0, g->conf.hostmem, 0);
+        virtio_pci_add_shm_cap(vpci_dev, 4, 0, g->conf.hostmem, VIRTIO_GPU_SHM_ID_HOST_VISIBLE);
     }
 
     qdev_set_parent_bus(vdev, BUS(&vpci_dev->bus), errp);
diff --git a/hw/display/virtio-vga.c b/hw/display/virtio-vga.c
index 61993dd3f2..ca841a0799 100644
--- a/hw/display/virtio-vga.c
+++ b/hw/display/virtio-vga.c
@@ -147,7 +147,7 @@ static void virtio_vga_base_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
                          PCI_BASE_ADDRESS_MEM_PREFETCH |
                          PCI_BASE_ADDRESS_MEM_TYPE_64,
                          &g->hostmem);
-        virtio_pci_add_shm_cap(vpci_dev, 4, 0, g->conf.hostmem, 0);
+        virtio_pci_add_shm_cap(vpci_dev, 4, 0, g->conf.hostmem, VIRTIO_GPU_SHM_ID_HOST_VISIBLE);
     }
 
     if (!(vpci_dev->flags & VIRTIO_PCI_FLAG_PAGE_PER_VQ)) {
diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 3589386412..37a50b4658 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1153,7 +1153,7 @@ int virtio_pci_add_shm_cap(VirtIOPCIProxy *proxy,
                            uint8_t bar, uint64_t offset, uint64_t length,
                            uint8_t id)
 {
-    struct virtio_pci_shm_cap cap = {
+    struct virtio_pci_cap64 cap = {
         .cap.cap_len = sizeof cap,
         .cap.cfg_type = VIRTIO_PCI_CAP_SHARED_MEMORY_CFG,
     };
@@ -1164,7 +1164,7 @@ int virtio_pci_add_shm_cap(VirtIOPCIProxy *proxy,
     cap.length_hi = cpu_to_le32((length >> 32) & mask32);
     cap.cap.offset = cpu_to_le32(offset & mask32);
     cap.offset_hi = cpu_to_le32((offset >> 32) & mask32);
-    cap.id = id;
+    cap.cap.id = id;
     return virtio_pci_add_mem_cap(proxy, &cap.cap);
 }
 
diff --git a/include/standard-headers/linux/virtio_pci.h b/include/standard-headers/linux/virtio_pci.h
index 85d1420d29..db7a8e2fcb 100644
--- a/include/standard-headers/linux/virtio_pci.h
+++ b/include/standard-headers/linux/virtio_pci.h
@@ -172,13 +172,6 @@ struct virtio_pci_cfg_cap {
 	uint8_t pci_cfg_data[4]; /* Data for BAR access. */
 };
 
-struct virtio_pci_shm_cap {
-	struct virtio_pci_cap cap;
-	uint32_t offset_hi;             /* Most sig 32 bits of offset */
-	uint32_t length_hi;             /* Most sig 32 bits of length */
-	uint8_t  id;                    /* To distinguish shm chunks */
-};
-
 /* Macro versions of offsets for the Old Timers! */
 #define VIRTIO_PCI_CAP_VNDR		0
 #define VIRTIO_PCI_CAP_NEXT		1
-- 
2.30.2


