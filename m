Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 333745292E5
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 23:31:26 +0200 (CEST)
Received: from localhost ([::1]:42758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqiJI-0006Pc-2b
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 17:31:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhjF-0000dW-Vb
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:54:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhjE-0006hg-FQ
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:54:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6JmJU4DQmPiF4o0kvzjn2IEoCR0HTcDGEzmB5vNcXOg=;
 b=i9eWuCafWH8YxCKdXIwq+2tXzn5MV+TvDIzo8ObXRkKTvrrT/AFrXavsmq3BBaqq3FrnRD
 mibh1Gnb9hROgrygZ06pmhXbNcRbzFZVv2gXWBWiL+yjpF4ndZBd52rWhLEwIOQ4qQ3QTk
 gs9Rt5oUbBZzCJAuhg3TdIP0XWOaj7I=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-x4VprD02Ot2OO_9gVUql8w-1; Mon, 16 May 2022 16:54:06 -0400
X-MC-Unique: x4VprD02Ot2OO_9gVUql8w-1
Received: by mail-ej1-f70.google.com with SMTP id
 ga27-20020a1709070c1b00b006f43c161da4so6357468ejc.7
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:54:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6JmJU4DQmPiF4o0kvzjn2IEoCR0HTcDGEzmB5vNcXOg=;
 b=B8n6UpbGjTRCm43nNrb5Urnlpa2DcZLGfx8CeivHfmrxW/5sry1ugnoOlJ3Agf0gHY
 VQ5kaBdQvCvY1D5iSeq5Sl2aRrdBVFqwae/EhvFXXO/8DbULmVXZ1FvdEWJiDLpC3D6C
 43dLGZYn7S79zMCsm2xC354kCjRMLrs5hio5ad3N1RLDEH4PpLrK7at4t5kXPav4IIkA
 0y8RLZnC3krv3V+IVqpzmVBzS+nLfvw8LYRAAjpxs/O3YHYirq+PTyNMp/4hr5Cv5EkQ
 ZqzNftOwfa8mIIC07ne+rrN8nhRQU5Yy3lA0uBlsNqSuYup/DRU2GXQSLzta5OhtrtbW
 b6zA==
X-Gm-Message-State: AOAM530EqDAjs+iuTBTyjkdHMxpT0kTbEJJoBh9oqttd4sFwcrOnB4l/
 Pz1TNhRNRxuFnW/3Jc0pb1YKSgDtBbVgwNNKbFZTp6SRF4o7yseDaCFneIrvSqSw+jKWoRB90GC
 BUaz0DBMZPTU8GYunsCbfV2zawnEpxdrK4oaUO+vyxeG6g32e8E0CpEcKAcnk
X-Received: by 2002:a50:9b08:0:b0:42a:2d15:e15a with SMTP id
 o8-20020a509b08000000b0042a2d15e15amr15007843edi.361.1652734445477; 
 Mon, 16 May 2022 13:54:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3QWiK75phWf2FaS1uW2R1iEGx+8DvKX2lorGM7aL+/ZEeceSqJbtIj1blHE2pKJtaiaiDUQ==
X-Received: by 2002:a50:9b08:0:b0:42a:2d15:e15a with SMTP id
 o8-20020a509b08000000b0042a2d15e15amr15007812edi.361.1652734445023; 
 Mon, 16 May 2022 13:54:05 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 u19-20020aa7d0d3000000b0042ab87ea713sm1474961edo.22.2022.05.16.13.54.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:54:04 -0700 (PDT)
Date: Mon, 16 May 2022 16:54:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL v2 56/86] intel-iommu: update iq_dw during post load
Message-ID: <20220516204913.542894-57-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jason Wang <jasowang@redhat.com>

We need to update iq_dw according to the DMA_IRQ_REG during post
load. Otherwise we may get wrong IOTLB invalidation descriptor after
migration.

Fixes: fb43cf739e ("intel_iommu: scalable mode emulation")
Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20220317080522.14621-2-jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
---
 hw/i386/intel_iommu.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 53e3f5035d..2162394e08 100644
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
@@ -2904,12 +2916,7 @@ static void vtd_mem_write(void *opaque, hwaddr addr,
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
@@ -3082,6 +3089,8 @@ static int vtd_post_load(void *opaque, int version_id)
      */
     vtd_update_scalable_state(iommu);
 
+    vtd_update_iq_dw(iommu);
+
     /*
      * Memory regions are dynamically turned on/off depending on
      * context entry configurations from the guest. After migration,
-- 
MST


