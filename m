Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B282DBB50
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 07:42:12 +0100 (CET)
Received: from localhost ([::1]:41142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpQVm-0006wF-IJ
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 01:42:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cathy.zhang@intel.com>)
 id 1kpQRF-0004lH-9D
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 01:37:29 -0500
Received: from mga09.intel.com ([134.134.136.24]:45702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cathy.zhang@intel.com>)
 id 1kpQRB-0007fs-VB
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 01:37:27 -0500
IronPort-SDR: 229uog/JwbOJAAaXF73evRsyA56N+m31X6/QU3YiC8KCO9mhtCmwd4Dv/UO53insVbVw7ajYkB
 or2XRCOnpeGg==
X-IronPort-AV: E=McAfee;i="6000,8403,9836"; a="175161457"
X-IronPort-AV: E=Sophos;i="5.78,423,1599548400"; d="scan'208";a="175161457"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2020 22:37:21 -0800
IronPort-SDR: wMpBvMkB/p2NbARgjhhVjsC92e6aZPcIeIqwaMHab/ZX77fAGzhg8DaxVqm/p43mkbg0ndzmcN
 0NWbSJveRDKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,423,1599548400"; d="scan'208";a="338144970"
Received: from cathy-vostro-3670.bj.intel.com ([10.238.156.128])
 by fmsmga008.fm.intel.com with ESMTP; 15 Dec 2020 22:37:19 -0800
From: Cathy Zhang <cathy.zhang@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] x86/cpu: Add AVX512_FP16 cpu feature
Date: Thu, 17 Dec 2020 06:40:02 +0800
Message-Id: <20201216224002.32677-1-cathy.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=134.134.136.24;
 envelope-from=cathy.zhang@intel.com; helo=mga09.intel.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DATE_IN_FUTURE_12_24=3.199,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, ehabkost@redhat.com,
 cathy.zhang@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

AVX512 Half-precision floating point (FP16) has better performance
compared to FP32 if the presicion or magnitude requirements are met.
It's defined as CPUID.(EAX=7,ECX=0):EDX[bit 23].

Refer to
https://software.intel.com/content/www/us/en/develop/download/\
intel-architecture-instruction-set-extensions-programming-reference.html

Signed-off-by: Cathy Zhang <cathy.zhang@intel.com>
---
 target/i386/cpu.c | 2 +-
 target/i386/cpu.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index ca997a68cd..c4d623b8b9 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -979,7 +979,7 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
             "avx512-vp2intersect", NULL, "md-clear", NULL,
             NULL, NULL, "serialize", NULL,
             "tsx-ldtrk", NULL, NULL /* pconfig */, NULL,
-            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, "avx512-fp16",
             NULL, NULL, "spec-ctrl", "stibp",
             NULL, "arch-capabilities", "core-capability", "ssbd",
         },
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index c4a49c06a8..6fd675c654 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -784,6 +784,8 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 #define CPUID_7_0_EDX_SERIALIZE         (1U << 14)
 /* TSX Suspend Load Address Tracking instruction */
 #define CPUID_7_0_EDX_TSX_LDTRK         (1U << 16)
+/* AVX512_FP16 instruction */
+#define CPUID_7_0_EDX_AVX512_FP16       (1U << 23)
 /* Speculation Control */
 #define CPUID_7_0_EDX_SPEC_CTRL         (1U << 26)
 /* Single Thread Indirect Branch Predictors */
-- 
2.17.1


