Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1515BCD0C
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 15:25:16 +0200 (CEST)
Received: from localhost ([::1]:33186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaGlv-0003mH-IN
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 09:25:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1oaGeI-0008NN-O7
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 09:17:36 -0400
Received: from madras.collabora.co.uk
 ([2a00:1098:0:82:1000:25:2eeb:e5ab]:55406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1oaGeG-00067c-7u
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 09:17:22 -0400
Received: from dellino.fritz.box (host-82-49-101-130.retail.telecomitalia.it
 [82.49.101.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: fahien)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 669C266019EE;
 Mon, 19 Sep 2022 14:17:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663593436;
 bh=I7xKQXYoZG40sEbey3ZyL/b1CNjsa17oI2aGBWEKpOU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JgIWS78JSZFV+2UuMjkT7e+6dymz1Mte1Qorcr6/k5I5eNFpOYjeArfkG+FkDVDOi
 XjWqfBu+R2A0Fk03olueuteQBdzGjvPKBCaH6m8OVT7Qyzt3UR3m8LSIqck7TqwhRs
 HGfCCGsTGBTC3TKcK+/0EDSVzStR9JBqcf3HOywQ01xhZ/oP665+P2XSPhr69tSOD2
 MqzKyZZ0k8Fo6kQDD5L3EyMseVXgvaQ7AWiwCVUEsGp8ht4/WUz7lt0UMtEeiwjfT9
 7bNpIXwyPHWbATg0mW5hFa4XBvkcTeX03w3zx963hC3LoIumONTH/zq/iay3b1VIP2
 bqkDLyM38o71g==
From: Antonio Caggiano <antonio.caggiano@collabora.com>
To: qemu-devel@nongnu.org
Cc: gert.wollny@collabora.com, dmitry.osipenko@collabora.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v3 1/4] virtio: Add shared memory capability
Date: Mon, 19 Sep 2022 15:16:59 +0200
Message-Id: <20220919131702.94875-2-antonio.caggiano@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220919131702.94875-1-antonio.caggiano@collabora.com>
References: <20220919131702.94875-1-antonio.caggiano@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1098:0:82:1000:25:2eeb:e5ab;
 envelope-from=antonio.caggiano@collabora.com; helo=madras.collabora.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Define a new capability type 'VIRTIO_PCI_CAP_SHARED_MEMORY_CFG' to allow
defining shared memory regions with sizes and offsets of 2^32 and more.
Multiple instances of the capability are allowed and distinguished
by a device-specific 'id'.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
---
v2: Remove virtio_pci_shm_cap as virtio_pci_cap64 is used instead.
v3: No need for mask32 as cpu_to_le32 truncates the value.

 hw/virtio/virtio-pci.c         | 18 ++++++++++++++++++

 include/hw/virtio/virtio-pci.h |  4 ++++
 2 files changed, 22 insertions(+)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index a50c5a57d7..377bb06fec 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1169,6 +1169,24 @@ static int virtio_pci_add_mem_cap(VirtIOPCIProxy *proxy,
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
+
+    cap.cap.bar = bar;
+    cap.cap.length = cpu_to_le32(length);
+    cap.length_hi = cpu_to_le32(length >> 32);
+    cap.cap.offset = cpu_to_le32(offset);
+    cap.offset_hi = cpu_to_le32(offset >> 32);
+    cap.cap.id = id;
+    return virtio_pci_add_mem_cap(proxy, &cap.cap);
+}
+
 static uint64_t virtio_pci_common_read(void *opaque, hwaddr addr,
                                        unsigned size)
 {
diff --git a/include/hw/virtio/virtio-pci.h b/include/hw/virtio/virtio-pci.h
index 2446dcd9ae..5e5c4a4c6d 100644
--- a/include/hw/virtio/virtio-pci.h
+++ b/include/hw/virtio/virtio-pci.h
@@ -252,4 +252,8 @@ void virtio_pci_types_register(const VirtioPCIDeviceTypeInfo *t);
  */
 unsigned virtio_pci_optimal_num_queues(unsigned fixed_queues);
 
+int virtio_pci_add_shm_cap(VirtIOPCIProxy *proxy,
+                           uint8_t bar, uint64_t offset, uint64_t length,
+                           uint8_t id);
+
 #endif
-- 
2.34.1


