Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAAF41C132
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 11:00:12 +0200 (CEST)
Received: from localhost ([::1]:38680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVVRi-0007UL-Ib
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 05:00:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1mVVPj-0005XP-HH
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 04:58:07 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:47898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1mVVPg-0005Cf-Lt
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 04:58:07 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: fahien) with ESMTPSA id A14251F44067
From: Antonio Caggiano <antonio.caggiano@collabora.com>
To: qemu-devel@nongnu.org
Subject: [RFC v2 2/2] virtio: Add shared memory capability
Date: Wed, 29 Sep 2021 10:57:50 +0200
Message-Id: <20210929085750.114507-3-antonio.caggiano@collabora.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210929085750.114507-1-antonio.caggiano@collabora.com>
References: <20210929085750.114507-1-antonio.caggiano@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=46.235.227.227;
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

v2: Remove virtio_pci_shm_cap as virtio_pci_cap64 is used instead.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
(cherry picked from commit a5d628a3a3c5e60b98b15ffff197c36a77056115)
Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
---
 hw/virtio/virtio-pci.c | 19 +++++++++++++++++++
 hw/virtio/virtio-pci.h |  4 ++++
 2 files changed, 23 insertions(+)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 6e16e2705c..200f1e38ef 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1162,6 +1162,25 @@ static int virtio_pci_add_mem_cap(VirtIOPCIProxy *proxy,
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
-- 
2.30.2


