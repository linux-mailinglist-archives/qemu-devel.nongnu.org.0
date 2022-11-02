Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B217616843
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:18:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGMJ-0005n7-Rn; Wed, 02 Nov 2022 12:12:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGLu-0004Eu-7b
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:12:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGLr-0004PK-VI
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:12:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3HLl4tNY2+/lq1uK3hyu+teGqpzhceB9L+dLDgAZow8=;
 b=FvaSyGK4IuCePD23BVMmtaHA5Rk3JPdLXgSZXhRAduD+n4bAL1TAVIDYow7Y8XEqIXqhlP
 Rq0hOQcGx0BjGjq7vzEx3cHM+EyuBNjU4R+c34ChYC0xImu1WtwVS+jcNfAke7LCOs5ZXv
 l8OsuMglTBCY+gIuptK1TpGevEbVVdM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-642-6Quo9Is5NbeKOh3YBocJZw-1; Wed, 02 Nov 2022 12:12:22 -0400
X-MC-Unique: 6Quo9Is5NbeKOh3YBocJZw-1
Received: by mail-wr1-f69.google.com with SMTP id
 t12-20020adfa2cc000000b0022adcbb248bso4990778wra.1
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:12:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3HLl4tNY2+/lq1uK3hyu+teGqpzhceB9L+dLDgAZow8=;
 b=PNySVE0ghAN0PxBJtpey895AbQSH9bLOO4XUIq1L7UM1gLRkqdGcR3D3S07HeIJ1QY
 R2WujKkT2hMuxcuaMfyix/vjJPloNzIE9hEULqxLBcxPnWJxZ74sB4xFIrLWQRGsQhng
 o5Ug2JyShOl1Ya8fGnA9vwbrE3a4V8ivxLYl15gwtfpillVvmhdmIXTXgH3egrJU3D1I
 GKlzR4it4J1NXs5RCtADCXsu62FF8WeLly8hPOBhiCjkq2VuvpDxt55HiWTgNoa6NZh0
 gM+TxkFQYxjZg6DbC+xGk9uc/oHdXzvKtZ1Q4qG7YnpbRCYsbcfXpUMFlJFFcmVUkQ+5
 gzYw==
X-Gm-Message-State: ACrzQf38nRgTdp++JvqICoGyQwxeih+fulQJ1tq6/EfdYJGKQOUh1wHW
 DBPCI1GgiroFl+YeixiNcsNzugip9+Kf9iMoFeB5ndqDWFcb9N+dQENZQbA8iWGqRBoYhPL+dQL
 H+eK89DYKjiJfRvtRJVt+z77RsGMD4asHCIWOoxcoZ7qKu/8kamu68tD9+FHx
X-Received: by 2002:adf:f7d2:0:b0:236:87bc:a8f7 with SMTP id
 a18-20020adff7d2000000b0023687bca8f7mr15722642wrq.579.1667405540891; 
 Wed, 02 Nov 2022 09:12:20 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM69m3cWv4Hxqo6wCM81hxBiIFcneco8dAyeJjxDe2M0HLRYoZ0wA88v/yec4zAERQ/tJlWhNw==
X-Received: by 2002:adf:f7d2:0:b0:236:87bc:a8f7 with SMTP id
 a18-20020adff7d2000000b0023687bca8f7mr15722603wrq.579.1667405540578; 
 Wed, 02 Nov 2022 09:12:20 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 p17-20020a05600c469100b003cf6a55d8e8sm2805167wmo.7.2022.11.02.09.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:12:20 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:12:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Peter Xu <peterx@redhat.com>,
 Yi Liu <yi.l.liu@intel.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL v2 81/82] intel-iommu: convert VTD_PE_GET_FPD_ERR() to be a
 function
Message-ID: <20221102160336.616599-82-mst@redhat.com>
References: <20221102160336.616599-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102160336.616599-1-mst@redhat.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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


