Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAC1590533
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 18:57:11 +0200 (CEST)
Received: from localhost ([::1]:38814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMBUZ-0001Ma-O9
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 12:57:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oMBEL-0001ZD-Sg; Thu, 11 Aug 2022 12:40:26 -0400
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f]:41872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oMBEK-0003ki-6y; Thu, 11 Aug 2022 12:40:21 -0400
Received: by mail-vk1-xa2f.google.com with SMTP id bq26so6208312vkb.8;
 Thu, 11 Aug 2022 09:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=PcWVNOAgWDO/W7JEzvkTrCH0fv8iZ5ni1BIRQP3V8yQ=;
 b=b8BJOsikABhNreSli3F1kZu9vPgdghP+mAEP5n7G49uLgxvW2nJyTIVzhLzJlPOjHp
 ibrrZBknrHhMdmSc5+xpS8JsIxZGCQgR6LHXsqKYNFcqcr/KgoGZrBJci250v3p+PJBM
 n8Faau3j2rcBVt7WJfwSni4oDqQ9WHyDqJov3g+lPbp4dEy0KLjLJuBvUCkxEbdwO++5
 riylKbDSibByfccNnPCtYoeJrvGCp8Q8T6kcAktw9VawP+oIRitFg1/Mfh2Wv/XJJ8P2
 k7iqvh2A1waVUCi4iPVCjtrK/VpIs4wsNX3brudMw2vTXosP9/eptYsfTiYhTJhWmGyl
 GR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=PcWVNOAgWDO/W7JEzvkTrCH0fv8iZ5ni1BIRQP3V8yQ=;
 b=rHOmjz7ofS8dmrBN8dBodf9VfmaJDzeHIbxNiw3ipJzjMvP5O6oCJPqq4yj6ORb6hj
 gw5znERAhAe+VK9zmMb/a05ie7H4TqGOppw0NQXH/vpcFtZuQb9teki3vFUSUadDN8sA
 7xZI6Oss21axu1qh7gbUaDeu0Hk394nesTZKpDIeQr9CV42LhrIfiq37Z0U2ZZYi90Ja
 PRiwDxU0R4g9WcAEZwJmBJ8L3O2j5ALyNXPkkc2b7RBzUp0Gt7T4HrgKNXhn7Hbql9et
 EcdyM6WUNNNUHm6SmFBpwUvOjci9kAFOGyPkSgQZ5tsZ02V0X4BrE59efDHO7ZX++Ek2
 tzzg==
X-Gm-Message-State: ACgBeo3P6DzXK7LF4a5ZVbaIYjp2ZOK45IPVaYTB+EucYDh+UUXipUY+
 9Ov3JlukVFtKF+Kz973lAAvqyVS5hNU=
X-Google-Smtp-Source: AA6agR6TUwpoJf2QOkFCzcL2BMZOCg8YS+zbXQ3+mFM2hn+qtNOUjw5X/NtxvcBGDxcnGjwu5F3q6g==
X-Received: by 2002:a1f:5c53:0:b0:377:6247:1075 with SMTP id
 q80-20020a1f5c53000000b0037762471075mr14666261vkb.4.1660236018403; 
 Thu, 11 Aug 2022 09:40:18 -0700 (PDT)
Received: from balboa.COMFAST (201-43-216-47.dsl.telesp.net.br.
 [201.43.216.47]) by smtp.gmail.com with ESMTPSA id
 j9-20020a67fa49000000b00373d697e3e2sm1755013vsq.19.2022.08.11.09.40.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 09:40:18 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 v4 11/11] ppc/pnv: fix QOM parenting of user creatable
 root ports
Date: Thu, 11 Aug 2022 13:39:50 -0300
Message-Id: <20220811163950.578927-12-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220811163950.578927-1-danielhb413@gmail.com>
References: <20220811163950.578927-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2f;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa2f.google.com
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

User creatable root ports are being parented by the 'peripheral' or the
'peripheral-anon' container. This happens because this is the regular
QOM schema for sysbus devices that are added via the command line.

Let's make this QOM hierarchy similar to what we have with default root
ports, i.e. the root port must be parented by the pnv-root-bus. To do
that we change the qom and bus parent of the root port during
root_port_realize(). The realize() is shared by the default root port
code path, so we can remove the code inside pnv_phb_attach_root_port()
that was adding the root port as a child of the bus as well.

While we're at it, change pnv_phb_attach_root_port() to receive a PCIBus
instead of a PCIHostState to make it clear that the function does not
make use of the PHB.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb.c | 35 +++++++++++++++--------------------
 1 file changed, 15 insertions(+), 20 deletions(-)

diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index 17d9960aa1..65ed1f9eb4 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -51,27 +51,11 @@ static void pnv_parent_bus_fixup(DeviceState *parent, DeviceState *child,
     }
 }
 
-/*
- * Attach a root port device.
- *
- * 'index' will be used both as a PCIE slot value and to calculate
- * QOM id. 'chip_id' is going to be used as PCIE chassis for the
- * root port.
- */
-static void pnv_phb_attach_root_port(PCIHostState *pci)
+static void pnv_phb_attach_root_port(PCIBus *bus)
 {
     PCIDevice *root = pci_new(PCI_DEVFN(0, 0), TYPE_PNV_PHB_ROOT_PORT);
-    const char *dev_id = DEVICE(root)->id;
-    g_autofree char *default_id = NULL;
-    int index;
-
-    index = object_property_get_int(OBJECT(pci->bus), "phb-id", &error_fatal);
-    default_id = g_strdup_printf("%s[%d]", TYPE_PNV_PHB_ROOT_PORT, index);
-
-    object_property_add_child(OBJECT(pci->bus), dev_id ? dev_id : default_id,
-                              OBJECT(root));
 
-    pci_realize_and_unref(root, pci->bus, &error_fatal);
+    pci_realize_and_unref(root, bus, &error_fatal);
 }
 
 /*
@@ -171,7 +155,7 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    pnv_phb_attach_root_port(pci);
+    pnv_phb_attach_root_port(pci->bus);
 }
 
 static const char *pnv_phb_root_bus_path(PCIHostState *host_bridge,
@@ -240,12 +224,18 @@ static void pnv_phb_root_port_realize(DeviceState *dev, Error **errp)
 {
     PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
     PnvPHBRootPort *phb_rp = PNV_PHB_ROOT_PORT(dev);
-    PCIBus *bus = PCI_BUS(qdev_get_parent_bus(dev));
+    BusState *qbus = qdev_get_parent_bus(dev);
+    PCIBus *bus = PCI_BUS(qbus);
     PCIDevice *pci = PCI_DEVICE(dev);
     uint16_t device_id = 0;
     Error *local_err = NULL;
     int chip_id, index;
 
+    /*
+     * 'index' will be used both as a PCIE slot value and to calculate
+     * QOM id. 'chip_id' is going to be used as PCIE chassis for the
+     * root port.
+     */
     chip_id = object_property_get_int(OBJECT(bus), "chip-id", &error_fatal);
     index = object_property_get_int(OBJECT(bus), "phb-id", &error_fatal);
 
@@ -253,6 +243,11 @@ static void pnv_phb_root_port_realize(DeviceState *dev, Error **errp)
     qdev_prop_set_uint8(dev, "chassis", chip_id);
     qdev_prop_set_uint16(dev, "slot", index);
 
+    pnv_parent_qom_fixup(OBJECT(bus), OBJECT(dev), index);
+    if (!qdev_set_parent_bus(dev, qbus, &error_fatal)) {
+        return;
+    }
+
     rpc->parent_realize(dev, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
-- 
2.36.1


