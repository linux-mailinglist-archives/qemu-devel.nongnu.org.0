Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F323570B8
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 17:45:27 +0200 (CEST)
Received: from localhost ([::1]:52944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUAMw-0005Fl-EW
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 11:45:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lUALO-0004SQ-TX
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 11:43:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lUALM-0001pe-Uj
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 11:43:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617810228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zRGsyECxnUGHRbOsE65Yd6NI9wR17xMHlm83e7sytPE=;
 b=QueXCVT+NwoKKFadAfOja5fPiirwsV+JqS7c//Ay5VKVKCVp0osWxtCahBwtMXM/54fdpq
 K6HCw1LvYzpwhH1nMgKg9JrTCNrJzdHoPnhY5sbfe7lgyRyRxor7Lul9xkHjptrXczmYL+
 t5yzExDujrzNF/0ZEhlP1PP9mA6QRNg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-xD9KcQ4lPAiXNgg4JL8Okg-1; Wed, 07 Apr 2021 11:43:46 -0400
X-MC-Unique: xD9KcQ4lPAiXNgg4JL8Okg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50C2E8189DB;
 Wed,  7 Apr 2021 15:43:45 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.194.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 645BD19C78;
 Wed,  7 Apr 2021 15:43:43 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH RFC] target/i386: Add Intel CPU model versions supporting
 'xsaves'
Date: Wed,  7 Apr 2021 17:43:42 +0200
Message-Id: <20210407154342.640584-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hyper-V 2016 refuses to boot on Skylake+ CPU models because they lack
'xsaves'/'vmx-xsaves' features and this diverges from real hardware. The
same issue emerges with AMD "EPYC" CPU model prior to version 3 which got
'xsaves' added. EPYC-Rome/EPYC-Milan CPU models have 'xsaves' enabled from
the very beginning so the comment blaming KVM to explain why Intel CPUs
lack 'xsaves' is likely outdated.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
The only CPU model where I keep the original comment and don't add
a version supporting 'xsaves' is "Hygon Dhyana" as I don't know much
about it.
---
 target/i386/cpu.c | 133 ++++++++++++++++++++++++++++------------------
 1 file changed, 82 insertions(+), 51 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6b3e9467f177..19e54be7be80 100644
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
-- 
2.30.2


