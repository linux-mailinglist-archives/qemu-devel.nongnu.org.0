Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 276BB485AA7
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 22:32:05 +0100 (CET)
Received: from localhost ([::1]:40484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Dt6-0005ob-6d
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 16:32:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n5Dlr-0002lv-CZ; Wed, 05 Jan 2022 16:24:36 -0500
Received: from [2607:f8b0:4864:20::929] (port=45733
 helo=mail-ua1-x929.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n5Dlk-0007x5-U9; Wed, 05 Jan 2022 16:24:34 -0500
Received: by mail-ua1-x929.google.com with SMTP id az37so783688uab.12;
 Wed, 05 Jan 2022 13:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8J+W4gBJgG6/8YYA5oT/giuQ5hd3QEpiDXE8R+5Jke4=;
 b=H3PsJhR2Felt64u+otvHouxj6hopiqL4sxw77PV9mfczBAE/pDFauf0hAnKLiz9NzM
 92JYfl7Gj9Jn0VCOAxCeFrX7nJF00ME0oac08Tzr7J84IYRhdP5mp3izmbiyMiLrlyP0
 1aNO2/SSdBs/vs8xpz2FqTcP6xR274JMxpxCdLseY65EcBrfvXeHfQ8Vw0wJLh2xBBep
 lVQvtUCKx4hIi5vs0Z6R6uTm6a+rdDzdBGqTLhCMDrE8orBay9QF+E09hyXj3tYIUmHD
 8P7KlWbG5utFjCtqPjBy61izzj0ab/WbYyd48W03uMKx2wcG5ElS6ILftaQNTusqzIBv
 XIiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8J+W4gBJgG6/8YYA5oT/giuQ5hd3QEpiDXE8R+5Jke4=;
 b=LvdS+JBiaRt0ZitPrZ3R6f1YYxxkW4r5Ku9cuJb6QWsn4oCAuihRxMarYYB7jErW8I
 4e+ECcR8w55rYYlLenI4GqZ2oU9nlsUGzEoi3GoIatuAR84WBxXYJ21ZOsxt2BkagLkp
 d+jLrloXk2mztHyFd/6gRy1+yJUyzJfi1T91IXJCYmwxacItoqc6Thjlgh4FLGYroZ2U
 I/cTn32nX83mbGLhvaX736CADhR4bk0cHNYUgKgeLb+PMoGuRL1jpGYQ0VNGwU506z4H
 SZ6jUBWUPpRxM7c4JwLa2anpZN9ecn90J3eFLfmTdbr6mRLgQBueBoHqEAA6SjuHQQhH
 3J+Q==
X-Gm-Message-State: AOAM533IotTo0OZqzoLLt2xPy5Hwh1yFIN2FnZFnm9yLQjw+r96mUFXg
 y/3T901hxs0nNIgIC2uk3ofGUteDk74=
X-Google-Smtp-Source: ABdhPJzGbNJdl6q9N47ku0gXa3Hrpo8eSpQ5V3UjHFKjOhMesETQKzC4HpNrgEb9wg+b4cA9+PJxMg==
X-Received: by 2002:a05:6102:c4a:: with SMTP id
 y10mr7354137vss.80.1641417867783; 
 Wed, 05 Jan 2022 13:24:27 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7])
 by smtp.gmail.com with ESMTPSA id m5sm65922vke.43.2022.01.05.13.24.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 13:24:27 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 17/18] ppc/pnv: Introduce user creatable pnv-phb4 devices
Date: Wed,  5 Jan 2022 18:23:37 -0300
Message-Id: <20220105212338.49899-18-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220105212338.49899-1-danielhb413@gmail.com>
References: <20220105212338.49899-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::929
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::929;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x929.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
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
index 430a5c10f4..1c2334d491 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1236,6 +1236,41 @@ static void pnv_phb4_instance_init(Object *obj)
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
+            if (index == pnv_phb4_pec_get_phb_id(pec, j)) {
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
@@ -1243,8 +1278,49 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
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
@@ -1298,6 +1374,10 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
     pnv_phb4_update_xsrc(phb);
 
     phb->qirqs = qemu_allocate_irqs(xive_source_set_irq, xsrc, xsrc->nr_irqs);
+
+    if (stack_init_xscom) {
+        pnv_pec_init_stack_xscom(stack);
+    }
 }
 
 static const char *pnv_phb4_root_bus_path(PCIHostState *host_bridge,
@@ -1347,7 +1427,7 @@ static void pnv_phb4_class_init(ObjectClass *klass, void *data)
     dc->realize         = pnv_phb4_realize;
     device_class_set_props(dc, pnv_phb4_properties);
     set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
-    dc->user_creatable  = false;
+    dc->user_creatable  = true;
 
     xfc->notify         = pnv_phb4_xive_notify;
 }
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 41c79d24c4..4417beb97d 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -573,13 +573,13 @@ static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
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
index fe7e67e73a..837146a2fb 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1960,6 +1960,8 @@ static void pnv_machine_power9_class_init(ObjectClass *oc, void *data)
     pmc->compat = compat;
     pmc->compat_size = sizeof(compat);
     pmc->dt_power_mgt = pnv_dt_power_mgt;
+
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_PNV_PHB4);
 }
 
 static void pnv_machine_power10_class_init(ObjectClass *oc, void *data)
-- 
2.33.1


