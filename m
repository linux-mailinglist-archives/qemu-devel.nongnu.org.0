Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 621C94DB968
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 21:33:37 +0100 (CET)
Received: from localhost ([::1]:54514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUaKu-000519-GA
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 16:33:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nUaHj-0003GU-Cz
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 16:30:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nUaHf-0007cW-Pv
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 16:30:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647462614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0J7mYIu4rlnatjU4rH1A3qe3En2Iug+gu1EaZJCfXPI=;
 b=ezcKZLMCRMrM5YYY/+721d/qnlGLeJLIxgBZJ1MRo1aI8vAnNHu2ikPwmVYSpfqUr/QS3g
 Y8Q6+kkvqhGOfh9EPBk27ly1iaWVm39BUGZG477isS9ePG5u4QCLy9Tn9l5CODQQR4Ot1F
 3A0KzZ+Y3Et7a24KuR/6lYh7iKPTNEA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-295-Ad0xd2JdMtqxSK6S_j3Dng-1; Wed, 16 Mar 2022 16:30:09 -0400
X-MC-Unique: Ad0xd2JdMtqxSK6S_j3Dng-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 058AD85A5BC;
 Wed, 16 Mar 2022 20:30:08 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EBE6B202A433;
 Wed, 16 Mar 2022 20:29:53 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 alex.williamson@redhat.com
Subject: [PATCH for-7.1] vfio/common: remove spurious tpm-crb-cmd misalignment
 warning
Date: Wed, 16 Mar 2022 21:29:51 +0100
Message-Id: <20220316202951.294860-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: cohuck@redhat.com, peter.maydell@linaro.org, david@gibson.dropbear.id.au,
 stefanb@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The CRB command buffer currently is a RAM MemoryRegion and given
its base address alignment, it causes an error report on
vfio_listener_region_add(). This region could have been a RAM device
region, easing the detection of such safe situation but this option
was not well received. So let's add a helper function that uses the
memory region name to recognize the region and detect the situation
is safe wrt assignment. Other regions can be listed here if such kind
of problem occurs again.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/vfio/common.c     | 26 +++++++++++++++++++++++++-
 hw/vfio/trace-events |  1 +
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 080046e3f51..b58a38f5c57 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -861,6 +861,22 @@ static void vfio_unregister_ram_discard_listener(VFIOContainer *container,
     g_free(vrdl);
 }
 
+static bool vfio_known_safe_misalignment(MemoryRegionSection *section)
+{
+    MemoryRegion *mr = section->mr;
+
+    if (strcmp(memory_region_name(mr), "tpm-crb-cmd") != 0) {
+        return false;
+    }
+
+    /* this is a known safe misaligned region, just trace for debug purpose */
+    trace_vfio_known_safe_misalignment(memory_region_name(mr),
+                                       section->offset_within_address_space,
+                                       section->offset_within_region,
+                                       qemu_real_host_page_size);
+    return true;
+}
+
 static void vfio_listener_region_add(MemoryListener *listener,
                                      MemoryRegionSection *section)
 {
@@ -884,7 +900,15 @@ static void vfio_listener_region_add(MemoryListener *listener,
     if (unlikely((section->offset_within_address_space &
                   ~qemu_real_host_page_mask) !=
                  (section->offset_within_region & ~qemu_real_host_page_mask))) {
-        error_report("%s received unaligned region", __func__);
+        if (!vfio_known_safe_misalignment(section)) {
+            error_report("%s received unaligned region %s iova=0x%"PRIx64
+                         " offset_within_region=0x%"PRIx64
+                         " qemu_real_host_page_mask=0x%"PRIxPTR,
+                         __func__, memory_region_name(section->mr),
+                         section->offset_within_address_space,
+                         section->offset_within_region,
+                         qemu_real_host_page_mask);
+        }
         return;
     }
 
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index 0ef1b5f4a65..6f38a2e6991 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -100,6 +100,7 @@ vfio_listener_region_add_skip(uint64_t start, uint64_t end) "SKIPPING region_add
 vfio_spapr_group_attach(int groupfd, int tablefd) "Attached groupfd %d to liobn fd %d"
 vfio_listener_region_add_iommu(uint64_t start, uint64_t end) "region_add [iommu] 0x%"PRIx64" - 0x%"PRIx64
 vfio_listener_region_add_ram(uint64_t iova_start, uint64_t iova_end, void *vaddr) "region_add [ram] 0x%"PRIx64" - 0x%"PRIx64" [%p]"
+vfio_known_safe_misalignment(const char *name, uint64_t iova, uint64_t offset_within_region, uint64_t page_size) "Region \"%s\" iova=0x%"PRIx64" offset_within_region=0x%"PRIx64" qemu_real_host_page_mask=0x%"PRIxPTR ": cannot be mapped for DMA"
 vfio_listener_region_add_no_dma_map(const char *name, uint64_t iova, uint64_t size, uint64_t page_size) "Region \"%s\" 0x%"PRIx64" size=0x%"PRIx64" is not aligned to 0x%"PRIx64" and cannot be mapped for DMA"
 vfio_listener_region_del_skip(uint64_t start, uint64_t end) "SKIPPING region_del 0x%"PRIx64" - 0x%"PRIx64
 vfio_listener_region_del(uint64_t start, uint64_t end) "region_del 0x%"PRIx64" - 0x%"PRIx64
-- 
2.26.3


