Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B5D475405
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 09:03:51 +0100 (CET)
Received: from localhost ([::1]:33160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxPGQ-0000qP-KK
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 03:03:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mxOo3-0003Uj-Ax
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 02:34:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mxOo1-0004KM-P5
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 02:34:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639553669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UQ8C6HBk7OQvK9jhuSbMsE3A1ZideXwQ/keIyQPQGmw=;
 b=UHMKdxEM7+WhfICnDo5aDnxFjLckBNKNjlb4ldR5FkPH0CumJAJqta/w03aVBGiVBY+S+a
 rBrBkSHUXJV5z7ai0SII6JvT+vqzVaEtQhUl00G8i2oYR7Ai4lsJZOrvE0pMPlRjZpnQK/
 Vpq0yoWhlP/bH2Zn6VTCNTfTxlH44mw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-7L5I4-iXMTytHmPkHp2kLw-1; Wed, 15 Dec 2021 02:34:27 -0500
X-MC-Unique: 7L5I4-iXMTytHmPkHp2kLw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8FB892F2C;
 Wed, 15 Dec 2021 07:34:26 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A8631092790;
 Wed, 15 Dec 2021 07:34:25 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/16] virtio-iommu: Fix endianness in get_config
Date: Wed, 15 Dec 2021 08:33:59 +0100
Message-Id: <20211215073402.144286-14-thuth@redhat.com>
In-Reply-To: <20211215073402.144286-1-thuth@redhat.com>
References: <20211215073402.144286-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eric Auger <eric.auger@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Auger <eric.auger@redhat.com>

Endianess is not properly handled when populating
the returned config. Use the cpu_to_le* primitives
for each separate field. Also, while at it, trace
the domain range start.

Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Message-Id: <20211127072910.1261824-3-eric.auger@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/virtio/trace-events   |  2 +-
 hw/virtio/virtio-iommu.c | 24 ++++++++++++++++--------
 2 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 54bd7da00c..f7ad6be5fb 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -91,7 +91,7 @@ virtio_mmio_setting_irq(int level) "virtio_mmio setting IRQ %d"
 virtio_iommu_device_reset(void) "reset!"
 virtio_iommu_get_features(uint64_t features) "device supports features=0x%"PRIx64
 virtio_iommu_device_status(uint8_t status) "driver status = %d"
-virtio_iommu_get_config(uint64_t page_size_mask, uint64_t start, uint64_t end, uint32_t domain_range, uint32_t probe_size) "page_size_mask=0x%"PRIx64" start=0x%"PRIx64" end=0x%"PRIx64" domain_range=%d probe_size=0x%x"
+virtio_iommu_get_config(uint64_t page_size_mask, uint64_t start, uint64_t end, uint32_t domain_start, uint32_t domain_end, uint32_t probe_size) "page_size_mask=0x%"PRIx64" input range start=0x%"PRIx64" input range end=0x%"PRIx64" domain range start=%d domain range end=%d probe_size=0x%x"
 virtio_iommu_attach(uint32_t domain_id, uint32_t ep_id) "domain=%d endpoint=%d"
 virtio_iommu_detach(uint32_t domain_id, uint32_t ep_id) "domain=%d endpoint=%d"
 virtio_iommu_map(uint32_t domain_id, uint64_t virt_start, uint64_t virt_end, uint64_t phys_start, uint32_t flags) "domain=%d virt_start=0x%"PRIx64" virt_end=0x%"PRIx64 " phys_start=0x%"PRIx64" flags=%d"
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 645c0aa399..30ee09187b 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -822,14 +822,22 @@ unlock:
 static void virtio_iommu_get_config(VirtIODevice *vdev, uint8_t *config_data)
 {
     VirtIOIOMMU *dev = VIRTIO_IOMMU(vdev);
-    struct virtio_iommu_config *config = &dev->config;
-
-    trace_virtio_iommu_get_config(config->page_size_mask,
-                                  config->input_range.start,
-                                  config->input_range.end,
-                                  config->domain_range.end,
-                                  config->probe_size);
-    memcpy(config_data, &dev->config, sizeof(struct virtio_iommu_config));
+    struct virtio_iommu_config *dev_config = &dev->config;
+    struct virtio_iommu_config *out_config = (void *)config_data;
+
+    out_config->page_size_mask = cpu_to_le64(dev_config->page_size_mask);
+    out_config->input_range.start = cpu_to_le64(dev_config->input_range.start);
+    out_config->input_range.end = cpu_to_le64(dev_config->input_range.end);
+    out_config->domain_range.start = cpu_to_le32(dev_config->domain_range.start);
+    out_config->domain_range.end = cpu_to_le32(dev_config->domain_range.end);
+    out_config->probe_size = cpu_to_le32(dev_config->probe_size);
+
+    trace_virtio_iommu_get_config(dev_config->page_size_mask,
+                                  dev_config->input_range.start,
+                                  dev_config->input_range.end,
+                                  dev_config->domain_range.start,
+                                  dev_config->domain_range.end,
+                                  dev_config->probe_size);
 }
 
 static uint64_t virtio_iommu_get_features(VirtIODevice *vdev, uint64_t f,
-- 
2.27.0


