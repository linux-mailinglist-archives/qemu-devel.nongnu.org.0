Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 318EF615E76
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 09:55:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oq9XB-0006jt-5B; Wed, 02 Nov 2022 04:55:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1oq9Wd-0006Fz-MJ
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 04:55:13 -0400
Received: from mga17.intel.com ([192.55.52.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1oq9Wb-0000rr-B3
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 04:55:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667379305; x=1698915305;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UyZWp1kELLoxMAnHvZybWFAVmfkD9Fko8h5Vk+D9uTQ=;
 b=oCw2Nl/Fx4eAjQO2zb2nVjiGD7QQpsRamPn3TUUNjOVm2Fuhy0DQr1/3
 TlOxVuB8s8TJ2fa2rHvC8ceJf89SbqQbxrmXa7B/UDYYPoHs/xTCyBFjz
 LA8aM/PIgYfAsZe2R4V5P/I7y5SiV8OaNeqJZ0nkl+aGDMhbco+GzWrH3
 HqJ0ebzIG9ik5N116guB93sSGsgUl5gUAC1D4cTP5uDDaCm3Tk9F/X9uf
 pHMtXAAk0HeL/MtH82OHkdZ8LpQ/0dJAQev1JRBZqn7O9FGm9AV1Vg4sr
 p6qmewXG9SQNAvPXb47I4mAzpD7UY5QGkGk9f6CGfwfeXH1Ff6c3SFGkN Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="289739305"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; d="scan'208";a="289739305"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2022 01:54:48 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="776815430"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; d="scan'208";a="776815430"
Received: from b49691a74b20.jf.intel.com ([10.45.76.123])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2022 01:54:48 -0700
From: "Wang, Lei" <lei4.wang@intel.com>
To: pbonzini@redhat.com
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, berrange@redhat.com,
 xiaoyao.li@intel.com, yang.zhong@linux.intel.com
Subject: [PATCH v2 1/6] i386: Introduce FeatureWordInfo for AMX CPUID leaf
 0x1D and 0x1E
Date: Wed,  2 Nov 2022 01:54:42 -0700
Message-Id: <20221102085447.81228-2-lei4.wang@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221102085447.81228-1-lei4.wang@intel.com>
References: <20221102085447.81228-1-lei4.wang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=lei4.wang@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.051,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=ham autolearn_force=no
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

CPUID leaf 0x1D and 0x1E enumerate tile and TMUL information for AMX.

Introduce FeatureWord FEAT_1D_1_EAX, FEAT_1D_1_EBX, FEAT_1D_1_ECX and
FEAT_1E_0_EBX. Thus these features of AMX can be expanded when
"-cpu host/max" and can be configured in named CPU model.

Signed-off-by: Wang, Lei <lei4.wang@intel.com>
---
 target/i386/cpu.c | 55 +++++++++++++++++++++++++++++++++++++++++++++++
 target/i386/cpu.h | 12 +++++++++++
 2 files changed, 67 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 8a11470507..e98780773c 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1002,6 +1002,45 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
         },
         .tcg_features = ~0U,
     },
+    [FEAT_1D_1_EAX] = {
+        .type = CPUID_FEATURE_WORD,
+        .cpuid = {
+            .eax = 0x1D,
+            .needs_ecx = true, .ecx = 1,
+            .reg = R_EAX,
+        },
+        .migratable_flags = CPUID_AMX_PALETTE_1_TOTAL_TILE_BYTES_MASK |
+            CPUID_AMX_PALETTE_1_BYTES_PER_TILE_MASK,
+    },
+    [FEAT_1D_1_EBX] = {
+        .type = CPUID_FEATURE_WORD,
+        .cpuid = {
+            .eax = 0x1D,
+            .needs_ecx = true, .ecx = 1,
+            .reg = R_EBX,
+        },
+        .migratable_flags = CPUID_AMX_PALETTE_1_BYTES_PER_ROW_MASK |
+            CPUID_AMX_PALETTE_1_MAX_NAMES_MASK,
+    },
+    [FEAT_1D_1_ECX] = {
+        .type = CPUID_FEATURE_WORD,
+        .cpuid = {
+            .eax = 0x1D,
+            .needs_ecx = true, .ecx = 1,
+            .reg = R_ECX,
+        },
+        .migratable_flags = CPUID_AMX_PALETTE_1_MAX_ROWS_MASK,
+    },
+    [FEAT_1E_0_EBX] = {
+        .type = CPUID_FEATURE_WORD,
+        .cpuid = {
+            .eax = 0x1E,
+            .needs_ecx = true, .ecx = 0,
+            .reg = R_EBX,
+        },
+        .migratable_flags = CPUID_AMX_TMUL_MAX_K_MASK |
+            CPUID_AMX_TMUL_MAX_N_MASK,
+    },
     /*Below are MSR exposed features*/
     [FEAT_ARCH_CAPABILITIES] = {
         .type = MSR_FEATURE_WORD,
@@ -1371,6 +1410,22 @@ static FeatureDep feature_dependencies[] = {
         .from = { FEAT_7_0_EBX,             CPUID_7_0_EBX_INTEL_PT },
         .to = { FEAT_14_0_ECX,              ~0ull },
     },
+    {
+        .from = { FEAT_7_0_EDX,             CPUID_7_0_EDX_AMX_TILE },
+        .to = { FEAT_1D_1_EAX,              ~0ull },
+    },
+    {
+        .from = { FEAT_7_0_EDX,             CPUID_7_0_EDX_AMX_TILE },
+        .to = { FEAT_1D_1_EBX,              ~0ull },
+    },
+    {
+        .from = { FEAT_7_0_EDX,             CPUID_7_0_EDX_AMX_TILE },
+        .to = { FEAT_1D_1_ECX,              ~0ull },
+    },
+    {
+        .from = { FEAT_7_0_EDX,             CPUID_7_0_EDX_AMX_TILE },
+        .to = { FEAT_1E_0_EBX,              ~0ull },
+    },
     {
         .from = { FEAT_8000_0001_EDX,       CPUID_EXT2_RDTSCP },
         .to = { FEAT_VMX_SECONDARY_CTLS,    VMX_SECONDARY_EXEC_RDTSCP },
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 7edf5dfac3..1c90fb6c9d 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -583,6 +583,14 @@ typedef enum X86Seg {
                                  XSTATE_Hi16_ZMM_MASK | XSTATE_PKRU_MASK | \
                                  XSTATE_XTILE_CFG_MASK | XSTATE_XTILE_DATA_MASK)
 
+#define CPUID_AMX_PALETTE_1_TOTAL_TILE_BYTES_MASK 0xffffU
+#define CPUID_AMX_PALETTE_1_BYTES_PER_TILE_MASK   (0xffffU << 16)
+#define CPUID_AMX_PALETTE_1_BYTES_PER_ROW_MASK    0xffffU
+#define CPUID_AMX_PALETTE_1_MAX_NAMES_MASK        (0xffffU << 16)
+#define CPUID_AMX_PALETTE_1_MAX_ROWS_MASK         0xffffU
+#define CPUID_AMX_TMUL_MAX_K_MASK                 0xffU
+#define CPUID_AMX_TMUL_MAX_N_MASK                 (0xffffU << 8)
+
 /* CPUID feature words */
 typedef enum FeatureWord {
     FEAT_1_EDX,         /* CPUID[1].EDX */
@@ -603,6 +611,10 @@ typedef enum FeatureWord {
     FEAT_6_EAX,         /* CPUID[6].EAX */
     FEAT_XSAVE_XCR0_LO, /* CPUID[EAX=0xd,ECX=0].EAX */
     FEAT_XSAVE_XCR0_HI, /* CPUID[EAX=0xd,ECX=0].EDX */
+    FEAT_1D_1_EAX,      /* CPUID[EAX=0x1d,ECX=1].EAX */
+    FEAT_1D_1_EBX,      /* CPUID[EAX=0x1d,ECX=1].EBX */
+    FEAT_1D_1_ECX,      /* CPUID[EAX=0x1d,ECX=1].ECX */
+    FEAT_1E_0_EBX,      /* CPUID[EAX=0x1e,ECX=0].EBX */
     FEAT_ARCH_CAPABILITIES,
     FEAT_CORE_CAPABILITY,
     FEAT_PERF_CAPABILITIES,
-- 
2.34.1


