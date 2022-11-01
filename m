Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 442036150AC
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 18:30:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oprmL-0005iU-Ky; Tue, 01 Nov 2022 09:58:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oprmK-0005iK-2Q
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 09:58:08 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oprmI-0003kJ-6v
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 09:58:07 -0400
Received: by mail-pf1-x431.google.com with SMTP id b185so13522368pfb.9
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 06:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WKgohXmGJwvxptEACisdke1JMQ0FNytd6UjjgGeOgSM=;
 b=B9rI6s44cZ42yBKdUR3gMEVGCbzBd4DNmJf2fuRk53Dt/y7pTS45aQjovroh+PFxsK
 6NXIBskC1CrigLiDGPVW9fW7TCZc15au7bDbk1611yvC1knCeQ+dv8if4qOoUaT2Td8u
 2Mm6d0LBaUlCS7KHO+ciINStmtNbk4fd1MUZJeET2KW2VGn/H69dzLdQNd5orgNyUz3D
 yf8o4278eXs8QFzr5N7bbbqtNrPsQPX6eS4SA16feTuED7BSWfUaSz5QUbCEtbPHRAOQ
 Dovasz3snVadwmnz0iX3sJijCdQtZijRzBFMYlgHtUMRH/LWGcakWIeZNteN/G6Q7MmR
 op9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WKgohXmGJwvxptEACisdke1JMQ0FNytd6UjjgGeOgSM=;
 b=JD3bxh5w7C1GpXK0sz+UKZ+/A+Uh3VWWbfLGUvsv940DXYVyR6snvFGfKs7Bvz9xor
 NgLm0/zNwipGbcHzFVyEYBy59wvmoobPsMjKyBRDsUEphO2ksKO0ghWOWN5eTa311RVu
 Pv5gZVRoFIY4vj0holhE3s164Wa5LP+spl+oN6k0H4A/kIG1B/SJGKnChONFvPCU78fm
 UikPGF93z+CL8OYcmD1KjtNYOZaK551CkimxX8w2q3inQrmLWfx8sj/SK4aeQ++e6XuX
 9t1S8ycZkQZsJk7r0gcUr/JRjyiNS1kxh+Ea1A0P5BtYGpVr4iw+YRZkYQxSNnAFlLgm
 WGkg==
X-Gm-Message-State: ACrzQf3vYZbfbbtVRVlqVyDhMM/HUN9QjsrVKtuihX1Z0AVu8bJ068hD
 U0s4w0/tthJzNr+dZZgDPlM2d0V+J4YSWVMR
X-Google-Smtp-Source: AMsMyM49nXWpcocEpa/oBoWyCOIRHuPxaI3kFHHOifoTtJaIfX8pi8GBtkJhFoILWhdZZKwRmvGgZA==
X-Received: by 2002:a63:5662:0:b0:46f:c6e0:bb95 with SMTP id
 g34-20020a635662000000b0046fc6e0bb95mr8594879pgm.379.1667311084614; 
 Tue, 01 Nov 2022 06:58:04 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y4-20020aa79ae4000000b0056bdc3f5b29sm6510722pfp.186.2022.11.01.06.57.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 06:58:04 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v8 01/17] hw/vfio/pci: Ensure MSI and MSI-X do not overlap
Date: Tue,  1 Nov 2022 22:57:33 +0900
Message-Id: <20221101135749.4477-2-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221101135749.4477-1-akihiko.odaki@daynix.com>
References: <20221101135749.4477-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::431;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x431.google.com
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

pci_add_capability() checks whether capabilities overlap, and notifies
its caller so that it can properly handle the case. However, in the
most cases, the capabilities actually never overlap, and the interface
incurred extra error handling code, which is often incorrect or
suboptimal. For such cases, pci_add_capability() can simply abort the
execution if the capabilities actually overlap since it should be a
programming error.

This change handles the other cases: hw/vfio/pci depends on the check to
decide MSI and MSI-X capabilities overlap with another. As they are
quite an exceptional and hw/vfio/pci knows much about PCI capabilities,
adding code specific to the cases to hw/vfio/pci still results in less
code than having error handling code everywhere in total.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/pci/pci.c         | 34 ++++++++++++++++++++++------------
 hw/vfio/pci.c        | 15 ++++++++++++++-
 include/hw/pci/pci.h |  3 +++
 3 files changed, 39 insertions(+), 13 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 2f450f6a72..b53649d1fd 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2512,6 +2512,25 @@ static void pci_del_option_rom(PCIDevice *pdev)
     pdev->has_rom = false;
 }
 
+bool pci_check_capability_overlap(PCIDevice *pdev, uint8_t cap_id,
+                                  uint8_t offset, uint8_t size, Error **errp)
+{
+    int i;
+
+    for (i = offset; i < offset + size; i++) {
+        if (pdev->used[i]) {
+            error_setg(errp,
+                       "%s:%02x:%02x.%x PCI capability %x at offset %x overlaps existing capability %x at offset %x",
+                       pci_root_bus_path(pdev), pci_dev_bus_num(pdev),
+                       PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn),
+                       cap_id, offset, pci_find_capability_at_offset(pdev, i), i);
+            return true;
+        }
+    }
+
+    return false;
+}
+
 /*
  * On success, pci_add_capability() returns a positive value
  * that the offset of the pci capability.
@@ -2523,7 +2542,6 @@ int pci_add_capability(PCIDevice *pdev, uint8_t cap_id,
                        Error **errp)
 {
     uint8_t *config;
-    int i, overlapping_cap;
 
     if (!offset) {
         offset = pci_find_space(pdev, size);
@@ -2534,17 +2552,9 @@ int pci_add_capability(PCIDevice *pdev, uint8_t cap_id,
          * depends on this check to verify that the device is not broken.
          * Should never trigger for emulated devices, but it's helpful
          * for debugging these. */
-        for (i = offset; i < offset + size; i++) {
-            overlapping_cap = pci_find_capability_at_offset(pdev, i);
-            if (overlapping_cap) {
-                error_setg(errp, "%s:%02x:%02x.%x "
-                           "Attempt to add PCI capability %x at offset "
-                           "%x overlaps existing capability %x at offset %x",
-                           pci_root_bus_path(pdev), pci_dev_bus_num(pdev),
-                           PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn),
-                           cap_id, offset, overlapping_cap, i);
-                return -EINVAL;
-            }
+        pci_check_capability_overlap(pdev, cap_id, offset, size, errp);
+        if (errp) {
+            return -EINVAL;
         }
     }
 
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 939dcc3d4a..0ca6b5ff4b 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -1298,6 +1298,14 @@ static int vfio_msi_setup(VFIOPCIDevice *vdev, int pos, Error **errp)
 
     trace_vfio_msi_setup(vdev->vbasedev.name, pos);
 
+    vdev->msi_cap_size = 0xa + (msi_maskbit ? 0xa : 0) + (msi_64bit ? 0x4 : 0);
+
+    ret = pci_check_capability_overlap(&vdev->pdev, PCI_CAP_ID_MSI,
+                                       pos, vdev->msi_cap_size, errp);
+    if (!ret) {
+        return -EINVAL;
+    }
+
     ret = msi_init(&vdev->pdev, pos, entries, msi_64bit, msi_maskbit, &err);
     if (ret < 0) {
         if (ret == -ENOTSUP) {
@@ -1306,7 +1314,6 @@ static int vfio_msi_setup(VFIOPCIDevice *vdev, int pos, Error **errp)
         error_propagate_prepend(errp, err, "msi_init failed: ");
         return ret;
     }
-    vdev->msi_cap_size = 0xa + (msi_maskbit ? 0xa : 0) + (msi_64bit ? 0x4 : 0);
 
     return 0;
 }
@@ -1575,6 +1582,12 @@ static int vfio_msix_setup(VFIOPCIDevice *vdev, int pos, Error **errp)
     int ret;
     Error *err = NULL;
 
+    ret = pci_check_capability_overlap(&vdev->pdev, PCI_CAP_ID_MSIX,
+                                       pos, MSIX_CAP_LENGTH, errp);
+    if (!ret) {
+        return -EINVAL;
+    }
+
     vdev->msix->pending = g_new0(unsigned long,
                                  BITS_TO_LONGS(vdev->msix->entries));
     ret = msix_init(&vdev->pdev, vdev->msix->entries,
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index b54b6ef88f..77b264c17e 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -390,6 +390,9 @@ void pci_register_vga(PCIDevice *pci_dev, MemoryRegion *mem,
 void pci_unregister_vga(PCIDevice *pci_dev);
 pcibus_t pci_get_bar_addr(PCIDevice *pci_dev, int region_num);
 
+bool pci_check_capability_overlap(PCIDevice *pdev, uint8_t cap_id,
+                                  uint8_t offset, uint8_t size, Error **errp);
+
 int pci_add_capability(PCIDevice *pdev, uint8_t cap_id,
                        uint8_t offset, uint8_t size,
                        Error **errp);
-- 
2.38.1


