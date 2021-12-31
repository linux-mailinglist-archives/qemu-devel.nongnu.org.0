Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DE0482139
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 02:17:29 +0100 (CET)
Received: from localhost ([::1]:59182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n36Xv-0002FO-Ka
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 20:17:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n36EG-0002bU-B0
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 19:57:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n36EE-0003dK-Km
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 19:57:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640912226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xgo4TgyYI9M3NsxJkvR5hMlDSbK9clBQx4AwNiHH0tA=;
 b=QKTQgqqIkScb4BSaoQWvnFC41Dul9hZVtXNTnlf9not2Gqn5Tzs4YDLKcGpx5ReUAt8Ih3
 EtAd/gavliutpMudLSsx0mjSTrDykOH8snywFAgNYNfVsSh9fVT0F3pF0VgTUi+EuNMLgY
 ynTtmXfqLqLWJJx3eM1tx8lq/dk1Z8Q=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-xEdCE35RNYaplYDu3yw7mw-1; Thu, 30 Dec 2021 19:57:05 -0500
X-MC-Unique: xEdCE35RNYaplYDu3yw7mw-1
Received: by mail-ed1-f69.google.com with SMTP id
 z10-20020a05640235ca00b003f8efab3342so10978737edc.2
 for <qemu-devel@nongnu.org>; Thu, 30 Dec 2021 16:57:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xgo4TgyYI9M3NsxJkvR5hMlDSbK9clBQx4AwNiHH0tA=;
 b=lbXAysXVf+X1KziO9F1IYsFIqtC7hbZ8QimhxOcqPS+Vg9coFsukjjOrvvf7jhRXG2
 8G6qVeVZkH5fg35F0PmmNiiClBWfDjDb0BdvNpCBrbxfFsezE2I10Ro6u86FIuTkTYOA
 QAOdFBXXzY02Ihc6Szfy0SBNbHloJMG0vFBfpNYVh6g32LXQ3k5Ky79dQ7uDeWX2Ie8D
 PtvO/dop0lW4vRPOpsR//nDC9zKsRHmdLnrZFkuHDaaZ3rGz7pwT6O77pp0EyEE/lvVn
 KBMBm2qoJuO1xGDiJyHf5ASLiQK0oKDnS5j9kwwJXn4oG9BG9pOEoUGJg6uuwO2Errik
 VclQ==
X-Gm-Message-State: AOAM530Nq/EbKmuMe1MH2E31+t3CUR9yoVw5OcmjQlu8fGc5oiquZITz
 bH+lxLVXdUr20MQHdSjWtmkqJkMG6ZKSbMMGeMrrRNycpYPYSwm/7lOQolwe9wvr1+R8GEVPQYc
 blTUlDHc+o0GepeG8wlK+5t4sZM86ZUhxOK5LJI6ED+5LKtB4Rx6lLzbOMmapXuEs
X-Received: by 2002:aa7:d818:: with SMTP id v24mr33219954edq.298.1640912223677; 
 Thu, 30 Dec 2021 16:57:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJww1hfLUTZID8odZnnf5T85TqBHXXV3VqZvh+loTM1BKD4jZb72TNakbfai4QZ0X9PtcD373Q==
X-Received: by 2002:aa7:d818:: with SMTP id v24mr33219933edq.298.1640912223435; 
 Thu, 30 Dec 2021 16:57:03 -0800 (PST)
Received: from x1w.redhat.com (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id g19sm10033981edr.6.2021.12.30.16.57.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 16:57:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/22] dma: Let ld*_dma() take MemTxAttrs argument
Date: Fri, 31 Dec 2021 01:55:40 +0100
Message-Id: <20211231005546.723396-17-philmd@redhat.com>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let devices specify transaction attributes when calling ld*_dma().

Keep the default MEMTXATTRS_UNSPECIFIED in the few callers.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211223115554.3155328-17-philmd@redhat.com>
---
 include/hw/pci/pci.h       |  3 ++-
 include/hw/ppc/spapr_vio.h |  3 ++-
 include/sysemu/dma.h       | 11 ++++++-----
 hw/intc/pnv_xive.c         |  7 ++++---
 hw/usb/hcd-xhci.c          |  6 +++---
 5 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index d07e9707b48..0613308b1b6 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -854,7 +854,8 @@ static inline MemTxResult pci_dma_write(PCIDevice *dev, dma_addr_t addr,
     static inline uint##_bits##_t ld##_l##_pci_dma(PCIDevice *dev,      \
                                                    dma_addr_t addr)     \
     {                                                                   \
-        return ld##_l##_dma(pci_get_address_space(dev), addr);          \
+        return ld##_l##_dma(pci_get_address_space(dev), addr,           \
+                            MEMTXATTRS_UNSPECIFIED);                    \
     }                                                                   \
     static inline void st##_s##_pci_dma(PCIDevice *dev,                 \
                                         dma_addr_t addr, uint##_bits##_t val) \
diff --git a/include/hw/ppc/spapr_vio.h b/include/hw/ppc/spapr_vio.h
index e87f8e6f596..d2ec9b0637f 100644
--- a/include/hw/ppc/spapr_vio.h
+++ b/include/hw/ppc/spapr_vio.h
@@ -126,7 +126,8 @@ static inline int spapr_vio_dma_set(SpaprVioDevice *dev, uint64_t taddr,
         (stl_be_dma(&(_dev)->as, (_addr), (_val), MEMTXATTRS_UNSPECIFIED))
 #define vio_stq(_dev, _addr, _val) \
         (stq_be_dma(&(_dev)->as, (_addr), (_val), MEMTXATTRS_UNSPECIFIED))
-#define vio_ldq(_dev, _addr) (ldq_be_dma(&(_dev)->as, (_addr)))
+#define vio_ldq(_dev, _addr) \
+        (ldq_be_dma(&(_dev)->as, (_addr), MEMTXATTRS_UNSPECIFIED))
 
 int spapr_vio_send_crq(SpaprVioDevice *dev, uint8_t *crq);
 
diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index 009dd3ca960..d1635f55870 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -241,10 +241,11 @@ static inline void dma_memory_unmap(AddressSpace *as,
 
 #define DEFINE_LDST_DMA(_lname, _sname, _bits, _end) \
     static inline uint##_bits##_t ld##_lname##_##_end##_dma(AddressSpace *as, \
-                                                            dma_addr_t addr) \
+                                                            dma_addr_t addr, \
+                                                            MemTxAttrs attrs) \
     {                                                                   \
         uint##_bits##_t val;                                            \
-        dma_memory_read(as, addr, &val, (_bits) / 8, MEMTXATTRS_UNSPECIFIED); \
+        dma_memory_read(as, addr, &val, (_bits) / 8, attrs); \
         return _end##_bits##_to_cpu(val);                               \
     }                                                                   \
     static inline void st##_sname##_##_end##_dma(AddressSpace *as,      \
@@ -253,14 +254,14 @@ static inline void dma_memory_unmap(AddressSpace *as,
                                                  MemTxAttrs attrs)      \
     {                                                                   \
         val = cpu_to_##_end##_bits(val);                                \
-        dma_memory_write(as, addr, &val, (_bits) / 8, attrs); \
+        dma_memory_write(as, addr, &val, (_bits) / 8, attrs);           \
     }
 
-static inline uint8_t ldub_dma(AddressSpace *as, dma_addr_t addr)
+static inline uint8_t ldub_dma(AddressSpace *as, dma_addr_t addr, MemTxAttrs attrs)
 {
     uint8_t val;
 
-    dma_memory_read(as, addr, &val, 1, MEMTXATTRS_UNSPECIFIED);
+    dma_memory_read(as, addr, &val, 1, attrs);
     return val;
 }
 
diff --git a/hw/intc/pnv_xive.c b/hw/intc/pnv_xive.c
index ad43483612e..d9249bbc0c1 100644
--- a/hw/intc/pnv_xive.c
+++ b/hw/intc/pnv_xive.c
@@ -172,7 +172,7 @@ static uint64_t pnv_xive_vst_addr_indirect(PnvXive *xive, uint32_t type,
 
     /* Get the page size of the indirect table. */
     vsd_addr = vsd & VSD_ADDRESS_MASK;
-    vsd = ldq_be_dma(&address_space_memory, vsd_addr);
+    vsd = ldq_be_dma(&address_space_memory, vsd_addr, MEMTXATTRS_UNSPECIFIED);
 
     if (!(vsd & VSD_ADDRESS_MASK)) {
 #ifdef XIVE_DEBUG
@@ -195,7 +195,8 @@ static uint64_t pnv_xive_vst_addr_indirect(PnvXive *xive, uint32_t type,
     /* Load the VSD we are looking for, if not already done */
     if (vsd_idx) {
         vsd_addr = vsd_addr + vsd_idx * XIVE_VSD_SIZE;
-        vsd = ldq_be_dma(&address_space_memory, vsd_addr);
+        vsd = ldq_be_dma(&address_space_memory, vsd_addr,
+                         MEMTXATTRS_UNSPECIFIED);
 
         if (!(vsd & VSD_ADDRESS_MASK)) {
 #ifdef XIVE_DEBUG
@@ -542,7 +543,7 @@ static uint64_t pnv_xive_vst_per_subpage(PnvXive *xive, uint32_t type)
 
     /* Get the page size of the indirect table. */
     vsd_addr = vsd & VSD_ADDRESS_MASK;
-    vsd = ldq_be_dma(&address_space_memory, vsd_addr);
+    vsd = ldq_be_dma(&address_space_memory, vsd_addr, MEMTXATTRS_UNSPECIFIED);
 
     if (!(vsd & VSD_ADDRESS_MASK)) {
 #ifdef XIVE_DEBUG
diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
index ed2b9ea456e..d960b814587 100644
--- a/hw/usb/hcd-xhci.c
+++ b/hw/usb/hcd-xhci.c
@@ -2062,7 +2062,7 @@ static TRBCCode xhci_address_slot(XHCIState *xhci, unsigned int slotid,
     assert(slotid >= 1 && slotid <= xhci->numslots);
 
     dcbaap = xhci_addr64(xhci->dcbaap_low, xhci->dcbaap_high);
-    poctx = ldq_le_dma(xhci->as, dcbaap + 8 * slotid);
+    poctx = ldq_le_dma(xhci->as, dcbaap + 8 * slotid, MEMTXATTRS_UNSPECIFIED);
     ictx = xhci_mask64(pictx);
     octx = xhci_mask64(poctx);
 
@@ -3437,8 +3437,8 @@ static int usb_xhci_post_load(void *opaque, int version_id)
         if (!slot->addressed) {
             continue;
         }
-        slot->ctx =
-            xhci_mask64(ldq_le_dma(xhci->as, dcbaap + 8 * slotid));
+        slot->ctx = xhci_mask64(ldq_le_dma(xhci->as, dcbaap + 8 * slotid,
+                                           MEMTXATTRS_UNSPECIFIED));
         xhci_dma_read_u32s(xhci, slot->ctx, slot_ctx, sizeof(slot_ctx));
         slot->uport = xhci_lookup_uport(xhci, slot_ctx);
         if (!slot->uport) {
-- 
2.33.1


