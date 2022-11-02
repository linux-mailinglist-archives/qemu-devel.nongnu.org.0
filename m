Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC411616850
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:20:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGMJ-0005jl-4J; Wed, 02 Nov 2022 12:12:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGLt-0004Ce-Cj
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:12:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGLk-0004Oz-Ls
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:12:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OfVKZLKpfkjYRt7QQ5s2jmkYW3qMCFNgmh3cfyEVChE=;
 b=HdkbLbJyQ08WilORCj/+tdN7F8Wg71y3tEh4/FMi4XPp6J7nDUA68Uua7wxUr9vfNfucZ1
 pEtYsbpWydHSi+P8Te1Z+sMrQuX6nN6dBvQt+0/jYZr0X3IMlpUgGnNO9XEF9xju5k8tfK
 epqeGyiHyhTmkCzEHlD2ZBEjsYgZR+Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-269-v8815cMgNXS4vTf1KZKp0Q-1; Wed, 02 Nov 2022 12:12:15 -0400
X-MC-Unique: v8815cMgNXS4vTf1KZKp0Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 z15-20020a1c4c0f000000b003cf6f80007cso649182wmf.3
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:12:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OfVKZLKpfkjYRt7QQ5s2jmkYW3qMCFNgmh3cfyEVChE=;
 b=DFnE4gpZGCajaJJa3HeFuWuS/1UhF3vnrANfLEgDYCzf/hKEA/5NAMUlmUN7oBfJyj
 LGwhqPvC9Hh1J8AXuy13J4j3fyr7CLMwTNSi4bsel1Up680EccE2c8YE8JOxiE7nmo//
 G1aDtPI7KdNFAl1qONOfE65JqYHMzBnS1hQzFxDcig2PH8rx4xPylKCBNVpHWOA3QEog
 sD+mIycj8MkECS8pV9dgycKzwyOuJMpDHwm8U5pVCULBcbdk/lxAYsS6dkHNw5cbsNUA
 lxGXgabQuibyID3M1ISa+k1z1aXcxrMIKeNPCjaMWpl3/p1wZ/LqHYCB6wBOJ4wEIaE4
 13xg==
X-Gm-Message-State: ACrzQf2IH+TVf8CNGOXFB/VgAPGa12yU2ZlEi4evBuizyHGmPsTiqMyd
 uClYuXd7yVHYABezNtj5tuQZz9JIu0AQzhRaccccvFLt8HIJZdC5D5nBNdIyHQSWoB5vVbWNJiT
 r/iu3A1Ag2BNZx3IqyFZFHITeZf1oF4tmWCreEtkqnmbJlvkPl+LAdnB9Xzet
X-Received: by 2002:a5d:5233:0:b0:236:b893:9d81 with SMTP id
 i19-20020a5d5233000000b00236b8939d81mr13886455wra.503.1667405534128; 
 Wed, 02 Nov 2022 09:12:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4dS3efJO8oy1tLz5uZr1YqYLg3DwS1FJUG9ZWuhvimfLi7sd3j/MghOLx/cv2h2nKBaDFESA==
X-Received: by 2002:a5d:5233:0:b0:236:b893:9d81 with SMTP id
 i19-20020a5d5233000000b00236b8939d81mr13886415wra.503.1667405533786; 
 Wed, 02 Nov 2022 09:12:13 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 bi22-20020a05600c3d9600b003c6c3fb3cf6sm2786574wmb.18.2022.11.02.09.12.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:12:13 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:12:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Peter Xu <peterx@redhat.com>,
 Yi Liu <yi.l.liu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL v2 79/82] intel-iommu: don't warn guest errors when getting
 rid2pasid entry
Message-ID: <20221102160336.616599-80-mst@redhat.com>
References: <20221102160336.616599-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102160336.616599-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Jason Wang <jasowang@redhat.com>

We use to warn on wrong rid2pasid entry. But this error could be
triggered by the guest and could happens during initialization. So
let's don't warn in this case.

Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20221028061436.30093-2-jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Yi Liu <yi.l.liu@intel.com>
---
 hw/i386/intel_iommu.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 6524c2ee32..271de995be 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -1554,8 +1554,10 @@ static bool vtd_dev_pt_enabled(IntelIOMMUState *s, VTDContextEntry *ce)
     if (s->root_scalable) {
         ret = vtd_ce_get_rid2pasid_entry(s, ce, &pe);
         if (ret) {
-            error_report_once("%s: vtd_ce_get_rid2pasid_entry error: %"PRId32,
-                              __func__, ret);
+            /*
+             * This error is guest triggerable. We should assumt PT
+             * not enabled for safety.
+             */
             return false;
         }
         return (VTD_PE_GET_TYPE(&pe) == VTD_SM_PASID_ENTRY_PT);
@@ -1569,14 +1571,12 @@ static bool vtd_as_pt_enabled(VTDAddressSpace *as)
 {
     IntelIOMMUState *s;
     VTDContextEntry ce;
-    int ret;
 
     assert(as);
 
     s = as->iommu_state;
-    ret = vtd_dev_to_context_entry(s, pci_bus_num(as->bus),
-                                   as->devfn, &ce);
-    if (ret) {
+    if (vtd_dev_to_context_entry(s, pci_bus_num(as->bus), as->devfn,
+                                 &ce)) {
         /*
          * Possibly failed to parse the context entry for some reason
          * (e.g., during init, or any guest configuration errors on
-- 
MST


