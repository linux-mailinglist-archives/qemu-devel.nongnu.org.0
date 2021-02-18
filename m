Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A57F531F30B
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 00:26:50 +0100 (CET)
Received: from localhost ([::1]:45466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCsh7-0003hQ-Mj
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 18:26:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lCsep-00020S-DW
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 18:24:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lCsel-00012M-Py
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 18:24:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613690660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KikE65RpCh0xiPveF6HVoS/0p0vfVKKLIW1+OxrtMNI=;
 b=MJ4/P0bfJnFqkpDAlL4r8TyhWisSzwKmGqWNbF3S5ffgUoqAdiTjXjyO4fZdRof1Gp4+zt
 BlntNT6DPSsvbKtbmy5LNiFtHKbXRhx8R/2hdk9+MvJF2SAe7wUOu6z9BegS+IDpo836+5
 EuWqEJ+kNUIFkVAZ6lLP2CsAPB7ZvrU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-1UbObTBXMgKTWrAPBdtskA-1; Thu, 18 Feb 2021 18:24:18 -0500
X-MC-Unique: 1UbObTBXMgKTWrAPBdtskA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1383C18449E7;
 Thu, 18 Feb 2021 23:24:17 +0000 (UTC)
Received: from localhost (ovpn-3-246.rdu2.redhat.com [10.22.3.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC1EF60BE5;
 Thu, 18 Feb 2021 23:24:16 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 1/3] i386: Add the support for AMD EPYC 3rd generation
 processors
Date: Thu, 18 Feb 2021 18:24:13 -0500
Message-Id: <20210218232415.1001078-2-ehabkost@redhat.com>
In-Reply-To: <20210218232415.1001078-1-ehabkost@redhat.com>
References: <20210218232415.1001078-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Babu Moger <babu.moger@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Babu Moger <babu.moger@amd.com>

Adds the support for AMD 3rd generation processors. The model
display for the new processor will be EPYC-Milan.

Adds the following new feature bits on top of the feature bits from
the first and second generation EPYC models.

pcid    : Process context identifiers support
ibrs    : Indirect Branch Restricted Speculation
ssbd    : Speculative Store Bypass Disable
erms    : Enhanced REP MOVSB/STOSB support
fsrm    : Fast Short REP MOVSB support
invpcid : Invalidate processor context ID
pku     : Protection keys support

[ehabkost: added "ibrs" to
 feature_word_info[CPUID_8000_0008_EBX_IBRS].feat_names[14]]

Signed-off-by: Babu Moger <babu.moger@amd.com>
Message-Id: <161133338780.27536.17735339269843944966.stgit@bmoger-ubuntu>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/cpu.h |   4 ++
 target/i386/cpu.c | 107 +++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 110 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 82c1ac00efa..8be39cfb62e 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -817,8 +817,12 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 #define CPUID_8000_0008_EBX_WBNOINVD    (1U << 9)
 /* Indirect Branch Prediction Barrier */
 #define CPUID_8000_0008_EBX_IBPB        (1U << 12)
+/* Indirect Branch Restricted Speculation */
+#define CPUID_8000_0008_EBX_IBRS        (1U << 14)
 /* Single Thread Indirect Branch Predictors */
 #define CPUID_8000_0008_EBX_STIBP       (1U << 15)
+/* Speculative Store Bypass Disable */
+#define CPUID_8000_0008_EBX_AMD_SSBD    (1U << 24)
 
 #define CPUID_XSAVE_XSAVEOPT   (1U << 0)
 #define CPUID_XSAVE_XSAVEC     (1U << 1)
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 20c3a5af3f8..e9c11b60510 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1033,7 +1033,7 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
             "clzero", NULL, "xsaveerptr", NULL,
             NULL, NULL, NULL, NULL,
             NULL, "wbnoinvd", NULL, NULL,
-            "ibpb", NULL, NULL, "amd-stibp",
+            "ibpb", NULL, "ibrs", "amd-stibp",
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
             "amd-ssbd", "virt-ssbd", "amd-no-ssb", NULL,
@@ -1798,6 +1798,56 @@ static CPUCaches epyc_rome_cache_info = {
     },
 };
 
+static CPUCaches epyc_milan_cache_info = {
+    .l1d_cache = &(CPUCacheInfo) {
+        .type = DATA_CACHE,
+        .level = 1,
+        .size = 32 * KiB,
+        .line_size = 64,
+        .associativity = 8,
+        .partitions = 1,
+        .sets = 64,
+        .lines_per_tag = 1,
+        .self_init = 1,
+        .no_invd_sharing = true,
+    },
+    .l1i_cache = &(CPUCacheInfo) {
+        .type = INSTRUCTION_CACHE,
+        .level = 1,
+        .size = 32 * KiB,
+        .line_size = 64,
+        .associativity = 8,
+        .partitions = 1,
+        .sets = 64,
+        .lines_per_tag = 1,
+        .self_init = 1,
+        .no_invd_sharing = true,
+    },
+    .l2_cache = &(CPUCacheInfo) {
+        .type = UNIFIED_CACHE,
+        .level = 2,
+        .size = 512 * KiB,
+        .line_size = 64,
+        .associativity = 8,
+        .partitions = 1,
+        .sets = 1024,
+        .lines_per_tag = 1,
+    },
+    .l3_cache = &(CPUCacheInfo) {
+        .type = UNIFIED_CACHE,
+        .level = 3,
+        .size = 32 * MiB,
+        .line_size = 64,
+        .associativity = 16,
+        .partitions = 1,
+        .sets = 32768,
+        .lines_per_tag = 1,
+        .self_init = true,
+        .inclusive = true,
+        .complex_indexing = true,
+    },
+};
+
 /* The following VMX features are not supported by KVM and are left out in the
  * CPU definitions:
  *
@@ -4130,6 +4180,61 @@ static X86CPUDefinition builtin_x86_defs[] = {
         .model_id = "AMD EPYC-Rome Processor",
         .cache_info = &epyc_rome_cache_info,
     },
+    {
+        .name = "EPYC-Milan",
+        .level = 0xd,
+        .vendor = CPUID_VENDOR_AMD,
+        .family = 25,
+        .model = 1,
+        .stepping = 1,
+        .features[FEAT_1_EDX] =
+            CPUID_SSE2 | CPUID_SSE | CPUID_FXSR | CPUID_MMX | CPUID_CLFLUSH |
+            CPUID_PSE36 | CPUID_PAT | CPUID_CMOV | CPUID_MCA | CPUID_PGE |
+            CPUID_MTRR | CPUID_SEP | CPUID_APIC | CPUID_CX8 | CPUID_MCE |
+            CPUID_PAE | CPUID_MSR | CPUID_TSC | CPUID_PSE | CPUID_DE |
+            CPUID_VME | CPUID_FP87,
+        .features[FEAT_1_ECX] =
+            CPUID_EXT_RDRAND | CPUID_EXT_F16C | CPUID_EXT_AVX |
+            CPUID_EXT_XSAVE | CPUID_EXT_AES |  CPUID_EXT_POPCNT |
+            CPUID_EXT_MOVBE | CPUID_EXT_SSE42 | CPUID_EXT_SSE41 |
+            CPUID_EXT_CX16 | CPUID_EXT_FMA | CPUID_EXT_SSSE3 |
+            CPUID_EXT_MONITOR | CPUID_EXT_PCLMULQDQ | CPUID_EXT_SSE3 |
+            CPUID_EXT_PCID,
+        .features[FEAT_8000_0001_EDX] =
+            CPUID_EXT2_LM | CPUID_EXT2_RDTSCP | CPUID_EXT2_PDPE1GB |
+            CPUID_EXT2_FFXSR | CPUID_EXT2_MMXEXT | CPUID_EXT2_NX |
+            CPUID_EXT2_SYSCALL,
+        .features[FEAT_8000_0001_ECX] =
+            CPUID_EXT3_OSVW | CPUID_EXT3_3DNOWPREFETCH |
+            CPUID_EXT3_MISALIGNSSE | CPUID_EXT3_SSE4A | CPUID_EXT3_ABM |
+            CPUID_EXT3_CR8LEG | CPUID_EXT3_SVM | CPUID_EXT3_LAHF_LM |
+            CPUID_EXT3_TOPOEXT | CPUID_EXT3_PERFCORE,
+        .features[FEAT_8000_0008_EBX] =
+            CPUID_8000_0008_EBX_CLZERO | CPUID_8000_0008_EBX_XSAVEERPTR |
+            CPUID_8000_0008_EBX_WBNOINVD | CPUID_8000_0008_EBX_IBPB |
+            CPUID_8000_0008_EBX_IBRS | CPUID_8000_0008_EBX_STIBP |
+            CPUID_8000_0008_EBX_AMD_SSBD,
+        .features[FEAT_7_0_EBX] =
+            CPUID_7_0_EBX_FSGSBASE | CPUID_7_0_EBX_BMI1 | CPUID_7_0_EBX_AVX2 |
+            CPUID_7_0_EBX_SMEP | CPUID_7_0_EBX_BMI2 | CPUID_7_0_EBX_RDSEED |
+            CPUID_7_0_EBX_ADX | CPUID_7_0_EBX_SMAP | CPUID_7_0_EBX_CLFLUSHOPT |
+            CPUID_7_0_EBX_SHA_NI | CPUID_7_0_EBX_CLWB | CPUID_7_0_EBX_ERMS |
+            CPUID_7_0_EBX_INVPCID,
+        .features[FEAT_7_0_ECX] =
+            CPUID_7_0_ECX_UMIP | CPUID_7_0_ECX_RDPID | CPUID_7_0_ECX_PKU,
+        .features[FEAT_7_0_EDX] =
+            CPUID_7_0_EDX_FSRM,
+        .features[FEAT_XSAVE] =
+            CPUID_XSAVE_XSAVEOPT | CPUID_XSAVE_XSAVEC |
+            CPUID_XSAVE_XGETBV1 | CPUID_XSAVE_XSAVES,
+        .features[FEAT_6_EAX] =
+            CPUID_6_EAX_ARAT,
+        .features[FEAT_SVM] =
+            CPUID_SVM_NPT | CPUID_SVM_NRIPSAVE,
+        .xlevel = 0x8000001E,
+        .model_id = "AMD EPYC-Milan Processor",
+        .cache_info = &epyc_milan_cache_info,
+    },
 };
 
 /* KVM-specific features that are automatically added/removed
-- 
2.28.0


