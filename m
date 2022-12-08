Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1626469A3
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 08:19:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3BBU-0001ca-LJ; Thu, 08 Dec 2022 02:19:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxi.chen@linux.intel.com>)
 id 1p3BBS-0001bf-QH
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 02:19:06 -0500
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxi.chen@linux.intel.com>)
 id 1p3BBP-0006cu-FJ
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 02:19:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670483943; x=1702019943;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5P4u8pc/P3y8YT4F9M/OpcvLjyeo01HCojexn+arJpM=;
 b=LkOsqvh9d5YWVi3JW5E4wg+CVhVswWaLRRcP/ZfoOX6bRhVwQXWKTgr+
 lhOYe19WlJ1WGY/RFWgsxzZmPAThWollYuo14iNvXCkIIsqRt79qmdOhh
 HTzQwAlnPfQ4rXKQXCZQrEJU7dYs1nRcxp5+cwOccgtq63eW3B1LtxzTh
 /MEskTPQQpjaNR1+eGkP7SCC5tJ6ZzDBk1OzjKPcpJafsfgGlm34CZJ9Y
 j6bhj4c3V0GnurXfFheC6wpcmnqnilTCKFwEhLlm9LNeQOS/u282E94fu
 BOdCKcdAlt1VISoGqkrn+rnsWB5SrNpPz1bNxUCSGehLSFuwlIyDuEm1H w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="379263797"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; d="scan'208";a="379263797"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2022 23:19:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="771380966"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; d="scan'208";a="771380966"
Received: from jiaxichen-precision-3650-tower.sh.intel.com ([10.239.159.75])
 by orsmga004.jf.intel.com with ESMTP; 07 Dec 2022 23:18:58 -0800
From: Jiaxi Chen <jiaxi.chen@linux.intel.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, yang.zhong@intel.com,
 jing2.liu@intel.com, vkuznets@redhat.com
Subject: [PATCH 1/6] target/i386: Add support for CMPCCXADD in CPUID
 enumeration
Date: Thu,  8 Dec 2022 15:19:12 +0800
Message-Id: <20221208071917.1923093-2-jiaxi.chen@linux.intel.com>
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

CMPccXADD is a new set of instructions in the latest Intel platform
Sierra Forest. This new instruction set includes a semaphore operation
that can compare and add the operands if condition is met, which can
improve database performance.

The bit definition:
CPUID.(EAX=7,ECX=1):EAX[bit 7]

Add CPUID definition for CMPCCXADD.

Signed-off-by: Jiaxi Chen <jiaxi.chen@linux.intel.com>
---
 target/i386/cpu.c | 2 +-
 target/i386/cpu.h | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 22b681ca37..a61f936eef 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -871,7 +871,7 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
         .type = CPUID_FEATURE_WORD,
         .feat_names = {
             NULL, NULL, NULL, NULL,
-            "avx-vnni", "avx512-bf16", NULL, NULL,
+            "avx-vnni", "avx512-bf16", NULL, "cmpccxadd",
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index d4bc19577a..3391b99456 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -900,6 +900,9 @@ uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
 #define CPUID_7_1_EAX_AVX_VNNI          (1U << 4)
 /* AVX512 BFloat16 Instruction */
 #define CPUID_7_1_EAX_AVX512_BF16       (1U << 5)
+/* CMPCCXADD Instructions */
+#define CPUID_7_1_EAX_CMPCCXADD         (1U << 7)
+
 /* XFD Extend Feature Disabled */
 #define CPUID_D_1_EAX_XFD               (1U << 4)
 
-- 
2.27.0


