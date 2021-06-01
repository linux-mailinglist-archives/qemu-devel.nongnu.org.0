Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AB63979D0
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 20:12:50 +0200 (CEST)
Received: from localhost ([::1]:38962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo8sj-0004iP-5T
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 14:12:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lo8qM-0001rT-Ba
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 14:10:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lo8qJ-0005Va-L6
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 14:10:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622571019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kbBngyXu7MaV0eNzrz81Hu02B5JHNY79nLgXCQoz3a4=;
 b=R3lZKoS1kX0r+VnMpJ4anEB27Pa1uUiKb8iLAa3fivXEUzi1DPUDQCmAX43LSRh5Ew3KgE
 EuEpwYRi9dFiU74Yka2sZ7s/jURzEi/poMpXphjpcqMO2JdE0a9KvjM9p4zSVfUPKpzL8y
 MYRG/x01L2vPT+rWKU8/x2zuwfVI7/o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-91-WXVWTuVEMSOWCsB3mzH30g-1; Tue, 01 Jun 2021 14:10:17 -0400
X-MC-Unique: WXVWTuVEMSOWCsB3mzH30g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 388558015C6;
 Tue,  1 Jun 2021 18:10:16 +0000 (UTC)
Received: from localhost (ovpn-112-239.rdu2.redhat.com [10.10.112.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE3145C1BB;
 Tue,  1 Jun 2021 18:10:15 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 01/24] target/i386: Add CPU model versions supporting 'xsaves'
Date: Tue,  1 Jun 2021 14:09:51 -0400
Message-Id: <20210601181014.2568861-2-ehabkost@redhat.com>
In-Reply-To: <20210601181014.2568861-1-ehabkost@redhat.com>
References: <20210601181014.2568861-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vitaly Kuznetsov <vkuznets@redhat.com>

Hyper-V 2016 refuses to boot on Skylake+ CPU models because they lack
'xsaves'/'vmx-xsaves' features and this diverges from real hardware. The
same issue emerges with AMD "EPYC" CPU model prior to version 3 which got
'xsaves' added. EPYC-Rome/EPYC-Milan CPU models have 'xsaves' enabled from
the very beginning so the comment blaming KVM to explain why other CPUs
lack 'xsaves' is likely outdated.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
Message-Id: <20210412073952.860944-1-vkuznets@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/cpu.c | 150 +++++++++++++++++++++++++++++-----------------
 1 file changed, 94 insertions(+), 56 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index b4349119f8b..72c521559f0 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -2802,12 +2802,7 @@ static X86CPUDefinition builtin_x86_defs[] = {
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
@@ -2883,6 +2878,15 @@ static X86CPUDefinition builtin_x86_defs[] = {
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
@@ -2922,12 +2926,7 @@ static X86CPUDefinition builtin_x86_defs[] = {
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
@@ -3015,6 +3014,15 @@ static X86CPUDefinition builtin_x86_defs[] = {
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
@@ -3057,12 +3065,7 @@ static X86CPUDefinition builtin_x86_defs[] = {
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
@@ -3146,6 +3149,14 @@ static X86CPUDefinition builtin_x86_defs[] = {
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
@@ -3195,13 +3206,7 @@ static X86CPUDefinition builtin_x86_defs[] = {
             MSR_ARCH_CAP_PSCHANGE_MC_NO | MSR_ARCH_CAP_TAA_NO,
         .features[FEAT_7_1_EAX] =
             CPUID_7_1_EAX_AVX_VNNI | CPUID_7_1_EAX_AVX512_BF16,
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
@@ -3257,6 +3262,18 @@ static X86CPUDefinition builtin_x86_defs[] = {
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
@@ -3299,12 +3316,7 @@ static X86CPUDefinition builtin_x86_defs[] = {
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
@@ -3372,6 +3384,15 @@ static X86CPUDefinition builtin_x86_defs[] = {
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
@@ -3420,12 +3441,7 @@ static X86CPUDefinition builtin_x86_defs[] = {
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
@@ -3518,6 +3534,15 @@ static X86CPUDefinition builtin_x86_defs[] = {
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
@@ -3552,13 +3577,7 @@ static X86CPUDefinition builtin_x86_defs[] = {
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
@@ -3625,6 +3644,15 @@ static X86CPUDefinition builtin_x86_defs[] = {
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
@@ -3683,13 +3711,7 @@ static X86CPUDefinition builtin_x86_defs[] = {
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
@@ -3754,6 +3776,15 @@ static X86CPUDefinition builtin_x86_defs[] = {
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
@@ -4035,11 +4066,7 @@ static X86CPUDefinition builtin_x86_defs[] = {
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
@@ -4050,6 +4077,17 @@ static X86CPUDefinition builtin_x86_defs[] = {
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


