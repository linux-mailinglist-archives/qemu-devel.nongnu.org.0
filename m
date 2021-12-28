Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB837480CDC
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Dec 2021 20:52:17 +0100 (CET)
Received: from localhost ([::1]:56022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2IW9-0002pi-0y
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 14:52:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n2IIu-0003nZ-H5; Tue, 28 Dec 2021 14:38:39 -0500
Received: from [2607:f8b0:4864:20::f2a] (port=33303
 helo=mail-qv1-xf2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n2IIs-00045L-7M; Tue, 28 Dec 2021 14:38:35 -0500
Received: by mail-qv1-xf2a.google.com with SMTP id kk22so17335211qvb.0;
 Tue, 28 Dec 2021 11:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HY2BEZ8i4szMfC53wb4G/PMw/ni+HX+v3ma0MbUIMOo=;
 b=ILmUGo0D9mbJD/EcoV0jZuuOwWQkq5KtvVqMJDlf5EDfqFg0DcFwGT0Jp7S0tRjJZQ
 qU3H3BHAdrzDt/wUWiWqCbxKJnS5zovm9Dcmgrxw5xY2IgHGCR6JigtcLUSHahddWYpw
 hs0T8EzNowCf5wsVLKKbLcokpYzrP/iiFGX8ey+s+gIehWwauGSKk3ZoVEz7BS/hvbz0
 pk1fdDfwU/AmkgcFNXhTpZ2RLTVt5TqN8d8tZa5eJ+b2BV+EZXwGM/iQ3Ixtql6Gw6C2
 Hm23Dn2C1osAB/2KOFvDEsXrVhrm6JgGEx7y1GRSJHr6fqLoJxCfpgAkBnEvaFAQjSrw
 2rdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HY2BEZ8i4szMfC53wb4G/PMw/ni+HX+v3ma0MbUIMOo=;
 b=cz7XFNsKGZtHLu4nU2UexyTw+lQ0V+1zrR+p4u0wmm7KVj7E6DlK0YIKVCuZakTbPZ
 pTnqlb5Ps4v7Hf0ZRczobx7yrSBfdrcJP9J/lQ1ZjGm7equWUODs0cbmVJl4b9uPWr1n
 tvfSys2MXyvXXqbU116BC3DbOTDR1mZPCL06c6jOYbNe/twiaMIZB5FBLHkJRa5JENMB
 V6QB+/c+bpWDBXDOu8ZpWYI6rpewrmN3iXMBaJANBml3neldxa1KfBFH3zXxbqSeQMRf
 oI2J0T4oGal2yo7iCnzHS2b9LZJGJPgzd1fxZhPNhvgpInnVIfeoqOlkBPxCHAZZ9xn0
 0CzQ==
X-Gm-Message-State: AOAM533kBw3SvCf7VI+oAxsVNsebn3GeyUqsXGKs6qXLCSs4O6YteyUe
 ZH5TqQQjo8EybO8T3gCpAgJskQ3qtec=
X-Google-Smtp-Source: ABdhPJxNmO935OY0vhH36/YAvSoQ5fs6Osd5EDVCKUba5hW1v92LL+xDn26YAGurvGynK59lxPjNzA==
X-Received: by 2002:a05:6214:1c48:: with SMTP id
 if8mr20279459qvb.14.1640720312267; 
 Tue, 28 Dec 2021 11:38:32 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:7ce4:b718:2cc0:32df:97ee])
 by smtp.gmail.com with ESMTPSA id r20sm16924059qkp.21.2021.12.28.11.38.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 11:38:32 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/17] pnv_phb4.c: introduce pnv_phb4_set_stack_phb_props()
Date: Tue, 28 Dec 2021 16:37:57 -0300
Message-Id: <20211228193806.1198496-9-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211228193806.1198496-1-danielhb413@gmail.com>
References: <20211228193806.1198496-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf2a.google.com
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
 hw/pci-host/pnv_phb4.c         | 27 +++++++++++++++++++++++++++
 hw/pci-host/pnv_phb4_pec.c     | 14 +-------------
 include/hw/pci-host/pnv_phb4.h |  1 +
 3 files changed, 29 insertions(+), 13 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 6bd907f91a..0ea505cc94 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1164,6 +1164,33 @@ static AddressSpace *pnv_phb4_dma_iommu(PCIBus *bus, void *opaque, int devfn)
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
+    object_property_set_int(OBJECT(phb), "device-id", pecc->device_id,
+                            &error_fatal);
+    object_property_set_link(OBJECT(phb), "stack", OBJECT(stack),
+                             &error_abort);
+}
+
 static void pnv_phb4_instance_init(Object *obj)
 {
     PnvPHB4 *phb = PNV_PHB4(obj);
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 98e7ff78bd..700ee4b185 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -595,19 +595,7 @@ static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
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
-    object_property_set_int(OBJECT(&stack->phb), "device-id", pecc->device_id,
-                            &error_fatal);
-    object_property_set_link(OBJECT(&stack->phb), "stack", OBJECT(stack),
-                             &error_abort);
+    pnv_phb4_set_stack_phb_props(stack, &stack->phb);
     if (!sysbus_realize(SYS_BUS_DEVICE(&stack->phb), errp)) {
         return;
     }
diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index 629db632d9..d7838513f1 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -133,6 +133,7 @@ struct PnvPHB4 {
 
 void pnv_phb4_pic_print_info(PnvPHB4 *phb, Monitor *mon);
 void pnv_phb4_update_regions(PnvPhb4PecStack *stack);
+void pnv_phb4_set_stack_phb_props(PnvPhb4PecStack *stack, PnvPHB4 *phb);
 extern const MemoryRegionOps pnv_phb4_xscom_ops;
 
 /*
-- 
2.33.1


