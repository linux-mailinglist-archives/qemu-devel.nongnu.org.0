Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC95348211B
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 01:58:41 +0100 (CET)
Received: from localhost ([::1]:53196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n36Fk-000463-T0
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 19:58:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n36Dd-00019P-34
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 19:56:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n36Db-0003Xq-3P
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 19:56:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640912185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cfDn76iFhTL8AmEmLGnMgId22VooDLm9Co5wl/NuzDs=;
 b=Zsr73W98VazvBUGwsU1Hptew8c3iN9Ny0CgqNfkSS/zqdLza0R/CVqtC/xUCIEnczQrhvh
 EpSPR7dS/3rYAShzl4BO6e27gt5PcFojD0ZDXvYxPCtJI0frxlDvkJ0NhUywKCMVMFj2x3
 FwnUwz82uqeyS+HMl1UCHmy8hgQl3MQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-42-70qzeU94N2mb0w8Ylts3MQ-1; Thu, 30 Dec 2021 19:56:24 -0500
X-MC-Unique: 70qzeU94N2mb0w8Ylts3MQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 s7-20020a056402520700b003f841380832so18007936edd.5
 for <qemu-devel@nongnu.org>; Thu, 30 Dec 2021 16:56:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cfDn76iFhTL8AmEmLGnMgId22VooDLm9Co5wl/NuzDs=;
 b=MeCHQ5V0Vl9ucR2lRL/hJQ7Op77h29+OAoeykkptTEuQRFK3LRkqiyA5Vhl1El43gh
 dulKYcMlAA13/vTHV4pTsDV3t2R3d7vJyK4TVs7a+EdqQonHR+HNlI4vcpevkQ9IowQV
 gDUzvTIg+6MOptrm6mdYKqCv66ahBZ2/890+9CsbCvXAsuVIDg3a2fghbexYtMZBgVss
 sOfHVYHMWmQj4sndzns2ZtmU+Nx9JrNEd22wr0fZnXW71U/I0DVbb0Pl7uQwOtd1uTtw
 hfMzOk5tJ0UEK+Lj5E85sWmIFGiq6Y9CSWBrn4MoKvehzZhFaqDiWP4m8r8ud6RsxzTZ
 UIVw==
X-Gm-Message-State: AOAM531AB1WxDUrj5/SQXHAlXYP2vrWf1USCq1p4Dj6xFebBSSWSIOOw
 L0kA9HS9f6uCm10dTnTNLDEfEyDmzUAmUVsA1Y3ygcBpzq1/zOCj8BPlw1cAA+Un5V4mVjoqrp2
 3o2BRj5/l+gIJXp0HVyMOvA7dzCuBg4Qnpu3F193oaaZEAJFeKDVj4DWFtNkzFSnA
X-Received: by 2002:a17:907:7f8c:: with SMTP id
 qk12mr26428783ejc.169.1640912182998; 
 Thu, 30 Dec 2021 16:56:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzeRF+S8Ccr+pZG2u3r7hdMdt7ZJnZejKIsVLFrtci+eMTO5VVZIi0Q1wTYidRqczBVjkB3TA==
X-Received: by 2002:a17:907:7f8c:: with SMTP id
 qk12mr26428761ejc.169.1640912182712; 
 Thu, 30 Dec 2021 16:56:22 -0800 (PST)
Received: from x1w.redhat.com (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id a18sm10293380eds.42.2021.12.30.16.56.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 16:56:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/22] dma: Let dma_memory_map() take MemTxAttrs argument
Date: Fri, 31 Dec 2021 01:55:31 +0100
Message-Id: <20211231005546.723396-8-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211231005546.723396-1-philmd@redhat.com>
References: <20211231005546.723396-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, Li Qiang <liq3ea@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let devices specify transaction attributes when calling
dma_memory_map().

Patch created mechanically using spatch with this script:

  @@
  expression E1, E2, E3, E4;
  @@
  - dma_memory_map(E1, E2, E3, E4)
  + dma_memory_map(E1, E2, E3, E4, MEMTXATTRS_UNSPECIFIED)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20211223115554.3155328-7-philmd@redhat.com>
---
 include/hw/pci/pci.h    |  3 ++-
 include/sysemu/dma.h    |  5 +++--
 hw/display/virtio-gpu.c | 10 ++++++----
 hw/hyperv/vmbus.c       |  8 +++++---
 hw/ide/ahci.c           |  8 +++++---
 hw/usb/libhw.c          |  3 ++-
 hw/virtio/virtio.c      |  6 ++++--
 softmmu/dma-helpers.c   |  3 ++-
 8 files changed, 29 insertions(+), 17 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 4383f1c95e0..1acefc2a4c3 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -875,7 +875,8 @@ static inline void *pci_dma_map(PCIDevice *dev, dma_addr_t addr,
 {
     void *buf;
 
-    buf = dma_memory_map(pci_get_address_space(dev), addr, plen, dir);
+    buf = dma_memory_map(pci_get_address_space(dev), addr, plen, dir,
+                         MEMTXATTRS_UNSPECIFIED);
     return buf;
 }
 
diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index 522682bf386..97ff6f29f8c 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -202,16 +202,17 @@ MemTxResult dma_memory_set(AddressSpace *as, dma_addr_t addr,
  * @addr: address within that address space
  * @len: pointer to length of buffer; updated on return
  * @dir: indicates the transfer direction
+ * @attrs: memory attributes
  */
 static inline void *dma_memory_map(AddressSpace *as,
                                    dma_addr_t addr, dma_addr_t *len,
-                                   DMADirection dir)
+                                   DMADirection dir, MemTxAttrs attrs)
 {
     hwaddr xlen = *len;
     void *p;
 
     p = address_space_map(as, addr, &xlen, dir == DMA_DIRECTION_FROM_DEVICE,
-                          MEMTXATTRS_UNSPECIFIED);
+                          attrs);
     *len = xlen;
     return p;
 }
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index d78b9700c7d..c6dc818988c 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -814,8 +814,9 @@ int virtio_gpu_create_mapping_iov(VirtIOGPU *g,
 
         do {
             len = l;
-            map = dma_memory_map(VIRTIO_DEVICE(g)->dma_as,
-                                 a, &len, DMA_DIRECTION_TO_DEVICE);
+            map = dma_memory_map(VIRTIO_DEVICE(g)->dma_as, a, &len,
+                                 DMA_DIRECTION_TO_DEVICE,
+                                 MEMTXATTRS_UNSPECIFIED);
             if (!map) {
                 qemu_log_mask(LOG_GUEST_ERROR, "%s: failed to map MMIO memory for"
                               " element %d\n", __func__, e);
@@ -1252,8 +1253,9 @@ static int virtio_gpu_load(QEMUFile *f, void *opaque, size_t size,
         for (i = 0; i < res->iov_cnt; i++) {
             hwaddr len = res->iov[i].iov_len;
             res->iov[i].iov_base =
-                dma_memory_map(VIRTIO_DEVICE(g)->dma_as,
-                               res->addrs[i], &len, DMA_DIRECTION_TO_DEVICE);
+                dma_memory_map(VIRTIO_DEVICE(g)->dma_as, res->addrs[i], &len,
+                               DMA_DIRECTION_TO_DEVICE,
+                               MEMTXATTRS_UNSPECIFIED);
 
             if (!res->iov[i].iov_base || len != res->iov[i].iov_len) {
                 /* Clean up the half-a-mapping we just created... */
diff --git a/hw/hyperv/vmbus.c b/hw/hyperv/vmbus.c
index dbce3b35fba..8aad29f1bb2 100644
--- a/hw/hyperv/vmbus.c
+++ b/hw/hyperv/vmbus.c
@@ -373,7 +373,8 @@ static ssize_t gpadl_iter_io(GpadlIter *iter, void *buf, uint32_t len)
 
             maddr = (iter->gpadl->gfns[idx] << TARGET_PAGE_BITS) | off_in_page;
 
-            iter->map = dma_memory_map(iter->as, maddr, &mlen, iter->dir);
+            iter->map = dma_memory_map(iter->as, maddr, &mlen, iter->dir,
+                                       MEMTXATTRS_UNSPECIFIED);
             if (mlen != pgleft) {
                 dma_memory_unmap(iter->as, iter->map, mlen, iter->dir, 0);
                 iter->map = NULL;
@@ -490,7 +491,8 @@ int vmbus_map_sgl(VMBusChanReq *req, DMADirection dir, struct iovec *iov,
                 goto err;
             }
 
-            iov[ret_cnt].iov_base = dma_memory_map(sgl->as, a, &l, dir);
+            iov[ret_cnt].iov_base = dma_memory_map(sgl->as, a, &l, dir,
+                                                   MEMTXATTRS_UNSPECIFIED);
             if (!l) {
                 ret = -EFAULT;
                 goto err;
@@ -566,7 +568,7 @@ static vmbus_ring_buffer *ringbuf_map_hdr(VMBusRingBufCommon *ringbuf)
     dma_addr_t mlen = sizeof(*rb);
 
     rb = dma_memory_map(ringbuf->as, ringbuf->rb_addr, &mlen,
-                        DMA_DIRECTION_FROM_DEVICE);
+                        DMA_DIRECTION_FROM_DEVICE, MEMTXATTRS_UNSPECIFIED);
     if (mlen != sizeof(*rb)) {
         dma_memory_unmap(ringbuf->as, rb, mlen,
                          DMA_DIRECTION_FROM_DEVICE, 0);
diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index a94c6e26fb0..8e77ddb660f 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -249,7 +249,8 @@ static void map_page(AddressSpace *as, uint8_t **ptr, uint64_t addr,
         dma_memory_unmap(as, *ptr, len, DMA_DIRECTION_FROM_DEVICE, len);
     }
 
-    *ptr = dma_memory_map(as, addr, &len, DMA_DIRECTION_FROM_DEVICE);
+    *ptr = dma_memory_map(as, addr, &len, DMA_DIRECTION_FROM_DEVICE,
+                          MEMTXATTRS_UNSPECIFIED);
     if (len < wanted && *ptr) {
         dma_memory_unmap(as, *ptr, len, DMA_DIRECTION_FROM_DEVICE, len);
         *ptr = NULL;
@@ -939,7 +940,8 @@ static int ahci_populate_sglist(AHCIDevice *ad, QEMUSGList *sglist,
 
     /* map PRDT */
     if (!(prdt = dma_memory_map(ad->hba->as, prdt_addr, &prdt_len,
-                                DMA_DIRECTION_TO_DEVICE))){
+                                DMA_DIRECTION_TO_DEVICE,
+                                MEMTXATTRS_UNSPECIFIED))){
         trace_ahci_populate_sglist_no_map(ad->hba, ad->port_no);
         return -1;
     }
@@ -1301,7 +1303,7 @@ static int handle_cmd(AHCIState *s, int port, uint8_t slot)
     tbl_addr = le64_to_cpu(cmd->tbl_addr);
     cmd_len = 0x80;
     cmd_fis = dma_memory_map(s->as, tbl_addr, &cmd_len,
-                             DMA_DIRECTION_TO_DEVICE);
+                             DMA_DIRECTION_TO_DEVICE, MEMTXATTRS_UNSPECIFIED);
     if (!cmd_fis) {
         trace_handle_cmd_badfis(s, port);
         return -1;
diff --git a/hw/usb/libhw.c b/hw/usb/libhw.c
index 9c33a1640f7..f350eae443d 100644
--- a/hw/usb/libhw.c
+++ b/hw/usb/libhw.c
@@ -36,7 +36,8 @@ int usb_packet_map(USBPacket *p, QEMUSGList *sgl)
 
         while (len) {
             dma_addr_t xlen = len;
-            mem = dma_memory_map(sgl->as, base, &xlen, dir);
+            mem = dma_memory_map(sgl->as, base, &xlen, dir,
+                                 MEMTXATTRS_UNSPECIFIED);
             if (!mem) {
                 goto err;
             }
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index ea7c079fb04..e11a8a0dbab 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -1306,7 +1306,8 @@ static bool virtqueue_map_desc(VirtIODevice *vdev, unsigned int *p_num_sg,
         iov[num_sg].iov_base = dma_memory_map(vdev->dma_as, pa, &len,
                                               is_write ?
                                               DMA_DIRECTION_FROM_DEVICE :
-                                              DMA_DIRECTION_TO_DEVICE);
+                                              DMA_DIRECTION_TO_DEVICE,
+                                              MEMTXATTRS_UNSPECIFIED);
         if (!iov[num_sg].iov_base) {
             virtio_error(vdev, "virtio: bogus descriptor or out of resources");
             goto out;
@@ -1355,7 +1356,8 @@ static void virtqueue_map_iovec(VirtIODevice *vdev, struct iovec *sg,
         sg[i].iov_base = dma_memory_map(vdev->dma_as,
                                         addr[i], &len, is_write ?
                                         DMA_DIRECTION_FROM_DEVICE :
-                                        DMA_DIRECTION_TO_DEVICE);
+                                        DMA_DIRECTION_TO_DEVICE,
+                                        MEMTXATTRS_UNSPECIFIED);
         if (!sg[i].iov_base) {
             error_report("virtio: error trying to map MMIO memory");
             exit(1);
diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
index 5bf76fff6bd..3c06a2feddd 100644
--- a/softmmu/dma-helpers.c
+++ b/softmmu/dma-helpers.c
@@ -143,7 +143,8 @@ static void dma_blk_cb(void *opaque, int ret)
     while (dbs->sg_cur_index < dbs->sg->nsg) {
         cur_addr = dbs->sg->sg[dbs->sg_cur_index].base + dbs->sg_cur_byte;
         cur_len = dbs->sg->sg[dbs->sg_cur_index].len - dbs->sg_cur_byte;
-        mem = dma_memory_map(dbs->sg->as, cur_addr, &cur_len, dbs->dir);
+        mem = dma_memory_map(dbs->sg->as, cur_addr, &cur_len, dbs->dir,
+                             MEMTXATTRS_UNSPECIFIED);
         /*
          * Make reads deterministic in icount mode. Windows sometimes issues
          * disk read requests with overlapping SGs. It leads
-- 
2.33.1


