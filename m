Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53330608503
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Oct 2022 08:18:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1om6Kh-0005aC-0O; Sat, 22 Oct 2022 00:42:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1om6KY-0005YH-MO
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 00:41:55 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1om6KX-0003lJ-2I
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 00:41:54 -0400
Received: by mail-pf1-x42f.google.com with SMTP id i3so4409090pfc.11
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 21:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t/kFrXOcR9C4uEYjQ13TPDg8KKmTpe6uLP4NpFkoLnc=;
 b=0FeUs7r3aT1oEEhJdE6luQfwfa0ZDu5syNnzlgttLFg/hz/1M/NTV9gnfW/s9OSEi3
 qdgM1UpzzKr1Fj5SqJCeFUppoz4YnbmPHivHyR896t3+7vezndm2aXY+r7KqHuHAQt1G
 dXxCNh6sunVSNfaolBeUP6yyMd/3GCkgEBXf5MyN4HKS9aNahtqjLDRCi9/E9NGKxq9H
 IBBmENWhEohN8e/EcAzXlbdfkkfOvaj0N9qHtmifikGuxQaEytt3cN+VnhKAUxn0sdrS
 IngX0kG2C9A3AuQKKQOoX7A0cWVlXFhsJaeXKF1JGbT37h7cYjoN16j7teJWH/8O/PTy
 2w+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t/kFrXOcR9C4uEYjQ13TPDg8KKmTpe6uLP4NpFkoLnc=;
 b=3AAfvvNDkVaKm74F6IK+hsfr7RsCeXTpb5prUasCt/floFUbPSdJX4+YN7vJf5ao6t
 zihtCT95yzzmWVLHKULQ5C6UEhsuffb3JRgcWfGxH5vn46SH/hWLrjuO08nZIZs+a8Qc
 XR6EGqLInTJ0Or/nXOjRiG1/JkNrRHq7NhNvnv3bUI9o/qHZIpoI9SADOO7houUNbzij
 /3Zag1kruHA5UCqwPd0LjxFM1vC54iHxjFwAJ33vQ/TglQhI4tf/V2WBeKSBRJqrpzqX
 vt+2IW68BA7Sn1I1gir/BUtBYpUA+lotRapmM+RkX66jovwCxCBXG7udFFcbnGRLJLrY
 hMCg==
X-Gm-Message-State: ACrzQf2zNqZB2dCY5f2zplsLzNu5XyjBVQyC6rr/qcQrPRz1t7zacmKG
 VpYBgDF2EhapwdV4T94QHXLzcw==
X-Google-Smtp-Source: AMsMyM5pannZABw7K6PnXCHvDaLuepk/DHcIUf4OJMi8BL19b16ngWCOl0jdT0J7QvlWlnAfWd1ROw==
X-Received: by 2002:a63:cc43:0:b0:43a:2f12:d326 with SMTP id
 q3-20020a63cc43000000b0043a2f12d326mr18923080pgi.320.1666413711080; 
 Fri, 21 Oct 2022 21:41:51 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a17090264d000b001868d4600b8sm178049pli.158.2022.10.21.21.41.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 21:41:50 -0700 (PDT)
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
Subject: [PATCH v2 08/17] hw/pci/pci_bridge: Omit errp for pci_add_capability
Date: Sat, 22 Oct 2022 13:40:44 +0900
Message-Id: <20221022044053.81650-9-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221022044053.81650-1-akihiko.odaki@daynix.com>
References: <20221022044053.81650-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42f.google.com
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


