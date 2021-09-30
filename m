Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD33141E1E0
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 20:58:36 +0200 (CEST)
Received: from localhost ([::1]:52458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mW1GL-0007FZ-Mc
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 14:58:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mW1AV-0001CC-Se
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 14:52:31 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:46617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mW1AT-0004KY-6K
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 14:52:31 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 d207-20020a1c1dd8000000b00307e2d1ec1aso5064968wmd.5
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 11:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0TV0wMhSKf6e9khlOa9LUicDSxf5nPKoH9SuDHumuR0=;
 b=HGya6g2hznXn5ohs1XMF0NGxyDBKtxO+UnyGXLFdxzCsO6BrNutEG6Cw7hZcIm/olR
 BmwO4x3eB9m39x215v0SsI9w55yKEJKiGz2Gn7CXdsh8U6e5arFgJuQS9Pa3rqMvApeS
 8T90tnA1vSLIs51jorFcSObtqSBVLGYWe488lxwN0Xunz9482mdifEWySnuUC+hVcMUT
 0xZF/oHYjnLRMRmgqNwdrxj+XAr/aAZQoT0eCJ4JRN+Ah/vn+9ICk1vmYbo7NTnVmdCE
 VA7Mb6NolvhlaoGVSO8giqKoBOJ2mb/VhazL726hhbeznRvDhhMbplMTjVkfhzS9KLpR
 rQ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0TV0wMhSKf6e9khlOa9LUicDSxf5nPKoH9SuDHumuR0=;
 b=oWp10rXSblwPwpb+MpJLeeH6AaDlFwRaYiwQMg4E+jKN9rRBxsN9mAiibq7SLKVoMR
 utaGSZsGyrNEWYiJgYDTok2wvdMqKUuY4tjYKm0jKkReX+BvoGTpwDCfL4ZCBN3JqAVp
 /iR5MCanu7XN/TWdHt0zWxABDmdkDClJKTwsvkdDiL5wa3qebCDo1o4j/RmgV9E0CFmI
 HM8RKdqrIFPz7axrxKoDjBtZxAhYY8yijJFS37r0U9nkvf4fRUk1omlHNSrZrSBwKtpb
 eQnoW1rTJ2qhyOK2OqesYOS24Gx/r60jlB3K6KA5fRaRW+F0nm96Nu0hTFHjFNcUJZhn
 uZfA==
X-Gm-Message-State: AOAM531WZ26rsZqfBn512dYAnaYXc08pmEhTHJSuqBtsKpJOEJ45t5Mi
 5ht71rS/q48GkX8CGwT0ZXFsyPGJxviC9w==
X-Google-Smtp-Source: ABdhPJzwTUau4e8BOs5w8KZmQcRfveUWL3cJ+sqrq0ZStK40CvJ53dB5mWoiogrrrE5HYr/IkGb6cg==
X-Received: by 2002:a05:600c:4fc7:: with SMTP id
 o7mr773623wmq.91.1633027947709; 
 Thu, 30 Sep 2021 11:52:27 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id l124sm5487151wml.8.2021.09.30.11.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 11:52:27 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH 2/3] virtio-iommu: Default to bypass during boot
Date: Thu, 30 Sep 2021 19:50:50 +0100
Message-Id: <20210930185050.262759-3-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210930185050.262759-1-jean-philippe@linaro.org>
References: <20210930185050.262759-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-devel@nongnu.org,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the virtio-iommu device must be programmed before it allows
DMA from any PCI device. This can make the VM entirely unusable when a
virtio-iommu driver isn't present, for example in a bootloader that
loads the OS from storage.

Similarly to the other vIOMMU implementations, default to DMA bypassing
the IOMMU during boot. Add a "boot-bypass" option that lets users change
this behavior.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 include/hw/virtio/virtio-iommu.h |  1 +
 hw/virtio/virtio-iommu.c         | 28 +++++++++++++++++++++++-----
 hw/virtio/trace-events           |  4 ++--
 3 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
index 273e35c04b..4c66989ca4 100644
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
index 1b23e8e18c..82edeaa101 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -728,8 +728,7 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
         .perm = IOMMU_NONE,
     };
 
-    bypass_allowed = virtio_vdev_has_feature(&s->parent_obj,
-                                             VIRTIO_IOMMU_F_BYPASS);
+    bypass_allowed = s->config.bypass;
 
     sid = virtio_iommu_get_bdf(sdev);
 
@@ -828,7 +827,8 @@ static void virtio_iommu_get_config(VirtIODevice *vdev, uint8_t *config_data)
                                   config->input_range.start,
                                   config->input_range.end,
                                   config->domain_range.end,
-                                  config->probe_size);
+                                  config->probe_size,
+                                  config->bypass);
     memcpy(config_data, &dev->config, sizeof(struct virtio_iommu_config));
 }
 
@@ -836,13 +836,29 @@ static void virtio_iommu_set_config(VirtIODevice *vdev,
                                       const uint8_t *config_data)
 {
     struct virtio_iommu_config config;
+    VirtIOIOMMU *dev = VIRTIO_IOMMU(vdev);
 
     memcpy(&config, config_data, sizeof(struct virtio_iommu_config));
+
+    if (config.bypass != dev->config.bypass) {
+        if (!virtio_vdev_has_feature(vdev, VIRTIO_IOMMU_F_BYPASS_CONFIG)) {
+            virtio_error(vdev, "cannot set config.bypass");
+            return;
+        }
+        if (config.bypass != 0 && config.bypass != 1) {
+            warn_report("invalid config.bypass value '%d'", config.bypass);
+            dev->config.bypass = 0;
+            return;
+        }
+        dev->config.bypass = config.bypass;
+    }
+
     trace_virtio_iommu_set_config(config.page_size_mask,
                                   config.input_range.start,
                                   config.input_range.end,
                                   config.domain_range.end,
-                                  config.probe_size);
+                                  config.probe_size,
+                                  config.bypass);
 }
 
 static uint64_t virtio_iommu_get_features(VirtIODevice *vdev, uint64_t f,
@@ -986,6 +1002,7 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
     s->config.input_range.end = -1UL;
     s->config.domain_range.end = 32;
     s->config.probe_size = VIOMMU_PROBE_SIZE;
+    s->config.bypass = s->boot_bypass;
 
     virtio_add_feature(&s->features, VIRTIO_RING_F_EVENT_IDX);
     virtio_add_feature(&s->features, VIRTIO_RING_F_INDIRECT_DESC);
@@ -993,9 +1010,9 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
     virtio_add_feature(&s->features, VIRTIO_IOMMU_F_INPUT_RANGE);
     virtio_add_feature(&s->features, VIRTIO_IOMMU_F_DOMAIN_RANGE);
     virtio_add_feature(&s->features, VIRTIO_IOMMU_F_MAP_UNMAP);
-    virtio_add_feature(&s->features, VIRTIO_IOMMU_F_BYPASS);
     virtio_add_feature(&s->features, VIRTIO_IOMMU_F_MMIO);
     virtio_add_feature(&s->features, VIRTIO_IOMMU_F_PROBE);
+    virtio_add_feature(&s->features, VIRTIO_IOMMU_F_BYPASS_CONFIG);
 
     qemu_mutex_init(&s->mutex);
 
@@ -1169,6 +1186,7 @@ static const VMStateDescription vmstate_virtio_iommu = {
 
 static Property virtio_iommu_properties[] = {
     DEFINE_PROP_LINK("primary-bus", VirtIOIOMMU, primary_bus, "PCI", PCIBus *),
+    DEFINE_PROP_BOOL("boot-bypass", VirtIOIOMMU, boot_bypass, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 8ed19e9d0c..6bc3821ba3 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -90,8 +90,8 @@ virtio_mmio_setting_irq(int level) "virtio_mmio setting IRQ %d"
 virtio_iommu_device_reset(void) "reset!"
 virtio_iommu_get_features(uint64_t features) "device supports features=0x%"PRIx64
 virtio_iommu_device_status(uint8_t status) "driver status = %d"
-virtio_iommu_get_config(uint64_t page_size_mask, uint64_t start, uint64_t end, uint32_t domain_range, uint32_t probe_size) "page_size_mask=0x%"PRIx64" start=0x%"PRIx64" end=0x%"PRIx64" domain_range=%d probe_size=0x%x"
-virtio_iommu_set_config(uint64_t page_size_mask, uint64_t start, uint64_t end, uint32_t domain_range, uint32_t probe_size) "page_size_mask=0x%"PRIx64" start=0x%"PRIx64" end=0x%"PRIx64" domain_bits=%d probe_size=0x%x"
+virtio_iommu_get_config(uint64_t page_size_mask, uint64_t start, uint64_t end, uint32_t domain_range, uint32_t probe_size, uint8_t bypass) "page_size_mask=0x%"PRIx64" start=0x%"PRIx64" end=0x%"PRIx64" domain_range=%d probe_size=0x%x bypass=0x%x"
+virtio_iommu_set_config(uint64_t page_size_mask, uint64_t start, uint64_t end, uint32_t domain_range, uint32_t probe_size, uint8_t bypass) "page_size_mask=0x%"PRIx64" start=0x%"PRIx64" end=0x%"PRIx64" domain_bits=%d probe_size=0x%x bypass=0x%x"
 virtio_iommu_attach(uint32_t domain_id, uint32_t ep_id) "domain=%d endpoint=%d"
 virtio_iommu_detach(uint32_t domain_id, uint32_t ep_id) "domain=%d endpoint=%d"
 virtio_iommu_map(uint32_t domain_id, uint64_t virt_start, uint64_t virt_end, uint64_t phys_start, uint32_t flags) "domain=%d virt_start=0x%"PRIx64" virt_end=0x%"PRIx64 " phys_start=0x%"PRIx64" flags=%d"
-- 
2.33.0


