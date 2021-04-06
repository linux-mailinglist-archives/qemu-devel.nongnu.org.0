Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFB23551B5
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 13:16:26 +0200 (CEST)
Received: from localhost ([::1]:46488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTjh3-0001iI-Ng
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 07:16:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lTjf6-0000Vn-LZ
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 07:14:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lTjf4-0005wa-T3
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 07:14:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617707662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xEIoZ9Bv9C8PqaB9zYPlxU2z0nASwTi56Sb3t6QdC/c=;
 b=HG6WQa0/hc+qZ99QG//0Zlm8AVFzZC6ngy1A7mf8beR8RCKgfxEdQUo+6qLN8/+7T1MYAC
 JcUC8teOrchppwOXwD58ba6Jg5VuCwXSQkCFlK3yNBUSYgvfrcmvRtXR9U3g0Rdqy64Yax
 NWCechTyQspmp8J6u65sqKUawnqQKXo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-0zKdOxX-MtyKHE9EJkeKhw-1; Tue, 06 Apr 2021 07:14:20 -0400
X-MC-Unique: 0zKdOxX-MtyKHE9EJkeKhw-1
Received: by mail-wr1-f69.google.com with SMTP id r11so5054300wrp.8
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 04:14:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xEIoZ9Bv9C8PqaB9zYPlxU2z0nASwTi56Sb3t6QdC/c=;
 b=I7C7jMalGMU6GAUkOrpFSGFEQy9OP+agcxEE2t1Vz9lPB8vsDvzZvhCSTYWQBYLlG5
 E6N/SaX7ns3ivwEpI2P9aXl6s20sUtpUxVKddmuZNiI83epcH6vRljCtmUnSxNxVlh9t
 0K7/u0xtZxkdYoo8tpfRvE2mQkimdQsG0ziBsXEE5HSMtpEMTmL/te+KUC+NMIhllpHr
 qWJ3u8/wK7N/kfb3c0SYDh0AYmD73ccjigfMJ3F0VckcqxmUHptPsiXt4OLTGvGRUiKR
 Y8gTjL666Li0bCKC6QYPur6vOUsXd0+QGY3R5bpvUbKbTPuxm2nQs/86k9afAzul57kw
 KiGQ==
X-Gm-Message-State: AOAM533++FMyT8YQF12z7rXhAYJO7wckuPZ8aIiM8Qmkn8rVr7FH2Ulf
 /3qJLmmY9eOXk9VRoMVvdGP4vOcv4fGOpV5KLEjQ/iiDwPIuSZo3HzomFm+8ci4p40RxHL16LtZ
 fr/3HgJjizTfyj4bw4IpnKlvquO3qKyMoD3ZvxD49U1AFWtRkRFI/us7pOhir
X-Received: by 2002:a5d:6c6d:: with SMTP id r13mr34026042wrz.362.1617707659341; 
 Tue, 06 Apr 2021 04:14:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxluLhBJdCGo3UyklnDXUzFmDnuM+xu0HP+YQWJOp1ByJJDMRmrqGPoCPkSjaT1yXpM73Eoag==
X-Received: by 2002:a5d:6c6d:: with SMTP id r13mr34026022wrz.362.1617707659178; 
 Tue, 06 Apr 2021 04:14:19 -0700 (PDT)
Received: from redhat.com (bzq-79-183-252-180.red.bezeqint.net.
 [79.183.252.180])
 by smtp.gmail.com with ESMTPSA id e13sm36257578wrg.72.2021.04.06.04.14.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 04:14:18 -0700 (PDT)
Date: Tue, 6 Apr 2021 07:14:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/2] virtio-pci: compat page aligned ATS
Message-ID: <20210406111359.302193-3-mst@redhat.com>
References: <20210406111359.302193-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210406111359.302193-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jason Wang <jasowang@redhat.com>

Commit 4c70875372b8 ("pci: advertise a page aligned ATS") advertises
the page aligned via ATS capability (RO) to unbrek recent Linux IOMMU
drivers since 5.2. But it forgot the compat the capability which
breaks the migration from old machine type:

(qemu) qemu-kvm: get_pci_config_device: Bad config data: i=0x104 read:
0 device: 20 cmask: ff wmask: 0 w1cmask:0

This patch introduces a new parameter "x-ats-page-aligned" for
virtio-pci device and turns it on for machine type which is newer than
5.1.

Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Cc: qemu-stable@nongnu.org
Fixes: 4c70875372b8 ("pci: advertise a page aligned ATS")
Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20210406040330.11306-1-jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio-pci.h |  5 +++++
 include/hw/pci/pcie.h  |  2 +-
 hw/core/machine.c      |  1 +
 hw/pci/pcie.c          | 10 ++++++----
 hw/virtio/virtio-pci.c |  5 ++++-
 5 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/hw/virtio/virtio-pci.h b/hw/virtio/virtio-pci.h
index d7d5d403a9..2446dcd9ae 100644
--- a/hw/virtio/virtio-pci.h
+++ b/hw/virtio/virtio-pci.h
@@ -42,6 +42,7 @@ enum {
     VIRTIO_PCI_FLAG_INIT_PM_BIT,
     VIRTIO_PCI_FLAG_INIT_FLR_BIT,
     VIRTIO_PCI_FLAG_AER_BIT,
+    VIRTIO_PCI_FLAG_ATS_PAGE_ALIGNED_BIT,
 };
 
 /* Need to activate work-arounds for buggy guests at vmstate load. */
@@ -84,6 +85,10 @@ enum {
 /* Advanced Error Reporting capability */
 #define VIRTIO_PCI_FLAG_AER (1 << VIRTIO_PCI_FLAG_AER_BIT)
 
+/* Page Aligned Address space Translation Service */
+#define VIRTIO_PCI_FLAG_ATS_PAGE_ALIGNED \
+  (1 << VIRTIO_PCI_FLAG_ATS_PAGE_ALIGNED_BIT)
+
 typedef struct {
     MSIMessage msg;
     int virq;
diff --git a/include/hw/pci/pcie.h b/include/hw/pci/pcie.h
index 14c58ebdb6..6063bee0ec 100644
--- a/include/hw/pci/pcie.h
+++ b/include/hw/pci/pcie.h
@@ -137,7 +137,7 @@ void pcie_acs_reset(PCIDevice *dev);
 
 void pcie_ari_init(PCIDevice *dev, uint16_t offset, uint16_t nextfn);
 void pcie_dev_ser_num_init(PCIDevice *dev, uint16_t offset, uint64_t ser_num);
-void pcie_ats_init(PCIDevice *dev, uint16_t offset);
+void pcie_ats_init(PCIDevice *dev, uint16_t offset, bool aligned);
 
 void pcie_cap_slot_pre_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
                                Error **errp);
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 9935c6ddd5..a50f2d5f0a 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -53,6 +53,7 @@ GlobalProperty hw_compat_5_1[] = {
     { "nvme", "use-intel-id", "on"},
     { "pvpanic", "events", "1"}, /* PVPANIC_PANICKED */
     { "pl011", "migrate-clk", "off" },
+    { "virtio-pci", "x-ats-page-aligned", "off"},
 };
 const size_t hw_compat_5_1_len = G_N_ELEMENTS(hw_compat_5_1);
 
diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index a733e2fb87..fd0fa157e8 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -963,16 +963,18 @@ void pcie_dev_ser_num_init(PCIDevice *dev, uint16_t offset, uint64_t ser_num)
     pci_set_quad(dev->config + offset + pci_dsn_cap, ser_num);
 }
 
-void pcie_ats_init(PCIDevice *dev, uint16_t offset)
+void pcie_ats_init(PCIDevice *dev, uint16_t offset, bool aligned)
 {
     pcie_add_capability(dev, PCI_EXT_CAP_ID_ATS, 0x1,
                         offset, PCI_EXT_CAP_ATS_SIZEOF);
 
     dev->exp.ats_cap = offset;
 
-    /* Invalidate Queue Depth 0, Page Aligned Request 1 */
-    pci_set_word(dev->config + offset + PCI_ATS_CAP,
-                 PCI_ATS_CAP_PAGE_ALIGNED);
+    /* Invalidate Queue Depth 0 */
+    if (aligned) {
+        pci_set_word(dev->config + offset + PCI_ATS_CAP,
+                     PCI_ATS_CAP_PAGE_ALIGNED);
+    }
     /* STU 0, Disabled by default */
     pci_set_word(dev->config + offset + PCI_ATS_CTRL, 0);
 
diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index c1b67cf6fc..b321604d9b 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1856,7 +1856,8 @@ static void virtio_pci_realize(PCIDevice *pci_dev, Error **errp)
         }
 
         if (proxy->flags & VIRTIO_PCI_FLAG_ATS) {
-            pcie_ats_init(pci_dev, last_pcie_cap_offset);
+            pcie_ats_init(pci_dev, last_pcie_cap_offset,
+                          proxy->flags & VIRTIO_PCI_FLAG_ATS_PAGE_ALIGNED);
             last_pcie_cap_offset += PCI_EXT_CAP_ATS_SIZEOF;
         }
 
@@ -1933,6 +1934,8 @@ static Property virtio_pci_properties[] = {
                      ignore_backend_features, false),
     DEFINE_PROP_BIT("ats", VirtIOPCIProxy, flags,
                     VIRTIO_PCI_FLAG_ATS_BIT, false),
+    DEFINE_PROP_BIT("x-ats-page-aligned", VirtIOPCIProxy, flags,
+                    VIRTIO_PCI_FLAG_ATS_PAGE_ALIGNED_BIT, true),
     DEFINE_PROP_BIT("x-pcie-deverr-init", VirtIOPCIProxy, flags,
                     VIRTIO_PCI_FLAG_INIT_DEVERR_BIT, true),
     DEFINE_PROP_BIT("x-pcie-lnkctl-init", VirtIOPCIProxy, flags,
-- 
MST


