Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E343D4670CF
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 04:38:51 +0100 (CET)
Received: from localhost ([::1]:59074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mszPN-0004Pl-Na
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 22:38:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1mszNA-0002cu-7k
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 22:36:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1mszN8-0002UO-20
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 22:36:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638502589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KrtG7EFdXu3WYzQrnqhNq8mlBC6GR2iZE3J/xMT9eXc=;
 b=MWJjP1erz30BCXQNO/s3NSs4AstvHdZoeRIP4BwHoPjtHBghu2VPmkyfFWI24rjdfHDTEX
 2S+sUYhhrT+l93MfRryQuVHTb7bt3WEJJ+zf3K18OiNTsl975Lln9aKoNExN8qHqyaj5PB
 RsJh/i8RPX2U4eqUmNGjR5P0ZccJgjo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-mNUilIr4MpiAPVzbzLiasQ-1; Thu, 02 Dec 2021 22:36:26 -0500
X-MC-Unique: mNUilIr4MpiAPVzbzLiasQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3139801B17;
 Fri,  3 Dec 2021 03:36:24 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-43.bne.redhat.com [10.64.54.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4ACB119724;
 Fri,  3 Dec 2021 03:36:11 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v2 1/2] hw/arm/virt: Support for virtio-mem-pci
Date: Fri,  3 Dec 2021 11:35:21 +0800
Message-Id: <20211203033522.27580-2-gshan@redhat.com>
In-Reply-To: <20211203033522.27580-1-gshan@redhat.com>
References: <20211203033522.27580-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, david@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, eric.auger@redhat.com,
 shan.gavin@gmail.com, Jonathan.Cameron@huawei.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This supports virtio-mem-pci device on "virt" platform, by simply
following the implementation on x86.

   * This implements the hotplug handlers to support virtio-mem-pci
     device hot-add, while the hot-remove isn't supported as we have
     on x86.

   * The block size is 512MB on ARM64 instead of 128MB on x86.

   * It has been passing the tests with various combinations like 64KB
     and 4KB page sizes on host and guest, different memory device
     backends like normal, transparent huge page and HugeTLB, plus
     migration.

Co-developed-by: David Hildenbrand <david@redhat.com>
Co-developed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/arm/Kconfig         |  1 +
 hw/arm/virt.c          | 68 +++++++++++++++++++++++++++++++++++++++++-
 hw/virtio/virtio-mem.c |  4 ++-
 3 files changed, 71 insertions(+), 2 deletions(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 2d37d29f02..15aff8efb8 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -27,6 +27,7 @@ config ARM_VIRT
     select DIMM
     select ACPI_HW_REDUCED
     select ACPI_APEI
+    select VIRTIO_MEM_SUPPORTED
 
 config CHEETAH
     bool
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 369552ad45..f4599a5ef0 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -71,9 +71,11 @@
 #include "hw/arm/smmuv3.h"
 #include "hw/acpi/acpi.h"
 #include "target/arm/internals.h"
+#include "hw/mem/memory-device.h"
 #include "hw/mem/pc-dimm.h"
 #include "hw/mem/nvdimm.h"
 #include "hw/acpi/generic_event_device.h"
+#include "hw/virtio/virtio-mem-pci.h"
 #include "hw/virtio/virtio-iommu.h"
 #include "hw/char/pl011.h"
 #include "qemu/guest-random.h"
@@ -2480,6 +2482,63 @@ static void virt_memory_plug(HotplugHandler *hotplug_dev,
                          dev, &error_abort);
 }
 
+static void virt_virtio_md_pci_pre_plug(HotplugHandler *hotplug_dev,
+                                        DeviceState *dev, Error **errp)
+{
+    HotplugHandler *hotplug_dev2 = qdev_get_bus_hotplug_handler(dev);
+    Error *local_err = NULL;
+
+    if (!hotplug_dev2 && dev->hotplugged) {
+        /*
+         * Without a bus hotplug handler, we cannot control the plug/unplug
+         * order. We should never reach this point when hotplugging on x86,
+         * however, better add a safety net.
+         */
+        error_setg(errp, "hotplug of virtio based memory devices not supported"
+                   " on this bus.");
+        return;
+    }
+    /*
+     * First, see if we can plug this memory device at all. If that
+     * succeeds, branch of to the actual hotplug handler.
+     */
+    memory_device_pre_plug(MEMORY_DEVICE(dev), MACHINE(hotplug_dev), NULL,
+                           &local_err);
+    if (!local_err && hotplug_dev2) {
+        hotplug_handler_pre_plug(hotplug_dev2, dev, &local_err);
+    }
+    error_propagate(errp, local_err);
+}
+
+static void virt_virtio_md_pci_plug(HotplugHandler *hotplug_dev,
+                                    DeviceState *dev, Error **errp)
+{
+    HotplugHandler *hotplug_dev2 = qdev_get_bus_hotplug_handler(dev);
+    Error *local_err = NULL;
+
+    /*
+     * Plug the memory device first and then branch off to the actual
+     * hotplug handler. If that one fails, we can easily undo the memory
+     * device bits.
+     */
+    memory_device_plug(MEMORY_DEVICE(dev), MACHINE(hotplug_dev));
+    if (hotplug_dev2) {
+        hotplug_handler_plug(hotplug_dev2, dev, &local_err);
+        if (local_err) {
+            memory_device_unplug(MEMORY_DEVICE(dev), MACHINE(hotplug_dev));
+        }
+    }
+    error_propagate(errp, local_err);
+}
+
+static void virt_virtio_md_pci_unplug_request(HotplugHandler *hotplug_dev,
+                                              DeviceState *dev, Error **errp)
+{
+    /* We don't support hot unplug of virtio based memory devices */
+    error_setg(errp, "virtio based memory devices cannot be unplugged.");
+}
+
+
 static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
                                             DeviceState *dev, Error **errp)
 {
@@ -2513,6 +2572,8 @@ static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
         qdev_prop_set_uint32(dev, "len-reserved-regions", 1);
         qdev_prop_set_string(dev, "reserved-regions[0]", resv_prop_str);
         g_free(resv_prop_str);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
+        virt_virtio_md_pci_pre_plug(hotplug_dev, dev, errp);
     }
 }
 
@@ -2538,6 +2599,8 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
         vms->iommu = VIRT_IOMMU_VIRTIO;
         vms->virtio_iommu_bdf = pci_get_bdf(pdev);
         create_virtio_iommu_dt_bindings(vms);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
+        virt_virtio_md_pci_plug(hotplug_dev, dev, errp);
     }
 }
 
@@ -2588,6 +2651,8 @@ static void virt_machine_device_unplug_request_cb(HotplugHandler *hotplug_dev,
 {
     if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
         virt_dimm_unplug_request(hotplug_dev, dev, errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
+        virt_virtio_md_pci_unplug_request(hotplug_dev, dev, errp);
     } else {
         error_setg(errp, "device unplug request for unsupported device"
                    " type: %s", object_get_typename(OBJECT(dev)));
@@ -2611,7 +2676,8 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
     MachineClass *mc = MACHINE_GET_CLASS(machine);
 
     if (device_is_dynamic_sysbus(mc, dev) ||
-       (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM))) {
+        object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) ||
+        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
         return HOTPLUG_HANDLER(machine);
     }
     if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index d5a578142b..ac7a40f514 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -117,7 +117,7 @@ static uint64_t virtio_mem_default_block_size(RAMBlock *rb)
  * The memory block size corresponds mostly to the section size.
  *
  * This allows e.g., to add 20MB with a section size of 128MB on x86_64, and
- * a section size of 1GB on arm64 (as long as the start address is properly
+ * a section size of 512MB on arm64 (as long as the start address is properly
  * aligned, similar to ordinary DIMMs).
  *
  * We can change this at any time and maybe even make it configurable if
@@ -126,6 +126,8 @@ static uint64_t virtio_mem_default_block_size(RAMBlock *rb)
  */
 #if defined(TARGET_X86_64) || defined(TARGET_I386)
 #define VIRTIO_MEM_USABLE_EXTENT (2 * (128 * MiB))
+#elif defined(TARGET_ARM)
+#define VIRTIO_MEM_USABLE_EXTENT (2 * (512 * MiB))
 #else
 #error VIRTIO_MEM_USABLE_EXTENT not defined
 #endif
-- 
2.23.0


