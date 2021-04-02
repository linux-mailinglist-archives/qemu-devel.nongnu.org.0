Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0165F352721
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 09:56:45 +0200 (CEST)
Received: from localhost ([::1]:38428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSEfc-0008EE-3I
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 03:56:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lSEec-0007bb-2m
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 03:55:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lSEeY-0007pE-5f
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 03:55:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617350135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LQSXTJukM5ihGwcdNbYko6M6ndJQ21YAHjyllK9j1b4=;
 b=OOVN+3ZySxSDBkFZqGGN48GUIc/V9QsjEIFRy7Lt/ulBL9jSE5PmuZ7xWNcn4931/SgXnJ
 HTKCP18Zr5lpENk9q4PuEXCMyE+o/OnZVQIZtUFVOmnNzSamwpjFDF9oqbp4DrmaDieD7p
 qW7goMSC8IVT+ixIP+7Rmg/abIWvAW0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-Wg-9JGzzOQeU62l9rQfGcA-1; Fri, 02 Apr 2021 03:55:33 -0400
X-MC-Unique: Wg-9JGzzOQeU62l9rQfGcA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB58287A83A;
 Fri,  2 Apr 2021 07:55:32 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-26.pek2.redhat.com [10.72.12.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4660B19D9D;
 Fri,  2 Apr 2021 07:55:22 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: ehabkost@redhat.com,
	mst@redhat.com,
	marcel.apfelbaum@gmail.com
Subject: [PATCH] virtio-pci: compat page aligned ATS
Date: Fri,  2 Apr 2021 15:55:20 +0800
Message-Id: <20210402075520.65871-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-stable@nongnu.org,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 4c70875372b8 ("pci: advertise a page aligned ATS") advertises
the page aligned via ATS capability (RO) to unbrek recent Linux IOMMU
drivers since 5.2. But it forgot the compat the capability which
breaks the migration from old machine type:

(qemu) qemu-kvm: get_pci_config_device: Bad config data: i=0x104 read:
0 device: 20 cmask: ff wmask: 0 w1cmask:0

This patch introduces a new parameter "ats_page_aligned" for
virtio-pci device and turn it on for machine type which is newer than
5.1.

Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Cc: qemu-stable@nongnu.org
Fixes: 4c70875372b8 ("pci: advertise a page aligned ATS")
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/core/machine.c      |  1 +
 hw/pci/pcie.c          | 10 ++++++----
 hw/virtio/virtio-pci.c |  5 ++++-
 hw/virtio/virtio-pci.h |  5 +++++
 include/hw/pci/pcie.h  |  2 +-
 5 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 9935c6ddd5..ad4459b0f2 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -53,6 +53,7 @@ GlobalProperty hw_compat_5_1[] = {
     { "nvme", "use-intel-id", "on"},
     { "pvpanic", "events", "1"}, /* PVPANIC_PANICKED */
     { "pl011", "migrate-clk", "off" },
+    { "virtio-pci", "ats_page_aligned", "off"},
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
index 883045a223..ebe9716acf 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1848,7 +1848,8 @@ static void virtio_pci_realize(PCIDevice *pci_dev, Error **errp)
         }
 
         if (proxy->flags & VIRTIO_PCI_FLAG_ATS) {
-            pcie_ats_init(pci_dev, last_pcie_cap_offset);
+            pcie_ats_init(pci_dev, last_pcie_cap_offset,
+                          proxy->flags & VIRTIO_PCI_FLAG_ATS_PAGE_ALIGNED);
             last_pcie_cap_offset += PCI_EXT_CAP_ATS_SIZEOF;
         }
 
@@ -1925,6 +1926,8 @@ static Property virtio_pci_properties[] = {
                      ignore_backend_features, false),
     DEFINE_PROP_BIT("ats", VirtIOPCIProxy, flags,
                     VIRTIO_PCI_FLAG_ATS_BIT, false),
+    DEFINE_PROP_BIT("ats_page_aligned", VirtIOPCIProxy, flags,
+                    VIRTIO_PCI_FLAG_ATS_PAGE_ALIGNED_BIT, true),
     DEFINE_PROP_BIT("x-pcie-deverr-init", VirtIOPCIProxy, flags,
                     VIRTIO_PCI_FLAG_INIT_DEVERR_BIT, true),
     DEFINE_PROP_BIT("x-pcie-lnkctl-init", VirtIOPCIProxy, flags,
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
-- 
2.24.3 (Apple Git-128)


