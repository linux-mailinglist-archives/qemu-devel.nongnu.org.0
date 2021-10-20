Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA0E4349C3
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 13:07:22 +0200 (CEST)
Received: from localhost ([::1]:48530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md9RJ-0000GG-Rw
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 07:07:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8hf-0004P6-3q
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:20:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8hd-0003Ga-5m
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:20:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634725208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SNO/Ubc5qnNCiHvqjeTYPPDTin7dvOXmm+Ua7nTQFpU=;
 b=YW/CBlvH+7E9XSglxgI23Sd7bDQUJ+F+bC5PAwGewpgdPyN0QekXz9YbuRBD4T88fRAZPc
 udcjoDawEmG7rFtMCVV1Q1jv+vbrN0bTgRDMda0m8iULYKcqZX+ksMyhH6FYqKdFAOWT+B
 PooLMU98YF7uEIurDItx0xlM/hUeluo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-92-TopGRAKKNDGmOdSc3clJPw-1; Wed, 20 Oct 2021 06:20:07 -0400
X-MC-Unique: TopGRAKKNDGmOdSc3clJPw-1
Received: by mail-ed1-f69.google.com with SMTP id
 u17-20020a50d511000000b003daa3828c13so20513299edi.12
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 03:20:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=SNO/Ubc5qnNCiHvqjeTYPPDTin7dvOXmm+Ua7nTQFpU=;
 b=fbSVZds/xQ0Si1fCk2Ge85sVDPBN8n7UooSsodDlipSM+x9I1O5xeXt1dTCx12E5Sw
 MBJtnowEGzdMQcmIsfdmfAbqsRiHqgGPNOWIJCU38mvox9rLijvuiVpcTDrRtNI3Mt2E
 GM0Bq307nCeYfbT5XcEJPUwM0xDdXVdlbN3D/8nOP7PJTv/2w/GD9QSo/azPafIuQVtr
 S75Lnb+yhU/ueeMtnAK81Ix5cJX+OIftf4jCtYklqrzEOyadxOFvv9C0QnOR0zGREQ6E
 uaqhO+zkJdQH6LhlbLVkePIgvcxEaOA/mbNxHBhcQQF1FhqaOwmBPHBMmOn4ev/4JEjr
 zEvw==
X-Gm-Message-State: AOAM532tEL5UvmMA2xxUJxcf9YO44ZbH9nBvTXk3Yvy76hdG9w26VvKx
 /0mpQ7qoC5Uj4er0d/7enrueXrHcdWixR5lHAb7kDUSrqzA05Lu1/8SxPTBR/HdNeGGDfTcnffD
 w6hdVUVV8gblOWvGachDqXGnm1weTip+nnKS/bKTFmTbDrwoHa7IqrbpM8idV
X-Received: by 2002:a17:907:7d8b:: with SMTP id
 oz11mr43231223ejc.476.1634725205676; 
 Wed, 20 Oct 2021 03:20:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwe3H0vvA/Ktrb30Iaownbf2JEmsPT8/RiulFdYDmrxrdQjXpT+dGwRgiCoSRipUQzTkPaUQQ==
X-Received: by 2002:a17:907:7d8b:: with SMTP id
 oz11mr43231196ejc.476.1634725205399; 
 Wed, 20 Oct 2021 03:20:05 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id l10sm946875edk.30.2021.10.20.03.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 03:20:05 -0700 (PDT)
Date: Wed, 20 Oct 2021 06:20:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 18/44] vdpa: Check for iova range at mappings changes
Message-ID: <20211020101844.988480-19-mst@redhat.com>
References: <20211020101844.988480-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211020101844.988480-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eugenio Pérez <eperezma@redhat.com>

Check vdpa device range before updating memory regions so we don't add
any outside of it, and report the invalid change if any.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Message-Id: <20211014141236.923287-4-eperezma@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
---
 include/hw/virtio/vhost-vdpa.h |  2 ++
 hw/virtio/vhost-vdpa.c         | 62 ++++++++++++++++++++++++++--------
 hw/virtio/trace-events         |  1 +
 3 files changed, 50 insertions(+), 15 deletions(-)

diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index a8963da2d9..c288cf7ecb 100644
--- a/include/hw/virtio/vhost-vdpa.h
+++ b/include/hw/virtio/vhost-vdpa.h
@@ -13,6 +13,7 @@
 #define HW_VIRTIO_VHOST_VDPA_H
 
 #include "hw/virtio/virtio.h"
+#include "standard-headers/linux/vhost_types.h"
 
 typedef struct VhostVDPAHostNotifier {
     MemoryRegion mr;
@@ -24,6 +25,7 @@ typedef struct vhost_vdpa {
     uint32_t msg_type;
     bool iotlb_batch_begin_sent;
     MemoryListener listener;
+    struct vhost_vdpa_iova_range iova_range;
     struct vhost_dev *dev;
     VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
 } VhostVDPA;
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index be7c63b4ba..47c48f4ba8 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -37,20 +37,36 @@ static Int128 vhost_vdpa_section_end(const MemoryRegionSection *section)
     return llend;
 }
 
-static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *section)
+static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *section,
+                                                uint64_t iova_min,
+                                                uint64_t iova_max)
 {
-    return (!memory_region_is_ram(section->mr) &&
-            !memory_region_is_iommu(section->mr)) ||
-            memory_region_is_protected(section->mr) ||
-           /* vhost-vDPA doesn't allow MMIO to be mapped  */
-            memory_region_is_ram_device(section->mr) ||
-           /*
-            * Sizing an enabled 64-bit BAR can cause spurious mappings to
-            * addresses in the upper part of the 64-bit address space.  These
-            * are never accessed by the CPU and beyond the address width of
-            * some IOMMU hardware.  TODO: VDPA should tell us the IOMMU width.
-            */
-           section->offset_within_address_space & (1ULL << 63);
+    Int128 llend;
+
+    if ((!memory_region_is_ram(section->mr) &&
+         !memory_region_is_iommu(section->mr)) ||
+        memory_region_is_protected(section->mr) ||
+        /* vhost-vDPA doesn't allow MMIO to be mapped  */
+        memory_region_is_ram_device(section->mr)) {
+        return true;
+    }
+
+    if (section->offset_within_address_space < iova_min) {
+        error_report("RAM section out of device range (min=0x%" PRIx64
+                     ", addr=0x%" HWADDR_PRIx ")",
+                     iova_min, section->offset_within_address_space);
+        return true;
+    }
+
+    llend = vhost_vdpa_section_end(section);
+    if (int128_gt(llend, int128_make64(iova_max))) {
+        error_report("RAM section out of device range (max=0x%" PRIx64
+                     ", end addr=0x%" PRIx64 ")",
+                     iova_max, int128_get64(llend));
+        return true;
+    }
+
+    return false;
 }
 
 static int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr size,
@@ -162,7 +178,8 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
     void *vaddr;
     int ret;
 
-    if (vhost_vdpa_listener_skipped_section(section)) {
+    if (vhost_vdpa_listener_skipped_section(section, v->iova_range.first,
+                                            v->iova_range.last)) {
         return;
     }
 
@@ -220,7 +237,8 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
     Int128 llend, llsize;
     int ret;
 
-    if (vhost_vdpa_listener_skipped_section(section)) {
+    if (vhost_vdpa_listener_skipped_section(section, v->iova_range.first,
+                                            v->iova_range.last)) {
         return;
     }
 
@@ -288,6 +306,19 @@ static void vhost_vdpa_add_status(struct vhost_dev *dev, uint8_t status)
     vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &s);
 }
 
+static void vhost_vdpa_get_iova_range(struct vhost_vdpa *v)
+{
+    int ret = vhost_vdpa_call(v->dev, VHOST_VDPA_GET_IOVA_RANGE,
+                              &v->iova_range);
+    if (ret != 0) {
+        v->iova_range.first = 0;
+        v->iova_range.last = UINT64_MAX;
+    }
+
+    trace_vhost_vdpa_get_iova_range(v->dev, v->iova_range.first,
+                                    v->iova_range.last);
+}
+
 static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
 {
     struct vhost_vdpa *v;
@@ -300,6 +331,7 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
     v->listener = vhost_vdpa_memory_listener;
     v->msg_type = VHOST_IOTLB_MSG_V2;
 
+    vhost_vdpa_get_iova_range(v);
     vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
                                VIRTIO_CONFIG_S_DRIVER);
 
diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 8ed19e9d0c..650e521e35 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -52,6 +52,7 @@ vhost_vdpa_set_vring_call(void *dev, unsigned int index, int fd) "dev: %p index:
 vhost_vdpa_get_features(void *dev, uint64_t features) "dev: %p features: 0x%"PRIx64
 vhost_vdpa_set_owner(void *dev) "dev: %p"
 vhost_vdpa_vq_get_addr(void *dev, void *vq, uint64_t desc_user_addr, uint64_t avail_user_addr, uint64_t used_user_addr) "dev: %p vq: %p desc_user_addr: 0x%"PRIx64" avail_user_addr: 0x%"PRIx64" used_user_addr: 0x%"PRIx64
+vhost_vdpa_get_iova_range(void *dev, uint64_t first, uint64_t last) "dev: %p first: 0x%"PRIx64" last: 0x%"PRIx64
 
 # virtio.c
 virtqueue_alloc_element(void *elem, size_t sz, unsigned in_num, unsigned out_num) "elem %p size %zd in_num %u out_num %u"
-- 
MST


