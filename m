Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB5E4B84E3
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 10:53:03 +0100 (CET)
Received: from localhost ([::1]:46528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKGze-0002YD-B6
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 04:53:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1nKG5c-0005HL-Mn
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 03:55:08 -0500
Received: from mga12.intel.com ([192.55.52.136]:38500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1nKG5a-0002nD-PZ
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 03:55:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645001706; x=1676537706;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eKxh2JCpd5Vqvqfr9C/TBksQqPRHO62E7J80Y06qmuI=;
 b=GWTPPRuKwZbHuXiLC13kNLBAfWfMicsnKz32DuiIrRuedCMPde5X7eRh
 pMIKAUsehNy2eC3H7zXT3D+hCc8TIp3PTSfOd5WtTBvRMEYFdHqKQ0Dh6
 8N/ciWx2x0BpCuD1Qc1qAEAkdK4v4Qjl36LKHF3E6C6WCLLNkj8O7+P1X
 nnYT8a1W0DpYoXA/Or2GcBcBscVLnIZ43hPRgH1gwLKYwg1/X4exVb/d0
 tZRd5Z7WZ4bqDE6KNi1PnFVYinPMK+m0Nhr3TvTnvStqw4MxZ8O99avIv
 7Q2NlCxVVZVngHR216aROTskUyqkhNQfgU2kNowM2nORREBLUF1XevF/z A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="230518920"
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; d="scan'208";a="230518920"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 00:54:52 -0800
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; d="scan'208";a="633418284"
Received: from embargo.jf.intel.com ([10.165.9.183])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 00:54:06 -0800
From: Yang Weijiang <weijiang.yang@intel.com>
To: pbonzini@redhat.com, ehabkost@redhat.com, mtosatti@redhat.com,
 seanjc@google.com, richard.henderson@linaro.org, like.xu.linux@gmail.com,
 wei.w.wang@intel.com, qemu-devel@nongnu.org, kvm@vger.kernel.org
Subject: [PATCH 5/8] target/i386: Add XSAVES support for Arch LBR
Date: Tue, 15 Feb 2022 14:52:55 -0500
Message-Id: <20220215195258.29149-6-weijiang.yang@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220215195258.29149-1-weijiang.yang@intel.com>
References: <20220215195258.29149-1-weijiang.yang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.136;
 envelope-from=weijiang.yang@intel.com; helo=mga12.intel.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIMWL_WL_HIGH=-0.083, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Yang Weijiang <weijiang.yang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Define Arch LBR bit in XSS and save/restore structure
for XSAVE area size calculation.

Signed-off-by: Yang Weijiang <weijiang.yang@intel.com>
---
 target/i386/cpu.c |  6 +++++-
 target/i386/cpu.h | 23 +++++++++++++++++++++++
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 496e906233..e505c926b2 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1414,7 +1414,7 @@ static const X86RegisterInfo32 x86_reg_info_32[CPU_NB_REGS32] = {
 #undef REGISTER
 
 /* CPUID feature bits available in XSS */
-#define CPUID_XSTATE_XSS_MASK    (0)
+#define CPUID_XSTATE_XSS_MASK    (XSTATE_ARCH_LBR_MASK)
 
 ExtSaveArea x86_ext_save_areas[XSAVE_STATE_AREA_COUNT] = {
     [XSTATE_FP_BIT] = {
@@ -1448,6 +1448,10 @@ ExtSaveArea x86_ext_save_areas[XSAVE_STATE_AREA_COUNT] = {
     [XSTATE_PKRU_BIT] =
           { .feature = FEAT_7_0_ECX, .bits = CPUID_7_0_ECX_PKU,
             .size = sizeof(XSavePKRU) },
+    [XSTATE_ARCH_LBR_BIT] = {
+            .feature = FEAT_7_0_EDX, .bits = CPUID_7_0_EDX_ARCH_LBR,
+            .offset = 0 /*supervisor mode component, offset = 0 */,
+            .size = sizeof(XSavesArchLBR) },
     [XSTATE_XTILE_CFG_BIT] = {
         .feature = FEAT_7_0_EDX, .bits = CPUID_7_0_EDX_AMX_TILE,
         .size = sizeof(XSaveXTILECFG),
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 1d17196a0b..07b198539b 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -541,6 +541,7 @@ typedef enum X86Seg {
 #define XSTATE_ZMM_Hi256_BIT            6
 #define XSTATE_Hi16_ZMM_BIT             7
 #define XSTATE_PKRU_BIT                 9
+#define XSTATE_ARCH_LBR_BIT             15
 #define XSTATE_XTILE_CFG_BIT            17
 #define XSTATE_XTILE_DATA_BIT           18
 
@@ -553,6 +554,7 @@ typedef enum X86Seg {
 #define XSTATE_ZMM_Hi256_MASK           (1ULL << XSTATE_ZMM_Hi256_BIT)
 #define XSTATE_Hi16_ZMM_MASK            (1ULL << XSTATE_Hi16_ZMM_BIT)
 #define XSTATE_PKRU_MASK                (1ULL << XSTATE_PKRU_BIT)
+#define XSTATE_ARCH_LBR_MASK            (1ULL << XSTATE_ARCH_LBR_BIT)
 #define XSTATE_XTILE_CFG_MASK           (1ULL << XSTATE_XTILE_CFG_BIT)
 #define XSTATE_XTILE_DATA_MASK          (1ULL << XSTATE_XTILE_DATA_BIT)
 #define XFEATURE_XTILE_MASK             (XSTATE_XTILE_CFG_MASK \
@@ -867,6 +869,8 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 #define CPUID_7_0_EDX_SERIALIZE         (1U << 14)
 /* TSX Suspend Load Address Tracking instruction */
 #define CPUID_7_0_EDX_TSX_LDTRK         (1U << 16)
+/* Architectural LBRs */
+#define CPUID_7_0_EDX_ARCH_LBR          (1U << 19)
 /* AVX512_FP16 instruction */
 #define CPUID_7_0_EDX_AVX512_FP16       (1U << 23)
 /* AMX tile (two-dimensional register) */
@@ -1386,6 +1390,24 @@ typedef struct XSaveXTILEDATA {
     uint8_t xtiledata[8][1024];
 } XSaveXTILEDATA;
 
+typedef struct {
+       uint64_t from;
+       uint64_t to;
+       uint64_t info;
+} LBR_ENTRY;
+
+#define ARCH_LBR_NR_ENTRIES            32
+
+/* Ext. save area 19: Supervisor mode Arch LBR state */
+typedef struct XSavesArchLBR {
+    uint64_t lbr_ctl;
+    uint64_t lbr_depth;
+    uint64_t ler_from;
+    uint64_t ler_to;
+    uint64_t ler_info;
+    LBR_ENTRY lbr_records[ARCH_LBR_NR_ENTRIES];
+} XSavesArchLBR;
+
 QEMU_BUILD_BUG_ON(sizeof(XSaveAVX) != 0x100);
 QEMU_BUILD_BUG_ON(sizeof(XSaveBNDREG) != 0x40);
 QEMU_BUILD_BUG_ON(sizeof(XSaveBNDCSR) != 0x40);
@@ -1395,6 +1417,7 @@ QEMU_BUILD_BUG_ON(sizeof(XSaveHi16_ZMM) != 0x400);
 QEMU_BUILD_BUG_ON(sizeof(XSavePKRU) != 0x8);
 QEMU_BUILD_BUG_ON(sizeof(XSaveXTILECFG) != 0x40);
 QEMU_BUILD_BUG_ON(sizeof(XSaveXTILEDATA) != 0x2000);
+QEMU_BUILD_BUG_ON(sizeof(XSavesArchLBR) != 0x328);
 
 typedef struct ExtSaveArea {
     uint32_t feature, bits;
-- 
2.27.0


