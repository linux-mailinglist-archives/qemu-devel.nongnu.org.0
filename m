Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7B047E3B6
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 13:50:40 +0100 (CET)
Received: from localhost ([::1]:49140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0NYN-00008y-Br
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 07:50:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0MlA-00040B-F2
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:59:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0Ml3-0001An-Op
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:59:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640260781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ftwXgHnQRoZowrvTRk4Xx2aE6O9/FjV/sJjIF9qzyOM=;
 b=TeK5gcJTFYoCmIYFW08lXV7ueWEeB0+OwRbcNVjb3rhcqQl4EneEvj8EY98XWX0rk5f1P3
 UPlQ6BAsOJ0se98ryEeGfQOz5X4WO1bbzhIKb61VP3SSiZs8CrzJwZ80tc9w+9WjE/qQ0l
 OjrMuA0BlRaTPjm7E1JgLeW4tC0EMFQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-134-zhsUQrcuPmijI-X-qHn-6w-1; Thu, 23 Dec 2021 06:59:40 -0500
X-MC-Unique: zhsUQrcuPmijI-X-qHn-6w-1
Received: by mail-wm1-f72.google.com with SMTP id
 187-20020a1c02c4000000b003335872db8dso1943430wmc.2
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 03:59:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ftwXgHnQRoZowrvTRk4Xx2aE6O9/FjV/sJjIF9qzyOM=;
 b=nE2rlnFirqeC8K5oQrFaCtvDg0hSzq8Yo70d3K/tP0QtM0BilzOG74UDjM2laYl34b
 e+S4mbMKgCeOW4uuGi/SOdImeNypztb8gSm/p6/hcPyNgatfQ3SAGsQqriREqAcLFcUp
 nUHugbnypKVoa3j4JpSaGv/4O/oCNvy16YFDrj4GHNfBN6/75H9l+gEfiQU1I2agMJ/a
 +/y2zT1cEL4yVkRdTijdiVZz/6i8Daqp7NZzovlDqRqttJLYG+9x8eSzpDc4FMMlE3Qd
 wgLrNJ6EJ8T31xGSKiFGQPPrN/HBzoeULqBTClPxsovhAtPO47wwL21juLXS1hDA6cm8
 nQFA==
X-Gm-Message-State: AOAM533pItY2Bq8kyndRtht3RA/etQAjjrAgvVXAmKnkkNAgdsbmo38O
 xvRuq7TumBE2/52yaZU5phMfka7M2mo13ySdYzn3wH2ozZ/66mz6JpDCS+xa9FfEK31+fZrY0DS
 gYNlbV9TlGe5veRvWfaBQRYWDcN4WNABJWJfg/d6oRCh0s8SYhhB8jnoW9MSTkPhB
X-Received: by 2002:adf:d1c5:: with SMTP id b5mr1519311wrd.177.1640260778508; 
 Thu, 23 Dec 2021 03:59:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy3RYShAZiqz5f6PCfPJ8NH7hoS9j2wFZo+e+5yyk/2KLGEc76Ly6K40LkflzX1JkLhKDSW2Q==
X-Received: by 2002:adf:d1c5:: with SMTP id b5mr1519252wrd.177.1640260778196; 
 Thu, 23 Dec 2021 03:59:38 -0800 (PST)
Received: from x1w.. (33.red-193-152-124.dynamicip.rima-tde.net.
 [193.152.124.33])
 by smtp.gmail.com with ESMTPSA id o38sm2299342wms.11.2021.12.23.03.59.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 03:59:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/23] dma: Let ld*_dma() take MemTxAttrs argument
Date: Thu, 23 Dec 2021 12:55:47 +0100
Message-Id: <20211223115554.3155328-17-philmd@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Let devices specify transaction attributes when calling ld*_dma().

Keep the default MEMTXATTRS_UNSPECIFIED in the few callers.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
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
index ebbc0501681..f3cf60d222d 100644
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


