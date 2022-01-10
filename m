Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 520B7489B61
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 15:37:32 +0100 (CET)
Received: from localhost ([::1]:50462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6vnf-0004dO-4t
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 09:37:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n6vkJ-0001PI-2e; Mon, 10 Jan 2022 09:34:03 -0500
Received: from [2607:f8b0:4864:20::a30] (port=40748
 helo=mail-vk1-xa30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n6vkG-0007Nf-Eu; Mon, 10 Jan 2022 09:34:01 -0500
Received: by mail-vk1-xa30.google.com with SMTP id 78so8232462vkz.7;
 Mon, 10 Jan 2022 06:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xfJWsXmrTZzuVwzW4aMjFpfQsSaczSJ2wKlEfLEivh0=;
 b=NJVvQX/CJP5RTX8X09C4bn4EPxubYKugQMHiLOfS19NCWGOv9+e+wPddhCsaILzePm
 Bw/w7ssmCN8VjZ6JeCFhsqgYtXLUC/03XaYccVNk7ZleAuO2/sKKM3EQ8qYZbyHhYxO9
 i3VNgMSElwTFfL7ZHJ+EMzI7Kqv0wlaOCQqda6ISJQwhLE+mRFvewggsYuOVkPralSPA
 ZTm9D5Yu4JG1MRtPSbxMrrGu/eaHIGqRyLQfZapadZDGoM46/mw3DKH50+1yqCVV5n9/
 lTR5rW5HniFn8+lE6AUN9Is/PcEzUKRZXE9ul9VAHNzXaOLOC6Ndr9rjSy96JYi5CmUE
 8G5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xfJWsXmrTZzuVwzW4aMjFpfQsSaczSJ2wKlEfLEivh0=;
 b=JZL3eWRY7JPa2CMV6qCA8674SPW8ikWZaNFAOwmTBUEdTPAbtwcDv/wnrwFGP0tz06
 gfjxoCPk3mTPU0CFbfVys5+3ysbCjSglRm8Z3ZckQmEWULu+XwwwmrRY43NTQSDxwxR5
 y+yvyFsoiF00nqrvf1KLTIBMJDrKNDDtVIlJymA6R0xiVIW05dMyt7eKUIBvcIW3nz+O
 a7rYOmkRuwg8w8LPfDEC8PYm3INPiEUIhJzU7MKJQLVqaDM2eUdNbRcAPnG0d9+UYUNB
 OfzkYG4puGEE4ePuhexseODWoQ4AUx46E+G2+P7z389WoFINk+eDPgkAc+jhRnu9KHKh
 pHhg==
X-Gm-Message-State: AOAM530SyHfwXF2vtEH9YwdQzQzp0TwrZz/kzzIPvZc7yyVSYBidEfuu
 CbEz0cXBYge/yqhZfMOcoJEM8lwIdLEzFpfr
X-Google-Smtp-Source: ABdhPJzYeDg5e2XptTUgULYsRYa38Wi9BcAsltY8WPH0NeFp29UOWMTTzaO4IgTjjsm3W0ew0zmZYg==
X-Received: by 2002:a05:6122:889:: with SMTP id
 9mr27702579vkf.21.1641825237245; 
 Mon, 10 Jan 2022 06:33:57 -0800 (PST)
Received: from rekt.COMFAST ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id o11sm3709677vkf.41.2022.01.10.06.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 06:33:57 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/10] pnv_phb4.c: introduce pnv_phb4_set_stack_phb_props()
Date: Mon, 10 Jan 2022 11:33:37 -0300
Message-Id: <20220110143346.455901-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220110143346.455901-1-danielhb413@gmail.com>
References: <20220110143346.455901-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::a30;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa30.google.com
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

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c         | 19 +++++++++++++++++++
 hw/pci-host/pnv_phb4_pec.c     |  7 +------
 include/hw/pci-host/pnv_phb4.h |  1 +
 3 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 83dedc878a..4c045fd8cd 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1158,6 +1158,25 @@ static AddressSpace *pnv_phb4_dma_iommu(PCIBus *bus, void *opaque, int devfn)
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
index f3e4fa0c82..97b9d4cb0e 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -582,12 +582,7 @@ static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
     pnv_xscom_region_init(&stack->phb_regs_mr, OBJECT(&stack->phb),
                           &pnv_phb4_xscom_ops, &stack->phb, name, 0x40);
 
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


