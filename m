Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8867748A4C9
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 02:11:21 +0100 (CET)
Received: from localhost ([::1]:33302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n75h1-0005oF-Ew
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 20:11:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n75SU-0007xW-P7; Mon, 10 Jan 2022 19:56:19 -0500
Received: from [2607:f8b0:4864:20::935] (port=43991
 helo=mail-ua1-x935.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n75SS-0003qq-Uz; Mon, 10 Jan 2022 19:56:18 -0500
Received: by mail-ua1-x935.google.com with SMTP id i5so26818274uaq.10;
 Mon, 10 Jan 2022 16:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oXeRa2YVdVyRTPRwNoUBdqSeQL7uUe+pqentQnxEjHk=;
 b=cH7bqokoMtlmCC9GM95aSJqcuiNHi3jtNdeVqEq84J7KYkw88BuyXlRfaOU5XuJS++
 4Az/qtxeu7WkU0xO6W0ThVuf1qSgDo237pivbOL4b3be4xpBIiIiYR2fzzvJHHFf3akD
 fU91OwHO3h5dvpMxWvNq4GHy2MXN9daZmXTEQq3OBRiS4qNhtqZSmpC+rAESuGlDRQux
 SuJsPg0Dp/uicZQyLOUOfpr6O+H9Sv8rikf6OKug6G+RcyN62WvQ4OZOWaSNFeqt+M3l
 5tLKFytM5BTxfjs1YhqSGqC+/ZMcLTy5FPLVwDXCzFHXsbUeb+kwc4Nr3AabTZAxma2v
 BrjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oXeRa2YVdVyRTPRwNoUBdqSeQL7uUe+pqentQnxEjHk=;
 b=rhwiAI9EvnkeU5GM/ibVS3KQHgZNou5nqMk/KAvNCNw2HqMRQZIX7l7jw5fFc53Nfe
 kPlfGkSaeAaxC0rRrHP8cd5olBoTjRQEyiWL93RGkzYObGkG/HcqAnaz6XgKT3OiVft6
 Ffp757+k/kB5eZV+OC+R/Cn67qGCQHJ03l+GDBmL6WhXZYUTgFDf1oUzyDuiz9Vv30zl
 EBciAgVhcEX+wmkrPJ7/F7WTGCLqxIl99CjmjJHOvhO5FrmglE7zWyc0AyXBeoD+zH7E
 /dYUe4Pdcsrundr6RPZ6/rBCpnOexOPCQM9V45QK7/c2dpByGg8vjt8ogeCT2vd10qai
 hw7A==
X-Gm-Message-State: AOAM533HB/WRtvO60B7YAPtcJC3ov3z0ajtarkO4rBJlxuQupkTGZO41
 lxG0Ad4ByEW2Kh/Lf+ac4wCLWslW/4dAmgYj
X-Google-Smtp-Source: ABdhPJxFNo7vRSnvK5zjQsQSv29mYH9B9HcEiNNVi7Abz8yzQe9tc7KTitfpUhdavhfM4KfTtc67Tg==
X-Received: by 2002:a67:e905:: with SMTP id c5mr975664vso.68.1641862575667;
 Mon, 10 Jan 2022 16:56:15 -0800 (PST)
Received: from rekt.COMFAST ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id x190sm4645562vkf.56.2022.01.10.16.56.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 16:56:15 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 4/5] ppc/pnv: Introduce user creatable pnv-phb4 devices
Date: Mon, 10 Jan 2022 21:55:57 -0300
Message-Id: <20220111005558.549685-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220111005558.549685-1-danielhb413@gmail.com>
References: <20220111005558.549685-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::935
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::935;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x935.google.com
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

- when dealing with an user created pnv-phb4 (detected by checking if
phb->stack is NULL at the start of phb4_realize()), retrieve its stack
and initialize its properties as done in stk_realize();

- use 'defaults_enabled()' in stk_realize() to avoid creating and
initializing a 'stack->phb' qdev that might be overwritten by an user
created pnv-phb4 device.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c     | 75 +++++++++++++++++++++++++++++++++++++-
 hw/pci-host/pnv_phb4_pec.c |  5 +++
 hw/ppc/pnv.c               |  2 +
 3 files changed, 80 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 3ffa8f51e9..10f8d6a919 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1487,15 +1487,86 @@ static void pnv_phb4_instance_init(Object *obj)
     object_initialize_child(obj, "source", &phb->xsrc, TYPE_XIVE_SOURCE);
 }
 
+static PnvPhb4PecStack *pnv_phb4_get_stack(int chip_id, int index,
+                                           Error **errp)
+{
+    PnvMachineState *pnv = PNV_MACHINE(qdev_get_machine());
+    PnvChip *chip = pnv_get_chip(pnv, chip_id);
+    Pnv9Chip *chip9 = PNV9_CHIP(chip);
+    int i, j;
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
+    Error *local_err = NULL;
     int nr_irqs;
     char name[32];
 
-    assert(phb->stack);
+    /* User created PHB */
+    if (!phb->stack) {
+        PnvMachineState *pnv = PNV_MACHINE(qdev_get_machine());
+        PnvChip *chip = pnv_get_chip(pnv, phb->chip_id);
+        PnvPhb4PecClass *pecc;
+        BusState *s;
+
+        if (!chip) {
+            error_setg(errp, "invalid chip id: %d", phb->chip_id);
+            return;
+        }
+
+        phb->stack = pnv_phb4_get_stack(phb->chip_id, phb->phb_id,
+                                        &local_err);
+        if (local_err) {
+            error_propagate(errp, local_err);
+            return;
+        }
+
+        /* All other phb properties but 'version' are already set */
+        pecc = PNV_PHB4_PEC_GET_CLASS(phb->stack->pec);
+        object_property_set_int(OBJECT(phb), "version", pecc->version,
+                                &error_fatal);
+
+        /*
+         * Assign stack->phb since pnv_phb4_update_regions() uses it
+         * to access the phb.
+         */
+        phb->stack->phb = phb;
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
 
     pnv_phb4_XSCOM_init(phb);
 
@@ -1600,7 +1671,7 @@ static void pnv_phb4_class_init(ObjectClass *klass, void *data)
     dc->realize         = pnv_phb4_realize;
     device_class_set_props(dc, pnv_phb4_properties);
     set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
-    dc->user_creatable  = false;
+    dc->user_creatable  = true;
 
     xfc->notify         = pnv_phb4_xive_notify;
 }
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index d4c52a5d28..dfd25831d5 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -19,6 +19,7 @@
 #include "hw/pci/pci_bus.h"
 #include "hw/ppc/pnv.h"
 #include "hw/qdev-properties.h"
+#include "sysemu/sysemu.h"
 
 #include <libfdt.h>
 
@@ -282,6 +283,10 @@ static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
     PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
     int phb_id = pnv_phb4_pec_get_phb_id(pec, stack->stack_no);
 
+    if (!defaults_enabled()) {
+        return;
+    }
+
     stack->phb = PNV_PHB4(qdev_new(TYPE_PNV_PHB4));
 
     object_property_set_int(OBJECT(stack->phb), "chip-id", pec->chip_id,
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


