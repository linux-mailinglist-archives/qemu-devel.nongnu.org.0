Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D84A610A1D
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 08:15:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooIdp-000643-U8; Fri, 28 Oct 2022 02:14:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ooIdn-00061m-OQ
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 02:14:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ooIdm-00087i-7Y
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 02:14:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666937689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AxQwfnyghcxquusGG8D82FCXQQxD8PTXvMbtMN8BvO4=;
 b=B7rrBpTIN/qAcGRNLYNs4EZCrPoGkijquuQ5Ajv7fGmgEMi2t0ZpGLKlaVPMJQggOedtLZ
 Yb9RQU3Ya/2HmB28g3xrrpemoqKrAuS0IDquAD8qOxnGMRXyjSpmShFJIkeyZid2cgKY5e
 fVgAhluO0vWAqNiVxX2DQCxmcsYN33Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-294-sjgFd-LoOmSqLfelP5st6A-1; Fri, 28 Oct 2022 02:14:46 -0400
X-MC-Unique: sjgFd-LoOmSqLfelP5st6A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13C952A59557;
 Fri, 28 Oct 2022 06:14:46 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-50.pek2.redhat.com [10.72.13.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C5C3B4221F;
 Fri, 28 Oct 2022 06:14:42 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	peterx@redhat.com
Cc: qemu-devel@nongnu.org, yi.y.sun@linux.intel.com, eperezma@redhat.com,
 lulu@redhat.com, Jason Wang <jasowang@redhat.com>
Subject: [PATCH V5 1/4] intel-iommu: don't warn guest errors when getting
 rid2pasid entry
Date: Fri, 28 Oct 2022 14:14:33 +0800
Message-Id: <20221028061436.30093-2-jasowang@redhat.com>
In-Reply-To: <20221028061436.30093-1-jasowang@redhat.com>
References: <20221028061436.30093-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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

We use to warn on wrong rid2pasid entry. But this error could be
triggered by the guest and could happens during initialization. So
let's don't warn in this case.

Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
Changes since v4:
- Tweak the code to avoid using ret variable
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
2.25.1


