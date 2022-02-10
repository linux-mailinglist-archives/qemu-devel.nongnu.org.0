Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2074B0983
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 10:32:27 +0100 (CET)
Received: from localhost ([::1]:44980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI5oO-0006Ky-7A
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 04:32:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nI5lB-0004zM-Dz
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 04:29:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nI5l7-0000fw-GP
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 04:29:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644485339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mZMIKxbvNlsLehUcHzqSzz/f66FVRhvK7vTyoxDc7kA=;
 b=fmj3eljhctsXomOSzane08qbQ27Qi8hbXbqICmv1udSlIfxVwGlhun/l0o/I/nH+9fZmaD
 kRRiR2iKnuQbox04SnPF230p2Oj6YavNnt+KK6CFHHOlHJ0yVb6am0VWklqnZG9M/xy6W0
 mAlL27OPwNY657J+OwcIUP3UdodFroA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-50-cHe39-DIPIuD-NpVx81VLg-1; Thu, 10 Feb 2022 04:28:55 -0500
X-MC-Unique: cHe39-DIPIuD-NpVx81VLg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F36855F9CA
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 09:28:54 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-134.pek2.redhat.com
 [10.72.12.134])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B356A54554;
 Thu, 10 Feb 2022 09:28:20 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	peterx@redhat.com
Subject: [PATCH 1/2] intel-iommu: remove VTD_FR_RESERVED_ERR
Date: Thu, 10 Feb 2022 17:28:14 +0800
Message-Id: <20220210092815.45174-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This fault reason is not used and is duplicated with SPT.2 condition
code. So let's remove it.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/i386/intel_iommu.c          | 6 ------
 hw/i386/intel_iommu_internal.h | 5 -----
 2 files changed, 11 deletions(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 5b865ac08c..55281ee1b4 100644
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
@@ -1629,7 +1624,6 @@ static const bool vtd_qualified_faults[] = {
     [VTD_FR_PAGING_ENTRY_RSVD] = true,
     [VTD_FR_CONTEXT_ENTRY_TT] = true,
     [VTD_FR_PASID_TABLE_INV] = false,
-    [VTD_FR_RESERVED_ERR] = false,
     [VTD_FR_MAX] = false,
 };
 
diff --git a/hw/i386/intel_iommu_internal.h b/hw/i386/intel_iommu_internal.h
index a6c788049b..d0bb43ae87 100644
--- a/hw/i386/intel_iommu_internal.h
+++ b/hw/i386/intel_iommu_internal.h
@@ -303,11 +303,6 @@ typedef enum VTDFaultReason {
 
     VTD_FR_PASID_TABLE_INV = 0x58,  /*Invalid PASID table entry */
 
-    /* This is not a normal fault reason. We use this to indicate some faults
-     * that are not referenced by the VT-d specification.
-     * Fault event with such reason should not be recorded.
-     */
-    VTD_FR_RESERVED_ERR,
     VTD_FR_MAX,                 /* Guard */
 } VTDFaultReason;
 
-- 
2.25.1


