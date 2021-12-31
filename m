Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A52748213E
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 02:21:45 +0100 (CET)
Received: from localhost ([::1]:39360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n36c4-00085d-Bt
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 20:21:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n36EP-0002tU-FJ
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 19:57:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n36EN-0003ej-F7
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 19:57:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640912235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wLEy95INhAWDbLQg6MEe6L4Zh42fLXEnwRSZqGrXmjI=;
 b=ZiE/Tb2wEs04glP4Z10B+ySriPnHR+QZdKkWxI85VLl/LKXAfxfpqRVTYvz665YfKvbKt8
 9ZPXj3ibxTCrxl8e7s+RpUJsHr/PyURUdnsA4PwAJXQ0tzWqtV6uUfJUHCnqWI1/h4rGJu
 oWWUrccEkD85+YJuenpWUd8+FOvgQSc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-267-NzxM8uLFMeOIxBX4pKOI6g-1; Thu, 30 Dec 2021 19:57:13 -0500
X-MC-Unique: NzxM8uLFMeOIxBX4pKOI6g-1
Received: by mail-ed1-f71.google.com with SMTP id
 dm10-20020a05640222ca00b003f808b5aa18so18026671edb.4
 for <qemu-devel@nongnu.org>; Thu, 30 Dec 2021 16:57:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wLEy95INhAWDbLQg6MEe6L4Zh42fLXEnwRSZqGrXmjI=;
 b=6hRyRHf1dzS/+8yOQpsdg5YND81wtaXaqYYJkaKrpKT9J/D42gOEDAc3BLKr5okFK1
 NDlLL5Du9T3ZCwfXLuPOdew4QQ3xlA7WwB4n85f/7h+no5hpfEuiL3NhKye3oGk9lZee
 4DsiqUAl2S8qfjjG+qM2kVta/nTPS3afBYEO1qrLwuzONOYPtIcvOOiro26+OEL7qXSe
 ZphMT7KXXN1CC5CQuEtfgH/TvHcmGW6YjZKmScIQ9CePPq5+vcLuvrAvwgtOSbjse1fv
 GoRabKWZ2HRhTQldwXk/oQBdoXEf6x8ffsmlW+54v8rr1Lfj02dYE1fArMG5cOaSdnO9
 RoYA==
X-Gm-Message-State: AOAM533Xn5ktt3UD4Yoem3e8+7VhpsvDV3MbdU4Ljo+LF/fXuY/WY937
 5t4PO1QB1eYyRurjMAsnFvxGj1HSfdRXBmKK7PqXlqUxiYi8x+9qXTyH74B/U70cYweNVmvmwhU
 on7vAI1GQAabV0vmROfk954Ej9ZNlAlW+ivnA1eDhheveTgPkVCFBYeIF8P5NXFWG
X-Received: by 2002:aa7:de82:: with SMTP id j2mr14087737edv.389.1640912232502; 
 Thu, 30 Dec 2021 16:57:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzsoPUXB7i3bz8MVUofJC1s28cruRcGmoMxPP4D0Jc4H58G0jJ4b4cU/NOujxuW7fVQ6q48Wg==
X-Received: by 2002:aa7:de82:: with SMTP id j2mr14087722edv.389.1640912232314; 
 Thu, 30 Dec 2021 16:57:12 -0800 (PST)
Received: from x1w.redhat.com (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id y22sm7507857eda.49.2021.12.30.16.57.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 16:57:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/22] dma: Let ld*_dma() propagate MemTxResult
Date: Fri, 31 Dec 2021 01:55:42 +0100
Message-Id: <20211231005546.723396-19-philmd@redhat.com>
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

dma_memory_read() returns a MemTxResult type. Do not discard
it, return it to the caller.

Update the few callers.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211223115554.3155328-19-philmd@redhat.com>
---
 include/hw/pci/pci.h       |  6 ++++--
 include/hw/ppc/spapr_vio.h |  6 +++++-
 include/sysemu/dma.h       | 25 ++++++++++++-------------
 hw/intc/pnv_xive.c         |  8 ++++----
 hw/usb/hcd-xhci.c          |  7 ++++---
 5 files changed, 29 insertions(+), 23 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 0613308b1b6..8c5f2ed5054 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -854,8 +854,10 @@ static inline MemTxResult pci_dma_write(PCIDevice *dev, dma_addr_t addr,
     static inline uint##_bits##_t ld##_l##_pci_dma(PCIDevice *dev,      \
                                                    dma_addr_t addr)     \
     {                                                                   \
-        return ld##_l##_dma(pci_get_address_space(dev), addr,           \
-                            MEMTXATTRS_UNSPECIFIED);                    \
+        uint##_bits##_t val; \
+        ld##_l##_dma(pci_get_address_space(dev), addr, &val, \
+                     MEMTXATTRS_UNSPECIFIED); \
+        return val; \
     }                                                                   \
     static inline void st##_s##_pci_dma(PCIDevice *dev,                 \
                                         dma_addr_t addr, uint##_bits##_t val) \
diff --git a/include/hw/ppc/spapr_vio.h b/include/hw/ppc/spapr_vio.h
index d2ec9b0637f..7eae1a48478 100644
--- a/include/hw/ppc/spapr_vio.h
+++ b/include/hw/ppc/spapr_vio.h
@@ -127,7 +127,11 @@ static inline int spapr_vio_dma_set(SpaprVioDevice *dev, uint64_t taddr,
 #define vio_stq(_dev, _addr, _val) \
         (stq_be_dma(&(_dev)->as, (_addr), (_val), MEMTXATTRS_UNSPECIFIED))
 #define vio_ldq(_dev, _addr) \
-        (ldq_be_dma(&(_dev)->as, (_addr), MEMTXATTRS_UNSPECIFIED))
+        ({ \
+            uint64_t _val; \
+            ldq_be_dma(&(_dev)->as, (_addr), &_val, MEMTXATTRS_UNSPECIFIED); \
+            _val; \
+        })
 
 int spapr_vio_send_crq(SpaprVioDevice *dev, uint8_t *crq);
 
diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index 895044d747f..b3faef41b2f 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -240,14 +240,15 @@ static inline void dma_memory_unmap(AddressSpace *as,
 }
 
 #define DEFINE_LDST_DMA(_lname, _sname, _bits, _end) \
-    static inline uint##_bits##_t ld##_lname##_##_end##_dma(AddressSpace *as, \
-                                                            dma_addr_t addr, \
-                                                            MemTxAttrs attrs) \
-    {                                                                   \
-        uint##_bits##_t val;                                            \
-        dma_memory_read(as, addr, &val, (_bits) / 8, attrs); \
-        return _end##_bits##_to_cpu(val);                               \
-    }                                                                   \
+    static inline MemTxResult ld##_lname##_##_end##_dma(AddressSpace *as, \
+                                                        dma_addr_t addr, \
+                                                        uint##_bits##_t *pval, \
+                                                        MemTxAttrs attrs) \
+    { \
+        MemTxResult res = dma_memory_read(as, addr, pval, (_bits) / 8, attrs); \
+        _end##_bits##_to_cpus(pval); \
+        return res; \
+    } \
     static inline MemTxResult st##_sname##_##_end##_dma(AddressSpace *as, \
                                                         dma_addr_t addr, \
                                                         uint##_bits##_t val, \
@@ -257,12 +258,10 @@ static inline void dma_memory_unmap(AddressSpace *as,
         return dma_memory_write(as, addr, &val, (_bits) / 8, attrs); \
     }
 
-static inline uint8_t ldub_dma(AddressSpace *as, dma_addr_t addr, MemTxAttrs attrs)
+static inline MemTxResult ldub_dma(AddressSpace *as, dma_addr_t addr,
+                                   uint8_t *val, MemTxAttrs attrs)
 {
-    uint8_t val;
-
-    dma_memory_read(as, addr, &val, 1, attrs);
-    return val;
+    return dma_memory_read(as, addr, val, 1, attrs);
 }
 
 static inline MemTxResult stb_dma(AddressSpace *as, dma_addr_t addr,
diff --git a/hw/intc/pnv_xive.c b/hw/intc/pnv_xive.c
index d9249bbc0c1..bb207514f2d 100644
--- a/hw/intc/pnv_xive.c
+++ b/hw/intc/pnv_xive.c
@@ -172,7 +172,7 @@ static uint64_t pnv_xive_vst_addr_indirect(PnvXive *xive, uint32_t type,
 
     /* Get the page size of the indirect table. */
     vsd_addr = vsd & VSD_ADDRESS_MASK;
-    vsd = ldq_be_dma(&address_space_memory, vsd_addr, MEMTXATTRS_UNSPECIFIED);
+    ldq_be_dma(&address_space_memory, vsd_addr, &vsd, MEMTXATTRS_UNSPECIFIED);
 
     if (!(vsd & VSD_ADDRESS_MASK)) {
 #ifdef XIVE_DEBUG
@@ -195,8 +195,8 @@ static uint64_t pnv_xive_vst_addr_indirect(PnvXive *xive, uint32_t type,
     /* Load the VSD we are looking for, if not already done */
     if (vsd_idx) {
         vsd_addr = vsd_addr + vsd_idx * XIVE_VSD_SIZE;
-        vsd = ldq_be_dma(&address_space_memory, vsd_addr,
-                         MEMTXATTRS_UNSPECIFIED);
+        ldq_be_dma(&address_space_memory, vsd_addr, &vsd,
+                   MEMTXATTRS_UNSPECIFIED);
 
         if (!(vsd & VSD_ADDRESS_MASK)) {
 #ifdef XIVE_DEBUG
@@ -543,7 +543,7 @@ static uint64_t pnv_xive_vst_per_subpage(PnvXive *xive, uint32_t type)
 
     /* Get the page size of the indirect table. */
     vsd_addr = vsd & VSD_ADDRESS_MASK;
-    vsd = ldq_be_dma(&address_space_memory, vsd_addr, MEMTXATTRS_UNSPECIFIED);
+    ldq_be_dma(&address_space_memory, vsd_addr, &vsd, MEMTXATTRS_UNSPECIFIED);
 
     if (!(vsd & VSD_ADDRESS_MASK)) {
 #ifdef XIVE_DEBUG
diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
index d960b814587..da5a4072107 100644
--- a/hw/usb/hcd-xhci.c
+++ b/hw/usb/hcd-xhci.c
@@ -2062,7 +2062,7 @@ static TRBCCode xhci_address_slot(XHCIState *xhci, unsigned int slotid,
     assert(slotid >= 1 && slotid <= xhci->numslots);
 
     dcbaap = xhci_addr64(xhci->dcbaap_low, xhci->dcbaap_high);
-    poctx = ldq_le_dma(xhci->as, dcbaap + 8 * slotid, MEMTXATTRS_UNSPECIFIED);
+    ldq_le_dma(xhci->as, dcbaap + 8 * slotid, &poctx, MEMTXATTRS_UNSPECIFIED);
     ictx = xhci_mask64(pictx);
     octx = xhci_mask64(poctx);
 
@@ -3429,6 +3429,7 @@ static int usb_xhci_post_load(void *opaque, int version_id)
     uint32_t slot_ctx[4];
     uint32_t ep_ctx[5];
     int slotid, epid, state;
+    uint64_t addr;
 
     dcbaap = xhci_addr64(xhci->dcbaap_low, xhci->dcbaap_high);
 
@@ -3437,8 +3438,8 @@ static int usb_xhci_post_load(void *opaque, int version_id)
         if (!slot->addressed) {
             continue;
         }
-        slot->ctx = xhci_mask64(ldq_le_dma(xhci->as, dcbaap + 8 * slotid,
-                                           MEMTXATTRS_UNSPECIFIED));
+        ldq_le_dma(xhci->as, dcbaap + 8 * slotid, &addr, MEMTXATTRS_UNSPECIFIED);
+        slot->ctx = xhci_mask64(addr);
         xhci_dma_read_u32s(xhci, slot->ctx, slot_ctx, sizeof(slot_ctx));
         slot->uport = xhci_lookup_uport(xhci, slot_ctx);
         if (!slot->uport) {
-- 
2.33.1


