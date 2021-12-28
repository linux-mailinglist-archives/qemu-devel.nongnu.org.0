Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D98480CEB
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Dec 2021 21:00:49 +0100 (CET)
Received: from localhost ([::1]:50714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2IeO-0001R9-VD
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 15:00:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n2IJk-0003yX-Cc; Tue, 28 Dec 2021 14:39:28 -0500
Received: from [2607:f8b0:4864:20::72a] (port=38737
 helo=mail-qk1-x72a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n2IJI-00047H-7s; Tue, 28 Dec 2021 14:39:12 -0500
Received: by mail-qk1-x72a.google.com with SMTP id i187so15919071qkf.5;
 Tue, 28 Dec 2021 11:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ohoSIe9dPQzV0x/ZlZpIkKXNEFON8gaCRXDiudVk8ZA=;
 b=WnWKekmSDbhk+zq2LaKXG6U0yxZw4RXH3IMyVN5RBHFUVQrjpkLiz07effNMzuXymZ
 i02CpXK3EwklutZ7/Bh57DBHqz6XnIYcQGFFwhUxZ1KB6kWairtHXn2ddQ/ylfcVXX46
 YMgt2Ol/SW+NC4KYgbh7g2h2sweJVIDmlmzNsSh5+gb8200rAbYbyiEa397DRew9wom7
 YfM9RiC52dN9WI/HsXVsHJd64pNT/R3wFIiapU8ZkaA+Uws69GX8D662VHeluDpSEppg
 AWlKW0GQk2n7gRyKQ9lKT7TI+1ug6Psm9fp7ZyMdP4zSposbl4A7A5hDKTSqL2OrUspJ
 64LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ohoSIe9dPQzV0x/ZlZpIkKXNEFON8gaCRXDiudVk8ZA=;
 b=pZ+3m4OrtCJTOGtl/mUXJ76gra0OJV32jTYanis1GYgNyHlvcZTyP1z2GIQC/JCcwH
 WZ7FkrzqTqAAVPe39MKLINb6gCyYUksmcPL+dULl233luUqEB63FZHSbkG6gbAFSDs0U
 Oh0V24sDq5V9ekZMB28tpn5+Wmuwi529+dqC4Y3k64I5j6QDfaaN9BaUj0Q2yT5SfjyH
 HzCvv2Z8hbIC0jfSzzZEIp/Ou/1XUvTywJr1navgzCzwuGRe+CsH5NTgqolfLSha4qT0
 IXN2KJdQsBFIXg3HWB9XQQMTSsmDVovBA26tHdeaKokkYKW7W+byfiPoFN3pNjELNIrl
 QzNQ==
X-Gm-Message-State: AOAM530mdTkv8ojQtPoI1dTdTex/2JHOD4yx6T+y28X56pN8JlwpT195
 xmXRfcUlcEo0ML9nr5tYPMjS3upfBE4=
X-Google-Smtp-Source: ABdhPJyab3HBsTCyHMtrYlttL/e8HeOoNLeBx57tMVQqlHf+ZGR4KW39rkj3UkP3+bzfj3mNsMHtSg==
X-Received: by 2002:a05:620a:4e8:: with SMTP id
 b8mr16491211qkh.366.1640720326654; 
 Tue, 28 Dec 2021 11:38:46 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:7ce4:b718:2cc0:32df:97ee])
 by smtp.gmail.com with ESMTPSA id r20sm16924059qkp.21.2021.12.28.11.38.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 11:38:46 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/17] ppc/pnv: Introduce user creatable pnv-phb4 devices
Date: Tue, 28 Dec 2021 16:38:04 -0300
Message-Id: <20211228193806.1198496-16-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211228193806.1198496-1-danielhb413@gmail.com>
References: <20211228193806.1198496-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::72a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x72a.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

This patch introduces pnv-phb4 user creatable devices that are created
in a similar manner as pnv-phb3 devices, allowing the user to interact
with the PHBs directly instead of creating PCI Express Controllers that
will create a certain amount of PHBs per controller index.

First thing we need is to discover which stack will host the created
PHB, which is done by the new pnv_phb4_get_stack() function. During
pnv_phb4_realize() we'll inspect phb->stack to see if we're dealing with
an user creatable device or not. When using default settings, the
automatically created PHB4 devices will be realized with phb->stack
already assigned beforehand during PEC realize. In case we're dealing
with an user device, find its stack, set the PHB attributes based on the
stack it belongs and assign the PHB to the stack.

The xscom stack initialization takes place in pnv_pec_stk_realize() when
using default settings, but at that point we aren't aware of any user
PHB4 devices that will belong to the stack. In that case we'll postpone
xscom stack init until the the end of pnv_phb4_realize(), after all the
memory mappings of the PHB are done.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c     | 84 +++++++++++++++++++++++++++++++++++++-
 hw/pci-host/pnv_phb4_pec.c | 12 +++---
 hw/ppc/pnv.c               |  2 +
 3 files changed, 90 insertions(+), 8 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 5b2f644662..7b53c12b7c 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1244,6 +1244,41 @@ static void pnv_phb4_instance_init(Object *obj)
     object_initialize_child(obj, "source", &phb->xsrc, TYPE_XIVE_SOURCE);
 }
 
+static PnvPhb4PecStack *pnv_phb4_get_stack(PnvChip *chip, PnvPHB4 *phb,
+                                           Error **errp)
+{
+    Pnv9Chip *chip9 = NULL;
+    int chip_id = phb->chip_id;
+    int index = phb->phb_id;
+    int i, j;
+
+    if (chip->num_pecs == 0) {
+        /* Something weird happened. Bail out */
+        error_setg(errp, "chip id %d has no PCIE controllers", chip_id);
+        return NULL;
+    }
+
+    chip9 = PNV9_CHIP(chip);
+
+    for (i = 0; i < chip->num_pecs; i++) {
+        /*
+         * For each PEC, check the amount of stacks it supports
+         * and see if the given phb4 index matches a stack.
+         */
+        PnvPhb4PecState *pec = &chip9->pecs[i];
+
+        for (j = 0; j < pec->num_stacks; j++) {
+            if (index == pnv_pec_get_phb_id(pec, j)) {
+                return &pec->stacks[j];
+            }
+        }
+    }
+
+    error_setg(errp, "pnv-phb4 index %d didn't match any existing PEC",
+               chip_id);
+    return NULL;
+}
+
 static void pnv_phb4_realize(DeviceState *dev, Error **errp)
 {
     PnvPHB4 *phb = PNV_PHB4(dev);
@@ -1251,8 +1286,49 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
     XiveSource *xsrc = &phb->xsrc;
     int nr_irqs;
     char name[32];
+    PnvPhb4PecStack *stack = NULL;
+    bool stack_init_xscom = false;
+    Error *local_err = NULL;
 
-    assert(phb->stack);
+    /* User created PHB */
+    if (!phb->stack) {
+        PnvMachineState *pnv = PNV_MACHINE(qdev_get_machine());
+        PnvChip *chip = pnv_get_chip(pnv, phb->chip_id);
+        BusState *s;
+
+        if (!chip) {
+            error_setg(errp, "invalid chip id: %d", phb->chip_id);
+            return;
+        }
+
+        stack = pnv_phb4_get_stack(chip, phb, &local_err);
+        if (local_err) {
+            error_propagate(errp, local_err);
+            return;
+        }
+
+        object_property_set_int(OBJECT(phb), "index",
+                                phb->phb_id, &error_abort);
+
+        pnv_phb4_set_stack_phb_props(stack, phb);
+
+        /* Assign the phb to the stack */
+        stack->phb = phb;
+
+        /*
+         * Reparent user created devices to the chip to build
+         * correctly the device tree.
+         */
+        pnv_chip_parent_fixup(chip, OBJECT(phb), phb->phb_id);
+
+        s = qdev_get_parent_bus(DEVICE(chip));
+        if (!qdev_set_parent_bus(DEVICE(phb), s, &local_err)) {
+            error_propagate(errp, local_err);
+            return;
+        }
+
+        stack_init_xscom = true;
+    }
 
     /* Set the "big_phb" flag */
     phb->big_phb = phb->phb_id == 0 || phb->phb_id == 3;
@@ -1305,6 +1381,10 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
         pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb),
                                  TYPE_PNV_PHB4_ROOT_PORT);
     }
+
+    if (stack_init_xscom) {
+        pnv_pec_init_stack_xscom(stack);
+    }
 }
 
 static const char *pnv_phb4_root_bus_path(PCIHostState *host_bridge,
@@ -1416,7 +1496,7 @@ static void pnv_phb4_class_init(ObjectClass *klass, void *data)
     dc->realize         = pnv_phb4_realize;
     device_class_set_props(dc, pnv_phb4_properties);
     set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
-    dc->user_creatable  = false;
+    dc->user_creatable  = true;
 
     xfc->notify         = pnv_phb4_xive_notify;
 }
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index aa93ad3f10..27973779c5 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -574,13 +574,13 @@ static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
                           &pnv_pec_stk_pci_xscom_ops, stack, name,
                           PHB4_PEC_PCI_STK_REGS_COUNT);
 
-    /* PHB pass-through */
-    pnv_phb4_set_stack_phb_props(stack, stack->phb);
-    if (!sysbus_realize(SYS_BUS_DEVICE(&stack->phb), errp)) {
-        return;
+    /*
+     * There is no guarantee that stack->phb will be available
+     * at this point.
+     */
+    if (stack->phb) {
+        pnv_pec_init_stack_xscom(stack);
     }
-
-    pnv_pec_init_stack_xscom(stack);
 }
 
 static Property pnv_pec_stk_properties[] = {
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index bf2607446a..e93e77cb2e 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -2270,6 +2270,8 @@ static void pnv_machine_power9_class_init(ObjectClass *oc, void *data)
                                   pnv_machine_get_endian, pnv_machine_set_endian);
     object_class_property_set_description(oc, "endianness",
                               "Change CPU initial endianness (default is big)");
+
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_PNV_PHB4);
 }
 
 static void pnv_machine_power10_class_init(ObjectClass *oc, void *data)
-- 
2.33.1


