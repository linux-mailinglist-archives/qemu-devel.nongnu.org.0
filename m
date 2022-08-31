Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B015A8665
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 21:05:08 +0200 (CEST)
Received: from localhost ([::1]:54760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTT1J-00039S-Jk
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 15:05:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSnz-0002QF-Ii; Wed, 31 Aug 2022 14:51:15 -0400
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a]:35751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSnx-00080r-Qt; Wed, 31 Aug 2022 14:51:15 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-1225219ee46so1578321fac.2; 
 Wed, 31 Aug 2022 11:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=uoSuBMqd1OGd0FwTQOZvoXW2+dc1ZMYoev8zA16lDfc=;
 b=aHkQmz3cR/Gy4rZOfOZhXiQu7Lh+C0ji/ySwpdMMSY3aCU1lcqyyLNgca/L6mJcO4p
 Bwn0Cw5jV/G47wqN/eqO71a0aptJDj7p8w0GUIK5pxVn7co+H634GDcLPbXVC5E3RoNm
 9nh06hT3lp24V8IcDIVzfuGXgDacVFm5GO8Y4a3wLlG9/kL/RVqO2XRzHPAlpu90F+c1
 6J4me+AGCO/x8o/4ajGMe+Mxr+JRJyppODJb7+D/ScWkk4LDiUtJH8sw3JrJ2018SQgj
 HAigC5UWXExA4WY1qsi0fpzPmHTEtP3/14vXMSkp5kx8WgXiOVLoVZT5g/D9rvR8l4XD
 cQWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=uoSuBMqd1OGd0FwTQOZvoXW2+dc1ZMYoev8zA16lDfc=;
 b=xhybpXqeABtzZ9pUKsr6Q5etoMu4UAsyAh56DOplK/Pt0p5sxI4GjnkRZF6RyoXxrY
 EDvJrKWey4eJ5O/TlXvH9Queqtal6kpV90oM57ccYp7EDfa76aiINotVs3IkSnATiT/d
 o7FrEzxzon+K1JOed11T6yMyuDurVW6P+XiwrgjIjRoE6OvdtY75suKWhOULvalY/Kxx
 ackDNZAQH9e3O7fsvIk8QQqZlpGrmRgVRQy9JPKb1K3gPpBbEAV++sOGos5VIIXu1ayf
 nN2xOUPVpVYdLHh8YKh2BDUvQ6jdACb2nwIS9prGB3LXVofDuxKe6+lWf/mZx2gcntpv
 WvBQ==
X-Gm-Message-State: ACgBeo32kChKxNRrSP6y8iuUwIDnryL0XyG+tkYIy4F548Cu9bGRIdzT
 gVF+r97dbQopElnS7xRgUNTTVaIbyQk=
X-Google-Smtp-Source: AA6agR4XmHrf4EfPbfRygSKvZvAF/e0u5WXdsNRl6P6opaXPNI7Er9Mqp2ThAVtEJv6Z6dkkUnIntw==
X-Received: by 2002:a05:6808:158e:b0:343:75de:38e4 with SMTP id
 t14-20020a056808158e00b0034375de38e4mr1917056oiw.123.1661971872078; 
 Wed, 31 Aug 2022 11:51:12 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a9d4544000000b0061cbd18bd18sm9599927oti.45.2022.08.31.11.51.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 11:51:11 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Frederic Barrat <fbarrat@linux.ibm.com>
Subject: [PULL 09/60] ppc/pnv: add PHB4 bus init helper
Date: Wed, 31 Aug 2022 15:49:43 -0300
Message-Id: <20220831185034.23240-10-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831185034.23240-1-danielhb413@gmail.com>
References: <20220831185034.23240-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2a.google.com
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
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
Message-Id: <20220624084921.399219-5-danielhb413@gmail.com>
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
index 67ddde4a6e..a7425927fb 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1528,30 +1528,16 @@ static void pnv_phb4_instance_init(Object *obj)
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
@@ -1561,12 +1547,33 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
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
2.37.2


