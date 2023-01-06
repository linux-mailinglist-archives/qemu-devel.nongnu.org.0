Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC7C65FD25
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 09:55:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDiFA-00061J-Vz; Fri, 06 Jan 2023 03:38:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1pDiF1-00060C-Kq
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 03:38:19 -0500
Received: from mga05.intel.com ([192.55.52.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1pDiEz-0008Nh-EO
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 03:38:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672994297; x=1704530297;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QlZ9SJkdHQi4ru2Jh64n5vTyAf6RPH67P8ZSnINvzhA=;
 b=JQ0M42NnwJUh0IpS9Z8d1P+y+27fcCfUs+izG+1pQoxLm2UMBdeC7M8D
 eWC+/kD8PICxlCSs9M+e4sMXGhKCqjGkqPfWTSJ3S8V6I8eDJ7v4znk1B
 e12gzJmqON3Bz32Cf6Y+JDsaS4fhSn34b+318ld3xnNgTWS5Ts0fTysVM
 h1UgBZ1NArur2oW6tMfGGXyjPfslDpBEH5WMSuLiMsmXSaQCRFRUlG/zu
 4WAGRWGXYdlttU0vCtisJaV68uy/jlYmr/qhS7twtDowioGk3oKAVC7E6
 6YvYzwDRowyGus3pP7YmjJjdzfjDqMSKw/ALPbGlmFoPWMOU1RfS0GXEt Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="408688474"
X-IronPort-AV: E=Sophos;i="5.96,304,1665471600"; d="scan'208";a="408688474"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2023 00:38:11 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="724378818"
X-IronPort-AV: E=Sophos;i="5.96,304,1665471600"; d="scan'208";a="724378818"
Received: from sdp.sh.intel.com ([10.112.228.155])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2023 00:38:08 -0800
From: Lei Wang <lei4.wang@intel.com>
To: pbonzini@redhat.com
Cc: qemu-devel@nongnu.org, imammedo@redhat.com, dgilbert@redhat.com,
 berrange@redhat.com, xiaoyao.li@intel.com, yang.zhong@linux.intel.com,
 lei4.wang@intel.com
Subject: [PATCH v3 1/6] i386: Introduce FeatureWordInfo for AMX CPUID leaf
 0x1D and 0x1E
Date: Fri,  6 Jan 2023 00:38:21 -0800
Message-Id: <20230106083826.5384-2-lei4.wang@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230106083826.5384-1-lei4.wang@intel.com>
References: <20230106083826.5384-1-lei4.wang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43; envelope-from=lei4.wang@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

CPUID leaf 0x1D and 0x1E enumerate tile and TMUL information for AMX.

Introduce FeatureWord FEAT_1D_1_EAX, FEAT_1D_1_EBX, FEAT_1D_1_ECX and
FEAT_1E_0_EBX. Thus these features of AMX can be expanded when
"-cpu host/max" and can be configured in named CPU model.

Signed-off-by: Lei Wang <lei4.wang@intel.com>
---
 target/i386/cpu.c | 55 +++++++++++++++++++++++++++++++++++++++++++++++
 target/i386/cpu.h | 12 +++++++++++
 2 files changed, 67 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 3410e5e470..b6d1247e5e 100644
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
index d4bc19577a..3e3e0cfe59 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -585,6 +585,14 @@ typedef enum X86Seg {
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
@@ -605,6 +613,10 @@ typedef enum FeatureWord {
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


