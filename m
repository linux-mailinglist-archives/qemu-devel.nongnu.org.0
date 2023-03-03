Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 300456A915A
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 08:00:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXzOU-0000aL-9r; Fri, 03 Mar 2023 01:59:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tao1.su@linux.intel.com>)
 id 1pXzOS-0000a9-In
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 01:59:52 -0500
Received: from mga14.intel.com ([192.55.52.115])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tao1.su@linux.intel.com>)
 id 1pXzOQ-00057t-Pr
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 01:59:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677826790; x=1709362790;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WXXlRh6R6FikHSVdT8dpz2Fxx+5hPhBYSaOJ+6oH2KY=;
 b=JySVBOkiYFqkRUWCNz2k9ATS9WMmDnrRUH2yYF5cIdTto0cjAdmXyfQW
 dBN9CQfLMPdzzix/oexV9pXO9A6LkrU5S2n7VDHXHBqCISNcfu7gsg5Mo
 l+EhJq/ni1hx6mOxEAYLPBDtvkRFrXdNSmo65o30sW7K9liUScJxlw+58
 3HyB7HkAH8eeU3XTOvnkJ1Qp1vsuuam7cmD7fkTVWwf79+B9av3DP7EsQ
 bS03hyX3ZOuPtux4cQDclr9dr61WSbCXmSLeH5GbvAb5kOzhBdoBwria6
 zcWilWXbMvNqsJpMLahHBVAyeailCrdLyd9jua5DxigJrj4//jPFwOYof A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="334995813"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; d="scan'208";a="334995813"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 22:59:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="668550426"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; d="scan'208";a="668550426"
Received: from linux.bj.intel.com ([10.238.157.63])
 by orsmga007.jf.intel.com with ESMTP; 02 Mar 2023 22:59:47 -0800
From: Tao Su <tao1.su@linux.intel.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, yang.zhong@intel.com,
 jing2.liu@intel.com, vkuznets@redhat.com, philmd@linaro.org
Subject: [PATCH v2 2/6] target/i386: Add support for AMX-FP16 in CPUID
 enumeration
Date: Fri,  3 Mar 2023 14:59:09 +0800
Message-Id: <20230303065913.1246327-3-tao1.su@linux.intel.com>
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
AMX-FP16, which performs dot-products of two FP16 tiles and accumulates
the results into a packed single precision tile. AMX-FP16 adds FP16
capability and allows a FP16 GPU trained model to run faster without
loss of accuracy or added SW overhead.

The bit definition:
CPUID.(EAX=7,ECX=1):EAX[bit 21]

Add CPUID definition for AMX-FP16.

Signed-off-by: Jiaxi Chen <jiaxi.chen@linux.intel.com>
Signed-off-by: Tao Su <tao1.su@linux.intel.com>
---
 target/i386/cpu.c | 2 +-
 target/i386/cpu.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index e54e13d050..ed08a52619 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -876,7 +876,7 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
             NULL, NULL, "fzrm", "fsrs",
             "fsrc", NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
-            NULL, NULL, NULL, NULL,
+            NULL, "amx-fp16", NULL, NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
         },
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 7df8f4b8f9..ae6a0fdfc2 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -912,6 +912,8 @@ uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
 #define CPUID_7_1_EAX_FSRS              (1U << 11)
 /* Fast Short REP CMPS/SCAS */
 #define CPUID_7_1_EAX_FSRC              (1U << 12)
+/* Support Tile Computational Operations on FP16 Numbers */
+#define CPUID_7_1_EAX_AMX_FP16          (1U << 21)
 
 /* XFD Extend Feature Disabled */
 #define CPUID_D_1_EAX_XFD               (1U << 4)
-- 
2.34.1


