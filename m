Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4BA4D0B8C
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 23:57:31 +0100 (CET)
Received: from localhost ([::1]:55678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRMIE-0005XV-Fx
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 17:57:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM6k-00076J-Bt
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:45:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM6i-0005Xa-B6
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:45:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646693135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AvJNwnWWD1CymBBhgu2K/AQWWIjBAXRCR+0fK9AzI+o=;
 b=PHEodkJFHUVcKkbh77ssYiQF5unxWrJSaeo28rjnNuTJouKZa+/ccoDW7ZSN4G8K+74CM2
 2sT8MbLbXHPk4oVt3czfYu0dGyRS2DMeVRg0acFFwqEe002DqfQ886VweOk7eCTTlhdjrk
 vhd6Mjpy/6R3t9AY8u8yP7A86ZtVcDc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-eGwxXZ40M1CsmrTfptjHIw-1; Mon, 07 Mar 2022 17:45:32 -0500
X-MC-Unique: eGwxXZ40M1CsmrTfptjHIw-1
Received: by mail-wm1-f71.google.com with SMTP id
 c19-20020a05600c0ad300b00385bb3db625so257195wmr.4
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 14:45:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AvJNwnWWD1CymBBhgu2K/AQWWIjBAXRCR+0fK9AzI+o=;
 b=HvQl1gGfNkzq6lg8fZ2Xg3ov1GjPSm8UZk+fluw/63HQlwsvnz4u0eMTZWGvdn4RU3
 Dw7WIu4Xy9AXCophsjclJgqJyQtJfoXGUrKkZAKeZHJ2ZyHkhC4dY7tNGiNdZ3su0kre
 H33+3c6vNkzRFVCr/Um8CFfb8dunTz7atC1wqjIlg8zL/2Uy8Kzu4b/rGF/8OnnplJnP
 io5wpYCxbcW1wGgEAWIymVgK8uvajp8U/p5Foz5qScYcn5zLfxHfaG/ufiBk9bJnRJoh
 KoxczCack8oXMMWfGabTzRb2wCm/jwLAuu+nkGGiXkpp/3fT63e6UIGcM7wAoVUFisYy
 J9rg==
X-Gm-Message-State: AOAM530Gl6hD56LtojWSF5nGYZFccdhP6sRFr9sBm29EMT/v7Bez2PNz
 pt6NOrHheNjbEgd6GaceVfrd2lx64nSyBVvAAkSKumiw/VW09EgoGZY5f1AJ9hLwPK+489eY8R0
 s29/nvina5Pk7UHtI+XaOV4cq+LbpRHld6te5+QNdlEF1NhE10DAJ0ZMeYtuD
X-Received: by 2002:a1c:7708:0:b0:381:f18b:29ca with SMTP id
 t8-20020a1c7708000000b00381f18b29camr978279wmi.140.1646693131274; 
 Mon, 07 Mar 2022 14:45:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzCAiuL6ov6U1xexMzAE68hoPFv11SGeQiIpqknICk4lyj0oPU2eUCWcd7SkCnbMuK1X55Dag==
X-Received: by 2002:a1c:7708:0:b0:381:f18b:29ca with SMTP id
 t8-20020a1c7708000000b00381f18b29camr978263wmi.140.1646693130966; 
 Mon, 07 Mar 2022 14:45:30 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 l18-20020adfe592000000b001f064ae9830sm10674827wrm.37.2022.03.07.14.45.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 14:45:30 -0800 (PST)
Date: Mon, 7 Mar 2022 17:45:28 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 18/47] virtio-iommu: Default to bypass during boot
Message-ID: <20220307224357.682101-19-mst@redhat.com>
References: <20220307224357.682101-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307224357.682101-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

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
Message-Id: <20220214124356.872985-3-jean-philippe@linaro.org>
Acked-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
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
MST


