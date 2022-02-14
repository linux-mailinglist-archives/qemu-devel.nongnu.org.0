Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3C04B418D
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 07:06:39 +0100 (CET)
Received: from localhost ([::1]:38118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJUVR-0007dc-RC
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 01:06:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nJUTR-0006S6-Hk
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 01:04:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nJUTK-00076M-MG
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 01:04:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644818664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=C4r0cVAuROeTYiJSp5Xi9UZ6ztwe29IPHzsCPX3//VM=;
 b=E7tF5rUHOxCMn8zkyLJOrqG+WhnTpKDRJnCh6zpeScizyCxOTw9MxCdj+fbfcGqwwu9jiz
 7HqtIVDShKj5Gqg8A0/fs3xhE3UR9AgYtABCSBf3NS/y2XwgN2OFwWOwhr9eYXlSCT5l2G
 YkPGIp/RZwHTMQF6C+05zMzeU/w7AMQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-600-PD5GpDfhMwSIups1p0_ZxQ-1; Mon, 14 Feb 2022 01:04:22 -0500
X-MC-Unique: PD5GpDfhMwSIups1p0_ZxQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BD451853024
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 06:04:21 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-239.pek2.redhat.com
 [10.72.12.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04DAE5ED3F;
 Mon, 14 Feb 2022 06:03:48 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	peterx@redhat.com
Subject: [PATCH] intel_iommu: support snoop control
Date: Mon, 14 Feb 2022 14:03:46 +0800
Message-Id: <20220214060346.72455-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SC is required for some kernel features like vhost-vDPA. So this patch
implements basic SC feature. The idea is pretty simple, for software
emulated DMA it would be always coherent. In this case we can simple
advertise ECAP_SC bit. For VFIO and vhost, thing will be more much
complicated, so this patch simply fail the IOMMU notifier
registration.

In the future, we may want to have a dedicated notifiers flag or
similar mechanism to demonstrate the coherency so VFIO could advertise
that if it has VFIO_DMA_CC_IOMMU, for vhost kernel backend we don't
need that since it's a software backend.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/i386/intel_iommu.c          | 14 +++++++++++++-
 hw/i386/intel_iommu_internal.h |  1 +
 include/hw/i386/intel_iommu.h  |  1 +
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 5b865ac08c..5fa8e361b8 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -3022,6 +3022,13 @@ static int vtd_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
     VTDAddressSpace *vtd_as = container_of(iommu, VTDAddressSpace, iommu);
     IntelIOMMUState *s = vtd_as->iommu_state;
 
+    /* TODO: add support for VFIO and vhost users */
+    if (s->snoop_control) {
+        error_setg_errno(errp, -ENOTSUP,
+                         "Snoop Control with vhost or VFIO is not supported");
+        return -ENOTSUP;
+    }
+
     /* Update per-address-space notifier flags */
     vtd_as->notifier_flags = new;
 
@@ -3105,6 +3112,7 @@ static Property vtd_properties[] = {
                       VTD_HOST_ADDRESS_WIDTH),
     DEFINE_PROP_BOOL("caching-mode", IntelIOMMUState, caching_mode, FALSE),
     DEFINE_PROP_BOOL("x-scalable-mode", IntelIOMMUState, scalable_mode, FALSE),
+    DEFINE_PROP_BOOL("snoop-control", IntelIOMMUState, snoop_control, false),
     DEFINE_PROP_BOOL("dma-drain", IntelIOMMUState, dma_drain, true),
     DEFINE_PROP_END_OF_LIST(),
 };
@@ -3635,7 +3643,7 @@ static void vtd_init(IntelIOMMUState *s)
     vtd_spte_rsvd_large[3] = VTD_SPTE_LPAGE_L3_RSVD_MASK(s->aw_bits,
                                                          x86_iommu->dt_supported);
 
-    if (s->scalable_mode) {
+    if (s->scalable_mode || s->snoop_control) {
         vtd_spte_rsvd[1] &= ~VTD_SPTE_SNP;
         vtd_spte_rsvd_large[2] &= ~VTD_SPTE_SNP;
         vtd_spte_rsvd_large[3] &= ~VTD_SPTE_SNP;
@@ -3666,6 +3674,10 @@ static void vtd_init(IntelIOMMUState *s)
         s->ecap |= VTD_ECAP_SMTS | VTD_ECAP_SRS | VTD_ECAP_SLTS;
     }
 
+    if (s->snoop_control) {
+        s->ecap |= VTD_ECAP_SC;
+    }
+
     vtd_reset_caches(s);
 
     /* Define registers with default values and bit semantics */
diff --git a/hw/i386/intel_iommu_internal.h b/hw/i386/intel_iommu_internal.h
index a6c788049b..1ff13b40f9 100644
--- a/hw/i386/intel_iommu_internal.h
+++ b/hw/i386/intel_iommu_internal.h
@@ -188,6 +188,7 @@
 #define VTD_ECAP_IR                 (1ULL << 3)
 #define VTD_ECAP_EIM                (1ULL << 4)
 #define VTD_ECAP_PT                 (1ULL << 6)
+#define VTD_ECAP_SC                 (1ULL << 7)
 #define VTD_ECAP_MHMV               (15ULL << 20)
 #define VTD_ECAP_SRS                (1ULL << 31)
 #define VTD_ECAP_SMTS               (1ULL << 43)
diff --git a/include/hw/i386/intel_iommu.h b/include/hw/i386/intel_iommu.h
index 41783ee46d..3b5ac869db 100644
--- a/include/hw/i386/intel_iommu.h
+++ b/include/hw/i386/intel_iommu.h
@@ -228,6 +228,7 @@ struct IntelIOMMUState {
 
     bool caching_mode;              /* RO - is cap CM enabled? */
     bool scalable_mode;             /* RO - is Scalable Mode supported? */
+    bool snoop_control;             /* RO - is SNP filed supported? */
 
     dma_addr_t root;                /* Current root table pointer */
     bool root_scalable;             /* Type of root table (scalable or not) */
-- 
2.25.1


