Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E5464C166
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 01:36:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Fk7-0006AL-7c; Tue, 13 Dec 2022 19:35:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ira.weiny@intel.com>)
 id 1p5Fk4-0006A1-75
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 19:35:24 -0500
Received: from mga17.intel.com ([192.55.52.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ira.weiny@intel.com>)
 id 1p5Fjz-0006Eu-D0
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 19:35:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670978119; x=1702514119;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=1xuOfqweshP0ycJZMrJBaoNwtn5tIBCn5UAUVEELhn4=;
 b=Ba41sgrvipLBCKCd/ClQjpqdSmg+Jzz/YZDpQbH6x9RytV3Uq+nRHuer
 YihQd0eu7OFiwOz1fMUUTmMd+mLJi0m1PHvhgNRkG5kelz7qJLPH3Cf9g
 hzDH7dtWgEWqqmtoHI6VINVMM8ovGc2NSjgZ1NysUIF6GNp7U1WWdYEFE
 g0SMrkF3Yy0e7XONrfcR6AI1E9N4GunLxZ1A1F/nXmvfW7vtniOFR6Fbj
 YxcX1NOvYWLuWJ1R/oTHrJbtL5lo7QgH3Qkd2HgSGcnPaeqnvMV3GMRyp
 9cIeZB9j4Z0gcflCpi4cbaHx2AgL0nOEl1mKTKANyABteFeFvrmwyUhP9 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10560"; a="298621979"
X-IronPort-AV: E=Sophos;i="5.96,242,1665471600"; d="scan'208";a="298621979"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2022 16:34:56 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10560"; a="681341620"
X-IronPort-AV: E=Sophos;i="5.96,242,1665471600"; d="scan'208";a="681341620"
Received: from iweiny-mobl.amr.corp.intel.com (HELO localhost)
 ([10.209.105.179])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2022 16:34:55 -0800
From: Ira Weiny <ira.weiny@intel.com>
Date: Tue, 13 Dec 2022 16:34:52 -0800
Subject: [PATCH] hw/cxl/device: Add Flex Bus Port DVSEC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221213-ira-flexbus-port-v1-1-86afd4f30be6@intel.com>
X-B4-Tracking: v=1; b=H4sIACwamWMC/x2NSwrCUAwAr1KyNmAiingVcfE+qQ08XktipVB6d
 4PLGRhmBxdTcXgMO5h81XXuAXQaoEypvwW1BgOfmYnpgmoJxyZbXh2X2T5Y5Mq3KnciqhBZTi6Y
 LfUyRdjX1kIuJqNu/8/zdRw/DRAiQncAAAA=
To: Ira Weiny <ira.weiny@intel.com>
Cc: Dave Jiang <dave.jiang@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Ben Widawsky <bwidawsk@kernel.org>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org
X-Mailer: b4 0.11.0-dev-141d4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1670978094; l=1847;
 i=ira.weiny@intel.com; s=20221211; h=from:subject:message-id;
 bh=1xuOfqweshP0ycJZMrJBaoNwtn5tIBCn5UAUVEELhn4=;
 b=/yW7hsV8Rrx7qOHpbWHWXJSZXyVPBJSPJlcu/GTQO4jlwdlHi1Xg8OP7sjmP6Uk2amraw62UV146
 iuB1M73LDFCDPqyXBlLRTpppv9mBAysw07QbL+QInnTYmxw7eE5K
X-Developer-Key: i=ira.weiny@intel.com; a=ed25519;
 pk=noldbkG+Wp1qXRrrkfY1QJpDf7QsOEthbOT7vm0PqsE=
Received-SPF: pass client-ip=192.55.52.151; envelope-from=ira.weiny@intel.com;
 helo=mga17.intel.com
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
 hw/mem/cxl_type3.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
index 0317bd96a6fb..27f6ac0cb3c1 100644
--- a/hw/mem/cxl_type3.c
+++ b/hw/mem/cxl_type3.c
@@ -416,6 +416,17 @@ static void build_dvsecs(CXLType3Dev *ct3d)
     cxl_component_create_dvsec(cxl_cstate, CXL2_TYPE3_DEVICE,
                                GPF_DEVICE_DVSEC_LENGTH, GPF_DEVICE_DVSEC,
                                GPF_DEVICE_DVSEC_REVID, dvsec);
+
+    dvsec = (uint8_t *)&(CXLDVSECPortFlexBus){
+        .cap                     = 0x27, /* Cache, IO, Mem, non-MLD */
+        .ctrl                    = 0x02, /* IO always enabled */
+        .status                  = 0x27, /* same as capabilities */
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

