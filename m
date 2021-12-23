Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9976E47E31A
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 13:18:29 +0100 (CET)
Received: from localhost ([::1]:42790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0N3E-0006Uu-Mo
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 07:18:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0MlW-0004ky-KB
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 07:00:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0MlU-0001Hb-B2
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 07:00:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640260807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vdLtyGiJkeMl3td5q47AwY8bpcOEYnDZ2ZEG37vZDgg=;
 b=TT6FXCqRNiDKhyUlvMGlEbUbkirZ8STVuymUXAga32CdHQXbOYBxp6UAI/WNNx1oFYFAIz
 IlbUDZjf5Is4gVOVjXboMomNxSstXXnmkC0x9vyKju5csFJMsuTmRQu/sQi7W3cAo/Gj+6
 EzRtNh3PgPrzU5aIF5Jbi4YOtYDkg5A=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-VDjI0YK0N1OiZlIGsBNB9Q-1; Thu, 23 Dec 2021 07:00:06 -0500
X-MC-Unique: VDjI0YK0N1OiZlIGsBNB9Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 b75-20020a1c804e000000b0034569bde713so4533018wmd.9
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 04:00:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vdLtyGiJkeMl3td5q47AwY8bpcOEYnDZ2ZEG37vZDgg=;
 b=Q2bKpUtcTaqFuOTktH9WpWt3uLpQuiWgiGo+kyKyRl620/peDYr14Mm4s1MJ29LBWn
 fP9OEP/lkybKKnpCXn3YXdkwLZbgbrTKI4y1rUXoC8SjZNDzoeMU93uh+LRyks5ZDINT
 sKQmLZnLhuZNjVa9asow6zJ5ABB5Y/wnarbHnvNEMLHH+AbacwOzhBgZiW0hdxzFH0Qq
 bJ6/j+JwaskNB/PW/rNVzLmnbtIpXTQmMWoJaqWC2j8YqjAHLyiUhj9NK8NNlw0M1Zh0
 H1X/045JbBEck//d/9tLr4H0o5rH3SRR9tiZo/0ZwavuFs2Ru86t4G+92jzFwSb7GuDm
 FZ0g==
X-Gm-Message-State: AOAM532z/R0lmdL03XXQ9ylFO2EzHXydTJOb5seN13BeJARVfXGwosaZ
 fzQ8abrSIq6XABILAr/R4Ewbss+uml/Aqf1UWajt3c5xGO3yiUXjZVuH+YZfbs6nH5U75LYUaP6
 VPSLDjgzbjKkO+YnEDN3QfamT6LTXbSo2SGte0gCXEuGWMmNUrOgGfQspiTs8Y2lr
X-Received: by 2002:a5d:650f:: with SMTP id x15mr1501835wru.57.1640260805510; 
 Thu, 23 Dec 2021 04:00:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyfBj7801Rym+T0NHjEcotQhjhXR9GQW60PbxXO5gjfhMFkT7gYMQ53oDZDV6oIaoYlKafFNw==
X-Received: by 2002:a5d:650f:: with SMTP id x15mr1501781wru.57.1640260805125; 
 Thu, 23 Dec 2021 04:00:05 -0800 (PST)
Received: from x1w.. (33.red-193-152-124.dynamicip.rima-tde.net.
 [193.152.124.33])
 by smtp.gmail.com with ESMTPSA id s1sm7657694wmh.35.2021.12.23.03.59.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 04:00:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 18/23] dma: Let ld*_dma() propagate MemTxResult
Date: Thu, 23 Dec 2021 12:55:49 +0100
Message-Id: <20211223115554.3155328-19-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211223115554.3155328-1-philmd@redhat.com>
References: <20211223115554.3155328-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Sven Schnelle <svens@stackframe.org>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, Joel Stanley <joel@jms.id.au>,
 Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Keith Busch <kbusch@kernel.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Tyrone Ting <kfting@nuvoton.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

dma_memory_read() returns a MemTxResult type. Do not discard
it, return it to the caller.

Update the few callers.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
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
index 725e8e90f88..e6776586613 100644
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


