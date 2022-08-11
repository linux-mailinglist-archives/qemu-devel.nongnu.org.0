Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3B2590415
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 18:42:50 +0200 (CEST)
Received: from localhost ([::1]:37964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMBGi-0006Wg-7Y
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 12:42:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oMBE1-0001Dw-RR; Thu, 11 Aug 2022 12:40:01 -0400
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d]:44738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oMBDz-0003V9-7e; Thu, 11 Aug 2022 12:40:01 -0400
Received: by mail-vk1-xa2d.google.com with SMTP id j11so4392432vkk.11;
 Thu, 11 Aug 2022 09:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=0KSqmnjISPdzB3lY+7VCeZqYcNoi08fni4asYVSgZRg=;
 b=mzmYjoyjb8AZnm1XTdfYZA8LvQ3yI/pLBSB9bfSAg3VkVmOh17iXEwUqvNuYBqs/nx
 Qh7PN5eGDXP5Y2tKHSj12PqpiuG7fZNmmdtFC/b9pmaVzumc4649v2FQs2gswV3koIWw
 O9nLaRy4umEJtXj1qEjBzU4yQr8njyIYVebywMPaVfosy7ntXbwWJ89gGCcnZLIxrbiu
 AXPW72wctnHJz5Hq3hUfuBWy2lAh48ml7v50zQNEQxTXrhAkvFiAU2VOSHHDGKCo1ell
 7bCD38mWMfslVvDlWI8j2U13sXRaIr1W81x+XjkdF/nKUgyyRk9YWxdIkITAb8DR9y64
 Oi5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=0KSqmnjISPdzB3lY+7VCeZqYcNoi08fni4asYVSgZRg=;
 b=CbSix9XpMlfcAvLmAOoFwbtsbHfJtvmp3Jt4Vl3TtokYDpIkp/7eQRgsEbXnquDJ2k
 5M8ZaQ7dqxW1eyYPiAQlJ+cXfU4muNXszLKoULPeqvweQ+Gpq/yTCPN9L8hpwFS7SlZD
 H0jdWxOZ4IEi9G228AtwkOEr42PWhzrdVDL0gR9+ebHOVEU/B/QKiI9egXeqsO9yl4ZO
 ZcM0wLvJJ+voTFirUdOQQIK2nX/wPYxdYQ+SziKTe88Rw8tSI2ycSpLwhH7mCw8BJeIW
 H5LGDiSsXbYXe7Cm+yI9l7PjUaDKRVnkei8/g0rAl97OoWT1I0RmZLccfSu6uiU8eFtf
 LG3g==
X-Gm-Message-State: ACgBeo0PrvwlKjUjo4X553w77PbN1QBdgWxGQ9D+NeVIT8/syacGhCcf
 x/LNbjOzhpph4vSxcTaSSkB/UI+vpTs=
X-Google-Smtp-Source: AA6agR5mNrA185J+vfwIT27d9gAP3ELOw5ZU6g5hPLezbRmfEw4HcGKwOVcE3d/ENix+oQzHK+WNHQ==
X-Received: by 2002:a1f:9152:0:b0:378:f39b:29ae with SMTP id
 t79-20020a1f9152000000b00378f39b29aemr8767997vkd.39.1660235997846; 
 Thu, 11 Aug 2022 09:39:57 -0700 (PDT)
Received: from balboa.COMFAST (201-43-216-47.dsl.telesp.net.br.
 [201.43.216.47]) by smtp.gmail.com with ESMTPSA id
 j9-20020a67fa49000000b00373d697e3e2sm1755013vsq.19.2022.08.11.09.39.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 09:39:57 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 v4 01/11] ppc/pnv: add phb-id/chip-id PnvPHB3RootBus
 properties
Date: Thu, 11 Aug 2022 13:39:40 -0300
Message-Id: <20220811163950.578927-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220811163950.578927-1-danielhb413@gmail.com>
References: <20220811163950.578927-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2d;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa2d.google.com
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

We rely on the phb-id and chip-id, which are PHB properties, to assign
chassis and slot to the root port. For default devices this is no big
deal: the root port is being created under pnv_phb_realize() and the
values are being passed on via the 'index' and 'chip-id' of the
pnv_phb_attach_root_port() helper.

If we want to implement user created root ports we have a problem. The
user created root port will not be aware of which PHB it belongs to,
unless we're willing to violate QOM best practices and access the PHB
via dev->parent_bus->parent. What we can do is to access the root bus
parent bus.

Since we're already assigning the root port as QOM child of the bus, and
the bus is initiated using PHB properties, let's add phb-id and chip-id
as properties of the bus. This will allow us trivial access to them, for
both user-created and default root ports, without doing anything too
shady with QOM.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb3.c         | 50 ++++++++++++++++++++++++++++++++++
 include/hw/pci-host/pnv_phb3.h |  9 +++++-
 2 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index d4c04a281a..af8575c007 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -1006,6 +1006,11 @@ void pnv_phb3_bus_init(DeviceState *dev, PnvPHB3 *phb)
                                      &phb->pci_mmio, &phb->pci_io,
                                      0, 4, TYPE_PNV_PHB3_ROOT_BUS);
 
+    object_property_set_int(OBJECT(pci->bus), "phb-id", phb->phb_id,
+                            &error_abort);
+    object_property_set_int(OBJECT(pci->bus), "chip-id", phb->chip_id,
+                            &error_abort);
+
     pci_setup_iommu(pci->bus, pnv_phb3_dma_iommu, phb);
 }
 
@@ -1105,10 +1110,55 @@ static const TypeInfo pnv_phb3_type_info = {
     .instance_init = pnv_phb3_instance_init,
 };
 
+static void pnv_phb3_root_bus_get_prop(Object *obj, Visitor *v,
+                                       const char *name,
+                                       void *opaque, Error **errp)
+{
+    PnvPHB3RootBus *bus = PNV_PHB3_ROOT_BUS(obj);
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
+static void pnv_phb3_root_bus_set_prop(Object *obj, Visitor *v,
+                                       const char *name,
+                                       void *opaque, Error **errp)
+
+{
+    PnvPHB3RootBus *bus = PNV_PHB3_ROOT_BUS(obj);
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
 static void pnv_phb3_root_bus_class_init(ObjectClass *klass, void *data)
 {
     BusClass *k = BUS_CLASS(klass);
 
+    object_class_property_add(klass, "phb-id", "int",
+                              pnv_phb3_root_bus_get_prop,
+                              pnv_phb3_root_bus_set_prop,
+                              NULL, NULL);
+
+    object_class_property_add(klass, "chip-id", "int",
+                              pnv_phb3_root_bus_get_prop,
+                              pnv_phb3_root_bus_set_prop,
+                              NULL, NULL);
+
     /*
      * PHB3 has only a single root complex. Enforce the limit on the
      * parent bus
diff --git a/include/hw/pci-host/pnv_phb3.h b/include/hw/pci-host/pnv_phb3.h
index bff69201d9..4854f6d2f6 100644
--- a/include/hw/pci-host/pnv_phb3.h
+++ b/include/hw/pci-host/pnv_phb3.h
@@ -104,9 +104,16 @@ struct PnvPBCQState {
 };
 
 /*
- * PHB3 PCIe Root port
+ * PHB3 PCIe Root Bus
  */
 #define TYPE_PNV_PHB3_ROOT_BUS "pnv-phb3-root"
+struct PnvPHB3RootBus {
+    PCIBus parent;
+
+    uint32_t chip_id;
+    uint32_t phb_id;
+};
+OBJECT_DECLARE_SIMPLE_TYPE(PnvPHB3RootBus, PNV_PHB3_ROOT_BUS)
 
 /*
  * PHB3 PCIe Host Bridge for PowerNV machines (POWER8)
-- 
2.36.1


