Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFA7485A9D
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 22:29:52 +0100 (CET)
Received: from localhost ([::1]:35348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Dqx-0002GQ-AE
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 16:29:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n5DlJ-0001CL-Hh; Wed, 05 Jan 2022 16:24:01 -0500
Received: from [2607:f8b0:4864:20::92c] (port=35445
 helo=mail-ua1-x92c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n5DlH-0007rO-UW; Wed, 05 Jan 2022 16:24:01 -0500
Received: by mail-ua1-x92c.google.com with SMTP id o20so879813uat.2;
 Wed, 05 Jan 2022 13:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sBRv3Q9P03BWtE/MQGsjTsuM3OdgqEsjLRfGmabClws=;
 b=F4TKnBczzGGo6HKnuEXzfXhujYcdffDbd9mVdigm1YX4oGYN+BOSj3Ev5+dOdWMLdy
 UUCMBiZT168E+LMjHFCJvwrzkRAJ8gHMJBQhK8KzUvO4MxS2MLO2EiMDb0t04iAedkPL
 To8FhNU4Vo4ONsl8jf0ziRYsFL0aisDsNVq+g9z3ggturzb4kTVP1oeuSiAbB460Xr00
 FHCCtAAEzO68r+FMDW0UavIRU5EIJ1BLiNqH1lXVlTlv9PVU2eWYU9p9Fh0WcDTFkCk/
 OQaYBd74spm+LXGyoVHdv+srIyyK2/wpbhEuVG5FLmjrY25HV4BFxGiYhkgJuAxHfbE1
 Y/LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sBRv3Q9P03BWtE/MQGsjTsuM3OdgqEsjLRfGmabClws=;
 b=q6a0YD/csDZhC56Sl8U5GXHagB8s/dEx4DwdXN/Vjn5f3yjT7VyTwjHHDSexQ/fq6d
 bD9HevyR7m0OgOUoja/h2ZAYvQL4rGO+5AekHB4wA5CWn6TVnHEYTL23NpFVEXbed4DF
 P8M3GD5Q6nvL+OY8Dja+ZyMJ5C9nFDzjRKtdsTeLoV+MoGN16ITiMMDvlrb99n1U1hGH
 Wm5FcjSoYa5y7fhDvV36GHBdwBlHNQC9CcBxuljPiQrtOtNtM4cIFhRdstQphmUbawut
 OAHs+ZkEGFJsIUSN/U0m3GxRnVQkC3pypjDvpe8m7/2k6TNae2hS0QHFMPAbd2Zg0VwK
 BhEQ==
X-Gm-Message-State: AOAM5312q2mkhFoqY3tTu41M17OjO5OzRYNp+IcbnEIM6/IUyd74zYg9
 d/KHkXuLdRxsiHmV57fPpSSjY4rAHDc=
X-Google-Smtp-Source: ABdhPJzi/PYrnXtZXEtn9K00zQ/mifRtXT+dMqnRpPd7L3rWqvJMAyxzzb0begHr8COdyS3ftKkOBw==
X-Received: by 2002:a05:6102:548c:: with SMTP id
 bk12mr17334987vsb.87.1641417838604; 
 Wed, 05 Jan 2022 13:23:58 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7])
 by smtp.gmail.com with ESMTPSA id m5sm65922vke.43.2022.01.05.13.23.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 13:23:58 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/18] ppc/pnv: Attach PHB3 root port device when defaults
 are enabled
Date: Wed,  5 Jan 2022 18:23:23 -0300
Message-Id: <20220105212338.49899-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220105212338.49899-1-danielhb413@gmail.com>
References: <20220105212338.49899-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x92c.google.com
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

From: Cédric Le Goater <clg@kaod.org>

This cleanups the PHB3 model a bit more since the root port is an
independent device and it will ease our task when adding user created
PHB3s.

pnv_phb_attach_root_port() is made public in pnv.c so it can be reused
with the pnv_phb4 root port later.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb3.c         | 15 ++++++---------
 hw/ppc/pnv.c                   |  8 ++++++++
 include/hw/pci-host/pnv_phb3.h |  2 --
 include/hw/ppc/pnv.h           |  1 +
 4 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index 3467bbb5d9..fdc8d0b437 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -19,6 +19,7 @@
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "qom/object.h"
+#include "sysemu/sysemu.h"
 
 #define phb3_error(phb, fmt, ...)                                       \
     qemu_log_mask(LOG_GUEST_ERROR, "phb3[%d:%d]: " fmt "\n",            \
@@ -981,10 +982,6 @@ static void pnv_phb3_instance_init(Object *obj)
     /* Power Bus Common Queue */
     object_initialize_child(obj, "pbcq", &phb->pbcq, TYPE_PNV_PBCQ);
 
-    /* Root Port */
-    object_initialize_child(obj, "root", &phb->root, TYPE_PNV_PHB3_ROOT_PORT);
-    qdev_prop_set_int32(DEVICE(&phb->root), "addr", PCI_DEVFN(0, 0));
-    qdev_prop_set_bit(DEVICE(&phb->root), "multifunction", false);
 }
 
 static void pnv_phb3_realize(DeviceState *dev, Error **errp)
@@ -1053,10 +1050,10 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
 
     pci_setup_iommu(pci->bus, pnv_phb3_dma_iommu, phb);
 
-    /* Add a single Root port */
-    qdev_prop_set_uint8(DEVICE(&phb->root), "chassis", phb->chip_id);
-    qdev_prop_set_uint16(DEVICE(&phb->root), "slot", phb->phb_id);
-    qdev_realize(DEVICE(&phb->root), BUS(pci->bus), &error_fatal);
+    if (defaults_enabled()) {
+        pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb),
+                                 TYPE_PNV_PHB3_ROOT_PORT);
+    }
 }
 
 void pnv_phb3_update_regions(PnvPHB3 *phb)
@@ -1177,7 +1174,7 @@ static void pnv_phb3_root_port_class_init(ObjectClass *klass, void *data)
 
     device_class_set_parent_realize(dc, pnv_phb3_root_port_realize,
                                     &rpc->parent_realize);
-    dc->user_creatable = false;
+    dc->user_creatable = true;
 
     k->vendor_id = PCI_VENDOR_ID_IBM;
     k->device_id = 0x03dc;
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 9de8b83530..3a263f631a 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1156,6 +1156,14 @@ static void pnv_chip_icp_realize(Pnv8Chip *chip8, Error **errp)
     }
 }
 
+/* Attach a root port device */
+void pnv_phb_attach_root_port(PCIHostState *pci, const char *name)
+{
+    PCIDevice *root = pci_new(PCI_DEVFN(0, 0), name);
+
+    pci_realize_and_unref(root, pci->bus, &error_fatal);
+}
+
 static void pnv_chip_power8_realize(DeviceState *dev, Error **errp)
 {
     PnvChipClass *pcc = PNV_CHIP_GET_CLASS(dev);
diff --git a/include/hw/pci-host/pnv_phb3.h b/include/hw/pci-host/pnv_phb3.h
index e9c13e6bd8..2e423c3890 100644
--- a/include/hw/pci-host/pnv_phb3.h
+++ b/include/hw/pci-host/pnv_phb3.h
@@ -155,8 +155,6 @@ struct PnvPHB3 {
 
     PnvPBCQState pbcq;
 
-    PnvPHB3RootPort root;
-
     QLIST_HEAD(, PnvPhb3DMASpace) dma_spaces;
 
     PnvChip *chip;
diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index c781525277..c726288e5e 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -177,6 +177,7 @@ DECLARE_INSTANCE_CHECKER(PnvChip, PNV_CHIP_POWER10,
                          TYPE_PNV_CHIP_POWER10)
 
 PowerPCCPU *pnv_chip_find_cpu(PnvChip *chip, uint32_t pir);
+void pnv_phb_attach_root_port(PCIHostState *pci, const char *name);
 
 #define TYPE_PNV_MACHINE       MACHINE_TYPE_NAME("powernv")
 typedef struct PnvMachineClass PnvMachineClass;
-- 
2.33.1


