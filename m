Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC02F63891D
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 12:53:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyXGF-0005cw-74; Fri, 25 Nov 2022 06:52:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyXGD-0005aK-GZ
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 06:52:49 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyXGB-00039m-LZ
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 06:52:49 -0500
Received: by mail-wr1-x42a.google.com with SMTP id z4so6419207wrr.3
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 03:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IJ4qIWoL++eMLbfkZYy8FK1zBpGEGlxYqMfghUQB7Bo=;
 b=I03GyLlm6xvIPuzXmo0VyCmTFs6tYqQRsk0ZYaqZ0qL4XJik/tA9pDtvNgkB6YEVX2
 Td03n2wQ3aGadKiO2MQ7iPAM2jPxTGq4NhNJxqNWLi16v7x1BmTJz4p4Fn3u9xp3gAdS
 lwqLqobyI2G3TDaAbsVzIO+7PBaE9/GXpP/g4LTOQcFqLtzD2UOhBqVg7fmZBwIyXZ//
 U2xhmvpkoMRbUhrNvD4HFZwtRTMgvvNmVmihqjEdnRj5PyjiBmuQMv8kkLXVRUEkIQya
 K2keY/HPrJ0QOMcp/5eJOZGvldXeaEMf4Ysesub6Q2+dJg1OFZSPJQvYm3hUpE8C02Un
 SuLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IJ4qIWoL++eMLbfkZYy8FK1zBpGEGlxYqMfghUQB7Bo=;
 b=UHZTIH2rRBmNODuA/HYbTYaR0D+autAn3twnM36J6vFficuyx2im92LufquBDu+3mV
 AWyj8dlc+Y+glZiVuaDs/fQWPwa0eciwss8ln15FR9HV1hHllf7FTl/xjwacCOJ5u43v
 F4eBZ9JoBheHvj0bDwqmdoIFwzLq+R6/1xZKSydHQdFcLxSIUvss4QgxakEZdRPLgtJN
 7ZiHTn6r5rQ3Pz2ye3fC0/lUFDKDfUCpTIKlK4EjEM+4Ci0z1KYvAbMc/v9kcnTO6DCF
 7J7dSaxDh92C8LHZuhCVGLCqQ+Lpb6n04/JTmmS37Gvh3bkdJNgZPu5AWvtDceYtJig0
 +OCw==
X-Gm-Message-State: ANoB5pnywbe648FPceoKRXVW2GDQXKM89cLJEEx7lyZSlIN+mDo6GWpE
 ZYDDFO/CfZVibhoAh9k0192f70dEIDepHQ==
X-Google-Smtp-Source: AA0mqf7Lo6Wldp+ruEMndQ3TG5/wSzIgxz4+GGfI0x8JdoHfgf/duLD5jDx4UNUWGIOqnW1ACm5C5Q==
X-Received: by 2002:adf:fec7:0:b0:236:8d39:6f84 with SMTP id
 q7-20020adffec7000000b002368d396f84mr21857705wrs.152.1669377166321; 
 Fri, 25 Nov 2022 03:52:46 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a05600c19d100b003c6f8d30e40sm9728258wmq.31.2022.11.25.03.52.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 03:52:45 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Greg Kurz <groug@kaod.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-ppc@nongnu.org
Subject: [PATCH for-8.0 4/7] pci: Convert child classes of TYPE_PCIE_ROOT_PORT
 to 3-phase reset
Date: Fri, 25 Nov 2022 11:52:37 +0000
Message-Id: <20221125115240.3005559-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221125115240.3005559-1-peter.maydell@linaro.org>
References: <20221125115240.3005559-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Convert the TYPE_CXL_ROOT_PORT and TYPE_PNV_PHB_ROOT_PORT classes to
3-phase reset, so they don't need to use the deprecated
device_class_set_parent_reset() function any more.

We have to do both in the same commit, because they keep the
parent_reset field in their common parent class's class struct.

Note that pnv_phb_root_port_class_init() was pointlessly setting
dc->reset twice, once by calling device_class_set_parent_reset()
and once directly.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/pci/pcie_port.h    |  2 +-
 hw/pci-bridge/cxl_root_port.c | 14 +++++++++-----
 hw/pci-host/pnv_phb.c         | 18 ++++++++++--------
 3 files changed, 20 insertions(+), 14 deletions(-)

diff --git a/include/hw/pci/pcie_port.h b/include/hw/pci/pcie_port.h
index 7b8193061ac..d9b5d075049 100644
--- a/include/hw/pci/pcie_port.h
+++ b/include/hw/pci/pcie_port.h
@@ -80,7 +80,7 @@ DECLARE_CLASS_CHECKERS(PCIERootPortClass, PCIE_ROOT_PORT,
 struct PCIERootPortClass {
     PCIDeviceClass parent_class;
     DeviceRealize parent_realize;
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
 
     uint8_t (*aer_vector)(const PCIDevice *dev);
     int (*interrupts_init)(PCIDevice *dev, Error **errp);
diff --git a/hw/pci-bridge/cxl_root_port.c b/hw/pci-bridge/cxl_root_port.c
index fb213fa06ef..6664783974c 100644
--- a/hw/pci-bridge/cxl_root_port.c
+++ b/hw/pci-bridge/cxl_root_port.c
@@ -138,12 +138,14 @@ static void cxl_rp_realize(DeviceState *dev, Error **errp)
                      component_bar);
 }
 
-static void cxl_rp_reset(DeviceState *dev)
+static void cxl_rp_reset_hold(Object *obj)
 {
-    PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
-    CXLRootPort *crp = CXL_ROOT_PORT(dev);
+    PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(obj);
+    CXLRootPort *crp = CXL_ROOT_PORT(obj);
 
-    rpc->parent_reset(dev);
+    if (rpc->parent_phases.hold) {
+        rpc->parent_phases.hold(obj);
+    }
 
     latch_registers(crp);
 }
@@ -199,6 +201,7 @@ static void cxl_root_port_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc        = DEVICE_CLASS(oc);
     PCIDeviceClass *k      = PCI_DEVICE_CLASS(oc);
+    ResettableClass *rc    = RESETTABLE_CLASS(oc);
     PCIERootPortClass *rpc = PCIE_ROOT_PORT_CLASS(oc);
 
     k->vendor_id = PCI_VENDOR_ID_INTEL;
@@ -209,7 +212,8 @@ static void cxl_root_port_class_init(ObjectClass *oc, void *data)
     k->config_write = cxl_rp_write_config;
 
     device_class_set_parent_realize(dc, cxl_rp_realize, &rpc->parent_realize);
-    device_class_set_parent_reset(dc, cxl_rp_reset, &rpc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, cxl_rp_reset_hold, NULL,
+                                       &rpc->parent_phases);
 
     rpc->aer_offset = GEN_PCIE_ROOT_PORT_AER_OFFSET;
     rpc->acs_offset = GEN_PCIE_ROOT_PORT_ACS_OFFSET;
diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index 0b26b43736f..c62b08538ac 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -199,14 +199,16 @@ static void pnv_phb_class_init(ObjectClass *klass, void *data)
     dc->user_creatable = true;
 }
 
-static void pnv_phb_root_port_reset(DeviceState *dev)
+static void pnv_phb_root_port_reset_hold(Object *obj)
 {
-    PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
-    PnvPHBRootPort *phb_rp = PNV_PHB_ROOT_PORT(dev);
-    PCIDevice *d = PCI_DEVICE(dev);
+    PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(obj);
+    PnvPHBRootPort *phb_rp = PNV_PHB_ROOT_PORT(obj);
+    PCIDevice *d = PCI_DEVICE(obj);
     uint8_t *conf = d->config;
 
-    rpc->parent_reset(dev);
+    if (rpc->parent_phases.hold) {
+        rpc->parent_phases.hold(obj);
+    }
 
     if (phb_rp->version == 3) {
         return;
@@ -300,6 +302,7 @@ static Property pnv_phb_root_port_properties[] = {
 static void pnv_phb_root_port_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
     PCIERootPortClass *rpc = PCIE_ROOT_PORT_CLASS(klass);
 
@@ -308,9 +311,8 @@ static void pnv_phb_root_port_class_init(ObjectClass *klass, void *data)
     device_class_set_props(dc, pnv_phb_root_port_properties);
     device_class_set_parent_realize(dc, pnv_phb_root_port_realize,
                                     &rpc->parent_realize);
-    device_class_set_parent_reset(dc, pnv_phb_root_port_reset,
-                                  &rpc->parent_reset);
-    dc->reset = &pnv_phb_root_port_reset;
+    resettable_class_set_parent_phases(rc, NULL, pnv_phb_root_port_reset_hold,
+                                       NULL, &rpc->parent_phases);
     dc->user_creatable = true;
 
     k->vendor_id = PCI_VENDOR_ID_IBM;
-- 
2.25.1


