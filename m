Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7076A9157
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 08:00:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXzOc-0000d6-0j; Fri, 03 Mar 2023 02:00:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tao1.su@linux.intel.com>)
 id 1pXzOZ-0000cj-QH
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 01:59:59 -0500
Received: from mga14.intel.com ([192.55.52.115])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tao1.su@linux.intel.com>)
 id 1pXzOY-00058r-5g
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 01:59:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677826798; x=1709362798;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5Nmpat1Y+L5zLRFGcXs5Z2PpGLMe9rxWwLnSk7OO6UM=;
 b=DJq/csDwfE1/5JQ9Ra+TnL9zKtPyv9lbfjE+7VSSGLPV/uY2YPpeIjo9
 5SHkVLagFTJX8DiO5dyAJ1y7ZLcTG6Us7MjiVnHhUDdfNl1jJ9PrMy3Rw
 uzK9D0QZKp/yOUMPEIRb+exLipwAqgwWkPYKO++jcxw5r2Pr/9Ksn8ClX
 zfzXc/NxhSnNgMGpXD7Z6EpXf5k1vkJJpz5KaHP9foL85eiUOHZv02pvQ
 KvSo4qh84wSN0cJRLPjr2tH3cUdHatUCzFVOcNF1RSnVZg3L7TTVmEOS7
 rwniyu9C7SD5GFoyWP8gWgX+qO29teNoWejbgr9rtwp4lE0BJAr7v9WIR w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="334995838"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; d="scan'208";a="334995838"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 22:59:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="668550470"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; d="scan'208";a="668550470"
Received: from linux.bj.intel.com ([10.238.157.63])
 by orsmga007.jf.intel.com with ESMTP; 02 Mar 2023 22:59:54 -0800
From: Tao Su <tao1.su@linux.intel.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, yang.zhong@intel.com,
 jing2.liu@intel.com, vkuznets@redhat.com, philmd@linaro.org
Subject: [PATCH v2 5/6] target/i386: Add support for AVX-NE-CONVERT in CPUID
 enumeration
Date: Fri,  3 Mar 2023 14:59:12 +0800
Message-Id: <20230303065913.1246327-6-tao1.su@linux.intel.com>
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

AVX-NE-CONVERT is a new set of instructions which can convert low
precision floating point like BF16/FP16 to high precision floating point
FP32, as well as convert FP32 elements to BF16. This instruction allows
the platform to have improved AI capabilities and better compatibility.

The bit definition:
CPUID.(EAX=7,ECX=1):EDX[bit 5]

Add CPUID definition for AVX-NE-CONVERT.

Signed-off-by: Jiaxi Chen <jiaxi.chen@linux.intel.com>
Signed-off-by: Tao Su <tao1.su@linux.intel.com>
---
 target/i386/cpu.c | 2 +-
 target/i386/cpu.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 246d10aa49..eee1e5c25f 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -892,7 +892,7 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
         .type = CPUID_FEATURE_WORD,
         .feat_names = {
             NULL, NULL, NULL, NULL,
-            "avx-vnni-int8", NULL, NULL, NULL,
+            "avx-vnni-int8", "avx-ne-convert", NULL, NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index d53b960f23..14876938c1 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -920,6 +920,8 @@ uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
 
 /* Support for VPDPB[SU,UU,SS]D[,S] */
 #define CPUID_7_1_EDX_AVX_VNNI_INT8     (1U << 4)
+/* AVX NE CONVERT Instructions */
+#define CPUID_7_1_EDX_AVX_NE_CONVERT    (1U << 5)
 
 /* XFD Extend Feature Disabled */
 #define CPUID_D_1_EAX_XFD               (1U << 4)
-- 
2.34.1


