Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBBF5292F9
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 23:37:53 +0200 (CEST)
Received: from localhost ([::1]:57526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqiPY-0000B4-JN
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 17:37:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhjC-0000bi-Pu
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:54:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhj6-0006gQ-Pv
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:54:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O8wI52pqlMCFB1khh+cTnO6p9uc6A9BWzkp+MixRkFA=;
 b=DExeScS47DeHytUdoO0OMCKHcmzeSbwEnBFcXDVznzkd3no/QM+PP9vSHApr5biYe9XG0X
 45iKU/j2DBm3GKgRNs2fAeiqLdja620PT63hZgQXU/kTQjrIXcZ19FRQmDouluZhuejHX0
 57yZsDEd4SsnJrVJjU1K2XYSijTMJnk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-kz3VcfqUOC2ZKpGNxe7l2Q-1; Mon, 16 May 2022 16:53:54 -0400
X-MC-Unique: kz3VcfqUOC2ZKpGNxe7l2Q-1
Received: by mail-ej1-f69.google.com with SMTP id
 re25-20020a170906d8d900b006f50701fbefso6352777ejb.23
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:53:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=O8wI52pqlMCFB1khh+cTnO6p9uc6A9BWzkp+MixRkFA=;
 b=5moepgoLZ63Whm1zJ+0QU0uha11fygIN14loPsg1zE/jhjb3GZ/gbRKr35xpe9p+lj
 H9yj1mDnJ9zyqs3ONo75SNLvITHEI1ASQNGiW46CYkMxgCKuZf8eEv6rd8OXEdkCDo12
 yJPfaZ5rmkGWx4JcoI/16L5NFZkaxrd4LyGCN2poRdFGfgWqdI7z0PV3rv0TAvM52XAf
 Vy3IIr1Jv2ahtcBJYRE/OLNfPfZDEqr9EnYnJ5RWapBMvC4n65KPKYsr5cPUxBTQtYtH
 USRxW3TSQf9VsTfioG1Cx8G5z9l0SK8TIBt32xwZfdfWCilP6DqnLdzNEjP7waWrH1b4
 JyEw==
X-Gm-Message-State: AOAM53239kroJWZlDfLRCA0ZMUnzMutrOpVhmzpL1pl5OmMZiv7n7iiY
 jLN13dcT2TxEzd0YtRmIneKhbnU/oeWa64Hm5JgExyQq3BSwJAH09pe0wk1hRCRIBFV+JzIRgN1
 OEMHk+GHVpoauYrMN1zow3oIy7lLPaIupvqhHOFB/Qbyxf5rXZkApuyJrkYnv
X-Received: by 2002:a17:907:6e1d:b0:6f4:60e6:9fa6 with SMTP id
 sd29-20020a1709076e1d00b006f460e69fa6mr17220155ejc.184.1652734432608; 
 Mon, 16 May 2022 13:53:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdZvyfrWpZroal52ZkVnhjpFBygrIk7RFcD9ooDmu3t3kuoqxPxTIMWSNHgUYV/DOVEmW4RA==
X-Received: by 2002:a17:907:6e1d:b0:6f4:60e6:9fa6 with SMTP id
 sd29-20020a1709076e1d00b006f460e69fa6mr17220123ejc.184.1652734432249; 
 Mon, 16 May 2022 13:53:52 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 h8-20020a170906530800b006f3ef214e43sm161373ejo.169.2022.05.16.13.53.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:53:51 -0700 (PDT)
Date: Mon, 16 May 2022 16:53:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Peter Xu <peterx@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL v2 53/86] intel-iommu: remove VTD_FR_RESERVED_ERR
Message-ID: <20220516204913.542894-54-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

This fault reason is not used and is duplicated with SPT.2 condition
code. So let's remove it.

Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20220210092815.45174-1-jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
---
 hw/i386/intel_iommu_internal.h | 5 -----
 hw/i386/intel_iommu.c          | 6 ------
 2 files changed, 11 deletions(-)

diff --git a/hw/i386/intel_iommu_internal.h b/hw/i386/intel_iommu_internal.h
index 1ff13b40f9..b6a2da8e83 100644
--- a/hw/i386/intel_iommu_internal.h
+++ b/hw/i386/intel_iommu_internal.h
@@ -304,11 +304,6 @@ typedef enum VTDFaultReason {
 
     VTD_FR_PASID_TABLE_INV = 0x58,  /*Invalid PASID table entry */
 
-    /* This is not a normal fault reason. We use this to indicate some faults
-     * that are not referenced by the VT-d specification.
-     * Fault event with such reason should not be recorded.
-     */
-    VTD_FR_RESERVED_ERR,
     VTD_FR_MAX,                 /* Guard */
 } VTDFaultReason;
 
diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index d310532108..8af2e39151 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -469,11 +469,6 @@ static void vtd_report_dmar_fault(IntelIOMMUState *s, uint16_t source_id,
 
     assert(fault < VTD_FR_MAX);
 
-    if (fault == VTD_FR_RESERVED_ERR) {
-        /* This is not a normal fault reason case. Drop it. */
-        return;
-    }
-
     trace_vtd_dmar_fault(source_id, fault, addr, is_write);
 
     if (fsts_reg & VTD_FSTS_PFO) {
@@ -1637,7 +1632,6 @@ static const bool vtd_qualified_faults[] = {
     [VTD_FR_PAGING_ENTRY_RSVD] = true,
     [VTD_FR_CONTEXT_ENTRY_TT] = true,
     [VTD_FR_PASID_TABLE_INV] = false,
-    [VTD_FR_RESERVED_ERR] = false,
     [VTD_FR_MAX] = false,
 };
 
-- 
MST


