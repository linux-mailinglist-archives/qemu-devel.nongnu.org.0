Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0CC56BAC7
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 15:30:40 +0200 (CEST)
Received: from localhost ([::1]:32802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9o47-000191-E9
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 09:30:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9nzI-0002zF-MY; Fri, 08 Jul 2022 09:25:42 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32]:34425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9nzE-000741-Rk; Fri, 08 Jul 2022 09:25:38 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-10bffc214ffso18508483fac.1; 
 Fri, 08 Jul 2022 06:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uhvOGIr9KoQIZ8UozVsdv7ibmMjyavjLyXmFf8ZJR50=;
 b=SzCwMi+ntllHkUSWA3CVDMCb7Lh3sFGSOss8WBGk+nZ0IdOFDfrBZIkrjs5kOLPC6X
 q/ljHV46TTErlegGy44J/4fCZz+j9PlIdjugRJo8IFWanDz0vmKfh7+G8ZFlF3edHL/X
 o1gO93v2IgWG5/8NHRjD2DXjZ6OPi+eoNugUU6z655d++PXxy/dOtWBv/6lwPl3P2Ime
 nv9u++uYLikMg0yW1aSlL6XawrpmsjNRkOEVYzx1LvNvpph8MXxGBdlhfnziFwn2CHM2
 U5xmnFpPz6g59VqaB67dNcZSL0NrtaSExA8cSk4SIEevnSsZU6tQLNg0kBUs9FTgmLL6
 o3Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uhvOGIr9KoQIZ8UozVsdv7ibmMjyavjLyXmFf8ZJR50=;
 b=JRWnou01oVmIRljNmcRHKYmJIWiEhC+d6KKmQZ64DxwAbk7OwgwDTmICDzco4dbLbf
 gMYJPFN1uv+LSt47ABIZbNhhbiatu+UKH/sYS4XxByR79NUc6HvZExHcdLYe09ggfEli
 8BSJoXrMG5yNg4MuaqBkPvBXkbHh0bkgs8qsN5l1TGGqOB3RkzbKA+93I1ka8GGosnRO
 d54VBzxFeaQWVajrPcjUfnihxo6M12x9reYsPX+enjIFTBZ/Hc+kuWhOgxaBzUw8n2/H
 RCRIa6Mguvlbbj326byqZplKmfG7lypCKdcUlnNpDVXHvHWNen80Y3DvmiMVJbEzFvtl
 YEBA==
X-Gm-Message-State: AJIora8PLA73oRNIUCnReG5hc/hVQ+z/vG+Zv3o5JC1SLDh/Rat4S+zI
 sOJPihF0K31tRBHEfYitZM8qxeJhDWM=
X-Google-Smtp-Source: AGRyM1tR//QMTMEfvteiKXWNFWXvG7RyF+Nwba1KrfX79EfXHAFxDFqrf+Pmos39cwmBVweBKNe58Q==
X-Received: by 2002:a05:6870:8193:b0:10b:de9b:90b5 with SMTP id
 k19-20020a056870819300b0010bde9b90b5mr6204185oae.124.1657286735241; 
 Fri, 08 Jul 2022 06:25:35 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 f108-20020a9d03f5000000b0060c00c3fde5sm18435797otf.72.2022.07.08.06.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 06:25:35 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH 04/10] ppc/pnv: add helpers for pnv-phb user devices
Date: Fri,  8 Jul 2022 10:25:16 -0300
Message-Id: <20220708132522.581382-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708132522.581382-1-danielhb413@gmail.com>
References: <20220708132522.581382-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x32.google.com
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

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb.c | 69 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index 826c0c144e..da779dc298 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -18,6 +18,37 @@
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
+static void pnv_parent_bus_fixup(DeviceState *parent, DeviceState *child)
+{
+    BusState *parent_bus = qdev_get_parent_bus(parent);
+
+    if (!qdev_set_parent_bus(child, parent_bus, &error_fatal)) {
+        return;
+    }
+}
+
 /*
  * Attach a root port device.
  *
@@ -41,6 +72,36 @@ static void pnv_phb_attach_root_port(PCIHostState *pci)
     pci_realize_and_unref(root, pci->bus, &error_fatal);
 }
 
+/*
+ * User created devices won't have the initial setup that default
+ * devices have. This setup consists of assigning a parent device
+ * (chip for PHB3, PEC for PHB4/5) that will be the QOM/bus parent
+ * of the PHB.
+ */
+static void pnv_phb_user_device_init(PnvPHB *phb)
+{
+    PnvMachineState *pnv = PNV_MACHINE(qdev_get_machine());
+    PnvChip *chip = pnv_get_chip(pnv, phb->chip_id);
+    Object *parent = NULL;
+
+    if (!chip) {
+        error_setg(&error_fatal, "invalid chip id: %d", phb->chip_id);
+        return;
+    }
+
+    /*
+     * Reparent user created devices to the chip to build
+     * correctly the device tree. pnv_xscom_dt() needs every
+     * PHB to be a child of the chip to build the DT correctly.
+     *
+     * TODO: for version 3 we're still parenting the PHB with the
+     * chip. We should parent with a (so far not implemented)
+     * PHB3 PEC device.
+     */
+    pnv_parent_qom_fixup(parent, OBJECT(phb), phb->phb_id);
+    pnv_parent_bus_fixup(DEVICE(chip), DEVICE(phb));
+}
+
 static void pnv_phb_realize(DeviceState *dev, Error **errp)
 {
     PnvPHB *phb = PNV_PHB(dev);
@@ -74,6 +135,14 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
     object_property_set_uint(phb->backend, "chip-id", phb->chip_id, errp);
     object_property_set_link(phb->backend, "phb-base", OBJECT(phb), errp);
 
+    /*
+     * Handle user created devices. User devices will not have a
+     * pointer to a chip (PHB3) and a PEC (PHB4/5).
+     */
+    if (!phb->chip && !phb->pec) {
+        pnv_phb_user_device_init(phb);
+    }
+
     if (phb->version == 3) {
         object_property_set_link(phb->backend, "chip",
                                  OBJECT(phb->chip), errp);
-- 
2.36.1


