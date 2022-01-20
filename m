Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75227495280
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 17:39:39 +0100 (CET)
Received: from localhost ([::1]:60976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAaTK-00076g-29
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 11:39:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgM-0004A6-ET
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:36:50 -0500
Received: from [2a00:1450:4864:20::32a] (port=46788
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgI-00039a-MP
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:36:49 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 az27-20020a05600c601b00b0034d2956eb04so13323420wmb.5
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 04:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ab/dkLzwvDr7LhtwqKgUez1vfEeYaDijkxEPKSjd4oE=;
 b=j5mrp54wXs61mWEBROj/GLeextdY6YiiMpBvCHS58VBPFda4litJyjLOyscow2JX/K
 2c8kIcgtdcVm8dykWzdYVg+TsLvDxF883keKRHcwDWPBtSHBtjgvdp2fnk4kgh94dOro
 vDSnhHVkLeojrKHTjjqhhXjfwRGpuIF0yV4sAKXRzCg9y8eyD4JYUBXillRqHVHv1h62
 4fBbAXNCDNpPhPFk8gqj+uZW+k/e9OXkOOYA5M1cnUkuPK2AiGhWHg5qLMqPjUtwyADk
 UP1SkIzY84kRaCM/sNYaKmMR4Su7JMg9kMXxxihqEgi/TueAw2+Uf7hV4GdcTK8OnnvF
 zWuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ab/dkLzwvDr7LhtwqKgUez1vfEeYaDijkxEPKSjd4oE=;
 b=co7/k/Wl0Pit3HAslsF4uCagbGVrjm8COdavQmSadGVNCiCrg2qEOHldhsGJHZ0ZcE
 Uoa94W1heuZDl39i9HX7dZmk5axkE+NhcQxxOfHjQJ3FHezMnjvCAeBYIvzsPC5+eDl+
 c6i06FnA068P4++XLlF5IYeGoKJcNoLVcJnY1zuZ18QYLRSUDjPLuOQisCb0o0qq1Ug9
 RkSvI25MjPdTsjf3GfFK/XniPpJhiAOIxCKQpG80oEApjcghjuD2ljKjAE/+v6IjG/lq
 sYvQpE4rypc0GKUnG1vVISLTL+Sz/oTt+R8ozs50mOJy3SElcAqCkcRusWdGyn3uDyvz
 7DVA==
X-Gm-Message-State: AOAM532P46F/LfYU2MHjgbIIjuwKTKXuWa7c+4GUFfbAHQdMWCKir0Hy
 x4XDP5KculC2ff6kADKnlrw9w+03dpyaig==
X-Google-Smtp-Source: ABdhPJx2JwCjcDEfj3ChL2GXQNIRHjvH9/X/e9clV/q5jd0jjZQOUYbldmT5eKHObc1a0V2dYrOt4A==
X-Received: by 2002:a05:600c:4ed3:: with SMTP id
 g19mr8610265wmq.142.1642682203569; 
 Thu, 20 Jan 2022 04:36:43 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id t8sm7993324wmq.43.2022.01.20.04.36.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 04:36:43 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/38] hw/arm/virt: Support for virtio-mem-pci
Date: Thu, 20 Jan 2022 12:36:05 +0000
Message-Id: <20220120123630.267975-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120123630.267975-1-peter.maydell@linaro.org>
References: <20220120123630.267975-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Gavin Shan <gshan@redhat.com>

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
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-id: 20220111063329.74447-3-gshan@redhat.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c          | 70 ++++++++++++++++++++++++++++++++++++++++++
 hw/virtio/virtio-mem.c |  4 ++-
 hw/arm/Kconfig         |  1 +
 3 files changed, 74 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 177db1da12e..a76d86b5926 100644
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
@@ -2501,6 +2503,64 @@ static void virt_memory_plug(HotplugHandler *hotplug_dev,
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
+         * order. We should never reach this point when hotplugging on ARM.
+         * However, it's nice to add a safety net, similar to what we have
+         * on x86.
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
@@ -2508,6 +2568,8 @@ static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
 
     if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
         virt_memory_pre_plug(hotplug_dev, dev, errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
+        virt_virtio_md_pci_pre_plug(hotplug_dev, dev, errp);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
         hwaddr db_start = 0, db_end = 0;
         char *resv_prop_str;
@@ -2559,6 +2621,11 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
     if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
         virt_memory_plug(hotplug_dev, dev, errp);
     }
+
+    if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
+        virt_virtio_md_pci_plug(hotplug_dev, dev, errp);
+    }
+
     if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
         PCIDevice *pdev = PCI_DEVICE(dev);
 
@@ -2615,6 +2682,8 @@ static void virt_machine_device_unplug_request_cb(HotplugHandler *hotplug_dev,
 {
     if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
         virt_dimm_unplug_request(hotplug_dev, dev, errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
+        virt_virtio_md_pci_unplug_request(hotplug_dev, dev, errp);
     } else {
         error_setg(errp, "device unplug request for unsupported device"
                    " type: %s", object_get_typename(OBJECT(dev)));
@@ -2639,6 +2708,7 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
 
     if (device_is_dynamic_sysbus(mc, dev) ||
         object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) ||
+        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI) ||
         object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
         return HOTPLUG_HANDLER(machine);
     }
diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index 1ca45336dc2..f55dcf61f20 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -146,7 +146,7 @@ static bool virtio_mem_has_shared_zeropage(RAMBlock *rb)
  * The memory block size corresponds mostly to the section size.
  *
  * This allows e.g., to add 20MB with a section size of 128MB on x86_64, and
- * a section size of 1GB on arm64 (as long as the start address is properly
+ * a section size of 512MB on arm64 (as long as the start address is properly
  * aligned, similar to ordinary DIMMs).
  *
  * We can change this at any time and maybe even make it configurable if
@@ -155,6 +155,8 @@ static bool virtio_mem_has_shared_zeropage(RAMBlock *rb)
  */
 #if defined(TARGET_X86_64) || defined(TARGET_I386)
 #define VIRTIO_MEM_USABLE_EXTENT (2 * (128 * MiB))
+#elif defined(TARGET_ARM)
+#define VIRTIO_MEM_USABLE_EXTENT (2 * (512 * MiB))
 #else
 #error VIRTIO_MEM_USABLE_EXTENT not defined
 #endif
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index c459c897cc7..2e0049196d6 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -28,6 +28,7 @@ config ARM_VIRT
     select ACPI_HW_REDUCED
     select ACPI_APEI
     select ACPI_VIOT
+    select VIRTIO_MEM_SUPPORTED
 
 config CHEETAH
     bool
-- 
2.25.1


