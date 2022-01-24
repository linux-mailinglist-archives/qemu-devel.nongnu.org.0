Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA4D4979F7
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 09:06:22 +0100 (CET)
Received: from localhost ([::1]:46916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBuMn-0002DF-5C
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 03:06:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nBuCL-0004c5-HX
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 02:55:33 -0500
Received: from mga07.intel.com ([134.134.136.100]:15222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nBuCJ-0001Wn-JX
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 02:55:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643010931; x=1674546931;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mmm/+5saobvWvpN28F+InAEJcEjM064s12yrFmQox7Y=;
 b=fpVctbikyE1odrn0E3R3WfMGQVca5o4yJKcEg+UIvKnCXo1uVi7/I6xu
 5/zZxw204T8BUt5cvAsIwuXHnFkE/KiJuwnbOxiYSTIFALGPjktUFsSu7
 mH9jZnItPsnETDEfEVp2LaTYRSJAuxzBNZFMDoGouFPS720gGddbqnzs/
 MAUVyEkx/OoeOWY/pJ/fNNww+URgS2JkW3cQlbO8VIvpN90WaoxhZEElQ
 wsxQZk0dUV6qkMyIKyE792SmwBatn5Wue2MqfhqthWXOVk2f3xlhEmsF9
 hGjnJPCc7c9sqPCMZF2BGm3UrMP/zKs2T0TGH8m1D0TFuTGX3ofsLg8cd A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="309310864"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="309310864"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2022 23:55:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="494530980"
Received: from 984fee00bf64.jf.intel.com ([10.165.54.77])
 by orsmga002.jf.intel.com with ESMTP; 23 Jan 2022 23:55:23 -0800
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/7] x86: Add AMX XTILECFG and XTILEDATA components
Date: Sun, 23 Jan 2022 23:55:18 -0800
Message-Id: <20220124075523.108875-3-yang.zhong@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124075523.108875-1-yang.zhong@intel.com>
References: <20220124075523.108875-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=yang.zhong@intel.com; helo=mga07.intel.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
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
---
 target/i386/cpu.h | 18 +++++++++++++++++-
 target/i386/cpu.c |  8 ++++++++
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index de1dc124ab..06d2d6bccf 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -537,6 +537,8 @@ typedef enum X86Seg {
 #define XSTATE_ZMM_Hi256_BIT            6
 #define XSTATE_Hi16_ZMM_BIT             7
 #define XSTATE_PKRU_BIT                 9
+#define XSTATE_XTILE_CFG_BIT            17
+#define XSTATE_XTILE_DATA_BIT           18
 
 #define XSTATE_FP_MASK                  (1ULL << XSTATE_FP_BIT)
 #define XSTATE_SSE_MASK                 (1ULL << XSTATE_SSE_BIT)
@@ -845,6 +847,8 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 #define CPUID_7_0_EDX_TSX_LDTRK         (1U << 16)
 /* AVX512_FP16 instruction */
 #define CPUID_7_0_EDX_AVX512_FP16       (1U << 23)
+/* AMX tile (two-dimensional register) */
+#define CPUID_7_0_EDX_AMX_TILE          (1U << 24)
 /* Speculation Control */
 #define CPUID_7_0_EDX_SPEC_CTRL         (1U << 26)
 /* Single Thread Indirect Branch Predictors */
@@ -1348,6 +1352,16 @@ typedef struct XSavePKRU {
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
@@ -1355,6 +1369,8 @@ QEMU_BUILD_BUG_ON(sizeof(XSaveOpmask) != 0x40);
 QEMU_BUILD_BUG_ON(sizeof(XSaveZMM_Hi256) != 0x200);
 QEMU_BUILD_BUG_ON(sizeof(XSaveHi16_ZMM) != 0x400);
 QEMU_BUILD_BUG_ON(sizeof(XSavePKRU) != 0x8);
+QEMU_BUILD_BUG_ON(sizeof(XSaveXTILECFG) != 0x40);
+QEMU_BUILD_BUG_ON(sizeof(XSaveXTILEDATA) != 0x2000);
 
 typedef struct ExtSaveArea {
     uint32_t feature, bits;
@@ -1362,7 +1378,7 @@ typedef struct ExtSaveArea {
     uint32_t ecx;
 } ExtSaveArea;
 
-#define XSAVE_STATE_AREA_COUNT (XSTATE_PKRU_BIT + 1)
+#define XSAVE_STATE_AREA_COUNT (XSTATE_XTILE_DATA_BIT + 1)
 
 extern ExtSaveArea x86_ext_save_areas[XSAVE_STATE_AREA_COUNT];
 
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 37f06b0b1a..3390820745 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1401,6 +1401,14 @@ ExtSaveArea x86_ext_save_areas[XSAVE_STATE_AREA_COUNT] = {
     [XSTATE_PKRU_BIT] =
           { .feature = FEAT_7_0_ECX, .bits = CPUID_7_0_ECX_PKU,
             .size = sizeof(XSavePKRU) },
+    [XSTATE_XTILE_CFG_BIT] = {
+        .feature = FEAT_7_0_EDX, .bits = CPUID_7_0_EDX_AMX_TILE,
+        .size = sizeof(XSaveXTILECFG),
+    },
+    [XSTATE_XTILE_DATA_BIT] = {
+        .feature = FEAT_7_0_EDX, .bits = CPUID_7_0_EDX_AMX_TILE,
+        .size = sizeof(XSaveXTILEDATA),
+    },
 };
 
 static uint32_t xsave_area_size(uint64_t mask)

