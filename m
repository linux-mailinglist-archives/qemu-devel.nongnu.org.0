Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E2A35BAFB
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 09:41:22 +0200 (CEST)
Received: from localhost ([::1]:48032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVrCD-0008Vf-Ba
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 03:41:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lVrB1-0007Wz-Gm
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 03:40:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lVrAy-00075J-3W
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 03:40:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618213201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=j6ytzgGp2mb48VnYGPaY1wdFWpwnwYKSK4imLcWQuFM=;
 b=chvyWtfqDwF+PYtp2G2NJ05LasUlB/YOM7MLJPVLcuXIMHoEckF9HN5JfkGL/xUSWWPaqW
 m5r4CN4xPw6cM2bU/qwrzN/u156QaJQx/INongNMdr158UyNiflm8pzQtDqLVI9EsAyGXk
 jKtknIi6t1iT9bEsBiIYCVaQ4j6EnwM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-Bp1z9uyWNiuW4c6V1WjUWg-1; Mon, 12 Apr 2021 03:39:59 -0400
X-MC-Unique: Bp1z9uyWNiuW4c6V1WjUWg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5EBBC100A60E;
 Mon, 12 Apr 2021 07:39:58 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.195.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8DAEE5C26D;
 Mon, 12 Apr 2021 07:39:53 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH] target/i386: Add CPU model versions supporting 'xsaves'
Date: Mon, 12 Apr 2021 09:39:52 +0200
Message-Id: <20210412073952.860944-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Wen Pu <puwen@hygon.cn>, Richard Henderson <richard.henderson@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hyper-V 2016 refuses to boot on Skylake+ CPU models because they lack
'xsaves'/'vmx-xsaves' features and this diverges from real hardware. The
same issue emerges with AMD "EPYC" CPU model prior to version 3 which got
'xsaves' added. EPYC-Rome/EPYC-Milan CPU models have 'xsaves' enabled from
the very beginning so the comment blaming KVM to explain why other CPUs
lack 'xsaves' is likely outdated.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
This patch is a succesor of "[PATCH RFC] target/i386: Add Intel CPU model
 versions supporting 'xsaves'".

Changes since RFC:
- Add 'xsaves' version of Hygon Dhyana [Wen Pu]
---
 target/i386/cpu.c | 150 +++++++++++++++++++++++++++++-----------------
 1 file changed, 94 insertions(+), 56 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6b3e9467f177..5753f839b990 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -2881,12 +2881,7 @@ static X86CPUDefinition builtin_x86_defs[] = {
             CPUID_7_0_EBX_BMI2 | CPUID_7_0_EBX_ERMS | CPUID_7_0_EBX_INVPCID |
             CPUID_7_0_EBX_RTM | CPUID_7_0_EBX_RDSEED | CPUID_7_0_EBX_ADX |
             CPUID_7_0_EBX_SMAP,
-        /* Missing: XSAVES (not supported by some Linux versions,
-         * including v4.1 to v4.12).
-         * KVM doesn't yet expose any XSAVES state save component,
-         * and the only one defined in Skylake (processor tracing)
-         * probably will block migration anyway.
-         */
+        /* XSAVES is added in version 4 */
         .features[FEAT_XSAVE] =
             CPUID_XSAVE_XSAVEOPT | CPUID_XSAVE_XSAVEC |
             CPUID_XSAVE_XGETBV1,
@@ -2962,6 +2957,15 @@ static X86CPUDefinition builtin_x86_defs[] = {
                     { /* end of list */ }
                 }
             },
+            {
+                .version = 4,
+                .note = "IBRS, XSAVES, no TSX",
+                .props = (PropValue[]) {
+                    { "xsaves", "on" },
+                    { "vmx-xsaves", "on" },
+                    { /* end of list */ }
+                }
+            },
             { /* end of list */ }
         }
     },
@@ -3001,12 +3005,7 @@ static X86CPUDefinition builtin_x86_defs[] = {
             CPUID_7_0_EBX_AVX512VL | CPUID_7_0_EBX_CLFLUSHOPT,
         .features[FEAT_7_0_ECX] =
             CPUID_7_0_ECX_PKU,
-        /* Missing: XSAVES (not supported by some Linux versions,
-         * including v4.1 to v4.12).
-         * KVM doesn't yet expose any XSAVES state save component,
-         * and the only one defined in Skylake (processor tracing)
-         * probably will block migration anyway.
-         */
+        /* XSAVES is added in version 5 */
         .features[FEAT_XSAVE] =
             CPUID_XSAVE_XSAVEOPT | CPUID_XSAVE_XSAVEC |
             CPUID_XSAVE_XGETBV1,
@@ -3094,6 +3093,15 @@ static X86CPUDefinition builtin_x86_defs[] = {
                     { /* end of list */ }
                 }
             },
+            {
+                .version = 5,
+                .note = "IBRS, XSAVES, EPT switching, no TSX",
+                .props = (PropValue[]) {
+                    { "xsaves", "on" },
+                    { "vmx-xsaves", "on" },
+                    { /* end of list */ }
+                }
+            },
             { /* end of list */ }
         }
     },
@@ -3136,12 +3144,7 @@ static X86CPUDefinition builtin_x86_defs[] = {
             CPUID_7_0_ECX_AVX512VNNI,
         .features[FEAT_7_0_EDX] =
             CPUID_7_0_EDX_SPEC_CTRL | CPUID_7_0_EDX_SPEC_CTRL_SSBD,
-        /* Missing: XSAVES (not supported by some Linux versions,
-                * including v4.1 to v4.12).
-                * KVM doesn't yet expose any XSAVES state save component,
-                * and the only one defined in Skylake (processor tracing)
-                * probably will block migration anyway.
-                */
+        /* XSAVES is added in version 5 */
         .features[FEAT_XSAVE] =
             CPUID_XSAVE_XSAVEOPT | CPUID_XSAVE_XSAVEC |
             CPUID_XSAVE_XGETBV1,
@@ -3225,6 +3228,14 @@ static X86CPUDefinition builtin_x86_defs[] = {
                   { /* end of list */ }
               },
             },
+            { .version = 5,
+              .note = "ARCH_CAPABILITIES, EPT switching, XSAVES, no TSX",
+              .props = (PropValue[]) {
+                  { "xsaves", "on" },
+                  { "vmx-xsaves", "on" },
+                  { /* end of list */ }
+              },
+            },
             { /* end of list */ }
         }
     },
@@ -3274,13 +3285,7 @@ static X86CPUDefinition builtin_x86_defs[] = {
             MSR_ARCH_CAP_PSCHANGE_MC_NO | MSR_ARCH_CAP_TAA_NO,
         .features[FEAT_7_1_EAX] =
             CPUID_7_1_EAX_AVX512_BF16,
-        /*
-         * Missing: XSAVES (not supported by some Linux versions,
-         * including v4.1 to v4.12).
-         * KVM doesn't yet expose any XSAVES state save component,
-         * and the only one defined in Skylake (processor tracing)
-         * probably will block migration anyway.
-         */
+        /* XSAVES is added in version 2 */
         .features[FEAT_XSAVE] =
             CPUID_XSAVE_XSAVEOPT | CPUID_XSAVE_XSAVEC |
             CPUID_XSAVE_XGETBV1,
@@ -3336,6 +3341,18 @@ static X86CPUDefinition builtin_x86_defs[] = {
         .features[FEAT_VMX_VMFUNC] = MSR_VMX_VMFUNC_EPT_SWITCHING,
         .xlevel = 0x80000008,
         .model_id = "Intel Xeon Processor (Cooperlake)",
+        .versions = (X86CPUVersionDefinition[]) {
+            { .version = 1 },
+            { .version = 2,
+              .note = "XSAVES",
+              .props = (PropValue[]) {
+                  { "xsaves", "on" },
+                  { "vmx-xsaves", "on" },
+                  { /* end of list */ }
+              },
+            },
+            { /* end of list */ }
+        }
     },
     {
         .name = "Icelake-Client",
@@ -3378,12 +3395,7 @@ static X86CPUDefinition builtin_x86_defs[] = {
             CPUID_7_0_ECX_AVX512_VPOPCNTDQ,
         .features[FEAT_7_0_EDX] =
             CPUID_7_0_EDX_SPEC_CTRL | CPUID_7_0_EDX_SPEC_CTRL_SSBD,
-        /* Missing: XSAVES (not supported by some Linux versions,
-                * including v4.1 to v4.12).
-                * KVM doesn't yet expose any XSAVES state save component,
-                * and the only one defined in Skylake (processor tracing)
-                * probably will block migration anyway.
-                */
+        /* XSAVES is added in version 3 */
         .features[FEAT_XSAVE] =
             CPUID_XSAVE_XSAVEOPT | CPUID_XSAVE_XSAVEC |
             CPUID_XSAVE_XGETBV1,
@@ -3451,6 +3463,15 @@ static X86CPUDefinition builtin_x86_defs[] = {
                     { /* end of list */ }
                 },
             },
+            {
+                .version = 3,
+                .note = "no TSX, XSAVES, deprecated",
+                .props = (PropValue[]) {
+                    { "xsaves", "on" },
+                    { "vmx-xsaves", "on" },
+                    { /* end of list */ }
+                },
+            },
             { /* end of list */ }
         },
         .deprecation_note = "use Icelake-Server instead"
@@ -3499,12 +3520,7 @@ static X86CPUDefinition builtin_x86_defs[] = {
             CPUID_7_0_ECX_AVX512_VPOPCNTDQ | CPUID_7_0_ECX_LA57,
         .features[FEAT_7_0_EDX] =
             CPUID_7_0_EDX_SPEC_CTRL | CPUID_7_0_EDX_SPEC_CTRL_SSBD,
-        /* Missing: XSAVES (not supported by some Linux versions,
-                * including v4.1 to v4.12).
-                * KVM doesn't yet expose any XSAVES state save component,
-                * and the only one defined in Skylake (processor tracing)
-                * probably will block migration anyway.
-                */
+        /* XSAVES is added in version 5 */
         .features[FEAT_XSAVE] =
             CPUID_XSAVE_XSAVEOPT | CPUID_XSAVE_XSAVEC |
             CPUID_XSAVE_XGETBV1,
@@ -3597,6 +3613,15 @@ static X86CPUDefinition builtin_x86_defs[] = {
                     { /* end of list */ }
                 },
             },
+            {
+                .version = 5,
+                .note = "XSAVES",
+                .props = (PropValue[]) {
+                    { "xsaves", "on" },
+                    { "vmx-xsaves", "on" },
+                    { /* end of list */ }
+                },
+            },
             { /* end of list */ }
         }
     },
@@ -3631,13 +3656,7 @@ static X86CPUDefinition builtin_x86_defs[] = {
         .features[FEAT_7_0_EDX] =
             CPUID_7_0_EDX_SPEC_CTRL | CPUID_7_0_EDX_ARCH_CAPABILITIES |
             CPUID_7_0_EDX_SPEC_CTRL_SSBD,
-        /*
-         * Missing: XSAVES (not supported by some Linux versions,
-         * including v4.1 to v4.12).
-         * KVM doesn't yet expose any XSAVES state save component,
-         * and the only one defined in Skylake (processor tracing)
-         * probably will block migration anyway.
-         */
+        /* XSAVES is added in version 3 */
         .features[FEAT_XSAVE] =
             CPUID_XSAVE_XSAVEOPT | CPUID_XSAVE_XSAVEC | CPUID_XSAVE_XGETBV1,
         .features[FEAT_6_EAX] =
@@ -3704,6 +3723,15 @@ static X86CPUDefinition builtin_x86_defs[] = {
                     { /* end of list */ },
                 },
             },
+            {
+                .version = 3,
+                .note = "XSAVES, no MPX, no MONITOR",
+                .props = (PropValue[]) {
+                    { "xsaves", "on" },
+                    { "vmx-xsaves", "on" },
+                    { /* end of list */ },
+                },
+            },
             { /* end of list */ },
         },
     },
@@ -3762,13 +3790,7 @@ static X86CPUDefinition builtin_x86_defs[] = {
             CPUID_7_0_EDX_CORE_CAPABILITY,
         .features[FEAT_CORE_CAPABILITY] =
             MSR_CORE_CAP_SPLIT_LOCK_DETECT,
-        /*
-         * Missing: XSAVES (not supported by some Linux versions,
-         * including v4.1 to v4.12).
-         * KVM doesn't yet expose any XSAVES state save component,
-         * and the only one defined in Skylake (processor tracing)
-         * probably will block migration anyway.
-         */
+        /* XSAVES is is added in version 3 */
         .features[FEAT_XSAVE] =
             CPUID_XSAVE_XSAVEOPT | CPUID_XSAVE_XSAVEC |
             CPUID_XSAVE_XGETBV1,
@@ -3833,6 +3855,15 @@ static X86CPUDefinition builtin_x86_defs[] = {
                     { /* end of list */ },
                 },
             },
+            {
+                .version = 3,
+                .note = "XSAVES, no MPX",
+                .props = (PropValue[]) {
+                    { "xsaves", "on" },
+                    { "vmx-xsaves", "on" },
+                    { /* end of list */ },
+                },
+            },
             { /* end of list */ },
         },
     },
@@ -4114,11 +4145,7 @@ static X86CPUDefinition builtin_x86_defs[] = {
             CPUID_7_0_EBX_FSGSBASE | CPUID_7_0_EBX_BMI1 | CPUID_7_0_EBX_AVX2 |
             CPUID_7_0_EBX_SMEP | CPUID_7_0_EBX_BMI2 | CPUID_7_0_EBX_RDSEED |
             CPUID_7_0_EBX_ADX | CPUID_7_0_EBX_SMAP | CPUID_7_0_EBX_CLFLUSHOPT,
-        /*
-         * Missing: XSAVES (not supported by some Linux versions,
-         * including v4.1 to v4.12).
-         * KVM doesn't yet expose any XSAVES state save component.
-         */
+        /* XSAVES is added in version 2 */
         .features[FEAT_XSAVE] =
             CPUID_XSAVE_XSAVEOPT | CPUID_XSAVE_XSAVEC |
             CPUID_XSAVE_XGETBV1,
@@ -4129,6 +4156,17 @@ static X86CPUDefinition builtin_x86_defs[] = {
         .xlevel = 0x8000001E,
         .model_id = "Hygon Dhyana Processor",
         .cache_info = &epyc_cache_info,
+        .versions = (X86CPUVersionDefinition[]) {
+            { .version = 1 },
+            { .version = 2,
+              .note = "XSAVES",
+              .props = (PropValue[]) {
+                  { "xsaves", "on" },
+                  { /* end of list */ }
+              },
+            },
+            { /* end of list */ }
+        }
     },
     {
         .name = "EPYC-Rome",
-- 
2.30.2


