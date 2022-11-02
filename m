Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1F6615E6D
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 09:54:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oq9V8-0005QY-Rb; Wed, 02 Nov 2022 04:53:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1oq9V0-0005OZ-26
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 04:53:27 -0400
Received: from mga04.intel.com ([192.55.52.120])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1oq9Ux-0008G6-O4
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 04:53:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667379203; x=1698915203;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v7GPJAYTnIGoHNQV9oOiW8oLs3igAqh2m5HxrAubfgE=;
 b=FV8Yf7N9z1ZDyr4xUnlmLz4MsxwqbVGpplVi5U8KWlvhp6MROgImrL+B
 FjW0uKu0GBBaY8eiJB865+AXDekPSx+AYP30mCts5T0iYaTNKJO1ajSeO
 ug3n22puXxxTlmHsomwkzvGyUAwWJmYk8+uRk2rnaJL2h6ufTLchheFPC
 iF16bIqpDA897Ejn48nKdi9utp9OoVMOglkNm8uqptnuVnySkG4tVt5gX
 eJ1n9K88reNUaR1GqmXFnMoyMkrs27Bv+BYYOZBMbxCwwOx7yB/X95Z3h
 ASfyTTRaGJctwvHqTnRmcKb63tIrITQoxv6nJHwP7aeVrRGX5bPXRqcCg g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="308072279"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; d="scan'208";a="308072279"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2022 01:52:58 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="963447227"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; d="scan'208";a="963447227"
Received: from b49691a74b20.jf.intel.com ([10.45.76.123])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2022 01:52:58 -0700
From: "Wang, Lei" <lei4.wang@intel.com>
To: pbonzini@redhat.com
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, berrange@redhat.com,
 xiaoyao.li@intel.com, yang.zhong@linux.intel.com
Subject: [PATCH v2 5/6] i386: Initialize AMX CPUID leaves with corresponding
 env->features[] leaves
Date: Wed,  2 Nov 2022 01:52:55 -0700
Message-Id: <20221102085256.81139-6-lei4.wang@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221102085256.81139-1-lei4.wang@intel.com>
References: <20221102085256.81139-1-lei4.wang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.120; envelope-from=lei4.wang@intel.com;
 helo=mga04.intel.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.051,
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
index 53223857ba..fce5a04be7 100644
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
@@ -5765,12 +5765,11 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
 
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
@@ -5786,7 +5785,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
 
         if (count == 0) {
             /* Highest numbered palette subleaf */
-            *ebx = INTEL_AMX_TMUL_MAX_K | (INTEL_AMX_TMUL_MAX_N << 8);
+            *ebx = env->features[FEAT_1E_0_EBX];
         }
         break;
     }
-- 
2.34.1


