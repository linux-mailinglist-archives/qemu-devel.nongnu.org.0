Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C316A915B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 08:00:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXzOW-0000bp-KN; Fri, 03 Mar 2023 01:59:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tao1.su@linux.intel.com>)
 id 1pXzOU-0000bH-9s
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 01:59:54 -0500
Received: from mga14.intel.com ([192.55.52.115])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tao1.su@linux.intel.com>)
 id 1pXzOS-00057t-R9
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 01:59:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677826792; x=1709362792;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nIfr9IgVBja5W4MsEkFeLW5sSoifL0b5ahfISwnYjZs=;
 b=a+CBW9QrzE8Pu7zLGXGZ6In9eSl01TY+GZyt0s4hQ3apz74WM+9WtUSw
 DNJ4N2rII5LkUSTDNUfcP33AioEnBJDnmgEbCbgiWern6rvwA2J+u/r65
 pj1HpSavVkqYfsPRJvU+WgXyUMjN65rdUboVUW8ggXJ+e9ZMCBYMxDWVd
 ekbAEPC+snnP90EPUnaN/erwjxBgvV5r4BZC7NoAo9R5Vj6bls/BSgmPt
 O2LLd1kMnUZCZcJCeUH+2s9cqbiSHrVRRzeXWTJJxovbZLMoglMn0HeTD
 ZDzvtpBGqmx+qlHQIJrz2iQElyOTx64ObpQBkva0da9XENGCR7qABTlR+ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="334995822"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; d="scan'208";a="334995822"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 22:59:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="668550439"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; d="scan'208";a="668550439"
Received: from linux.bj.intel.com ([10.238.157.63])
 by orsmga007.jf.intel.com with ESMTP; 02 Mar 2023 22:59:49 -0800
From: Tao Su <tao1.su@linux.intel.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, yang.zhong@intel.com,
 jing2.liu@intel.com, vkuznets@redhat.com, philmd@linaro.org
Subject: [PATCH v2 3/6] target/i386: Add support for AVX-IFMA in CPUID
 enumeration
Date: Fri,  3 Mar 2023 14:59:10 +0800
Message-Id: <20230303065913.1246327-4-tao1.su@linux.intel.com>
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

AVX-IFMA is a new instruction in the latest Intel platform Sierra
Forest. This instruction packed multiplies unsigned 52-bit integers and
adds the low/high 52-bit products to Qword Accumulators.

The bit definition:
CPUID.(EAX=7,ECX=1):EAX[bit 23]

Add CPUID definition for AVX-IFMA.

Signed-off-by: Jiaxi Chen <jiaxi.chen@linux.intel.com>
Signed-off-by: Tao Su <tao1.su@linux.intel.com>
---
 target/i386/cpu.c | 2 +-
 target/i386/cpu.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index ed08a52619..9aaa373e97 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -876,7 +876,7 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
             NULL, NULL, "fzrm", "fsrs",
             "fsrc", NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
-            NULL, "amx-fp16", NULL, NULL,
+            NULL, "amx-fp16", NULL, "avx-ifma",
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
         },
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index ae6a0fdfc2..8e50617efb 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -914,6 +914,8 @@ uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
 #define CPUID_7_1_EAX_FSRC              (1U << 12)
 /* Support Tile Computational Operations on FP16 Numbers */
 #define CPUID_7_1_EAX_AMX_FP16          (1U << 21)
+/* Support for VPMADD52[H,L]UQ */
+#define CPUID_7_1_EAX_AVX_IFMA          (1U << 23)
 
 /* XFD Extend Feature Disabled */
 #define CPUID_D_1_EAX_XFD               (1U << 4)
-- 
2.34.1


