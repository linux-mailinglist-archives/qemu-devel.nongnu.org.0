Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5031572988
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 00:55:09 +0200 (CEST)
Received: from localhost ([::1]:47480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBOma-0001OZ-Jn
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 18:55:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBOBK-0007O8-La
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 18:16:39 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:52841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBOBI-0002T5-VM
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 18:16:38 -0400
Received: by mail-wm1-x32e.google.com with SMTP id o8so5492397wms.2
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 15:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KuGIjY7EJYwKlc1lIUgslmUYN25raPW28vS1CpNd758=;
 b=OZikCEMFXvDIzz1dh+DxpiG3codN1rX2k9glWAu3E4dWQtSecRsuAOkj3QVkAIvng9
 HVN9Tx68mVVgn/lS9U+N8Zhj86fuL+iVkqzOmwAeSRGakxZFOYjggnp+2BIxb254uzeZ
 AEPfmpDn4Ju1Fae0FHz2TMzI7biGAJPS1OBRA6FqDinQQV8DgfM/e+AwvMBai4x2rIBU
 zjthULb39YitOAYGGNxz9N/PtSwXmoM4naybPAAKQx36kVhR8YlckzfyqOnklELDNXbA
 /PLFb+bt92xIbAJ/iaLF/1BLEB7A3pGW9C3AOYo25zC1GghzyzHPJdmPjBk6jPoL8quH
 ceOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KuGIjY7EJYwKlc1lIUgslmUYN25raPW28vS1CpNd758=;
 b=FBmKxhdcgma4WhakwirWepSLVh1MUIQgK6Qhm/jUiYF1vfpfDxOf0nR7zU6qBNc5li
 smKArpRZ511rqjZKgy8KF3poOucyxk+vu0Vp/+PYDZkuGl/pi25Clz/g+dUXnH9mTpXl
 iNcgf+4JPAkWHuw0zwkrF/DFqO1Eq2+5QfcFouz/yiT43m52mdZh///zBiZM6XSiPag+
 lzjJLxqhViTZ3IJo2IOxZDWWr1A4iK9ai7xT614IBYHRoZi9xWTpJTLmhEhbeuvGfNMs
 UXKdwavxhh0XlGx+j3rDxA9ReHCWoEfDieEANZVh+F3KcFaH3DJQmx+dmyCYhwKDKOzX
 A4jg==
X-Gm-Message-State: AJIora8RouAGjZ2Dl+pxqhbD+AlmqNP5p+wOzxfVvB8pXTTdWEYupOlI
 YkvHqm4j8Ut5Np1jcRYxdt3o2iE1lM3FwNhL
X-Google-Smtp-Source: AGRyM1vmMu2YFNGTUWsYYhMdAbmNF8kJMXUk4nVD7GZg8W3vdINvncThoPEBJnq1L1vyXUVmKUpSLw==
X-Received: by 2002:a05:600c:19cd:b0:3a2:f2bb:72ad with SMTP id
 u13-20020a05600c19cd00b003a2f2bb72admr214836wmq.106.1657664194864; 
 Tue, 12 Jul 2022 15:16:34 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a05600c47d100b003a2da6b2cbesm172508wmo.33.2022.07.12.15.16.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Jul 2022 15:16:34 -0700 (PDT)
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <r.bolshakov@yadro.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Cameron Esfahani <dirty@apple.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Silvio Moioli <moio@suse.com>
Subject: [PULL 1/5] hvf: Enable RDTSCP support
Date: Wed, 13 Jul 2022 00:16:03 +0200
Message-Id: <20220712221607.9933-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220712221607.9933-1-f4bug@amsat.org>
References: <20220712221607.9933-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Message-Id: <20220214185605.28087-7-f4bug@amsat.org>
Tested-by: Silvio Moioli <moio@suse.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1011
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/hvf/hvf.c       | 26 +++++++++++++++++---------
 target/i386/hvf/vmcs.h      |  3 ++-
 target/i386/hvf/x86_cpuid.c |  7 ++++---
 3 files changed, 23 insertions(+), 13 deletions(-)

diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index f8833277ab..8d2248bb3f 100644
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
index b4692f63f6..aee6f75dfd 100644
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
index f24dd50e48..7323a7a94b 100644
--- a/target/i386/hvf/x86_cpuid.c
+++ b/target/i386/hvf/x86_cpuid.c
@@ -95,7 +95,8 @@ uint32_t hvf_get_supported_cpuid(uint32_t func, uint32_t idx,
                 ebx &= ~CPUID_7_0_EBX_INVPCID;
             }
 
-            ecx &= CPUID_7_0_ECX_AVX512_VBMI | CPUID_7_0_ECX_AVX512_VPOPCNTDQ;
+            ecx &= CPUID_7_0_ECX_AVX512_VBMI | CPUID_7_0_ECX_AVX512_VPOPCNTDQ |
+                   CPUID_7_0_ECX_RDPID;
             edx &= CPUID_7_0_EDX_AVX512_4VNNIW | CPUID_7_0_EDX_AVX512_4FMAPS;
         } else {
             ebx = 0;
@@ -132,11 +133,11 @@ uint32_t hvf_get_supported_cpuid(uint32_t func, uint32_t idx,
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
2.36.1


