Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91018590517
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 18:51:13 +0200 (CEST)
Received: from localhost ([::1]:51634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMBOq-0007mM-KT
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 12:51:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oMBE7-0001Qk-DB; Thu, 11 Aug 2022 12:40:09 -0400
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c]:40867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oMBE5-0003hG-GU; Thu, 11 Aug 2022 12:40:07 -0400
Received: by mail-vs1-xe2c.google.com with SMTP id q190so18804967vsb.7;
 Thu, 11 Aug 2022 09:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=6oq1M7UnbweB3WGReo1l6aOWLG7t+q5Z5OY9Z6VeNAA=;
 b=prcDOxJHxGTFfJ1KOBiuvgByew0qFTFlWFQJNmyA3uYT2W3lA2fevJy6C6//+ODu+M
 5xazsyQkzFbt9dNTksyBanMEa3t9DqtZ6xxFWv8bMKmsvPPF5gk1MawAXxV2rV9jyaPV
 snSWMcQrpCD72LpR+GEtDLEQki6lWcEyt2Lam8c6PX32Hw285J7Tjw+LXlvLH4g4gaw3
 ZTYxdrj2nlqm6NLPXkBTu5ItTuEgB+CPMwUAzYcIz4CqiKR8bkd23THC1P0OpfqTewmF
 1Dtdh+17FhLoahzJcAeNwnHt1GPSD3fz1PDoKj8jB3zighefb95gfBYDv3dSc3spVvVl
 0urw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=6oq1M7UnbweB3WGReo1l6aOWLG7t+q5Z5OY9Z6VeNAA=;
 b=lMX46x3P0S+aBj+G/ruTMVFlzk0exoLYjIK9Jw8kBC+qeKb8PSjZDiOAtSMdlrGxz4
 0P3Vpd1T//KJ7XhPT5Ao/G2VxDOTxmdeeX1qlWG/U/sS2EQp5O82OXjnWatDYChR4X7M
 dcyez6v1aBEFfhOWYp2U+yUsfzpqv+ME8dwA8XWoECMS2k6HEs6XNDKBPdHxBXvGJebw
 RJvDnqzFNQRnko9DbTGyGi1PrFITD9d7xBhNwHTGylgSOYjmVPJV47KttBzCRlP9P0KU
 /19xtVhJrXQNTrpV8G7/4PPD5liCGrOq03hO5+HIYqpe2rkbpTApKk4oRvRlpxkojOPB
 6lRg==
X-Gm-Message-State: ACgBeo2/0zMAidcEn+ANoXKQ+fGTxnXUBlI0p1DvpUrcrF60pwypd0UB
 zcAdqMUaaFIidjHSRVQiVu4RH6f9vY0=
X-Google-Smtp-Source: AA6agR5nO6oxvcNzj1lMreyf6UwXmK9+BhWmSa1GL/lKAzlRTnyRtETJrRSlYJtHAia4tlbgUWoPjg==
X-Received: by 2002:a67:ac49:0:b0:358:576f:f51 with SMTP id
 n9-20020a67ac49000000b00358576f0f51mr13288183vsh.80.1660236003991; 
 Thu, 11 Aug 2022 09:40:03 -0700 (PDT)
Received: from balboa.COMFAST (201-43-216-47.dsl.telesp.net.br.
 [201.43.216.47]) by smtp.gmail.com with ESMTPSA id
 j9-20020a67fa49000000b00373d697e3e2sm1755013vsq.19.2022.08.11.09.40.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 09:40:03 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 v4 04/11] ppc/pnv: add helpers for pnv-phb user devices
Date: Thu, 11 Aug 2022 13:39:43 -0300
Message-Id: <20220811163950.578927-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220811163950.578927-1-danielhb413@gmail.com>
References: <20220811163950.578927-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2c;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe2c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

pnv_parent_qom_fixup() and pnv_parent_bus_fixup() are versions of the
helpers that were reverted by commit 9c10d86fee "ppc/pnv: Remove
user-created PHB{3,4,5} devices". They are needed to amend the QOM and
bus hierarchies of user created pnv-phbs, matching them with default
pnv-phbs.

A new helper pnv_phb_user_device_init() is created to handle
user-created devices setup. We're going to call it inside
pnv_phb_realize() in case we're realizing an user created device. This
will centralize all user device realated in a single spot, leaving the
realize functions of the phb3/phb4 backends untouched.

Another helper called pnv_chip_add_phb() was added to handle the
particularities of each chip version when adding a new PHB.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb.c | 75 +++++++++++++++++++++++++++++++++++++++++++
 hw/ppc/pnv.c          | 20 ++++++++++++
 include/hw/ppc/pnv.h  |  1 +
 3 files changed, 96 insertions(+)

diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index 826c0c144e..5dc44f45d1 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -18,6 +18,38 @@
 #include "hw/qdev-properties.h"
 #include "qom/object.h"
 
+
+/*
+ * Set the QOM parent of an object child. If the device state
+ * associated with the child has an id, use it as QOM id. Otherwise
+ * use object_typename[index] as QOM id.
+ */
+static void pnv_parent_qom_fixup(Object *parent, Object *child, int index)
+{
+    g_autofree char *default_id =
+        g_strdup_printf("%s[%d]", object_get_typename(child), index);
+    const char *dev_id = DEVICE(child)->id;
+
+    if (child->parent == parent) {
+        return;
+    }
+
+    object_ref(child);
+    object_unparent(child);
+    object_property_add_child(parent, dev_id ? dev_id : default_id, child);
+    object_unref(child);
+}
+
+static void pnv_parent_bus_fixup(DeviceState *parent, DeviceState *child,
+                                 Error **errp)
+{
+    BusState *parent_bus = qdev_get_parent_bus(parent);
+
+    if (!qdev_set_parent_bus(child, parent_bus, errp)) {
+        return;
+    }
+}
+
 /*
  * Attach a root port device.
  *
@@ -41,6 +73,39 @@ static void pnv_phb_attach_root_port(PCIHostState *pci)
     pci_realize_and_unref(root, pci->bus, &error_fatal);
 }
 
+/*
+ * User created devices won't have the initial setup that default
+ * devices have. This setup consists of assigning a parent device
+ * (chip for PHB3, PEC for PHB4/5) that will be the QOM/bus parent
+ * of the PHB.
+ */
+static bool pnv_phb_user_device_init(PnvPHB *phb, Error **errp)
+{
+    PnvMachineState *pnv = PNV_MACHINE(qdev_get_machine());
+    PnvChip *chip = pnv_get_chip(pnv, phb->chip_id);
+    Object *parent = NULL;
+
+    if (!chip) {
+        error_setg(errp, "invalid chip id: %d", phb->chip_id);
+        return false;
+    }
+
+    parent = pnv_chip_add_phb(chip, phb, errp);
+    if (!parent) {
+        return false;
+    }
+
+    /*
+     * Reparent user created devices to the chip to build
+     * correctly the device tree. pnv_xscom_dt() needs every
+     * PHB to be a child of the chip to build the DT correctly.
+     */
+    pnv_parent_qom_fixup(parent, OBJECT(phb), phb->phb_id);
+    pnv_parent_bus_fixup(DEVICE(chip), DEVICE(phb), errp);
+
+    return true;
+}
+
 static void pnv_phb_realize(DeviceState *dev, Error **errp)
 {
     PnvPHB *phb = PNV_PHB(dev);
@@ -74,6 +139,16 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
     object_property_set_uint(phb->backend, "chip-id", phb->chip_id, errp);
     object_property_set_link(phb->backend, "phb-base", OBJECT(phb), errp);
 
+    /*
+     * Handle user created devices. User devices will not have a
+     * pointer to a chip (PHB3) and a PEC (PHB4/5).
+     */
+    if (!phb->chip && !phb->pec) {
+        if (!pnv_phb_user_device_init(phb, errp)) {
+            return;
+        }
+    }
+
     if (phb->version == 3) {
         object_property_set_link(phb->backend, "chip",
                                  OBJECT(phb->chip), errp);
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index f9e5a3d248..2deaac17f7 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -281,6 +281,26 @@ static void pnv_dt_icp(PnvChip *chip, void *fdt, uint32_t pir,
     g_free(reg);
 }
 
+/*
+ * Adds a PnvPHB to the chip. Returns the parent obj of the
+ * PHB which varies with each version (phb version 3 is parented
+ * by the chip, version 4 and 4 are parented by the PEC
+ * device).
+ *
+ * TODO: for version 3 we're still parenting the PHB with the
+ * chip. We should parent with a (so far not implemented)
+ * PHB3 PEC device.
+ */
+Object *pnv_chip_add_phb(PnvChip *chip, PnvPHB *phb, Error **errp)
+{
+    if (phb->version == 3) {
+        return OBJECT(chip);
+    } else {
+        /* phb4 support will be added later */
+        return NULL;
+    }
+}
+
 static void pnv_chip_power8_dt_populate(PnvChip *chip, void *fdt)
 {
     static const char compat[] = "ibm,power8-xscom\0ibm,xscom";
diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index 033d907287..781d0acffa 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -231,6 +231,7 @@ struct PnvMachineState {
 };
 
 PnvChip *pnv_get_chip(PnvMachineState *pnv, uint32_t chip_id);
+Object *pnv_chip_add_phb(PnvChip *chip, PnvPHB *phb, Error **errp);
 
 #define PNV_FDT_ADDR          0x01000000
 #define PNV_TIMEBASE_FREQ     512000000ULL
-- 
2.36.1


