Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 893396A9159
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 08:00:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXzOe-0000eK-4k; Fri, 03 Mar 2023 02:00:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tao1.su@linux.intel.com>)
 id 1pXzOa-0000cx-Qz
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 02:00:00 -0500
Received: from mga14.intel.com ([192.55.52.115])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tao1.su@linux.intel.com>)
 id 1pXzOZ-000591-9Q
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 02:00:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677826799; x=1709362799;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4LTjoHEcDyifKoH0BL+lwwYPesUz1LD6wixhga8t/KU=;
 b=av5QmnPggye2h7TYgM8dwYTko2V1+0wcwLJZgJwgLFnS/svf1uZizlfx
 ZGUXwSIjujkFaRCdJWc9QVmPAJTUWilLu3u44Yw/O6bjrNF0RFgLLJaEl
 bb3sJHLe8pH1qBbbEHNBuAqAu8FA4+vjqGa8xIpWNr2Hcjwg7e5hM/dLk
 p59NmgPBPwP5375+g84OS4Uq5bygJHbhwYpSiaF0KOZEm188FWJoj58yf
 PBa6HrMkA1QkLHd/ZrhNQDtxW1mIDWnxIh3HEFLMrDoZud0gu1rz4ZQ0n
 2F91pUBNexkSfj2DSlVSwqfNcSungqTF6fo18rYUIGTp1t0t8DkTEHOel A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="334995844"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; d="scan'208";a="334995844"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 22:59:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="668550479"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; d="scan'208";a="668550479"
Received: from linux.bj.intel.com ([10.238.157.63])
 by orsmga007.jf.intel.com with ESMTP; 02 Mar 2023 22:59:56 -0800
From: Tao Su <tao1.su@linux.intel.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, yang.zhong@intel.com,
 jing2.liu@intel.com, vkuznets@redhat.com, philmd@linaro.org
Subject: [PATCH v2 6/6] target/i386: Add support for PREFETCHIT0/1 in CPUID
 enumeration
Date: Fri,  3 Mar 2023 14:59:13 +0800
Message-Id: <20230303065913.1246327-7-tao1.su@linux.intel.com>
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

Latest Intel platform Granite Rapids has introduced a new instruction -
PREFETCHIT0/1, which moves code to memory (cache) closer to the
processor depending on specific hints.

The bit definition:
CPUID.(EAX=7,ECX=1):EDX[bit 14]

Add CPUID definition for PREFETCHIT0/1.

Signed-off-by: Jiaxi Chen <jiaxi.chen@linux.intel.com>
Signed-off-by: Tao Su <tao1.su@linux.intel.com>
---
 target/i386/cpu.c | 2 +-
 target/i386/cpu.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index eee1e5c25f..719e6a2636 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -894,7 +894,7 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
             NULL, NULL, NULL, NULL,
             "avx-vnni-int8", "avx-ne-convert", NULL, NULL,
             NULL, NULL, NULL, NULL,
-            NULL, NULL, NULL, NULL,
+            NULL, NULL, "prefetchiti", NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 14876938c1..febb1837d0 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -922,6 +922,8 @@ uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
 #define CPUID_7_1_EDX_AVX_VNNI_INT8     (1U << 4)
 /* AVX NE CONVERT Instructions */
 #define CPUID_7_1_EDX_AVX_NE_CONVERT    (1U << 5)
+/* PREFETCHIT0/1 Instructions */
+#define CPUID_7_1_EDX_PREFETCHITI       (1U << 14)
 
 /* XFD Extend Feature Disabled */
 #define CPUID_D_1_EAX_XFD               (1U << 4)
-- 
2.34.1


