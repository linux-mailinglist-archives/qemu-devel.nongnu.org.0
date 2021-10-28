Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EFB43DA73
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 06:37:41 +0200 (CEST)
Received: from localhost ([::1]:37518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfxAa-0001UF-Qv
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 00:37:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mfx5O-0004ee-6b
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 00:32:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mfx5M-0000UR-Dg
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 00:32:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635395535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YH8yplBAnObRfPP9y1l2ATyeHY/CS+/4q2iAtlXiHIM=;
 b=jCU/HqMsoVh28rcRqghrst9oOENaYqJ/VqsOZOa8on1kQY9UiXn5lz3rdNvyjsWSfBpulW
 Kk+QLsPLK1iDAUPV0PpYMvdgoc2fKyxNpxNDCSqt8xmAL8r/bYT6NrBj1KY4SWtwYrfYul
 DtlfunPmv3uVnwdQlnVt1K0bEyBs9ok=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-Q-ysD1aCPVCoJ64oD8NUvQ-1; Thu, 28 Oct 2021 00:32:14 -0400
X-MC-Unique: Q-ysD1aCPVCoJ64oD8NUvQ-1
Received: by mail-pf1-f197.google.com with SMTP id
 z2-20020aa79482000000b0047c0239f1e3so2624008pfk.22
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 21:32:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YH8yplBAnObRfPP9y1l2ATyeHY/CS+/4q2iAtlXiHIM=;
 b=ydDUMNJ0i4qa11PCCwyZPjroJCqdD3M0GMd9Ajsz810x+9qXi81QGw4uIqqA8nu/EN
 cplV42cuuyUqGrOWq5HbGSg3kWNzsqHQ0yJMlKII9jvRkja0etONkV3nuAv5pZKNtHaV
 yRNGjQAouva83TgoVe49EKtHt4vmvJaXON0mggfA4j6XJB1Rr6Wzh/zoKr+iaV8/yIFJ
 xtVZRTtfIqYkeJ62yi3kDctZjc8OZWwM80t72ytcV7kwh7wJiq6kf9qYm9MFvY1zSG2j
 TFADO2Fk8kw3Rrpuhs15ciVmFsTY2xFnLj+uvSe6mxVxA1csdCI7LpVEbhF2LA3Z0e0l
 vgAQ==
X-Gm-Message-State: AOAM532SDrXiP2ZKmXXkE6ieR4sU70kDkFYXk2OksvLkpcIrWw9C36HJ
 T5QAvbOqkMwYUiWpQJqQm1k3rDi+lLDCntHDmoZomzdSsgW/MNmqa3FWCWcsgqgyJdcp+bhqtPK
 +pOSqIvmbLJEV9/6G70WexYrcddUvgzF2F2+qEkE1w1M6NF4wPhMf4jlZdBmVQr5G
X-Received: by 2002:a17:902:6a86:b0:13f:f048:9778 with SMTP id
 n6-20020a1709026a8600b0013ff0489778mr1586854plk.27.1635395533165; 
 Wed, 27 Oct 2021 21:32:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCwRBEyPBgLMHB7eYTygG8lgMQQvMuJn4SiomcgiSq4JKwz0xnaoLsqqRZzQhJxENLA+wlIQ==
X-Received: by 2002:a17:902:6a86:b0:13f:f048:9778 with SMTP id
 n6-20020a1709026a8600b0013ff0489778mr1586807plk.27.1635395532696; 
 Wed, 27 Oct 2021 21:32:12 -0700 (PDT)
Received: from localhost.localdomain ([191.101.132.60])
 by smtp.gmail.com with ESMTPSA id k22sm1483074pfi.149.2021.10.27.21.32.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 27 Oct 2021 21:32:12 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/5] pc/q35: Add pre-plug hook for x86-iommu
Date: Thu, 28 Oct 2021 12:31:29 +0800
Message-Id: <20211028043129.38871-6-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211028043129.38871-1-peterx@redhat.com>
References: <20211028043129.38871-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, peterx@redhat.com,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a pre-plug hook for x86-iommu, so that we can detect vfio-pci devices
before realizing the vIOMMU device.

When the guest contains both the x86 vIOMMU and vfio-pci devices, the user
needs to specify the x86 vIOMMU before the vfio-pci devices.  The reason is,
vfio_realize() calls pci_device_iommu_address_space() to fetch the correct dma
address space for the device, while that API can only work right after the
vIOMMU device initialized first.

For example, the iommu_fn() that is used in pci_device_iommu_address_space() is
only setup in realize() of the vIOMMU devices.

For a long time we have had libvirt making sure that the ordering is correct,
however from qemu side we never fail a guest from booting even if the ordering
is specified wrongly.  When the order is wrong, the guest will encounter
misterious error when operating on the vfio-pci device because in QEMU we'll
still assume the vfio-pci devices are put into the default DMA domain (which is
normally the direct GPA mapping), so e.g. the DMAs will never go right.

This patch fails the guest from booting when we detected such errornous cmdline
specified, then the guest at least won't encounter weird device behavior after
booted.  The error message will also help the user to know how to fix the issue.

Cc: Alex Williamson <alex.williamson@redhat.com>
Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 hw/i386/pc.c                |  4 ++++
 hw/i386/x86-iommu.c         | 14 ++++++++++++++
 include/hw/i386/x86-iommu.h |  8 ++++++++
 3 files changed, 26 insertions(+)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 86223acfd3..b70a04011e 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -81,6 +81,7 @@
 #include "hw/core/cpu.h"
 #include "hw/usb.h"
 #include "hw/i386/intel_iommu.h"
+#include "hw/i386/x86-iommu.h"
 #include "hw/net/ne2000-isa.h"
 #include "standard-headers/asm-x86/bootparam.h"
 #include "hw/virtio/virtio-pmem-pci.h"
@@ -1327,6 +1328,8 @@ static void pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
         pc_memory_pre_plug(hotplug_dev, dev, errp);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
         x86_cpu_pre_plug(hotplug_dev, dev, errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_X86_IOMMU_DEVICE)) {
+        x86_iommu_pre_plug(X86_IOMMU_DEVICE(dev), errp);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
                object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
         pc_virtio_md_pci_pre_plug(hotplug_dev, dev, errp);
@@ -1383,6 +1386,7 @@ static HotplugHandler *pc_get_hotplug_handler(MachineState *machine,
 {
     if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) ||
         object_dynamic_cast(OBJECT(dev), TYPE_CPU) ||
+        object_dynamic_cast(OBJECT(dev), TYPE_X86_IOMMU_DEVICE) ||
         object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
         object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
         return HOTPLUG_HANDLER(machine);
diff --git a/hw/i386/x86-iommu.c b/hw/i386/x86-iommu.c
index 86ad03972e..c9ee9041a3 100644
--- a/hw/i386/x86-iommu.c
+++ b/hw/i386/x86-iommu.c
@@ -22,6 +22,7 @@
 #include "hw/i386/x86-iommu.h"
 #include "hw/qdev-properties.h"
 #include "hw/i386/pc.h"
+#include "hw/vfio/pci.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "trace.h"
@@ -103,6 +104,19 @@ IommuType x86_iommu_get_type(void)
     return x86_iommu_default->type;
 }
 
+void x86_iommu_pre_plug(X86IOMMUState *iommu, Error **errp)
+{
+    bool ambiguous = false;
+    Object *object;
+
+    object = object_resolve_path_type("", TYPE_VFIO_PCI, &ambiguous);
+    if (object || ambiguous) {
+        /* There're one or more vfio-pci devices detected */
+        error_setg(errp, "Please specify all the vfio-pci devices to be after "
+                   "the vIOMMU device");
+    }
+}
+
 static void x86_iommu_realize(DeviceState *dev, Error **errp)
 {
     X86IOMMUState *x86_iommu = X86_IOMMU_DEVICE(dev);
diff --git a/include/hw/i386/x86-iommu.h b/include/hw/i386/x86-iommu.h
index 9de92d33a1..e8b6c293e0 100644
--- a/include/hw/i386/x86-iommu.h
+++ b/include/hw/i386/x86-iommu.h
@@ -172,4 +172,12 @@ void x86_iommu_iec_notify_all(X86IOMMUState *iommu, bool global,
  * @out: Output MSI message
  */
 void x86_iommu_irq_to_msi_message(X86IOMMUIrq *irq, MSIMessage *out);
+
+/**
+ * x86_iommu_pre_plug: called before plugging the iommu device
+ * @X86IOMMUState: the pointer to x86 iommu state
+ * @errp: the double pointer to Error, set if we want to fail the plug
+ */
+void x86_iommu_pre_plug(X86IOMMUState *iommu, Error **errp);
+
 #endif
-- 
2.32.0


