Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D770A5A86B4
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 21:25:04 +0200 (CEST)
Received: from localhost ([::1]:32966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTTKi-0001aI-1c
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 15:25:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSoO-0003Cf-9w; Wed, 31 Aug 2022 14:51:42 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32]:46815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSoM-0007yo-Js; Wed, 31 Aug 2022 14:51:40 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-11f4e634072so12018835fac.13; 
 Wed, 31 Aug 2022 11:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=5KQhj9pnj+xLB3PZtsl+i8wQRPJtYdrACds5jfEHUaY=;
 b=Bub8XNxyl/pjjQhO8MOD3yNgB2YjzxVgFLIuH8Ya/sTN/voR095IovBSZ4Ktx7o5ty
 7c3Vjq7gegbZ9xTs6XbcAkjimiOWUvYW6dslcx2wcvgjxGT2B89zbjWrKne5ZfXvuw/I
 qc0VGZ+36H8Uw4R1p0pNZm5hCiQEqbOZ4JDtv278/GY4JhJuwe7acmnCJs92wrRjwsv7
 oB9mzEbSqUcKRUFiXj0lGWb2HtWL+XhtEK8HGohgPk9aQFoUjt0V76QEdR++VCT14Uu8
 18m0dmRYMIRyCZuCUp8+lLPESdYWu9FXYmbmnInkVSDJqqF9fTJa8NKyFANiS8j37NnE
 R8KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=5KQhj9pnj+xLB3PZtsl+i8wQRPJtYdrACds5jfEHUaY=;
 b=mj5QLdPwEp/9jrsjrTui0onwWlBXhCEKOeUr5HGwg57ieg3I7yRqa/CCV/uV6+e2WK
 x6ztZ+bNWj2X6ee0hwTGwvnScx/scGNAQpvix+MnHK8VXZPTpGtGmHVuqdj6CLSO7qY1
 5j+FqzzrtCv4zybiBVCwJOTmOmG/9Gu9DmbI9yCB1NpQnqOMvVdalkkVaDJmZpq2xRj9
 FNDsOTr1N6fMvTWufd5ftbJ9BkHjibAh875Dlw7SxV9HxjgdLMd7Kwwxgs48r+951I99
 Mh87i7dzVfusEZIGLiqYJcBxfGcJxw1Al3kNx/siQH7bj0eAVoEoTFdP6rMCNzDGVaDK
 uDgQ==
X-Gm-Message-State: ACgBeo3yhAAevan4S/bpKtmYOq34o9CAQaxx1cQWISmdUjCavyVgVgOQ
 DvXsX+ck8vIl7ls4bVCapmIN6XwntO4=
X-Google-Smtp-Source: AA6agR7xjFPK7imyHy1WIRjWIuyiNoTODXqp+tgZnjTHBnKpzr9QG894zunt9//bIGvYrjyWWacLrA==
X-Received: by 2002:a05:6871:784:b0:11c:291d:6147 with SMTP id
 o4-20020a056871078400b0011c291d6147mr2139704oap.66.1661971897453; 
 Wed, 31 Aug 2022 11:51:37 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a9d4544000000b0061cbd18bd18sm9599927oti.45.2022.08.31.11.51.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 11:51:37 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>
Subject: [PULL 19/60] ppc/pnv: add phb-id/chip-id PnvPHB4RootBus properties
Date: Wed, 31 Aug 2022 15:49:53 -0300
Message-Id: <20220831185034.23240-20-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831185034.23240-1-danielhb413@gmail.com>
References: <20220831185034.23240-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x32.google.com
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

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
Message-Id: <20220811163950.578927-3-danielhb413@gmail.com>
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
2.37.2


