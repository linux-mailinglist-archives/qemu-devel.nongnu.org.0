Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7FA480CD8
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Dec 2021 20:48:52 +0100 (CET)
Received: from localhost ([::1]:46326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2ISp-0004l4-Pq
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 14:48:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n2IIq-0003lx-9b; Tue, 28 Dec 2021 14:38:33 -0500
Received: from [2607:f8b0:4864:20::835] (port=43900
 helo=mail-qt1-x835.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n2IIo-00044m-6h; Tue, 28 Dec 2021 14:38:32 -0500
Received: by mail-qt1-x835.google.com with SMTP id q14so17033996qtx.10;
 Tue, 28 Dec 2021 11:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Nwy2ZGHqvc+k0rdub4aVFsOUVnUkdPKBQhOT8bnwF9o=;
 b=BRruy8DdRCdtUyzynSVkT7piWoZEUP1uZpxF8wYpyMyvdD5PxKnhqngyCFtpx+TTcY
 4EJPJTMzR2Fee+gIIW3PSiC+q+4NTqLAZwxkaj9anFpPvV9OE6U6CR3o42m1gax2BKKD
 UL/7BQ+nPRZc1SGV5yiFiA55Wmdn55U7QOjdKyfP+qsGQJKDmCgUIuQNSKw7kliU2ITD
 Nz35lALVVgYDb7G42+wVaZuvL79Ga7hmBNghy3Y3rzFwTkMTwm8uLj7c6/fsJ3n9FVkp
 OIIBQLOZfFi0yheWfVbiMuAxrLAooz5KxHChgoKlp5L/3RKJk/y25Nt/bKrU7YzR0WNQ
 qRsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Nwy2ZGHqvc+k0rdub4aVFsOUVnUkdPKBQhOT8bnwF9o=;
 b=ljRvrcq77JM1rr1wdl8qXPE8nn9TFlxzF8fHMyw2M1tT/euHYrjbTHmg4BUSM+dqsQ
 f1+JXkmoFEeHoYh+ZvUDLFpIZXAj/vqCdS7or7lcU+4IfjQn3Ony3iC3uXIh4MaCDI/3
 UIPNFU0enELJCggb/i18WLFZ0PPABZJ1i0d+hg6rgFFu+XzVetPuKOG6D2cb+NkVl1EW
 rdToFvBR+SKmPs1rjaJ+q8t2GSumsGuTD5exKmUV5iFzs/kDQZnxAQTfIxUXZZW7NY4k
 dkeVxlA/je9ErL5nTYxvwblbNXtOoGeEqzh89Zq+bR7V7RuQCxncS3WsnakPs9NmpwQD
 dw0Q==
X-Gm-Message-State: AOAM531cnecmK4aFi1kK2iVBa8WHUWwEdhgGAvug/KxPkDBwS98hDEes
 7IV65sDYwI5kedr/hwtVaeqRrthIkL8=
X-Google-Smtp-Source: ABdhPJzzqlz9focIPKsJodzeDKnZehCQxgVdu3i60AKGLmjDFf8iSsAOd9cStwwxWfGxKsARuP3d+Q==
X-Received: by 2002:ac8:7dcd:: with SMTP id c13mr19802345qte.133.1640720308422; 
 Tue, 28 Dec 2021 11:38:28 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:7ce4:b718:2cc0:32df:97ee])
 by smtp.gmail.com with ESMTPSA id r20sm16924059qkp.21.2021.12.28.11.38.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 11:38:28 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/17] pnv_phb4.c: attach default root port in phb4 realize()
Date: Tue, 28 Dec 2021 16:37:55 -0300
Message-Id: <20211228193806.1198496-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211228193806.1198496-1-danielhb413@gmail.com>
References: <20211228193806.1198496-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::835
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x835.google.com
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

We're adding the default pnv_phb4_root_port in
pnv_chip_power9_pec_realize() by going into each stack, from eack pec,
accessing the stack PHB and adding the port.

This will be an annoyance when trying to implement user creatable PHB4
devices because, when that happens, stack->phb is not guaranteed to be
valid at that time (we'll assign a PHB to its stack in phb4_realize(),
after stk_realize()).

Let's move the attachment of the default root port to pnv_phb4_realize()
instead. This will create all the default root ports we already create
today, and it'll be one less thing to worry about when implementing user
creatable PHB4s.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c |  7 +++++++
 hw/ppc/pnv.c           | 20 +++-----------------
 include/hw/ppc/pnv.h   |  1 +
 3 files changed, 11 insertions(+), 17 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 4554490e51..daa468b812 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -22,6 +22,7 @@
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "qom/object.h"
+#include "sysemu/sysemu.h"
 #include "trace.h"
 
 #define phb_error(phb, fmt, ...)                                        \
@@ -1224,6 +1225,12 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
     pnv_phb4_update_xsrc(phb);
 
     phb->qirqs = qemu_allocate_irqs(xive_source_set_irq, xsrc, xsrc->nr_irqs);
+
+    /* Add the default pnv-phb4-root-port */
+    if (defaults_enabled()) {
+        pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb),
+                                 TYPE_PNV_PHB4_ROOT_PORT);
+    }
 }
 
 static const char *pnv_phb4_root_bus_path(PCIHostState *host_bridge,
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 605296fab5..c88fef26cf 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1222,7 +1222,7 @@ static void pnv_chip_icp_realize(Pnv8Chip *chip8, Error **errp)
 }
 
 /* Attach a root port */
-static void pnv_phb_attach_root_port(PCIHostState *pci, const char *name)
+void pnv_phb_attach_root_port(PCIHostState *pci, const char *name)
 {
     PCIDevice *root = pci_new(PCI_DEVFN(0, 0), name);
 
@@ -1478,7 +1478,7 @@ static void pnv_chip_quad_realize(Pnv9Chip *chip9, Error **errp)
 static void pnv_chip_power9_pec_realize(PnvChip *chip, Error **errp)
 {
     Pnv9Chip *chip9 = PNV9_CHIP(chip);
-    int i, j;
+    int i;
 
     for (i = 0; i < chip->num_pecs; i++) {
         PnvPhb4PecState *pec = &chip9->pecs[i];
@@ -1500,13 +1500,6 @@ static void pnv_chip_power9_pec_realize(PnvChip *chip, Error **errp)
 
         pnv_xscom_add_subregion(chip, pec_nest_base, &pec->nest_regs_mr);
         pnv_xscom_add_subregion(chip, pec_pci_base, &pec->pci_regs_mr);
-
-        for (j = 0; j < pec->num_stacks; j++) {
-            PnvPHB4 *phb = &pec->stacks[j].phb;
-
-            pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb),
-                                     TYPE_PNV_PHB4_ROOT_PORT);
-        }
     }
 }
 
@@ -1726,7 +1719,7 @@ static void pnv_chip_power10_quad_realize(Pnv10Chip *chip10, Error **errp)
 static void pnv_chip_power10_phb_realize(PnvChip *chip, Error **errp)
 {
     Pnv10Chip *chip10 = PNV10_CHIP(chip);
-    int i, j;
+    int i;
 
     for (i = 0; i < chip->num_pecs; i++) {
         PnvPhb4PecState *pec = &chip10->pecs[i];
@@ -1748,13 +1741,6 @@ static void pnv_chip_power10_phb_realize(PnvChip *chip, Error **errp)
 
         pnv_xscom_add_subregion(chip, pec_nest_base, &pec->nest_regs_mr);
         pnv_xscom_add_subregion(chip, pec_pci_base, &pec->pci_regs_mr);
-
-        for (j = 0; j < pec->num_stacks; j++) {
-            PnvPHB4 *phb = &pec->stacks[j].phb;
-
-            pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb),
-                                     TYPE_PNV_PHB5_ROOT_PORT);
-        }
     }
 }
 
diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index 6c48fc62ff..7f2197dcc0 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -196,6 +196,7 @@ DECLARE_INSTANCE_CHECKER(PnvChip, PNV_CHIP_POWER10,
 
 PowerPCCPU *pnv_chip_find_cpu(PnvChip *chip, uint32_t pir);
 void pnv_chip_parent_fixup(PnvChip *chip, Object *obj, int index);
+void pnv_phb_attach_root_port(PCIHostState *pci, const char *name);
 
 #define TYPE_PNV_MACHINE       MACHINE_TYPE_NAME("powernv")
 typedef struct PnvMachineClass PnvMachineClass;
-- 
2.33.1


