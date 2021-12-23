Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D00A147E3A3
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 13:41:38 +0100 (CET)
Received: from localhost ([::1]:39836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0NPd-000165-S7
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 07:41:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0Mkt-0003HJ-K5
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:59:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0Mkr-00018L-JL
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:59:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640260768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NSopmSWVqanwbnplx6qNpP3mtJv+WIiHHgiOwpgcpF4=;
 b=YJFxS2foWMiGtljxyngGAEBGJ7kpMjni30Jte/xHzWHJbjXuCYaOdA0to+oQ/LIJKz8xle
 UTCPaLQZrCBJJ39F/lmoOiv3xXs3QHxidHDFcECRh4hj3hggcLApgrhyBbq5mwS3Ymbpsq
 JyjYCtxirizLiDg74Uav939XpC7V+Sk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-160-4bsE9F6YNNSs8nTZ47y7tw-1; Thu, 23 Dec 2021 06:59:27 -0500
X-MC-Unique: 4bsE9F6YNNSs8nTZ47y7tw-1
Received: by mail-wr1-f69.google.com with SMTP id
 l13-20020adfbd8d000000b001a23a990dbfso1224303wrh.5
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 03:59:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NSopmSWVqanwbnplx6qNpP3mtJv+WIiHHgiOwpgcpF4=;
 b=Y23m8ZRca8J2Us5V8OyiRcM5GhY+23k4AcIJGrlrgmriJtSxTvLzO1EwNBwzl7MnWg
 4azCC8wgCzIX12ccP4CpOY4miZI82xJ0L+RyP6COCoqwqyQx9N7cyBBoANDrlc14DzaL
 xI+N1QRoeIu37SkyHyMEBFujOYOR5Gqf8s1TZxZaBrhb6LeaunsC3T7epcfKehw8x95G
 c9lWFVxKCM8FUJ98JrkLXlUAMGpF+hKacMaIsHJ8DvqkcftlZ+wJgCSHPq8Gwi+zydF6
 GSLOneAYMbzmVw52BianByDb+LkJKlG5FyHGWDmZ7kAuieADVf+NelD65eCrObmlWrRo
 xHXA==
X-Gm-Message-State: AOAM532Wj4R9g7Yzr5cH4g2V2q6TK4xwFM3mPfcYsF3qby95evfbf4BQ
 L39XkpX4pLZ0O+jPGFVufY5TbFd8DJ4LeClwafLQt//9T2w1SRsQ8oSCyAR/5vxZ/k9iOMonbYm
 GTGLfTvoC1C8Chg4dDd5C4T38UMyimBWXD1TkSncOl340KBxoJOfxhPMsxUt0r2tr
X-Received: by 2002:a7b:ca54:: with SMTP id m20mr1476119wml.127.1640260765617; 
 Thu, 23 Dec 2021 03:59:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyn3Nwd76HLINri1ov2M1AHMbGhwDHxRznSJYVEH9ul28NBykc+7yxxHc0RMh8AndmXoGH1gg==
X-Received: by 2002:a7b:ca54:: with SMTP id m20mr1476066wml.127.1640260765351; 
 Thu, 23 Dec 2021 03:59:25 -0800 (PST)
Received: from x1w.. (33.red-193-152-124.dynamicip.rima-tde.net.
 [193.152.124.33])
 by smtp.gmail.com with ESMTPSA id z5sm4578810wru.87.2021.12.23.03.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 03:59:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/23] dma: Let st*_dma() take MemTxAttrs argument
Date: Thu, 23 Dec 2021 12:55:46 +0100
Message-Id: <20211223115554.3155328-16-philmd@redhat.com>
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

Let devices specify transaction attributes when calling st*_dma().

Keep the default MEMTXATTRS_UNSPECIFIED in the few callers.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/pci/pci.h       |  3 ++-
 include/hw/ppc/spapr_vio.h | 12 ++++++++----
 include/sysemu/dma.h       | 10 ++++++----
 hw/nvram/fw_cfg.c          |  4 ++--
 4 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index a751ab5a75d..d07e9707b48 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -859,7 +859,8 @@ static inline MemTxResult pci_dma_write(PCIDevice *dev, dma_addr_t addr,
     static inline void st##_s##_pci_dma(PCIDevice *dev,                 \
                                         dma_addr_t addr, uint##_bits##_t val) \
     {                                                                   \
-        st##_s##_dma(pci_get_address_space(dev), addr, val);            \
+        st##_s##_dma(pci_get_address_space(dev), addr, val, \
+                     MEMTXATTRS_UNSPECIFIED); \
     }
 
 PCI_DMA_DEFINE_LDST(ub, b, 8);
diff --git a/include/hw/ppc/spapr_vio.h b/include/hw/ppc/spapr_vio.h
index 5d2ea8e6656..e87f8e6f596 100644
--- a/include/hw/ppc/spapr_vio.h
+++ b/include/hw/ppc/spapr_vio.h
@@ -118,10 +118,14 @@ static inline int spapr_vio_dma_set(SpaprVioDevice *dev, uint64_t taddr,
         H_DEST_PARM : H_SUCCESS;
 }
 
-#define vio_stb(_dev, _addr, _val) (stb_dma(&(_dev)->as, (_addr), (_val)))
-#define vio_sth(_dev, _addr, _val) (stw_be_dma(&(_dev)->as, (_addr), (_val)))
-#define vio_stl(_dev, _addr, _val) (stl_be_dma(&(_dev)->as, (_addr), (_val)))
-#define vio_stq(_dev, _addr, _val) (stq_be_dma(&(_dev)->as, (_addr), (_val)))
+#define vio_stb(_dev, _addr, _val) \
+        (stb_dma(&(_dev)->as, (_addr), (_val), MEMTXATTRS_UNSPECIFIED))
+#define vio_sth(_dev, _addr, _val) \
+        (stw_be_dma(&(_dev)->as, (_addr), (_val), MEMTXATTRS_UNSPECIFIED))
+#define vio_stl(_dev, _addr, _val) \
+        (stl_be_dma(&(_dev)->as, (_addr), (_val), MEMTXATTRS_UNSPECIFIED))
+#define vio_stq(_dev, _addr, _val) \
+        (stq_be_dma(&(_dev)->as, (_addr), (_val), MEMTXATTRS_UNSPECIFIED))
 #define vio_ldq(_dev, _addr) (ldq_be_dma(&(_dev)->as, (_addr)))
 
 int spapr_vio_send_crq(SpaprVioDevice *dev, uint8_t *crq);
diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index d11c1d794f9..ebbc0501681 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -249,10 +249,11 @@ static inline void dma_memory_unmap(AddressSpace *as,
     }                                                                   \
     static inline void st##_sname##_##_end##_dma(AddressSpace *as,      \
                                                  dma_addr_t addr,       \
-                                                 uint##_bits##_t val)   \
+                                                 uint##_bits##_t val,   \
+                                                 MemTxAttrs attrs)      \
     {                                                                   \
         val = cpu_to_##_end##_bits(val);                                \
-        dma_memory_write(as, addr, &val, (_bits) / 8, MEMTXATTRS_UNSPECIFIED); \
+        dma_memory_write(as, addr, &val, (_bits) / 8, attrs); \
     }
 
 static inline uint8_t ldub_dma(AddressSpace *as, dma_addr_t addr)
@@ -263,9 +264,10 @@ static inline uint8_t ldub_dma(AddressSpace *as, dma_addr_t addr)
     return val;
 }
 
-static inline void stb_dma(AddressSpace *as, dma_addr_t addr, uint8_t val)
+static inline void stb_dma(AddressSpace *as, dma_addr_t addr,
+                           uint8_t val, MemTxAttrs attrs)
 {
-    dma_memory_write(as, addr, &val, 1, MEMTXATTRS_UNSPECIFIED);
+    dma_memory_write(as, addr, &val, 1, attrs);
 }
 
 DEFINE_LDST_DMA(uw, w, 16, le);
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 9b91b15cb08..e5f3c981841 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -360,7 +360,7 @@ static void fw_cfg_dma_transfer(FWCfgState *s)
     if (dma_memory_read(s->dma_as, dma_addr,
                         &dma, sizeof(dma), MEMTXATTRS_UNSPECIFIED)) {
         stl_be_dma(s->dma_as, dma_addr + offsetof(FWCfgDmaAccess, control),
-                   FW_CFG_DMA_CTL_ERROR);
+                   FW_CFG_DMA_CTL_ERROR, MEMTXATTRS_UNSPECIFIED);
         return;
     }
 
@@ -446,7 +446,7 @@ static void fw_cfg_dma_transfer(FWCfgState *s)
     }
 
     stl_be_dma(s->dma_as, dma_addr + offsetof(FWCfgDmaAccess, control),
-                dma.control);
+                dma.control, MEMTXATTRS_UNSPECIFIED);
 
     trace_fw_cfg_read(s, 0);
 }
-- 
2.33.1


