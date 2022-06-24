Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5D955961E
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 11:11:19 +0200 (CEST)
Received: from localhost ([::1]:57818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4fLS-0001wQ-5t
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 05:11:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o4f0U-0002B2-PF; Fri, 24 Jun 2022 04:49:39 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33]:33467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o4f0T-0000BX-82; Fri, 24 Jun 2022 04:49:38 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-101d2e81bceso2986825fac.0; 
 Fri, 24 Jun 2022 01:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k1118aqIDK4+wnA56K//gAuLeksigFEboBrZ/NJNrA4=;
 b=IshpOc5mxpmYTG6kiaB3Syz+5zZYOfl2pY+d4rYu6+QmJbOIIH/eqCnpz9JjB+0atO
 Nf0yoNVG/nF9Zn6HfupAOx3BkRNCcdrUjkEWMVevyo71guo7O4wJwd2OhC8wYl6Bu+vV
 bJ4cqIHs2diPoCbfLqjlqSe/s3CEFt6qw8+bWpNKZPf14b4YtuleZzcuoL8iCPR7hW/J
 yrcgcDfI6VaD+GXP416VMIqd0J4lBz+nT9CJa3wU0KPmso2Zrus5vgjtqLpWQD6gv+LP
 PotiN0E+UBs69x/SnjdyoiHXK1X0VOe5WRAbIBCAdpgCBujzog/LHEnLyscIBDV1W5YU
 /Fvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k1118aqIDK4+wnA56K//gAuLeksigFEboBrZ/NJNrA4=;
 b=7ppKvJSBWuMS/3cxAInqgsqcHFeBlGIfAWNowlCC1ILSGTIHfv/cTffPj+oZ/M4WYx
 Eow3lc04s4O5+zD5dAC9zHPN7qYCx+c6nRztJH/mtfxfKf8NmGQP2iZhaAvwQJz5RPZe
 twE4oM7QUknWlLGq+tefHYDBXmiv/T7qyL33r3avn7+rdRMXzo2CdcUdbwf5uIFrcDYI
 acblx0tcPWmDyCs5b2UudUTSxXdFjK0V8rIxZS1HgKRrzYbm2MrCb/OUleLvBoqDgFa/
 iusQJXUV2dpu+Ofh81Zp96zeNxM7B3YO+w+15N7BKIaz2XOH1OJfBa2CEk0z3UW8PZ5d
 tSNQ==
X-Gm-Message-State: AJIora83q5d0j/3JO2C4OibgNKOh2BXBoqOzZGyWVNz7VJNYfY/yNib0
 I38RhSynqEpVCFr6lsCYBSx6xC1EUGw=
X-Google-Smtp-Source: AGRyM1sZqv6j7znWxD1WXLyVCGk2S1kJI5yvhK6A5ZANYpJPrZEwrYER1CDe+07mi/NWmo7uN73PAQ==
X-Received: by 2002:a05:6870:95a9:b0:101:fa11:2e51 with SMTP id
 k41-20020a05687095a900b00101fa112e51mr1343426oao.56.1656060575321; 
 Fri, 24 Jun 2022 01:49:35 -0700 (PDT)
Received: from balboa.ibmmodules.com ([191.193.1.105])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a056830230800b0061698ef90e5sm1192768ote.31.2022.06.24.01.49.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 01:49:35 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v3 04/12] ppc/pnv: add PHB4 bus init helper
Date: Fri, 24 Jun 2022 05:49:13 -0300
Message-Id: <20220624084921.399219-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220624084921.399219-1-danielhb413@gmail.com>
References: <20220624084921.399219-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x33.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Similar to what we already did for the PnvPHB3 device, let's add a
helper to init the bus when using a PnvPHB4. This helper will be used by
PnvPHb when PnvPHB4 turns into a backend.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb.c          |  2 ++
 hw/pci-host/pnv_phb4.c         | 39 ++++++++++++++++++++--------------
 include/hw/pci-host/pnv_phb4.h |  1 +
 3 files changed, 26 insertions(+), 16 deletions(-)

diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index 6fefff7d44..abcbcca445 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -69,6 +69,8 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
 
     if (phb->version == 3) {
         pnv_phb3_bus_init(dev, PNV_PHB3(phb->backend));
+    } else {
+        pnv_phb4_bus_init(dev, PNV_PHB4(phb->backend));
     }
 
     pnv_phb_attach_root_port(pci, phb_rootport_typename,
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index d225ab5b0f..a7a4519f30 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1544,30 +1544,16 @@ static void pnv_phb4_instance_init(Object *obj)
     object_initialize_child(obj, "source", &phb->xsrc, TYPE_XIVE_SOURCE);
 }
 
-static void pnv_phb4_realize(DeviceState *dev, Error **errp)
+void pnv_phb4_bus_init(DeviceState *dev, PnvPHB4 *phb)
 {
-    PnvPHB4 *phb = PNV_PHB4(dev);
-    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(phb->pec);
     PCIHostState *pci = PCI_HOST_BRIDGE(dev);
-    XiveSource *xsrc = &phb->xsrc;
-    int nr_irqs;
     char name[32];
 
-    /* Set the "big_phb" flag */
-    phb->big_phb = phb->phb_id == 0 || phb->phb_id == 3;
-
-    /* Controller Registers */
-    snprintf(name, sizeof(name), "phb4-%d.%d-regs", phb->chip_id,
-             phb->phb_id);
-    memory_region_init_io(&phb->mr_regs, OBJECT(phb), &pnv_phb4_reg_ops, phb,
-                          name, 0x2000);
-
     /*
      * PHB4 doesn't support IO space. However, qemu gets very upset if
      * we don't have an IO region to anchor IO BARs onto so we just
      * initialize one which we never hook up to anything
      */
-
     snprintf(name, sizeof(name), "phb4-%d.%d-pci-io", phb->chip_id,
              phb->phb_id);
     memory_region_init(&phb->pci_io, OBJECT(phb), name, 0x10000);
@@ -1577,12 +1563,33 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
     memory_region_init(&phb->pci_mmio, OBJECT(phb), name,
                        PCI_MMIO_TOTAL_SIZE);
 
-    pci->bus = pci_register_root_bus(dev, dev->id,
+    pci->bus = pci_register_root_bus(dev, dev->id ? dev->id : NULL,
                                      pnv_phb4_set_irq, pnv_phb4_map_irq, phb,
                                      &phb->pci_mmio, &phb->pci_io,
                                      0, 4, TYPE_PNV_PHB4_ROOT_BUS);
     pci_setup_iommu(pci->bus, pnv_phb4_dma_iommu, phb);
     pci->bus->flags |= PCI_BUS_EXTENDED_CONFIG_SPACE;
+}
+
+static void pnv_phb4_realize(DeviceState *dev, Error **errp)
+{
+    PnvPHB4 *phb = PNV_PHB4(dev);
+    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(phb->pec);
+    PCIHostState *pci = PCI_HOST_BRIDGE(dev);
+    XiveSource *xsrc = &phb->xsrc;
+    int nr_irqs;
+    char name[32];
+
+    /* Set the "big_phb" flag */
+    phb->big_phb = phb->phb_id == 0 || phb->phb_id == 3;
+
+    /* Controller Registers */
+    snprintf(name, sizeof(name), "phb4-%d.%d-regs", phb->chip_id,
+             phb->phb_id);
+    memory_region_init_io(&phb->mr_regs, OBJECT(phb), &pnv_phb4_reg_ops, phb,
+                          name, 0x2000);
+
+    pnv_phb4_bus_init(dev, phb);
 
     /* Add a single Root port if running with defaults */
     pnv_phb_attach_root_port(pci, pecc->rp_model,
diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index 19dcbd6f87..90843ac3a9 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -157,6 +157,7 @@ struct PnvPHB4 {
 
 void pnv_phb4_pic_print_info(PnvPHB4 *phb, Monitor *mon);
 int pnv_phb4_pec_get_phb_id(PnvPhb4PecState *pec, int stack_index);
+void pnv_phb4_bus_init(DeviceState *dev, PnvPHB4 *phb);
 extern const MemoryRegionOps pnv_phb4_xscom_ops;
 
 /*
-- 
2.36.1


