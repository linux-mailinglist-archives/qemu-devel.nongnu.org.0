Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E104464C6D7
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 11:11:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Oi5-0007gx-27; Wed, 14 Dec 2022 05:09:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p5Ohr-0007cC-FI
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 05:09:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p5Ohe-00017c-GP
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 05:09:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671012565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cBez5/22PyLA7ndtkwULR/IZ5CbFM7noqm5OTnaRikk=;
 b=X3A9dnnLRQZXGAQQsxnZ+DLbGHXAc9iuP38t2uem6NK9OUhn3rMvwxuW1Eau4OhcHptzs3
 gi9q6bm4FWmHe34C3Qeivr5/AdqnfkvMxPGraAcj2RYHN4In7N/X9wk1dU7H/MK96Yx2A3
 OeH3aOPfas9HcHTzbSkNMfocZGNJZ2Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-282-YiMGrhyXNJeTLV52dIwtbg-1; Wed, 14 Dec 2022 05:09:22 -0500
X-MC-Unique: YiMGrhyXNJeTLV52dIwtbg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5F711C08962;
 Wed, 14 Dec 2022 10:09:21 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B5FC6492C14;
 Wed, 14 Dec 2022 10:09:20 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>
Subject: [PULL 03/23] s390x/pci: reset ISM passthrough devices on shutdown and
 system reset
Date: Wed, 14 Dec 2022 11:08:51 +0100
Message-Id: <20221214100911.165291-4-thuth@redhat.com>
In-Reply-To: <20221214100911.165291-1-thuth@redhat.com>
References: <20221214100911.165291-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Matthew Rosato <mjrosato@linux.ibm.com>

ISM device firmware stores unique state information that can
can cause a wholesale unmap of the associated IOMMU (e.g. when
we get a termination signal for QEMU) to trigger firmware errors
because firmware believes we are attempting to invalidate entries
that are still in-use by the guest OS (when in fact that guest is
in the process of being terminated or rebooted).
To alleviate this, register both a shutdown notifier (for unexpected
termination cases e.g. virsh destroy) as well as a reset callback
(for cases like guest OS reboot).  For each of these scenarios, trigger
PCI device reset; this is enough to indicate to firmware that the IOMMU
is no longer in-use by the guest OS, making it safe to invalidate any
associated IOMMU entries.

Fixes: 15d0e7942d3b ("s390x/pci: don't fence interpreted devices without MSI-X")
Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
Message-Id: <20221209195700.263824-1-mjrosato@linux.ibm.com>
Reviewed-by: Eric Farman <farman@linux.ibm.com>
[thuth: Adjusted the hunk in s390-pci-vfio.c due to different context]
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/hw/s390x/s390-pci-bus.h |  5 +++++
 hw/s390x/s390-pci-bus.c         | 28 ++++++++++++++++++++++++++++
 hw/s390x/s390-pci-vfio.c        |  2 ++
 3 files changed, 35 insertions(+)

diff --git a/include/hw/s390x/s390-pci-bus.h b/include/hw/s390x/s390-pci-bus.h
index 1c46e3a269..e0a9f9385b 100644
--- a/include/hw/s390x/s390-pci-bus.h
+++ b/include/hw/s390x/s390-pci-bus.h
@@ -39,6 +39,9 @@
 #define UID_CHECKING_ENABLED 0x01
 #define ZPCI_DTSM 0x40
 
+/* zPCI Function Types */
+#define ZPCI_PFT_ISM 5
+
 OBJECT_DECLARE_SIMPLE_TYPE(S390pciState, S390_PCI_HOST_BRIDGE)
 OBJECT_DECLARE_SIMPLE_TYPE(S390PCIBus, S390_PCI_BUS)
 OBJECT_DECLARE_SIMPLE_TYPE(S390PCIBusDevice, S390_PCI_DEVICE)
@@ -344,6 +347,7 @@ struct S390PCIBusDevice {
     uint16_t noi;
     uint16_t maxstbl;
     uint8_t sum;
+    uint8_t pft;
     S390PCIGroup *pci_group;
     ClpRspQueryPci zpci_fn;
     S390MsixInfo msix;
@@ -352,6 +356,7 @@ struct S390PCIBusDevice {
     MemoryRegion msix_notify_mr;
     IndAddr *summary_ind;
     IndAddr *indicator;
+    Notifier shutdown_notifier;
     bool pci_unplug_request_processed;
     bool unplug_requested;
     bool interp;
diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
index 977e7daa15..02751f3597 100644
--- a/hw/s390x/s390-pci-bus.c
+++ b/hw/s390x/s390-pci-bus.c
@@ -24,6 +24,8 @@
 #include "hw/pci/msi.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
+#include "sysemu/reset.h"
+#include "sysemu/runstate.h"
 
 #ifndef DEBUG_S390PCI_BUS
 #define DEBUG_S390PCI_BUS  0
@@ -150,10 +152,30 @@ out:
     psccb->header.response_code = cpu_to_be16(rc);
 }
 
+static void s390_pci_shutdown_notifier(Notifier *n, void *opaque)
+{
+    S390PCIBusDevice *pbdev = container_of(n, S390PCIBusDevice,
+                                           shutdown_notifier);
+
+    pci_device_reset(pbdev->pdev);
+}
+
+static void s390_pci_reset_cb(void *opaque)
+{
+    S390PCIBusDevice *pbdev = opaque;
+
+    pci_device_reset(pbdev->pdev);
+}
+
 static void s390_pci_perform_unplug(S390PCIBusDevice *pbdev)
 {
     HotplugHandler *hotplug_ctrl;
 
+    if (pbdev->pft == ZPCI_PFT_ISM) {
+        notifier_remove(&pbdev->shutdown_notifier);
+        qemu_unregister_reset(s390_pci_reset_cb, pbdev);
+    }
+
     /* Unplug the PCI device */
     if (pbdev->pdev) {
         DeviceState *pdev = DEVICE(pbdev->pdev);
@@ -1111,6 +1133,12 @@ static void s390_pcihost_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
                 pbdev->fh |= FH_SHM_VFIO;
                 pbdev->forwarding_assist = false;
             }
+            /* Register shutdown notifier and reset callback for ISM devices */
+            if (pbdev->pft == ZPCI_PFT_ISM) {
+                pbdev->shutdown_notifier.notify = s390_pci_shutdown_notifier;
+                qemu_register_shutdown_notifier(&pbdev->shutdown_notifier);
+                qemu_register_reset(s390_pci_reset_cb, pbdev);
+            }
         } else {
             pbdev->fh |= FH_SHM_EMUL;
             /* Always intercept emulated devices */
diff --git a/hw/s390x/s390-pci-vfio.c b/hw/s390x/s390-pci-vfio.c
index f7bf36cec8..f51190d466 100644
--- a/hw/s390x/s390-pci-vfio.c
+++ b/hw/s390x/s390-pci-vfio.c
@@ -124,6 +124,8 @@ static void s390_pci_read_base(S390PCIBusDevice *pbdev,
     /* The following values remain 0 until we support other FMB formats */
     pbdev->zpci_fn.fmbl = 0;
     pbdev->zpci_fn.pft = 0;
+    /* Store function type separately for type-specific behavior */
+    pbdev->pft = cap->pft;
 
     /*
      * If appropriate, reduce the size of the supported DMA aperture reported
-- 
2.31.1


