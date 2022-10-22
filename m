Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CAB6084D1
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Oct 2022 07:56:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1om6Kj-0005bg-EA; Sat, 22 Oct 2022 00:42:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1om6Kh-0005an-08
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 00:42:03 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1om6Kd-0003mM-0c
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 00:42:02 -0400
Received: by mail-pf1-x429.google.com with SMTP id h13so4425394pfr.7
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 21:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s8ZNqYVhSLub0Z9Gs4dzE115P8u7wAuF+c29i1dbGkI=;
 b=J305MrMU5a8Ep62mPXT3PhMpbjcSlqtioy+/h2oUxHJ1k7gBnY+upeTOr3L5i+oQlb
 4D0Oh0Z3d4SKMeVJlUBpNhDWSr/SYRu7nfPw1lILw9qPJfQYhOdOF03es1/eUK2nFvs3
 sFjd5OPpJc4+0oRKEA33U882C9I+LQfuFNiz8yVzJmdrZI9YVlcnTc2/lJ/qM0E0K94X
 uGVvJfoRvIXqQ9dGttb5pls2ch7Ok70tKOY1H9G/U4nI3HWxa8bCfcBWoYCnj4csFyc1
 QmUznRgNIOST+PB5kCQ7onUzEev806w/GrQ4saofXZ7WVkm2YCMFdB5R5yu1Id4/LkQ7
 aYuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s8ZNqYVhSLub0Z9Gs4dzE115P8u7wAuF+c29i1dbGkI=;
 b=UV/nh9l25hnWvAE0NHVZhSabH4lU006o3p5zi9TEwSNvik+AmXsCkehLPAswkOefi7
 eWC7P8BAAX4wr0Ooy6eXhl5Arc9IzfQ5+uO8VTqnzrqiNkq2bWbmTsJYsveZatfSHLjL
 CjZfznHPjVN3o/X1prk1OgDmZH8cIwJsjPuFjLVItNatt/NH7QGMAJ4Rm7NKtSzd6b/c
 kk9O3Cqj0R3X8RxUBTBcPWtC6Q1+EWX0Y79Y8gy+9iuVZGXOhaCWmtUSlk0wXJn3pFX9
 HbkX48z24FWdIXyMkLHNfch0syYQTP8jyIp4PjUcrb7oyZp4ptjLcyZSLV69oK7CZZoW
 iexg==
X-Gm-Message-State: ACrzQf0whHCPbqSQE+3CuJcMhNIiI2KcdikwcH7VUQ/VnptMbtVf14ph
 53TQBMxqDLVDqocSdK40gCrhjw==
X-Google-Smtp-Source: AMsMyM5Y+A4PzFWhvoRDNA/lUxtr8bbGiajhKloiiQZC5DE91x4uZAWxy9hd3Ar/vrlcstn/znce8A==
X-Received: by 2002:a63:6a47:0:b0:43c:a935:f0f with SMTP id
 f68-20020a636a47000000b0043ca9350f0fmr19555160pgc.95.1666413716294; 
 Fri, 21 Oct 2022 21:41:56 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a17090264d000b001868d4600b8sm178049pli.158.2022.10.21.21.41.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 21:41:55 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, qemu-arm@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v2 09/17] pcie: Omit errp for pci_add_capability
Date: Sat, 22 Oct 2022 13:40:45 +0900
Message-Id: <20221022044053.81650-10-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221022044053.81650-1-akihiko.odaki@daynix.com>
References: <20221022044053.81650-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::429;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 docs/pcie_sriov.txt                |  4 +--
 hw/display/bochs-display.c         |  4 +--
 hw/net/e1000e.c                    |  4 +--
 hw/pci-bridge/cxl_downstream.c     |  9 ++----
 hw/pci-bridge/cxl_upstream.c       |  8 ++---
 hw/pci-bridge/pcie_pci_bridge.c    |  6 +---
 hw/pci-bridge/pcie_root_port.c     |  9 +-----
 hw/pci-bridge/xio3130_downstream.c |  7 +---
 hw/pci-bridge/xio3130_upstream.c   |  7 +---
 hw/pci-host/designware.c           |  3 +-
 hw/pci-host/xilinx-pcie.c          |  4 +--
 hw/pci/pcie.c                      | 52 ++++++++----------------------
 hw/usb/hcd-xhci-pci.c              |  3 +-
 hw/virtio/virtio-pci.c             |  3 +-
 include/hw/pci/pcie.h              | 11 +++----
 15 files changed, 35 insertions(+), 99 deletions(-)

diff --git a/docs/pcie_sriov.txt b/docs/pcie_sriov.txt
index 11158dbf88..728a73ba7b 100644
--- a/docs/pcie_sriov.txt
+++ b/docs/pcie_sriov.txt
@@ -49,7 +49,7 @@ setting up a BAR for a VF.
    pci_your_pf_dev_realize( ... )
    {
       ...
-      int ret = pcie_endpoint_cap_init(d, 0x70);
+      pcie_endpoint_cap_init(d, 0x70);
       ...
       pcie_ari_init(d, 0x100, 1);
       ...
@@ -79,7 +79,7 @@ setting up a BAR for a VF.
    pci_your_vf_dev_realize( ... )
    {
       ...
-      int ret = pcie_endpoint_cap_init(d, 0x60);
+      pcie_endpoint_cap_init(d, 0x60);
       ...
       pcie_ari_init(d, 0x100, 1);
       ...
diff --git a/hw/display/bochs-display.c b/hw/display/bochs-display.c
index 8ed734b195..111cabcfb3 100644
--- a/hw/display/bochs-display.c
+++ b/hw/display/bochs-display.c
@@ -265,7 +265,6 @@ static void bochs_display_realize(PCIDevice *dev, Error **errp)
 {
     BochsDisplayState *s = BOCHS_DISPLAY(dev);
     Object *obj = OBJECT(dev);
-    int ret;
 
     if (s->vgamem < 4 * MiB) {
         error_setg(errp, "bochs-display: video memory too small");
@@ -302,8 +301,7 @@ static void bochs_display_realize(PCIDevice *dev, Error **errp)
     }
 
     if (pci_bus_is_express(pci_get_bus(dev))) {
-        ret = pcie_endpoint_cap_init(dev, 0x80);
-        assert(ret > 0);
+        pcie_endpoint_cap_init(dev, 0x80);
     } else {
         dev->cap_present &= ~QEMU_PCI_CAP_EXPRESS;
     }
diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
index e433b8f9a5..aea4305c43 100644
--- a/hw/net/e1000e.c
+++ b/hw/net/e1000e.c
@@ -462,9 +462,7 @@ static void e1000e_pci_realize(PCIDevice *pci_dev, Error **errp)
 
     e1000e_init_msix(s);
 
-    if (pcie_endpoint_cap_v1_init(pci_dev, e1000e_pcie_offset) < 0) {
-        hw_error("Failed to initialize PCIe capability");
-    }
+    pcie_endpoint_cap_v1_init(pci_dev, e1000e_pcie_offset);
 
     ret = msi_init(PCI_DEVICE(s), 0xD0, 1, true, false, NULL);
     if (ret) {
diff --git a/hw/pci-bridge/cxl_downstream.c b/hw/pci-bridge/cxl_downstream.c
index a361e519d0..1980dd9c6c 100644
--- a/hw/pci-bridge/cxl_downstream.c
+++ b/hw/pci-bridge/cxl_downstream.c
@@ -155,12 +155,8 @@ static void cxl_dsp_realize(PCIDevice *d, Error **errp)
         goto err_bridge;
     }
 
-    rc = pcie_cap_init(d, CXL_DOWNSTREAM_PORT_EXP_OFFSET,
-                       PCI_EXP_TYPE_DOWNSTREAM, p->port,
-                       errp);
-    if (rc < 0) {
-        goto err_msi;
-    }
+    pcie_cap_init(d, CXL_DOWNSTREAM_PORT_EXP_OFFSET,
+                  PCI_EXP_TYPE_DOWNSTREAM, p->port);
 
     pcie_cap_flr_init(d);
     pcie_cap_deverr_init(d);
@@ -195,7 +191,6 @@ static void cxl_dsp_realize(PCIDevice *d, Error **errp)
     pcie_chassis_del_slot(s);
  err_pcie_cap:
     pcie_cap_exit(d);
- err_msi:
     msi_uninit(d);
  err_bridge:
     pci_bridge_exitfn(d);
diff --git a/hw/pci-bridge/cxl_upstream.c b/hw/pci-bridge/cxl_upstream.c
index a83a3e81e4..26f27ba681 100644
--- a/hw/pci-bridge/cxl_upstream.c
+++ b/hw/pci-bridge/cxl_upstream.c
@@ -138,11 +138,8 @@ static void cxl_usp_realize(PCIDevice *d, Error **errp)
         goto err_bridge;
     }
 
-    rc = pcie_cap_init(d, CXL_UPSTREAM_PORT_PCIE_CAP_OFFSET,
-                       PCI_EXP_TYPE_UPSTREAM, p->port, errp);
-    if (rc < 0) {
-        goto err_msi;
-    }
+    pcie_cap_init(d, CXL_UPSTREAM_PORT_PCIE_CAP_OFFSET,
+                  PCI_EXP_TYPE_UPSTREAM, p->port);
 
     pcie_cap_flr_init(d);
     pcie_cap_deverr_init(d);
@@ -165,7 +162,6 @@ static void cxl_usp_realize(PCIDevice *d, Error **errp)
 
 err_cap:
     pcie_cap_exit(d);
-err_msi:
     msi_uninit(d);
 err_bridge:
     pci_bridge_exitfn(d);
diff --git a/hw/pci-bridge/pcie_pci_bridge.c b/hw/pci-bridge/pcie_pci_bridge.c
index 1cd917a459..df5dfdd139 100644
--- a/hw/pci-bridge/pcie_pci_bridge.c
+++ b/hw/pci-bridge/pcie_pci_bridge.c
@@ -47,10 +47,7 @@ static void pcie_pci_bridge_realize(PCIDevice *d, Error **errp)
         goto error;
     }
 
-    rc = pcie_cap_init(d, 0, PCI_EXP_TYPE_PCI_BRIDGE, 0, errp);
-    if (rc < 0) {
-        goto cap_error;
-    }
+    pcie_cap_init(d, 0, PCI_EXP_TYPE_PCI_BRIDGE, 0);
 
     pos = pci_add_capability(d, PCI_CAP_ID_PM, 0, PCI_PM_SIZEOF, errp);
     if (pos < 0) {
@@ -90,7 +87,6 @@ msi_error:
 aer_error:
 pm_error:
     pcie_cap_exit(d);
-cap_error:
     shpc_cleanup(d, &pcie_br->shpc_bar);
 error:
     pci_bridge_exitfn(d);
diff --git a/hw/pci-bridge/pcie_root_port.c b/hw/pci-bridge/pcie_root_port.c
index a9d8c2adb4..92cebc7cce 100644
--- a/hw/pci-bridge/pcie_root_port.c
+++ b/hw/pci-bridge/pcie_root_port.c
@@ -83,13 +83,7 @@ static void rp_realize(PCIDevice *d, Error **errp)
         }
     }
 
-    rc = pcie_cap_init(d, rpc->exp_offset, PCI_EXP_TYPE_ROOT_PORT,
-                       p->port, errp);
-    if (rc < 0) {
-        error_append_hint(errp, "Can't add Root Port capability, "
-                          "error %d\n", rc);
-        goto err_int;
-    }
+    pcie_cap_init(d, rpc->exp_offset, PCI_EXP_TYPE_ROOT_PORT, p->port);
 
     pcie_cap_arifwd_init(d);
     pcie_cap_deverr_init(d);
@@ -120,7 +114,6 @@ err:
     pcie_chassis_del_slot(s);
 err_pcie_cap:
     pcie_cap_exit(d);
-err_int:
     if (rpc->interrupts_uninit) {
         rpc->interrupts_uninit(d);
     }
diff --git a/hw/pci-bridge/xio3130_downstream.c b/hw/pci-bridge/xio3130_downstream.c
index eea3d3a2df..37307c8c23 100644
--- a/hw/pci-bridge/xio3130_downstream.c
+++ b/hw/pci-bridge/xio3130_downstream.c
@@ -84,11 +84,7 @@ static void xio3130_downstream_realize(PCIDevice *d, Error **errp)
     pci_bridge_ssvid_init(d, XIO3130_SSVID_OFFSET,
                           XIO3130_SSVID_SVID, XIO3130_SSVID_SSID);
 
-    rc = pcie_cap_init(d, XIO3130_EXP_OFFSET, PCI_EXP_TYPE_DOWNSTREAM,
-                       p->port, errp);
-    if (rc < 0) {
-        goto err_msi;
-    }
+    pcie_cap_init(d, XIO3130_EXP_OFFSET, PCI_EXP_TYPE_DOWNSTREAM, p->port);
     pcie_cap_flr_init(d);
     pcie_cap_deverr_init(d);
     pcie_cap_slot_init(d, s);
@@ -113,7 +109,6 @@ err:
     pcie_chassis_del_slot(s);
 err_pcie_cap:
     pcie_cap_exit(d);
-err_msi:
     msi_uninit(d);
 err_bridge:
     pci_bridge_exitfn(d);
diff --git a/hw/pci-bridge/xio3130_upstream.c b/hw/pci-bridge/xio3130_upstream.c
index d954906d79..546224d97c 100644
--- a/hw/pci-bridge/xio3130_upstream.c
+++ b/hw/pci-bridge/xio3130_upstream.c
@@ -74,11 +74,7 @@ static void xio3130_upstream_realize(PCIDevice *d, Error **errp)
     pci_bridge_ssvid_init(d, XIO3130_SSVID_OFFSET,
                           XIO3130_SSVID_SVID, XIO3130_SSVID_SSID);
 
-    rc = pcie_cap_init(d, XIO3130_EXP_OFFSET, PCI_EXP_TYPE_UPSTREAM,
-                       p->port, errp);
-    if (rc < 0) {
-        goto err_msi;
-    }
+    pcie_cap_init(d, XIO3130_EXP_OFFSET, PCI_EXP_TYPE_UPSTREAM, p->port);
     pcie_cap_flr_init(d);
     pcie_cap_deverr_init(d);
 
@@ -92,7 +88,6 @@ static void xio3130_upstream_realize(PCIDevice *d, Error **errp)
 
 err:
     pcie_cap_exit(d);
-err_msi:
     msi_uninit(d);
 err_bridge:
     pci_bridge_exitfn(d);
diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
index bde3a343a2..3e4972ad76 100644
--- a/hw/pci-host/designware.c
+++ b/hw/pci-host/designware.c
@@ -414,8 +414,7 @@ static void designware_pcie_root_realize(PCIDevice *dev, Error **errp)
 
     pcie_port_init_reg(dev);
 
-    pcie_cap_init(dev, 0x70, PCI_EXP_TYPE_ROOT_PORT,
-                  0, &error_fatal);
+    pcie_cap_init(dev, 0x70, PCI_EXP_TYPE_ROOT_PORT, 0);
 
     msi_nonbroken = true;
     msi_init(dev, 0x50, 32, true, true, &error_fatal);
diff --git a/hw/pci-host/xilinx-pcie.c b/hw/pci-host/xilinx-pcie.c
index 38d5901a45..49f0ac5e35 100644
--- a/hw/pci-host/xilinx-pcie.c
+++ b/hw/pci-host/xilinx-pcie.c
@@ -282,9 +282,7 @@ static void xilinx_pcie_root_realize(PCIDevice *pci_dev, Error **errp)
 
     pci_bridge_initfn(pci_dev, TYPE_PCI_BUS);
 
-    if (pcie_endpoint_cap_v1_init(pci_dev, 0x80) < 0) {
-        error_setg(errp, "Failed to initialize PCIe capability");
-    }
+    pcie_endpoint_cap_v1_init(pci_dev, 0x80);
 }
 
 static void xilinx_pcie_root_class_init(ObjectClass *klass, void *data)
diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index 68a62da0b5..923ad29c52 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -151,21 +151,15 @@ static void pcie_cap_fill_slot_lnk(PCIDevice *dev)
     }
 }
 
-int pcie_cap_init(PCIDevice *dev, uint8_t offset,
-                  uint8_t type, uint8_t port,
-                  Error **errp)
+void pcie_cap_init(PCIDevice *dev, uint8_t offset, uint8_t type, uint8_t port)
 {
     /* PCIe cap v2 init */
-    int pos;
+    uint8_t pos;
     uint8_t *exp_cap;
 
     assert(pci_is_express(dev));
 
-    pos = pci_add_capability(dev, PCI_CAP_ID_EXP, offset,
-                             PCI_EXP_VER2_SIZEOF, errp);
-    if (pos < 0) {
-        return pos;
-    }
+    pos = pci_add_capability(dev, PCI_CAP_ID_EXP, offset, PCI_EXP_VER2_SIZEOF);
     dev->exp.exp_cap = pos;
     exp_cap = dev->config + pos;
 
@@ -185,38 +179,26 @@ int pcie_cap_init(PCIDevice *dev, uint8_t offset,
         /* read-only to behave like a 'NULL' Extended Capability Header */
         pci_set_long(dev->wmask + PCI_CONFIG_SPACE_SIZE, 0);
     }
-
-    return pos;
 }
 
-int pcie_cap_v1_init(PCIDevice *dev, uint8_t offset, uint8_t type,
-                     uint8_t port)
+void pcie_cap_v1_init(PCIDevice *dev, uint8_t offset, uint8_t type,
+                      uint8_t port)
 {
     /* PCIe cap v1 init */
-    int pos;
-    Error *local_err = NULL;
+    uint8_t pos;
 
     assert(pci_is_express(dev));
 
-    pos = pci_add_capability(dev, PCI_CAP_ID_EXP, offset,
-                             PCI_EXP_VER1_SIZEOF, &local_err);
-    if (pos < 0) {
-        error_report_err(local_err);
-        return pos;
-    }
+    pos = pci_add_capability(dev, PCI_CAP_ID_EXP, offset, PCI_EXP_VER1_SIZEOF);
     dev->exp.exp_cap = pos;
 
     pcie_cap_v1_fill(dev, port, type, PCI_EXP_FLAGS_VER1);
-
-    return pos;
 }
 
-static int
+static void
 pcie_endpoint_cap_common_init(PCIDevice *dev, uint8_t offset, uint8_t cap_size)
 {
     uint8_t type = PCI_EXP_TYPE_ENDPOINT;
-    Error *local_err = NULL;
-    int ret;
 
     /*
      * Windows guests will report Code 10, device cannot start, if
@@ -229,26 +211,20 @@ pcie_endpoint_cap_common_init(PCIDevice *dev, uint8_t offset, uint8_t cap_size)
     }
 
     if (cap_size == PCI_EXP_VER1_SIZEOF) {
-        return pcie_cap_v1_init(dev, offset, type, 0);
+        pcie_cap_v1_init(dev, offset, type, 0);
     } else {
-        ret = pcie_cap_init(dev, offset, type, 0, &local_err);
-
-        if (ret < 0) {
-            error_report_err(local_err);
-        }
-
-        return ret;
+        pcie_cap_init(dev, offset, type, 0);
     }
 }
 
-int pcie_endpoint_cap_init(PCIDevice *dev, uint8_t offset)
+void pcie_endpoint_cap_init(PCIDevice *dev, uint8_t offset)
 {
-    return pcie_endpoint_cap_common_init(dev, offset, PCI_EXP_VER2_SIZEOF);
+    pcie_endpoint_cap_common_init(dev, offset, PCI_EXP_VER2_SIZEOF);
 }
 
-int pcie_endpoint_cap_v1_init(PCIDevice *dev, uint8_t offset)
+void pcie_endpoint_cap_v1_init(PCIDevice *dev, uint8_t offset)
 {
-    return pcie_endpoint_cap_common_init(dev, offset, PCI_EXP_VER1_SIZEOF);
+    pcie_endpoint_cap_common_init(dev, offset, PCI_EXP_VER1_SIZEOF);
 }
 
 void pcie_cap_exit(PCIDevice *dev)
diff --git a/hw/usb/hcd-xhci-pci.c b/hw/usb/hcd-xhci-pci.c
index e934b1a5b1..0eba2b36ae 100644
--- a/hw/usb/hcd-xhci-pci.c
+++ b/hw/usb/hcd-xhci-pci.c
@@ -150,8 +150,7 @@ static void usb_xhci_pci_realize(struct PCIDevice *dev, Error **errp)
 
     if (pci_bus_is_express(pci_get_bus(dev)) ||
         xhci_get_flag(&s->xhci, XHCI_FLAG_FORCE_PCIE_ENDCAP)) {
-        ret = pcie_endpoint_cap_init(dev, 0xa0);
-        assert(ret > 0);
+        pcie_endpoint_cap_init(dev, 0xa0);
     }
 
     if (s->msix != ON_OFF_AUTO_OFF) {
diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 45327f0b31..c37bdc77ea 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1862,8 +1862,7 @@ static void virtio_pci_realize(PCIDevice *pci_dev, Error **errp)
         int pos;
         uint16_t last_pcie_cap_offset = PCI_CONFIG_SPACE_SIZE;
 
-        pos = pcie_endpoint_cap_init(pci_dev, 0);
-        assert(pos > 0);
+        pcie_endpoint_cap_init(pci_dev, 0);
 
         pos = pci_add_capability(pci_dev, PCI_CAP_ID_PM, 0,
                                  PCI_PM_SIZEOF, errp);
diff --git a/include/hw/pci/pcie.h b/include/hw/pci/pcie.h
index 798a262a0a..7a35851ae8 100644
--- a/include/hw/pci/pcie.h
+++ b/include/hw/pci/pcie.h
@@ -92,13 +92,12 @@ struct PCIExpressDevice {
 #define COMPAT_PROP_PCP "power_controller_present"
 
 /* PCI express capability helper functions */
-int pcie_cap_init(PCIDevice *dev, uint8_t offset, uint8_t type,
-                  uint8_t port, Error **errp);
-int pcie_cap_v1_init(PCIDevice *dev, uint8_t offset,
-                     uint8_t type, uint8_t port);
-int pcie_endpoint_cap_init(PCIDevice *dev, uint8_t offset);
+void pcie_cap_init(PCIDevice *dev, uint8_t offset, uint8_t type, uint8_t port);
+void pcie_cap_v1_init(PCIDevice *dev, uint8_t offset,
+                      uint8_t type, uint8_t port);
+void pcie_endpoint_cap_init(PCIDevice *dev, uint8_t offset);
 void pcie_cap_exit(PCIDevice *dev);
-int pcie_endpoint_cap_v1_init(PCIDevice *dev, uint8_t offset);
+void pcie_endpoint_cap_v1_init(PCIDevice *dev, uint8_t offset);
 void pcie_cap_v1_exit(PCIDevice *dev);
 uint8_t pcie_cap_get_type(const PCIDevice *dev);
 void pcie_cap_flags_set_vector(PCIDevice *dev, uint8_t vector);
-- 
2.37.3


