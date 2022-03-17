Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B78744DC0A6
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 09:08:52 +0100 (CET)
Received: from localhost ([::1]:46488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUlBj-0005CP-Hr
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 04:08:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nUl8f-0002lm-Ct
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 04:05:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nUl8c-0002fD-72
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 04:05:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647504335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZzccmnBqtyI1ThoiqZK+SAEEFF1jiy5R1OzKwqEmy1Q=;
 b=Lyf71O81yTK4k0nU1T1fE06W7Cvhu6F0z9RQJi6MS8+KNcsp394RHckl/IDgGt8VHij3Sn
 npbniRCp9r4lsyON3+qieYnS21wflSqQH01o9HRSCHvg6iSef2VevB66M4HSLe5cvTsguV
 bfFkUipysln7PeZ9WlQgtdFKUeS49j8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-382-xg2XzHGjNwiKnq01eF0t_g-1; Thu, 17 Mar 2022 04:05:33 -0400
X-MC-Unique: xg2XzHGjNwiKnq01eF0t_g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C5F6802C16
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 08:05:33 +0000 (UTC)
Received: from localhost.localdomain (ovpn-14-11.pek2.redhat.com [10.72.14.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 91E0FC23DC3;
 Thu, 17 Mar 2022 08:05:31 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	peterx@redhat.com
Subject: [PATCH 1/2] intel-iommu: update root_scalable before switching as
 during post_load
Date: Thu, 17 Mar 2022 16:05:21 +0800
Message-Id: <20220317080522.14621-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We need check whether passthrough is enabled during
vtd_switch_address_space() by checking the context entries. This
requires the root_scalable to be set correctly otherwise we may try to
check legacy rsvd bits instead of scalable ones.

Fixing this by updating root_scalable before switching the address
spaces during post_load.

Fixes: fb43cf739e ("intel_iommu: scalable mode emulation")
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/i386/intel_iommu.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 32471a44cb..a13cfecfce 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -3052,13 +3052,6 @@ static int vtd_post_load(void *opaque, int version_id)
 {
     IntelIOMMUState *iommu = opaque;
 
-    /*
-     * Memory regions are dynamically turned on/off depending on
-     * context entry configurations from the guest. After migration,
-     * we need to make sure the memory regions are still correct.
-     */
-    vtd_switch_address_space_all(iommu);
-
     /*
      * We don't need to migrate the root_scalable because we can
      * simply do the calculation after the loading is complete.  We
@@ -3068,6 +3061,13 @@ static int vtd_post_load(void *opaque, int version_id)
      */
     vtd_update_scalable_state(iommu);
 
+    /*
+     * Memory regions are dynamically turned on/off depending on
+     * context entry configurations from the guest. After migration,
+     * we need to make sure the memory regions are still correct.
+     */
+    vtd_switch_address_space_all(iommu);
+
     return 0;
 }
 
-- 
2.25.1


