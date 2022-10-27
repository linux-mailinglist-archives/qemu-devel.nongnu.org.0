Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7640860EDBB
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 04:03:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onsD0-0001fj-0R; Wed, 26 Oct 2022 22:01:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1onsCh-0001Zd-3y
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 22:01:09 -0400
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1onsCd-0004u8-Jx
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 22:01:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666836063; x=1698372063;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JWUViv/RcU5IlWP3WUKFML58YY1O8/EHiGTrPfzZm3c=;
 b=ZnjruUs7xzfALTs7Lapzt36aH/FQf+OV7YlmACTEnsNeZUGYoJLGc8l2
 UDGjb2R3GjWmU7nf6oVkRHQRV/v5qEgfSqCZnx++MPjyBVzgbnGbqcETy
 rjJLDwkV8317MysA8wGpuFzZXZI2a4SkrO51IaK5SJZ/XQzC7m//kUIBG
 gHNh1dyGNI35Giil6P9OHHs9yCoQnrG3B+cQa7H4DgSIswFNs6W0Db2+S
 m+FBIOKCFO1SNPFnOCyn4j9p2m75X79QAwXoJ8lVR/GBgK2810BmUX0sa
 S877Hl1q0xazoOrRW6ZCg/XQlTxaa0F8pXPI6GHsaaYnen1wOg1P77VBn Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="370174873"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; d="scan'208";a="370174873"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2022 19:00:38 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="877407943"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; d="scan'208";a="877407943"
Received: from b49691a74b20.jf.intel.com ([10.45.76.123])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2022 19:00:38 -0700
From: "Wang, Lei" <lei4.wang@intel.com>
To: pbonzini@redhat.com
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, berrange@redhat.com,
 xiaoyao.li@intel.com, yang.zhong@linux.intel.com
Subject: [PATCH 5/6] i386: Initialize AMX CPUID leaves with corresponding
 env->features[] leaves
Date: Wed, 26 Oct 2022 19:00:35 -0700
Message-Id: <20221027020036.373140-6-lei4.wang@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027020036.373140-1-lei4.wang@intel.com>
References: <20221027020036.373140-1-lei4.wang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=lei4.wang@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The AMX-related CPUID value, i.e., CPUID(0x1D,1):EAX, CPUID(0x1D,1):EBX,
CPUID(0x1D,1):ECX and CPUID(0x1E,0):EBX are hard-coded to Sapphire Rapids
without considering future platforms.

Replace these hard-coded values with env->features[], so QEMU can pass the
right value to KVM.

Signed-off-by: Wang, Lei <lei4.wang@intel.com>
---
 target/i386/cpu.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index fc120c0694..21d9529d38 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -576,16 +576,16 @@ static CPUCacheInfo legacy_l3_cache = {
 #define INTEL_PT_PSB_BITMAP      (0x003f << 16) /* Support 2K,4K,8K,16K,32K,64K */
 
 /* CPUID Leaf 0x1D constants: */
-#define INTEL_AMX_TILE_MAX_SUBLEAF     0x1
-#define INTEL_AMX_TOTAL_TILE_BYTES     0x2000
-#define INTEL_AMX_BYTES_PER_TILE       0x400
-#define INTEL_AMX_BYTES_PER_ROW        0x40
-#define INTEL_AMX_TILE_MAX_NAMES       0x8
-#define INTEL_AMX_TILE_MAX_ROWS        0x10
+#define INTEL_SPR_AMX_TILE_MAX_SUBLEAF     0x1
+#define INTEL_SPR_AMX_TOTAL_TILE_BYTES     0x2000
+#define INTEL_SPR_AMX_BYTES_PER_TILE       0x400
+#define INTEL_SPR_AMX_BYTES_PER_ROW        0x40
+#define INTEL_SPR_AMX_TILE_MAX_NAMES       0x8
+#define INTEL_SPR_AMX_TILE_MAX_ROWS        0x10
 
 /* CPUID Leaf 0x1E constants: */
-#define INTEL_AMX_TMUL_MAX_K           0x10
-#define INTEL_AMX_TMUL_MAX_N           0x40
+#define INTEL_SPR_AMX_TMUL_MAX_K           0x10
+#define INTEL_SPR_AMX_TMUL_MAX_N           0x40
 
 void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
                               uint32_t vendor2, uint32_t vendor3)
@@ -5763,12 +5763,11 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
 
         if (count == 0) {
             /* Highest numbered palette subleaf */
-            *eax = INTEL_AMX_TILE_MAX_SUBLEAF;
+            *eax = INTEL_SPR_AMX_TILE_MAX_SUBLEAF;
         } else if (count == 1) {
-            *eax = INTEL_AMX_TOTAL_TILE_BYTES |
-                   (INTEL_AMX_BYTES_PER_TILE << 16);
-            *ebx = INTEL_AMX_BYTES_PER_ROW | (INTEL_AMX_TILE_MAX_NAMES << 16);
-            *ecx = INTEL_AMX_TILE_MAX_ROWS;
+            *eax = env->features[FEAT_1D_1_EAX];
+            *ebx = env->features[FEAT_1D_1_EBX];
+            *ecx = env->features[FEAT_1D_1_ECX];
         }
         break;
     }
@@ -5784,7 +5783,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
 
         if (count == 0) {
             /* Highest numbered palette subleaf */
-            *ebx = INTEL_AMX_TMUL_MAX_K | (INTEL_AMX_TMUL_MAX_N << 8);
+            *ebx = env->features[FEAT_1E_0_EBX];
         }
         break;
     }
-- 
2.34.1


