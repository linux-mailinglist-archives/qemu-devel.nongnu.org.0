Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E40F56BAA0
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 15:28:31 +0200 (CEST)
Received: from localhost ([::1]:55784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9o21-0005v8-VX
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 09:28:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9nzE-0002y7-ED; Fri, 08 Jul 2022 09:25:37 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f]:43603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9nzB-00071j-1u; Fri, 08 Jul 2022 09:25:34 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-fe023ab520so29197013fac.10; 
 Fri, 08 Jul 2022 06:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yQl8V2bz3D3odLkebRtZgHTm6lOO/ewYUlY+Tm4ynBE=;
 b=j9L6jviUb8ANpLwYWwmoGLG6sM512XRfZKWad7tBdUjUBQ7MgSSb2xp+L8m/4pO4Ds
 gs9+sXyCtc2ik/CpRi2LFEvBGDJECGDT/9zvxVxRVxlhLLHElftBzkmK3HPp4b7j5nhV
 AUC3Qoe+w5dYFXjExdV4CqMV8yQLspjDBK+GfYtqsVNQ2p69+5d1xoazzZZfz1Q8WQtQ
 Ik8tcuLxuQimlTjf2Ua4f4KEOORAdF4z+m2eUybmAYYlNM+p7RD6XuLivxeU5nXlM+Sw
 vWkMztXx01mmvIcccgBXlw6fUOlrpAQWqiqo2DJKp2zup559Y5RW3WERzdgrTcPN170o
 5ERQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yQl8V2bz3D3odLkebRtZgHTm6lOO/ewYUlY+Tm4ynBE=;
 b=xIXUPsI7ZxapQYyfi2pe3SFWRFm28Yj4iKTrtylVO1K3GPZKa9xVlcbJg7vGL4xl2G
 YYsM0qqG7fyHtkTelLygRaS9bAbmMhn6hxoOmXDD4KUsDwbWXF+djL0TiZOadOQKnEOU
 9+GO73YYIoZWDkGzEyc96yw6XPdVFlCt58x7nGmjNz4dF4wMiRgQtljCqwvgmuui3Jub
 W4FKKPbzAaDEd2nqe/DZnZsd9m8v/uebk0EjjGiqsP84aHjD87482C3k+h7TWcVY1NhZ
 mOHiImrNVbeG4RmKqaQrXcUB3X7fg5BqUxb/EESn9Etvo+ABYpj5uei5sTV4w/lRy0sX
 FYKQ==
X-Gm-Message-State: AJIora9h4FxOihbKG2XpWiAidl3w7ya4LZYgJq2rh1eJ4UUTBCqE8EKX
 d+Rrz7vsfHJD6Wj26uvE+u+q0Yw3nSM=
X-Google-Smtp-Source: AGRyM1vesJrfe9pT9R8MkzRazHhoBiy3FpNFqv3znaVgkDfG2fIb+Z4xNihoLOZZiY6Wc0sraRJ/nw==
X-Received: by 2002:a05:6870:960a:b0:10a:9ebc:70fc with SMTP id
 d10-20020a056870960a00b0010a9ebc70fcmr6227081oaq.205.1657286731465; 
 Fri, 08 Jul 2022 06:25:31 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 f108-20020a9d03f5000000b0060c00c3fde5sm18435797otf.72.2022.07.08.06.25.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 06:25:31 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH 02/10] ppc/pnv: add phb-id/chip-id PnvPHB4RootBus properties
Date: Fri,  8 Jul 2022 10:25:14 -0300
Message-Id: <20220708132522.581382-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708132522.581382-1-danielhb413@gmail.com>
References: <20220708132522.581382-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2f.google.com
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

The same rationale provided in the PHB3 bus case applies here.

Note: we could have merged both buses in a single object, like we did
with the root ports, and spare some boilerplate. The reason we opted to
preserve both buses objects is twofold:

- there's not user side advantage in doing so. Unifying the root ports
presents a clear user QOL change when we enable user created devices back.
The buses objects, aside from having a different QOM name, is transparent
to the user;

- we leave a door opened in case we want to increase the root port limit
for phb4/5 later on without having to deal with phb3 code.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c         | 51 ++++++++++++++++++++++++++++++++++
 include/hw/pci-host/pnv_phb4.h | 10 +++++++
 2 files changed, 61 insertions(+)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index fefdd3ad89..b4f750bf6d 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1567,6 +1567,12 @@ void pnv_phb4_bus_init(DeviceState *dev, PnvPHB4 *phb)
                                      pnv_phb4_set_irq, pnv_phb4_map_irq, phb,
                                      &phb->pci_mmio, &phb->pci_io,
                                      0, 4, TYPE_PNV_PHB4_ROOT_BUS);
+
+    object_property_set_int(OBJECT(pci->bus), "phb-id", phb->phb_id,
+                            &error_abort);
+    object_property_set_int(OBJECT(pci->bus), "chip-id", phb->chip_id,
+                            &error_abort);
+
     pci_setup_iommu(pci->bus, pnv_phb4_dma_iommu, phb);
     pci->bus->flags |= PCI_BUS_EXTENDED_CONFIG_SPACE;
 }
@@ -1724,10 +1730,55 @@ static const TypeInfo pnv_phb5_type_info = {
     .instance_size = sizeof(PnvPHB4),
 };
 
+static void pnv_phb4_root_bus_get_prop(Object *obj, Visitor *v,
+                                       const char *name,
+                                       void *opaque, Error **errp)
+{
+    PnvPHB4RootBus *bus = PNV_PHB4_ROOT_BUS(obj);
+    uint64_t value = 0;
+
+    if (strcmp(name, "phb-id") == 0) {
+        value = bus->phb_id;
+    } else {
+        value = bus->chip_id;
+    }
+
+    visit_type_size(v, name, &value, errp);
+}
+
+static void pnv_phb4_root_bus_set_prop(Object *obj, Visitor *v,
+                                       const char *name,
+                                       void *opaque, Error **errp)
+
+{
+    PnvPHB4RootBus *bus = PNV_PHB4_ROOT_BUS(obj);
+    uint64_t value;
+
+    if (!visit_type_size(v, name, &value, errp)) {
+        return;
+    }
+
+    if (strcmp(name, "phb-id") == 0) {
+        bus->phb_id = value;
+    } else {
+        bus->chip_id = value;
+    }
+}
+
 static void pnv_phb4_root_bus_class_init(ObjectClass *klass, void *data)
 {
     BusClass *k = BUS_CLASS(klass);
 
+    object_class_property_add(klass, "phb-id", "int",
+                              pnv_phb4_root_bus_get_prop,
+                              pnv_phb4_root_bus_set_prop,
+                              NULL, NULL);
+
+    object_class_property_add(klass, "chip-id", "int",
+                              pnv_phb4_root_bus_get_prop,
+                              pnv_phb4_root_bus_set_prop,
+                              NULL, NULL);
+
     /*
      * PHB4 has only a single root complex. Enforce the limit on the
      * parent bus
diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index 20aa4819d3..50d4faa001 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -45,7 +45,17 @@ typedef struct PnvPhb4DMASpace {
     QLIST_ENTRY(PnvPhb4DMASpace) list;
 } PnvPhb4DMASpace;
 
+/*
+ * PHB4 PCIe Root Bus
+ */
 #define TYPE_PNV_PHB4_ROOT_BUS "pnv-phb4-root"
+struct PnvPHB4RootBus {
+    PCIBus parent;
+
+    uint32_t chip_id;
+    uint32_t phb_id;
+};
+OBJECT_DECLARE_SIMPLE_TYPE(PnvPHB4RootBus, PNV_PHB4_ROOT_BUS)
 
 /*
  * PHB4 PCIe Host Bridge for PowerNV machines (POWER9)
-- 
2.36.1


