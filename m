Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA04B44C545
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 17:44:35 +0100 (CET)
Received: from localhost ([::1]:56850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkqiB-0003Da-0C
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 11:44:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1mkqgL-00012U-Oz
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 11:42:41 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:36766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1mkqgJ-0006xC-22
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 11:42:41 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: fahien) with ESMTPSA id C52091F44DAB
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1636562556; bh=Q591oo47FiUrYdmbxPmGbayyrDc6TPSJ0nYZhGSRLPI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NCkhJ7Y/QKFdrD8rx+nTAWL41+DJo42N9hPUuGcr+HUax6cHAVCuoYcZjD5GZoXti
 DhUTWqZ0MjInqe1ee3mIO6eQNUQZ5ldho7sQzgqzhVP91x1oVxlNhdItB/RZkEQNT4
 IyKs50xgo1lY7kG1tSXOE8L70o+jHvPFYl3mSkt3cAPnN4eio5WgJ1kdFsrgE3tdU3
 oCbIIbPYshR0H29tPBm+Cx0bNTIomY9TNYruEzC+2hZkXvVCQ1WV/xAbM0FeGJ9HuY
 vMgw+ar9XrKBFDWV6AOo3+McrMdRicDSvnztRMkbM1l0LkMIfYkQhZO9jK54t3v5d9
 RZidTDN1WsnZA==
From: Antonio Caggiano <antonio.caggiano@collabora.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] virtio-gpu: hostmem
Date: Wed, 10 Nov 2021 17:42:19 +0100
Message-Id: <20211110164220.273641-2-antonio.caggiano@collabora.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211110164220.273641-1-antonio.caggiano@collabora.com>
References: <20211110164220.273641-1-antonio.caggiano@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=46.235.227.227;
 envelope-from=antonio.caggiano@collabora.com; helo=bhuna.collabora.co.uk
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gerd Hoffmann <kraxel@redhat.com>

Use VIRTIO_GPU_SHM_ID_HOST_VISIBLE as id for virtio-gpu.

Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
---
 hw/display/virtio-gpu-pci.c    | 14 ++++++++++++++
 hw/display/virtio-gpu.c        |  1 +
 hw/display/virtio-vga.c        | 32 +++++++++++++++++++++++---------
 include/hw/virtio/virtio-gpu.h |  5 +++++
 4 files changed, 43 insertions(+), 9 deletions(-)

diff --git a/hw/display/virtio-gpu-pci.c b/hw/display/virtio-gpu-pci.c
index e36eee0c40..a79bd751b2 100644
--- a/hw/display/virtio-gpu-pci.c
+++ b/hw/display/virtio-gpu-pci.c
@@ -33,6 +33,20 @@ static void virtio_gpu_pci_base_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
     DeviceState *vdev = DEVICE(g);
     int i;
 
+    if (virtio_gpu_hostmem_enabled(g->conf)) {
+        vpci_dev->msix_bar_idx = 1;
+        vpci_dev->modern_mem_bar_idx = 2;
+        memory_region_init(&g->hostmem, OBJECT(g), "virtio-gpu-hostmem",
+                           g->conf.hostmem);
+        pci_register_bar(&vpci_dev->pci_dev, 4,
+                         PCI_BASE_ADDRESS_SPACE_MEMORY |
+                         PCI_BASE_ADDRESS_MEM_PREFETCH |
+                         PCI_BASE_ADDRESS_MEM_TYPE_64,
+                         &g->hostmem);
+        virtio_pci_add_shm_cap(vpci_dev, 4, 0, g->conf.hostmem, VIRTIO_GPU_SHM_ID_HOST_VISIBLE);
+    }
+
+    qdev_set_parent_bus(vdev, BUS(&vpci_dev->bus), errp);
     virtio_pci_force_virtio_1(vpci_dev);
     if (!qdev_realize(vdev, BUS(&vpci_dev->bus), errp)) {
         return;
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index d78b9700c7..1cfcb81c1b 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -1418,6 +1418,7 @@ static Property virtio_gpu_properties[] = {
                      256 * MiB),
     DEFINE_PROP_BIT("blob", VirtIOGPU, parent_obj.conf.flags,
                     VIRTIO_GPU_FLAG_BLOB_ENABLED, false),
+    DEFINE_PROP_SIZE("hostmem", VirtIOGPU, parent_obj.conf.hostmem, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/display/virtio-vga.c b/hw/display/virtio-vga.c
index 9e57f61e9e..ca841a0799 100644
--- a/hw/display/virtio-vga.c
+++ b/hw/display/virtio-vga.c
@@ -125,16 +125,30 @@ static void virtio_vga_base_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
     pci_register_bar(&vpci_dev->pci_dev, 0,
                      PCI_BASE_ADDRESS_MEM_PREFETCH, &vga->vram);
 
-    /*
-     * Configure virtio bar and regions
-     *
-     * We use bar #2 for the mmio regions, to be compatible with stdvga.
-     * virtio regions are moved to the end of bar #2, to make room for
-     * the stdvga mmio registers at the start of bar #2.
-     */
-    vpci_dev->modern_mem_bar_idx = 2;
-    vpci_dev->msix_bar_idx = 4;
     vpci_dev->modern_io_bar_idx = 5;
+  
+    if (!virtio_gpu_hostmem_enabled(g->conf)) {
+        /*
+        * Configure virtio bar and regions
+        *
+        * We use bar #2 for the mmio regions, to be compatible with stdvga.
+        * virtio regions are moved to the end of bar #2, to make room for
+        * the stdvga mmio registers at the start of bar #2.
+        */
+        vpci_dev->modern_mem_bar_idx = 2;
+        vpci_dev->msix_bar_idx = 4;
+    } else {
+        vpci_dev->msix_bar_idx = 1;
+        vpci_dev->modern_mem_bar_idx = 2;
+        memory_region_init(&g->hostmem, OBJECT(g), "virtio-gpu-hostmem",
+                           g->conf.hostmem);
+        pci_register_bar(&vpci_dev->pci_dev, 4,
+                         PCI_BASE_ADDRESS_SPACE_MEMORY |
+                         PCI_BASE_ADDRESS_MEM_PREFETCH |
+                         PCI_BASE_ADDRESS_MEM_TYPE_64,
+                         &g->hostmem);
+        virtio_pci_add_shm_cap(vpci_dev, 4, 0, g->conf.hostmem, VIRTIO_GPU_SHM_ID_HOST_VISIBLE);
+    }
 
     if (!(vpci_dev->flags & VIRTIO_PCI_FLAG_PAGE_PER_VQ)) {
         /*
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index acfba7c76c..3963cb4f86 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -102,12 +102,15 @@ enum virtio_gpu_base_conf_flags {
     (_cfg.flags & (1 << VIRTIO_GPU_FLAG_DMABUF_ENABLED))
 #define virtio_gpu_blob_enabled(_cfg) \
     (_cfg.flags & (1 << VIRTIO_GPU_FLAG_BLOB_ENABLED))
+#define virtio_gpu_hostmem_enabled(_cfg) \
+    (_cfg.hostmem > 0)
 
 struct virtio_gpu_base_conf {
     uint32_t max_outputs;
     uint32_t flags;
     uint32_t xres;
     uint32_t yres;
+    uint64_t hostmem;
 };
 
 struct virtio_gpu_ctrl_command {
@@ -131,6 +134,8 @@ struct VirtIOGPUBase {
     int renderer_blocked;
     int enable;
 
+    MemoryRegion hostmem;
+
     struct virtio_gpu_scanout scanout[VIRTIO_GPU_MAX_SCANOUTS];
 
     int enabled_output_bitmask;
-- 
2.32.0


