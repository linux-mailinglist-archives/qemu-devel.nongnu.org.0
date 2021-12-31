Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6764823DD
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 12:58:54 +0100 (CET)
Received: from localhost ([::1]:47666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3GYf-0006bo-2Y
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 06:58:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3GPl-0002xh-R9
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 06:49:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3GPj-0000KN-3S
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 06:49:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640951378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VWOQCoOQErbEn0u8LJsn620oYxNKcQdFiEhqtenCnB4=;
 b=aMZrLbu2STCz6WnO8fyfiOvb4toTx8kgBVNrMratsaDQNyG0hxQ+p2h1SyWZHm7UJEpRpv
 f3J63e3/tPX7e64Xn7gdarwiF3uKXrU0pJfvzvSjxNJAz62paLCmCn2PD1bv9EwlA7CZFY
 rZmByMAP0WM9dZ6My1bEzSwpH7ls03Q=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-31-V3_WAHklMRepBSojx4Aldg-1; Fri, 31 Dec 2021 06:49:37 -0500
X-MC-Unique: V3_WAHklMRepBSojx4Aldg-1
Received: by mail-wr1-f69.google.com with SMTP id
 r7-20020adfbb07000000b001a254645f13so7529238wrg.7
 for <qemu-devel@nongnu.org>; Fri, 31 Dec 2021 03:49:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VWOQCoOQErbEn0u8LJsn620oYxNKcQdFiEhqtenCnB4=;
 b=4SGmC+kVQsaldTKNblBBXsiiV7byvyG82zUsaAytQRaU4XSmBvMYrUrv98reQdjktc
 FMc356Wk98MU99XQnqsxzoMiv//dSNSsH0zjA7lPjZE7EafpRKfKYq73EHuw4LpR1L3i
 uW7rCxK0SX4GRklSxUY7lsYJ5W05nIKGxEcq0cdZ/eiCxhlDHJGzpS53UdIYT3NJXgIh
 mSxJzOCFi68WP44xHXq2csd9R4DT1mXiipX9fbSrKQ8lwrPdZFhlUwn+jXnoAn2W0usz
 qOM5AjhTw1TXjS9DZbS0qdoP4X3necq7OiUT69FvIacTAXKKEgYdY+r8zLU5DQBbI9cz
 5MZg==
X-Gm-Message-State: AOAM530E39aYYsz8Q4Y6NCPZzBHilqXALWuF3+3LSKe4/DX9JzNimuxr
 L58ujIMe84BPP0WI9Wd1n3r3EPxijUQqxwOmfkkirmS/XNEtbSbAAXQPXmjqvuLUgPK76bdKy9u
 nAt4gctnab3eONJFtF4S0zAnSVj/UxYJxRJZzy6euAdFLY9MQyyhQbBG5L+okP291
X-Received: by 2002:adf:cd8a:: with SMTP id q10mr28918186wrj.164.1640951374782; 
 Fri, 31 Dec 2021 03:49:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw2dIVmmJjJoWOYkN6QY4oEzQHq2PYPcfJGoUKtxh9GPOzq4G0wqsdDi0lyd+GdbG73VYoPTQ==
X-Received: by 2002:adf:cd8a:: with SMTP id q10mr28918156wrj.164.1640951374374; 
 Fri, 31 Dec 2021 03:49:34 -0800 (PST)
Received: from x1w.redhat.com (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id p13sm26070464wrr.37.2021.12.31.03.49.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 03:49:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/8] hw/dma: Introduce dma_size_t type definition
Date: Fri, 31 Dec 2021 12:49:00 +0100
Message-Id: <20211231114901.976937-8-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211231114901.976937-1-philmd@redhat.com>
References: <20211231114901.976937-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The DMA API defines the dma_addr_t type for DMA addresses.
Some sizes related to the API also use this type, which is
a bit confusing when reviewing.

Add a similar 'dma_size_t' definition (and its format string).

Update the obvious places where dma_size_t should be used,
and adapt a pair of format strings.

Move QEMUSGList declaration after dma_size_t definition
so this structure can use the new type.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/rdma/rdma_utils.h      |  4 ++--
 include/hw/pci/pci.h      | 10 ++++----
 include/sysemu/dma.h      | 50 ++++++++++++++++++++-------------------
 hw/ide/ahci.c             |  2 +-
 hw/nvme/ctrl.c            |  2 +-
 hw/nvram/fw_cfg.c         |  2 +-
 hw/rdma/rdma_utils.c      |  6 ++---
 hw/rdma/vmw/pvrdma_main.c |  2 +-
 hw/scsi/lsi53c895a.c      |  4 ++--
 hw/scsi/megasas.c         | 10 ++++----
 hw/usb/libhw.c            |  4 ++--
 softmmu/dma-helpers.c     | 10 ++++----
 hw/rdma/trace-events      |  2 +-
 13 files changed, 55 insertions(+), 53 deletions(-)

diff --git a/hw/rdma/rdma_utils.h b/hw/rdma/rdma_utils.h
index 0c6414e7e0a..5446e4e2500 100644
--- a/hw/rdma/rdma_utils.h
+++ b/hw/rdma/rdma_utils.h
@@ -38,8 +38,8 @@ typedef struct RdmaProtectedGSList {
     GSList *list;
 } RdmaProtectedGSList;
 
-void *rdma_pci_dma_map(PCIDevice *dev, dma_addr_t addr, dma_addr_t len);
-void rdma_pci_dma_unmap(PCIDevice *dev, void *buffer, dma_addr_t len);
+void *rdma_pci_dma_map(PCIDevice *dev, dma_addr_t addr, dma_size_t len);
+void rdma_pci_dma_unmap(PCIDevice *dev, void *buffer, dma_size_t len);
 void rdma_protected_gqueue_init(RdmaProtectedGQueue *list);
 void rdma_protected_gqueue_destroy(RdmaProtectedGQueue *list);
 void rdma_protected_gqueue_append_int64(RdmaProtectedGQueue *list,
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index f0d707efb8c..f2257b2cd8c 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -805,7 +805,7 @@ static inline AddressSpace *pci_get_address_space(PCIDevice *dev)
  * @dir: indicates the transfer direction
  */
 static inline MemTxResult pci_dma_rw(PCIDevice *dev, dma_addr_t addr,
-                                     void *buf, dma_addr_t len,
+                                     void *buf, dma_size_t len,
                                      DMADirection dir, MemTxAttrs attrs)
 {
     return dma_memory_rw(pci_get_address_space(dev), addr, buf, len,
@@ -825,7 +825,7 @@ static inline MemTxResult pci_dma_rw(PCIDevice *dev, dma_addr_t addr,
  * @len: length of the data transferred
  */
 static inline MemTxResult pci_dma_read(PCIDevice *dev, dma_addr_t addr,
-                                       void *buf, dma_addr_t len)
+                                       void *buf, dma_size_t len)
 {
     return pci_dma_rw(dev, addr, buf, len,
                       DMA_DIRECTION_TO_DEVICE, MEMTXATTRS_UNSPECIFIED);
@@ -844,7 +844,7 @@ static inline MemTxResult pci_dma_read(PCIDevice *dev, dma_addr_t addr,
  * @len: the number of bytes to write
  */
 static inline MemTxResult pci_dma_write(PCIDevice *dev, dma_addr_t addr,
-                                        const void *buf, dma_addr_t len)
+                                        const void *buf, dma_size_t len)
 {
     return pci_dma_rw(dev, addr, (void *) buf, len,
                       DMA_DIRECTION_FROM_DEVICE, MEMTXATTRS_UNSPECIFIED);
@@ -889,7 +889,7 @@ PCI_DMA_DEFINE_LDST(q_be, q_be, 64);
  * @dir: indicates the transfer direction
  */
 static inline void *pci_dma_map(PCIDevice *dev, dma_addr_t addr,
-                                dma_addr_t *plen, DMADirection dir)
+                                dma_size_t *plen, DMADirection dir)
 {
     void *buf;
 
@@ -898,7 +898,7 @@ static inline void *pci_dma_map(PCIDevice *dev, dma_addr_t addr,
     return buf;
 }
 
-static inline void pci_dma_unmap(PCIDevice *dev, void *buffer, dma_addr_t len,
+static inline void pci_dma_unmap(PCIDevice *dev, void *buffer, dma_size_t len,
                                  DMADirection dir, dma_addr_t access_len)
 {
     dma_memory_unmap(pci_get_address_space(dev), buffer, len, dir, access_len);
diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index 0db2478a506..45a2567848c 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -15,22 +15,11 @@
 #include "block/block.h"
 #include "block/accounting.h"
 
-typedef struct ScatterGatherEntry ScatterGatherEntry;
-
 typedef enum {
     DMA_DIRECTION_TO_DEVICE = 0,
     DMA_DIRECTION_FROM_DEVICE = 1,
 } DMADirection;
 
-struct QEMUSGList {
-    ScatterGatherEntry *sg;
-    int nsg;
-    int nalloc;
-    size_t size;
-    DeviceState *dev;
-    AddressSpace *as;
-};
-
 /*
  * When an IOMMU is present, bus addresses become distinct from
  * CPU/memory physical addresses and may be a different size.  Because
@@ -39,9 +28,22 @@ struct QEMUSGList {
  * least most) cases.
  */
 typedef uint64_t dma_addr_t;
+typedef uint64_t dma_size_t;
 
 #define DMA_ADDR_BITS 64
 #define DMA_ADDR_FMT "%" PRIx64
+#define DMA_SIZE_FMT "%" PRIx64
+
+typedef struct ScatterGatherEntry ScatterGatherEntry;
+
+struct QEMUSGList {
+    ScatterGatherEntry *sg;
+    int nsg;
+    int nalloc;
+    dma_size_t size;
+    DeviceState *dev;
+    AddressSpace *as;
+};
 
 static inline void dma_barrier(AddressSpace *as, DMADirection dir)
 {
@@ -70,7 +72,7 @@ static inline void dma_barrier(AddressSpace *as, DMADirection dir)
  * useful for certain cases, but usually you should just use
  * dma_memory_{read,write}() and check for errors */
 static inline bool dma_memory_valid(AddressSpace *as,
-                                    dma_addr_t addr, dma_addr_t len,
+                                    dma_addr_t addr, dma_size_t len,
                                     DMADirection dir, MemTxAttrs attrs)
 {
     return address_space_access_valid(as, addr, len,
@@ -80,7 +82,7 @@ static inline bool dma_memory_valid(AddressSpace *as,
 
 static inline MemTxResult dma_memory_rw_relaxed(AddressSpace *as,
                                                 dma_addr_t addr,
-                                                void *buf, dma_addr_t len,
+                                                void *buf, dma_size_t len,
                                                 DMADirection dir,
                                                 MemTxAttrs attrs)
 {
@@ -90,7 +92,7 @@ static inline MemTxResult dma_memory_rw_relaxed(AddressSpace *as,
 
 static inline MemTxResult dma_memory_read_relaxed(AddressSpace *as,
                                                   dma_addr_t addr,
-                                                  void *buf, dma_addr_t len)
+                                                  void *buf, dma_size_t len)
 {
     return dma_memory_rw_relaxed(as, addr, buf, len,
                                  DMA_DIRECTION_TO_DEVICE,
@@ -100,7 +102,7 @@ static inline MemTxResult dma_memory_read_relaxed(AddressSpace *as,
 static inline MemTxResult dma_memory_write_relaxed(AddressSpace *as,
                                                    dma_addr_t addr,
                                                    const void *buf,
-                                                   dma_addr_t len)
+                                                   dma_size_t len)
 {
     return dma_memory_rw_relaxed(as, addr, (void *)buf, len,
                                  DMA_DIRECTION_FROM_DEVICE,
@@ -122,7 +124,7 @@ static inline MemTxResult dma_memory_write_relaxed(AddressSpace *as,
  * @attrs: memory transaction attributes
  */
 static inline MemTxResult dma_memory_rw(AddressSpace *as, dma_addr_t addr,
-                                        void *buf, dma_addr_t len,
+                                        void *buf, dma_size_t len,
                                         DMADirection dir, MemTxAttrs attrs)
 {
     dma_barrier(as, dir);
@@ -144,7 +146,7 @@ static inline MemTxResult dma_memory_rw(AddressSpace *as, dma_addr_t addr,
  * @attrs: memory transaction attributes
  */
 static inline MemTxResult dma_memory_read(AddressSpace *as, dma_addr_t addr,
-                                          void *buf, dma_addr_t len,
+                                          void *buf, dma_size_t len,
                                           MemTxAttrs attrs)
 {
     return dma_memory_rw(as, addr, buf, len,
@@ -165,7 +167,7 @@ static inline MemTxResult dma_memory_read(AddressSpace *as, dma_addr_t addr,
  * @attrs: memory transaction attributes
  */
 static inline MemTxResult dma_memory_write(AddressSpace *as, dma_addr_t addr,
-                                           const void *buf, dma_addr_t len,
+                                           const void *buf, dma_size_t len,
                                            MemTxAttrs attrs)
 {
     return dma_memory_rw(as, addr, (void *)buf, len,
@@ -186,7 +188,7 @@ static inline MemTxResult dma_memory_write(AddressSpace *as, dma_addr_t addr,
  * @attrs: memory transaction attributes
  */
 MemTxResult dma_memory_set(AddressSpace *as, dma_addr_t addr,
-                           uint8_t c, dma_addr_t len, MemTxAttrs attrs);
+                           uint8_t c, dma_size_t len, MemTxAttrs attrs);
 
 /**
  * address_space_map: Map a physical memory region into a host virtual address.
@@ -203,7 +205,7 @@ MemTxResult dma_memory_set(AddressSpace *as, dma_addr_t addr,
  * @attrs: memory attributes
  */
 static inline void *dma_memory_map(AddressSpace *as,
-                                   dma_addr_t addr, dma_addr_t *len,
+                                   dma_addr_t addr, dma_size_t *len,
                                    DMADirection dir, MemTxAttrs attrs)
 {
     hwaddr xlen = *len;
@@ -230,8 +232,8 @@ static inline void *dma_memory_map(AddressSpace *as,
  * @access_len: amount of data actually transferred
  */
 static inline void dma_memory_unmap(AddressSpace *as,
-                                    void *buffer, dma_addr_t len,
-                                    DMADirection dir, dma_addr_t access_len)
+                                    void *buffer, dma_size_t len,
+                                    DMADirection dir, dma_size_t access_len)
 {
     address_space_unmap(as, buffer, (hwaddr)len,
                         dir == DMA_DIRECTION_FROM_DEVICE, access_len);
@@ -279,12 +281,12 @@ DEFINE_LDST_DMA(q, q, 64, be);
 
 struct ScatterGatherEntry {
     dma_addr_t base;
-    dma_addr_t len;
+    dma_size_t len;
 };
 
 void qemu_sglist_init(QEMUSGList *qsg, DeviceState *dev, int alloc_hint,
                       AddressSpace *as);
-void qemu_sglist_add(QEMUSGList *qsg, dma_addr_t base, dma_addr_t len);
+void qemu_sglist_add(QEMUSGList *qsg, dma_addr_t base, dma_size_t len);
 void qemu_sglist_destroy(QEMUSGList *qsg);
 
 typedef BlockAIOCB *DMAIOFunc(int64_t offset, QEMUIOVector *iov,
diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index 205dfdc6622..256bbc377ce 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -1159,7 +1159,7 @@ static void process_ncq_command(AHCIState *s, int port, const uint8_t *cmd_fis,
     ahci_populate_sglist(ad, &ncq_tfs->sglist, ncq_tfs->cmdh, size, 0);
 
     if (ncq_tfs->sglist.size < size) {
-        error_report("ahci: PRDT length for NCQ command (0x%zx) "
+        error_report("ahci: PRDT length for NCQ command (0x" DMA_SIZE_FMT ") "
                      "is smaller than the requested size (0x%zx)",
                      ncq_tfs->sglist.size, size);
         ncq_err(ncq_tfs);
diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 462f79a1f60..4620e662fc9 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1147,7 +1147,7 @@ static uint16_t nvme_tx(NvmeCtrl *n, NvmeSg *sg, uint8_t *ptr, uint32_t len,
 
     if (sg->flags & NVME_SG_DMA) {
         const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
-        uint64_t residual;
+        dma_size_t residual;
 
         if (dir == NVME_TX_DIRECTION_TO_DEVICE) {
             residual = dma_buf_write(ptr, len, &sg->qsg, attrs);
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index e5f3c981841..a30bff8a14a 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -346,12 +346,12 @@ static void fw_cfg_data_mem_write(void *opaque, hwaddr addr,
 
 static void fw_cfg_dma_transfer(FWCfgState *s)
 {
-    dma_addr_t len;
     FWCfgDmaAccess dma;
     int arch;
     FWCfgEntry *e;
     int read = 0, write = 0;
     dma_addr_t dma_addr;
+    dma_size_t len;
 
     /* Reset the address before the next access */
     dma_addr = s->dma_addr;
diff --git a/hw/rdma/rdma_utils.c b/hw/rdma/rdma_utils.c
index 61cb8ede0fd..677d7ffba53 100644
--- a/hw/rdma/rdma_utils.c
+++ b/hw/rdma/rdma_utils.c
@@ -17,10 +17,10 @@
 #include "trace.h"
 #include "rdma_utils.h"
 
-void *rdma_pci_dma_map(PCIDevice *dev, dma_addr_t addr, dma_addr_t len)
+void *rdma_pci_dma_map(PCIDevice *dev, dma_addr_t addr, dma_size_t len)
 {
     void *p;
-    hwaddr pci_len = len;
+    dma_size_t pci_len = len;
 
     if (!addr) {
         rdma_error_report("addr is NULL");
@@ -44,7 +44,7 @@ void *rdma_pci_dma_map(PCIDevice *dev, dma_addr_t addr, dma_addr_t len)
     return p;
 }
 
-void rdma_pci_dma_unmap(PCIDevice *dev, void *buffer, dma_addr_t len)
+void rdma_pci_dma_unmap(PCIDevice *dev, void *buffer, dma_size_t len)
 {
     trace_rdma_pci_dma_unmap(buffer);
     if (buffer) {
diff --git a/hw/rdma/vmw/pvrdma_main.c b/hw/rdma/vmw/pvrdma_main.c
index 91206dbb8eb..bf3d542302e 100644
--- a/hw/rdma/vmw/pvrdma_main.c
+++ b/hw/rdma/vmw/pvrdma_main.c
@@ -124,7 +124,7 @@ static int init_dev_ring(PvrdmaRing *ring, PvrdmaRingState **ring_state,
                           (num_pages - 1) * TARGET_PAGE_SIZE /
                           sizeof(struct pvrdma_cqne),
                           sizeof(struct pvrdma_cqne),
-                          (dma_addr_t *)&tbl[1], (dma_addr_t)num_pages - 1);
+                          (dma_addr_t *)&tbl[1], (dma_size_t)num_pages - 1);
     if (rc) {
         rc = -ENOMEM;
         goto out_free_ring_state;
diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
index 4c431adb774..6d63bffc804 100644
--- a/hw/scsi/lsi53c895a.c
+++ b/hw/scsi/lsi53c895a.c
@@ -444,7 +444,7 @@ static void lsi_execute_script(LSIState *s);
 static void lsi_reselect(LSIState *s, lsi_request *p);
 
 static inline void lsi_mem_read(LSIState *s, dma_addr_t addr,
-                               void *buf, dma_addr_t len)
+                                void *buf, dma_size_t len)
 {
     if (s->dmode & LSI_DMODE_SIOM) {
         address_space_read(&s->pci_io_as, addr, MEMTXATTRS_UNSPECIFIED,
@@ -455,7 +455,7 @@ static inline void lsi_mem_read(LSIState *s, dma_addr_t addr,
 }
 
 static inline void lsi_mem_write(LSIState *s, dma_addr_t addr,
-                                const void *buf, dma_addr_t len)
+                                 const void *buf, dma_size_t len)
 {
     if (s->dmode & LSI_DMODE_DIOM) {
         address_space_write(&s->pci_io_as, addr, MEMTXATTRS_UNSPECIFIED,
diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index cb019549371..7456a25970a 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -1046,7 +1046,7 @@ static int megasas_pd_get_info_submit(SCSIDevice *sdev, int lun,
     uint16_t pd_id = ((sdev->id & 0xFF) << 8) | (lun & 0xFF);
     uint8_t cmdbuf[6];
     size_t len;
-    size_t residual;
+    dma_size_t residual;
 
     if (!cmd->iov_buf) {
         cmd->iov_buf = g_malloc0(dcmd_size);
@@ -1152,7 +1152,7 @@ static int megasas_dcmd_ld_get_list(MegasasState *s, MegasasCmd *cmd)
 {
     struct mfi_ld_list info;
     size_t dcmd_size = sizeof(info);
-    size_t residual;
+    dma_size_t residual;
     uint32_t num_ld_disks = 0, max_ld_disks;
     uint64_t ld_size;
     BusChild *kid;
@@ -1198,7 +1198,7 @@ static int megasas_dcmd_ld_list_query(MegasasState *s, MegasasCmd *cmd)
     uint16_t flags;
     struct mfi_ld_targetid_list info;
     size_t dcmd_size = sizeof(info);
-    size_t residual;
+    dma_size_t residual;
     uint32_t num_ld_disks = 0, max_ld_disks = s->fw_luns;
     BusChild *kid;
 
@@ -1251,7 +1251,7 @@ static int megasas_ld_get_info_submit(SCSIDevice *sdev, int lun,
     size_t dcmd_size = sizeof(struct mfi_ld_info);
     uint8_t cdb[6];
     ssize_t len;
-    size_t residual;
+    dma_size_t residual;
     uint16_t sdev_id = ((sdev->id & 0xFF) << 8) | (lun & 0xFF);
     uint64_t ld_size;
 
@@ -1625,7 +1625,7 @@ static int megasas_handle_dcmd(MegasasState *s, MegasasCmd *cmd)
 }
 
 static int megasas_finish_internal_dcmd(MegasasCmd *cmd,
-                                        SCSIRequest *req, size_t residual)
+                                        SCSIRequest *req, dma_size_t residual)
 {
     int retval = MFI_STAT_OK;
     int lun = req->lun;
diff --git a/hw/usb/libhw.c b/hw/usb/libhw.c
index f350eae443d..f632258459a 100644
--- a/hw/usb/libhw.c
+++ b/hw/usb/libhw.c
@@ -32,10 +32,10 @@ int usb_packet_map(USBPacket *p, QEMUSGList *sgl)
 
     for (i = 0; i < sgl->nsg; i++) {
         dma_addr_t base = sgl->sg[i].base;
-        dma_addr_t len = sgl->sg[i].len;
+        dma_size_t len = sgl->sg[i].len;
 
         while (len) {
-            dma_addr_t xlen = len;
+            dma_size_t xlen = len;
             mem = dma_memory_map(sgl->as, base, &xlen, dir,
                                  MEMTXATTRS_UNSPECIFIED);
             if (!mem) {
diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
index 4563a775aa7..66ba0b2c361 100644
--- a/softmmu/dma-helpers.c
+++ b/softmmu/dma-helpers.c
@@ -19,7 +19,7 @@
 /* #define DEBUG_IOMMU */
 
 MemTxResult dma_memory_set(AddressSpace *as, dma_addr_t addr,
-                           uint8_t c, dma_addr_t len, MemTxAttrs attrs)
+                           uint8_t c, dma_size_t len, MemTxAttrs attrs)
 {
     dma_barrier(as, DMA_DIRECTION_FROM_DEVICE);
 
@@ -51,7 +51,7 @@ void qemu_sglist_init(QEMUSGList *qsg, DeviceState *dev, int alloc_hint,
     object_ref(OBJECT(dev));
 }
 
-void qemu_sglist_add(QEMUSGList *qsg, dma_addr_t base, dma_addr_t len)
+void qemu_sglist_add(QEMUSGList *qsg, dma_addr_t base, dma_size_t len)
 {
     if (qsg->nsg == qsg->nalloc) {
         qsg->nalloc = 2 * qsg->nalloc + 1;
@@ -294,12 +294,12 @@ BlockAIOCB *dma_blk_write(BlockBackend *blk,
 }
 
 
-static MemTxResult dma_buf_rw(void *buf, int32_t len, uint64_t *residual,
+static MemTxResult dma_buf_rw(void *buf, dma_size_t len, dma_size_t *residual,
                               QEMUSGList *sg, DMADirection dir,
                               MemTxAttrs attrs)
 {
     uint8_t *ptr = buf;
-    uint64_t xresidual;
+    dma_size_t xresidual;
     int sg_cur_index;
     MemTxResult res = MEMTX_OK;
 
@@ -308,7 +308,7 @@ static MemTxResult dma_buf_rw(void *buf, int32_t len, uint64_t *residual,
     len = MIN(len, xresidual);
     while (len > 0) {
         ScatterGatherEntry entry = sg->sg[sg_cur_index++];
-        int32_t xfer = MIN(len, entry.len);
+        dma_size_t xfer = MIN(len, entry.len);
         res |= dma_memory_rw(sg->as, entry.base, ptr, xfer, dir, attrs);
         ptr += xfer;
         len -= xfer;
diff --git a/hw/rdma/trace-events b/hw/rdma/trace-events
index 9accb149734..c23175120e1 100644
--- a/hw/rdma/trace-events
+++ b/hw/rdma/trace-events
@@ -27,5 +27,5 @@ rdma_rm_alloc_qp(uint32_t rm_qpn, uint32_t backend_qpn, uint8_t qp_type) "rm_qpn
 rdma_rm_modify_qp(uint32_t qpn, uint32_t attr_mask, int qp_state, uint8_t sgid_idx) "qpn=0x%x, attr_mask=0x%x, qp_state=%d, sgid_idx=%d"
 
 # rdma_utils.c
-rdma_pci_dma_map(uint64_t addr, void *vaddr, uint64_t len) "0x%"PRIx64" -> %p (len=%" PRId64")"
+rdma_pci_dma_map(uint64_t addr, void *vaddr, uint64_t len) "0x%"PRIx64" -> %p (len=%" PRIu64")"
 rdma_pci_dma_unmap(void *vaddr) "%p"
-- 
2.33.1


