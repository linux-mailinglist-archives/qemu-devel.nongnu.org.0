Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 704B4613770
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:09:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUKm-0001vz-81; Mon, 31 Oct 2022 08:56:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUJq-0007x0-CQ
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:55:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUJf-0003ju-Bs
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:55:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3HLl4tNY2+/lq1uK3hyu+teGqpzhceB9L+dLDgAZow8=;
 b=R6kkXWpWah989VR4Wa2yuoArgyfNh9iz7y7cLd29ap2hn1zlEELONL0em6XZXunCW3ZrEO
 aLvjEOkyfBQ37Mxhf5g8tl76by2pP0PCwAZhuN1KMSOKnnKypur2ds4Cm9dK0OsgDQ0zL6
 3jTJbdH7E8ZM18KOVubvNCYwkoKPhFU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-459-5pqk9NzwMgCZGkmsGfUG-w-1; Mon, 31 Oct 2022 08:54:51 -0400
X-MC-Unique: 5pqk9NzwMgCZGkmsGfUG-w-1
Received: by mail-wm1-f70.google.com with SMTP id
 d13-20020a05600c34cd00b003ce1f62ac5aso8310983wmq.4
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:54:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3HLl4tNY2+/lq1uK3hyu+teGqpzhceB9L+dLDgAZow8=;
 b=eh/0nsMjMW7r1sWkvGe3iOBCi/eeRfMbFhWkjnKSeidmZOkAbvDTKLKMxmpgNGGqcM
 8fmLHq/XzvCEeWbSILsvuR4AEyK3EKou1BHZE3DWgLWyrDZ9C31TxupwCOHrzlIwub9u
 wgkQX12454siZHz03Fho1LyX77YR4aekKodJ3TphBXxlNXR4kJx+lTLQLuoAgJksm3Vu
 TI4itaTV5KG6PT6JqirwVYY9depFRrS4lNEKoBhC1/84kfvRraXF3VG1PogZvMy1Faaj
 39qJyVZhVI2xAZOEepIAxZOF1B7xwoALPMR6zKDom7YH8PP8m8UQK9MIxZWMbvJgxqsq
 F7tA==
X-Gm-Message-State: ACrzQf0i8svevo+Ct1fzxiOTk6ui1ZJMuoTyYC0+x01MfC9RtLQt+f0V
 XDYS8yEJQER9ElKPo+pYx8a1gF0e4otQBis+kEGvv5CDsS6SHSBo8t1/Y6kUIjczd1FsyQnJKt1
 aeuTEy0AvlplZbypWNK172dXE2SRss+V24WHdJGHnDDIdOKD1RqYQx9uY+LMY
X-Received: by 2002:a05:6000:144d:b0:231:51d2:e67a with SMTP id
 v13-20020a056000144d00b0023151d2e67amr8306407wrx.294.1667220890402; 
 Mon, 31 Oct 2022 05:54:50 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Bkrfjw6hDdLGc6H/oO/doWcjHON/QeVXDmecd/KBrWWPWi77kIpb1GJLx+5Bqq/WAyzsvSQ==
X-Received: by 2002:a05:6000:144d:b0:231:51d2:e67a with SMTP id
 v13-20020a056000144d00b0023151d2e67amr8306381wrx.294.1667220890113; 
 Mon, 31 Oct 2022 05:54:50 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 g13-20020a05600c310d00b003b4cba4ef71sm8424257wmo.41.2022.10.31.05.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:54:49 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:54:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Peter Xu <peterx@redhat.com>,
 Yi Liu <yi.l.liu@intel.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 85/86] intel-iommu: convert VTD_PE_GET_FPD_ERR() to be a
 function
Message-ID: <20221031124928.128475-86-mst@redhat.com>
References: <20221031124928.128475-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
index 9fe5a222eb..9029ee98f4 100644
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


