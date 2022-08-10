Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2368858EA5D
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 12:17:40 +0200 (CEST)
Received: from localhost ([::1]:47358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLimR-0001AE-7Q
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 06:17:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oLib4-0006pU-2G; Wed, 10 Aug 2022 06:05:58 -0400
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29]:36538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oLib2-0000tC-AX; Wed, 10 Aug 2022 06:05:53 -0400
Received: by mail-vk1-xa29.google.com with SMTP id x128so4132281vke.3;
 Wed, 10 Aug 2022 03:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=XMBReZ2JhvR+Klg4IaQSVacwrD04Hbb8SBkJdEnH5O4=;
 b=KZASP0e1HEq1KGANSgPzs+FPtAgkuT/cv3IfKMxAONcybft7pebFmI2rZAScSemjVD
 ULHfU9ovdWzaAHnAf69O7fLr1Wft1+W5neK5cLfrLhiLKoSFEpLUgSeDWa/VMGdBOFTL
 v+hmREKvkZ3CVGzxcWaG/0P20B76WcrEG5gWfGTbGPBc2H84var3g2338ISDGRJBViPC
 wlSSZl+TZBXUK3dxkE8o0RmyJBV+s0Av7UTiUf/z0Ai1t0pbIbIMOIxNToKnFSgBeM91
 OTWeFcJbu0JXzBT3Zb6lGyU3zJCuJ9SQC6guWhelV90aqkU2yVaqOfKlX0eOtLOrJgYH
 XLzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=XMBReZ2JhvR+Klg4IaQSVacwrD04Hbb8SBkJdEnH5O4=;
 b=fSe4NIUJiuhUC5Wjqq/A4YKo0lLiCoJtuKEAU1x1d6jG9Tv9eHtLPstDvZDfg56m+8
 7tuxcT2QD4350By+TM1uj4PjAPnTTyCVhGnKQWZdTXhtt/STWMszGrzsCEkbeaVRqsY7
 Kzg74bBEF6T8VWfEetPGalNQK+o583L6RNZ5R4B0PyU09FSYxMZ5B54qlUuINTJcuX+C
 RCthUWIrt3p0BvfVDuShkD49fgVcKL9BUOYS7hUZWHcG2wbFTvtumuMYIz4K9jpPHazQ
 C2hmviFsMExEkDT9Qvh/RXW95/yDIKlHubuSeGQO9E6CEyMaLDe4KI273wjFonxWq/yE
 JXAA==
X-Gm-Message-State: ACgBeo2gXzjPPW9GjGLPCEfv86zggAs6eNaNFA4uypfRtzCM4POYAe1f
 6ufKgyThUIbDmIwDIm5U+3pWisz3SUE=
X-Google-Smtp-Source: AA6agR419bXQQqu/aZg/GOfk5SjmNRrlBcU2AbjBN4UzgCpQHwA9Fuhfsm47FRIzS0c63Ct6chaxmw==
X-Received: by 2002:a1f:cc82:0:b0:376:9e8b:7a74 with SMTP id
 c124-20020a1fcc82000000b003769e8b7a74mr11208365vkg.24.1660125950831; 
 Wed, 10 Aug 2022 03:05:50 -0700 (PDT)
Received: from balboa.COMFAST (201-43-216-47.dsl.telesp.net.br.
 [201.43.216.47]) by smtp.gmail.com with ESMTPSA id
 2-20020a1f1602000000b0037613541b27sm12277919vkw.39.2022.08.10.03.05.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 03:05:50 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 v3 04/11] ppc/pnv: add helpers for pnv-phb user devices
Date: Wed, 10 Aug 2022 07:05:29 -0300
Message-Id: <20220810100536.473859-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220810100536.473859-1-danielhb413@gmail.com>
References: <20220810100536.473859-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a29;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa29.google.com
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
 hw/pci-host/pnv_phb.c | 76 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index 826c0c144e..18a050a6d3 100644
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
@@ -41,6 +72,43 @@ static void pnv_phb_attach_root_port(PCIHostState *pci)
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
+    if (phb->version == 3) {
+        parent = OBJECT(chip);
+    } else {
+        /* phb4 support will be added later */
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
@@ -74,6 +142,14 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
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


