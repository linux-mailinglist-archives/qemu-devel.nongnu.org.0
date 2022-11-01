Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4CF615016
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 18:10:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opsgd-0006oA-82; Tue, 01 Nov 2022 10:56:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opsgb-0006nl-1Q
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 10:56:17 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opsgY-0003Ga-9S
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 10:56:16 -0400
Received: by mail-pg1-x529.google.com with SMTP id q71so13625920pgq.8
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 07:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cQU8qxYGkl671/HCgCLLfgNgKppMncqR7QlQZ3V0q/w=;
 b=N+aMm0T3y0PEoDIFTSNbX47lggqrwZLGp1VI6kJrVg//HOiOM7NRFH2wJGm9wmGXGb
 jJljb/D7jGniWUNbnH3xE8Lz0TvCG3mK9LlgbmkS3hK1rxXUsqVZXfJYryd0Bvz+WB0q
 VTv8TyzgfsCRwzU+mMzXiyZP83YBK3uPqth+kj62l4Xw8eMZsf2ypqJ/61b0m6jxv095
 DmsxJwzTEy3lOisMj8EL1zzpbRSyzYtkfnhtPpkBAOwqeBUf9Y7aKDQXFrudSy0JLcF7
 pkdar7sVGa5dCJkTROAHXgPos0oTyklA2PQu9dVcNgFpWVM39+fVKVEOUrQNUv1LY5jb
 Gs7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cQU8qxYGkl671/HCgCLLfgNgKppMncqR7QlQZ3V0q/w=;
 b=OXuJqIsmmgE441rIQZjKFkoBoZRIf6PV6gRXdI4S5iQZnIL5Cyv6RXNJORp95rfcn8
 CRH58sSCg0xSoxaPqkBWM+5dUVkK8VYcxlGOzVWBhksZH0vlvt6SPEaDfFPtewjMj5kd
 GzDVflT+nCCBNQOWI8bzwZxmKIAgpzm0mmQNYDc8S9ki30LQyO+Wrpu10D/sxHpdMKt3
 1fKVElP7mH9+bUDHFBx9k6oaAcc+jKdXFSb2HVgUB2DpIxTvNrNau2S1tGekmPHpy1Uy
 EuNZQTAksBsfVzdK4KUgOVde0l0cAWTHKeStulhMdBL5/Tw77pXmPW+/uVulC5Ga1tyK
 pgPA==
X-Gm-Message-State: ACrzQf1Uj9SloP1rGmP5Rx4UBjN1PJccvxslbpfPPQ8pILWWlNv1BECD
 76TI9fdCgHM7/xWo0RYfWugUbF18auzSHbtG
X-Google-Smtp-Source: AMsMyM4P0wCeyZ4JYxXQ/IPLWg/DlspwsM9iQsRHUX2qtO4hm7cmiZIfVmYFxkifjmi9trfjWgo85A==
X-Received: by 2002:a63:2dc3:0:b0:46b:3cf1:e16c with SMTP id
 t186-20020a632dc3000000b0046b3cf1e16cmr17433661pgt.556.1667314572639; 
 Tue, 01 Nov 2022 07:56:12 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 22-20020a631656000000b0046f9f4a2de6sm4783219pgw.74.2022.11.01.07.56.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 07:56:12 -0700 (PDT)
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
Subject: [PATCH v9 01/17] hw/vfio/pci: Ensure MSI and MSI-X do not overlap
Date: Tue,  1 Nov 2022 23:55:42 +0900
Message-Id: <20221101145558.3998-2-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221101145558.3998-1-akihiko.odaki@daynix.com>
References: <20221101145558.3998-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::529;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x529.google.com
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
 include/hw/pci/pci.h |  7 +++++++
 hw/pci/pci.c         | 33 +++++++++++++++++++++------------
 hw/vfio/pci.c        | 15 ++++++++++++++-
 3 files changed, 42 insertions(+), 13 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index b54b6ef88f..f4e6612440 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -390,6 +390,13 @@ void pci_register_vga(PCIDevice *pci_dev, MemoryRegion *mem,
 void pci_unregister_vga(PCIDevice *pci_dev);
 pcibus_t pci_get_bar_addr(PCIDevice *pci_dev, int region_num);
 
+/*
+ * If there is no overlap, pci_check_capability_overlap() returns true.
+ * Otherise, it sets an error and returns false.
+ */
+bool pci_check_capability_overlap(PCIDevice *pdev, uint8_t cap_id,
+                                  uint8_t offset, uint8_t size, Error **errp);
+
 int pci_add_capability(PCIDevice *pdev, uint8_t cap_id,
                        uint8_t offset, uint8_t size,
                        Error **errp);
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 2f450f6a72..5531e30385 100644
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
+            return false;
+        }
+    }
+
+    return true;
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
@@ -2534,17 +2552,8 @@ int pci_add_capability(PCIDevice *pdev, uint8_t cap_id,
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
+        if (!pci_check_capability_overlap(pdev, cap_id, offset, size, errp)) {
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
-- 
2.38.1


