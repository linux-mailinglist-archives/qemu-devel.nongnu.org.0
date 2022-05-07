Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0543A51E964
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 21:18:24 +0200 (CEST)
Received: from localhost ([::1]:59490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnPwd-0001EB-3h
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 15:18:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nnPlZ-0005kE-E7; Sat, 07 May 2022 15:06:57 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234]:40922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nnPlX-0001ZS-MY; Sat, 07 May 2022 15:06:57 -0400
Received: by mail-oi1-x234.google.com with SMTP id y63so11104761oia.7;
 Sat, 07 May 2022 12:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z4dt0AaEFVwxa/sPSU7oQcvtGknrn6YWOKku0j9if14=;
 b=WRviz0ng5DsyzdE2aOQbdjBpasbl7v07PRUARLUSSTw83JJpo4epjVrx7GRUiOzfuE
 ISa6AUlNu7Z/pZ0j9QLdcX6LYB8eDhUUR9JZ2OiQHP+irX1Zea0zK7g9e7vgCC3C0EXd
 f+SrQtNSSdBtF64b/dzQTgNz1lmdKdIMZU7sh/cEP/aoRgp/RFYuFo1OeZq/iYslfE8s
 IpuGejiBjK4/dIM9RwpeWV9KCC6nr+6Az21SBMDOzmO4JVoC1ivkP6srwhDLRel0oqUF
 YaGrgiddxgcSAbv6Zf1xPrdtERijvK7X7C96X3dca8B4p5LERm4N/lcDOvAtaCGr0czA
 2D3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z4dt0AaEFVwxa/sPSU7oQcvtGknrn6YWOKku0j9if14=;
 b=BBY5OSJrEd9lI/Q+QBTouwY7jjpQO/536lQXNhfmAxAX6o7Pm4Y6jkpkaoEJtBwFln
 gELA+qAz+MRHJVj2c/u1wyWchl8mLtuI73ayo9ab1NJEn7MUYnK5I8P+XD2nzAB7ZeDr
 XJMeNcuL9WhZ1aIK2QAfS6RVhBjstu6NWWPWYjn6xTiplWSe/SbC9LWnj4M4UyGhK2tB
 iOul+sNX6NXJDXrBwPkTw3UtfyBl2pCouuyPG/L+jl3dNMucqq2pNf/B+rRDEEHxEtAQ
 slyAVfOd4aZ8GbIj5qdHtEp5rbhJ7B9KOp0KH0uNYW8AhsPpPPV68xWDXp/m5bmlqQXS
 TTnQ==
X-Gm-Message-State: AOAM532TucJKiDDOB1EypOnh/EMwgDuIlgJHxcicteIJI/Nb9gr6dZoS
 3dFN10oQE3ZnCeS3ipXSOA89TkbbPns=
X-Google-Smtp-Source: ABdhPJyQwUlqEHpc+AWBwM0GOmvILDTrNbPUyrAKUMGGWpHHIBR0W4Va+yo1euIuX6myxOw5zbre3w==
X-Received: by 2002:a05:6808:1646:b0:2f9:4b95:2f04 with SMTP id
 az6-20020a056808164600b002f94b952f04mr4219398oib.208.1651950414092; 
 Sat, 07 May 2022 12:06:54 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 p1-20020a0568301d4100b0060603221270sm2907397oth.64.2022.05.07.12.06.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 May 2022 12:06:53 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 fbarrat@linux.ibm.com, Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH 09/17] ppc/pnv: user creatable pnv-phb for powernv9
Date: Sat,  7 May 2022 16:06:16 -0300
Message-Id: <20220507190624.507419-10-danielhb413@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220507190624.507419-1-danielhb413@gmail.com>
References: <20220507190624.507419-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x234.google.com
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
using the pnv-phb device instead of the now late pnv-phb4 device,
allowing us to enable user creatable pnv-phb devices for the powernv9
machine.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c     | 58 +++++++++++++++++++++++++++++++++++++-
 hw/pci-host/pnv_phb4_pec.c |  6 ++--
 hw/ppc/pnv.c               |  2 ++
 3 files changed, 63 insertions(+), 3 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index becfd366f1..262251ebcf 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1544,14 +1544,70 @@ void pnv_phb4_instance_init(Object *obj)
     object_initialize_child(obj, "source", &phb->xsrc, TYPE_XIVE_SOURCE);
 }
 
+static PnvPhb4PecState *pnv_phb4_get_pec(PnvChip *chip, PnvPHB *phb,
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
+               "pnv-phb chip-id %d index %d didn't match any existing PEC",
+               chip_id, index);
+
+    return NULL;
+}
+
 void pnv_phb4_realize(DeviceState *dev, Error **errp)
 {
     PnvPHB *phb = PNV_PHB(dev);
+    PnvMachineState *pnv = PNV_MACHINE(qdev_get_machine());
+    PnvChip *chip = pnv_get_chip(pnv, phb->chip_id);
     PCIHostState *pci = PCI_HOST_BRIDGE(dev);
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
+    pnv_chip_parent_fixup(chip, OBJECT(phb), phb->phb_id);
+
+    s = qdev_get_parent_bus(DEVICE(chip));
+    if (!qdev_set_parent_bus(DEVICE(phb), s, &local_err)) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
     /* Set the "big_phb" flag */
     phb->big_phb = phb->phb_id == 0 || phb->phb_id == 3;
 
@@ -1763,7 +1819,7 @@ static void pnv_phb4_root_port_class_init(ObjectClass *klass, void *data)
     PCIERootPortClass *rpc = PCIE_ROOT_PORT_CLASS(klass);
 
     dc->desc     = "IBM PHB4 PCIE Root Port";
-    dc->user_creatable = false;
+    dc->user_creatable = true;
 
     device_class_set_parent_realize(dc, pnv_phb4_root_port_realize,
                                     &rpc->parent_realize);
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 3eed560e44..243a079ea7 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -150,8 +150,10 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
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
index 34a200a29c..1a3cafcb7a 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -2155,6 +2155,8 @@ static void pnv_machine_power9_class_init(ObjectClass *oc, void *data)
     pmc->compat = compat;
     pmc->compat_size = sizeof(compat);
     pmc->dt_power_mgt = pnv_dt_power_mgt;
+
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_PNV_PHB);
 }
 
 static void pnv_machine_power10_class_init(ObjectClass *oc, void *data)
-- 
2.32.0


