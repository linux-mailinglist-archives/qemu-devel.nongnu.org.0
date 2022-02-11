Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EF74B2A8B
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 17:39:08 +0100 (CET)
Received: from localhost ([::1]:40934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIYwt-00035m-V5
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 11:39:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nIYtZ-00004s-PK
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:35:46 -0500
Received: from [2607:f8b0:4864:20::42e] (port=42503
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nIYtY-0002HK-5P
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:35:41 -0500
Received: by mail-pf1-x42e.google.com with SMTP id i6so15298786pfc.9
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 08:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XUpXSgEfdHti7BNle9BRd8vJ4VdWvb4m7Pa200NuX4M=;
 b=LXWKcVwyw9QIGItcIHqBkk0YFIpJpHW9DhaBdumWvy2k40VZzQ6uhd7Qe2SJpYi2GN
 rnouq4ZGfXiUhuQkF8lACiKzrcLPzl1wydFjpQVv3pL20DdEo88zw534qKq4+bM/0L4j
 7MECMK8JH5y9Y+HdAE7pTv3dJvYLyDc8dqQDzwnRT0he4nJNzcWj8Bmq4b0L8vQerj3j
 R8lvKmjA75cU9T9YpfIhoIFUmsQNZRNF2RytPUEyKlgN+NWgwFZa0spBWTAkr9chxRJp
 gGvW8+mkejtYmlPqESwUmxVa8j8pK2f0yJ615pVla1WzEl8yWtju3EgkDVA44RGMLIku
 6PfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XUpXSgEfdHti7BNle9BRd8vJ4VdWvb4m7Pa200NuX4M=;
 b=Jiinu7yn4QFS9AoDMgPxQn7xt1TVJi+7mTAbNv7ljDKJSa/Lb2DqYPDNeMLTBlUxRI
 Tq3A5w9AfWPezAroTrU+bqKB5DJASWPqCDSGSS8e/0eOXc8dYCmHlArGrJaNp5thJVIT
 TufAjiQ6AyBozGXLEWAxuTX+61Q1cszxJi5SP+rQbT90fg/BSVqmuIesBG5rbRyNNDgK
 oBIe1O8sYPULARJU60nAKOXbPfhxJrL2h8ywwa5GMvCVmfPwJfHaPu92ixhgvA6XRbsW
 IwcTJDigue76CdGAd2tbxELwrOxCV29/PPp/vPOa0iyBSalL5/nPX1atUDxqq0HWouSa
 02bA==
X-Gm-Message-State: AOAM5301a1tZGd2ov5VcVQgx+vQ1qit55S2EI6iOYMijFOtlDQwDibnY
 MYUekkhPt9dSybQ+tPoPDoOipYjF/F8=
X-Google-Smtp-Source: ABdhPJxO3lTY3WOiVVeuJ/UnZbbB3faO2DlpigDnZF8P5tLXtrkYhRcgWKisTEnndCqNG6Gt/RdKIA==
X-Received: by 2002:a05:6a00:26e9:: with SMTP id
 p41mr2478626pfw.1.1644597338828; 
 Fri, 11 Feb 2022 08:35:38 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id my18sm6114644pjb.57.2022.02.11.08.35.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 11 Feb 2022 08:35:38 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>,
 Peter Maydell <peter.maydell@linaro.org>, Will Cohen <wwcohen@gmail.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Li Zhang <lizhang@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v4 06/13] hvf: Enable RDTSCP support
Date: Fri, 11 Feb 2022 17:34:27 +0100
Message-Id: <20220211163434.58423-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220211163434.58423-1-f4bug@amsat.org>
References: <20220211163434.58423-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

From: Cameron Esfahani <dirty@apple.com>

Pass through RDPID and RDTSCP support in CPUID if host supports it.
Correctly detect if CPU_BASED_TSC_OFFSET and CPU_BASED2_RDTSCP would
be supported in primary and secondary processor-based VM-execution
controls.  Enable RDTSCP in secondary processor controls if RDTSCP
support is indicated in CPUID.

Signed-off-by: Cameron Esfahani <dirty@apple.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/hvf/hvf.c       | 26 +++++++++++++++++---------
 target/i386/hvf/vmcs.h      |  3 ++-
 target/i386/hvf/x86_cpuid.c |  7 ++++---
 3 files changed, 23 insertions(+), 13 deletions(-)

diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 4ba6e82fab..4712fe66d4 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -221,6 +221,7 @@ int hvf_arch_init_vcpu(CPUState *cpu)
 {
     X86CPU *x86cpu = X86_CPU(cpu);
     CPUX86State *env = &x86cpu->env;
+    uint64_t reqCap;
 
     init_emu();
     init_decoder();
@@ -257,19 +258,26 @@ int hvf_arch_init_vcpu(CPUState *cpu)
     /* set VMCS control fields */
     wvmcs(cpu->hvf->fd, VMCS_PIN_BASED_CTLS,
           cap2ctrl(hvf_state->hvf_caps->vmx_cap_pinbased,
-          VMCS_PIN_BASED_CTLS_EXTINT |
-          VMCS_PIN_BASED_CTLS_NMI |
-          VMCS_PIN_BASED_CTLS_VNMI));
+                   VMCS_PIN_BASED_CTLS_EXTINT |
+                   VMCS_PIN_BASED_CTLS_NMI |
+                   VMCS_PIN_BASED_CTLS_VNMI));
     wvmcs(cpu->hvf->fd, VMCS_PRI_PROC_BASED_CTLS,
           cap2ctrl(hvf_state->hvf_caps->vmx_cap_procbased,
-          VMCS_PRI_PROC_BASED_CTLS_HLT |
-          VMCS_PRI_PROC_BASED_CTLS_MWAIT |
-          VMCS_PRI_PROC_BASED_CTLS_TSC_OFFSET |
-          VMCS_PRI_PROC_BASED_CTLS_TPR_SHADOW) |
+                   VMCS_PRI_PROC_BASED_CTLS_HLT |
+                   VMCS_PRI_PROC_BASED_CTLS_MWAIT |
+                   VMCS_PRI_PROC_BASED_CTLS_TSC_OFFSET |
+                   VMCS_PRI_PROC_BASED_CTLS_TPR_SHADOW) |
           VMCS_PRI_PROC_BASED_CTLS_SEC_CONTROL);
+
+    reqCap = VMCS_PRI_PROC_BASED2_CTLS_APIC_ACCESSES;
+
+    /* Is RDTSCP support in CPUID?  If so, enable it in the VMCS. */
+    if (hvf_get_supported_cpuid(0x80000001, 0, R_EDX) & CPUID_EXT2_RDTSCP) {
+        reqCap |= VMCS_PRI_PROC_BASED2_CTLS_RDTSCP;
+    }
+
     wvmcs(cpu->hvf->fd, VMCS_SEC_PROC_BASED_CTLS,
-          cap2ctrl(hvf_state->hvf_caps->vmx_cap_procbased2,
-                   VMCS_PRI_PROC_BASED2_CTLS_APIC_ACCESSES));
+          cap2ctrl(hvf_state->hvf_caps->vmx_cap_procbased2, reqCap));
 
     wvmcs(cpu->hvf->fd, VMCS_ENTRY_CTLS, cap2ctrl(hvf_state->hvf_caps->vmx_cap_entry,
           0));
diff --git a/target/i386/hvf/vmcs.h b/target/i386/hvf/vmcs.h
index 42de7ebc3a..bb4c764557 100644
--- a/target/i386/hvf/vmcs.h
+++ b/target/i386/hvf/vmcs.h
@@ -354,7 +354,7 @@
 #define VMCS_PRI_PROC_BASED_CTLS_TSC_OFFSET (1 << 3)
 #define VMCS_PRI_PROC_BASED_CTLS_HLT (1 << 7)
 #define VMCS_PRI_PROC_BASED_CTLS_MWAIT         (1 << 10)
-#define VMCS_PRI_PROC_BASED_CTLS_TSC           (1 << 12)
+#define VMCS_PRI_PROC_BASED_CTLS_RDTSC         (1 << 12)
 #define VMCS_PRI_PROC_BASED_CTLS_CR8_LOAD      (1 << 19)
 #define VMCS_PRI_PROC_BASED_CTLS_CR8_STORE     (1 << 20)
 #define VMCS_PRI_PROC_BASED_CTLS_TPR_SHADOW    (1 << 21)
@@ -362,6 +362,7 @@
 #define VMCS_PRI_PROC_BASED_CTLS_SEC_CONTROL   (1 << 31)
 
 #define VMCS_PRI_PROC_BASED2_CTLS_APIC_ACCESSES (1 << 0)
+#define VMCS_PRI_PROC_BASED2_CTLS_RDTSCP        (1 << 3)
 #define VMCS_PRI_PROC_BASED2_CTLS_X2APIC        (1 << 4)
 
 enum task_switch_reason {
diff --git a/target/i386/hvf/x86_cpuid.c b/target/i386/hvf/x86_cpuid.c
index 32b0d131df..b11ddaa349 100644
--- a/target/i386/hvf/x86_cpuid.c
+++ b/target/i386/hvf/x86_cpuid.c
@@ -96,7 +96,8 @@ uint32_t hvf_get_supported_cpuid(uint32_t func, uint32_t idx,
                 ebx &= ~CPUID_7_0_EBX_INVPCID;
             }
 
-            ecx &= CPUID_7_0_ECX_AVX512_VBMI | CPUID_7_0_ECX_AVX512_VPOPCNTDQ;
+            ecx &= CPUID_7_0_ECX_AVX512_VBMI | CPUID_7_0_ECX_AVX512_VPOPCNTDQ |
+                   CPUID_7_0_ECX_RDPID;
             edx &= CPUID_7_0_EDX_AVX512_4VNNIW | CPUID_7_0_EDX_AVX512_4FMAPS;
         } else {
             ebx = 0;
@@ -133,11 +134,11 @@ uint32_t hvf_get_supported_cpuid(uint32_t func, uint32_t idx,
                 CPUID_FXSR | CPUID_EXT2_FXSR | CPUID_EXT2_PDPE1GB | CPUID_EXT2_3DNOWEXT |
                 CPUID_EXT2_3DNOW | CPUID_EXT2_LM | CPUID_EXT2_RDTSCP | CPUID_EXT2_NX;
         hv_vmx_read_capability(HV_VMX_CAP_PROCBASED2, &cap);
-        if (!(cap & CPU_BASED2_RDTSCP)) {
+        if (!(cap2ctrl(cap, CPU_BASED2_RDTSCP) & CPU_BASED2_RDTSCP)) {
             edx &= ~CPUID_EXT2_RDTSCP;
         }
         hv_vmx_read_capability(HV_VMX_CAP_PROCBASED, &cap);
-        if (!(cap & CPU_BASED_TSC_OFFSET)) {
+        if (!(cap2ctrl(cap, CPU_BASED_TSC_OFFSET) & CPU_BASED_TSC_OFFSET)) {
             edx &= ~CPUID_EXT2_RDTSCP;
         }
         ecx &= CPUID_EXT3_LAHF_LM | CPUID_EXT3_CMP_LEG | CPUID_EXT3_CR8LEG |
-- 
2.34.1


