Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D806A915E
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 08:01:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXzOU-0000bI-VR; Fri, 03 Mar 2023 01:59:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tao1.su@linux.intel.com>)
 id 1pXzOR-0000Zp-Ha
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 01:59:51 -0500
Received: from mga14.intel.com ([192.55.52.115])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tao1.su@linux.intel.com>)
 id 1pXzOP-00057Q-PE
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 01:59:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677826789; x=1709362789;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i8Sk9qWmSg4uuzmLB8SgkRYtmRAH6MFLLvRbThTSOEU=;
 b=dvGwEW9qOsrH8CEtPjDC1qfRacBg33a4YYtQAu2MSrpDWPKhFvHj77gu
 KHE1CnuxHL33O82fH8LpqOd15xcIuwgmml5X503MMTOKYQ+oU+Xm4ZAuu
 qb8eXa/OlWegvKp+28YXW/M5sBC+tqyOLnlLgnZPXMvkexKwVAv2FfxR6
 7hfZL0mts/dG59x6oZL7qQ78+d1xT4JLwYO8AgB2LMOO0xa+RHArzMDjK
 1a0nI0D9g8EiMK6pGY6fhXgQ+eF9j0DDRugAcjTrys5VVfEPb8XZ3sZbb
 aepFURl37BhKQlKXBlBguB2wyraBrF+6yscsHgQolsoOjCXpSfWgIQp3/ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="334995798"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; d="scan'208";a="334995798"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 22:59:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="668550415"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; d="scan'208";a="668550415"
Received: from linux.bj.intel.com ([10.238.157.63])
 by orsmga007.jf.intel.com with ESMTP; 02 Mar 2023 22:59:45 -0800
From: Tao Su <tao1.su@linux.intel.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, yang.zhong@intel.com,
 jing2.liu@intel.com, vkuznets@redhat.com, philmd@linaro.org
Subject: [PATCH v2 1/6] target/i386: Add support for CMPCCXADD in CPUID
 enumeration
Date: Fri,  3 Mar 2023 14:59:08 +0800
Message-Id: <20230303065913.1246327-2-tao1.su@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303065913.1246327-1-tao1.su@linux.intel.com>
References: <20230303065913.1246327-1-tao1.su@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.115;
 envelope-from=tao1.su@linux.intel.com; helo=mga14.intel.com
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

From: Jiaxi Chen <jiaxi.chen@linux.intel.com>

CMPccXADD is a new set of instructions in the latest Intel platform
Sierra Forest. This new instruction set includes a semaphore operation
that can compare and add the operands if condition is met, which can
improve database performance.

The bit definition:
CPUID.(EAX=7,ECX=1):EAX[bit 7]

Add CPUID definition for CMPCCXADD.

Signed-off-by: Jiaxi Chen <jiaxi.chen@linux.intel.com>
Signed-off-by: Tao Su <tao1.su@linux.intel.com>
---
 target/i386/cpu.c | 2 +-
 target/i386/cpu.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 4bad3d41d3..e54e13d050 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -872,7 +872,7 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
         .type = CPUID_FEATURE_WORD,
         .feat_names = {
             NULL, NULL, NULL, NULL,
-            "avx-vnni", "avx512-bf16", NULL, NULL,
+            "avx-vnni", "avx512-bf16", NULL, "cmpccxadd",
             NULL, NULL, "fzrm", "fsrs",
             "fsrc", NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index ea650e68a3..7df8f4b8f9 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -904,6 +904,8 @@ uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
 #define CPUID_7_1_EAX_AVX_VNNI          (1U << 4)
 /* AVX512 BFloat16 Instruction */
 #define CPUID_7_1_EAX_AVX512_BF16       (1U << 5)
+/* CMPCCXADD Instructions */
+#define CPUID_7_1_EAX_CMPCCXADD         (1U << 7)
 /* Fast Zero REP MOVS */
 #define CPUID_7_1_EAX_FZRM              (1U << 10)
 /* Fast Short REP STOS */
-- 
2.34.1


