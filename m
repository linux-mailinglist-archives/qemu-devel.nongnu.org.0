Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 108735990B8
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 00:50:40 +0200 (CEST)
Received: from localhost ([::1]:39674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOoLW-0007DP-T8
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 18:50:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oOoGT-0002Q5-KR; Thu, 18 Aug 2022 18:45:25 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b]:35740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oOoGR-0000FJ-Tu; Thu, 18 Aug 2022 18:45:25 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-10cf9f5b500so3429362fac.2; 
 Thu, 18 Aug 2022 15:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=ROQk4g7LuWhHUpzUtw1BkZDBSLzku3i/wSocwLBYeNg=;
 b=hld20G4eLlo5Sabb4jY+ilOp98u0kMBnVM7B0kpUjL85W1Hrc3I20qXStM/U4xOU0y
 1+hjXuFGDLRKuFvZ/XZDDbyqdP6BAs+DOSPYJGpBoqdkxSoAja93I+5Rm4IyjdMtD4Gb
 r3M347X+SBZXavv7gqvNS/Ih1i3A50NLe5MSQrw8B8P+Z2xNCuR2QfuAPvA1tabsq4k5
 SfIeDE3qThzZ+kwbD0uOivaKkGWh/0cOj+NqoarLLD6vwQ7fqamCTmmcNpprzgQ3bzUl
 xWG477x7CGVCPAM+6NSMSpYBKZvgx4kH7g7evQni0DzlXGEneU4rvpN6A5oi3/+jo03a
 W/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=ROQk4g7LuWhHUpzUtw1BkZDBSLzku3i/wSocwLBYeNg=;
 b=AsYH63Ymxs8/OvQqInQMjDJOQNACsh1F8R1Hjmr2KnCqwNVqE0DTba4863c3vTub+Y
 4tl2//TqG5mm9X6M7HMXNXN1m+D9eZHAHOlRoroU/dUawxQluIMsM642S0etx/ctdya/
 tMEEbzUturc/g8RasrSPGrKt0MrZAyrGd9+b0LDz+IXcePvdrn1ICNK3Kv/SkMAarbAN
 2ObfkugOc44ZBZ6Y9BCFEkfX6+Ek82+S6GrsGRwx7qjXoAjykGrzpPQKR7yYUDUvFvUP
 dZJEsnUeyzpYiw+KFx7zDuLNsv4yqbfnBZ8NLMlKN28ouFYS/xpSU5KgliQFC59Jo1cz
 v0yg==
X-Gm-Message-State: ACgBeo0O8q7w1tgnSj4vrUx57El6pDjtsU+K/u6WdBw2FYPy5rhZHCJ3
 D7uz8gMhWiOLXtX/eIuYNpZ7Ifjf9IcY3g==
X-Google-Smtp-Source: AA6agR7Y0EkaVZGPaHLloqJpmKuTpilKjai8Ysr3RCkkIru6UzwuC+QWPUc6mLTSIb/+s753VYtyeg==
X-Received: by 2002:a05:6870:538c:b0:11b:e64f:ee1b with SMTP id
 h12-20020a056870538c00b0011be64fee1bmr5107105oan.92.1660862722005; 
 Thu, 18 Aug 2022 15:45:22 -0700 (PDT)
Received: from balboa.ibmuc.com ([189.110.115.28])
 by smtp.gmail.com with ESMTPSA id
 y14-20020a9d460e000000b006370c0e5be0sm739134ote.48.2022.08.18.15.45.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 15:45:21 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 2/2] ppc/pnv: fix QOM parenting of user creatable root
 ports
Date: Thu, 18 Aug 2022 19:45:11 -0300
Message-Id: <20220818224511.373255-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220818224511.373255-1-danielhb413@gmail.com>
References: <20220818224511.373255-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2b.google.com
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
 hw/pci-host/pnv_phb.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index 4ea33fb6ba..38ec8571b7 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -62,27 +62,11 @@ static bool pnv_parent_fixup(Object *parent, BusState *parent_bus,
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
+static void pnv_phb_attach_root_port(PCIBus *bus)
 {
     PCIDevice *root = pci_new(PCI_DEVFN(0, 0), TYPE_PNV_PHB_ROOT_PORT);
-    const char *dev_id = DEVICE(root)->id;
-    g_autofree char *default_id = NULL;
-    int index;
 
-    index = object_property_get_int(OBJECT(pci->bus), "phb-id", &error_fatal);
-    default_id = g_strdup_printf("%s[%d]", TYPE_PNV_PHB_ROOT_PORT, index);
-
-    object_property_add_child(OBJECT(pci->bus), dev_id ? dev_id : default_id,
-                              OBJECT(root));
-
-    pci_realize_and_unref(root, pci->bus, &error_fatal);
+    pci_realize_and_unref(root, bus, &error_fatal);
 }
 
 /*
@@ -184,7 +168,7 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    pnv_phb_attach_root_port(pci);
+    pnv_phb_attach_root_port(pci->bus);
 }
 
 static const char *pnv_phb_root_bus_path(PCIHostState *host_bridge,
@@ -259,6 +243,11 @@ static void pnv_phb_root_port_realize(DeviceState *dev, Error **errp)
     Error *local_err = NULL;
     int chip_id, index;
 
+    /*
+     * 'index' will be used both as a PCIE slot value and to calculate
+     * QOM id. 'chip_id' is going to be used as PCIE chassis for the
+     * root port.
+     */
     chip_id = object_property_get_int(OBJECT(bus), "chip-id", &error_fatal);
     index = object_property_get_int(OBJECT(bus), "phb-id", &error_fatal);
 
@@ -266,6 +255,17 @@ static void pnv_phb_root_port_realize(DeviceState *dev, Error **errp)
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


