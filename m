Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90071485ACC
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 22:36:54 +0100 (CET)
Received: from localhost ([::1]:55180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Dxl-0007ob-Nb
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 16:36:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n5DlZ-0002BZ-I8; Wed, 05 Jan 2022 16:24:17 -0500
Received: from [2607:f8b0:4864:20::930] (port=35451
 helo=mail-ua1-x930.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n5DlX-0007uC-Mb; Wed, 05 Jan 2022 16:24:17 -0500
Received: by mail-ua1-x930.google.com with SMTP id o20so881038uat.2;
 Wed, 05 Jan 2022 13:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OiYkqSDKOE1NTw5JW2RxhKqXvhzage1YvtWyJkiZQbs=;
 b=U+KM5SL/+E9RxrAGG5yW+cXiWjI4NiRElzmEIQu9vmUVH4Apvzh96rEDDzZoESfRYY
 zOU8GYTA8capreulqedjw29TsDcHSM9tQc3vDFT9CiwSCBq8oVrTL3Pvl94HcUKtRwcg
 OXTn78jpFWobKCg/LyVw2LHB03Mz2KsRdGOJbQZMbqZ+lnjum7HReNazBxQXauXfJ4c9
 heVXKqHEPXnq+LD3NsWb0enh1KZ7AEvGESd5iW0h79CMkyK4e/W3w/Wl9K5OSqmoXfid
 54nyCwHYOxukK/WzgRxon7qrug2DP84cokv2TNcQnOeAV/zpk+c1ynOxXmaMzFoNG1nv
 l/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OiYkqSDKOE1NTw5JW2RxhKqXvhzage1YvtWyJkiZQbs=;
 b=iu2F9hVSohwUKhjPVz3J+YO980xI24gVe5+4Awc75K4UnoWbwRDzb5ovofMWv4N+Us
 r6uDTXWGMFPxdCSzV/ju/VAoeg5eTzIwo9ZbATsuJWOZAgs+HlejPL6ELb25gb4jL3cd
 W7roPoBZmLT2q6bshTW5JfmHg1fbUFYVI0oFDVVHk9hxG/yYOhinx7NR/IsfnZH8qPK6
 B2tGYAElKT5hjyP80kRyNRMPZooy052nkm65WuXcXWvq5cnsrNH7YG4BXJvQdq+1chhP
 IZcQbbPm4/AmmGO9mC8Af0uKDEvJP5YWf0Mk0WHj9OmmmbmvGXfmlbQ5cH6MoHaFOpKw
 NsSw==
X-Gm-Message-State: AOAM53003IuA6WFOF3Ia5lROKPCNtjkMGbH6lhVcFKUyZW7fzIVaO3mS
 BzQe58jYdzfTejmt7W+8D22fsCs8wJ8=
X-Google-Smtp-Source: ABdhPJx2j/tZmj6SeMArvSnrnmpPztacOPd/l7JewYhLtEYa1Ot6zQFpYhm7n7DNZzcu8qL5cxkxqw==
X-Received: by 2002:ab0:3b14:: with SMTP id n20mr1665143uaw.64.1641417854535; 
 Wed, 05 Jan 2022 13:24:14 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7])
 by smtp.gmail.com with ESMTPSA id m5sm65922vke.43.2022.01.05.13.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 13:24:14 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/18] pnv_phb4.c: introduce pnv_phb4_set_stack_phb_props()
Date: Wed,  5 Jan 2022 18:23:31 -0300
Message-Id: <20220105212338.49899-12-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220105212338.49899-1-danielhb413@gmail.com>
References: <20220105212338.49899-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::930
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::930;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x930.google.com
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

We want to be able to support user creatable pnv-phb4 objects to allow
users to instantiate a powernv9 machine similar to what it is done with
powernv8.

The main difference is that pnv-phb3 devs are attached directly to the
system bus and can be created in the command line. PCI devices such as
root-ports can be explictly connected to them. This allows users to
create the phbs, assign a bus name if desired, then connect devices onto
them.

pnv-phb4 devices on the other hand are created by adding PCI Express
Controllers (PEC) that will create a certain amount of pnv-phb4 buses
depending on the PEC index used. Index 0 will create 1 phb, index 1
creates 2 phbs, index 2 creates 3 phbs. Creating all PECs from the same
chip will create 6 PHBs. This doesn't users to rename the buses, like it
is done with pnv-phb3, because there's no user control over how the
pnv-phb4 are being created - aside from the amount of phbs and in which
chips they'll reside.

This implicit relationship between PEC devices and available buses can
be tolerable for users that knows how the hardware works, but it's
annoying for Libvirt to deal with. Since there's no explicit
relationship, in the command line, between the created buses and the PCI
devices that will connect to them, the domain XML needs to make a lot of
extra assumptions regarding the relationship between regular PCI devices
and the existing PECs.

The first step to allow for user creatable pnv-phb4 devices is to
decouple the pvn-phb logic from the pnv-phb4-pec code. This patch adds a
helper called pnv_phb4_set_stack_phb_props() to remove the code from
pnv_phb4_pec.c that initiates the object properties of pnv-phb4 devices.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c         | 25 +++++++++++++++++++++++++
 hw/pci-host/pnv_phb4_pec.c     | 12 +-----------
 include/hw/pci-host/pnv_phb4.h |  1 +
 3 files changed, 27 insertions(+), 11 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 83dedc878a..6c1a33bc66 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1158,6 +1158,31 @@ static AddressSpace *pnv_phb4_dma_iommu(PCIBus *bus, void *opaque, int devfn)
     return &ds->dma_as;
 }
 
+/*
+ * Set the object properties of a phb in relation with its stack.
+ *
+ * Note: stack->pec must not be NULL.
+ */
+void pnv_phb4_set_stack_phb_props(PnvPhb4PecStack *stack,
+                                  PnvPHB4 *phb)
+{
+    PnvPhb4PecState *pec = stack->pec;
+    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
+    char name[64];
+
+    snprintf(name, sizeof(name), "xscom-pec-%d.%d-pci-stack-%d-phb",
+             pec->chip_id, pec->index, stack->stack_no);
+    pnv_xscom_region_init(&stack->phb_regs_mr, OBJECT(phb),
+                          &pnv_phb4_xscom_ops, phb, name, 0x40);
+
+    object_property_set_int(OBJECT(phb), "chip-id", pec->chip_id,
+                            &error_fatal);
+    object_property_set_int(OBJECT(phb), "version", pecc->version,
+                            &error_fatal);
+    object_property_set_link(OBJECT(phb), "stack", OBJECT(stack),
+                             &error_abort);
+}
+
 static void pnv_phb4_instance_init(Object *obj)
 {
     PnvPHB4 *phb = PNV_PHB4(obj);
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index f3e4fa0c82..057d4b07fb 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -577,17 +577,7 @@ static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
                           PHB4_PEC_PCI_STK_REGS_COUNT);
 
     /* PHB pass-through */
-    snprintf(name, sizeof(name), "xscom-pec-%d.%d-pci-stack-%d-phb",
-             pec->chip_id, pec->index, stack->stack_no);
-    pnv_xscom_region_init(&stack->phb_regs_mr, OBJECT(&stack->phb),
-                          &pnv_phb4_xscom_ops, &stack->phb, name, 0x40);
-
-    object_property_set_int(OBJECT(&stack->phb), "chip-id", pec->chip_id,
-                            &error_fatal);
-    object_property_set_int(OBJECT(&stack->phb), "version", pecc->version,
-                            &error_fatal);
-    object_property_set_link(OBJECT(&stack->phb), "stack", OBJECT(stack),
-                             &error_abort);
+    pnv_phb4_set_stack_phb_props(stack, &stack->phb);
     if (!sysbus_realize(SYS_BUS_DEVICE(&stack->phb), errp)) {
         return;
     }
diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index ea63df9676..7f5b9cc0ac 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -131,6 +131,7 @@ struct PnvPHB4 {
 
 void pnv_phb4_pic_print_info(PnvPHB4 *phb, Monitor *mon);
 void pnv_phb4_update_regions(PnvPhb4PecStack *stack);
+void pnv_phb4_set_stack_phb_props(PnvPhb4PecStack *stack, PnvPHB4 *phb);
 extern const MemoryRegionOps pnv_phb4_xscom_ops;
 
 /*
-- 
2.33.1


