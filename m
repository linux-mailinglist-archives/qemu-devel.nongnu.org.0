Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 915004DC0A3
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 09:08:36 +0100 (CET)
Received: from localhost ([::1]:45828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUlBT-0004kL-5B
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 04:08:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nUl8f-0002nY-Ci
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 04:05:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nUl8d-0002fZ-6n
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 04:05:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647504337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WLNtgJ/oB4LM0sahSaf8ZqzSNGy21bHM63tjthX/QcM=;
 b=IjvFBjssTp6tXcFARJsPyyC9yFiqEaxvVoxVWPmif4UK7Jng8yYokQHh4FnH4wdZI9TKrm
 zs+RA/L3rYZBZhfkqogY5IC1Qq0M7Pd2dPjfu7rxgp95ic6mTZ0zWVFlbH60+jlt9NdAu4
 L7V8gMDKfCFaglujuHJEeS4RNm5WH+M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-15-dUKnDr92Oy6xQy-TPHanFQ-1; Thu, 17 Mar 2022 04:05:36 -0400
X-MC-Unique: dUKnDr92Oy6xQy-TPHanFQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 70ED5804183
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 08:05:36 +0000 (UTC)
Received: from localhost.localdomain (ovpn-14-11.pek2.redhat.com [10.72.14.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A624C23DC5;
 Thu, 17 Mar 2022 08:05:33 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	peterx@redhat.com
Subject: [PATCH 2/2] intel-iommu: update iq_dw during post load
Date: Thu, 17 Mar 2022 16:05:22 +0800
Message-Id: <20220317080522.14621-2-jasowang@redhat.com>
In-Reply-To: <20220317080522.14621-1-jasowang@redhat.com>
References: <20220317080522.14621-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We need to update iq_dw according to the DMA_IRQ_REG during post
load. Otherwise we may get wrong IOTLB invalidation descriptor after
migration.

Fixes: fb43cf739e ("intel_iommu: scalable mode emulation")
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/i386/intel_iommu.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index a13cfecfce..c58f603b72 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -181,6 +181,18 @@ static void vtd_update_scalable_state(IntelIOMMUState *s)
     }
 }
 
+static void vtd_update_iq_dw(IntelIOMMUState *s)
+{
+    uint64_t val = vtd_get_quad_raw(s, DMAR_IQA_REG);
+
+    if (s->ecap & VTD_ECAP_SMTS &&
+        val & VTD_IQA_DW_MASK) {
+        s->iq_dw = true;
+    } else {
+        s->iq_dw = false;
+    }
+}
+
 /* Whether the address space needs to notify new mappings */
 static inline gboolean vtd_as_has_map_notifier(VTDAddressSpace *as)
 {
@@ -2883,12 +2895,7 @@ static void vtd_mem_write(void *opaque, hwaddr addr,
         } else {
             vtd_set_quad(s, addr, val);
         }
-        if (s->ecap & VTD_ECAP_SMTS &&
-            val & VTD_IQA_DW_MASK) {
-            s->iq_dw = true;
-        } else {
-            s->iq_dw = false;
-        }
+        vtd_update_iq_dw(s);
         break;
 
     case DMAR_IQA_REG_HI:
@@ -3061,6 +3068,8 @@ static int vtd_post_load(void *opaque, int version_id)
      */
     vtd_update_scalable_state(iommu);
 
+    vtd_update_iq_dw(iommu);
+
     /*
      * Memory regions are dynamically turned on/off depending on
      * context entry configurations from the guest. After migration,
-- 
2.25.1


