Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E98F349E520
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 15:51:19 +0100 (CET)
Received: from localhost ([::1]:38190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD67L-0006vT-2B
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 09:51:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1nD5sd-0005HQ-RG
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:36:08 -0500
Received: from [2a00:1450:4864:20::429] (port=35494
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1nD5sZ-0005ba-F9
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:36:07 -0500
Received: by mail-wr1-x429.google.com with SMTP id e2so5216067wra.2
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 06:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KgZgkQsTN2UFnoienKnkFG5fA6c6MKHkCVT0/IxZ0Q8=;
 b=W8twyeYdKY9oBNTGkaaR71igDfxjqQ90GgDr287FqCT7+GkBAGfJATEnx90SmtQAgR
 j1LmVxNK5iSJB/TJ5OH/Stiua1748ScA5S6yXfQfNGmNbWzPsqrZ1eDyYOYZdqNU6aLL
 IIaE/3ILZ7QE8/ofJ3tIGgZk1G0GxbA97lGvMby6sTu141WP2JLFQWvXBaiMqxcb3Bk9
 fP/qrstFJsI9NUXmbuVhMDocbj5fjVbNEFDgXVkuwGoRKxyZ5MY/eU0buBoAwYMokOSn
 m8DpUuD3ZyC02X+QydZcvv/+SIbT/s9CfIgaTBELSrbC/qcbfY6inU+PDpTWyAqwRyz0
 ZIog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KgZgkQsTN2UFnoienKnkFG5fA6c6MKHkCVT0/IxZ0Q8=;
 b=xtfvXStn8AaSdq29poV0Zag1AYo3nV8eVrtKmk01dHgVhx5iNxqtsXjtgaMFN7TuFv
 6GWpBBrZgWVoSKqon0gQXTHFKaXXGfdkbnL1tXYHBd3Cic+5d+glUAmsN2RnAZphG9wG
 jpH/nLuCnQAXM2mvt2/iv+waLT/qGyI539g4p4zPY3avtUSrLrhS4USZWJhn7gi1D4Ji
 Ly9Uj43fSHbpPzd8hBaGPJ9WJyn+mpIbcPdBcsD7D2+TEG8FN7MTWYBYEoCOndceea4a
 bhrQxUwnZG365FVLWCssXhynclThHOfb5m+FjfJZbCgi0nvb/37+SUyhloGcf0tcCeJA
 JOmQ==
X-Gm-Message-State: AOAM530FnPizey5pkEsgxLhHMu3Vi0tdnlooIrPScvH9ZhK/gX7JmZUD
 QI9kZFdNuLYRRMCIUWEAW0VXtg==
X-Google-Smtp-Source: ABdhPJz0bnt3+KUHLE91tQM0Bo27FypPkGtEKlquPl4utdduOFKwMe2oRabjc316qr7BVMqWbtJuNw==
X-Received: by 2002:a05:6000:178d:: with SMTP id
 e13mr3309072wrg.199.1643294158322; 
 Thu, 27 Jan 2022 06:35:58 -0800 (PST)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id i3sm2285894wru.33.2022.01.27.06.35.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 06:35:58 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH v2 2/4] virtio-iommu: Default to bypass during boot
Date: Thu, 27 Jan 2022 14:29:39 +0000
Message-Id: <20220127142940.671333-3-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220127142940.671333-1-jean-philippe@linaro.org>
References: <20220127142940.671333-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: lvivier@redhat.com, Jean-Philippe Brucker <jean-philippe@linaro.org>,
 thuth@redhat.com, mst@redhat.com, cohuck@redhat.com, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the virtio-iommu device must be programmed before it allows
DMA from any PCI device. This can make the VM entirely unusable when a
virtio-iommu driver isn't present, for example in a bootloader that
loads the OS from storage.

Similarly to the other vIOMMU implementations, default to DMA bypassing
the IOMMU during boot. Add a "boot-bypass" property, defaulting to true,
that lets users change this behavior.

Replace the VIRTIO_IOMMU_F_BYPASS feature, which didn't support bypass
before feature negotiation, with VIRTIO_IOMMU_F_BYPASS_CONFIG.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 include/hw/virtio/virtio-iommu.h |  1 +
 hw/virtio/virtio-iommu.c         | 51 +++++++++++++++++++++++++++++---
 hw/virtio/trace-events           |  4 ++-
 3 files changed, 51 insertions(+), 5 deletions(-)

diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
index e2339e5b72..84391f8448 100644
--- a/include/hw/virtio/virtio-iommu.h
+++ b/include/hw/virtio/virtio-iommu.h
@@ -58,6 +58,7 @@ struct VirtIOIOMMU {
     GTree *domains;
     QemuMutex mutex;
     GTree *endpoints;
+    bool boot_bypass;
 };
 
 #endif
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index aa9c16a17b..ec02029bb6 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -24,6 +24,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/virtio/virtio.h"
 #include "sysemu/kvm.h"
+#include "sysemu/reset.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "trace.h"
@@ -728,8 +729,7 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
         .perm = IOMMU_NONE,
     };
 
-    bypass_allowed = virtio_vdev_has_feature(&s->parent_obj,
-                                             VIRTIO_IOMMU_F_BYPASS);
+    bypass_allowed = s->config.bypass;
 
     sid = virtio_iommu_get_bdf(sdev);
 
@@ -831,13 +831,37 @@ static void virtio_iommu_get_config(VirtIODevice *vdev, uint8_t *config_data)
     out_config->domain_range.start = cpu_to_le32(dev_config->domain_range.start);
     out_config->domain_range.end = cpu_to_le32(dev_config->domain_range.end);
     out_config->probe_size = cpu_to_le32(dev_config->probe_size);
+    out_config->bypass = dev_config->bypass;
 
     trace_virtio_iommu_get_config(dev_config->page_size_mask,
                                   dev_config->input_range.start,
                                   dev_config->input_range.end,
                                   dev_config->domain_range.start,
                                   dev_config->domain_range.end,
-                                  dev_config->probe_size);
+                                  dev_config->probe_size,
+                                  dev_config->bypass);
+}
+
+static void virtio_iommu_set_config(VirtIODevice *vdev,
+                                    const uint8_t *config_data)
+{
+    VirtIOIOMMU *dev = VIRTIO_IOMMU(vdev);
+    struct virtio_iommu_config *dev_config = &dev->config;
+    const struct virtio_iommu_config *in_config = (void *)config_data;
+
+    if (in_config->bypass != dev_config->bypass) {
+        if (!virtio_vdev_has_feature(vdev, VIRTIO_IOMMU_F_BYPASS_CONFIG)) {
+            virtio_error(vdev, "cannot set config.bypass");
+            return;
+        } else if (in_config->bypass != 0 && in_config->bypass != 1) {
+            virtio_error(vdev, "invalid config.bypass value '%u'",
+                         in_config->bypass);
+            return;
+        }
+        dev_config->bypass = in_config->bypass;
+    }
+
+    trace_virtio_iommu_set_config(in_config->bypass);
 }
 
 static uint64_t virtio_iommu_get_features(VirtIODevice *vdev, uint64_t f,
@@ -963,6 +987,19 @@ static int virtio_iommu_set_page_size_mask(IOMMUMemoryRegion *mr,
     return 0;
 }
 
+static void virtio_iommu_system_reset(void *opaque)
+{
+    VirtIOIOMMU *s = opaque;
+
+    trace_virtio_iommu_system_reset();
+
+    /*
+     * config.bypass is sticky across device reset, but should be restored on
+     * system reset
+     */
+    s->config.bypass = s->boot_bypass;
+}
+
 static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
@@ -988,9 +1025,9 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
     virtio_add_feature(&s->features, VIRTIO_IOMMU_F_INPUT_RANGE);
     virtio_add_feature(&s->features, VIRTIO_IOMMU_F_DOMAIN_RANGE);
     virtio_add_feature(&s->features, VIRTIO_IOMMU_F_MAP_UNMAP);
-    virtio_add_feature(&s->features, VIRTIO_IOMMU_F_BYPASS);
     virtio_add_feature(&s->features, VIRTIO_IOMMU_F_MMIO);
     virtio_add_feature(&s->features, VIRTIO_IOMMU_F_PROBE);
+    virtio_add_feature(&s->features, VIRTIO_IOMMU_F_BYPASS_CONFIG);
 
     qemu_mutex_init(&s->mutex);
 
@@ -1001,6 +1038,8 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
     } else {
         error_setg(errp, "VIRTIO-IOMMU is not attached to any PCI bus!");
     }
+
+    qemu_register_reset(virtio_iommu_system_reset, s);
 }
 
 static void virtio_iommu_device_unrealize(DeviceState *dev)
@@ -1008,6 +1047,8 @@ static void virtio_iommu_device_unrealize(DeviceState *dev)
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VirtIOIOMMU *s = VIRTIO_IOMMU(dev);
 
+    qemu_unregister_reset(virtio_iommu_system_reset, s);
+
     g_hash_table_destroy(s->as_by_busptr);
     if (s->domains) {
         g_tree_destroy(s->domains);
@@ -1164,6 +1205,7 @@ static const VMStateDescription vmstate_virtio_iommu = {
 
 static Property virtio_iommu_properties[] = {
     DEFINE_PROP_LINK("primary-bus", VirtIOIOMMU, primary_bus, "PCI", PCIBus *),
+    DEFINE_PROP_BOOL("boot-bypass", VirtIOIOMMU, boot_bypass, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -1180,6 +1222,7 @@ static void virtio_iommu_class_init(ObjectClass *klass, void *data)
     vdc->unrealize = virtio_iommu_device_unrealize;
     vdc->reset = virtio_iommu_device_reset;
     vdc->get_config = virtio_iommu_get_config;
+    vdc->set_config = virtio_iommu_set_config;
     vdc->get_features = virtio_iommu_get_features;
     vdc->set_status = virtio_iommu_set_status;
     vdc->vmsd = &vmstate_virtio_iommu_device;
diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index f7ad6be5fb..a5102eac9e 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -89,9 +89,11 @@ virtio_mmio_setting_irq(int level) "virtio_mmio setting IRQ %d"
 
 # virtio-iommu.c
 virtio_iommu_device_reset(void) "reset!"
+virtio_iommu_system_reset(void) "system reset!"
 virtio_iommu_get_features(uint64_t features) "device supports features=0x%"PRIx64
 virtio_iommu_device_status(uint8_t status) "driver status = %d"
-virtio_iommu_get_config(uint64_t page_size_mask, uint64_t start, uint64_t end, uint32_t domain_start, uint32_t domain_end, uint32_t probe_size) "page_size_mask=0x%"PRIx64" input range start=0x%"PRIx64" input range end=0x%"PRIx64" domain range start=%d domain range end=%d probe_size=0x%x"
+virtio_iommu_get_config(uint64_t page_size_mask, uint64_t start, uint64_t end, uint32_t domain_start, uint32_t domain_end, uint32_t probe_size, uint8_t bypass) "page_size_mask=0x%"PRIx64" input range start=0x%"PRIx64" input range end=0x%"PRIx64" domain range start=%d domain range end=%d probe_size=0x%x bypass=0x%x"
+virtio_iommu_set_config(uint8_t bypass) "bypass=0x%x"
 virtio_iommu_attach(uint32_t domain_id, uint32_t ep_id) "domain=%d endpoint=%d"
 virtio_iommu_detach(uint32_t domain_id, uint32_t ep_id) "domain=%d endpoint=%d"
 virtio_iommu_map(uint32_t domain_id, uint64_t virt_start, uint64_t virt_end, uint64_t phys_start, uint32_t flags) "domain=%d virt_start=0x%"PRIx64" virt_end=0x%"PRIx64 " phys_start=0x%"PRIx64" flags=%d"
-- 
2.34.1


