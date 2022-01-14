Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F29048EFD0
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 19:21:19 +0100 (CET)
Received: from localhost ([::1]:56906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8RCQ-0005Ic-AF
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 13:21:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n8QzI-0005rO-Tl; Fri, 14 Jan 2022 13:07:44 -0500
Received: from [2607:f8b0:4864:20::335] (port=38436
 helo=mail-ot1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n8QzG-0000PQ-Lu; Fri, 14 Jan 2022 13:07:44 -0500
Received: by mail-ot1-x335.google.com with SMTP id
 g1-20020a9d6481000000b00592d01f2b6eso6891774otl.5; 
 Fri, 14 Jan 2022 10:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kn8c/M2hPBBRuoQrXKDiUzeXFCTjuWaIarKvfv/zNTE=;
 b=UodZ2Kv5qhmZmxzEb5bCVEE5YNsZB0U8RHGPqZPra5M58DOfglCJ3kX3EYGJ6F2iTS
 AaW9AniqPe2B9aOUu11/ChtIzTGGHWRuACdDkE+k7F60glLyY/YnnNsEtsGaPOEtdCis
 WNkxxUYK3AkznRjmUGxc9W0gpbF60cirh6S4EwyCZWGHHjicnESdRglKUEooVNY6+oW8
 fwoPaMndvhoDUDHUDQtN+KoZJI5d/JV3nyDXH4HOY5GCwnIFlqH4YKkWB2DPlGIhqHYx
 wUQ39OLyaFEuGfU9mL6eMxJWbUfnH54pJ14nQOmxDx72NXPHcCHodkOFJs45/+JMrZ8h
 Pixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kn8c/M2hPBBRuoQrXKDiUzeXFCTjuWaIarKvfv/zNTE=;
 b=GJGrV6bhDYYoNycFhWmZvCqCyYrbpmqilCuPLI17aA3vxMOlUpjQqpMxdkXqfhWH/0
 ipzPkxqtwC9Flpk7pnYp+G1knNgC6mudzhyve2I0nBLUrz5Xw+lKOEsDWeD/GMnYduMf
 Z+3aAlJ2GUQia3j0qKSLAdoxgxDhO2Hp+GxHwvbsG87MmK93rWnTiu0OZNtzAEYBAxvk
 GqFeBEU6jXvQbwwkLjZA1U7+p8Vsu3UiIZMBv4/Lba/TQNGmCVxpgUHZZQwzGEOcZECe
 ge+S4DMNFQcjsyP0Ps1mRmRLFFkkB0UW61QzCOom9oYzK/aiS/NV+QpPseE33ZwdFXRy
 BDkg==
X-Gm-Message-State: AOAM532uaJushAVrrgYGvAYATL70yfhBzwNR2jD6b+dz7ewbi5umUA9l
 xAYMx40PtwkzaTA2UJT1o7Sk1LrqzF+mJBmf
X-Google-Smtp-Source: ABdhPJxPYWPpA+ZGUuIff3oilAWtPbNAM9P5aRc936xSueMUEdcP16RXLX4EvS7jP4lHUeqHwhhMzw==
X-Received: by 2002:a9d:5a03:: with SMTP id v3mr7814635oth.17.1642183661176;
 Fri, 14 Jan 2022 10:07:41 -0800 (PST)
Received: from rekt.COMFAST ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id e17sm1353584otr.13.2022.01.14.10.07.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 10:07:40 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/8] ppc/pnv: make PECs create and realize PHB4s
Date: Fri, 14 Jan 2022 15:07:17 -0300
Message-Id: <20220114180719.52117-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220114180719.52117-1-danielhb413@gmail.com>
References: <20220114180719.52117-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::335
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x335.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch changes the design of the PEC device to create and realize PHB4s
instead of PecStacks. After all the recent changes, PHB4s now contain all
the information needed for their proper functioning, not relying on PecStack
in any capacity.

All changes are being made in a single patch to avoid renaming parts of
the PecState and leaving the code in a strange way. E.g. rename
PecClass->num_stacks to num_phbs, which would then read a
pnv_pec_num_stacks[] array. To avoid mixing the old and new design more
than necessary it's clearer to do these changes in a single step.

The name changes made are:

- in PnvPhb4PecState:
  * rename 'num_stacks' to 'num_phbs'
  * remove the pec->stacks[] array. Current code relies on the
pec->stacks[] obj acting as a simple container, without ever accessing
pec->stacks[] for any other purpose. Instead of converting this into a
pec->phbs[] array, remove it

- in PnvPhb4PecClass, rename *num_stacks to *num_phbs;

- pnv_pec_num_stacks[] is renamed to pnv_pec_num_phbs[].

The logical changes:

- pnv_pec_default_phb_realize():
  * init and set the properties of the PnvPHB4 qdev
  * do not use stack->phb anymore;

- pnv_pec_realize():
  * use the new default_phb_realize() to init/realize each PHB if
running with defaults;

- pnv_pec_instance_init(): removed since we're creating the PHBs during
pec_realize();

- pnv_phb4_get_stack():
  * renamed to pnv_phb4_get_pec() and returns a PnvPhb4PecState*;

- pnv_phb4_realize(): use 'phb->pec' instead of 'stack'.

This design change shouldn't caused any behavioral change in the runtime
of the machine.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c         | 26 ++++++--------
 hw/pci-host/pnv_phb4_pec.c     | 66 ++++++++++------------------------
 include/hw/pci-host/pnv_phb4.h |  8 ++---
 3 files changed, 31 insertions(+), 69 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 2efd34518e..3dc3c70cb2 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -884,7 +884,7 @@ static int pnv_phb4_get_phb_stack_no(PnvPHB4 *phb)
     int stack_no = phb->phb_id;
 
     while (index--) {
-        stack_no -= pecc->num_stacks[index];
+        stack_no -= pecc->num_phbs[index];
     }
 
     return stack_no;
@@ -1383,7 +1383,7 @@ int pnv_phb4_pec_get_phb_id(PnvPhb4PecState *pec, int stack_index)
     int offset = 0;
 
     while (index--) {
-        offset += pecc->num_stacks[index];
+        offset += pecc->num_phbs[index];
     }
 
     return offset + stack_index;
@@ -1534,8 +1534,8 @@ static void pnv_phb4_instance_init(Object *obj)
     object_initialize_child(obj, "source", &phb->xsrc, TYPE_XIVE_SOURCE);
 }
 
-static PnvPhb4PecStack *pnv_phb4_get_stack(PnvChip *chip, PnvPHB4 *phb,
-                                           Error **errp)
+static PnvPhb4PecState *pnv_phb4_get_pec(PnvChip *chip, PnvPHB4 *phb,
+                                         Error **errp)
 {
     Pnv9Chip *chip9 = PNV9_CHIP(chip);
     int chip_id = phb->chip_id;
@@ -1544,14 +1544,14 @@ static PnvPhb4PecStack *pnv_phb4_get_stack(PnvChip *chip, PnvPHB4 *phb,
 
     for (i = 0; i < chip->num_pecs; i++) {
         /*
-         * For each PEC, check the amount of stacks it supports
-         * and see if the given phb4 index matches a stack.
+         * For each PEC, check the amount of phbs it supports
+         * and see if the given phb4 index matches an index.
          */
         PnvPhb4PecState *pec = &chip9->pecs[i];
 
-        for (j = 0; j < pec->num_stacks; j++) {
+        for (j = 0; j < pec->num_phbs; j++) {
             if (index == pnv_phb4_pec_get_phb_id(pec, j)) {
-                return &pec->stacks[j];
+                return pec;
             }
         }
     }
@@ -1576,7 +1576,6 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
     if (!phb->pec) {
         PnvMachineState *pnv = PNV_MACHINE(qdev_get_machine());
         PnvChip *chip = pnv_get_chip(pnv, phb->chip_id);
-        PnvPhb4PecStack *stack;
         PnvPhb4PecClass *pecc;
         BusState *s;
 
@@ -1585,18 +1584,13 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
             return;
         }
 
-        stack = pnv_phb4_get_stack(chip, phb, &local_err);
+        phb->pec = pnv_phb4_get_pec(chip, phb, &local_err);
         if (local_err) {
             error_propagate(errp, local_err);
             return;
         }
 
-        /*
-         * All other phb properties but 'pec' ad 'version' are
-         * already set.
-         */
-        object_property_set_link(OBJECT(phb), "pec", OBJECT(stack->pec),
-                                 &error_abort);
+        /* All other phb properties are already set */
         pecc = PNV_PHB4_PEC_GET_CLASS(phb->pec);
         object_property_set_int(OBJECT(phb), "version", pecc->version,
                                 &error_fatal);
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index d6405d6ca3..852816b9f8 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -112,41 +112,28 @@ static const MemoryRegionOps pnv_pec_pci_xscom_ops = {
     .endianness = DEVICE_BIG_ENDIAN,
 };
 
-static void pnv_pec_default_phb_realize(PnvPhb4PecStack *stack,
+static void pnv_pec_default_phb_realize(PnvPhb4PecState *pec,
                                         int stack_no,
                                         Error **errp)
 {
-    PnvPhb4PecState *pec = stack->pec;
+    PnvPHB4 *phb = PNV_PHB4(qdev_new(TYPE_PNV_PHB4));
     PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
     int phb_id = pnv_phb4_pec_get_phb_id(pec, stack_no);
 
-    stack->phb = PNV_PHB4(qdev_new(TYPE_PNV_PHB4));
-
-    object_property_set_link(OBJECT(stack->phb), "pec", OBJECT(pec),
+    object_property_set_link(OBJECT(phb), "pec", OBJECT(pec),
                              &error_abort);
-    object_property_set_int(OBJECT(stack->phb), "chip-id", pec->chip_id,
+    object_property_set_int(OBJECT(phb), "chip-id", pec->chip_id,
                             &error_fatal);
-    object_property_set_int(OBJECT(stack->phb), "index", phb_id,
+    object_property_set_int(OBJECT(phb), "index", phb_id,
                             &error_fatal);
-    object_property_set_int(OBJECT(stack->phb), "version", pecc->version,
+    object_property_set_int(OBJECT(phb), "version", pecc->version,
                             &error_fatal);
 
-    if (!sysbus_realize(SYS_BUS_DEVICE(stack->phb), errp)) {
+    if (!sysbus_realize(SYS_BUS_DEVICE(phb), errp)) {
         return;
     }
 }
 
-static void pnv_pec_instance_init(Object *obj)
-{
-    PnvPhb4PecState *pec = PNV_PHB4_PEC(obj);
-    int i;
-
-    for (i = 0; i < PHB4_PEC_MAX_STACKS; i++) {
-        object_initialize_child(obj, "stack[*]", &pec->stacks[i],
-                                TYPE_PNV_PHB4_PEC_STACK);
-    }
-}
-
 static void pnv_pec_realize(DeviceState *dev, Error **errp)
 {
     PnvPhb4PecState *pec = PNV_PHB4_PEC(dev);
@@ -159,29 +146,13 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    pec->num_stacks = pecc->num_stacks[pec->index];
-
-    /* Create stacks */
-    for (i = 0; i < pec->num_stacks; i++) {
-        PnvPhb4PecStack *stack = &pec->stacks[i];
-        Object *stk_obj = OBJECT(stack);
-
-        object_property_set_link(stk_obj, "pec", OBJECT(pec), &error_abort);
+    pec->num_phbs = pecc->num_phbs[pec->index];
 
-        if (defaults_enabled()) {
-            pnv_pec_default_phb_realize(stack, i, errp);
+    /* Create PHBs if running with defaults */
+    if (defaults_enabled()) {
+        for (i = 0; i < pec->num_phbs; i++) {
+            pnv_pec_default_phb_realize(pec, i, errp);
         }
-
-        /*
-         * qdev gets angry if we don't realize 'stack' here, even
-         * if stk_realize() is now empty.
-         */
-        if (!qdev_realize(DEVICE(stk_obj), NULL, errp)) {
-            return;
-        }
-    }
-    for (; i < PHB4_PEC_MAX_STACKS; i++) {
-        object_unparent(OBJECT(&pec->stacks[i]));
     }
 
     /* Initialize the XSCOM regions for the PEC registers */
@@ -227,7 +198,7 @@ static int pnv_pec_dt_xscom(PnvXScomInterface *dev, void *fdt,
     _FDT((fdt_setprop(fdt, offset, "compatible", pecc->compat,
                       pecc->compat_size)));
 
-    for (i = 0; i < pec->num_stacks; i++) {
+    for (i = 0; i < pec->num_phbs; i++) {
         int phb_id = pnv_phb4_pec_get_phb_id(pec, i);
         int stk_offset;
 
@@ -263,11 +234,11 @@ static uint32_t pnv_pec_xscom_nest_base(PnvPhb4PecState *pec)
 }
 
 /*
- * PEC0 -> 1 stack
- * PEC1 -> 2 stacks
- * PEC2 -> 3 stacks
+ * PEC0 -> 1 phb
+ * PEC1 -> 2 phb
+ * PEC2 -> 3 phbs
  */
-static const uint32_t pnv_pec_num_stacks[] = { 1, 2, 3 };
+static const uint32_t pnv_pec_num_phbs[] = { 1, 2, 3 };
 
 static void pnv_pec_class_init(ObjectClass *klass, void *data)
 {
@@ -292,14 +263,13 @@ static void pnv_pec_class_init(ObjectClass *klass, void *data)
     pecc->stk_compat = stk_compat;
     pecc->stk_compat_size = sizeof(stk_compat);
     pecc->version = PNV_PHB4_VERSION;
-    pecc->num_stacks = pnv_pec_num_stacks;
+    pecc->num_phbs = pnv_pec_num_phbs;
 }
 
 static const TypeInfo pnv_pec_type_info = {
     .name          = TYPE_PNV_PHB4_PEC,
     .parent        = TYPE_DEVICE,
     .instance_size = sizeof(PnvPhb4PecState),
-    .instance_init = pnv_pec_instance_init,
     .class_init    = pnv_pec_class_init,
     .class_size    = sizeof(PnvPhb4PecClass),
     .interfaces    = (InterfaceInfo[]) {
diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index 2be56b7afd..e750165e77 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -200,10 +200,8 @@ struct PnvPhb4PecState {
     uint64_t pci_regs[PHB4_PEC_PCI_REGS_COUNT];
     MemoryRegion pci_regs_mr;
 
-    /* Stacks */
-    #define PHB4_PEC_MAX_STACKS     3
-    uint32_t num_stacks;
-    PnvPhb4PecStack stacks[PHB4_PEC_MAX_STACKS];
+    /* PHBs */
+    uint32_t num_phbs;
 
     PnvChip *chip;
 };
@@ -221,7 +219,7 @@ struct PnvPhb4PecClass {
     const char *stk_compat;
     int stk_compat_size;
     uint64_t version;
-    const uint32_t *num_stacks;
+    const uint32_t *num_phbs;
 };
 
 #endif /* PCI_HOST_PNV_PHB4_H */
-- 
2.33.1


