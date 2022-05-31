Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C997653994F
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 00:03:42 +0200 (CEST)
Received: from localhost ([::1]:55782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw9xl-0004Hg-Uh
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 18:03:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nw9kD-0000ou-GT; Tue, 31 May 2022 17:49:41 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30]:43154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nw9kB-0003Lv-MC; Tue, 31 May 2022 17:49:41 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-f2bb84f9edso175426fac.10; 
 Tue, 31 May 2022 14:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EiH66L0+0N9gdm7IQoqKOa4YJRGGv3gQuLMWSbPdw40=;
 b=iVjnf3swm1pMD5Yc+EpMglcT+pwtDfJmQ0RV1ZewD5qTVGYZpkJT+2HDiL4zZ/bGoa
 IJIK2NOy0h1add14mtNR/4kAYFRA5bRF4yMIxu9Ebs1e4tRtphyYgm5hrra19KCq+kdA
 ZCG3VP01pkKxwhDDMzyjYDqreil1+rk9PsR2ZOo5vu9TyNDHCfvtaFzX1nYWDKRdQboA
 qVTj4mGP8aKzWvMsZ3cXelk0JRd3RWtGzeAnmq5xyDFqEFBMxsDSrSTonBEqTB7RtteV
 K5XHwO85qU3NuF9eFrNFtzGIh1+/aROflmez0L4WXqOPgNEflsSOVyGY5q9HMjAYSGNY
 97/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EiH66L0+0N9gdm7IQoqKOa4YJRGGv3gQuLMWSbPdw40=;
 b=QRAubwGC9VGB+wf86lehSCAGgBT06E3XeF2AaNEnAeDscvYUY629yywyjtuh1FTHZD
 9Bp+BVwV8hab7J753YgCMGQrqummZinSJ/uYVMZtdurVltUY0aWj2fx9wWiLeXYLH1oW
 W87xxae1VFl/rv9Xfs/UeuZ7BUst6eMbvQNxcdGDZVoX4UsxCnAhpbfvYxhUS7Bt6HZi
 BNEmooIjKXpILewp2kyOsF8Iwx1wItNfW23wwhyBoCMQjt/2Ix7z5fsGGkaK/EZZ+2ju
 LSdxHJgACOQ5lql/rtNDFOLWgkZ7kVv6BChBsJhXqrqHe76AYKzmKmO20JD7iSzav3LE
 yAIQ==
X-Gm-Message-State: AOAM533CwsK1AiHbzhWejUGxTQgngYh5+p5gwmbtjQ+viJ+VYsQqhaRt
 VrGY8pSFrYp9svADir+xkup5G09w0VduCg==
X-Google-Smtp-Source: ABdhPJwGyc7jjJBrN7+FbySyHxLTMZNMRDIzE0APhUlc2TG2t/pfMHcjAsjLwh0SwwfCe8ywsTaQbA==
X-Received: by 2002:a05:6871:782:b0:e9:6563:e477 with SMTP id
 o2-20020a056871078200b000e96563e477mr14890638oap.62.1654033777935; 
 Tue, 31 May 2022 14:49:37 -0700 (PDT)
Received: from balboa.COMFAST ([152.250.93.219])
 by smtp.gmail.com with ESMTPSA id
 pd19-20020a0568701f1300b000f333ac991fsm3476988oab.27.2022.05.31.14.49.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 14:49:37 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 mark.cave-ayland@ilande.co.uk, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v2 06/16] ppc/pnv: add PHB4 bus init helper
Date: Tue, 31 May 2022 18:49:07 -0300
Message-Id: <20220531214917.31668-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220531214917.31668-1-danielhb413@gmail.com>
References: <20220531214917.31668-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x30.google.com
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
 hw/pci-host/pnv_phb4.c         | 34 ++++++++++++++++++++--------------
 include/hw/pci-host/pnv_phb4.h |  1 +
 3 files changed, 23 insertions(+), 14 deletions(-)

diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index 17532d25f0..321c4e768a 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -70,6 +70,8 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
 
     if (phb->version == 3) {
         pnv_phb3_bus_init(dev, (PnvPHB3 *)phb->backend);
+    } else {
+        pnv_phb4_bus_init(dev, (PnvPHB4 *)phb->backend);
     }
 
     if (defaults_enabled()) {
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 13ba9e45d8..ae5494fe72 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1544,29 +1544,16 @@ static void pnv_phb4_instance_init(Object *obj)
     object_initialize_child(obj, "source", &phb->xsrc, TYPE_XIVE_SOURCE);
 }
 
-static void pnv_phb4_realize(DeviceState *dev, Error **errp)
+void pnv_phb4_bus_init(DeviceState *dev, PnvPHB4 *phb)
 {
-    PnvPHB4 *phb = PNV_PHB4(dev);
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
@@ -1582,6 +1569,25 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
                                      0, 4, TYPE_PNV_PHB4_ROOT_BUS);
     pci_setup_iommu(pci->bus, pnv_phb4_dma_iommu, phb);
     pci->bus->flags |= PCI_BUS_EXTENDED_CONFIG_SPACE;
+}
+
+static void pnv_phb4_realize(DeviceState *dev, Error **errp)
+{
+    PnvPHB4 *phb = PNV_PHB4(dev);
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
 
     /* Setup XIVE Source */
     if (phb->big_phb) {
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


