Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6798B21EB9D
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jul 2020 10:41:46 +0200 (CEST)
Received: from localhost ([::1]:60968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jvGVV-0000zw-A2
	for lists+qemu-devel@lfdr.de; Tue, 14 Jul 2020 04:41:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1jvGU1-0007jI-HP
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 04:40:13 -0400
Received: from mga12.intel.com ([192.55.52.136]:43778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1jvGTy-0002ZH-Ki
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 04:40:13 -0400
IronPort-SDR: xBkMvAj/v2Lfzt49MBYZN1rSC6Z9Wb3D9K1K2yNs+QSnWrtuU2WeSTrU5W6RD9h2gV5L+AiU1j
 tD5J/1U/mQZA==
X-IronPort-AV: E=McAfee;i="6000,8403,9681"; a="128407132"
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; d="scan'208";a="128407132"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 01:40:07 -0700
IronPort-SDR: XdSkIQCDl8e0uvczau/C+Tn+6Yba+KCvbcwgI4+ZCY44tE4ba4gAC8AvMgAnJqavbBd1gcgVBr
 7oaTQEA9YWFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; d="scan'208";a="299464832"
Received: from chenyi-pc.sh.intel.com ([10.239.159.72])
 by orsmga002.jf.intel.com with ESMTP; 14 Jul 2020 01:40:06 -0700
From: Chenyi Qiang <chenyi.qiang@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH v6 1/3] target/i386: add fast short REP MOV support
Date: Tue, 14 Jul 2020 16:41:46 +0800
Message-Id: <20200714084148.26690-2-chenyi.qiang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200714084148.26690-1-chenyi.qiang@intel.com>
References: <20200714084148.26690-1-chenyi.qiang@intel.com>
Received-SPF: pass client-ip=192.55.52.136;
 envelope-from=chenyi.qiang@intel.com; helo=mga12.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/14 04:40:06
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, qemu-devel@nongnu.org,
 Robert Hoo <robert.hu@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For CPUs support fast short REP MOV[CPUID.(EAX=7,ECX=0):EDX(bit4)], e.g
Icelake and Tigerlake, expose it to the guest VM.

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
---
 target/i386/cpu.c | 2 +-
 target/i386/cpu.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 1e5123251d..55e063babe 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -984,7 +984,7 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
         .type = CPUID_FEATURE_WORD,
         .feat_names = {
             NULL, NULL, "avx512-4vnniw", "avx512-4fmaps",
-            NULL, NULL, NULL, NULL,
+            "fsrm", NULL, NULL, NULL,
             "avx512-vp2intersect", NULL, "md-clear", NULL,
             NULL, NULL, "serialize", NULL,
             "tsx-ldtrk", NULL, NULL /* pconfig */, NULL,
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 37fffa5cac..e1a5c174dc 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -775,6 +775,8 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 #define CPUID_7_0_EDX_AVX512_4VNNIW     (1U << 2)
 /* AVX512 Multiply Accumulation Single Precision */
 #define CPUID_7_0_EDX_AVX512_4FMAPS     (1U << 3)
+/* Fast Short Rep Mov */
+#define CPUID_7_0_EDX_FSRM              (1U << 4)
 /* AVX512 Vector Pair Intersection to a Pair of Mask Registers */
 #define CPUID_7_0_EDX_AVX512_VP2INTERSECT (1U << 8)
 /* SERIALIZE instruction */
-- 
2.17.1


