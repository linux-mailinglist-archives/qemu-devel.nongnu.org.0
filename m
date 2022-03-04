Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE544CD636
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:19:02 +0100 (CET)
Received: from localhost ([::1]:35700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ8lp-00006m-3Q
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:19:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ8A7-0002UH-MQ
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:40:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ8A2-0000cX-9F
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:40:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646401197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0lVkB02NxWofYSS4as/4ncAO6TZl7kf9saq/7ls1Nww=;
 b=RESvClL4ssFcuv2qs/UzD7XQQL95J2Y3Z5EOb5RCzgGCJzLyeOlPM+bOsmyQPcC5EBlLsg
 A66T0PTJnPldY7sOCewDhtAhFhfLh6qmGMbRYb5m+ny+9/JlJAafD8pty0r983ZMcKfmd/
 k3grXh5ubMljjBq7z5n4GqAMdYoO/eM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-39-I9fI4385PDWOXyX_pX2irw-1; Fri, 04 Mar 2022 08:39:56 -0500
X-MC-Unique: I9fI4385PDWOXyX_pX2irw-1
Received: by mail-wm1-f71.google.com with SMTP id
 h206-20020a1c21d7000000b003552c13626cso4160677wmh.3
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 05:39:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0lVkB02NxWofYSS4as/4ncAO6TZl7kf9saq/7ls1Nww=;
 b=3aK3E+nZnFAU0cZ1S/p6EquL/QcWAG2KCnLorFV4WxuKPUbMn1danPkK0m8maDTV4t
 yTgRG3g9Sc04KSHTjSF5SPLlrZZC60BbNUJ/igQJj3O9L14mG5hEJ9vJm/7LIpcOCBNk
 0xM3pAGOEzUQd7J4GTsUiyxXnRIZV6Sxoh+gc2Npj7NkxG6xGlirMHjniFoydUhQc9WO
 BulJorfJoAknPONjXyGu6GzWg6osGv820PFWaEZs0UO2jNY2rsUP9oaLdnDPD5X2Pvth
 8VjfhDq1NUM+vvyt8wpIIis4cp82lzTeFoFWYYlK57jtF9yrZA1cpUwxBh+rIfTkmkIz
 18hw==
X-Gm-Message-State: AOAM530WIEPlMkUC2f26Py41M/N5mmDD5l8fjVzTqXnI/zoaK291HpLc
 NVhdhLdhDsSam+pqN/LtqIR/K0t2fIaAQZUyFt6Dqpwj9C7c+ReGVtP3UzgF40eXUD+AaS1Ivrz
 KFqFANkKzywdY6QQN/kc1458gZWmBFup+RfRp+CV1Xt65FhxPWN+Nf3b6DQ3f
X-Received: by 2002:a7b:c383:0:b0:381:1b50:a9d with SMTP id
 s3-20020a7bc383000000b003811b500a9dmr7856637wmj.90.1646401194471; 
 Fri, 04 Mar 2022 05:39:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJylMzhO32zoG/SFG+pAlqL970e44F33m9F4bxun5svvcL8NZmBU3qVV90c55CrdY8qmdkPmTg==
X-Received: by 2002:a7b:c383:0:b0:381:1b50:a9d with SMTP id
 s3-20020a7bc383000000b003811b500a9dmr7856614wmj.90.1646401194149; 
 Fri, 04 Mar 2022 05:39:54 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 l7-20020adfe9c7000000b001f06f8ec92dsm2115310wrn.30.2022.03.04.05.39.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 05:39:51 -0800 (PST)
Date: Fri, 4 Mar 2022 08:39:47 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/45] intel_iommu: support snoop control
Message-ID: <20220304133556.233983-20-mst@redhat.com>
References: <20220304133556.233983-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220304133556.233983-1-mst@redhat.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jason Wang <jasowang@redhat.com>

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
Message-Id: <20220214060346.72455-1-jasowang@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/intel_iommu_internal.h |  1 +
 include/hw/i386/intel_iommu.h  |  1 +
 hw/i386/intel_iommu.c          | 14 +++++++++++++-
 3 files changed, 15 insertions(+), 1 deletion(-)

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
diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 4c6c016388..32471a44cb 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -3030,6 +3030,13 @@ static int vtd_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
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
 
@@ -3113,6 +3120,7 @@ static Property vtd_properties[] = {
                       VTD_HOST_ADDRESS_WIDTH),
     DEFINE_PROP_BOOL("caching-mode", IntelIOMMUState, caching_mode, FALSE),
     DEFINE_PROP_BOOL("x-scalable-mode", IntelIOMMUState, scalable_mode, FALSE),
+    DEFINE_PROP_BOOL("snoop-control", IntelIOMMUState, snoop_control, false),
     DEFINE_PROP_BOOL("dma-drain", IntelIOMMUState, dma_drain, true),
     DEFINE_PROP_END_OF_LIST(),
 };
@@ -3643,7 +3651,7 @@ static void vtd_init(IntelIOMMUState *s)
     vtd_spte_rsvd_large[3] = VTD_SPTE_LPAGE_L3_RSVD_MASK(s->aw_bits,
                                                          x86_iommu->dt_supported);
 
-    if (s->scalable_mode) {
+    if (s->scalable_mode || s->snoop_control) {
         vtd_spte_rsvd[1] &= ~VTD_SPTE_SNP;
         vtd_spte_rsvd_large[2] &= ~VTD_SPTE_SNP;
         vtd_spte_rsvd_large[3] &= ~VTD_SPTE_SNP;
@@ -3674,6 +3682,10 @@ static void vtd_init(IntelIOMMUState *s)
         s->ecap |= VTD_ECAP_SMTS | VTD_ECAP_SRS | VTD_ECAP_SLTS;
     }
 
+    if (s->snoop_control) {
+        s->ecap |= VTD_ECAP_SC;
+    }
+
     vtd_reset_caches(s);
 
     /* Define registers with default values and bit semantics */
-- 
MST


