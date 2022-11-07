Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 633E46202E1
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 00:00:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osB06-0005aG-Fx; Mon, 07 Nov 2022 17:53:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAzz-0005WK-Bh
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:53:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAzx-0003En-Of
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:53:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q24UDijnsD4tZvlqNP8+qxCMbyDlif/Fufu673ZFHTU=;
 b=GrZM6SBvTzTREixQEvqFa4bqU++mOZfNEuJ6Vj0HLcuxfg2yQGtyzqFf62mSf8SZjTYnk+
 TVSiqyKwi0i8aMBvdjqsJ8Oqq4BM0RPEAgbvuavSIMe51N+v8aT/X49Tho39XOo40nqQVn
 nZV5yR41GPDmPqI+RPb1+NRfEHIsXUw=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-487-EmnIu_QkOfiYKKBHeZgQjQ-1; Mon, 07 Nov 2022 17:53:44 -0500
X-MC-Unique: EmnIu_QkOfiYKKBHeZgQjQ-1
Received: by mail-qk1-f198.google.com with SMTP id
 bq13-20020a05620a468d00b006fa5a75759aso11401606qkb.13
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:53:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q24UDijnsD4tZvlqNP8+qxCMbyDlif/Fufu673ZFHTU=;
 b=ESyH33uO5FJsuV/4wERqRI9hnLxJYxxVf56+OaKWkq4rGLKWz8oGcxSvM0ZZWyd173
 UywoTUDYdRTpBdE5l7nOzmhLAAHZ/o3KRm8in0ZZMUaRlcKOySs/EDIN/hiMGMEr66YR
 j7TlNstrzaOHuLtiBzyW95EPZE5OakPuVC2PFosoUh7PGhmibpdoV29C0jJJ7oO1N5kL
 K4JNonmsinIN3tmx5GQ8ZkJzp6lHlS21GKfiNXtCO5Qe4MZb7G1ArnPjY12Jp4fVsQZX
 Gz4Cz2I6/LBEB4wsdxgSuProvzs36PM87+09HAV3udRoqdvW9BBISu8bknn5FWNy+TKI
 aWYg==
X-Gm-Message-State: ACrzQf2JjLO4dYVKE5HwV14CA+kRARSgVUERlrrMlSggjWUVEbI2wFb8
 2utVM6EM5wamGNDQSFDY25dz7p5Ux2AC1HSRHiw7ZetC8cRRscDOtWnYZX1eoafvWMvpwJsWT6k
 uT+pWc2y8QenS9kAJj91o/Jies6WejWBkRfXV0+3df/IYRQyamibvEsZ0Ypjx
X-Received: by 2002:a37:ad03:0:b0:6fa:1747:537f with SMTP id
 f3-20020a37ad03000000b006fa1747537fmr36444629qkm.703.1667861623688; 
 Mon, 07 Nov 2022 14:53:43 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6tyC4wwyN4qj25UFK1kWv9iw3zeyixfYiFhszSgnYdxpchPtwDT1n0/IYvStiu72Lpe6nl7g==
X-Received: by 2002:a37:ad03:0:b0:6fa:1747:537f with SMTP id
 f3-20020a37ad03000000b006fa1747537fmr36444607qkm.703.1667861623328; 
 Mon, 07 Nov 2022 14:53:43 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 bn5-20020a05620a2ac500b006eee3a09ff3sm7678393qkb.69.2022.11.07.14.53.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:53:43 -0800 (PST)
Date: Mon, 7 Nov 2022 17:53:38 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Peter Xu <peterx@redhat.com>,
 Yi Liu <yi.l.liu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL v4 73/83] intel-iommu: convert VTD_PE_GET_FPD_ERR() to be a
 function
Message-ID: <20221107224600.934080-74-mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107224600.934080-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Jason Wang <jasowang@redhat.com>

We used to have a macro for VTD_PE_GET_FPD_ERR() but it has an
internal goto which prevents it from being reused. This patch convert
that macro to a dedicated function and let the caller to decide what
to do (e.g using goto or not). This makes sure it can be re-used for
other function that requires fault reporting.

Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20221028061436.30093-4-jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Yi Liu <yi.l.liu@intel.com>
---
 hw/i386/intel_iommu.c | 42 ++++++++++++++++++++++++++++--------------
 1 file changed, 28 insertions(+), 14 deletions(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 3d426bb326..259f720c7c 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -49,17 +49,6 @@
 /* pe operations */
 #define VTD_PE_GET_TYPE(pe) ((pe)->val[0] & VTD_SM_PASID_ENTRY_PGTT)
 #define VTD_PE_GET_LEVEL(pe) (2 + (((pe)->val[0] >> 2) & VTD_SM_PASID_ENTRY_AW))
-#define VTD_PE_GET_FPD_ERR(ret_fr, is_fpd_set, s, source_id, addr, is_write) {\
-    if (ret_fr) {                                                             \
-        ret_fr = -ret_fr;                                                     \
-        if (is_fpd_set && vtd_is_qualified_fault(ret_fr)) {                   \
-            trace_vtd_fault_disabled();                                       \
-        } else {                                                              \
-            vtd_report_dmar_fault(s, source_id, addr, ret_fr, is_write);      \
-        }                                                                     \
-        goto error;                                                           \
-    }                                                                         \
-}
 
 /*
  * PCI bus number (or SID) is not reliable since the device is usaully
@@ -1716,6 +1705,19 @@ out:
     trace_vtd_pt_enable_fast_path(source_id, success);
 }
 
+static void vtd_report_fault(IntelIOMMUState *s,
+                             int err, bool is_fpd_set,
+                             uint16_t source_id,
+                             hwaddr addr,
+                             bool is_write)
+{
+    if (is_fpd_set && vtd_is_qualified_fault(err)) {
+        trace_vtd_fault_disabled();
+    } else {
+        vtd_report_dmar_fault(s, source_id, addr, err, is_write);
+    }
+}
+
 /* Map dev to context-entry then do a paging-structures walk to do a iommu
  * translation.
  *
@@ -1776,7 +1778,11 @@ static bool vtd_do_iommu_translate(VTDAddressSpace *vtd_as, PCIBus *bus,
         is_fpd_set = ce.lo & VTD_CONTEXT_ENTRY_FPD;
         if (!is_fpd_set && s->root_scalable) {
             ret_fr = vtd_ce_get_pasid_fpd(s, &ce, &is_fpd_set);
-            VTD_PE_GET_FPD_ERR(ret_fr, is_fpd_set, s, source_id, addr, is_write);
+            if (ret_fr) {
+                vtd_report_fault(s, -ret_fr, is_fpd_set,
+                                 source_id, addr, is_write);
+                goto error;
+            }
         }
     } else {
         ret_fr = vtd_dev_to_context_entry(s, bus_num, devfn, &ce);
@@ -1784,7 +1790,11 @@ static bool vtd_do_iommu_translate(VTDAddressSpace *vtd_as, PCIBus *bus,
         if (!ret_fr && !is_fpd_set && s->root_scalable) {
             ret_fr = vtd_ce_get_pasid_fpd(s, &ce, &is_fpd_set);
         }
-        VTD_PE_GET_FPD_ERR(ret_fr, is_fpd_set, s, source_id, addr, is_write);
+        if (ret_fr) {
+            vtd_report_fault(s, -ret_fr, is_fpd_set,
+                             source_id, addr, is_write);
+            goto error;
+        }
         /* Update context-cache */
         trace_vtd_iotlb_cc_update(bus_num, devfn, ce.hi, ce.lo,
                                   cc_entry->context_cache_gen,
@@ -1820,7 +1830,11 @@ static bool vtd_do_iommu_translate(VTDAddressSpace *vtd_as, PCIBus *bus,
 
     ret_fr = vtd_iova_to_slpte(s, &ce, addr, is_write, &slpte, &level,
                                &reads, &writes, s->aw_bits);
-    VTD_PE_GET_FPD_ERR(ret_fr, is_fpd_set, s, source_id, addr, is_write);
+    if (ret_fr) {
+        vtd_report_fault(s, -ret_fr, is_fpd_set, source_id,
+                         addr, is_write);
+        goto error;
+    }
 
     page_mask = vtd_slpt_level_page_mask(level);
     access_flags = IOMMU_ACCESS_FLAG(reads, writes);
-- 
MST


