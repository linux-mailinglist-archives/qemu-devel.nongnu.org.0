Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9A16B1FEB
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 10:25:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paCVd-000593-W6; Thu, 09 Mar 2023 04:24:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1paCVZ-00058X-MU
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 04:24:21 -0500
Received: from mga18.intel.com ([134.134.136.126])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1paCVW-00034k-5n
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 04:24:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678353858; x=1709889858;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Tifvssd5ahm/JIBpNwm6Bcw0DL6kcnDchi5A0Pl8IJg=;
 b=lJ5bTYwYvtxmP4ogAk6cDuVPIoYvXrxbZI/0+TLS5OVjmI9F9JznHJGU
 tlrZMWwbLXMeAMW4CGJ6UUeHZmVqYPiGu5eSy8CQHHe/pyCAbWYSlZ/NB
 sCX06qJEbNTqqdKNkAndb7PoPGiPSVSlrZqOHVuIcKW3dSO4WX18wk7XV
 rqbHJr5CXZYutki3Wz8J25b31ZZRe0JvoK9zmTjVQN9G19keeH+KAMsbe
 kJE0A2DOkhXXJ1W7fp3vEhqZVL8iWNwPvLZQvU6KJnV2ryqJ/e9hdDq0+
 BSFIHTsvauLkLdtArChZPw97CH/S3Kg2c4LFo9j5CJ9qjlm/LR4ZpC38x w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="320227794"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; d="scan'208";a="320227794"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 01:24:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="670666451"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; d="scan'208";a="670666451"
Received: from spr-s2600bt.bj.intel.com ([10.240.192.124])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 01:24:12 -0800
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, peterx@redhat.com, jasowang@redhat.com,
 pbonzini@redhat.com, richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com
Subject: [PATCH] intel-iommu: Set status bit after operation completed
Date: Thu,  9 Mar 2023 17:23:19 +0800
Message-Id: <20230309092319.29229-1-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=zhenzhong.duan@intel.com; helo=mga18.intel.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

According to SDM 11.4.4.2 Global Status Register:
"This field is cleared by hardware when software sets the SRTP field in the
Global Command register. This field is set by hardware when hardware
completes the ‘Set Root Table Pointer’ operation using the value provided
in the Root Table Address register"

Follow above spec to clear then set RTPS after finish all works, this way
helps avoiding potential race with guest kernel. Though linux kernel is
single threaded in writing GCMD_REG and checking GSTS_REG.

Same reasion for GSTS_REG.TES

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 hw/i386/intel_iommu.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index faade7def8..7cba1945a3 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -2312,11 +2312,12 @@ static void vtd_handle_gcmd_qie(IntelIOMMUState *s, bool en)
 /* Set Root Table Pointer */
 static void vtd_handle_gcmd_srtp(IntelIOMMUState *s)
 {
+    vtd_set_clear_mask_long(s, DMAR_GSTS_REG, VTD_GSTS_RTPS, 0);
     vtd_root_table_setup(s);
-    /* Ok - report back to driver */
-    vtd_set_clear_mask_long(s, DMAR_GSTS_REG, 0, VTD_GSTS_RTPS);
     vtd_reset_caches(s);
     vtd_address_space_refresh_all(s);
+    /* Ok - report back to driver */
+    vtd_set_clear_mask_long(s, DMAR_GSTS_REG, 0, VTD_GSTS_RTPS);
 }
 
 /* Set Interrupt Remap Table Pointer */
@@ -2338,19 +2339,22 @@ static void vtd_handle_gcmd_te(IntelIOMMUState *s, bool en)
 
     if (en) {
         s->dmar_enabled = true;
-        /* Ok - report back to driver */
-        vtd_set_clear_mask_long(s, DMAR_GSTS_REG, 0, VTD_GSTS_TES);
     } else {
         s->dmar_enabled = false;
 
         /* Clear the index of Fault Recording Register */
         s->next_frcd_reg = 0;
-        /* Ok - report back to driver */
-        vtd_set_clear_mask_long(s, DMAR_GSTS_REG, VTD_GSTS_TES, 0);
     }
 
     vtd_reset_caches(s);
     vtd_address_space_refresh_all(s);
+
+    /* Ok - report back to driver */
+    if (en) {
+        vtd_set_clear_mask_long(s, DMAR_GSTS_REG, 0, VTD_GSTS_TES);
+    } else {
+        vtd_set_clear_mask_long(s, DMAR_GSTS_REG, VTD_GSTS_TES, 0);
+    }
 }
 
 /* Handle Interrupt Remap Enable/Disable */
-- 
2.25.1


