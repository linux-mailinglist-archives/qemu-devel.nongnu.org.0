Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE5D539927
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 23:57:53 +0200 (CEST)
Received: from localhost ([::1]:42610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw9s7-0003I1-Tq
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 17:57:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nw9kI-00015n-GQ; Tue, 31 May 2022 17:49:46 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:38716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nw9kG-0003Ms-O7; Tue, 31 May 2022 17:49:46 -0400
Received: by mail-oi1-x22a.google.com with SMTP id v9so195089oie.5;
 Tue, 31 May 2022 14:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dm1g4djBxOWIBRn/0A0LxKf5sz0jsg/QCw9b46kxaQU=;
 b=ftVUgkfrWRTHPdAtreXxad08CpWKPj/RifNitkCuQH6A7a7MRg0TLUSHB2tyQ3FhbC
 e3B85RfsKB5mb/8zWjNAkxwf2grsecPBlWdX31nkzlgy9ULThHDMHMnIr0TK5llgDhcf
 fYyrTy6TPaZbBU06n1cD3VOqupTuCSH1OxCMUdr3zB20wHqR1fI74XkGmFKxTtYTIlq6
 R/n3lCqlY+0w9a5KyYOVBXwao5geJ780+7HyyYTCCGm2CuNN4larmxrlJjf7unpYqaIU
 pmAUMfNFHosCgeHRZrpOrKFcsny8477Nh5aDoYaYNQTmS5FQIG7Cc1CPbdLnvGHQItYF
 vE7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dm1g4djBxOWIBRn/0A0LxKf5sz0jsg/QCw9b46kxaQU=;
 b=HErU16P+UVVOZkzM3iw/SIyZm4TaP7h9mOA8S/OSvO8tNjem0a6nJDfd/TwFH4F7Hi
 TBIxvlyi9Qr4ySY/e40R4PaHYPEB5thM5nZxGJUv867icHsQ8hoJF5PmG+bdtwJoUPF1
 W+pqy/5CbLzeXAqnS8/FWCPfckdxz3U21+7+14MUDPmNeoeQpiuNqszC4qmTY6CM2ZY+
 2EmSmIDulreR4ODYK8LYa4DD2QPIET7at5NZw2DZYDBsXWjDbN4XU+bGgCr2CqtfkuD9
 xSVo5ham33eZONxPcaAGmCN6/gdEv1XwgP6u8Ms/zB+qJaHJcJEhcOP0WMAZdZZvvo58
 tcxw==
X-Gm-Message-State: AOAM5305PD3GAM/6MIebaANpjxtOSyR+BiYNjwRniepCqhMx+4PBLlLA
 4tjnR0fopF7HzgLJCzkOEXknZzbLnVk6mw==
X-Google-Smtp-Source: ABdhPJym4cTE/WBZwvMCkZ4rBz46Tko4NH91qoPQa2PGDCTSSYNX+914qxUtsfwSn/SXUDOKrDomdA==
X-Received: by 2002:a05:6808:144d:b0:32b:7fbc:9440 with SMTP id
 x13-20020a056808144d00b0032b7fbc9440mr13136648oiv.226.1654033783208; 
 Tue, 31 May 2022 14:49:43 -0700 (PDT)
Received: from balboa.COMFAST ([152.250.93.219])
 by smtp.gmail.com with ESMTPSA id
 pd19-20020a0568701f1300b000f333ac991fsm3476988oab.27.2022.05.31.14.49.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 14:49:42 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 mark.cave-ayland@ilande.co.uk, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v2 08/16] ppc/pnv: user created pnv-phb for powernv9
Date: Tue, 31 May 2022 18:49:09 -0300
Message-Id: <20220531214917.31668-9-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220531214917.31668-1-danielhb413@gmail.com>
References: <20220531214917.31668-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22a.google.com
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

To enable user creatable PnvPHB devices for powernv9 we'll revert the
powernv9 related changes made in 9c10d86fee "ppc/pnv: Remove
user-created PHB{3,4,5} devices".

This change alone isn't enough to enable user creatable devices for powernv10
due to how pnv_phb4_get_pec() currently works. For now let's just enable it
for powernv9 alone.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c     | 58 +++++++++++++++++++++++++++++++++++++-
 hw/pci-host/pnv_phb4_pec.c |  6 ++--
 hw/ppc/pnv.c               |  2 ++
 3 files changed, 63 insertions(+), 3 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 22cf1c2a5e..a5c8ae494b 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1571,13 +1571,69 @@ void pnv_phb4_bus_init(DeviceState *dev, PnvPHB4 *phb)
     pci->bus->flags |= PCI_BUS_EXTENDED_CONFIG_SPACE;
 }
 
+static PnvPhb4PecState *pnv_phb4_get_pec(PnvChip *chip, PnvPHB4 *phb,
+                                         Error **errp)
+{
+    Pnv9Chip *chip9 = PNV9_CHIP(chip);
+    int chip_id = phb->chip_id;
+    int index = phb->phb_id;
+    int i, j;
+
+    for (i = 0; i < chip->num_pecs; i++) {
+        /*
+         * For each PEC, check the amount of phbs it supports
+         * and see if the given phb4 index matches an index.
+         */
+        PnvPhb4PecState *pec = &chip9->pecs[i];
+
+        for (j = 0; j < pec->num_phbs; j++) {
+            if (index == pnv_phb4_pec_get_phb_id(pec, j)) {
+                return pec;
+            }
+        }
+    }
+
+    error_setg(errp,
+               "pnv-phb4 chip-id %d index %d didn't match any existing PEC",
+               chip_id, index);
+
+    return NULL;
+}
+
 static void pnv_phb4_realize(DeviceState *dev, Error **errp)
 {
     PnvPHB4 *phb = PNV_PHB4(dev);
+    PnvMachineState *pnv = PNV_MACHINE(qdev_get_machine());
+    PnvChip *chip = pnv_get_chip(pnv, phb->chip_id);
     XiveSource *xsrc = &phb->xsrc;
+    BusState *s;
+    Error *local_err = NULL;
     int nr_irqs;
     char name[32];
 
+    if (!chip) {
+        error_setg(errp, "invalid chip id: %d", phb->chip_id);
+        return;
+    }
+
+    /* User created PHBs need to be assigned to a PEC */
+    if (!phb->pec) {
+        phb->pec = pnv_phb4_get_pec(chip, phb, &local_err);
+        if (local_err) {
+            error_propagate(errp, local_err);
+            return;
+        }
+    }
+
+    /* Reparent the PHB to the chip to build the device tree */
+    pnv_chip_parent_fixup(chip, OBJECT(phb->phb_base), phb->phb_id);
+
+    s = qdev_get_parent_bus(DEVICE(chip));
+    if (!qdev_set_parent_bus(DEVICE(phb->phb_base), s, &local_err)) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
     /* Set the "big_phb" flag */
     phb->big_phb = phb->phb_id == 0 || phb->phb_id == 3;
 
@@ -1803,7 +1859,7 @@ static void pnv_phb4_root_port_class_init(ObjectClass *klass, void *data)
     PCIERootPortClass *rpc = PCIE_ROOT_PORT_CLASS(klass);
 
     dc->desc     = "IBM PHB4 PCIE Root Port";
-    dc->user_creatable = false;
+    dc->user_creatable = true;
 
     device_class_set_parent_realize(dc, pnv_phb4_root_port_realize,
                                     &rpc->parent_realize);
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 888ecbe8f3..0e67f3a338 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -146,8 +146,10 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
     pec->num_phbs = pecc->num_phbs[pec->index];
 
     /* Create PHBs if running with defaults */
-    for (i = 0; i < pec->num_phbs; i++) {
-        pnv_pec_default_phb_realize(pec, i, errp);
+    if (defaults_enabled()) {
+        for (i = 0; i < pec->num_phbs; i++) {
+            pnv_pec_default_phb_realize(pec, i, errp);
+        }
     }
 
     /* Initialize the XSCOM regions for the PEC registers */
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 3b0b230e49..697a2b5302 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -2186,6 +2186,8 @@ static void pnv_machine_power9_class_init(ObjectClass *oc, void *data)
     pmc->compat = compat;
     pmc->compat_size = sizeof(compat);
     pmc->dt_power_mgt = pnv_dt_power_mgt;
+
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_PNV_PHB);
 }
 
 static void pnv_machine_power10_class_init(ObjectClass *oc, void *data)
-- 
2.36.1


