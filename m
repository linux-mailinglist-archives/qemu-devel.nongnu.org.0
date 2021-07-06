Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB03E3BC96F
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:22:06 +0200 (CEST)
Received: from localhost ([::1]:33034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0iDN-0003w0-RO
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:22:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0htt-0000sN-PN
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:01:57 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:53911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0htp-0002I8-5S
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:01:57 -0400
Received: by mail-wm1-x32d.google.com with SMTP id w13so13163218wmc.3
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 03:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6B+POZuXK4UB4wyT6v8liQNauLEZCXAESHdv+wthCKY=;
 b=V04YgcC4cBalQaevqeDPpgE/uoGn6j6i3xW1RfOfaXx+TJno1yktXvU/AUvsv0MMCj
 DdSPYQQUw3fzHazQoki2/v00CC8idHWychDxgx488fC2+c2fJRKi4AnyVExVnDYme1kp
 S0TIdEkLskKhci8WXwo00ic0ixuEXc9eAUXsriUVucoyJvvQoxeulSJAH++38lRbGoDU
 ugWjW56xBXc4UjJt/2wSybCJs6cuhz/2KraQ5rON+K6y378T0xy7xPUQuWL6Wd2TsEOd
 B8PCrs3cZysGCl5uo1OjWubbH4ThHk/ZOjoDrERMw8RiI4ODXGRAqjojYXiQerSTw0ZD
 zX6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6B+POZuXK4UB4wyT6v8liQNauLEZCXAESHdv+wthCKY=;
 b=IHo5kNH/PG37dg1oYGZYCB2KoAZp5jeatS62K8ZpMDZREJn8yr3s3wuWSafooOtGzS
 izioDWOvWrPpKAPc45tIfoP+JObaLNEZZ5FPMNb+C85YpDEyzMSIQyr8PALkRCa8rV/H
 MEZY0w8Ckyib3O7IydxBo13OtGg8uQtW9w2NbEy89KrPonBmXz2l83788PwW1Up3oWm8
 caw35FxIYN5SsQ4djQSx9GRhBCEH5xA+2EpDrZiREpm68OFWD7+be5lfRBGk1j1PMTDT
 kK0Yd6vbGOgZAAdqDnLmR2LKJL95xYEUNN37OERcblGF3EoPjWUU/0QYDiDH0WtXyC+7
 X8xQ==
X-Gm-Message-State: AOAM533R6LRkXK+tASoA3CrrAQRm5mNmsM7qBO7/9MVmaNEQ3qmErf9o
 rCEOd1iDpPyCM2rJVVYeF+Uq9JpcU9U=
X-Google-Smtp-Source: ABdhPJxeOC0NFRW6N6InyCL74U52fDYyufFoQ7pvT6Lmb1zOPorfniJmG+Pxr3FM5XdzsPBRFp9tnA==
X-Received: by 2002:a7b:c844:: with SMTP id c4mr3831081wml.107.1625565711892; 
 Tue, 06 Jul 2021 03:01:51 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v15sm2331268wmj.39.2021.07.06.03.01.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 03:01:51 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/40] target/i386: Populate x86_ext_save_areas offsets using
 cpuid where possible
Date: Tue,  6 Jul 2021 12:01:15 +0200
Message-Id: <20210706100141.303960-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210706100141.303960-1-pbonzini@redhat.com>
References: <20210706100141.303960-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: David Edmondson <david.edmondson@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Edmondson <david.edmondson@oracle.com>

Rather than relying on the X86XSaveArea structure definition,
determine the offset of XSAVE state areas using CPUID leaf 0xd where
possible (KVM and HVF).

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
Message-Id: <20210705104632.2902400-8-david.edmondson@oracle.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c         | 13 +------------
 target/i386/cpu.h         |  2 +-
 target/i386/hvf/hvf-cpu.c | 29 +++++++++++++++++++++++++++++
 target/i386/hvf/hvf.c     |  6 ++++++
 target/i386/kvm/kvm-cpu.c | 30 ++++++++++++++++++++++++++++++
 target/i386/kvm/kvm.c     |  7 +++++++
 target/i386/tcg/tcg-cpu.c | 20 ++++++++++++++++++++
 7 files changed, 94 insertions(+), 13 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 13caa0de50..5f595a0d7e 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1304,48 +1304,37 @@ static const X86RegisterInfo32 x86_reg_info_32[CPU_NB_REGS32] = {
 };
 #undef REGISTER
 
-const ExtSaveArea x86_ext_save_areas[XSAVE_STATE_AREA_COUNT] = {
+ExtSaveArea x86_ext_save_areas[XSAVE_STATE_AREA_COUNT] = {
     [XSTATE_FP_BIT] = {
         /* x87 FP state component is always enabled if XSAVE is supported */
         .feature = FEAT_1_ECX, .bits = CPUID_EXT_XSAVE,
-        /* x87 state is in the legacy region of the XSAVE area */
-        .offset = 0,
         .size = sizeof(X86LegacyXSaveArea) + sizeof(X86XSaveHeader),
     },
     [XSTATE_SSE_BIT] = {
         /* SSE state component is always enabled if XSAVE is supported */
         .feature = FEAT_1_ECX, .bits = CPUID_EXT_XSAVE,
-        /* SSE state is in the legacy region of the XSAVE area */
-        .offset = 0,
         .size = sizeof(X86LegacyXSaveArea) + sizeof(X86XSaveHeader),
     },
     [XSTATE_YMM_BIT] =
           { .feature = FEAT_1_ECX, .bits = CPUID_EXT_AVX,
-            .offset = offsetof(X86XSaveArea, avx_state),
             .size = sizeof(XSaveAVX) },
     [XSTATE_BNDREGS_BIT] =
           { .feature = FEAT_7_0_EBX, .bits = CPUID_7_0_EBX_MPX,
-            .offset = offsetof(X86XSaveArea, bndreg_state),
             .size = sizeof(XSaveBNDREG)  },
     [XSTATE_BNDCSR_BIT] =
           { .feature = FEAT_7_0_EBX, .bits = CPUID_7_0_EBX_MPX,
-            .offset = offsetof(X86XSaveArea, bndcsr_state),
             .size = sizeof(XSaveBNDCSR)  },
     [XSTATE_OPMASK_BIT] =
           { .feature = FEAT_7_0_EBX, .bits = CPUID_7_0_EBX_AVX512F,
-            .offset = offsetof(X86XSaveArea, opmask_state),
             .size = sizeof(XSaveOpmask) },
     [XSTATE_ZMM_Hi256_BIT] =
           { .feature = FEAT_7_0_EBX, .bits = CPUID_7_0_EBX_AVX512F,
-            .offset = offsetof(X86XSaveArea, zmm_hi256_state),
             .size = sizeof(XSaveZMM_Hi256) },
     [XSTATE_Hi16_ZMM_BIT] =
           { .feature = FEAT_7_0_EBX, .bits = CPUID_7_0_EBX_AVX512F,
-            .offset = offsetof(X86XSaveArea, hi16_zmm_state),
             .size = sizeof(XSaveHi16_ZMM) },
     [XSTATE_PKRU_BIT] =
           { .feature = FEAT_7_0_ECX, .bits = CPUID_7_0_ECX_PKU,
-            .offset = offsetof(X86XSaveArea, pkru_state),
             .size = sizeof(XSavePKRU) },
 };
 
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index c9c0a34330..96b672f8bd 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1377,7 +1377,7 @@ typedef struct ExtSaveArea {
 
 #define XSAVE_STATE_AREA_COUNT (XSTATE_PKRU_BIT + 1)
 
-extern const ExtSaveArea x86_ext_save_areas[XSAVE_STATE_AREA_COUNT];
+extern ExtSaveArea x86_ext_save_areas[XSAVE_STATE_AREA_COUNT];
 
 typedef enum TPRAccess {
     TPR_ACCESS_READ,
diff --git a/target/i386/hvf/hvf-cpu.c b/target/i386/hvf/hvf-cpu.c
index 8fbc423888..333db59898 100644
--- a/target/i386/hvf/hvf-cpu.c
+++ b/target/i386/hvf/hvf-cpu.c
@@ -30,6 +30,33 @@ static void hvf_cpu_max_instance_init(X86CPU *cpu)
         hvf_get_supported_cpuid(0xC0000000, 0, R_EAX);
 }
 
+static void hvf_cpu_xsave_init(void)
+{
+    static bool first = true;
+    int i;
+
+    if (!first) {
+        return;
+    }
+    first = false;
+
+    /* x87 and SSE states are in the legacy region of the XSAVE area. */
+    x86_ext_save_areas[XSTATE_FP_BIT].offset = 0;
+    x86_ext_save_areas[XSTATE_SSE_BIT].offset = 0;
+
+    for (i = XSTATE_SSE_BIT + 1; i < XSAVE_STATE_AREA_COUNT; i++) {
+        ExtSaveArea *esa = &x86_ext_save_areas[i];
+
+        if (esa->size) {
+            int sz = hvf_get_supported_cpuid(0xd, i, R_EAX);
+            if (sz != 0) {
+                assert(esa->size == sz);
+                esa->offset = hvf_get_supported_cpuid(0xd, i, R_EBX);
+            }
+        }
+    }
+}
+
 static void hvf_cpu_instance_init(CPUState *cs)
 {
     X86CPU *cpu = X86_CPU(cs);
@@ -42,6 +69,8 @@ static void hvf_cpu_instance_init(CPUState *cs)
     if (cpu->max_features) {
         hvf_cpu_max_instance_init(cpu);
     }
+
+    hvf_cpu_xsave_init();
 }
 
 static void hvf_cpu_accel_class_init(ObjectClass *oc, void *data)
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index e62e8df028..79ba4ed93a 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -270,6 +270,12 @@ int hvf_arch_init_vcpu(CPUState *cpu)
     x86cpu->env.xsave_buf_len = 4096;
     x86cpu->env.xsave_buf = qemu_memalign(4096, x86cpu->env.xsave_buf_len);
 
+    /*
+     * The allocated storage must be large enough for all of the
+     * possible XSAVE state components.
+     */
+    assert(hvf_get_supported_cpuid(0xd, 0, R_ECX) <= x86cpu->env.xsave_buf_len);
+
     hv_vcpu_enable_native_msr(cpu->hvf->fd, MSR_STAR, 1);
     hv_vcpu_enable_native_msr(cpu->hvf->fd, MSR_LSTAR, 1);
     hv_vcpu_enable_native_msr(cpu->hvf->fd, MSR_CSTAR, 1);
diff --git a/target/i386/kvm/kvm-cpu.c b/target/i386/kvm/kvm-cpu.c
index 00369c2000..bbe817764d 100644
--- a/target/i386/kvm/kvm-cpu.c
+++ b/target/i386/kvm/kvm-cpu.c
@@ -122,6 +122,34 @@ static void kvm_cpu_max_instance_init(X86CPU *cpu)
         kvm_arch_get_supported_cpuid(s, 0xC0000000, 0, R_EAX);
 }
 
+static void kvm_cpu_xsave_init(void)
+{
+    static bool first = true;
+    KVMState *s = kvm_state;
+    int i;
+
+    if (!first) {
+        return;
+    }
+    first = false;
+
+    /* x87 and SSE states are in the legacy region of the XSAVE area. */
+    x86_ext_save_areas[XSTATE_FP_BIT].offset = 0;
+    x86_ext_save_areas[XSTATE_SSE_BIT].offset = 0;
+
+    for (i = XSTATE_SSE_BIT + 1; i < XSAVE_STATE_AREA_COUNT; i++) {
+        ExtSaveArea *esa = &x86_ext_save_areas[i];
+
+        if (esa->size) {
+            int sz = kvm_arch_get_supported_cpuid(s, 0xd, i, R_EAX);
+            if (sz != 0) {
+                assert(esa->size == sz);
+                esa->offset = kvm_arch_get_supported_cpuid(s, 0xd, i, R_EBX);
+            }
+        }
+    }
+}
+
 static void kvm_cpu_instance_init(CPUState *cs)
 {
     X86CPU *cpu = X86_CPU(cs);
@@ -141,6 +169,8 @@ static void kvm_cpu_instance_init(CPUState *cs)
     if (cpu->max_features) {
         kvm_cpu_max_instance_init(cpu);
     }
+
+    kvm_cpu_xsave_init();
 }
 
 static void kvm_cpu_accel_class_init(ObjectClass *oc, void *data)
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 41b0764ab7..a85035492f 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1891,6 +1891,13 @@ int kvm_arch_init_vcpu(CPUState *cs)
         env->xsave_buf_len = sizeof(struct kvm_xsave);
         env->xsave_buf = qemu_memalign(4096, env->xsave_buf_len);
         memset(env->xsave_buf, 0, env->xsave_buf_len);
+
+        /*
+         * The allocated storage must be large enough for all of the
+         * possible XSAVE state components.
+         */
+        assert(kvm_arch_get_supported_cpuid(kvm_state, 0xd, 0, R_ECX)
+               <= env->xsave_buf_len);
     }
 
     max_nested_state_len = kvm_max_nested_state_length();
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index 014ebea2f6..e96ec9bbcc 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -80,6 +80,24 @@ static void tcg_cpu_class_init(CPUClass *cc)
     cc->init_accel_cpu = tcg_cpu_init_ops;
 }
 
+static void tcg_cpu_xsave_init(void)
+{
+#define XO(bit, field) \
+    x86_ext_save_areas[bit].offset = offsetof(X86XSaveArea, field);
+
+    XO(XSTATE_FP_BIT, legacy);
+    XO(XSTATE_SSE_BIT, legacy);
+    XO(XSTATE_YMM_BIT, avx_state);
+    XO(XSTATE_BNDREGS_BIT, bndreg_state);
+    XO(XSTATE_BNDCSR_BIT, bndcsr_state);
+    XO(XSTATE_OPMASK_BIT, opmask_state);
+    XO(XSTATE_ZMM_Hi256_BIT, zmm_hi256_state);
+    XO(XSTATE_Hi16_ZMM_BIT, hi16_zmm_state);
+    XO(XSTATE_PKRU_BIT, pkru_state);
+
+#undef XO
+}
+
 /*
  * TCG-specific defaults that override all CPU models when using TCG
  */
@@ -93,6 +111,8 @@ static void tcg_cpu_instance_init(CPUState *cs)
     X86CPU *cpu = X86_CPU(cs);
     /* Special cases not set in the X86CPUDefinition structs: */
     x86_cpu_apply_props(cpu, tcg_default_props);
+
+    tcg_cpu_xsave_init();
 }
 
 static void tcg_cpu_accel_class_init(ObjectClass *oc, void *data)
-- 
2.31.1



