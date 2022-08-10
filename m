Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9143858EA56
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 12:12:23 +0200 (CEST)
Received: from localhost ([::1]:39356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLihK-0003yt-BV
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 06:12:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oLiaz-0006o5-0E; Wed, 10 Aug 2022 06:05:49 -0400
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d]:37719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oLiax-0000rk-17; Wed, 10 Aug 2022 06:05:48 -0400
Received: by mail-vs1-xe2d.google.com with SMTP id 66so14604079vse.4;
 Wed, 10 Aug 2022 03:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=0KSqmnjISPdzB3lY+7VCeZqYcNoi08fni4asYVSgZRg=;
 b=gqXdrpO4jgJWOPicK1j/udHp4sudi7Y5fCI5EWp6R61/etP+zHJ4tcowtuXWQTs5gD
 CqEHVAUdRyM8U3PLQcsD2Ev7fSJf5LKYrNUOdO6NfvsbyFmWG+ZrYaHmv2ztFeNBmOXb
 OPWjPj13TKhgYxdZdeBLGP13ZPeyjrp+ogmuHUIZdSz8PKu8gRnWU96WLJVZQF1I76Wf
 jAYBGlqFaK/gkpTbNez5vMQhEOmBSLSwR1TBueB1J0wV+1RlJnO2uotOx73Gi9PPFQOR
 bec2uRf5pvW8naQk+vd1eo6gH5EKhv7/864h10v6WjIgySyicshbWWm/PeKnBTopvLIt
 ZD3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=0KSqmnjISPdzB3lY+7VCeZqYcNoi08fni4asYVSgZRg=;
 b=uVN2LBstZ0FXQ3RqoE1VTHJgZWeiR45ZzYT/7Jy2mrXZ9IQH9sviBfrfg9S5BqWsi1
 5w2uYAfZr4VU5mOcWl7wr9ky3iG0iUJV4C2p8HMJ3NirzghVpgnXgomDsqyaDBlThdDs
 kX+8g4tKDXv+Q43BErEeMS9ww9Nq0RF6iloBKtxHuSOcAK2nZLX+Dn5DNGGp1h8n/ur7
 ZNkOl40GC0TMNsrZuBSpweOFHvfvOJhwfWqwVXxLS6PFhCsM3mpghJpvzdORjRVTaPNz
 mZw5zUYmhZymEQkrhgm7oswtStMVMFwzutaE1TBX3Ek8vEzTP7cUwYKpZkQqVo+aK6/Z
 p/9A==
X-Gm-Message-State: ACgBeo0FVVGdUcZ7ih+n9wMbQMxst5x4tjnzHz4jlUpUEp7GGnIk4WY7
 gsPGbrqStMJstiwtJVP1DYahNvmU/+k=
X-Google-Smtp-Source: AA6agR5Z69QjNAfL1xv+q+OGhQLuNXBUeZUGGDVDuJdtWQ0gD33h7pdwM6iPFLD/GmnKPLQXLHQCiA==
X-Received: by 2002:a67:eada:0:b0:388:95b5:886f with SMTP id
 s26-20020a67eada000000b0038895b5886fmr8943406vso.10.1660125944294; 
 Wed, 10 Aug 2022 03:05:44 -0700 (PDT)
Received: from balboa.COMFAST (201-43-216-47.dsl.telesp.net.br.
 [201.43.216.47]) by smtp.gmail.com with ESMTPSA id
 2-20020a1f1602000000b0037613541b27sm12277919vkw.39.2022.08.10.03.05.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 03:05:43 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 v3 01/11] ppc/pnv: add phb-id/chip-id PnvPHB3RootBus
 properties
Date: Wed, 10 Aug 2022 07:05:26 -0300
Message-Id: <20220810100536.473859-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220810100536.473859-1-danielhb413@gmail.com>
References: <20220810100536.473859-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2d;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe2d.google.com
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


