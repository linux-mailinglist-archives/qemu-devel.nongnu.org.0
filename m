Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CA259990F
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 11:57:07 +0200 (CEST)
Received: from localhost ([::1]:44854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOykU-0008M0-9D
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 05:57:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oOybh-0000Po-E3; Fri, 19 Aug 2022 05:48:01 -0400
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35]:42872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oOybf-0006gq-MP; Fri, 19 Aug 2022 05:48:01 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-f2a4c51c45so4654277fac.9; 
 Fri, 19 Aug 2022 02:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=TISSlsJCIwHMrIYjnewrjFuqXFo4xxPffj96JvjXfaA=;
 b=lOwfTeYzm+eB4uw/X4sr1Os315TUVr0j64RMMpBRvSzkHfy5WjWL351/yqvDGA8x5O
 lrsjDlwfDZ8RdkxZI3KLIykfmo1UJjv1IovtjQSEGlkLkpC0QHHjpS3fA2KOHKXaUntO
 MkdNpPVtqNCdDesSyJO2YmIE33AtKsH+cHmyvuejnSVnrMfDi3TNfl4ecfX2QxOyWNV5
 +oeax8zug7R0XiR8zUoqTe0yvcOc/0DH+4GnQcK4UnWbylA3llw57Krq6UA07sl/YZrB
 6fe/H2uy4MsDjwgwZwsh3EBeMSizZQArtXbEwsOtbzf/sR48AoIyIkjmwQwu6RRW2duM
 5ydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=TISSlsJCIwHMrIYjnewrjFuqXFo4xxPffj96JvjXfaA=;
 b=uDy6fwxS/8hNLWO7U26lF4otg9jduecg7YPMDT5wI9cUlv736oGkJGBWNQcmrYPbIc
 68YAITf0289vw+EtgBdl4X9qwDWuyekZ+fxBgSykG024CHsPQzxTGdTZ8iCkGM2pc31V
 wNx6enVMxXlSCBM0LhPnFq/6WZawhNHlZ6gg+p9dHUv90NHLytmwMkBM6GyyMaH+3Mvu
 cW9PBrXIPyFSa5X40CvjHGSAQpEs4SkM5AlAHCYdcX3wemb9N6x4jhCJ6dRYyY21ykMi
 oAZ6qU8yOIiZam+wy77b0Nj0kDy/X0QOtR+P3hHutCXsu7BXtQ4qYhCDuW4+Q89OW/3s
 Yevw==
X-Gm-Message-State: ACgBeo3jlVXU9S5ZW+Eyc/Mrgn0T7fWQ/Jw1IvlSmnQUUpshYiYBpz/c
 EwhwvAcd5E54eSNmdN0TmIDeTpLai1BTyg==
X-Google-Smtp-Source: AA6agR6t/824qlIcTfG73j1cQOxk66F74XhCJetjjmV+VnGLxlt/VqrwRkCCOzKV1zyXQlItDXXuAQ==
X-Received: by 2002:a05:6870:1708:b0:11c:9265:c882 with SMTP id
 h8-20020a056870170800b0011c9265c882mr3274895oae.153.1660902477910; 
 Fri, 19 Aug 2022 02:47:57 -0700 (PDT)
Received: from balboa.ibmmodules.com ([189.110.115.28])
 by smtp.gmail.com with ESMTPSA id
 g5-20020a4ad845000000b0044b06d0eae7sm228112oov.33.2022.08.19.02.47.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 02:47:57 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 v2 2/2] ppc/pnv: fix QOM parenting of user creatable
 root ports
Date: Fri, 19 Aug 2022 06:47:48 -0300
Message-Id: <20220819094748.400578-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220819094748.400578-1-danielhb413@gmail.com>
References: <20220819094748.400578-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x35.google.com
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

After all that, remove pnv_phb_attach_root_port() and create the root
port explictly in the 'default_enabled()' case of pnv_phb_realize().

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb.c | 47 ++++++++++++++++++-------------------------
 1 file changed, 20 insertions(+), 27 deletions(-)

diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index 4ea33fb6ba..7b11f1e8dd 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -62,29 +62,6 @@ static bool pnv_parent_fixup(Object *parent, BusState *parent_bus,
     return true;
 }
 
-/*
- * Attach a root port device.
- *
- * 'index' will be used both as a PCIE slot value and to calculate
- * QOM id. 'chip_id' is going to be used as PCIE chassis for the
- * root port.
- */
-static void pnv_phb_attach_root_port(PCIHostState *pci)
-{
-    PCIDevice *root = pci_new(PCI_DEVFN(0, 0), TYPE_PNV_PHB_ROOT_PORT);
-    const char *dev_id = DEVICE(root)->id;
-    g_autofree char *default_id = NULL;
-    int index;
-
-    index = object_property_get_int(OBJECT(pci->bus), "phb-id", &error_fatal);
-    default_id = g_strdup_printf("%s[%d]", TYPE_PNV_PHB_ROOT_PORT, index);
-
-    object_property_add_child(OBJECT(pci->bus), dev_id ? dev_id : default_id,
-                              OBJECT(root));
-
-    pci_realize_and_unref(root, pci->bus, &error_fatal);
-}
-
 /*
  * User created devices won't have the initial setup that default
  * devices have. This setup consists of assigning a parent device
@@ -180,11 +157,11 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
         pnv_phb4_bus_init(dev, PNV_PHB4(phb->backend));
     }
 
-    if (!defaults_enabled()) {
-        return;
-    }
+    if (defaults_enabled()) {
+        PCIDevice *root = pci_new(PCI_DEVFN(0, 0), TYPE_PNV_PHB_ROOT_PORT);
 
-    pnv_phb_attach_root_port(pci);
+        pci_realize_and_unref(root, pci->bus, errp);
+    }
 }
 
 static const char *pnv_phb_root_bus_path(PCIHostState *host_bridge,
@@ -259,6 +236,11 @@ static void pnv_phb_root_port_realize(DeviceState *dev, Error **errp)
     Error *local_err = NULL;
     int chip_id, index;
 
+    /*
+     * 'index' will be used both as a PCIE slot value and to calculate
+     * QOM id. 'chip_id' is going to be used as PCIE chassis for the
+     * root port.
+     */
     chip_id = object_property_get_int(OBJECT(bus), "chip-id", &error_fatal);
     index = object_property_get_int(OBJECT(bus), "phb-id", &error_fatal);
 
@@ -266,6 +248,17 @@ static void pnv_phb_root_port_realize(DeviceState *dev, Error **errp)
     qdev_prop_set_uint8(dev, "chassis", chip_id);
     qdev_prop_set_uint16(dev, "slot", index);
 
+    /*
+     * User created root ports are QOM parented to one of
+     * the peripheral containers but it's already at the right
+     * parent bus. Change the QOM parent to be the same as the
+     * parent bus it's already assigned to.
+     */
+    if (!pnv_parent_fixup(OBJECT(bus), BUS(bus), OBJECT(dev),
+                          index, errp)) {
+        return;
+    }
+
     rpc->parent_realize(dev, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
-- 
2.37.2


