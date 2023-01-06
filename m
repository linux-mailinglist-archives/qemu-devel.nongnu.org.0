Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D88A65FD33
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 09:57:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDiFd-0006Aw-F4; Fri, 06 Jan 2023 03:38:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1pDiFB-00062t-Bs
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 03:38:29 -0500
Received: from mga05.intel.com ([192.55.52.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1pDiF9-0008Or-Gi
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 03:38:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672994307; x=1704530307;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UHSkrlwfU0nvpItnnVZebZwFf4NOBgA9LfrSFPvlqhE=;
 b=cH5/8WGnMOnaRZFWP+6kBkJz/KoLyU+t6+kDpiCpY9elp+PlNV/SUnYQ
 Ek3klpZ6eEKGapOcyZmwlhbFuJ7r5GDkhiH/v0yk8O9e1K9flZDdYhSpS
 pon7nT+xiK+fZJG8LGUxcmLaNmNPgHTpTUJVXecQ8J+WlalnwIp+hxIRZ
 e36MizqViCq3t1omp8zAeT7bzMiXOMzZf/sYbs30YkDT+GqUkGPTxrgZy
 i4LpJiVtF6fVEZroK/zRvafUOYNw1OMf65+inhHhvl0LASy1hMT7gLKFs
 tN25HidhJyD8dPpZTlgezPyrxZl26DXgc4k3BFtCKBV0J/HyXOltjG933 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="408688503"
X-IronPort-AV: E=Sophos;i="5.96,304,1665471600"; d="scan'208";a="408688503"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2023 00:38:21 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="724378865"
X-IronPort-AV: E=Sophos;i="5.96,304,1665471600"; d="scan'208";a="724378865"
Received: from sdp.sh.intel.com ([10.112.228.155])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2023 00:38:19 -0800
From: Lei Wang <lei4.wang@intel.com>
To: pbonzini@redhat.com
Cc: qemu-devel@nongnu.org, imammedo@redhat.com, dgilbert@redhat.com,
 berrange@redhat.com, xiaoyao.li@intel.com, yang.zhong@linux.intel.com,
 lei4.wang@intel.com
Subject: [PATCH v3 5/6] i386: Initialize AMX CPUID leaves with corresponding
 env->features[] leaves
Date: Fri,  6 Jan 2023 00:38:25 -0800
Message-Id: <20230106083826.5384-6-lei4.wang@intel.com>
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

The AMX-related CPUID value, i.e., CPUID(0x1D,1):EAX, CPUID(0x1D,1):EBX,
CPUID(0x1D,1):ECX and CPUID(0x1E,0):EBX are hard-coded to Sapphire Rapids
without considering future platforms.

Replace these hard-coded values with env->features[], so QEMU can pass the
right value to KVM.

Signed-off-by: Lei Wang <lei4.wang@intel.com>
---
 target/i386/cpu.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index e638a31d34..946df29a3d 100644
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
@@ -5764,12 +5764,11 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
 
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
@@ -5785,7 +5784,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
 
         if (count == 0) {
             /* Highest numbered palette subleaf */
-            *ebx = INTEL_AMX_TMUL_MAX_K | (INTEL_AMX_TMUL_MAX_N << 8);
+            *ebx = env->features[FEAT_1E_0_EBX];
         }
         break;
     }
-- 
2.34.1


