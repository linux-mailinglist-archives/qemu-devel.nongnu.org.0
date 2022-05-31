Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AFC53992B
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 23:59:32 +0200 (CEST)
Received: from localhost ([::1]:47306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw9tj-0006jD-3I
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 17:59:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nw9kB-0000iE-O2; Tue, 31 May 2022 17:49:39 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:39735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nw9k9-0003La-U6; Tue, 31 May 2022 17:49:39 -0400
Received: by mail-oi1-x22a.google.com with SMTP id y131so187532oia.6;
 Tue, 31 May 2022 14:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TGsccvl0/Z5TFbhXHRfWk8dQ/8xooe+rIQdkjEGfRPw=;
 b=gF3ghEhH+eKYdgmYtJSLwK2EvVb24fzrzLOx8XQ9sZsTOb/XgFFzGandPkl/RZ+Oqe
 Ze6itijoy0Xj81BqJkmCBgC9nA26U7jMz9puNIRp+KxpHp1LX5t1G2mxEv2Pv/Mjd69M
 1IMWHSfSmmsopzTGnFsO1wNkht4r6Xgo6SM7s6hadvRTWWW1fPRbKphM2Mj5xFiIwOIj
 haLJw5/YoTitTaIYv0WwRYyHPP5/iLVtwQ6KDEAPVXRmOH/bPago2nlmbNrCjI11qdrY
 69kPIqXk5FkcA/iK7H6KFFYsw2B4JTlHtl8D9toKjZ3+EHYFrlum+i6WvMihVqXosT5r
 iHLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TGsccvl0/Z5TFbhXHRfWk8dQ/8xooe+rIQdkjEGfRPw=;
 b=oavASVr+puTs6fjMPF5rJYbvbrzCS38oeWtmFSaLc38bskv1Ibn08JaFfSgN4Sn1sj
 ph3MfoXqWIJ0rWIBB38vcA3zV5D1hlJnDi50DI3ZcmFWsNli3rjXkOFdyNyCQ7gnZTJP
 3JSEqoun+iDEc0/yw4SUcWeU5CACMO12pwpQpwC5g7WvyfB6+Yyr+FSDWw+rYzjHU88y
 R1+H67mz0H5CPxUZOLyqywDLsSHvxp5Tm9yAUhCXqCkvBE+rVULm4u4GEjYdrxrIasrB
 uYJJ3+okxWr+/SIFQaG6IEi2xb1KZVUy4oD5SitAULwhzy4DAFfGwIRKvMBfZJotpyNs
 9qtw==
X-Gm-Message-State: AOAM531YmexNPIZNqlm4+0FLyCcbjYv7bD8Mik3e83jkw70rstOzWEyR
 65iHvVgVlsZeBbv6xTA0CDrvcqth6jyb3Q==
X-Google-Smtp-Source: ABdhPJy3q2kk7scaR38HJJkRvgPc5iuzmHi+oLkbtuzKP6wZNppea5IpUfHIZ9AjGMX9WJbtbCsSzA==
X-Received: by 2002:a05:6808:1a01:b0:32b:1f24:9213 with SMTP id
 bk1-20020a0568081a0100b0032b1f249213mr12921002oib.92.1654033775336; 
 Tue, 31 May 2022 14:49:35 -0700 (PDT)
Received: from balboa.COMFAST ([152.250.93.219])
 by smtp.gmail.com with ESMTPSA id
 pd19-20020a0568701f1300b000f333ac991fsm3476988oab.27.2022.05.31.14.49.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 14:49:35 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 mark.cave-ayland@ilande.co.uk, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v2 05/16] ppc/pnv: user created pnv-phb for powernv8
Date: Tue, 31 May 2022 18:49:06 -0300
Message-Id: <20220531214917.31668-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220531214917.31668-1-danielhb413@gmail.com>
References: <20220531214917.31668-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22a.google.com
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

Let's reintroduce the powernv8 bits of the code what was removed in
commit 9c10d86fee "ppc/pnv: Remove user-created PHB{3,4,5} devices",
allowing us to enable user creatable pnv-phb devices for the powernv8
machine.

The difference is that this time we're adding support for a PnvPHB
device that is the same that will be used by the other powernv machines,
allowing the user to deal with a single PnvPHB device instead of
versioned PHBs for each one.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb.c  |  5 ++++-
 hw/pci-host/pnv_phb3.c | 26 +++++++++++++++++++++++++-
 hw/ppc/pnv.c           | 23 ++++++++++++++++++++++-
 include/hw/ppc/pnv.h   |  1 +
 4 files changed, 52 insertions(+), 3 deletions(-)

diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index fa8472622f..17532d25f0 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -17,6 +17,7 @@
 #include "hw/ppc/pnv.h"
 #include "hw/qdev-properties.h"
 #include "qom/object.h"
+#include "sysemu/sysemu.h"
 
 
 static void pnv_phb_realize(DeviceState *dev, Error **errp)
@@ -71,7 +72,9 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
         pnv_phb3_bus_init(dev, (PnvPHB3 *)phb->backend);
     }
 
-    pnv_phb_attach_root_port(pci, phb_rootport_typename);
+    if (defaults_enabled()) {
+        pnv_phb_attach_root_port(pci, phb_rootport_typename);
+    }
 }
 
 static const char *pnv_phb_root_bus_path(PCIHostState *host_bridge,
diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index a39aa0e8c4..839c2dad00 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -1015,6 +1015,30 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
     PnvMachineState *pnv = PNV_MACHINE(qdev_get_machine());
     int i;
 
+    /* User created devices */
+    if (!phb->chip) {
+        Error *local_err = NULL;
+        BusState *s;
+
+        phb->chip = pnv_get_chip(pnv, phb->chip_id);
+        if (!phb->chip) {
+            error_setg(errp, "invalid chip id: %d", phb->chip_id);
+            return;
+        }
+
+        /*
+         * Reparent user created devices to the chip to build
+         * correctly the device tree.
+         */
+        pnv_chip_parent_fixup(phb->chip, OBJECT(phb->phb_base), phb->phb_id);
+
+        s = qdev_get_parent_bus(DEVICE(phb->chip));
+        if (!qdev_set_parent_bus(DEVICE(phb->phb_base), s, &local_err)) {
+            error_propagate(errp, local_err);
+            return;
+        }
+    }
+
     if (phb->phb_id >= PNV_CHIP_GET_CLASS(phb->chip)->num_phbs) {
         error_setg(errp, "invalid PHB index: %d", phb->phb_id);
         return;
@@ -1167,7 +1191,7 @@ static void pnv_phb3_root_port_class_init(ObjectClass *klass, void *data)
 
     device_class_set_parent_realize(dc, pnv_phb3_root_port_realize,
                                     &rpc->parent_realize);
-    dc->user_creatable = false;
+    dc->user_creatable = true;
 
     k->vendor_id = PCI_VENDOR_ID_IBM;
     k->device_id = 0x03dc;
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 6cd0af9adf..081b6839cc 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1164,7 +1164,9 @@ static void pnv_chip_power8_instance_init(Object *obj)
 
     object_initialize_child(obj, "homer", &chip8->homer, TYPE_PNV8_HOMER);
 
-    chip8->num_phbs = pcc->num_phbs;
+    if (defaults_enabled()) {
+        chip8->num_phbs = pcc->num_phbs;
+    }
 
     for (i = 0; i < chip8->num_phbs; i++) {
         object_initialize_child(obj, "phb[*]", &chip8->phbs[i], TYPE_PNV_PHB);
@@ -1990,6 +1992,23 @@ static ICSState *pnv_ics_get(XICSFabric *xi, int irq)
     return NULL;
 }
 
+void pnv_chip_parent_fixup(PnvChip *chip, Object *obj, int index)
+{
+    Object *parent = OBJECT(chip);
+    g_autofree char *default_id =
+        g_strdup_printf("%s[%d]", object_get_typename(obj), index);
+
+    if (obj->parent == parent) {
+        return;
+    }
+
+    object_ref(obj);
+    object_unparent(obj);
+    object_property_add_child(
+        parent, DEVICE(obj)->id ? DEVICE(obj)->id : default_id, obj);
+    object_unref(obj);
+}
+
 PnvChip *pnv_get_chip(PnvMachineState *pnv, uint32_t chip_id)
 {
     int i;
@@ -2134,6 +2153,8 @@ static void pnv_machine_power8_class_init(ObjectClass *oc, void *data)
 
     pmc->compat = compat;
     pmc->compat_size = sizeof(compat);
+
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_PNV_PHB);
 }
 
 static void pnv_machine_power9_class_init(ObjectClass *oc, void *data)
diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index 4595db418e..fc95b8cfaa 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -191,6 +191,7 @@ DECLARE_INSTANCE_CHECKER(PnvChip, PNV_CHIP_POWER10,
 
 PowerPCCPU *pnv_chip_find_cpu(PnvChip *chip, uint32_t pir);
 void pnv_phb_attach_root_port(PCIHostState *pci, const char *name);
+void pnv_chip_parent_fixup(PnvChip *chip, Object *obj, int index);
 
 #define TYPE_PNV_MACHINE       MACHINE_TYPE_NAME("powernv")
 typedef struct PnvMachineClass PnvMachineClass;
-- 
2.36.1


