Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBE630BA7F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 10:02:05 +0100 (CET)
Received: from localhost ([::1]:55366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6rZU-0001cV-R7
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 04:02:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1l6rXF-00015b-IC
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 03:59:45 -0500
Received: from mga07.intel.com ([134.134.136.100]:32943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1l6rXC-00057O-R6
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 03:59:45 -0500
IronPort-SDR: Dp+aUk9n5cnnQoUykQppjRN4h5T8YvoeDyawT/UXk4Y2h0mUjGEJFc7q7sGlf19egEYaZEBLLi
 6DtESXPu6bEg==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="244903955"
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; d="scan'208";a="244903955"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2021 00:59:35 -0800
IronPort-SDR: k3PxExP0FG2pg7g0NQhBnxjLml6VauxDV9/z6HjAjcDTNzoOUT0otD3lOTT9PLvTTJzhgOrdRw
 sINqk9Iuk7aQ==
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; d="scan'208";a="371877776"
Received: from chenyi-pc.sh.intel.com ([10.239.159.24])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2021 00:59:27 -0800
From: Chenyi Qiang <chenyi.qiang@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Xiaoyao Li <xiaoyao.li@intel.com>
Subject: [PATCH] target/i386: Add bus lock debug exception support
Date: Tue,  2 Feb 2021 17:02:24 +0800
Message-Id: <20210202090224.13274-1-chenyi.qiang@intel.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=chenyi.qiang@intel.com; helo=mga07.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Bus lock debug exception is a feature that can notify the kernel by
generate an #DB trap after the instruction acquires a bus lock when
CPL>0. This allows the kernel to enforce user application throttling or
mitigations.

This feature is enumerated via CPUID.(EAX=7,ECX=0).ECX[bit 24].

Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
---
 target/i386/cpu.c | 2 +-
 target/i386/cpu.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index ae89024d36..55f3b5829f 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -963,7 +963,7 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
             "avx512bitalg", NULL, "avx512-vpopcntdq", NULL,
             "la57", NULL, NULL, NULL,
             NULL, NULL, "rdpid", NULL,
-            NULL, "cldemote", NULL, "movdiri",
+            "bus-lock-detect", "cldemote", NULL, "movdiri",
             "movdir64b", NULL, NULL, NULL,
         },
         .cpuid = {
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index d23a5b340a..417f49b721 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -762,6 +762,8 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 #define CPUID_7_0_ECX_LA57              (1U << 16)
 /* Read Processor ID */
 #define CPUID_7_0_ECX_RDPID             (1U << 22)
+/* Bus Lock Debug Exception */
+#define CPUID_7_0_ECX_BUS_LOCK_DETECT   (1U << 24)
 /* Cache Line Demote Instruction */
 #define CPUID_7_0_ECX_CLDEMOTE          (1U << 25)
 /* Move Doubleword as Direct Store Instruction */
-- 
2.17.1


