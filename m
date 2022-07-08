Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A5356BAD6
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 15:34:54 +0200 (CEST)
Received: from localhost ([::1]:40554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9o8D-0006Uw-Sx
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 09:34:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9nzB-0002xy-Qg; Fri, 08 Jul 2022 09:25:37 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d]:40457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9nzA-00071B-4J; Fri, 08 Jul 2022 09:25:33 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 n12-20020a9d64cc000000b00616ebd87fc4so16202116otl.7; 
 Fri, 08 Jul 2022 06:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HpotT2MgRmts3otazEbXXr3FaeYADH2GDXAvK2zJONY=;
 b=fJTrcCd/VjUzhhAUC9v7MwisCHShgTDfcatFWcmwwYfqk9BK2/6N0RRSAwYh+HYJX5
 UiztcCRJjMd5GtXaqu+9H0MXu1Coa8Pw25oEDPGoKXG83W7hhj7zSdo/zdq57uXGhI/E
 WXvCkEyHEYryaLekR/Zb9r9lJyEqRZBg7VHNNch6Jji0nBoWbTA+oLk1m7loEO1/L5jS
 RYRDnL00veciXlE/lE3jbNP9B9/sJ2FJ+KzsJO4lAvDO4AkF53lRsb8tDP7ABPVSPNQt
 maCyPquIaGgC28HTZTL2SI7qWXI+zUq1fRhn9nDndwqedzHHT8mZpjAmmmqfRXlERn+4
 u0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HpotT2MgRmts3otazEbXXr3FaeYADH2GDXAvK2zJONY=;
 b=eOZvRKCkTMszThOFgzNMDMUBWNbcLIhJ7N2AABTkEfod/QuRl9zQI3zsgcSN5fQiEw
 QlJgVjb9Nb26dussL5mC3sJGjWp/KTQTBQpgYHHVBEBJ/NdayRQg30KSIboc61Wgib/l
 ge+U5C1ism7ifRqjQq4YQVancWveYQZ4F8WbKfJMb4GpkAUSK+VxNSGZEKwcTSPyDDPM
 oqQPKMrLgwOU7Eb2RvJThqLj5wHo9YGC4OMSzqDh2rtjGTsf1YtKEj8ol++wd3y+5mWm
 WOgB2vq2F4smZwGM+CZ7Ldf4g68BncXRpAY0gXGye0ri9I1B8sqorrktuuymJvvOGLOi
 V32Q==
X-Gm-Message-State: AJIora8DbrqmLkpFjMFvIAquLkoOthF5N7kLgrigwsPN0la6P+6Wzw/t
 sAbiERJNeyTny2ZYfecJDCh+bKOe0W0=
X-Google-Smtp-Source: AGRyM1venwfq8h4uZgFdOGjP9k1CCGWu8pH/RQ+JVT7qssyR/jb8PdIhEGrKmUhKLMBqu4u53jtbXA==
X-Received: by 2002:a9d:2602:0:b0:61c:30c1:fa03 with SMTP id
 a2-20020a9d2602000000b0061c30c1fa03mr576809otb.86.1657286729623; 
 Fri, 08 Jul 2022 06:25:29 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 f108-20020a9d03f5000000b0060c00c3fde5sm18435797otf.72.2022.07.08.06.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 06:25:29 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH 01/10] ppc/pnv: add phb-id/chip-id PnvPHB3RootBus properties
Date: Fri,  8 Jul 2022 10:25:13 -0300
Message-Id: <20220708132522.581382-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708132522.581382-1-danielhb413@gmail.com>
References: <20220708132522.581382-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32d.google.com
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
index 2966374008..b8e5b2423e 100644
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


