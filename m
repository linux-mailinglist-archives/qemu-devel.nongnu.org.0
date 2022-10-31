Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E609861373C
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:59:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUKJ-0000jb-EL; Mon, 31 Oct 2022 08:55:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUJT-0006ut-Ud
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:54:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUJS-0003hO-88
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:54:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OfVKZLKpfkjYRt7QQ5s2jmkYW3qMCFNgmh3cfyEVChE=;
 b=bLc/8KjWin0enIoxjluHdCNP6/1iLhGA/xcvDk2oaTGod/S+rEOfitqtisZ3K3+09dsCYm
 33z2tOfF+z104yrjA15klLDwN4jPglGchlcXeQeXKynqCX5x8acHr09hU8CT+GbCDV8kFX
 u3XdEdh3YKsJWAFxFbE7dsUDAjRQT3I=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-590-dbgHnMIyNwKanX4LD4cYng-1; Mon, 31 Oct 2022 08:54:44 -0400
X-MC-Unique: dbgHnMIyNwKanX4LD4cYng-1
Received: by mail-wm1-f72.google.com with SMTP id
 h204-20020a1c21d5000000b003cf4e055442so5270432wmh.1
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:54:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OfVKZLKpfkjYRt7QQ5s2jmkYW3qMCFNgmh3cfyEVChE=;
 b=4dMznOOTw1zghBCC+7glip3OKzOpBvSc4UFjkQ0of+RBS+tkcmRANKB/O3POSKngZM
 R5KagJhrYeGE5GB7kiks76A5Q+F7Uy5WkqJkFO8pWWuUEBPLwEruh5x/J2whPp+SdDQ8
 DI9VonRfjU+jY3kmn6PbWExQqApl15GW5yYJmNnAQHHocgSoXpwA43bGUEh1HbOeVgiB
 BI2Y9KqWs+psHojhzpxY7pIZ5JCl2LRZAir5hQBY0B7msKk6I8KQcMdhERzVWnLPKTU0
 Gzil7YAN2wq0Fk8ncU29nbLUyoBDpdA1R1P6vEEIeCBD6LgRXZyinlBr3QpTIMCsHo4L
 s9iA==
X-Gm-Message-State: ACrzQf3+OpvzgWokJWffVUa7F2K1WfsNFseKHhasDjNLi8qJv5+dvdCf
 Jw+9cjaxYPGR7X9ZRDdIT3OvoLon5Ov1u1FzWxY0TrVDaXnULBFEQ+sW90SJvBVREUEYAmM3TsU
 /JNM+ya5qWTpb7x6uoIqIGLw9dancGsRDBBidlt9qZONRgHO0Dp84K6SLnrEe
X-Received: by 2002:a7b:cb56:0:b0:3b3:4ad8:9e31 with SMTP id
 v22-20020a7bcb56000000b003b34ad89e31mr7976760wmj.87.1667220883353; 
 Mon, 31 Oct 2022 05:54:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4V8s6Du9nvg+zf3lrAD0B8n1pXu5Qow/f2oZJVOSUPtJhbYDaGeCGjSQwr1hsUf/citoMtCw==
X-Received: by 2002:a7b:cb56:0:b0:3b3:4ad8:9e31 with SMTP id
 v22-20020a7bcb56000000b003b34ad89e31mr7976734wmj.87.1667220883101; 
 Mon, 31 Oct 2022 05:54:43 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 r10-20020a05600c35ca00b003c6f1732f65sm4940953wmq.38.2022.10.31.05.54.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:54:42 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:54:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Peter Xu <peterx@redhat.com>,
 Yi Liu <yi.l.liu@intel.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 83/86] intel-iommu: don't warn guest errors when getting
 rid2pasid entry
Message-ID: <20221031124928.128475-84-mst@redhat.com>
References: <20221031124928.128475-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

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


