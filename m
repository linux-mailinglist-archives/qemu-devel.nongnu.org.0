Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC571391A91
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 16:44:52 +0200 (CEST)
Received: from localhost ([::1]:55874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llumB-0004O6-S2
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 10:44:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lluiV-0005P1-Tv
 for qemu-devel@nongnu.org; Wed, 26 May 2021 10:41:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lluiR-0007wV-RQ
 for qemu-devel@nongnu.org; Wed, 26 May 2021 10:41:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622040059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=koawmmpzVH85z7deJTRI0jHlOJdZMBJO/cAcReqVFJo=;
 b=N7HB/A6KDIAkitRLxC9skk55Ut89V3X9ENdlmFH+I9qwcfPjzrVEBrll70Ih4XNGPvJK5n
 1PzuLSCLnukwdYERSR9s/hTnI04g5cHWASEBbBnL1EiD5I2ejmZQBClJqqEisdau2X93tN
 tQ4oWb8QkrM7lQ3Y20AtaUHBXyHWJlE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-R6Fba7KXNnaX1ajnDR8oBQ-1; Wed, 26 May 2021 10:40:57 -0400
X-MC-Unique: R6Fba7KXNnaX1ajnDR8oBQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60484800D62;
 Wed, 26 May 2021 14:40:56 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-19.ams2.redhat.com
 [10.36.115.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D6A435D9C6;
 Wed, 26 May 2021 14:40:49 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/4] target/i386: define CPU models to model x86-64 ABI
 levels
Date: Wed, 26 May 2021 15:40:36 +0100
Message-Id: <20210526144038.278899-3-berrange@redhat.com>
In-Reply-To: <20210526144038.278899-1-berrange@redhat.com>
References: <20210526144038.278899-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To paraphrase:

  https://developers.redhat.com/blog/2021/01/05/building-red-hat-enterprise-linux-9-for-the-x86-64-v2-microarchitecture-level/

In 2020, AMD, Intel, Red Hat, and SUSE worked together to define
three microarchitecture levels on top of the historical x86-64
baseline:

  * x86-64:    original x86_64 baseline instruction set
  * x86-64-v2: vector instructions up to Streaming SIMD
               Extensions 4.2 (SSE4.2)  and Supplemental
	       Streaming SIMD Extensions 3 (SSSE3), the
	       POPCNT instruction, and CMPXCHG16B
  * x86-64-v3: vector instructions up to AVX2, MOVBE,
               and additional bit-manipulation instructions.
  * x86-64-v4: vector instructions from some of the
               AVX-512 variants.

This list of features is defined in the doc at:

  https://gitlab.com/x86-psABIs/x86-64-ABI/

QEMU has historically defaulted to the "qemu64" CPU model on
x86_64 targets, which is approximately the x86-64 baseline
ABI, with 'SVM' added.

It is thought it might be desirable if QEMU could provide CPU models
that closely correspond to the ABI levels, while offering portability
across the maximum number of physical CPUs.

Historically we've found that defining CPU models with an arbitrary
combination of CPU features can be problematic, as some guest OS
will not check all features they use, and instead assume that if
they see feature "XX", then "YY" will always exist. This is reasonable
in bare metal, but subject to breakage in virtualization.

Thus in defining the CPU models for the ABI levels, this patch attempted
to base them off an existing CPU model.

While each x86-64-abiNNN has a designated vendor, they are designed
to be vendor agnostic models. ie they are capable of running on any
physical x86_64 CPU model that satisfies the ABI level. eg although
the x86-64-abi2 model is based on Nehalem, it should be able to run
guests on an Opteron_G4/G5/EPYC host, since those CPUs support the
features required by the x86-64 v2 ABI.

More precisely the models were defined as:

 * x86-64-abi1: close match for Opteron_G1, minus
                vme
 * x86-64-abi2: perfect match for Nehalem
 * x86-64-abi3: close match of Haswell-noTSX, minus
                aes pcid erms invpcid tsc-deadline
		x2apic pclmulqdq
 * x86-64-abi4: close match of Skylake-Server-noTSX-IBRS, minus
                spec-ctrl

None of the CPU models declare any VMX/SVM capability features.
IOW, even if a "vmx"/"svm" flag is added, it will still be unsafe
to attempt to live migrate the L1 guest if there are any L2
guests running with hardware virtualization.

Given their vendor agnostic design, these CPU models are primarily
thought tobe  useful as the default CPU model for machine types.
QEMU upstream is quite conservative in mandating new hardware features,
but a downstream vendor may choose to mandate a newer x86-64 ABI level
for downstream only machine types.

Note that TCG is not capable of supporting the 2 newest ABI levels
currently due to missing features:

* x86-64-abi3:

  CPUID.01H:ECX.fma [bit 12]
  CPUID.01H:ECX.avx [bit 28]
  CPUID.01H:ECX.f16c [bit 29]
  CPUID.07H:EBX.avx2 [bit 5]

* x86-64-abi4:

  CPUID.01H:ECX.pcid [bit 17]
  CPUID.01H:ECX.x2apic [bit 21]
  CPUID.01H:ECX.tsc-deadline [bit 24]
  CPUID.07H:EBX.invpcid [bit 10]
  CPUID.07H:EBX.avx512f [bit 16]
  CPUID.07H:EBX.avx512dq [bit 17]
  CPUID.07H:EBX.rdseed [bit 18]
  CPUID.07H:EBX.avx512cd [bit 28]
  CPUID.07H:EBX.avx512bw [bit 30]
  CPUID.07H:EBX.avx512vl [bit 31]
  CPUID.80000001H:ECX.3dnowprefetch [bit 8]
  CPUID.0DH:EAX.xsavec [bit 1]

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/system/cpu-models-x86-abi.csv |   8 ++
 target/i386/cpu.c                  | 156 +++++++++++++++++++++++++++++
 2 files changed, 164 insertions(+)

diff --git a/docs/system/cpu-models-x86-abi.csv b/docs/system/cpu-models-x86-abi.csv
index f3f3b60be1..3392c39753 100644
--- a/docs/system/cpu-models-x86-abi.csv
+++ b/docs/system/cpu-models-x86-abi.csv
@@ -65,3 +65,11 @@ pentium3-v1,,,,
 phenom-v1,✅,,,
 qemu32-v1,,,,
 qemu64-v1,✅,,,
+x86-64-abi1,✅,,,
+x86-64-abi1-v1,✅,,,
+x86-64-abi2,✅,✅,,
+x86-64-abi2-v1,✅,✅,,
+x86-64-abi3,✅,✅,✅,
+x86-64-abi3-v1,✅,✅,✅,
+x86-64-abi4,✅,✅,✅,✅
+x86-64-abi4-v1,✅,✅,✅,✅
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index c496bfa1c2..e6609e278a 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1798,6 +1798,162 @@ static CPUCaches epyc_milan_cache_info = {
  */
 
 static X86CPUDefinition builtin_x86_defs[] = {
+    /*
+     * These first few CPU models are designed to satisfy the
+     * x86_64 ABI levels defined in:
+     *
+     *   https://gitlab.com/x86-psABIs/x86-64-ABI/
+     *
+     * They were constructed as follows:
+     *
+     *   - Find all the CPU models which can satisfy the ABI
+     *   - Calculate the lowest common denominator (LCD) of these
+     *     models' features
+     *   - Find the named model most closely matching the LCD
+     *   - Strip its features back to the LCD
+     *
+     * The above spec uses the "x86-64-vNN" naming convention.
+     * This clashes with the "vNN" suffix QEMU uses for versioning.
+     * Thus we use "abiNNN" as a suffix.
+     */
+    {
+        /*
+         * Derived from Opteron_G1, minus
+         *   vme
+         */
+        .name = "x86-64-abi1",
+        .level = 5,
+        .vendor = CPUID_VENDOR_AMD,
+        .family = 15,
+        .model = 6,
+        .stepping = 1,
+        .features[FEAT_1_EDX] =
+            CPUID_SSE2 | CPUID_SSE | CPUID_FXSR | CPUID_MMX |
+            CPUID_CLFLUSH | CPUID_PSE36 | CPUID_PAT | CPUID_CMOV | CPUID_MCA |
+            CPUID_PGE | CPUID_MTRR | CPUID_SEP | CPUID_APIC | CPUID_CX8 |
+            CPUID_MCE | CPUID_PAE | CPUID_MSR | CPUID_TSC | CPUID_PSE |
+            CPUID_DE | CPUID_FP87,
+        .features[FEAT_1_ECX] =
+            CPUID_EXT_SSE3,
+        .features[FEAT_8000_0001_EDX] =
+            CPUID_EXT2_LM | CPUID_EXT2_NX | CPUID_EXT2_SYSCALL,
+        .xlevel = 0x80000008,
+        .model_id = "QEMU x86-64 baseline ABI",
+    },
+    {
+        /* Derived from Nehalem */
+        .name = "x86-64-abi2",
+        .level = 11,
+        .vendor = CPUID_VENDOR_INTEL,
+        .family = 6,
+        .model = 26,
+        .stepping = 3,
+        .features[FEAT_1_EDX] =
+            CPUID_VME | CPUID_SSE2 | CPUID_SSE | CPUID_FXSR | CPUID_MMX |
+            CPUID_CLFLUSH | CPUID_PSE36 | CPUID_PAT | CPUID_CMOV | CPUID_MCA |
+            CPUID_PGE | CPUID_MTRR | CPUID_SEP | CPUID_APIC | CPUID_CX8 |
+            CPUID_MCE | CPUID_PAE | CPUID_MSR | CPUID_TSC | CPUID_PSE |
+            CPUID_DE | CPUID_FP87,
+        .features[FEAT_1_ECX] =
+            CPUID_EXT_POPCNT | CPUID_EXT_SSE42 | CPUID_EXT_SSE41 |
+            CPUID_EXT_CX16 | CPUID_EXT_SSSE3 | CPUID_EXT_SSE3,
+        .features[FEAT_8000_0001_EDX] =
+            CPUID_EXT2_LM | CPUID_EXT2_SYSCALL | CPUID_EXT2_NX,
+        .features[FEAT_8000_0001_ECX] =
+            CPUID_EXT3_LAHF_LM,
+        .xlevel = 0x80000008,
+        .model_id = "QEMU x86-64-v2 ABI",
+    },
+    {
+        /*
+         * Derived from Haswell-noTSX, minus
+         *   aes pcid erms invpcid tsc-deadline x2apic pclmulqdq
+         */
+        .name = "x86-64-abi3",
+        .level = 0xd,
+        .vendor = CPUID_VENDOR_INTEL,
+        .family = 6,
+        .model = 60,
+        .stepping = 1,
+        .features[FEAT_1_EDX] =
+            CPUID_VME | CPUID_SSE2 | CPUID_SSE | CPUID_FXSR | CPUID_MMX |
+            CPUID_CLFLUSH | CPUID_PSE36 | CPUID_PAT | CPUID_CMOV | CPUID_MCA |
+            CPUID_PGE | CPUID_MTRR | CPUID_SEP | CPUID_APIC | CPUID_CX8 |
+            CPUID_MCE | CPUID_PAE | CPUID_MSR | CPUID_TSC | CPUID_PSE |
+            CPUID_DE | CPUID_FP87,
+        .features[FEAT_1_ECX] =
+            CPUID_EXT_AVX | CPUID_EXT_XSAVE |
+            CPUID_EXT_POPCNT | CPUID_EXT_SSE42 |
+            CPUID_EXT_SSE41 | CPUID_EXT_CX16 | CPUID_EXT_SSSE3 |
+            CPUID_EXT_SSE3 |
+            CPUID_EXT_FMA | CPUID_EXT_MOVBE |
+            CPUID_EXT_F16C | CPUID_EXT_RDRAND,
+        .features[FEAT_8000_0001_EDX] =
+            CPUID_EXT2_LM | CPUID_EXT2_RDTSCP | CPUID_EXT2_NX |
+            CPUID_EXT2_SYSCALL,
+        .features[FEAT_8000_0001_ECX] =
+            CPUID_EXT3_ABM | CPUID_EXT3_LAHF_LM,
+        .features[FEAT_7_0_EBX] =
+            CPUID_7_0_EBX_FSGSBASE | CPUID_7_0_EBX_BMI1 |
+            CPUID_7_0_EBX_AVX2 | CPUID_7_0_EBX_SMEP |
+            CPUID_7_0_EBX_BMI2,
+        .features[FEAT_XSAVE] =
+            CPUID_XSAVE_XSAVEOPT,
+        .features[FEAT_6_EAX] =
+            CPUID_6_EAX_ARAT,
+        .xlevel = 0x80000008,
+        .model_id = "QEMU x86-64-v3 ABI",
+    },
+
+    {
+        /*
+         * Derived from Skylake-Server-noTSX-IBRS, minus:
+         *  spec-ctrl
+         */
+        .name = "x86-64-abi4",
+        .level = 0xd,
+        .vendor = CPUID_VENDOR_INTEL,
+        .family = 6,
+        .model = 85,
+        .stepping = 4,
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
+            CPUID_7_0_EBX_AVX2 | CPUID_7_0_EBX_SMEP |
+            CPUID_7_0_EBX_BMI2 | CPUID_7_0_EBX_ERMS | CPUID_7_0_EBX_INVPCID |
+            CPUID_7_0_EBX_RDSEED | CPUID_7_0_EBX_ADX |
+            CPUID_7_0_EBX_SMAP | CPUID_7_0_EBX_CLWB |
+            CPUID_7_0_EBX_AVX512F | CPUID_7_0_EBX_AVX512DQ |
+            CPUID_7_0_EBX_AVX512BW | CPUID_7_0_EBX_AVX512CD |
+            CPUID_7_0_EBX_AVX512VL,
+        .features[FEAT_7_0_ECX] =
+            CPUID_7_0_ECX_PKU,
+        .features[FEAT_XSAVE] =
+            CPUID_XSAVE_XSAVEOPT | CPUID_XSAVE_XSAVEC |
+            CPUID_XSAVE_XGETBV1,
+        .features[FEAT_6_EAX] =
+            CPUID_6_EAX_ARAT,
+        .xlevel = 0x80000008,
+        .model_id = "QEMU x86-64-v4 ABI",
+    },
+
     {
         .name = "qemu64",
         .level = 0xd,
-- 
2.31.1


