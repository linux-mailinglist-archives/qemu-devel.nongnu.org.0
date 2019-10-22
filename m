Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33352DFE7E
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Oct 2019 09:42:30 +0200 (CEST)
Received: from localhost ([::1]:51156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMooH-0006rM-9q
	for lists+qemu-devel@lfdr.de; Tue, 22 Oct 2019 03:42:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40884)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cathy.zhang@intel.com>) id 1iMol9-0003gj-UT
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 03:39:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cathy.zhang@intel.com>) id 1iMol8-00049q-Id
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 03:39:15 -0400
Received: from mga11.intel.com ([192.55.52.93]:62449)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cathy.zhang@intel.com>)
 id 1iMol8-00047q-9w
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 03:39:14 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Oct 2019 00:39:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,326,1566889200"; d="scan'208";a="209615716"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.238.156.101])
 by fmsmga001.fm.intel.com with ESMTP; 22 Oct 2019 00:39:07 -0700
From: Cathy Zhang <cathy.zhang@intel.com>
To: qemu-devel@nongnu.org
Subject: [Resend PATCH 3/3] i386: Add new CPU model Cooperlake
Date: Tue, 22 Oct 2019 15:35:28 +0800
Message-Id: <1571729728-23284-4-git-send-email-cathy.zhang@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1571729728-23284-1-git-send-email-cathy.zhang@intel.com>
References: <1571729728-23284-1-git-send-email-cathy.zhang@intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.93
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
Cc: Cathy Zhang <cathy.zhang@intel.com>, pbonzini@redhat.com,
 ehabkost@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cooper Lake is intel's successor to Cascade Lake, the new
CPU model inherits features from Cascadelake-Server, while
add one platform associated new feature: AVX512_BF16. Meanwhile,
add STIBP for speculative execution.

Signed-off-by: Cathy Zhang <cathy.zhang@intel.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Reviewed-by: Tao Xu <tao3.xu@intel.com>
---
 target/i386/cpu.c | 60 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 44f1bbd..630a190 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -2612,6 +2612,66 @@ static X86CPUDefinition builtin_x86_defs[] = {
         }
     },
     {
+        .name = "Cooperlake",
+        .level = 0xd,
+        .vendor = CPUID_VENDOR_INTEL,
+        .family = 6,
+        .model = 85,
+        .stepping = 10,
+        .features[FEAT_1_EDX] =
+            CPUID_VME | CPUID_SSE2 | CPUID_SSE | CPUID_FXSR | CPUID_MMX |
+            CPUID_CLFLUSH | CPUID_PSE36 | CPUID_PAT | CPUID_CMOV | CPUID_MCA |
+            CPUID_PGE | CPUID_MTRR | CPUID_SEP | CPUID_APIC | CPUID_CX8 |
+            CPUID_MCE | CPUID_PAE | CPUID_MSR | CPUID_TSC | CPUID_PSE |
+            CPUID_DE | CPUID_FP87,
+        .features[FEAT_1_ECX] =
+            CPUID_EXT_AVX | CPUID_EXT_XSAVE | CPUID_EXT_AES |
+            CPUID_EXT_POPCNT | CPUID_EXT_X2APIC | CPUID_EXT_SSE42 |
+            CPUID_EXT_SSE41 | CPUID_EXT_CX16 | CPUID_EXT_SSSE3 |
+            CPUID_EXT_PCLMULQDQ | CPUID_EXT_SSE3 |
+            CPUID_EXT_TSC_DEADLINE_TIMER | CPUID_EXT_FMA | CPUID_EXT_MOVBE |
+            CPUID_EXT_PCID | CPUID_EXT_F16C | CPUID_EXT_RDRAND,
+        .features[FEAT_8000_0001_EDX] =
+            CPUID_EXT2_LM | CPUID_EXT2_PDPE1GB | CPUID_EXT2_RDTSCP |
+            CPUID_EXT2_NX | CPUID_EXT2_SYSCALL,
+        .features[FEAT_8000_0001_ECX] =
+            CPUID_EXT3_ABM | CPUID_EXT3_LAHF_LM | CPUID_EXT3_3DNOWPREFETCH,
+        .features[FEAT_7_0_EBX] =
+            CPUID_7_0_EBX_FSGSBASE | CPUID_7_0_EBX_BMI1 |
+            CPUID_7_0_EBX_HLE | CPUID_7_0_EBX_AVX2 | CPUID_7_0_EBX_SMEP |
+            CPUID_7_0_EBX_BMI2 | CPUID_7_0_EBX_ERMS | CPUID_7_0_EBX_INVPCID |
+            CPUID_7_0_EBX_RTM | CPUID_7_0_EBX_RDSEED | CPUID_7_0_EBX_ADX |
+            CPUID_7_0_EBX_SMAP | CPUID_7_0_EBX_CLWB |
+            CPUID_7_0_EBX_AVX512F | CPUID_7_0_EBX_AVX512DQ |
+            CPUID_7_0_EBX_AVX512BW | CPUID_7_0_EBX_AVX512CD |
+            CPUID_7_0_EBX_AVX512VL | CPUID_7_0_EBX_CLFLUSHOPT,
+        .features[FEAT_7_0_ECX] =
+            CPUID_7_0_ECX_PKU |
+            CPUID_7_0_ECX_AVX512VNNI,
+        .features[FEAT_7_0_EDX] =
+            CPUID_7_0_EDX_SPEC_CTRL | CPUID_7_0_EDX_STIBP |
+            CPUID_7_0_EDX_SPEC_CTRL_SSBD | CPUID_7_0_EDX_ARCH_CAPABILITIES,
+        .features[FEAT_ARCH_CAPABILITIES] =
+            MSR_ARCH_CAP_RDCL_NO | MSR_ARCH_CAP_IBRS_ALL |
+            MSR_ARCH_CAP_SKIP_L1DFL_VMENTRY | MSR_ARCH_CAP_MDS_NO,
+        .features[FEAT_7_1_EAX] =
+            CPUID_7_1_EAX_AVX512_BF16,
+        /*
+         * Missing: XSAVES (not supported by some Linux versions,
+         * including v4.1 to v4.12).
+         * KVM doesn't yet expose any XSAVES state save component,
+         * and the only one defined in Skylake (processor tracing)
+         * probably will block migration anyway.
+         */
+        .features[FEAT_XSAVE] =
+            CPUID_XSAVE_XSAVEOPT | CPUID_XSAVE_XSAVEC |
+            CPUID_XSAVE_XGETBV1,
+        .features[FEAT_6_EAX] =
+            CPUID_6_EAX_ARAT,
+        .xlevel = 0x80000008,
+        .model_id = "Intel Xeon Processor (Cooperlake)",
+    },
+    {
         .name = "Icelake-Client",
         .level = 0xd,
         .vendor = CPUID_VENDOR_INTEL,
-- 
1.8.3.1


