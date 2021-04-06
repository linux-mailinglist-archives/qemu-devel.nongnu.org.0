Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE2F354B80
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 06:05:22 +0200 (CEST)
Received: from localhost ([::1]:58570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTcxt-0006LK-Qk
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 00:05:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lTcwV-0005pG-MC
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 00:03:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lTcwS-000370-Ka
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 00:03:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617681831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uw42rPBmwJ1zgv4AIpERmIU8+VMMK6fdiUcwazQu1c0=;
 b=WHbENg4NhsUqmbHbvdMXdhEb4LrdUSKUaRvlPCciVm6KgjRdlNf0q1dInytEzsMEpKg0MF
 yD0/OEl10JOVnTioJWBzIyYMvArCudNtjLGMD/UFaPZ8gJ5QgurrQbAoweK5P9sWsykJkj
 rHsdTDpze2oga1V9fRy22J9JQ2UcpkU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-98_1yO8VNniRUzKT2kpzDA-1; Tue, 06 Apr 2021 00:03:48 -0400
X-MC-Unique: 98_1yO8VNniRUzKT2kpzDA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D788180FCAB;
 Tue,  6 Apr 2021 04:03:47 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-96.pek2.redhat.com [10.72.13.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E1A39F6A;
 Tue,  6 Apr 2021 04:03:33 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH V2] virtio-pci: compat page aligned ATS
Date: Tue,  6 Apr 2021 12:03:30 +0800
Message-Id: <20210406040330.11306-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
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
Cc: ehabkost@redhat.com, Jason Wang <jasowang@redhat.com>,
 qemu-stable@nongnu.org, peterx@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
Changes since V1:
- switch to use "x-ats-page-aligned" instead
---
 hw/core/machine.c      |  1 +
 hw/pci/pcie.c          | 10 ++++++----
 hw/virtio/virtio-pci.c |  5 ++++-
 hw/virtio/virtio-pci.h |  5 +++++
 include/hw/pci/pcie.h  |  2 +-
 5 files changed, 17 insertions(+), 6 deletions(-)

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
index 883045a223..2b7142a21e 100644
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
+    DEFINE_PROP_BIT("x-ats-page-aligned", VirtIOPCIProxy, flags,
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


