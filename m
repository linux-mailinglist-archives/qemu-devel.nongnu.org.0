Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C20D64D185
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 21:55:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Ylq-0007YP-3E; Wed, 14 Dec 2022 15:54:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ira.weiny@intel.com>)
 id 1p5Ylm-0007YH-Kj
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 15:54:26 -0500
Received: from mga04.intel.com ([192.55.52.120])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ira.weiny@intel.com>)
 id 1p5Yli-00037J-RS
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 15:54:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671051262; x=1702587262;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=mjGK07+sSzfJoPQKszWPOFrvFHEnWxC/xVIdOYLYUWA=;
 b=aLa54YRGEIdm/3MqqIxGIOP+Ix8Li5qw993i5G8XehXb//KLAuFHl0y0
 KYJNk/U2WlwVKtH7Hfj2RzRTwcCNjxtSLTuytQ0RWqTdvX7naFAjvIIPq
 wiFhlbi3bgEP3J2Qfke5Yd3p5CrEvxyd7ngMG1so8SVlT2mMnUs8REoTd
 eYWL9GJP766yfio8c54Iz27w2uEjGyDIode0c5WtQrowcBQxFK8q71TND
 LCsxOsunwt/MMJLcj4WrVPgsDZ57vvdcIvz5Kb0XJJ5Vxy5bfPXkI/qwd
 eEymaKSmwhFkYQdMKVR+jjChjuqdv9qwb5P7Z2b3m+Qb9DRnTyKAPpNKI w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="317220245"
X-IronPort-AV: E=Sophos;i="5.96,245,1665471600"; d="scan'208";a="317220245"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2022 12:54:18 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="773463121"
X-IronPort-AV: E=Sophos;i="5.96,245,1665471600"; d="scan'208";a="773463121"
Received: from iweiny-mobl.amr.corp.intel.com (HELO localhost)
 ([10.209.87.120])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2022 12:54:18 -0800
From: Ira Weiny <ira.weiny@intel.com>
Date: Wed, 14 Dec 2022 12:54:11 -0800
Subject: [PATCH v2] hw/cxl/device: Add Flex Bus Port DVSEC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221213-ira-flexbus-port-v2-1-eaa48d0e0700@intel.com>
X-B4-Tracking: v=1; b=H4sIAPM3mmMC/32NSwqDMBQAryJZ9xVfbEW66j3ERT4v9UGaSKJiE
 e/e1AN0OQPD7CJTYsriUe0i0cqZYyggL5UwowovAraFhaylRIkNcFLgPG16yTDFNIOhu2wtdYho
 Rcm0ygQ6qWDGEobF+yKnRI6389MPhUfOc0yfc7viz/45rAgIXaucvbmm1tQ+Oczkrya+xXAcxxe
 E2n+5xQAAAA==
To: Ira Weiny <ira.weiny@intel.com>
Cc: Dave Jiang <dave.jiang@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Ben Widawsky <bwidawsk@kernel.org>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org
X-Mailer: b4 0.11.0-dev-141d4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1671051257; l=2197;
 i=ira.weiny@intel.com; s=20221211; h=from:subject:message-id;
 bh=mjGK07+sSzfJoPQKszWPOFrvFHEnWxC/xVIdOYLYUWA=;
 b=AcgVs4IfdIYYMqd+htoRC/7UTrT67+vLPVT5C8skB4e2QPJmeBQPLycEnz5x7Hs65wcI/htaP9k8
 Osu4qCtJDbuBzYQXLn+xYDGke6Ov9DuOlYGLE7Wuc1Gh6Z6B8iM+
X-Developer-Key: i=ira.weiny@intel.com; a=ed25519;
 pk=noldbkG+Wp1qXRrrkfY1QJpDf7QsOEthbOT7vm0PqsE=
Received-SPF: pass client-ip=192.55.52.120; envelope-from=ira.weiny@intel.com;
 helo=mga04.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

The Flex Bus Port DVSEC was missing on type 3 devices which was blocking
RAS checks.[1]

Add the Flex Bus Port DVSEC to type 3 devices as per CXL 3.0 8.2.1.3.

[1] https://lore.kernel.org/linux-cxl/167096738875.2861540.11815053323626849940.stgit@djiang5-desk3.ch.intel.com/

Cc: Dave Jiang <dave.jiang@intel.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Ben Widawsky <bwidawsk@kernel.org>
Cc: qemu-devel@nongnu.org
Cc: linux-cxl@vger.kernel.org
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
Changes in v2:
        Jonathan                                                            
                type 3 device does not support CACHE                        
                Comment the 68B bit                                         

- Link to v1: https://lore.kernel.org/r/20221213-ira-flexbus-port-v1-1-86afd4f30be6@intel.com
---
 hw/mem/cxl_type3.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
index 0317bd96a6fb..e6beac143fc1 100644
--- a/hw/mem/cxl_type3.c
+++ b/hw/mem/cxl_type3.c
@@ -416,6 +416,17 @@ static void build_dvsecs(CXLType3Dev *ct3d)
     cxl_component_create_dvsec(cxl_cstate, CXL2_TYPE3_DEVICE,
                                GPF_DEVICE_DVSEC_LENGTH, GPF_DEVICE_DVSEC,
                                GPF_DEVICE_DVSEC_REVID, dvsec);
+
+    dvsec = (uint8_t *)&(CXLDVSECPortFlexBus){
+        .cap                     = 0x26, /* 68B, IO, Mem, non-MLD */
+        .ctrl                    = 0x02, /* IO always enabled */
+        .status                  = 0x26, /* same as capabilities */
+        .rcvd_mod_ts_data_phase1 = 0xef, /* WTF? */
+    };
+    cxl_component_create_dvsec(cxl_cstate, CXL2_TYPE3_DEVICE,
+                               PCIE_FLEXBUS_PORT_DVSEC_LENGTH_2_0,
+                               PCIE_FLEXBUS_PORT_DVSEC,
+                               PCIE_FLEXBUS_PORT_DVSEC_REVID_2_0, dvsec);
 }
 
 static void hdm_decoder_commit(CXLType3Dev *ct3d, int which)

---
base-commit: e11b57108b0cb746bb9f3887054f34a2f818ed79
change-id: 20221213-ira-flexbus-port-ce526de8111d

Best regards,
-- 
Ira Weiny <ira.weiny@intel.com>

