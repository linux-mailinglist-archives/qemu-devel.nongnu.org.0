Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7341653B3F
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 05:26:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8D8n-0007pf-UU; Wed, 21 Dec 2022 23:25:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ira.weiny@intel.com>)
 id 1p8D8j-0007oG-2O
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 23:25:06 -0500
Received: from mga03.intel.com ([134.134.136.65])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ira.weiny@intel.com>)
 id 1p8D8h-00015O-5r
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 23:25:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671683103; x=1703219103;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=Ka/aRsnXmQ7dCrsF+L+URsGC7uaO2uU2ffcMYWdbxuQ=;
 b=GSF+tjWE8t7fjrN4RuaDCmmPe4u67Wy0ui1p3Y6onueY6DfQ+yADEROQ
 ARnjwF+arCR1fnBVR5gvW77s+bWQeMCKecSZSqHp0VrVdF9iBr1iRgN8x
 IWNO8ZvRmBDbITre4a2X0izZU9mBhwD2ZpL+R2k43bi4oCbGmphAcN3Ag
 rdv9wvEk+TXJfnWQgCU2MelV+mR/Kg/qG4B4rQto88Vgg1tzFzTvtj+Hk
 M+5anUtH+V09J2da+ozW5fS0dR9NxiDqEP2MD2FOWQ3sByU0PBDD0cmlW
 32BXc2bP+ZuKv0DC056ZUCASGX57FEaY+4OOhsczFPxCfGdAI5VuJd0K3 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="321957598"
X-IronPort-AV: E=Sophos;i="5.96,264,1665471600"; d="scan'208";a="321957598"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 20:24:57 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="601733196"
X-IronPort-AV: E=Sophos;i="5.96,264,1665471600"; d="scan'208";a="601733196"
Received: from iweiny-mobl.amr.corp.intel.com (HELO localhost)
 ([10.212.20.211])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 20:24:56 -0800
From: Ira Weiny <ira.weiny@intel.com>
Date: Wed, 21 Dec 2022 20:24:33 -0800
Subject: [PATCH v2 3/8] hw/cxl/mailbox: Use new UUID network order define for
 cel_uuid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221221-ira-cxl-events-2022-11-17-v2-3-2ce2ecc06219@intel.com>
References: <20221221-ira-cxl-events-2022-11-17-v2-0-2ce2ecc06219@intel.com>
In-Reply-To: <20221221-ira-cxl-events-2022-11-17-v2-0-2ce2ecc06219@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Michael Tsirkin <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>
X-Mailer: b4 0.11.0-dev-141d4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1671683093; l=3634;
 i=ira.weiny@intel.com; s=20221211; h=from:subject:message-id;
 bh=Ka/aRsnXmQ7dCrsF+L+URsGC7uaO2uU2ffcMYWdbxuQ=;
 b=v1sW8DWicc1820I2mSk+v4TqYL/w1ukeAaC82Yk4A/sCJ5D+6nLJ8soRE7vvHqoOGJxFbOOBgxcz
 HURse14cB7EXA1zKfqFrZ3LYtd3FkW95yreN/fMG4XcVYlUCFPtB
X-Developer-Key: i=ira.weiny@intel.com; a=ed25519;
 pk=noldbkG+Wp1qXRrrkfY1QJpDf7QsOEthbOT7vm0PqsE=
Received-SPF: pass client-ip=134.134.136.65; envelope-from=ira.weiny@intel.com;
 helo=mga03.intel.com
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

The cel_uuid was programatically generated previously because there was
no static initializer for network order UUIDs.

Use the new network order initializer for cel_uuid.  Adjust
cxl_initialize_mailbox() because it can't fail now.

Update specification reference.

Signed-off-by: Ira Weiny <ira.weiny@intel.com>

---
Changes from RFC:
	New patch.
---
 hw/cxl/cxl-device-utils.c   |  4 ++--
 hw/cxl/cxl-mailbox-utils.c  | 14 +++++++-------
 include/hw/cxl/cxl_device.h |  2 +-
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/hw/cxl/cxl-device-utils.c b/hw/cxl/cxl-device-utils.c
index 21845dbfd050..34697064714e 100644
--- a/hw/cxl/cxl-device-utils.c
+++ b/hw/cxl/cxl-device-utils.c
@@ -267,7 +267,7 @@ void cxl_device_register_init_common(CXLDeviceState *cxl_dstate)
     cxl_device_cap_init(cxl_dstate, MEMORY_DEVICE, 0x4000);
     memdev_reg_init_common(cxl_dstate);
 
-    assert(cxl_initialize_mailbox(cxl_dstate, false) == 0);
+    cxl_initialize_mailbox(cxl_dstate, false);
 }
 
 void cxl_device_register_init_swcci(CXLDeviceState *cxl_dstate)
@@ -289,5 +289,5 @@ void cxl_device_register_init_swcci(CXLDeviceState *cxl_dstate)
     cxl_device_cap_init(cxl_dstate, MEMORY_DEVICE, 0x4000);
     memdev_reg_init_common(cxl_dstate);
 
-    assert(cxl_initialize_mailbox(cxl_dstate, true) == 0);
+    cxl_initialize_mailbox(cxl_dstate, true);
 }
diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
index c1183614b9a4..157c01255ee3 100644
--- a/hw/cxl/cxl-mailbox-utils.c
+++ b/hw/cxl/cxl-mailbox-utils.c
@@ -321,7 +321,11 @@ static ret_code cmd_timestamp_set(struct cxl_cmd *cmd,
     return CXL_MBOX_SUCCESS;
 }
 
-static QemuUUID cel_uuid;
+/* CXL 3.0 8.2.9.5.2.1 Command Effects Log (CEL) */
+static QemuUUID cel_uuid = {
+        .data = UUID(0x0da9c0b5, 0xbf41, 0x4b78, 0x8f, 0x79,
+                     0x96, 0xb1, 0x62, 0x3b, 0x3f, 0x17)
+};
 
 /* 8.2.9.4.1 */
 static ret_code cmd_logs_get_supported(struct cxl_cmd *cmd,
@@ -684,16 +688,14 @@ void cxl_process_mailbox(CXLDeviceState *cxl_dstate)
                      DOORBELL, 0);
 }
 
-int cxl_initialize_mailbox(CXLDeviceState *cxl_dstate, bool switch_cci)
+void cxl_initialize_mailbox(CXLDeviceState *cxl_dstate, bool switch_cci)
 {
-    /* CXL 2.0: Table 169 Get Supported Logs Log Entry */
-    const char *cel_uuidstr = "0da9c0b5-bf41-4b78-8f79-96b1623b3f17";
-
     if (!switch_cci) {
         cxl_dstate->cxl_cmd_set = cxl_cmd_set;
     } else {
         cxl_dstate->cxl_cmd_set = cxl_cmd_set_sw;
     }
+
     for (int set = 0; set < 256; set++) {
         for (int cmd = 0; cmd < 256; cmd++) {
             if (cxl_dstate->cxl_cmd_set[set][cmd].handler) {
@@ -707,6 +709,4 @@ int cxl_initialize_mailbox(CXLDeviceState *cxl_dstate, bool switch_cci)
             }
         }
     }
-
-    return qemu_uuid_parse(cel_uuidstr, &cel_uuid);
 }
diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
index 1b366b739c62..3be2e37b3e4c 100644
--- a/include/hw/cxl/cxl_device.h
+++ b/include/hw/cxl/cxl_device.h
@@ -238,7 +238,7 @@ CXL_DEVICE_CAPABILITY_HEADER_REGISTER(MEMORY_DEVICE,
                                       CXL_DEVICE_CAP_HDR1_OFFSET +
                                           CXL_DEVICE_CAP_REG_SIZE * 2)
 
-int cxl_initialize_mailbox(CXLDeviceState *cxl_dstate, bool switch_cci);
+void cxl_initialize_mailbox(CXLDeviceState *cxl_dstate, bool switch_cci);
 void cxl_process_mailbox(CXLDeviceState *cxl_dstate);
 
 #define cxl_device_cap_init(dstate, reg, cap_id)                           \

-- 
2.38.1

