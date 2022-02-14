Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 250434B520B
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 14:45:47 +0100 (CET)
Received: from localhost ([::1]:59848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJbfk-0001pY-Bt
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 08:45:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1nJala-0008JI-Kj
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 07:47:44 -0500
Received: from [2a00:1450:4864:20::630] (port=41600
 helo=mail-ej1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1nJalW-00067M-Fr
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 07:47:40 -0500
Received: by mail-ej1-x630.google.com with SMTP id a8so37172660ejc.8
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 04:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MgAOgZpdzxyPSG/1c8Wy3nAleGXMvPoXzOQQsQZnwqY=;
 b=V2P1G3R8QNkZn+pVhyuXWtWJsxdBTHgktoVVWe57tBEjvrRnDCidB3QYGBxkX+TLEm
 Cfok2NXMIhWT+3VhSO8LSWIVoLTZI7FoRU//cfs41cNmG0bcrAWlePjrRHP8OMipSQq3
 pw+CXKaFEuaTC/G0tILIzEIyXs1baNZZWSwKtIagMtFDRGut8H+Put6CYBzdW0y2x0E6
 bq2RH1/zC6POjNOV0DDjN4dmspgnmvnTnFXluuBkTa62FnYTutrXRF2IH9tbCtdBlcsX
 YKgPj9wM4HjOkoOrYEA4Ditmntstx6H5O3CJ0VP6eNSUHzi5suBcJQuNEAQqbhdOXc3x
 M7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MgAOgZpdzxyPSG/1c8Wy3nAleGXMvPoXzOQQsQZnwqY=;
 b=7UamXc7bUsO08Za4X0jlOYWixYb9P+ebbp/HuYkwIVKoD0wfYpI6qmbNXsZKYfrr5s
 cp9xH94i6Mo6MQNIGIVGy4BdsUGxOlkBblitkXyArlOUg+3OtdmICTWPp8jO9sHaz/C0
 UYcHLhh2lOq+G0H6bggNCWKJhvVT8WJwh2xwwihH6eRcz2UOr6cmcSROB/6LZTg7FDVy
 pPb4NMJ21pmEvADEvlXj8hVqcw2jBGDDmFBZyRHuPgAVE6hOIRwJzuJS/j5fzkvEnQnm
 CWAOU6kYvV4iObLBejRSPofFmdJ2b++cKBanFnCzE3rSJXaDawqkFU8qkW34/SI9Ia3z
 NYAQ==
X-Gm-Message-State: AOAM531YiDxnhONqaxaTJr5oumAu1si17e9PaalZIWhfCjMejBPNXH7C
 R2d0RSZikug7VfGcwhFRvNf5cZUvEi0kyg==
X-Google-Smtp-Source: ABdhPJznwN3NKLFgzKGJdIyYJqsBJsPRkGWLvWKEJKO2hFyPxJ2/QsuvCpcK3820SzjhLsVNj7Ny7g==
X-Received: by 2002:a17:907:1c16:: with SMTP id
 nc22mr11665422ejc.518.1644842856832; 
 Mon, 14 Feb 2022 04:47:36 -0800 (PST)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id kq17sm1475422ejb.205.2022.02.14.04.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 04:47:36 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH v3 2/4] virtio-iommu: Default to bypass during boot
Date: Mon, 14 Feb 2022 12:43:54 +0000
Message-Id: <20220214124356.872985-3-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220214124356.872985-1-jean-philippe@linaro.org>
References: <20220214124356.872985-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::630
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=jean-philippe@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 dgilbert@redhat.com, pasic@linux.ibm.com, pbonzini@redhat.com
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

We add the bypass field to the migration stream without introducing
subsections, based on the assumption that this virtio-iommu device isn't
being used in production enough to require cross-version migration at
the moment (all previous version required workarounds since they didn't
support ACPI and boot-bypass).

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 include/hw/virtio/virtio-iommu.h |  1 +
 hw/virtio/virtio-iommu.c         | 60 +++++++++++++++++++++++++++-----
 hw/virtio/trace-events           |  4 ++-
 3 files changed, 56 insertions(+), 9 deletions(-)

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
index aa9c16a17b..4ca36db4ac 100644
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
@@ -1141,21 +1182,22 @@ static int iommu_post_load(void *opaque, int version_id)
 
 static const VMStateDescription vmstate_virtio_iommu_device = {
     .name = "virtio-iommu-device",
-    .minimum_version_id = 1,
-    .version_id = 1,
+    .minimum_version_id = 2,
+    .version_id = 2,
     .post_load = iommu_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_GTREE_DIRECT_KEY_V(domains, VirtIOIOMMU, 1,
                                    &vmstate_domain, VirtIOIOMMUDomain),
+        VMSTATE_UINT8_V(config.bypass, VirtIOIOMMU, 2),
         VMSTATE_END_OF_LIST()
     },
 };
 
 static const VMStateDescription vmstate_virtio_iommu = {
     .name = "virtio-iommu",
-    .minimum_version_id = 1,
+    .minimum_version_id = 2,
     .priority = MIG_PRI_IOMMU,
-    .version_id = 1,
+    .version_id = 2,
     .fields = (VMStateField[]) {
         VMSTATE_VIRTIO_DEVICE,
         VMSTATE_END_OF_LIST()
@@ -1164,6 +1206,7 @@ static const VMStateDescription vmstate_virtio_iommu = {
 
 static Property virtio_iommu_properties[] = {
     DEFINE_PROP_LINK("primary-bus", VirtIOIOMMU, primary_bus, "PCI", PCIBus *),
+    DEFINE_PROP_BOOL("boot-bypass", VirtIOIOMMU, boot_bypass, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -1180,6 +1223,7 @@ static void virtio_iommu_class_init(ObjectClass *klass, void *data)
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
2.35.1


