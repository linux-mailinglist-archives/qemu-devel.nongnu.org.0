Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA6F5D4CD
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 18:52:15 +0200 (CEST)
Received: from localhost ([::1]:55212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiM0s-0001xz-Kb
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 12:52:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38058)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ehabkost@redhat.com>) id 1hiKqY-0000qC-7k
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 11:37:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1hiKqW-0006zs-4I
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 11:37:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48355)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hiKqU-0006s3-13
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 11:37:27 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4CED430872EE;
 Tue,  2 Jul 2019 15:37:06 +0000 (UTC)
Received: from localhost (ovpn-116-30.gru2.redhat.com [10.97.116.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1EC4E78375;
 Tue,  2 Jul 2019 15:36:54 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>
Date: Tue,  2 Jul 2019 12:35:24 -0300
Message-Id: <20190702153535.9851-32-ehabkost@redhat.com>
In-Reply-To: <20190702153535.9851-1-ehabkost@redhat.com>
References: <20190702153535.9851-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Tue, 02 Jul 2019 15:37:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL v3 31/42] i386: Introduce SnowRidge CPU model
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
Cc: Paul Lai <paul.c.lai@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paul Lai <paul.c.lai@intel.com>

SnowRidge CPU supports Accelerator Infrastrcture Architecture (MOVDIRI,
MOVDIR64B), CLDEMOTE and SPLIT_LOCK_DISABLE.

MOVDIRI, MOVDIR64B, and CLDEMOTE are found via CPUID.
The availability of SPLIT_LOCK_DISABLE is check via msr access

References can be found in either:
 https://software.intel.com/en-us/articles/intel-sdm
 https://software.intel.com/en-us/download/intel-architecture-instruction-set-extensions-and-future-features-programming-reference

Signed-off-by: Paul Lai <paul.c.lai@intel.com>
Tested-by: Tao3 Xu <tao3.xu@intel.com>
Message-Id: <20190626162129.25345-1-paul.c.lai@intel.com>
[ehabkost: squashed SPLIT_LOCK_DETECT patch]
Message-Id: <20190626163232.25711-1-paul.c.lai@intel.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/cpu.c | 71 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index ea52db0600..6c04a258ed 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -2688,6 +2688,77 @@ static X86CPUDefinition builtin_x86_defs[] = {
         .xlevel = 0x80000008,
         .model_id = "Intel Xeon Processor (Icelake)",
     },
+    {
+        .name = "SnowRidge-Server",
+        .level = 27,
+        .vendor = CPUID_VENDOR_INTEL,
+        .family = 6,
+        .model = 134,
+        .stepping = 1,
+        .features[FEAT_1_EDX] =
+            /* missing: CPUID_PN CPUID_IA64 */
+            /* missing: CPUID_DTS, CPUID_HT, CPUID_TM, CPUID_PBE */
+            CPUID_FP87 | CPUID_VME | CPUID_DE | CPUID_PSE |
+            CPUID_TSC | CPUID_MSR | CPUID_PAE | CPUID_MCE |
+            CPUID_CX8 | CPUID_APIC | CPUID_SEP |
+            CPUID_MTRR | CPUID_PGE | CPUID_MCA | CPUID_CMOV |
+            CPUID_PAT | CPUID_PSE36 | CPUID_CLFLUSH |
+            CPUID_MMX |
+            CPUID_FXSR | CPUID_SSE | CPUID_SSE2,
+        .features[FEAT_1_ECX] =
+            CPUID_EXT_SSE3 | CPUID_EXT_PCLMULQDQ | CPUID_EXT_MONITOR |
+            CPUID_EXT_VMX |
+            CPUID_EXT_SSSE3 |
+            CPUID_EXT_CX16 |
+            CPUID_EXT_SSE41 |
+            CPUID_EXT_SSE42 | CPUID_EXT_X2APIC | CPUID_EXT_MOVBE |
+            CPUID_EXT_POPCNT |
+            CPUID_EXT_TSC_DEADLINE_TIMER | CPUID_EXT_AES | CPUID_EXT_XSAVE |
+            CPUID_EXT_RDRAND,
+        .features[FEAT_8000_0001_EDX] =
+            CPUID_EXT2_SYSCALL |
+            CPUID_EXT2_NX |
+            CPUID_EXT2_PDPE1GB | CPUID_EXT2_RDTSCP |
+            CPUID_EXT2_LM,
+        .features[FEAT_8000_0001_ECX] =
+            CPUID_EXT3_LAHF_LM |
+            CPUID_EXT3_3DNOWPREFETCH,
+        .features[FEAT_7_0_EBX] =
+            CPUID_7_0_EBX_FSGSBASE |
+            CPUID_7_0_EBX_SMEP |
+            CPUID_7_0_EBX_ERMS |
+            CPUID_7_0_EBX_MPX |  /* missing bits 13, 15 */
+            CPUID_7_0_EBX_RDSEED |
+            CPUID_7_0_EBX_SMAP | CPUID_7_0_EBX_CLFLUSHOPT |
+            CPUID_7_0_EBX_CLWB |
+            CPUID_7_0_EBX_SHA_NI,
+        .features[FEAT_7_0_ECX] =
+            CPUID_7_0_ECX_UMIP |
+            /* missing bit 5 */
+            CPUID_7_0_ECX_GFNI |
+            CPUID_7_0_ECX_MOVDIRI | CPUID_7_0_ECX_CLDEMOTE |
+            CPUID_7_0_ECX_MOVDIR64B,
+        .features[FEAT_7_0_EDX] =
+            CPUID_7_0_EDX_SPEC_CTRL |
+            CPUID_7_0_EDX_ARCH_CAPABILITIES | CPUID_7_0_EDX_SPEC_CTRL_SSBD |
+            CPUID_7_0_EDX_CORE_CAPABILITY,
+        .features[FEAT_CORE_CAPABILITY] =
+            MSR_CORE_CAP_SPLIT_LOCK_DETECT,
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
+        .model_id = "Intel Atom Processor (SnowRidge)",
+    },
     {
         .name = "KnightsMill",
         .level = 0xd,
-- 
2.18.0.rc1.1.g3f1ff2140


