Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98578588DEB
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 15:52:46 +0200 (CEST)
Received: from localhost ([::1]:46722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJEnl-0002yx-K8
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 09:52:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJEge-000326-PM; Wed, 03 Aug 2022 09:45:24 -0400
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930]:36660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJEgb-0004nR-KU; Wed, 03 Aug 2022 09:45:24 -0400
Received: by mail-ua1-x930.google.com with SMTP id t21so7007202uaq.3;
 Wed, 03 Aug 2022 06:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=xJSujRe9KPKcOXqPKHGimEDQ3GL9KOFAdkERdT1RlBY=;
 b=Izio7fFz8BLOcpClWRXtMLsn6f7Ef+XOzXzPD8enLvx/AvsAPYxYDkyn8XeA4OYrSs
 3zw9hihcASsdW8MDonaPqScnQd+8uKhvy3byFDVhZO42F3cZRo68VuKhXBh3lOXZ+3tN
 aBSGygGIBQQxegC3UyVbsJaTIfYhaFLhUklCdNQjwHMbr8thKCv16WFvKXkNt8x2WoXR
 4LmbTPV2DC+jrWnHa464F7W+JtRISrJzar682cGWay2YqBoauE2/ndCQszQuHY7zKNvY
 3VFiT0tHK0/eaectKXhalg94AN5Trhvgdo5tqLNCutHL22IZnHE4bdpOYMUv+upqAQFx
 QYow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=xJSujRe9KPKcOXqPKHGimEDQ3GL9KOFAdkERdT1RlBY=;
 b=XHEToniJWYEa1Rt6Q5jSq1qorHs2gOVl1ANqc8+iXk8Z1MRFf0u1xlUYNvKjvnFdA1
 SulrZHlj9TQMPsWK47K23LWtZFopfI0+7wZtXszagDdUB9xshWrcX1hH/oPP0krIB2hG
 2E9fRxQOuFvELKOakCFrNGd84XzWTx6vEGLzdy169kDxgnENc3AsGWs2cfSjYLdkVYel
 nnmhQrOC22GnjGSj5B+0z1sKemSydZVlJfQkUn5Svd/KSGbQP4Ijpy+o+1vXI3KWsPwT
 cbe1Uj0PkwyUKho5N5z0WxpHxVWFUE3fOooHkO8jjAcbVoaX2DKByN/4JOjnCi3Woyxv
 zpqw==
X-Gm-Message-State: ACgBeo0gdvxfF0puEewTFC2E3Bs881bn2hqiG9TxqlEDEdrEDSdKpJe5
 guhMx4rT30x8tliGOVDeNoqIg94fqOk=
X-Google-Smtp-Source: AA6agR4+ohX/Es7jfSuvVYCZpx+fz6QPRYCNqNs9yAputT1ApZZTo26x9m0Z5o8sSKFCwshHJIA+9A==
X-Received: by 2002:a9f:3223:0:b0:387:3b44:f9d3 with SMTP id
 x32-20020a9f3223000000b003873b44f9d3mr8984577uad.0.1659534311031; 
 Wed, 03 Aug 2022 06:45:11 -0700 (PDT)
Received: from balboa.ibmmodules.com ([2804:431:c7c7:52e2:fb25:323c:5709:7237])
 by smtp.gmail.com with ESMTPSA id
 q201-20020a1f2ad2000000b00377fba67271sm932420vkq.34.2022.08.03.06.45.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 06:45:10 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, Frederic Barrat <fbarrat@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 02/10] ppc/pnv: add phb-id/chip-id PnvPHB4RootBus
 properties
Date: Wed,  3 Aug 2022 10:44:51 -0300
Message-Id: <20220803134459.2633902-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220803134459.2633902-1-danielhb413@gmail.com>
References: <20220803134459.2633902-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::930;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x930.google.com
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
index b98c394713..824e1a73fb 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1551,6 +1551,12 @@ void pnv_phb4_bus_init(DeviceState *dev, PnvPHB4 *phb)
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
@@ -1708,10 +1714,55 @@ static const TypeInfo pnv_phb5_type_info = {
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


