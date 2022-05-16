Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A655283D0
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 14:05:00 +0200 (CEST)
Received: from localhost ([::1]:45724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqZT9-0004p3-97
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 08:04:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY7y-00010j-Ha
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:39:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY7w-0005YO-SD
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:39:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6JmJU4DQmPiF4o0kvzjn2IEoCR0HTcDGEzmB5vNcXOg=;
 b=Dfz2VIHD64q2NW5Mm97Ofvphx0f1Xnxk+QFh7JWpNiEM6x+0g0unVfoEqpHkcmj+wguBO+
 oa3hQ7yF2L9b0SXddILHfhDbEY1jDfy7KlC1c36ehISBoBexAyhQ+zHk06U8Hkf+GWkw7p
 MODo7Vo2fGPDYO+peF17po6ZxOw/3VA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-346-wpIUWoRWOC6kn9YlSraE9w-1; Mon, 16 May 2022 06:38:59 -0400
X-MC-Unique: wpIUWoRWOC6kn9YlSraE9w-1
Received: by mail-wm1-f72.google.com with SMTP id
 26-20020a05600c021a00b003940660c053so6566299wmi.2
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:38:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6JmJU4DQmPiF4o0kvzjn2IEoCR0HTcDGEzmB5vNcXOg=;
 b=7pvRJS8bXVzBA+SpsF77dkD0n6ixUewuwvoGnyoj8z9FcjGqV5B/ODMfgh9i/NLWDY
 09nv8d3eHDufG21Jcv+spGHcF7wwxmioCOpAaRvLy0Ys0Qfj+Oy49+oRts/MSbHyCvvQ
 I3v4q3C4tMEicOX4U0UDU1WFjISOuOVSGIccfUvcZuVK4TKVhh4wXPGpPMFPfkFeUDSV
 dRC5JyRHExymWAhJMhAR/M7VgLfv2rc5n6f5In1+fbK71H46qQ2f9rjlgI5DwO8KGaKc
 3zX2B/GDz2XVIsv1pInijfdAG0ciRWutisDfKi5/MT+siQhE2+LSdsQyF83izQ9OwT6/
 iyxQ==
X-Gm-Message-State: AOAM531+rgunkC5eQxgXmaydfMd9E2e1zkyrSL3Cy5P3ouYyno9n8l86
 zBupsdWS1kaCSaAWZh9F84Ucsd5TPWjca+NVUUSZNP2EdEtAeb2t/7X4kWnfA+JRsWgtkSjM2Iq
 7BURdpsBmPu/876hmvUDYOQEomo5gLTD3xsEffG+ta650BzrykKdc+/EtLtHq
X-Received: by 2002:a5d:5541:0:b0:20d:a89:ae21 with SMTP id
 g1-20020a5d5541000000b0020d0a89ae21mr2729230wrw.176.1652697537616; 
 Mon, 16 May 2022 03:38:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfDsoXPKYffRXQI5kKBwlZ4QVzBY+N2Q5K5OPpU0RykZap20psiVEc5oFoJUfHSapCJBNYCA==
X-Received: by 2002:a5d:5541:0:b0:20d:a89:ae21 with SMTP id
 g1-20020a5d5541000000b0020d0a89ae21mr2729205wrw.176.1652697537280; 
 Mon, 16 May 2022 03:38:57 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 r17-20020adfbb11000000b0020c5253d920sm10614378wrg.108.2022.05.16.03.38.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:38:56 -0700 (PDT)
Date: Mon, 16 May 2022 06:38:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Peter Xu <peterx@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 56/91] intel-iommu: update iq_dw during post load
Message-ID: <20220516095448.507876-57-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516095448.507876-1-mst@redhat.com>
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


