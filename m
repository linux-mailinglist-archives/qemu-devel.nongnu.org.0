Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B919588E3C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 16:06:25 +0200 (CEST)
Received: from localhost ([::1]:50740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJF0y-0000lC-P2
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 10:06:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJEgc-0002wF-R9; Wed, 03 Aug 2022 09:45:22 -0400
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c]:46004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJEgZ-0004nX-Kf; Wed, 03 Aug 2022 09:45:22 -0400
Received: by mail-vs1-xe2c.google.com with SMTP id m67so10304318vsc.12;
 Wed, 03 Aug 2022 06:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=BC6maZTbunMiDyMBdBL7ckaU4p3TOyHAZSHoQ/w74LY=;
 b=i9ZrLMiKvvvYYEsK+3DeoERsWZxOg1Ezcwz2KHdWxT0Kg4KNvkfNfSbILH6lOrc3Rt
 GIh82HLGq5aGE4AVrblwPMNg6nmADDog4CbyQoByoYWG1qwdPwIEpmwhhOxNQRY1HfzG
 JSU/TqRrnmxMnG2Yx47dni6V7panLaxMPIIYcOPXAtXSSzRvbqa55T2h1j7WdSYjbS25
 U8y33Iqp1HhxuEBMD7ak5F3GQwq4TBYFPjwVFB/0ny9/efw3Dz1sAiBLp8ESaVc+85Up
 37DQhpkhDin9X2XN+TjkEDFSGa8QfK4OTIC4b25nWmAvdleZrh7Ox3FWC9AA0ZjOEHJg
 lMFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=BC6maZTbunMiDyMBdBL7ckaU4p3TOyHAZSHoQ/w74LY=;
 b=vG54wEulTkCq7s783UatZh/dhmt9PIglvvXH0Bdi7GxlcYHEuqBdujrkkZUOocYbya
 YRcLTidKgsji+iZcMkNN8SGs/ev7Y+RwM2cCg+iwOtBQFtI4vQpVCSKPnz2DG84FzL2N
 YtiQZ5Vudg7Qnnt3s4FdNUU3GTCRARKHDPl4qvcjFt1c/cnT/ylYucpSlbVhutxJFspy
 WTCdYx/wvg9avZwh1GvLk9L+A8PXaABBWYCOdUdYldidIMLmkt9FhkYBwDzefb4dS9f2
 4FU2CqZBvCs4SDhdAd+NF0FOE63qrttjcR2qtlmvJdB2SwhSdsQPnQlVEKcHJm/sT/5O
 1dIA==
X-Gm-Message-State: AJIora8pDsqTOkgdwlwP83u3VPvo5ogA7RF+6Tv0BgKPS9mOMEIVQ5yG
 1hYy7VcAo0AZINB/B8uT38/XKrNK+6I=
X-Google-Smtp-Source: AGRyM1vNmpmkl+ptbe+uTT2yu6EFwTjhCqz4S4VAGzaS9xtPRWVZJeRwf2qvZtteZ/rg4VpKBuosjQ==
X-Received: by 2002:a05:6102:3c9a:b0:35a:1f74:53f8 with SMTP id
 c26-20020a0561023c9a00b0035a1f7453f8mr9821427vsv.50.1659534312691; 
 Wed, 03 Aug 2022 06:45:12 -0700 (PDT)
Received: from balboa.ibmmodules.com ([2804:431:c7c7:52e2:fb25:323c:5709:7237])
 by smtp.gmail.com with ESMTPSA id
 q201-20020a1f2ad2000000b00377fba67271sm932420vkq.34.2022.08.03.06.45.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 06:45:12 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, Frederic Barrat <fbarrat@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 03/10] ppc/pnv: set root port chassis and slot using
 Bus properties
Date: Wed,  3 Aug 2022 10:44:52 -0300
Message-Id: <20220803134459.2633902-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220803134459.2633902-1-danielhb413@gmail.com>
References: <20220803134459.2633902-1-danielhb413@gmail.com>
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


