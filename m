Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A2E4753F9
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 08:59:00 +0100 (CET)
Received: from localhost ([::1]:52846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxPBj-0003Cc-M8
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 02:58:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mxOo4-0003ZP-Om
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 02:34:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mxOo2-0004KQ-Qu
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 02:34:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639553670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xdKFHn8ejpV9Or7IFrRCDW+0cHyGsqiaE9Z3UpJPGz4=;
 b=JCrBkOCh1RsRLwraYfLcRDCiT+YKxOcuw2aW/8fiY+9BAKMzG7hjRhc9Y2bRN0p6R82rxI
 FYCwT/iNHdp3FUs+CbOVs86LiuEQCZXq9nsqprG7s4HHw8cnnIfFl93Zk6Er6f2w5fC8yM
 gRiDUiOW7OzQwMhpi6DhSPGhrgEgoMQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-M86Ei0WCMQiUtKst8Itm8Q-1; Wed, 15 Dec 2021 02:34:26 -0500
X-MC-Unique: M86Ei0WCMQiUtKst8Itm8Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EC61801962;
 Wed, 15 Dec 2021 07:34:25 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7345B1092790;
 Wed, 15 Dec 2021 07:34:21 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/16] virtio-iommu: Remove set_config callback
Date: Wed, 15 Dec 2021 08:33:58 +0100
Message-Id: <20211215073402.144286-13-thuth@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eric Auger <eric.auger@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Auger <eric.auger@redhat.com>

The spec says "the driver must not write to device configuration
fields". So remove the set_config() callback which anyway did
not do anything.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Message-Id: <20211127072910.1261824-2-eric.auger@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/virtio/trace-events   |  1 -
 hw/virtio/virtio-iommu.c | 14 --------------
 2 files changed, 15 deletions(-)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 650e521e35..54bd7da00c 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -92,7 +92,6 @@ virtio_iommu_device_reset(void) "reset!"
 virtio_iommu_get_features(uint64_t features) "device supports features=0x%"PRIx64
 virtio_iommu_device_status(uint8_t status) "driver status = %d"
 virtio_iommu_get_config(uint64_t page_size_mask, uint64_t start, uint64_t end, uint32_t domain_range, uint32_t probe_size) "page_size_mask=0x%"PRIx64" start=0x%"PRIx64" end=0x%"PRIx64" domain_range=%d probe_size=0x%x"
-virtio_iommu_set_config(uint64_t page_size_mask, uint64_t start, uint64_t end, uint32_t domain_range, uint32_t probe_size) "page_size_mask=0x%"PRIx64" start=0x%"PRIx64" end=0x%"PRIx64" domain_bits=%d probe_size=0x%x"
 virtio_iommu_attach(uint32_t domain_id, uint32_t ep_id) "domain=%d endpoint=%d"
 virtio_iommu_detach(uint32_t domain_id, uint32_t ep_id) "domain=%d endpoint=%d"
 virtio_iommu_map(uint32_t domain_id, uint64_t virt_start, uint64_t virt_end, uint64_t phys_start, uint32_t flags) "domain=%d virt_start=0x%"PRIx64" virt_end=0x%"PRIx64 " phys_start=0x%"PRIx64" flags=%d"
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 1b23e8e18c..645c0aa399 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -832,19 +832,6 @@ static void virtio_iommu_get_config(VirtIODevice *vdev, uint8_t *config_data)
     memcpy(config_data, &dev->config, sizeof(struct virtio_iommu_config));
 }
 
-static void virtio_iommu_set_config(VirtIODevice *vdev,
-                                      const uint8_t *config_data)
-{
-    struct virtio_iommu_config config;
-
-    memcpy(&config, config_data, sizeof(struct virtio_iommu_config));
-    trace_virtio_iommu_set_config(config.page_size_mask,
-                                  config.input_range.start,
-                                  config.input_range.end,
-                                  config.domain_range.end,
-                                  config.probe_size);
-}
-
 static uint64_t virtio_iommu_get_features(VirtIODevice *vdev, uint64_t f,
                                           Error **errp)
 {
@@ -1185,7 +1172,6 @@ static void virtio_iommu_class_init(ObjectClass *klass, void *data)
     vdc->unrealize = virtio_iommu_device_unrealize;
     vdc->reset = virtio_iommu_device_reset;
     vdc->get_config = virtio_iommu_get_config;
-    vdc->set_config = virtio_iommu_set_config;
     vdc->get_features = virtio_iommu_get_features;
     vdc->set_status = virtio_iommu_set_status;
     vdc->vmsd = &vmstate_virtio_iommu_device;
-- 
2.27.0


