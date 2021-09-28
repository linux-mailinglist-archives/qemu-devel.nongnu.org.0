Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 995F741B08F
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 15:33:37 +0200 (CEST)
Received: from localhost ([::1]:35392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVDEl-0006mw-0l
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 09:33:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1mVCxx-0007FL-Tx
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 09:16:13 -0400
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3]:46702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1mVCxj-0006rt-H4
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 09:16:13 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: fahien) with ESMTPSA id 8C96C1F43B6D
From: Antonio Caggiano <antonio.caggiano@collabora.com>
To: qemu-devel@nongnu.org
Subject: [RFC 2/3] virtio: Add shared memory capability
Date: Tue, 28 Sep 2021 15:15:47 +0200
Message-Id: <20210928131548.72005-3-antonio.caggiano@collabora.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210928131548.72005-1-antonio.caggiano@collabora.com>
References: <20210928131548.72005-1-antonio.caggiano@collabora.com>
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
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Define a new capability type 'VIRTIO_PCI_CAP_SHARED_MEMORY_CFG'
and the data structure 'virtio_pci_shm_cap' to go with it.
They allow defining shared memory regions with sizes and offsets
of 2^32 and more.
Multiple instances of the capability are allowed and distinguished
by a device-specific 'id'.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
(cherry picked from commit a5d628a3a3c5e60b98b15ffff197c36a77056115)
---
 hw/virtio/virtio-pci.c                      | 19 +++++++++++++++++++
 hw/virtio/virtio-pci.h                      |  4 ++++
 include/standard-headers/linux/virtio_pci.h |  7 +++++++
 3 files changed, 30 insertions(+)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 6e16e2705c..9c7b8942c8 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1162,6 +1162,25 @@ static int virtio_pci_add_mem_cap(VirtIOPCIProxy *proxy,
     return offset;
 }
 
+int virtio_pci_add_shm_cap(VirtIOPCIProxy *proxy,
+                           uint8_t bar, uint64_t offset, uint64_t length,
+                           uint8_t id)
+{
+    struct virtio_pci_shm_cap cap = {
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
+    cap.id = id;
+    return virtio_pci_add_mem_cap(proxy, &cap.cap);
+}
+
 static uint64_t virtio_pci_common_read(void *opaque, hwaddr addr,
                                        unsigned size)
 {
diff --git a/hw/virtio/virtio-pci.h b/hw/virtio/virtio-pci.h
index 2446dcd9ae..5e5c4a4c6d 100644
--- a/hw/virtio/virtio-pci.h
+++ b/hw/virtio/virtio-pci.h
@@ -252,4 +252,8 @@ void virtio_pci_types_register(const VirtioPCIDeviceTypeInfo *t);
  */
 unsigned virtio_pci_optimal_num_queues(unsigned fixed_queues);
 
+int virtio_pci_add_shm_cap(VirtIOPCIProxy *proxy,
+                           uint8_t bar, uint64_t offset, uint64_t length,
+                           uint8_t id);
+
 #endif
diff --git a/include/standard-headers/linux/virtio_pci.h b/include/standard-headers/linux/virtio_pci.h
index db7a8e2fcb..85d1420d29 100644
--- a/include/standard-headers/linux/virtio_pci.h
+++ b/include/standard-headers/linux/virtio_pci.h
@@ -172,6 +172,13 @@ struct virtio_pci_cfg_cap {
 	uint8_t pci_cfg_data[4]; /* Data for BAR access. */
 };
 
+struct virtio_pci_shm_cap {
+	struct virtio_pci_cap cap;
+	uint32_t offset_hi;             /* Most sig 32 bits of offset */
+	uint32_t length_hi;             /* Most sig 32 bits of length */
+	uint8_t  id;                    /* To distinguish shm chunks */
+};
+
 /* Macro versions of offsets for the Old Timers! */
 #define VIRTIO_PCI_CAP_VNDR		0
 #define VIRTIO_PCI_CAP_NEXT		1
-- 
2.30.2


