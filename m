Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 849FC4C64C3
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 09:21:37 +0100 (CET)
Received: from localhost ([::1]:54566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nObHk-0000be-9h
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 03:21:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nOb26-0008IO-Mo
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 03:05:32 -0500
Received: from mga14.intel.com ([192.55.52.115]:50059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nOb22-0005a2-25
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 03:05:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646035522; x=1677571522;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DTJ+vMaBzHwM/ZCQY9fZMzXsYDGvbaLyZANyo1b35/0=;
 b=kJjnNpBB69k4d7QMOS6sl/d8qkO5Laxgy7LN1VZHT/q2kO8iJHf62lAM
 kSvMH1nzwh0XS0tBE37bPZSU9qHryvi52sRhkdYPXFUsYHZXQR6V+Ph0w
 ZY3auRhDdnAOugosS95ShO4g1QDeqf5w4Pqr+wI3RBdamiZSEtGMJS8rI
 WYR/Z1WqiZLNrQ9/d8lLqOXo6tYeXd1lIB9un6JDaV8p2FVIbutY0Fw7r
 hVjqCxP1nrTAVGcyh5AK/9Y/Lso6Gbrkt5FOElTZSTHkOIoj87YLl3zuU
 vL0mlswLTF+hPeiTo0xwaytVm1sH6rAstykZduaGUUBaoJNKOA0v0FqR+ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="253021633"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; d="scan'208";a="253021633"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 00:05:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; d="scan'208";a="778014577"
Received: from 984fee00bf64.jf.intel.com ([10.165.54.77])
 by fmsmga006.fm.intel.com with ESMTP; 28 Feb 2022 00:05:16 -0800
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/8] x86: Add AMX XTILECFG and XTILEDATA components
Date: Mon, 28 Feb 2022 00:05:09 -0800
Message-Id: <20220228080515.42357-3-yang.zhong@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220228080515.42357-1-yang.zhong@intel.com>
References: <20220228080515.42357-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.115; envelope-from=yang.zhong@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: yang.zhong@intel.com, kevin.tian@intel.com, seanjc@google.com,
 jing2.liu@linux.intel.com, wei.w.wang@intel.com, guang.zeng@intel.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jing Liu <jing2.liu@intel.com>

The AMX TILECFG register and the TMMx tile data registers are
saved/restored via XSAVE, respectively in state component 17
(64 bytes) and state component 18 (8192 bytes).

Add AMX feature bits to x86_ext_save_areas array to set
up AMX components. Add structs that define the layout of
AMX XSAVE areas and use QEMU_BUILD_BUG_ON to validate the
structs sizes.

Signed-off-by: Jing Liu <jing2.liu@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Reviewed-by: David Edmondson <david.edmondson@oracle.com>
---
 target/i386/cpu.h | 18 +++++++++++++++++-
 target/i386/cpu.c |  8 ++++++++
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 7bd9d58505..3ff1b49d29 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -539,6 +539,8 @@ typedef enum X86Seg {
 #define XSTATE_ZMM_Hi256_BIT            6
 #define XSTATE_Hi16_ZMM_BIT             7
 #define XSTATE_PKRU_BIT                 9
+#define XSTATE_XTILE_CFG_BIT            17
+#define XSTATE_XTILE_DATA_BIT           18
 
 #define XSTATE_FP_MASK                  (1ULL << XSTATE_FP_BIT)
 #define XSTATE_SSE_MASK                 (1ULL << XSTATE_SSE_BIT)
@@ -847,6 +849,8 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 #define CPUID_7_0_EDX_TSX_LDTRK         (1U << 16)
 /* AVX512_FP16 instruction */
 #define CPUID_7_0_EDX_AVX512_FP16       (1U << 23)
+/* AMX tile (two-dimensional register) */
+#define CPUID_7_0_EDX_AMX_TILE          (1U << 24)
 /* Speculation Control */
 #define CPUID_7_0_EDX_SPEC_CTRL         (1U << 26)
 /* Single Thread Indirect Branch Predictors */
@@ -1350,6 +1354,16 @@ typedef struct XSavePKRU {
     uint32_t padding;
 } XSavePKRU;
 
+/* Ext. save area 17: AMX XTILECFG state */
+typedef struct XSaveXTILECFG {
+    uint8_t xtilecfg[64];
+} XSaveXTILECFG;
+
+/* Ext. save area 18: AMX XTILEDATA state */
+typedef struct XSaveXTILEDATA {
+    uint8_t xtiledata[8][1024];
+} XSaveXTILEDATA;
+
 QEMU_BUILD_BUG_ON(sizeof(XSaveAVX) != 0x100);
 QEMU_BUILD_BUG_ON(sizeof(XSaveBNDREG) != 0x40);
 QEMU_BUILD_BUG_ON(sizeof(XSaveBNDCSR) != 0x40);
@@ -1357,6 +1371,8 @@ QEMU_BUILD_BUG_ON(sizeof(XSaveOpmask) != 0x40);
 QEMU_BUILD_BUG_ON(sizeof(XSaveZMM_Hi256) != 0x200);
 QEMU_BUILD_BUG_ON(sizeof(XSaveHi16_ZMM) != 0x400);
 QEMU_BUILD_BUG_ON(sizeof(XSavePKRU) != 0x8);
+QEMU_BUILD_BUG_ON(sizeof(XSaveXTILECFG) != 0x40);
+QEMU_BUILD_BUG_ON(sizeof(XSaveXTILEDATA) != 0x2000);
 
 typedef struct ExtSaveArea {
     uint32_t feature, bits;
@@ -1364,7 +1380,7 @@ typedef struct ExtSaveArea {
     uint32_t ecx;
 } ExtSaveArea;
 
-#define XSAVE_STATE_AREA_COUNT (XSTATE_PKRU_BIT + 1)
+#define XSAVE_STATE_AREA_COUNT (XSTATE_XTILE_DATA_BIT + 1)
 
 extern ExtSaveArea x86_ext_save_areas[XSAVE_STATE_AREA_COUNT];
 
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 0f3c477dfc..ec35dd1717 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1402,6 +1402,14 @@ ExtSaveArea x86_ext_save_areas[XSAVE_STATE_AREA_COUNT] = {
     [XSTATE_PKRU_BIT] =
           { .feature = FEAT_7_0_ECX, .bits = CPUID_7_0_ECX_PKU,
             .size = sizeof(XSavePKRU) },
+    [XSTATE_XTILE_CFG_BIT] = {
+        .feature = FEAT_7_0_EDX, .bits = CPUID_7_0_EDX_AMX_TILE,
+        .size = sizeof(XSaveXTILECFG),
+    },
+    [XSTATE_XTILE_DATA_BIT] = {
+        .feature = FEAT_7_0_EDX, .bits = CPUID_7_0_EDX_AMX_TILE,
+        .size = sizeof(XSaveXTILEDATA)
+    },
 };
 
 static uint32_t xsave_area_size(uint64_t mask)

