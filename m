Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 504544E205C
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 06:59:00 +0100 (CET)
Received: from localhost ([::1]:41478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWB4F-0008AF-33
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 01:58:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nWB0J-0005Z6-4y
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 01:54:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nWB0G-0005Bb-49
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 01:54:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647842088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HkMQAQ8T6z5WzUTESDeNpPPv90hX57QWcNX/vofuFgU=;
 b=ftAIetwRJWJpZnOnL+IXB35AWCUkyhDFxun4vzsxYVTh5QzVchhvpxwUARCy3jTSZFYafy
 2jzgQ6qf+MVlMKEjJT04S9+1mmsIGrYYiwbXHm7YLo0xb+NjILQGBF/lE2Zt06enMbgWnx
 OaapHtcReh9oM7hVK/iREWJYPfeHKxA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-cmREDvUyMpKCUe70-aLPhA-1; Mon, 21 Mar 2022 01:54:45 -0400
X-MC-Unique: cmREDvUyMpKCUe70-aLPhA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5A2D801585;
 Mon, 21 Mar 2022 05:54:44 +0000 (UTC)
Received: from localhost.localdomain (ovpn-14-31.pek2.redhat.com [10.72.14.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3EBD943248C;
 Mon, 21 Mar 2022 05:54:41 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	peterx@redhat.com
Subject: [PATCH V2 3/4] intel-iommu: convert VTD_PE_GET_FPD_ERR() to be a
 function
Date: Mon, 21 Mar 2022 13:54:28 +0800
Message-Id: <20220321055429.10260-4-jasowang@redhat.com>
In-Reply-To: <20220321055429.10260-1-jasowang@redhat.com>
References: <20220321055429.10260-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, yi.l.liu@intel.com,
 yi.y.sun@linux.intel.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We used to have a macro for VTD_PE_GET_FPD_ERR() but it has an
internal goto which prevents it from being reused. This patch convert
that macro to a dedicated function and let the caller to decide what
to do (e.g using goto or not). This makes sure it can be re-used for
other function that requires fault reporting.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/i386/intel_iommu.c | 42 ++++++++++++++++++++++++++++--------------
 1 file changed, 28 insertions(+), 14 deletions(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 5851a17d0e..82787f9850 100644
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
@@ -1724,6 +1713,19 @@ out:
     trace_vtd_pt_enable_fast_path(source_id, success);
 }
 
+static void vtd_qualify_report_fault(IntelIOMMUState *s,
+                                     int err, bool is_fpd_set,
+                                     uint16_t source_id,
+                                     hwaddr addr,
+                                     bool is_write)
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
@@ -1784,7 +1786,11 @@ static bool vtd_do_iommu_translate(VTDAddressSpace *vtd_as, PCIBus *bus,
         is_fpd_set = ce.lo & VTD_CONTEXT_ENTRY_FPD;
         if (!is_fpd_set && s->root_scalable) {
             ret_fr = vtd_ce_get_pasid_fpd(s, &ce, &is_fpd_set);
-            VTD_PE_GET_FPD_ERR(ret_fr, is_fpd_set, s, source_id, addr, is_write);
+            if (ret_fr) {
+                vtd_qualify_report_fault(s, -ret_fr, is_fpd_set,
+                                         source_id, addr, is_write);
+                goto error;
+            }
         }
     } else {
         ret_fr = vtd_dev_to_context_entry(s, bus_num, devfn, &ce);
@@ -1792,7 +1798,11 @@ static bool vtd_do_iommu_translate(VTDAddressSpace *vtd_as, PCIBus *bus,
         if (!ret_fr && !is_fpd_set && s->root_scalable) {
             ret_fr = vtd_ce_get_pasid_fpd(s, &ce, &is_fpd_set);
         }
-        VTD_PE_GET_FPD_ERR(ret_fr, is_fpd_set, s, source_id, addr, is_write);
+        if (ret_fr) {
+            vtd_qualify_report_fault(s, -ret_fr, is_fpd_set,
+                                     source_id, addr, is_write);
+            goto error;
+        }
         /* Update context-cache */
         trace_vtd_iotlb_cc_update(bus_num, devfn, ce.hi, ce.lo,
                                   cc_entry->context_cache_gen,
@@ -1828,7 +1838,11 @@ static bool vtd_do_iommu_translate(VTDAddressSpace *vtd_as, PCIBus *bus,
 
     ret_fr = vtd_iova_to_slpte(s, &ce, addr, is_write, &slpte, &level,
                                &reads, &writes, s->aw_bits);
-    VTD_PE_GET_FPD_ERR(ret_fr, is_fpd_set, s, source_id, addr, is_write);
+    if (ret_fr) {
+        vtd_qualify_report_fault(s, -ret_fr, is_fpd_set, source_id,
+                                 addr, is_write);
+        goto error;
+    }
 
     page_mask = vtd_slpt_level_page_mask(level);
     access_flags = IOMMU_ACCESS_FLAG(reads, writes);
-- 
2.25.1


