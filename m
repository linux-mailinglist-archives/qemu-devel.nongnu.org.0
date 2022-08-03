Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDA6588E0C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 15:57:04 +0200 (CEST)
Received: from localhost ([::1]:33240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJEru-0004ch-Uc
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 09:57:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJEgf-00035Y-Vm; Wed, 03 Aug 2022 09:45:26 -0400
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e]:36385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJEgc-0004nD-Ah; Wed, 03 Aug 2022 09:45:25 -0400
Received: by mail-vs1-xe2e.google.com with SMTP id a63so17887342vsa.3;
 Wed, 03 Aug 2022 06:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=AaEhUe3Fqh+JrleK6AtU28zpUQn3ivlltOmxMaWCeh4=;
 b=jrCv+P7mUBaIf0E4KOhdOueiKgFt4mFg2L40A5Dziqh5OAkljtUw29uNxgT/6D48Uk
 ui32oDdgS0HaX6yz8qiTCBq8HVvARAHTvwfnqIkoEyyRRmqVa79/2F3QRf2zX9Udi4tf
 1lUFI5+aisXhbwIKqYcft45fENAJRpMeNwYvu/IqcgZ2OKbvZJt7MpIXNufoV+r3r3AE
 az6p4TorZCAqbi5jaWUwlUyhRC9eRxFeZNzPiUWY1/4AjT2oUztefMO9hFILZSG5qsn1
 f7FFzgAbLlBtwHQHULkP7UaouBQiuxaKQPMgij4d3tfSPm6sG+OPZ5FrzFDS5TgkmNnV
 IhLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=AaEhUe3Fqh+JrleK6AtU28zpUQn3ivlltOmxMaWCeh4=;
 b=boFwAItHjr7Z2zIp32hTJA54IsFlxbKK8Fw1ogfLrHyjop5JxzdvgU6KSa9J45hf35
 wJG6ndU/JUh8vAM6xfy/I16ncJHiI3YFkoqooUOIwCI37PSIf8xS1lNrTOmumuPysOfZ
 uPSF2s+CVikpbqrMSXj69Kp9za1RXwmZ5miM1ul8G3SWN6jASSibmr73eTk1pIXHfcfa
 sIJzlfFbtCq2Bn52WVz3+Scdh/MzpsCiNTlYth4vCd2uqgAYJs2yGNhxHEtyG42Vligy
 w3nnyg8XV/LEfKp7OIov4mS80SFEIbyRCmjK2e6d7d5UbU5PFwI7ThW8hS1Izdqr00E6
 0TEA==
X-Gm-Message-State: AJIora+v+BmcDCrH63OTz02xDczA7GVR47WRc6v5amC23H7C/2TigljE
 a5ha7fiQxx/GI6/VPkKTmZENAwgevoE=
X-Google-Smtp-Source: AGRyM1uH8jT+we0/R8eShdPtnh7xuSyBN/O6TvrnQ4/kgtb0wQ4ZsBu6aGUkk8oqLNCxlcj6r+RQ2w==
X-Received: by 2002:a05:6102:5487:b0:358:4b42:35b with SMTP id
 bk7-20020a056102548700b003584b42035bmr9847638vsb.72.1659534309319; 
 Wed, 03 Aug 2022 06:45:09 -0700 (PDT)
Received: from balboa.ibmmodules.com ([2804:431:c7c7:52e2:fb25:323c:5709:7237])
 by smtp.gmail.com with ESMTPSA id
 q201-20020a1f2ad2000000b00377fba67271sm932420vkq.34.2022.08.03.06.45.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 06:45:08 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, Frederic Barrat <fbarrat@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 01/10] ppc/pnv: add phb-id/chip-id PnvPHB3RootBus
 properties
Date: Wed,  3 Aug 2022 10:44:50 -0300
Message-Id: <20220803134459.2633902-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220803134459.2633902-1-danielhb413@gmail.com>
References: <20220803134459.2633902-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2e;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe2e.google.com
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


