Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 074806469A6
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 08:20:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3BBa-0001fm-M9; Thu, 08 Dec 2022 02:19:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxi.chen@linux.intel.com>)
 id 1p3BBX-0001ef-Ak
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 02:19:11 -0500
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxi.chen@linux.intel.com>)
 id 1p3BBV-0006cu-MG
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 02:19:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670483949; x=1702019949;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A6hTx64n7tysQkie6LmQ+Wxh4q4wBOtCQDsxN+oT8PA=;
 b=AooR8ynNtEtQ042guiQyEkyvFi0iuahNxI5osC4ePsonxkNrg5eglZ6i
 1EMlbYc1pow3SB2SxCP0kQ9rKBP0f42Da13WbGBr1ptFMfHIt1BRbqRi3
 T6upWPqETo8PdptorvGp714S0LgOE/a5ZMg5eOoUHf463WLGvSN+tbbyX
 mgqNWyuv1U8XOsFR1hktQPjn+B9DbojKjA8p+h4sGfMXHrjEaAGW97qdY
 W6ytKXvhnhODbRR5cI7FupbAiDz3AMSvlkT9Of8wtiOld7N3fUKsfT7mX
 0KndbijEKC2AXrR2yxoEIcK1Jih130KcWX0cmfgVtau2hgtqF3p2qQTnZ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="379263846"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; d="scan'208";a="379263846"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2022 23:19:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="771381005"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; d="scan'208";a="771381005"
Received: from jiaxichen-precision-3650-tower.sh.intel.com ([10.239.159.75])
 by orsmga004.jf.intel.com with ESMTP; 07 Dec 2022 23:19:05 -0800
From: Jiaxi Chen <jiaxi.chen@linux.intel.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, yang.zhong@intel.com,
 jing2.liu@intel.com, vkuznets@redhat.com
Subject: [PATCH 5/6] target/i386: Add support for AVX-NE-CONVERT in CPUID
 enumeration
Date: Thu,  8 Dec 2022 15:19:16 +0800
Message-Id: <20221208071917.1923093-6-jiaxi.chen@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221208071917.1923093-1-jiaxi.chen@linux.intel.com>
References: <20221208071917.1923093-1-jiaxi.chen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=134.134.136.31;
 envelope-from=jiaxi.chen@linux.intel.com; helo=mga06.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

AVX-NE-CONVERT is a new set of instructions which can convert low
precision floating point like BF16/FP16 to high precision floating point
FP32, as well as convert FP32 elements to BF16. This instruction allows
the platform to have improved AI capabilities and better compatibility.

The bit definition:
CPUID.(EAX=7,ECX=1):EDX[bit 5]

Add CPUID definition for AVX-NE-CONVERT.

Signed-off-by: Jiaxi Chen <jiaxi.chen@linux.intel.com>
---
 target/i386/cpu.c | 2 +-
 target/i386/cpu.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index ea1daf6b7e..4aca5360cc 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -891,7 +891,7 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
         .type = CPUID_FEATURE_WORD,
         .feat_names = {
             NULL, NULL, NULL, NULL,
-            "avx-vnni-int8", NULL, NULL, NULL,
+            "avx-vnni-int8", "avx-ne-convert", NULL, NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index da4fb1cfca..c4571d726c 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -910,6 +910,8 @@ uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
 
 /* Support for VPDPB[SU,UU,SS]D[,S] */
 #define CPUID_7_1_EDX_AVX_VNNI_INT8     (1U << 4)
+/* AVX NE CONVERT Instructions */
+#define CPUID_7_1_EDX_AVX_NE_CONVERT    (1U << 5)
 
 /* XFD Extend Feature Disabled */
 #define CPUID_D_1_EAX_XFD               (1U << 4)
-- 
2.27.0


