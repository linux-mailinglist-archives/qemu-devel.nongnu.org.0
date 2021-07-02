Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F9A3B9E44
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 11:32:07 +0200 (CEST)
Received: from localhost ([::1]:36410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzFWm-0008OK-Tp
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 05:32:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lzFQ4-0005ON-6X
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 05:25:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lzFQ2-0001l2-2t
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 05:25:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625217905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2DiP3BDoXXRMG7E5lnGiuw8kLZOvB50ScwR/oV8195s=;
 b=iSGTY6n5J09MNpbWq4kEXmJRzRTdFo5m13YFVLkZJaqjh/LPjU5BeP0lDxRV8wn19MZabg
 z/i2IQ+tbgfNBuo/MML13AvqVxEg8scZv4IdseTQF5QBPoSgx8Zh69hA92rhEL+Fg5e/KZ
 200WIPqu5FdDKZeY+nWjs0QLoPa3kLY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-Hex8HfBvMW-V0wjeEsJghg-1; Fri, 02 Jul 2021 05:25:02 -0400
X-MC-Unique: Hex8HfBvMW-V0wjeEsJghg-1
Received: by mail-wr1-f70.google.com with SMTP id
 i17-20020a5d43910000b02901258b767ad5so3687897wrq.2
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 02:25:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2DiP3BDoXXRMG7E5lnGiuw8kLZOvB50ScwR/oV8195s=;
 b=ivxH5IjwBHipI9H53VpRLpoSdnZbsCttPZmrg97eWZiE9QgxWhiDERNoRyBit/dENv
 GI+qaKEDDp/fidF7UH+ZtdBoOA/+5zjgkz7Vac5dBECJISs8gfNbLfKwDyyfM/0xDjQM
 jGT9u5/i7q1OQTyz31E/v22PKmGBPdVhzShPETy9XULi7nc8f0VLga9EuwZdoxmvQYjM
 4xkFWVNlMrgytB9PjgqEKTdHv2D7aQbqN4pT68v2/ugStdXKgni6QAQXsVjC7CuWZ3H9
 szMtZMQGi/J3rZ31odkrhtLGSPNIXzlM/8+uVC4WDYYkPVBZ6R3AZfqzcQHVl/juPpaI
 6qwg==
X-Gm-Message-State: AOAM530wU6Rjxc9iXUWLw1jS8pcngKQhLyAt1O+gfUj/VXmqG/pQyvZT
 KLyxt1v0YnWSSuto8GG1EFGuYBms/gscvBmgp1q+e7npxFuK3mGated7wKefO0nWsU6bfhkjT9V
 ORc/JVb4w7j+upYgzdBvimYLpyUPxqmsxRORdFnTU+oYF+JGVENO2GyvnnNi4xQgb
X-Received: by 2002:a05:600c:1c8b:: with SMTP id
 k11mr15337762wms.41.1625217900752; 
 Fri, 02 Jul 2021 02:25:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxd/h1IWfeKbPXwgQI9YWIVcyNxm+9KYo0T4u5NzIc2NbzpQ+KesS2RpoU641dzQaXk99hpcQ==
X-Received: by 2002:a05:600c:1c8b:: with SMTP id
 k11mr15337740wms.41.1625217900574; 
 Fri, 02 Jul 2021 02:25:00 -0700 (PDT)
Received: from x1w.Ascou-CH1 (pop.92-184-108-94.mobile.abo.orange.fr.
 [92.184.108.94])
 by smtp.gmail.com with ESMTPSA id e15sm2537357wrm.60.2021.07.02.02.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 02:25:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/6] dma: Let dma_memory_rw() take MemTxAttrs argument
Date: Fri,  2 Jul 2021 11:24:37 +0200
Message-Id: <20210702092439.989969-5-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210702092439.989969-1-philmd@redhat.com>
References: <20210702092439.989969-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.402,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let devices specify transaction attributes when calling
dma_memory_rw().

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/pci/pci.h  |  3 ++-
 include/sysemu/dma.h  | 11 ++++++-----
 hw/intc/spapr_xive.c  |  3 ++-
 hw/usb/hcd-ohci.c     | 10 ++++++----
 softmmu/dma-helpers.c |  3 ++-
 5 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 6be4e0c460c..252c91686de 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -801,7 +801,8 @@ static inline MemTxResult pci_dma_rw(PCIDevice *dev, dma_addr_t addr,
                                      void *buf, dma_addr_t len,
                                      DMADirection dir)
 {
-    return dma_memory_rw(pci_get_address_space(dev), addr, buf, len, dir);
+    return dma_memory_rw(pci_get_address_space(dev), addr, buf, len,
+                         dir, MEMTXATTRS_UNSPECIFIED);
 }
 
 /**
diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index 3be803cf3ff..e8ad42226f6 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -121,15 +121,15 @@ static inline MemTxResult dma_memory_write_relaxed(AddressSpace *as,
  * @buf: buffer with the data transferred
  * @len: the number of bytes to read or write
  * @dir: indicates the transfer direction
+ * @attrs: memory transaction attributes
  */
 static inline MemTxResult dma_memory_rw(AddressSpace *as, dma_addr_t addr,
                                         void *buf, dma_addr_t len,
-                                        DMADirection dir)
+                                        DMADirection dir, MemTxAttrs attrs)
 {
     dma_barrier(as, dir);
 
-    return dma_memory_rw_relaxed(as, addr, buf, len, dir,
-                                 MEMTXATTRS_UNSPECIFIED);
+    return dma_memory_rw_relaxed(as, addr, buf, len, dir, attrs);
 }
 
 /**
@@ -147,7 +147,8 @@ static inline MemTxResult dma_memory_rw(AddressSpace *as, dma_addr_t addr,
 static inline MemTxResult dma_memory_read(AddressSpace *as, dma_addr_t addr,
                                           void *buf, dma_addr_t len)
 {
-    return dma_memory_rw(as, addr, buf, len, DMA_DIRECTION_TO_DEVICE);
+    return dma_memory_rw(as, addr, buf, len,
+                         DMA_DIRECTION_TO_DEVICE, MEMTXATTRS_UNSPECIFIED);
 }
 
 /**
@@ -166,7 +167,7 @@ static inline MemTxResult dma_memory_write(AddressSpace *as, dma_addr_t addr,
                                            const void *buf, dma_addr_t len)
 {
     return dma_memory_rw(as, addr, (void *)buf, len,
-                         DMA_DIRECTION_FROM_DEVICE);
+                         DMA_DIRECTION_FROM_DEVICE, MEMTXATTRS_UNSPECIFIED);
 }
 
 /**
diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
index 89cfa018f59..91e733e74cd 100644
--- a/hw/intc/spapr_xive.c
+++ b/hw/intc/spapr_xive.c
@@ -1684,7 +1684,8 @@ static target_ulong h_int_esb(PowerPCCPU *cpu,
         mmio_addr = xive->vc_base + xive_source_esb_mgmt(xsrc, lisn) + offset;
 
         if (dma_memory_rw(&address_space_memory, mmio_addr, &data, 8,
-                          (flags & SPAPR_XIVE_ESB_STORE))) {
+                          (flags & SPAPR_XIVE_ESB_STORE),
+                          MEMTXATTRS_UNSPECIFIED)) {
             qemu_log_mask(LOG_GUEST_ERROR, "XIVE: failed to access ESB @0x%"
                           HWADDR_PRIx "\n", mmio_addr);
             return H_HARDWARE;
diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index 1cf2816772c..56e2315c734 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -586,7 +586,8 @@ static int ohci_copy_td(OHCIState *ohci, struct ohci_td *td,
     if (n > len)
         n = len;
 
-    if (dma_memory_rw(ohci->as, ptr + ohci->localmem_base, buf, n, dir)) {
+    if (dma_memory_rw(ohci->as, ptr + ohci->localmem_base, buf,
+                      n, dir, MEMTXATTRS_UNSPECIFIED)) {
         return -1;
     }
     if (n == len) {
@@ -595,7 +596,7 @@ static int ohci_copy_td(OHCIState *ohci, struct ohci_td *td,
     ptr = td->be & ~0xfffu;
     buf += n;
     if (dma_memory_rw(ohci->as, ptr + ohci->localmem_base, buf,
-                      len - n, dir)) {
+                      len - n, dir, MEMTXATTRS_UNSPECIFIED)) {
         return -1;
     }
     return 0;
@@ -613,7 +614,8 @@ static int ohci_copy_iso_td(OHCIState *ohci,
     if (n > len)
         n = len;
 
-    if (dma_memory_rw(ohci->as, ptr + ohci->localmem_base, buf, n, dir)) {
+    if (dma_memory_rw(ohci->as, ptr + ohci->localmem_base, buf,
+                      n, dir, MEMTXATTRS_UNSPECIFIED)) {
         return -1;
     }
     if (n == len) {
@@ -622,7 +624,7 @@ static int ohci_copy_iso_td(OHCIState *ohci,
     ptr = end_addr & ~0xfffu;
     buf += n;
     if (dma_memory_rw(ohci->as, ptr + ohci->localmem_base, buf,
-                      len - n, dir)) {
+                      len - n, dir, MEMTXATTRS_UNSPECIFIED)) {
         return -1;
     }
     return 0;
diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
index 1f07217ad4a..5bf76fff6bd 100644
--- a/softmmu/dma-helpers.c
+++ b/softmmu/dma-helpers.c
@@ -305,7 +305,8 @@ static uint64_t dma_buf_rw(uint8_t *ptr, int32_t len, QEMUSGList *sg,
     while (len > 0) {
         ScatterGatherEntry entry = sg->sg[sg_cur_index++];
         int32_t xfer = MIN(len, entry.len);
-        dma_memory_rw(sg->as, entry.base, ptr, xfer, dir);
+        dma_memory_rw(sg->as, entry.base, ptr, xfer, dir,
+                      MEMTXATTRS_UNSPECIFIED);
         ptr += xfer;
         len -= xfer;
         resid -= xfer;
-- 
2.31.1


