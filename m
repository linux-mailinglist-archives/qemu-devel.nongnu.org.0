Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8373356BAF1
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 15:37:05 +0200 (CEST)
Received: from localhost ([::1]:46064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9oAK-0001zM-KX
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 09:37:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9nzG-0002yN-AE; Fri, 08 Jul 2022 09:25:38 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f]:45932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9nzD-00073D-2S; Fri, 08 Jul 2022 09:25:37 -0400
Received: by mail-oi1-x22f.google.com with SMTP id u9so26943349oiv.12;
 Fri, 08 Jul 2022 06:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BC6maZTbunMiDyMBdBL7ckaU4p3TOyHAZSHoQ/w74LY=;
 b=hbB5XF8YpV6TtFo4jyKgz8dOcnqTUCWiTRC9uBF1+1GcGI+dtBNXTYkKOs5PEgFnCi
 I0d0CvvPWl1ePjbNvv4TE+4isXLbu7ADG6kzv5HUHLRsZChVItZCoFCU0rAg11BiHJwG
 3its4FfhMI9Od5V3Jg7scxnmoWtHMf3clLTv+mXvWXfG4G9ZT1Ew6QPHlhhMQgEGGtMT
 mrwW44Fq9pLt4ybgzyuTkCW3Tgycm3QaGeKJWiUS3irCp9PRVoAbL1KDBXYly+pbA1P4
 X0pYPPSR5I7jMlj7HtQEFPgjvC22fJb0rAzr2o83TMGMaP0tShAV9BE1jERJGu9OIFii
 82Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BC6maZTbunMiDyMBdBL7ckaU4p3TOyHAZSHoQ/w74LY=;
 b=azjT6MN14YFdb/L97+uXQo/VfnZLDrv+nd1GAa2uODe9y/YemmdI4Lxya4LuVs70eV
 hThCl+lTg9ji7J4mucIWn/bnnTRcGKDYp8OGQeaxisWArVIBHbvOc2yH+Nu32UScnFbM
 3ZjK2W0h7UyKsucBspzZkYkSbI2oGVNNyHTIJdLbhiuKueXNcTRjSYPDzGZAI8gFb2pQ
 Gv8XhUVOGcUAyPQyAjZckVWYgFF9hScW0rIjvbrAiiogFz9YtsLnAeG8RdAO6LY4qxdS
 6MZgJADxarav2mHjGNF8wa/DA/x6UuvbVwgBzYZPemZ2Y0VEQMwx7wG9fhgSAYIpA4fu
 wjQQ==
X-Gm-Message-State: AJIora9J8TOhaKFbSneA3Lo2+J6vkWwDX2KfPcLm/lppQTMi0P46yaPs
 IegsyD1H5GntaP7SlSOU34JK2RCPs7Y=
X-Google-Smtp-Source: AGRyM1vT1YAp9iULBFMsZVdYmrj37CdtotU0sXzyXUZIju1iWKUrJa/OrPT2APfcp4dAGABlHko/JQ==
X-Received: by 2002:a05:6808:1641:b0:335:4fe8:14d3 with SMTP id
 az1-20020a056808164100b003354fe814d3mr5651022oib.231.1657286733412; 
 Fri, 08 Jul 2022 06:25:33 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 f108-20020a9d03f5000000b0060c00c3fde5sm18435797otf.72.2022.07.08.06.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 06:25:33 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH 03/10] ppc/pnv: set root port chassis and slot using Bus
 properties
Date: Fri,  8 Jul 2022 10:25:15 -0300
Message-Id: <20220708132522.581382-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708132522.581382-1-danielhb413@gmail.com>
References: <20220708132522.581382-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22f.google.com
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

For default root ports we have a way of accessing chassis and slot,
before root_port_realize(), via pnv_phb_attach_root_port(). For the
future user created root ports this won't be the case: we can't use
this helper because we don't have access to the PHB phb-id/chip-id
values.

In earlier patches we've added phb-id and chip-id to pnv-phb-root-bus
objects. We're now able to use the bus to retrieve them. The bus is
reachable for both user created and default devices, so we're changing
all the code paths. This also allow us to validate these changes with
the existing default devices.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index c47ed92462..826c0c144e 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -25,21 +25,19 @@
  * QOM id. 'chip_id' is going to be used as PCIE chassis for the
  * root port.
  */
-static void pnv_phb_attach_root_port(PCIHostState *pci, int index, int chip_id)
+static void pnv_phb_attach_root_port(PCIHostState *pci)
 {
     PCIDevice *root = pci_new(PCI_DEVFN(0, 0), TYPE_PNV_PHB_ROOT_PORT);
-    g_autofree char *default_id = g_strdup_printf("%s[%d]",
-                                                  TYPE_PNV_PHB_ROOT_PORT,
-                                                  index);
     const char *dev_id = DEVICE(root)->id;
+    g_autofree char *default_id = NULL;
+    int index;
+
+    index = object_property_get_int(OBJECT(pci->bus), "phb-id", &error_fatal);
+    default_id = g_strdup_printf("%s[%d]", TYPE_PNV_PHB_ROOT_PORT, index);
 
     object_property_add_child(OBJECT(pci->bus), dev_id ? dev_id : default_id,
                               OBJECT(root));
 
-    /* Set unique chassis/slot values for the root port */
-    qdev_prop_set_uint8(DEVICE(root), "chassis", chip_id);
-    qdev_prop_set_uint16(DEVICE(root), "slot", index);
-
     pci_realize_and_unref(root, pci->bus, &error_fatal);
 }
 
@@ -93,7 +91,7 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
         pnv_phb4_bus_init(dev, PNV_PHB4(phb->backend));
     }
 
-    pnv_phb_attach_root_port(pci, phb->phb_id, phb->chip_id);
+    pnv_phb_attach_root_port(pci);
 }
 
 static const char *pnv_phb_root_bus_path(PCIHostState *host_bridge,
@@ -162,9 +160,18 @@ static void pnv_phb_root_port_realize(DeviceState *dev, Error **errp)
 {
     PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
     PnvPHBRootPort *phb_rp = PNV_PHB_ROOT_PORT(dev);
+    PCIBus *bus = PCI_BUS(qdev_get_parent_bus(dev));
     PCIDevice *pci = PCI_DEVICE(dev);
     uint16_t device_id = 0;
     Error *local_err = NULL;
+    int chip_id, index;
+
+    chip_id = object_property_get_int(OBJECT(bus), "chip-id", &error_fatal);
+    index = object_property_get_int(OBJECT(bus), "phb-id", &error_fatal);
+
+    /* Set unique chassis/slot values for the root port */
+    qdev_prop_set_uint8(dev, "chassis", chip_id);
+    qdev_prop_set_uint16(dev, "slot", index);
 
     rpc->parent_realize(dev, &local_err);
     if (local_err) {
-- 
2.36.1


