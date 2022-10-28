Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C483611158
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 14:28:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooOSq-0003Gl-4e; Fri, 28 Oct 2022 08:27:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ooORp-0002lr-N0
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 08:27:01 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ooORm-0003GR-5f
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 08:26:53 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 3-20020a17090a0f8300b00212d5cd4e5eso9662262pjz.4
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 05:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wA5n46tAbv72iOtZG7Gix2x2/QKYjd6Q8Wh1EKlfQp0=;
 b=VpX34QP7tUV4Uvj0b7se+nNrjV8C+gGGq3aNXS7+EpXx6/xknsxg3V3hRFMbg2ElX5
 AqCRHYrEq3j82Be7HcO4DI4u1z8CnOF7nfu2dXjQVIQW5V9ZXXPKwT+bwPZIUZO2g/F/
 +P1NDB1RqFaGGgixLWuHoGyhL/l76fLZS3xReg4gDDeCNyKPvRkt4GeTTZUdS8tcngGE
 3J5g6jIj0PWL5XnglHu5h6a2m3HHpsACTGxek6IlziU+EHMT1PkPejSV/MuMy8rmjt43
 XRXzM/gfgLgccfwLlqqujR1VmFh4c8Yxa2yaqQs5rr2d+5AtLA9zHUFkePCsW1TWoCPL
 EC7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wA5n46tAbv72iOtZG7Gix2x2/QKYjd6Q8Wh1EKlfQp0=;
 b=ArRn2jsdHxyBZVc4Zksg8ea51N1Z7v/8vS/Q7nI/hz9xYLEBE3mP6aUETV2UqOl23i
 SVJBmFiEyzUNFdMKnM0M/HbvkvjLUBH0GlCfqSZgVmbW7nn3TSok6ZRz9KKCpr/HGWzN
 qYp7PF7XsYTv9B8H5J+Yhf1cgfq9a1EMVkf8WLm9GQcJw9Tww1HCBL39AhsVGliOn241
 KcC2s5HSY/sk2HhiNXt4dZi2rNh40Pvz70yZpc4tX1J9R8wjIm5TKVxWp2Wg7CfBZSiD
 M0sy1/cUDpwArhGh6umzj4H6ppr27566asBCdjXpx3u/7Ws5XlQouuy8TwyErl2/KzQz
 Ylvg==
X-Gm-Message-State: ACrzQf1ZrtncKJs2D3tDF+RdCaSoeADoovkRKn31skG8ubSAMT13UeaT
 3LgjXkBmFClVWGiMeEVW3AejIw==
X-Google-Smtp-Source: AMsMyM4j+mW2D9/5HIuLMMriJGwLr9F0Qvl+wC0GometOE5Fx3BYzbqCyr5I6EYdC9P6Rr5tuSFczQ==
X-Received: by 2002:a17:90b:3b86:b0:20c:705a:dcdf with SMTP id
 pc6-20020a17090b3b8600b0020c705adcdfmr15802655pjb.205.1666960007489; 
 Fri, 28 Oct 2022 05:26:47 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a170902ec8300b00174d9bbeda4sm2948456plg.197.2022.10.28.05.26.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 05:26:46 -0700 (PDT)
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
Subject: [PATCH v5 01/17] hw/vfio/pci: Ensure MSI and MSI-X do not overlap
Date: Fri, 28 Oct 2022 21:26:13 +0900
Message-Id: <20221028122629.3269-2-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028122629.3269-1-akihiko.odaki@daynix.com>
References: <20221028122629.3269-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1031;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1031.google.com
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

vfio_add_std_cap() is designed to ensure that capabilities do not
overlap, but it failed to do so for MSI and MSI-X capabilities.

Ensure MSI and MSI-X capabilities do not overlap with others by omitting
other overlapping capabilities.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/vfio/pci.c | 63 +++++++++++++++++++++++++++++++++++++++++++--------
 hw/vfio/pci.h |  3 +++
 2 files changed, 56 insertions(+), 10 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 939dcc3d4a..36c8f3dc85 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -1278,23 +1278,42 @@ static void vfio_disable_interrupts(VFIOPCIDevice *vdev)
     }
 }
 
-static int vfio_msi_setup(VFIOPCIDevice *vdev, int pos, Error **errp)
+static void vfio_msi_early_setup(VFIOPCIDevice *vdev, Error **errp)
 {
     uint16_t ctrl;
-    bool msi_64bit, msi_maskbit;
-    int ret, entries;
-    Error *err = NULL;
+    uint8_t pos;
+
+    pos = pci_find_capability(&vdev->pdev, PCI_CAP_ID_MSI);
+    if (!pos) {
+        return;
+    }
 
     if (pread(vdev->vbasedev.fd, &ctrl, sizeof(ctrl),
               vdev->config_offset + pos + PCI_CAP_FLAGS) != sizeof(ctrl)) {
         error_setg_errno(errp, errno, "failed reading MSI PCI_CAP_FLAGS");
-        return -errno;
+        return;
     }
-    ctrl = le16_to_cpu(ctrl);
+    vdev->msi_pos = pos;
+    vdev->msi_ctrl = le16_to_cpu(ctrl);
 
-    msi_64bit = !!(ctrl & PCI_MSI_FLAGS_64BIT);
-    msi_maskbit = !!(ctrl & PCI_MSI_FLAGS_MASKBIT);
-    entries = 1 << ((ctrl & PCI_MSI_FLAGS_QMASK) >> 1);
+    vdev->msi_cap_size = 0xa;
+    if ((vdev->msi_ctrl & PCI_MSI_FLAGS_MASKBIT)) {
+        vdev->msi_cap_size += 0xa;
+    }
+    if ((vdev->msi_ctrl & PCI_MSI_FLAGS_64BIT)) {
+        vdev->msi_cap_size += 0x4;
+    }
+}
+
+static int vfio_msi_setup(VFIOPCIDevice *vdev, int pos, Error **errp)
+{
+    bool msi_64bit, msi_maskbit;
+    int ret, entries;
+    Error *err = NULL;
+
+    msi_64bit = !!(vdev->msi_ctrl & PCI_MSI_FLAGS_64BIT);
+    msi_maskbit = !!(vdev->msi_ctrl & PCI_MSI_FLAGS_MASKBIT);
+    entries = 1 << ((vdev->msi_ctrl & PCI_MSI_FLAGS_QMASK) >> 1);
 
     trace_vfio_msi_setup(vdev->vbasedev.name, pos);
 
@@ -1306,7 +1325,6 @@ static int vfio_msi_setup(VFIOPCIDevice *vdev, int pos, Error **errp)
         error_propagate_prepend(errp, err, "msi_init failed: ");
         return ret;
     }
-    vdev->msi_cap_size = 0xa + (msi_maskbit ? 0xa : 0) + (msi_64bit ? 0x4 : 0);
 
     return 0;
 }
@@ -1524,6 +1542,7 @@ static void vfio_msix_early_setup(VFIOPCIDevice *vdev, Error **errp)
     pba = le32_to_cpu(pba);
 
     msix = g_malloc0(sizeof(*msix));
+    msix->pos = pos;
     msix->table_bar = table & PCI_MSIX_FLAGS_BIRMASK;
     msix->table_offset = table & ~PCI_MSIX_FLAGS_BIRMASK;
     msix->pba_bar = pba & PCI_MSIX_FLAGS_BIRMASK;
@@ -2025,6 +2044,24 @@ static int vfio_add_std_cap(VFIOPCIDevice *vdev, uint8_t pos, Error **errp)
         }
     }
 
+    if (cap_id != PCI_CAP_ID_MSI &&
+        range_covers_byte(vdev->msi_pos, vdev->msi_cap_size, pos)) {
+        warn_report(VFIO_MSG_PREFIX
+                    "A capability overlaps with MSI, ignoring (%" PRIu8 " @ %" PRIu8 " in [%" PRIu8 ", %" PRIu8 "))",
+                    vdev->vbasedev.name, cap_id, pos,
+                    vdev->msi_pos, vdev->msi_pos + vdev->msi_cap_size);
+        return 0;
+    }
+
+    if (cap_id != PCI_CAP_ID_MSIX && vdev->msix &&
+        range_covers_byte(vdev->msix->pos, MSIX_CAP_LENGTH, pos)) {
+        warn_report(VFIO_MSG_PREFIX
+                    "A capability overlaps with MSI-X, ignoring (%" PRIu8 " @ %" PRIu8 " in [%" PRIu8 ", %" PRIu8 "))",
+                    vdev->vbasedev.name, cap_id, pos,
+                    vdev->msix->pos, vdev->msix->pos + MSIX_CAP_LENGTH);
+        return 0;
+    }
+
     /* Scale down size, esp in case virt caps were added above */
     size = MIN(size, vfio_std_cap_max_size(pdev, pos));
 
@@ -3037,6 +3074,12 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
 
     vfio_bars_prepare(vdev);
 
+    vfio_msi_early_setup(vdev, &err);
+    if (err) {
+        error_propagate(errp, err);
+        goto error;
+    }
+
     vfio_msix_early_setup(vdev, &err);
     if (err) {
         error_propagate(errp, err);
diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index 7c236a52f4..9ae0278058 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -107,6 +107,7 @@ enum {
 
 /* Cache of MSI-X setup */
 typedef struct VFIOMSIXInfo {
+    uint8_t pos;
     uint8_t table_bar;
     uint8_t pba_bar;
     uint16_t entries;
@@ -128,6 +129,8 @@ struct VFIOPCIDevice {
     unsigned int rom_size;
     off_t rom_offset; /* Offset of ROM region within device fd */
     void *rom;
+    uint8_t msi_pos;
+    uint16_t msi_ctrl;
     int msi_cap_size;
     VFIOMSIVector *msi_vectors;
     VFIOMSIXInfo *msix;
-- 
2.37.3


