Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A4160F089
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 08:44:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onwZ2-0004Zg-4e; Thu, 27 Oct 2022 02:40:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onwWs-0004Im-4T
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 02:38:19 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onwWk-0003Eu-BW
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 02:38:13 -0400
Received: by mail-pf1-x42f.google.com with SMTP id g62so562592pfb.10
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 23:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1STM3PpWdsCtuLQ0E6sPy5DYW3VO2819dTVvZ/ugr5w=;
 b=0R0dLN0fopu74Fk/OlRoU+7syV3ruF03VFa72rTKpV33/1YAMzPs/wXjWIZf0H42+b
 NGvlHOy3hlBsXH3GGbd9KzTqBqfy7TsDVpIOk+rblE2Gsm6sTTuP26AT4sd1/FSbTBYn
 KXz4XlxyBtPokylEPUM9c3yOEDj8zo6LW1DXZaDYWDPe3T8ykm4+1GQ1eSQXytQzDbsw
 QHRMk5Rcxve8ekqTvcSiFH7xCNrZpgy5bUrkTJBN3K3UoeAnAfNFbCPu2XFyP9KV5S4O
 GUvLGG0m4UCW1/qP4VlGFQ+lSEfmq98Iq7yRABSTHHIEbHsFZM4fI0fg0xptdHsHWTHv
 OM6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1STM3PpWdsCtuLQ0E6sPy5DYW3VO2819dTVvZ/ugr5w=;
 b=QRP/GwnsPx/zDGvibNBu3kaPXWkrBqUM5EtWBMcWrY2yxjgMe/y2OVcjq/f6b9x/va
 vbRFm0O1SKsqE0dLfVUdtGEw9m60OQCA16DyDGrJP47zDJlKqLv5ZZrSGIZXkPP/Ipfz
 i1uNGEkfx+Fb5BLekL/2/cDaQnZOIY9/I+JBUCF+aA+NZstAs+eyyong9iz96lO2JD3O
 GNdhf9WGz7Ex4iOp9OIbpf3b0EubZA1NB94vwwhNhaoKX7RqtfimMS1VUjGSEjha8B+f
 05juXruHr6KjcBSrnyMO4GEteDa5wFb/Is9Hv+/BDS7K/kkeLKJ+tBahBZHPwZtThOYj
 VfMw==
X-Gm-Message-State: ACrzQf2Wu9pzrYVbQOPUXmhgtDhXE1eMooCICIs7FWHQ/i2FC7vkL7VD
 DetJOgupF4jw+3mEWyDuusBQsQ==
X-Google-Smtp-Source: AMsMyM57UyVa5PdIS66/0QYq76mBU0FC25k+O+7hsPGX8zN9yFMVGt/+a7Um01GZ5KKxe+7yHm+NYg==
X-Received: by 2002:a63:8bc3:0:b0:461:c9af:94e0 with SMTP id
 j186-20020a638bc3000000b00461c9af94e0mr39762736pge.421.1666852681539; 
 Wed, 26 Oct 2022 23:38:01 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 z17-20020aa79491000000b0056b818142a2sm448872pfk.109.2022.10.26.23.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 23:38:01 -0700 (PDT)
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
Subject: [PATCH v4 09/17] hw/pci/pci_bridge: Omit errp for pci_add_capability
Date: Thu, 27 Oct 2022 15:36:57 +0900
Message-Id: <20221027063705.4093-10-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221027063705.4093-1-akihiko.odaki@daynix.com>
References: <20221027063705.4093-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Omitting errp for pci_add_capability() causes it to abort if
capabilities overlap. A caller of pci_bridge_ssvid_init(), which calls
pci_add_capability() in turn, is expected to ensure that will not
happen.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/pci-bridge/i82801b11.c          | 14 ++------------
 hw/pci-bridge/pcie_root_port.c     |  7 +------
 hw/pci-bridge/xio3130_downstream.c |  8 ++------
 hw/pci-bridge/xio3130_upstream.c   |  8 ++------
 hw/pci/pci_bridge.c                | 21 ++++++---------------
 include/hw/pci/pci_bridge.h        |  5 ++---
 6 files changed, 15 insertions(+), 48 deletions(-)

diff --git a/hw/pci-bridge/i82801b11.c b/hw/pci-bridge/i82801b11.c
index f28181e210..f45dcdbacc 100644
--- a/hw/pci-bridge/i82801b11.c
+++ b/hw/pci-bridge/i82801b11.c
@@ -61,21 +61,11 @@ typedef struct I82801b11Bridge {
 
 static void i82801b11_bridge_realize(PCIDevice *d, Error **errp)
 {
-    int rc;
-
     pci_bridge_initfn(d, TYPE_PCI_BUS);
 
-    rc = pci_bridge_ssvid_init(d, I82801ba_SSVID_OFFSET,
-                               I82801ba_SSVID_SVID, I82801ba_SSVID_SSID,
-                               errp);
-    if (rc < 0) {
-        goto err_bridge;
-    }
+    pci_bridge_ssvid_init(d, I82801ba_SSVID_OFFSET,
+                          I82801ba_SSVID_SVID, I82801ba_SSVID_SSID);
     pci_config_set_prog_interface(d->config, PCI_CLASS_BRIDGE_PCI_INF_SUB);
-    return;
-
-err_bridge:
-    pci_bridge_exitfn(d);
 }
 
 static const VMStateDescription i82801b11_bridge_dev_vmstate = {
diff --git a/hw/pci-bridge/pcie_root_port.c b/hw/pci-bridge/pcie_root_port.c
index 460e48269d..a9d8c2adb4 100644
--- a/hw/pci-bridge/pcie_root_port.c
+++ b/hw/pci-bridge/pcie_root_port.c
@@ -74,12 +74,7 @@ static void rp_realize(PCIDevice *d, Error **errp)
     }
     pcie_port_init_reg(d);
 
-    rc = pci_bridge_ssvid_init(d, rpc->ssvid_offset, dc->vendor_id,
-                               rpc->ssid, errp);
-    if (rc < 0) {
-        error_append_hint(errp, "Can't init SSV ID, error %d\n", rc);
-        goto err_bridge;
-    }
+    pci_bridge_ssvid_init(d, rpc->ssvid_offset, dc->vendor_id, rpc->ssid);
 
     if (rpc->interrupts_init) {
         rc = rpc->interrupts_init(d, errp);
diff --git a/hw/pci-bridge/xio3130_downstream.c b/hw/pci-bridge/xio3130_downstream.c
index 05e2b06c0c..eea3d3a2df 100644
--- a/hw/pci-bridge/xio3130_downstream.c
+++ b/hw/pci-bridge/xio3130_downstream.c
@@ -81,12 +81,8 @@ static void xio3130_downstream_realize(PCIDevice *d, Error **errp)
         goto err_bridge;
     }
 
-    rc = pci_bridge_ssvid_init(d, XIO3130_SSVID_OFFSET,
-                               XIO3130_SSVID_SVID, XIO3130_SSVID_SSID,
-                               errp);
-    if (rc < 0) {
-        goto err_msi;
-    }
+    pci_bridge_ssvid_init(d, XIO3130_SSVID_OFFSET,
+                          XIO3130_SSVID_SVID, XIO3130_SSVID_SSID);
 
     rc = pcie_cap_init(d, XIO3130_EXP_OFFSET, PCI_EXP_TYPE_DOWNSTREAM,
                        p->port, errp);
diff --git a/hw/pci-bridge/xio3130_upstream.c b/hw/pci-bridge/xio3130_upstream.c
index 5ff46ef050..d954906d79 100644
--- a/hw/pci-bridge/xio3130_upstream.c
+++ b/hw/pci-bridge/xio3130_upstream.c
@@ -71,12 +71,8 @@ static void xio3130_upstream_realize(PCIDevice *d, Error **errp)
         goto err_bridge;
     }
 
-    rc = pci_bridge_ssvid_init(d, XIO3130_SSVID_OFFSET,
-                               XIO3130_SSVID_SVID, XIO3130_SSVID_SSID,
-                               errp);
-    if (rc < 0) {
-        goto err_msi;
-    }
+    pci_bridge_ssvid_init(d, XIO3130_SSVID_OFFSET,
+                          XIO3130_SSVID_SVID, XIO3130_SSVID_SSID);
 
     rc = pcie_cap_init(d, XIO3130_EXP_OFFSET, PCI_EXP_TYPE_UPSTREAM,
                        p->port, errp);
diff --git a/hw/pci/pci_bridge.c b/hw/pci/pci_bridge.c
index da34c8ebcd..30032fed64 100644
--- a/hw/pci/pci_bridge.c
+++ b/hw/pci/pci_bridge.c
@@ -42,21 +42,15 @@
 #define PCI_SSVID_SVID          4
 #define PCI_SSVID_SSID          6
 
-int pci_bridge_ssvid_init(PCIDevice *dev, uint8_t offset,
-                          uint16_t svid, uint16_t ssid,
-                          Error **errp)
+void pci_bridge_ssvid_init(PCIDevice *dev, uint8_t offset,
+                           uint16_t svid, uint16_t ssid)
 {
-    int pos;
+    uint8_t pos;
 
-    pos = pci_add_capability(dev, PCI_CAP_ID_SSVID, offset,
-                             PCI_SSVID_SIZEOF, errp);
-    if (pos < 0) {
-        return pos;
-    }
+    pos = pci_add_capability(dev, PCI_CAP_ID_SSVID, offset, PCI_SSVID_SIZEOF);
 
     pci_set_word(dev->config + pos + PCI_SSVID_SVID, svid);
     pci_set_word(dev->config + pos + PCI_SSVID_SSID, ssid);
-    return pos;
 }
 
 /* Accessor function to get parent bridge device from pci bus. */
@@ -455,11 +449,8 @@ int pci_bridge_qemu_reserve_cap_init(PCIDevice *dev, int cap_offset,
             .mem_pref_64 = cpu_to_le64(res_reserve.mem_pref_64)
     };
 
-    int offset = pci_add_capability(dev, PCI_CAP_ID_VNDR,
-                                    cap_offset, cap_len, errp);
-    if (offset < 0) {
-        return offset;
-    }
+    uint8_t offset = pci_add_capability(dev, PCI_CAP_ID_VNDR,
+                                        cap_offset, cap_len);
 
     memcpy(dev->config + offset + PCI_CAP_FLAGS,
            (char *)&cap + PCI_CAP_FLAGS,
diff --git a/include/hw/pci/pci_bridge.h b/include/hw/pci/pci_bridge.h
index ba4bafac7c..e499482972 100644
--- a/include/hw/pci/pci_bridge.h
+++ b/include/hw/pci/pci_bridge.h
@@ -101,9 +101,8 @@ typedef struct PXBDev PXBDev;
 DECLARE_INSTANCE_CHECKER(PXBDev, PXB_CXL_DEV,
                          TYPE_PXB_CXL_DEVICE)
 
-int pci_bridge_ssvid_init(PCIDevice *dev, uint8_t offset,
-                          uint16_t svid, uint16_t ssid,
-                          Error **errp);
+void pci_bridge_ssvid_init(PCIDevice *dev, uint8_t offset,
+                           uint16_t svid, uint16_t ssid);
 
 PCIDevice *pci_bridge_get_device(PCIBus *bus);
 PCIBus *pci_bridge_get_sec_bus(PCIBridge *br);
-- 
2.37.3


