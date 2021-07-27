Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BA83D7BE8
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 19:12:47 +0200 (CEST)
Received: from localhost ([::1]:38590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8QdK-00005h-Qd
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 13:12:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1m8QWO-00008g-9E
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 13:05:36 -0400
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3]:36070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1m8QWK-0007Mj-LY
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 13:05:35 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: fahien) with ESMTPSA id 090E91F4331B
From: Antonio Caggiano <antonio.caggiano@collabora.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/7] virtio: Add shared memory capability
Date: Tue, 27 Jul 2021 19:05:06 +0200
Message-Id: <20210727170510.2116383-4-antonio.caggiano@collabora.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727170510.2116383-1-antonio.caggiano@collabora.com>
References: <20210727170510.2116383-1-antonio.caggiano@collabora.com>
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
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Antonio Caggiano <antonio.caggiano@collabora.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Define a new capability type 'VIRTIO_PCI_CAP_SHARED_MEMORY_CFG'.
They allow defining shared memory regions with sizes and offsets
of 2^32 and more.
Multiple instances of the capability are allowed and distinguished
by a device-specific 'id'.
Use VIRTIO_GPU_SHM_ID_HOST_VISIBLE as id for virtio-gpu.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
(cherry picked from commit a5d628a3a3c5e60b98b15ffff197c36a77056115)
---
 hw/display/virtio-gpu-pci.c |  2 +-
 hw/display/virtio-vga.c     |  2 +-
 hw/virtio/virtio-pci.c      | 19 +++++++++++++++++++
 hw/virtio/virtio-pci.h      |  5 +++++
 4 files changed, 26 insertions(+), 2 deletions(-)

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
index 433060ac02..37a50b4658 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1149,6 +1149,25 @@ static int virtio_pci_add_mem_cap(VirtIOPCIProxy *proxy,
     return offset;
 }
 
+int virtio_pci_add_shm_cap(VirtIOPCIProxy *proxy,
+                           uint8_t bar, uint64_t offset, uint64_t length,
+                           uint8_t id)
+{
+    struct virtio_pci_cap64 cap = {
+        .cap.cap_len = sizeof cap,
+        .cap.cfg_type = VIRTIO_PCI_CAP_SHARED_MEMORY_CFG,
+    };
+    uint32_t mask32 = ~0;
+
+    cap.cap.bar = bar;
+    cap.cap.length = cpu_to_le32(length & mask32);
+    cap.length_hi = cpu_to_le32((length >> 32) & mask32);
+    cap.cap.offset = cpu_to_le32(offset & mask32);
+    cap.offset_hi = cpu_to_le32((offset >> 32) & mask32);
+    cap.cap.id = id;
+    return virtio_pci_add_mem_cap(proxy, &cap.cap);
+}
+
 static uint64_t virtio_pci_common_read(void *opaque, hwaddr addr,
                                        unsigned size)
 {
diff --git a/hw/virtio/virtio-pci.h b/hw/virtio/virtio-pci.h
index 2446dcd9ae..25c4b7a32d 100644
--- a/hw/virtio/virtio-pci.h
+++ b/hw/virtio/virtio-pci.h
@@ -252,4 +252,9 @@ void virtio_pci_types_register(const VirtioPCIDeviceTypeInfo *t);
  */
 unsigned virtio_pci_optimal_num_queues(unsigned fixed_queues);
 
+/* Add shared memory capability */
+int virtio_pci_add_shm_cap(VirtIOPCIProxy *proxy,
+                           uint8_t bar, uint64_t offset, uint64_t length,
+                           uint8_t id);
+
 #endif
-- 
2.30.2


