Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC8451E95A
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 21:13:06 +0200 (CEST)
Received: from localhost ([::1]:41168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnPrV-0005qM-IF
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 15:13:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nnPlU-0005S6-Bh; Sat, 07 May 2022 15:06:52 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:42642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nnPlS-0001Ym-Ng; Sat, 07 May 2022 15:06:52 -0400
Received: by mail-oi1-x229.google.com with SMTP id w194so9889713oie.9;
 Sat, 07 May 2022 12:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kdfZZSzTmKxAd6dgoaU2jVyv+EX2hmhj5o193ySsyIc=;
 b=byN14cfXQiCp28RE9GgMm8n4J3mYiuhPNswayAZ5B/4fK/Pzn3F3Vol20Ahxb9Xf2H
 Q1dhTMVIXxUajJVGS1cuYtbfymouXangdctnBYhWBpCzAyPcvmXMNtm22/Q1ZSY5fK7h
 +P/YdxSnRWKiPto7C2OGmTVS4/5dErcveJhGPgpZIQQr7dmqSyLxI5xtCuptnxq9vWLW
 qAthmSq9QH/0D5/oyqZdLBDlDnNmCEHbk00GqSSVtPqAWH/9CPA/ktSu2SumbeaA0VHI
 ucwHj0G9xVbNhjtn84dIdE0n+FhbTLKcgUDfDHeRo+wd2z7IU+rOcSzB/Ge4Te35YxfT
 Jf1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kdfZZSzTmKxAd6dgoaU2jVyv+EX2hmhj5o193ySsyIc=;
 b=vg4JEX15oek0WzzcsnaPlKDP2EWl3nVxnl7f/rVHQOL7u9cmVFql4yNuUCGiZiw3dZ
 hMGbkFHXifklrwqX3TfgYB+P8fAPvUKCKXip2wEgUPrYlb39NR+70QWj9+eYOzmH2TOi
 XM2up0aaYhfG0IakTmT3EA3mqiVucoW1rMktO8FSGylZxxBaYroBjSqQfp6YjJO2hsTb
 9OPIkbynXeKS3nrkM5fUU4Igjih8WLZniQtJHarrBqMcalElx7iYMFTicJgoOYq94lBy
 nWNkni1ZVMkKYE/2RxrZFmgROwZ0r4Wx0jVRtnOaqobQbufVF61Xu5b5cuF6DL7XatvX
 9g5g==
X-Gm-Message-State: AOAM53238zxSq7piienMQ5/29FwEccAnht/uS/8GWOwzBdE4+tU5o9ES
 vTsQVvyycOAeXnxchQ2O3ocRR5Q9JmY=
X-Google-Smtp-Source: ABdhPJxSkTMf6H5fJxzNvV+h2EFF2R3KWauXtovUMMPZ48fXoefrPEdOpjsT0BDzOnLGN6T3vXYPTQ==
X-Received: by 2002:a05:6808:1a05:b0:325:a083:3d8d with SMTP id
 bk5-20020a0568081a0500b00325a0833d8dmr7561959oib.231.1651950409263; 
 Sat, 07 May 2022 12:06:49 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 p1-20020a0568301d4100b0060603221270sm2907397oth.64.2022.05.07.12.06.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 May 2022 12:06:49 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 fbarrat@linux.ibm.com, Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH 07/17] ppc/pnv: user created pnv-phb for powernv8
Date: Sat,  7 May 2022 16:06:14 -0300
Message-Id: <20220507190624.507419-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220507190624.507419-1-danielhb413@gmail.com>
References: <20220507190624.507419-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x229.google.com
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

This patch reintroduces the powernv8 bits of the code what was removed
in commit 9c10d86fee "ppc/pnv: Remove user-created PHB{3,4,5} devices",
using the pnv-phb device instead of the now late pnv-phb3 device,
allowing us to enable user creatable pnv-phb devices for the powernv8
machine.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb3.c | 31 +++++++++++++++++++++++++++++--
 hw/ppc/pnv.c           | 23 ++++++++++++++++++++++-
 include/hw/ppc/pnv.h   |  1 +
 3 files changed, 52 insertions(+), 3 deletions(-)

diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index d2405d4f5a..a6d6a10c52 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -993,6 +993,30 @@ void pnv_phb3_realize(DeviceState *dev, Error **errp)
     PnvMachineState *pnv = PNV_MACHINE(qdev_get_machine());
     int i;
 
+    /* User created devices */
+    if (!phb->chip) {
+        Error *local_err = NULL;
+        BusState *s;
+
+        phb->chip = pnv_get_chip(pnv, phb->chip_id);
+        if (!phb->chip) {
+            error_setg(errp, "invalid chip id: %d", phb->chip_id);
+            return;
+        }
+
+        /*
+         * Reparent user created devices to the chip to build
+         * correctly the device tree.
+         */
+        pnv_chip_parent_fixup(phb->chip, OBJECT(phb), phb->phb_id);
+
+        s = qdev_get_parent_bus(DEVICE(phb->chip));
+        if (!qdev_set_parent_bus(DEVICE(phb), s, &local_err)) {
+            error_propagate(errp, local_err);
+            return;
+        }
+    }
+
     if (phb->phb_id >= PNV_CHIP_GET_CLASS(phb->chip)->num_phbs) {
         error_setg(errp, "invalid PHB index: %d", phb->phb_id);
         return;
@@ -1052,7 +1076,10 @@ void pnv_phb3_realize(DeviceState *dev, Error **errp)
 
     pci_setup_iommu(pci->bus, pnv_phb3_dma_iommu, phb);
 
-    pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb), TYPE_PNV_PHB3_ROOT_PORT);
+    if (defaults_enabled()) {
+        pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb),
+                                 TYPE_PNV_PHB3_ROOT_PORT);
+    }
 }
 
 void pnv_phb3_update_regions(PnvPHB *phb)
@@ -1137,7 +1164,7 @@ static void pnv_phb3_root_port_class_init(ObjectClass *klass, void *data)
 
     device_class_set_parent_realize(dc, pnv_phb3_root_port_realize,
                                     &rpc->parent_realize);
-    dc->user_creatable = false;
+    dc->user_creatable = true;
 
     k->vendor_id = PCI_VENDOR_ID_IBM;
     k->device_id = 0x03dc;
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 12a3fe4920..d9e7530cd3 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1152,7 +1152,9 @@ static void pnv_chip_power8_instance_init(Object *obj)
 
     object_initialize_child(obj, "homer", &chip8->homer, TYPE_PNV8_HOMER);
 
-    chip8->num_phbs = pcc->num_phbs;
+    if (defaults_enabled()) {
+        chip8->num_phbs = pcc->num_phbs;
+    }
 
     for (i = 0; i < chip8->num_phbs; i++) {
         object_initialize_child(obj, "phb[*]", &chip8->phbs[i], TYPE_PNV_PHB);
@@ -1977,6 +1979,23 @@ static ICSState *pnv_ics_get(XICSFabric *xi, int irq)
     return NULL;
 }
 
+void pnv_chip_parent_fixup(PnvChip *chip, Object *obj, int index)
+{
+    Object *parent = OBJECT(chip);
+    g_autofree char *default_id =
+        g_strdup_printf("%s[%d]", object_get_typename(obj), index);
+
+    if (obj->parent == parent) {
+        return;
+    }
+
+    object_ref(obj);
+    object_unparent(obj);
+    object_property_add_child(
+        parent, DEVICE(obj)->id ? DEVICE(obj)->id : default_id, obj);
+    object_unref(obj);
+}
+
 PnvChip *pnv_get_chip(PnvMachineState *pnv, uint32_t chip_id)
 {
     int i;
@@ -2116,6 +2135,8 @@ static void pnv_machine_power8_class_init(ObjectClass *oc, void *data)
 
     pmc->compat = compat;
     pmc->compat_size = sizeof(compat);
+
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_PNV_PHB);
 }
 
 static void pnv_machine_power9_class_init(ObjectClass *oc, void *data)
diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index 539454fe9d..e489bec019 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -190,6 +190,7 @@ DECLARE_INSTANCE_CHECKER(PnvChip, PNV_CHIP_POWER10,
 
 PowerPCCPU *pnv_chip_find_cpu(PnvChip *chip, uint32_t pir);
 void pnv_phb_attach_root_port(PCIHostState *pci, const char *name);
+void pnv_chip_parent_fixup(PnvChip *chip, Object *obj, int index);
 
 #define TYPE_PNV_MACHINE       MACHINE_TYPE_NAME("powernv")
 typedef struct PnvMachineClass PnvMachineClass;
-- 
2.32.0


