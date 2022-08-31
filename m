Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9069F5A736A
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 03:36:15 +0200 (CEST)
Received: from localhost ([::1]:40582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTCeM-00018T-Gt
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 21:36:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oTCbF-0006F0-DI
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 21:33:01 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:39857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oTCb6-0001zE-W1
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 21:33:00 -0400
Received: by mail-pg1-x52d.google.com with SMTP id q9so12231981pgq.6
 for <qemu-devel@nongnu.org>; Tue, 30 Aug 2022 18:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=a5jakPvjfiG/wywaFhPru32gG0GWzu1LgN7cYcVX8pE=;
 b=ckKiotsg4tV6GAPgJmcub69DIwsl/e7Dv6YrrF3/zQHwVc7p0BZCA+p643aYJdXLjS
 h9P/3Tofs8Or51JlcVspij4Z0wo/rzKB+q8ED0LhpVuEPeIE0qXM6jMp/SlzuZV2RoL9
 VnN782EpqmASH/EWufkL/sPJbEoMTY2yhFHasUmhp+Ro7a6oURRXir1G5WeqAMufvzZ4
 m9xDEZ+bXdMw0O9vwNUeWNy3nf7BlywAb8PruYNf5YSEio7AFHSIgwgwPx30TxlOYtuG
 1xLrTbacFgtuPBJUA+t629Zl5lry4ZNNsoVlxqllfvtSlnMdHH8V6l6K7hWwaf/StRvm
 v1SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=a5jakPvjfiG/wywaFhPru32gG0GWzu1LgN7cYcVX8pE=;
 b=A+l/0lH69h61QONGCpCOt593yXzYhx59Ydkb40LugZcr51iq+fGrbm7bPiPfPgvGUo
 OdjzOGUrzyKbYkE8KauKLI2bsoLbPKT8odqG2SHXVohjJfULpdNqbKvcVZlfuFdGOa6a
 KbuWK6498f6zbr/Sm0UoNbKc7VNO3zWATuSB8yDY/7mKZqw71+khe6CG1Ue1C1TlJ+Xt
 clc7aIXgBVagKIyePahEZfj+pnedF+FC0xt2gg5kDXCzAtU282V842Xj4Mafjo8l97P1
 0I+VOHVwDGfxl34k/EDsPy8R0SGofFS1m1RhX7mr8bLroMM4sfpVWjx68eWPD9Q+fXA6
 RvoQ==
X-Gm-Message-State: ACgBeo2W3v7jiow7MH66zV425vkFVgMkfXVs7T6TFOETIPI8iUSAWvcC
 FfrmCnyDTft1R6LT/u8dZyaJ3U4U56hORGag
X-Google-Smtp-Source: AA6agR5/OZZQzplFcyiwrtBth8yhNIJqcUahAUaN7wPQ8hgzmenwI1qCOiBpv0i8OBwAcKseaVq0Fw==
X-Received: by 2002:a63:eb09:0:b0:42c:aef:e36c with SMTP id
 t9-20020a63eb09000000b0042c0aefe36cmr10768545pgh.80.1661909570968; 
 Tue, 30 Aug 2022 18:32:50 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 h88-20020a17090a29e100b001fb350026f1sm213093pjd.4.2022.08.30.18.32.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Aug 2022 18:32:50 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
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
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v2] pci: Assert that capabilities never overlap
Date: Wed, 31 Aug 2022 10:32:36 +0900
Message-Id: <20220831013236.32937-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::52d;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

pci_add_capability appears most PCI devices. Its error handling required
lots of code, and led to inconsistent behaviors such as:
- passing error_abort
- passing error_fatal
- asserting the returned value
- propagating the error to the caller
- skipping the rest of the function
- just ignoring

The code generating errors in pci_add_capability had a comment which
says:
> Verify that capabilities don't overlap.  Note: device assignment
> depends on this check to verify that the device is not broken.
> Should never trigger for emulated devices, but it's helpful for
> debugging these.

Indeed vfio has some code that passes capability offsets and sizes from
a physical device, but it explicitly pays attention so that the
capabilities never overlap. Therefore, we can always assert that
capabilities never overlap when pci_add_capability is called, resolving
these inconsistencies.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 docs/pcie_sriov.txt                |  4 +--
 hw/display/bochs-display.c         |  4 +--
 hw/i386/amd_iommu.c                | 18 ++---------
 hw/ide/ich.c                       |  8 ++---
 hw/net/e1000e.c                    | 22 +++----------
 hw/net/eepro100.c                  |  7 +---
 hw/nvme/ctrl.c                     | 10 +-----
 hw/pci-bridge/cxl_downstream.c     |  9 ++----
 hw/pci-bridge/cxl_upstream.c       |  9 ++----
 hw/pci-bridge/i82801b11.c          | 15 ++-------
 hw/pci-bridge/pci_bridge_dev.c     |  2 +-
 hw/pci-bridge/pcie_pci_bridge.c    | 17 +++-------
 hw/pci-bridge/pcie_root_port.c     | 16 ++-------
 hw/pci-bridge/xio3130_downstream.c | 15 ++-------
 hw/pci-bridge/xio3130_upstream.c   | 15 ++-------
 hw/pci-host/designware.c           |  3 +-
 hw/pci-host/xilinx-pcie.c          |  5 +--
 hw/pci/msi.c                       | 12 +------
 hw/pci/msix.c                      | 11 ++-----
 hw/pci/pci.c                       | 29 ++++-------------
 hw/pci/pci_bridge.c                | 22 ++++---------
 hw/pci/pcie.c                      | 52 ++++++++----------------------
 hw/pci/shpc.c                      | 16 +++------
 hw/pci/slotid_cap.c                |  8 ++---
 hw/usb/hcd-xhci-pci.c              |  3 +-
 hw/vfio/pci-quirks.c               | 15 ++-------
 hw/vfio/pci.c                      | 12 +++----
 hw/virtio/virtio-pci.c             | 22 ++++---------
 include/hw/pci/pci.h               |  5 ++-
 include/hw/pci/pci_bridge.h        |  5 ++-
 include/hw/pci/pcie.h              | 11 +++----
 include/hw/pci/shpc.h              |  5 ++-
 include/hw/virtio/virtio-pci.h     |  2 +-
 33 files changed, 100 insertions(+), 309 deletions(-)

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
diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index 725f69095b..256ecba1c3 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -1553,23 +1553,11 @@ static void amdvi_sysbus_realize(DeviceState *dev, Error **errp)
     if (!qdev_realize(DEVICE(&s->pci), &bus->qbus, errp)) {
         return;
     }
-    ret = pci_add_capability(&s->pci.dev, AMDVI_CAPAB_ID_SEC, 0,
-                                         AMDVI_CAPAB_SIZE, errp);
-    if (ret < 0) {
-        return;
-    }
+    pci_add_capability(&s->pci.dev, AMDVI_CAPAB_ID_SEC, 0, AMDVI_CAPAB_SIZE);
     s->capab_offset = ret;
 
-    ret = pci_add_capability(&s->pci.dev, PCI_CAP_ID_MSI, 0,
-                             AMDVI_CAPAB_REG_SIZE, errp);
-    if (ret < 0) {
-        return;
-    }
-    ret = pci_add_capability(&s->pci.dev, PCI_CAP_ID_HT, 0,
-                             AMDVI_CAPAB_REG_SIZE, errp);
-    if (ret < 0) {
-        return;
-    }
+    pci_add_capability(&s->pci.dev, PCI_CAP_ID_MSI, 0, AMDVI_CAPAB_REG_SIZE);
+    pci_add_capability(&s->pci.dev, PCI_CAP_ID_HT, 0, AMDVI_CAPAB_REG_SIZE);
 
     /* Pseudo address space under root PCI bus. */
     x86ms->ioapic_as = amdvi_host_dma_iommu(bus, s, AMDVI_IOAPIC_SB_DEVID);
diff --git a/hw/ide/ich.c b/hw/ide/ich.c
index 1007a51fcb..7349faa78f 100644
--- a/hw/ide/ich.c
+++ b/hw/ide/ich.c
@@ -106,7 +106,7 @@ static void pci_ich9_ahci_init(Object *obj)
 static void pci_ich9_ahci_realize(PCIDevice *dev, Error **errp)
 {
     struct AHCIPCIState *d;
-    int sata_cap_offset;
+    uint8_t sata_cap_offset;
     uint8_t *sata_cap;
     d = ICH9_AHCI(dev);
     int ret;
@@ -130,11 +130,7 @@ static void pci_ich9_ahci_realize(PCIDevice *dev, Error **errp)
                      &d->ahci.mem);
 
     sata_cap_offset = pci_add_capability(dev, PCI_CAP_ID_SATA,
-                                          ICH9_SATA_CAP_OFFSET, SATA_CAP_SIZE,
-                                          errp);
-    if (sata_cap_offset < 0) {
-        return;
-    }
+                                         ICH9_SATA_CAP_OFFSET, SATA_CAP_SIZE);
 
     sata_cap = dev->config + sata_cap_offset;
     pci_set_word(sata_cap + SATA_CAP_REV, 0x10);
diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
index ac96f7665a..aea4305c43 100644
--- a/hw/net/e1000e.c
+++ b/hw/net/e1000e.c
@@ -377,17 +377,10 @@ e1000e_gen_dsn(uint8_t *mac)
            (uint64_t)(mac[0])  << 56;
 }
 
-static int
+static void
 e1000e_add_pm_capability(PCIDevice *pdev, uint8_t offset, uint16_t pmc)
 {
-    Error *local_err = NULL;
-    int ret = pci_add_capability(pdev, PCI_CAP_ID_PM, offset,
-                                 PCI_PM_SIZEOF, &local_err);
-
-    if (local_err) {
-        error_report_err(local_err);
-        return ret;
-    }
+    pci_add_capability(pdev, PCI_CAP_ID_PM, offset, PCI_PM_SIZEOF);
 
     pci_set_word(pdev->config + offset + PCI_PM_PMC,
                  PCI_PM_CAP_VER_1_1 |
@@ -400,8 +393,6 @@ e1000e_add_pm_capability(PCIDevice *pdev, uint8_t offset, uint16_t pmc)
 
     pci_set_word(pdev->w1cmask + offset + PCI_PM_CTRL,
                  PCI_PM_CTRL_PME_STATUS);
-
-    return ret;
 }
 
 static void e1000e_write_config(PCIDevice *pci_dev, uint32_t address,
@@ -471,19 +462,14 @@ static void e1000e_pci_realize(PCIDevice *pci_dev, Error **errp)
 
     e1000e_init_msix(s);
 
-    if (pcie_endpoint_cap_v1_init(pci_dev, e1000e_pcie_offset) < 0) {
-        hw_error("Failed to initialize PCIe capability");
-    }
+    pcie_endpoint_cap_v1_init(pci_dev, e1000e_pcie_offset);
 
     ret = msi_init(PCI_DEVICE(s), 0xD0, 1, true, false, NULL);
     if (ret) {
         trace_e1000e_msi_init_fail(ret);
     }
 
-    if (e1000e_add_pm_capability(pci_dev, e1000e_pmrb_offset,
-                                  PCI_PM_CAP_DSI) < 0) {
-        hw_error("Failed to initialize PM capability");
-    }
+    e1000e_add_pm_capability(pci_dev, e1000e_pmrb_offset, PCI_PM_CAP_DSI);
 
     if (pcie_aer_init(pci_dev, PCI_ERR_VER, e1000e_aer_offset,
                       PCI_ERR_SIZEOF, NULL) < 0) {
diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
index 679f52f80f..bf2ecdded9 100644
--- a/hw/net/eepro100.c
+++ b/hw/net/eepro100.c
@@ -549,12 +549,7 @@ static void e100_pci_reset(EEPRO100State *s, Error **errp)
     if (info->power_management) {
         /* Power Management Capabilities */
         int cfg_offset = 0xdc;
-        int r = pci_add_capability(&s->dev, PCI_CAP_ID_PM,
-                                   cfg_offset, PCI_PM_SIZEOF,
-                                   errp);
-        if (r < 0) {
-            return;
-        }
+        pci_add_capability(&s->dev, PCI_CAP_ID_PM, cfg_offset, PCI_PM_SIZEOF);
 
         pci_set_word(pci_conf + cfg_offset + PCI_PM_PMC, 0x7e21);
 #if 0 /* TODO: replace dummy code for power management emulation. */
diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 87aeba0564..ee56aa7cba 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -7327,15 +7327,7 @@ static void nvme_init_sriov(NvmeCtrl *n, PCIDevice *pci_dev, uint16_t offset)
 
 static int nvme_add_pm_capability(PCIDevice *pci_dev, uint8_t offset)
 {
-    Error *err = NULL;
-    int ret;
-
-    ret = pci_add_capability(pci_dev, PCI_CAP_ID_PM, offset,
-                             PCI_PM_SIZEOF, &err);
-    if (err) {
-        error_report_err(err);
-        return ret;
-    }
+    pci_add_capability(pci_dev, PCI_CAP_ID_PM, offset, PCI_PM_SIZEOF);
 
     pci_set_word(pci_dev->config + offset + PCI_PM_PMC,
                  PCI_PM_CAP_VER_1_2);
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
index a83a3e81e4..ca25b0c4d9 100644
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
@@ -165,8 +162,6 @@ static void cxl_usp_realize(PCIDevice *d, Error **errp)
 
 err_cap:
     pcie_cap_exit(d);
-err_msi:
-    msi_uninit(d);
 err_bridge:
     pci_bridge_exitfn(d);
 }
diff --git a/hw/pci-bridge/i82801b11.c b/hw/pci-bridge/i82801b11.c
index f28181e210..ddeb55b8b6 100644
--- a/hw/pci-bridge/i82801b11.c
+++ b/hw/pci-bridge/i82801b11.c
@@ -61,21 +61,10 @@ typedef struct I82801b11Bridge {
 
 static void i82801b11_bridge_realize(PCIDevice *d, Error **errp)
 {
-    int rc;
-
     pci_bridge_initfn(d, TYPE_PCI_BUS);
-
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
diff --git a/hw/pci-bridge/pci_bridge_dev.c b/hw/pci-bridge/pci_bridge_dev.c
index 657a06ddbe..4b6d1876eb 100644
--- a/hw/pci-bridge/pci_bridge_dev.c
+++ b/hw/pci-bridge/pci_bridge_dev.c
@@ -66,7 +66,7 @@ static void pci_bridge_dev_realize(PCIDevice *dev, Error **errp)
         dev->config[PCI_INTERRUPT_PIN] = 0x1;
         memory_region_init(&bridge_dev->bar, OBJECT(dev), "shpc-bar",
                            shpc_bar_size(dev));
-        err = shpc_init(dev, &br->sec_bus, &bridge_dev->bar, 0, errp);
+        err = shpc_init(dev, &br->sec_bus, &bridge_dev->bar, 0);
         if (err) {
             goto shpc_error;
         }
diff --git a/hw/pci-bridge/pcie_pci_bridge.c b/hw/pci-bridge/pcie_pci_bridge.c
index 1cd917a459..c50ba1fa80 100644
--- a/hw/pci-bridge/pcie_pci_bridge.c
+++ b/hw/pci-bridge/pcie_pci_bridge.c
@@ -35,27 +35,22 @@ static void pcie_pci_bridge_realize(PCIDevice *d, Error **errp)
 {
     PCIBridge *br = PCI_BRIDGE(d);
     PCIEPCIBridge *pcie_br = PCIE_PCI_BRIDGE_DEV(d);
-    int rc, pos;
+    int rc;
+    uint8_t pos;
 
     pci_bridge_initfn(d, TYPE_PCI_BUS);
 
     d->config[PCI_INTERRUPT_PIN] = 0x1;
     memory_region_init(&pcie_br->shpc_bar, OBJECT(d), "shpc-bar",
                        shpc_bar_size(d));
-    rc = shpc_init(d, &br->sec_bus, &pcie_br->shpc_bar, 0, errp);
+    rc = shpc_init(d, &br->sec_bus, &pcie_br->shpc_bar, 0);
     if (rc) {
         goto error;
     }
 
-    rc = pcie_cap_init(d, 0, PCI_EXP_TYPE_PCI_BRIDGE, 0, errp);
-    if (rc < 0) {
-        goto cap_error;
-    }
+    pcie_cap_init(d, 0, PCI_EXP_TYPE_PCI_BRIDGE, 0);
 
-    pos = pci_add_capability(d, PCI_CAP_ID_PM, 0, PCI_PM_SIZEOF, errp);
-    if (pos < 0) {
-        goto pm_error;
-    }
+    pos = pci_add_capability(d, PCI_CAP_ID_PM, 0, PCI_PM_SIZEOF);
     d->exp.pm_cap = pos;
     pci_set_word(d->config + pos + PCI_PM_PMC, 0x3);
 
@@ -88,9 +83,7 @@ static void pcie_pci_bridge_realize(PCIDevice *d, Error **errp)
 msi_error:
     pcie_aer_exit(d);
 aer_error:
-pm_error:
     pcie_cap_exit(d);
-cap_error:
     shpc_cleanup(d, &pcie_br->shpc_bar);
 error:
     pci_bridge_exitfn(d);
diff --git a/hw/pci-bridge/pcie_root_port.c b/hw/pci-bridge/pcie_root_port.c
index 460e48269d..92cebc7cce 100644
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
@@ -88,13 +83,7 @@ static void rp_realize(PCIDevice *d, Error **errp)
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
@@ -125,7 +114,6 @@ err:
     pcie_chassis_del_slot(s);
 err_pcie_cap:
     pcie_cap_exit(d);
-err_int:
     if (rpc->interrupts_uninit) {
         rpc->interrupts_uninit(d);
     }
diff --git a/hw/pci-bridge/xio3130_downstream.c b/hw/pci-bridge/xio3130_downstream.c
index 05e2b06c0c..37307c8c23 100644
--- a/hw/pci-bridge/xio3130_downstream.c
+++ b/hw/pci-bridge/xio3130_downstream.c
@@ -81,18 +81,10 @@ static void xio3130_downstream_realize(PCIDevice *d, Error **errp)
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
 
-    rc = pcie_cap_init(d, XIO3130_EXP_OFFSET, PCI_EXP_TYPE_DOWNSTREAM,
-                       p->port, errp);
-    if (rc < 0) {
-        goto err_msi;
-    }
+    pcie_cap_init(d, XIO3130_EXP_OFFSET, PCI_EXP_TYPE_DOWNSTREAM, p->port);
     pcie_cap_flr_init(d);
     pcie_cap_deverr_init(d);
     pcie_cap_slot_init(d, s);
@@ -117,7 +109,6 @@ err:
     pcie_chassis_del_slot(s);
 err_pcie_cap:
     pcie_cap_exit(d);
-err_msi:
     msi_uninit(d);
 err_bridge:
     pci_bridge_exitfn(d);
diff --git a/hw/pci-bridge/xio3130_upstream.c b/hw/pci-bridge/xio3130_upstream.c
index 5ff46ef050..546224d97c 100644
--- a/hw/pci-bridge/xio3130_upstream.c
+++ b/hw/pci-bridge/xio3130_upstream.c
@@ -71,18 +71,10 @@ static void xio3130_upstream_realize(PCIDevice *d, Error **errp)
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
 
-    rc = pcie_cap_init(d, XIO3130_EXP_OFFSET, PCI_EXP_TYPE_UPSTREAM,
-                       p->port, errp);
-    if (rc < 0) {
-        goto err_msi;
-    }
+    pcie_cap_init(d, XIO3130_EXP_OFFSET, PCI_EXP_TYPE_UPSTREAM, p->port);
     pcie_cap_flr_init(d);
     pcie_cap_deverr_init(d);
 
@@ -96,7 +88,6 @@ static void xio3130_upstream_realize(PCIDevice *d, Error **errp)
 
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
index 38d5901a45..4c6f1ab3d0 100644
--- a/hw/pci-host/xilinx-pcie.c
+++ b/hw/pci-host/xilinx-pcie.c
@@ -281,10 +281,7 @@ static void xilinx_pcie_root_realize(PCIDevice *pci_dev, Error **errp)
                  ((s->mmio_base + s->mmio_size - 1) >> 16) & 0xfff0);
 
     pci_bridge_initfn(pci_dev, TYPE_PCI_BUS);
-
-    if (pcie_endpoint_cap_v1_init(pci_dev, 0x80) < 0) {
-        error_setg(errp, "Failed to initialize PCIe capability");
-    }
+    pcie_endpoint_cap_v1_init(pci_dev, 0x80);
 }
 
 static void xilinx_pcie_root_class_init(ObjectClass *klass, void *data)
diff --git a/hw/pci/msi.c b/hw/pci/msi.c
index 058d1d1ef1..3cda9434a7 100644
--- a/hw/pci/msi.c
+++ b/hw/pci/msi.c
@@ -183,9 +183,6 @@ bool msi_enabled(const PCIDevice *dev)
  * Return 0 on success; set @errp and return -errno on error.
  *
  * -ENOTSUP means lacking msi support for a msi-capable platform.
- * -EINVAL means capability overlap, happens when @offset is non-zero,
- *  also means a programming error, except device assignment, which can check
- *  if a real HW is broken.
  */
 int msi_init(struct PCIDevice *dev, uint8_t offset,
              unsigned int nr_vectors, bool msi64bit,
@@ -194,7 +191,6 @@ int msi_init(struct PCIDevice *dev, uint8_t offset,
     unsigned int vectors_order;
     uint16_t flags;
     uint8_t cap_size;
-    int config_offset;
 
     if (!msi_nonbroken) {
         error_setg(errp, "MSI is not supported by interrupt controller");
@@ -221,13 +217,7 @@ int msi_init(struct PCIDevice *dev, uint8_t offset,
     }
 
     cap_size = msi_cap_sizeof(flags);
-    config_offset = pci_add_capability(dev, PCI_CAP_ID_MSI, offset,
-                                        cap_size, errp);
-    if (config_offset < 0) {
-        return config_offset;
-    }
-
-    dev->msi_cap = config_offset;
+    dev->msi_cap = pci_add_capability(dev, PCI_CAP_ID_MSI, offset, cap_size);
     dev->cap_present |= QEMU_PCI_CAP_MSI;
 
     pci_set_word(dev->config + msi_flags_off(dev), flags);
diff --git a/hw/pci/msix.c b/hw/pci/msix.c
index 1e381a9813..7b47787173 100644
--- a/hw/pci/msix.c
+++ b/hw/pci/msix.c
@@ -301,9 +301,6 @@ static void msix_mask_all(struct PCIDevice *dev, unsigned nentries)
  *
  * Return 0 on success; set @errp and return -errno on error:
  * -ENOTSUP means lacking msi support for a msi-capable platform.
- * -EINVAL means capability overlap, happens when @cap_pos is non-zero,
- * also means a programming error, except device assignment, which can check
- * if a real HW is broken.
  */
 int msix_init(struct PCIDevice *dev, unsigned short nentries,
               MemoryRegion *table_bar, uint8_t table_bar_nr,
@@ -311,7 +308,7 @@ int msix_init(struct PCIDevice *dev, unsigned short nentries,
               uint8_t pba_bar_nr, unsigned pba_offset, uint8_t cap_pos,
               Error **errp)
 {
-    int cap;
+    uint8_t cap;
     unsigned table_size, pba_size;
     uint8_t *config;
 
@@ -340,11 +337,7 @@ int msix_init(struct PCIDevice *dev, unsigned short nentries,
         return -EINVAL;
     }
 
-    cap = pci_add_capability(dev, PCI_CAP_ID_MSIX,
-                              cap_pos, MSIX_CAP_LENGTH, errp);
-    if (cap < 0) {
-        return cap;
-    }
+    cap = pci_add_capability(dev, PCI_CAP_ID_MSIX, cap_pos, MSIX_CAP_LENGTH);
 
     dev->msix_cap = cap;
     dev->cap_present |= QEMU_PCI_CAP_MSIX;
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 2f450f6a72..8ff71e4553 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2513,38 +2513,23 @@ static void pci_del_option_rom(PCIDevice *pdev)
 }
 
 /*
- * On success, pci_add_capability() returns a positive value
- * that the offset of the pci capability.
- * On failure, it sets an error and returns a negative error
- * code.
+ * pci_add_capability() returns a positive value that the offset of the pci
+ * capability.
  */
-int pci_add_capability(PCIDevice *pdev, uint8_t cap_id,
-                       uint8_t offset, uint8_t size,
-                       Error **errp)
+uint8_t pci_add_capability(PCIDevice *pdev, uint8_t cap_id,
+                           uint8_t offset, uint8_t size)
 {
     uint8_t *config;
-    int i, overlapping_cap;
+    int i;
 
     if (!offset) {
         offset = pci_find_space(pdev, size);
         /* out of PCI config space is programming error */
         assert(offset);
     } else {
-        /* Verify that capabilities don't overlap.  Note: device assignment
-         * depends on this check to verify that the device is not broken.
-         * Should never trigger for emulated devices, but it's helpful
-         * for debugging these. */
+        /* Verify that capabilities don't overlap. */
         for (i = offset; i < offset + size; i++) {
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
+            assert(!pci_find_capability_at_offset(pdev, i));
         }
     }
 
diff --git a/hw/pci/pci_bridge.c b/hw/pci/pci_bridge.c
index da34c8ebcd..ebc03e2bab 100644
--- a/hw/pci/pci_bridge.c
+++ b/hw/pci/pci_bridge.c
@@ -42,21 +42,14 @@
 #define PCI_SSVID_SVID          4
 #define PCI_SSVID_SSID          6
 
-int pci_bridge_ssvid_init(PCIDevice *dev, uint8_t offset,
-                          uint16_t svid, uint16_t ssid,
-                          Error **errp)
+void pci_bridge_ssvid_init(PCIDevice *dev, uint8_t offset,
+                           uint16_t svid, uint16_t ssid)
 {
-    int pos;
-
-    pos = pci_add_capability(dev, PCI_CAP_ID_SSVID, offset,
-                             PCI_SSVID_SIZEOF, errp);
-    if (pos < 0) {
-        return pos;
-    }
+    uint8_t pos;
 
+    pos = pci_add_capability(dev, PCI_CAP_ID_SSVID, offset, PCI_SSVID_SIZEOF);
     pci_set_word(dev->config + pos + PCI_SSVID_SVID, svid);
     pci_set_word(dev->config + pos + PCI_SSVID_SSID, ssid);
-    return pos;
 }
 
 /* Accessor function to get parent bridge device from pci bus. */
@@ -455,11 +448,8 @@ int pci_bridge_qemu_reserve_cap_init(PCIDevice *dev, int cap_offset,
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
diff --git a/hw/pci/shpc.c b/hw/pci/shpc.c
index e71f3a7483..275644ab48 100644
--- a/hw/pci/shpc.c
+++ b/hw/pci/shpc.c
@@ -440,16 +440,11 @@ static void shpc_cap_update_dword(PCIDevice *d)
 }
 
 /* Add SHPC capability to the config space for the device. */
-static int shpc_cap_add_config(PCIDevice *d, Error **errp)
+static int shpc_cap_add_config(PCIDevice *d)
 {
     uint8_t *config;
-    int config_offset;
-    config_offset = pci_add_capability(d, PCI_CAP_ID_SHPC,
-                                       0, SHPC_CAP_LENGTH,
-                                       errp);
-    if (config_offset < 0) {
-        return config_offset;
-    }
+    uint8_t config_offset;
+    config_offset = pci_add_capability(d, PCI_CAP_ID_SHPC, 0, SHPC_CAP_LENGTH);
     config = d->config + config_offset;
 
     pci_set_byte(config + SHPC_CAP_DWORD_SELECT, 0);
@@ -584,14 +579,13 @@ void shpc_device_unplug_request_cb(HotplugHandler *hotplug_dev,
 }
 
 /* Initialize the SHPC structure in bridge's BAR. */
-int shpc_init(PCIDevice *d, PCIBus *sec_bus, MemoryRegion *bar,
-              unsigned offset, Error **errp)
+int shpc_init(PCIDevice *d, PCIBus *sec_bus, MemoryRegion *bar, unsigned offset)
 {
     int i, ret;
     int nslots = SHPC_MAX_SLOTS; /* TODO: qdev property? */
     SHPCDevice *shpc = d->shpc = g_malloc0(sizeof(*d->shpc));
     shpc->sec_bus = sec_bus;
-    ret = shpc_cap_add_config(d, errp);
+    ret = shpc_cap_add_config(d);
     if (ret) {
         g_free(d->shpc);
         return ret;
diff --git a/hw/pci/slotid_cap.c b/hw/pci/slotid_cap.c
index 36d021b4a6..5da8c82133 100644
--- a/hw/pci/slotid_cap.c
+++ b/hw/pci/slotid_cap.c
@@ -12,7 +12,7 @@ int slotid_cap_init(PCIDevice *d, int nslots,
                     unsigned offset,
                     Error **errp)
 {
-    int cap;
+    uint8_t cap;
 
     if (!chassis) {
         error_setg(errp, "Bridge chassis not specified. Each bridge is required"
@@ -24,11 +24,7 @@ int slotid_cap_init(PCIDevice *d, int nslots,
         return -EINVAL;
     }
 
-    cap = pci_add_capability(d, PCI_CAP_ID_SLOTID, offset,
-                             SLOTID_CAP_LENGTH, errp);
-    if (cap < 0) {
-        return cap;
-    }
+    cap = pci_add_capability(d, PCI_CAP_ID_SLOTID, offset, SLOTID_CAP_LENGTH);
     /* We make each chassis unique, this way each bridge is First in Chassis */
     d->config[cap + PCI_SID_ESR] = PCI_SID_ESR_FIC |
         (nslots << SLOTID_NSLOTS_SHIFT);
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
diff --git a/hw/vfio/pci-quirks.c b/hw/vfio/pci-quirks.c
index f0147a050a..e94fd273ea 100644
--- a/hw/vfio/pci-quirks.c
+++ b/hw/vfio/pci-quirks.c
@@ -1530,7 +1530,7 @@ const PropertyInfo qdev_prop_nv_gpudirect_clique = {
 static int vfio_add_nv_gpudirect_cap(VFIOPCIDevice *vdev, Error **errp)
 {
     PCIDevice *pdev = &vdev->pdev;
-    int ret, pos = 0xC8;
+    int pos = 0xC8;
 
     if (vdev->nv_gpudirect_clique == 0xFF) {
         return 0;
@@ -1547,11 +1547,7 @@ static int vfio_add_nv_gpudirect_cap(VFIOPCIDevice *vdev, Error **errp)
         return -EINVAL;
     }
 
-    ret = pci_add_capability(pdev, PCI_CAP_ID_VNDR, pos, 8, errp);
-    if (ret < 0) {
-        error_prepend(errp, "Failed to add NVIDIA GPUDirect cap: ");
-        return ret;
-    }
+    pci_add_capability(pdev, PCI_CAP_ID_VNDR, pos, 8);
 
     memset(vdev->emulated_config_bits + pos, 0xFF, 8);
     pos += PCI_CAP_FLAGS;
@@ -1718,12 +1714,7 @@ static int vfio_add_vmd_shadow_cap(VFIOPCIDevice *vdev, Error **errp)
         return -EFAULT;
     }
 
-    ret = pci_add_capability(&vdev->pdev, PCI_CAP_ID_VNDR, pos,
-                             VMD_SHADOW_CAP_LEN, errp);
-    if (ret < 0) {
-        error_prepend(errp, "Failed to add VMD MEMBAR Shadow cap: ");
-        return ret;
-    }
+    pci_add_capability(&vdev->pdev, PCI_CAP_ID_VNDR, pos, VMD_SHADOW_CAP_LEN);
 
     memset(vdev->emulated_config_bits + pos, 0xFF, VMD_SHADOW_CAP_LEN);
     pos += PCI_CAP_FLAGS;
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 939dcc3d4a..2f0038a73f 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -1943,11 +1943,7 @@ static int vfio_setup_pcie_cap(VFIOPCIDevice *vdev, int pos, uint8_t size,
                                1, PCI_EXP_FLAGS_VERS);
     }
 
-    pos = pci_add_capability(&vdev->pdev, PCI_CAP_ID_EXP, pos, size,
-                             errp);
-    if (pos < 0) {
-        return pos;
-    }
+    pci_add_capability(&vdev->pdev, PCI_CAP_ID_EXP, pos, size);
 
     vdev->pdev.exp.exp_cap = pos;
 
@@ -2045,14 +2041,14 @@ static int vfio_add_std_cap(VFIOPCIDevice *vdev, uint8_t pos, Error **errp)
     case PCI_CAP_ID_PM:
         vfio_check_pm_reset(vdev, pos);
         vdev->pm_cap = pos;
-        ret = pci_add_capability(pdev, cap_id, pos, size, errp);
+        ret = pci_add_capability(pdev, cap_id, pos, size);
         break;
     case PCI_CAP_ID_AF:
         vfio_check_af_flr(vdev, pos);
-        ret = pci_add_capability(pdev, cap_id, pos, size, errp);
+        ret = pci_add_capability(pdev, cap_id, pos, size);
         break;
     default:
-        ret = pci_add_capability(pdev, cap_id, pos, size, errp);
+        ret = pci_add_capability(pdev, cap_id, pos, size);
         break;
     }
 
diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 45327f0b31..19ef46169f 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1148,14 +1148,13 @@ static bool virtio_pci_queue_enabled(DeviceState *d, int n)
     return virtio_queue_enabled_legacy(vdev, n);
 }
 
-static int virtio_pci_add_mem_cap(VirtIOPCIProxy *proxy,
-                                   struct virtio_pci_cap *cap)
+static uint8_t virtio_pci_add_mem_cap(VirtIOPCIProxy *proxy,
+                                      struct virtio_pci_cap *cap)
 {
     PCIDevice *dev = &proxy->pci_dev;
-    int offset;
+    uint8_t offset;
 
-    offset = pci_add_capability(dev, PCI_CAP_ID_VNDR, 0,
-                                cap->cap_len, &error_abort);
+    offset = pci_add_capability(dev, PCI_CAP_ID_VNDR, 0, cap->cap_len);
 
     assert(cap->cap_len >= sizeof *cap);
     memcpy(dev->config + offset + PCI_CAP_FLAGS, &cap->cap_len,
@@ -1859,18 +1858,11 @@ static void virtio_pci_realize(PCIDevice *pci_dev, Error **errp)
     }
 
     if (pcie_port && pci_is_express(pci_dev)) {
-        int pos;
+        uint8_t pos;
         uint16_t last_pcie_cap_offset = PCI_CONFIG_SPACE_SIZE;
 
-        pos = pcie_endpoint_cap_init(pci_dev, 0);
-        assert(pos > 0);
-
-        pos = pci_add_capability(pci_dev, PCI_CAP_ID_PM, 0,
-                                 PCI_PM_SIZEOF, errp);
-        if (pos < 0) {
-            return;
-        }
-
+        pcie_endpoint_cap_init(pci_dev, 0);
+        pos = pci_add_capability(pci_dev, PCI_CAP_ID_PM, 0, PCI_PM_SIZEOF);
         pci_dev->exp.pm_cap = pos;
 
         /*
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index b54b6ef88f..2a5d4b329f 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -390,9 +390,8 @@ void pci_register_vga(PCIDevice *pci_dev, MemoryRegion *mem,
 void pci_unregister_vga(PCIDevice *pci_dev);
 pcibus_t pci_get_bar_addr(PCIDevice *pci_dev, int region_num);
 
-int pci_add_capability(PCIDevice *pdev, uint8_t cap_id,
-                       uint8_t offset, uint8_t size,
-                       Error **errp);
+uint8_t pci_add_capability(PCIDevice *pdev, uint8_t cap_id,
+                           uint8_t offset, uint8_t size);
 
 void pci_del_capability(PCIDevice *pci_dev, uint8_t cap_id, uint8_t cap_size);
 
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
diff --git a/include/hw/pci/shpc.h b/include/hw/pci/shpc.h
index d5683b7399..b3be8a889f 100644
--- a/include/hw/pci/shpc.h
+++ b/include/hw/pci/shpc.h
@@ -8,7 +8,7 @@
 
 struct SHPCDevice {
     /* Capability offset in device's config space */
-    int cap;
+    uint8_t cap;
 
     /* # of hot-pluggable slots */
     int nslots;
@@ -38,8 +38,7 @@ struct SHPCDevice {
 
 void shpc_reset(PCIDevice *d);
 int shpc_bar_size(PCIDevice *dev);
-int shpc_init(PCIDevice *dev, PCIBus *sec_bus, MemoryRegion *bar,
-              unsigned off, Error **errp);
+int shpc_init(PCIDevice *dev, PCIBus *sec_bus, MemoryRegion *bar, unsigned off);
 void shpc_cleanup(PCIDevice *dev, MemoryRegion *bar);
 void shpc_free(PCIDevice *dev);
 void shpc_cap_write_config(PCIDevice *d, uint32_t addr, uint32_t val, int len);
diff --git a/include/hw/virtio/virtio-pci.h b/include/hw/virtio/virtio-pci.h
index 2446dcd9ae..9f3736723c 100644
--- a/include/hw/virtio/virtio-pci.h
+++ b/include/hw/virtio/virtio-pci.h
@@ -141,7 +141,7 @@ struct VirtIOPCIProxy {
     uint32_t msix_bar_idx;
     uint32_t modern_io_bar_idx;
     uint32_t modern_mem_bar_idx;
-    int config_cap;
+    uint8_t config_cap;
     uint32_t flags;
     bool disable_modern;
     bool ignore_backend_features;
-- 
2.37.2


