Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05091489B90
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 15:49:49 +0100 (CET)
Received: from localhost ([::1]:48506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6vzY-0006zH-3v
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 09:49:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n6vkW-0002Dl-5u; Mon, 10 Jan 2022 09:34:16 -0500
Received: from [2607:f8b0:4864:20::92e] (port=33383
 helo=mail-ua1-x92e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n6vkU-0007Qp-BI; Mon, 10 Jan 2022 09:34:15 -0500
Received: by mail-ua1-x92e.google.com with SMTP id u6so23856498uaq.0;
 Mon, 10 Jan 2022 06:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=osJ7bLC41LqTuQDC5+JZVWWW1R9zePAVI5oOQEzK320=;
 b=TehVDxscGJLUbmwZTsr68AGkzj2352sDq7dckjgLSxevk8a/IWF1mKuH37GwQwPJaG
 Gb45CyMNDTjsmBviaugJ6MKEyzTfy4qOn3IBrcElTCtlDfiySkLQrIIIJZpN14RumEJX
 oJMP9rLM9zmH/ILMAontbYJvCzxdsuK/d2jbr2DfPwpAG29/rsBm2tZIEGTZw3vKuOIS
 nWTzmbqNQQOuaOJLIzpyVjEG7nzeqryn/7YwH9kzJikqMT21GZNHw6I9ssCiI0VZkiy5
 AZjXvPje2Q3z3RQQtWemakpqJTdF1bsRwfwBWAT2ZQZ8ilTXLbFVrcq0Av2BiSSZEnkG
 W+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=osJ7bLC41LqTuQDC5+JZVWWW1R9zePAVI5oOQEzK320=;
 b=EMynhdU6U9/LMBVdkw6m//CvjpsAvtfvJTlwCqRs3kRBKJVGB3oek5ufLMwT3cbbS6
 byUoC6j2bbvx9PMnfbqjUBC7Q5IsBYnsS/18hStUClVO1pZCPjUBJSbCU+OGluIi6BZF
 rWviKloyyA+2UVf8F+QwAPz8btKdikoeG8F2wDivXr6W1b8HcifY7J6V7nRzNTYYvPxG
 BqlBi/E4U4WLcZXaN7x1pZYdIXz1bVYJTg8tOgHjU6Hr/DVCsWyw7Te4jORyCHX4YGoj
 4caax655MoHTKzJePUVDRvQTJEy0fBbJ3fAHLw0aEJo3u/B2Ys4JF99+OvpFaQ2LAPjV
 EJNQ==
X-Gm-Message-State: AOAM531hPnq2IGbjU5zf6rYPKvR15iIIBo+fNxnKe1ohj5qYAYCLWoJE
 ne/GPiV1cBWv3HHsqvqgSyLWEd3qrvuDlr9T
X-Google-Smtp-Source: ABdhPJyqxNzwknSY+gRNj1UA8s6UveqVws64ZoLVx9HFzLQVBk4Mhb/YA2JhSzMm5dMETHNFskT93w==
X-Received: by 2002:ab0:3c91:: with SMTP id a17mr25291895uax.31.1641825252858; 
 Mon, 10 Jan 2022 06:34:12 -0800 (PST)
Received: from rekt.COMFAST ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id o11sm3709677vkf.41.2022.01.10.06.34.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 06:34:12 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/10] ppc/pnv: Introduce user creatable pnv-phb4 devices
Date: Mon, 10 Jan 2022 11:33:45 -0300
Message-Id: <20220110143346.455901-10-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220110143346.455901-1-danielhb413@gmail.com>
References: <20220110143346.455901-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92e;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x92e.google.com
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch introduces pnv-phb4 user creatable devices that are created
in a similar manner as pnv-phb3 devices, allowing the user to interact
with the PHBs directly instead of creating PCI Express Controllers that
will create a certain amount of PHBs per controller index.

We accomplish this by doing the following:

- add a pnv_phb4_get_stack() helper to retrieve which stack an user
created phb4 would occupy;

- if a suitable pec->stack is found, setup the phb attributes in a
similar fashion as done in pnv_phb4_pec_realize() when defaults are
enabled;

- use 'defaults_enabled()' in pnv_pec_stk_instance_init() to avoid
creating a 'stack->phb' qdev that might be overwritten by an user
created pnv-phb4 device.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c     | 86 +++++++++++++++++++++++++++++++++++++-
 hw/pci-host/pnv_phb4_pec.c | 25 ++++++-----
 hw/ppc/pnv.c               |  2 +
 3 files changed, 101 insertions(+), 12 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index fc23a96b7f..8c8f5dd0e1 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1229,15 +1229,97 @@ static void pnv_phb4_instance_init(Object *obj)
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
+        /*
+         * This is expected to happen since chip-id and index are
+         * being set by the user in the command line. Return an
+         * informative error instead of asserting.
+         */
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
     PCIHostState *pci = PCI_HOST_BRIDGE(dev);
     XiveSource *xsrc = &phb->xsrc;
+    PnvPhb4PecStack *stack = NULL;
+    Error *local_err = NULL;
     int nr_irqs;
     char name[32];
 
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
+        /*
+         * Assign the phb to the stack. If pnv_phb4_get_stack() returned
+         * stack = NULL without an error we're better of aborting.
+         */
+        g_assert(stack);
+        stack->phb = phb;
+
+        object_property_set_int(OBJECT(phb), "index",
+                                phb->phb_id, &error_abort);
+        pnv_phb4_set_stack_phb_props(stack, phb);
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
+    }
 
     /* Set the "big_phb" flag */
     phb->big_phb = phb->phb_id == 0 || phb->phb_id == 3;
@@ -1342,7 +1424,7 @@ static void pnv_phb4_class_init(ObjectClass *klass, void *data)
     dc->realize         = pnv_phb4_realize;
     device_class_set_props(dc, pnv_phb4_properties);
     set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
-    dc->user_creatable  = false;
+    dc->user_creatable  = true;
 
     xfc->notify         = pnv_phb4_xive_notify;
 }
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 5e02a51f04..1e3233e7ec 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -19,6 +19,7 @@
 #include "hw/pci/pci_bus.h"
 #include "hw/ppc/pnv.h"
 #include "hw/qdev-properties.h"
+#include "sysemu/sysemu.h"
 
 #include <libfdt.h>
 
@@ -397,15 +398,17 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
         object_property_set_int(stk_obj, "stack-no", i, &error_abort);
         object_property_set_link(stk_obj, "pec", OBJECT(pec), &error_abort);
 
-        /*
-         * stack->phb->index is dependent on the position the
-         * stack occupies in pec->stacks[]. We have this information
-         * available here via the 'i' iterator so it's convenient to
-         * do it now.
-         */
-        object_property_set_int(OBJECT(stack->phb), "index", phb_id,
-                                &error_abort);
-        pnv_phb4_set_stack_phb_props(stack, stack->phb);
+        if (defaults_enabled()) {
+            /*
+             * stack->phb->index is dependent on the position the
+             * stack occupies in pec->stacks[]. We have this information
+             * available here via the 'i' iterator so it's convenient to
+             * do it now.
+             */
+            object_property_set_int(OBJECT(stack->phb), "index", phb_id,
+                                    &error_abort);
+            pnv_phb4_set_stack_phb_props(stack, stack->phb);
+        }
 
         if (!qdev_realize(DEVICE(stk_obj), NULL, errp)) {
             return;
@@ -543,7 +546,9 @@ static void pnv_pec_stk_instance_init(Object *obj)
 {
     PnvPhb4PecStack *stack = PNV_PHB4_PEC_STACK(obj);
 
-    stack->phb = PNV_PHB4(qdev_new(TYPE_PNV_PHB4));
+    if (defaults_enabled()) {
+        stack->phb = PNV_PHB4(qdev_new(TYPE_PNV_PHB4));
+    }
 }
 
 static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
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


