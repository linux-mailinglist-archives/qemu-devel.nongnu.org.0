Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 440723BC997
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:23:35 +0200 (CEST)
Received: from localhost ([::1]:38914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0iEn-0007tb-V7
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:23:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0htr-0000mi-Jd
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:01:55 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:37486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0htn-0002Fo-CD
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:01:55 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 r9-20020a7bc0890000b02901f347b31d55so1280543wmh.2
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 03:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XvwNkjs/1U6S6heNgXVDLARM2koZgG1qtNjsRM8HeCY=;
 b=rz3Le0ZECuxykPJrGcbm5jvcC0hkFQdEPzhCek4BnBnKFTK7qRRq5a8hLg+2C2/owL
 GR9qn06TZTnexGetVoWfxYaSqe1eCSV/h84dWJSOCnp4jC0FPHEyszqE6e6LDAEOGRqo
 viD/xxIWL5dN3ZaYqU1YiNwV2CeOJDxcXeh3XLNTojtS6Gb1y8l6ULRNeeJPBkfgFvIX
 WpVZ56hCRz7okfs5AmdCUKyFmiMh2zuManPn9EDkzBvd1BKLPHcDadQlABzzzU+OUyv1
 LFmWxpYLr1ZbdmDgYqEqw1x91EtS3im9imbWZddcy472wosqImuxO8mAA7IqvqfhZdU6
 n0MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XvwNkjs/1U6S6heNgXVDLARM2koZgG1qtNjsRM8HeCY=;
 b=IUxeyEI3jSM/wVNnBpTn0LvamtPr+x13woYqFyUZo6oMkzZze2Xwwwx89zxH/cAexC
 LG6Qos3xyY9Wn9S+LnsjIT+cITqYICWgIWnevkajkRvYYiTaXzgZVYtEB5eI4CuUaWzE
 NsMhBeRvXXF1Bx3J6k+ieyvvao5ax5lCmCVm8oUYdJE3PplKvE5Ijp5ID8GcU78W1vXj
 Ft/1a2US+Zt7ygPCsvuGMtzFztVVomjgxxVpLLgL9L9DfzoQ4lS54h6GLjHCReFoJPwi
 rr5RH0fZzSTxjI9t9kxLXozGI3ictqvboNJlEXJri+FbwfSEVYAAgpP5PgSZN7Bk+hLz
 mVQg==
X-Gm-Message-State: AOAM531oVKglfryt9W5VfX+Jwi/MNVv7/n1/IOYm2pDoN54E5TjOJJiy
 JR+19/YQXd046fN/0z5f1dsTB3/6rUI=
X-Google-Smtp-Source: ABdhPJx2pDjzcdndo3moii8BWqiSMhHViEVdGIsUWf1blgf0c9xJfsd84jckpT8ljhMufR0H/fLy3g==
X-Received: by 2002:a05:600c:3648:: with SMTP id
 y8mr19748624wmq.174.1625565709851; 
 Tue, 06 Jul 2021 03:01:49 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v15sm2331268wmj.39.2021.07.06.03.01.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 03:01:49 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/40] target/i386: Pass buffer and length to XSAVE helper
Date: Tue,  6 Jul 2021 12:01:12 +0200
Message-Id: <20210706100141.303960-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210706100141.303960-1-pbonzini@redhat.com>
References: <20210706100141.303960-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32a.google.com
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

In preparation for removing assumptions about XSAVE area offsets, pass
a buffer pointer and buffer length to the XSAVE helper functions.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
Message-Id: <20210705104632.2902400-5-david.edmondson@oracle.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.h          |  5 +++--
 target/i386/hvf/hvf.c      |  3 ++-
 target/i386/hvf/x86hvf.c   | 19 ++++++++-----------
 target/i386/kvm/kvm.c      | 13 +++++++------
 target/i386/xsave_helper.c | 17 +++++++++--------
 5 files changed, 29 insertions(+), 28 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 92f9ca264c..ada2941c6e 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1667,6 +1667,7 @@ typedef struct CPUX86State {
     uint64_t apic_bus_freq;
 #if defined(CONFIG_KVM) || defined(CONFIG_HVF)
     void *xsave_buf;
+    uint32_t xsave_buf_len;
 #endif
 #if defined(CONFIG_KVM)
     struct kvm_nested_state *nested_state;
@@ -2227,8 +2228,8 @@ void x86_cpu_dump_local_apic_state(CPUState *cs, int flags);
 /* cpu.c */
 bool cpu_is_bsp(X86CPU *cpu);
 
-void x86_cpu_xrstor_all_areas(X86CPU *cpu, const X86XSaveArea *buf);
-void x86_cpu_xsave_all_areas(X86CPU *cpu, X86XSaveArea *buf);
+void x86_cpu_xrstor_all_areas(X86CPU *cpu, const void *buf, uint32_t buflen);
+void x86_cpu_xsave_all_areas(X86CPU *cpu, void *buf, uint32_t buflen);
 void x86_update_hflags(CPUX86State* env);
 
 static inline bool hyperv_feat_enabled(X86CPU *cpu, int feat)
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 346dbcc26f..e62e8df028 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -267,7 +267,8 @@ int hvf_arch_init_vcpu(CPUState *cpu)
     wvmcs(cpu->hvf->fd, VMCS_TPR_THRESHOLD, 0);
 
     x86cpu = X86_CPU(cpu);
-    x86cpu->env.xsave_buf = qemu_memalign(4096, 4096);
+    x86cpu->env.xsave_buf_len = 4096;
+    x86cpu->env.xsave_buf = qemu_memalign(4096, x86cpu->env.xsave_buf_len);
 
     hv_vcpu_enable_native_msr(cpu->hvf->fd, MSR_STAR, 1);
     hv_vcpu_enable_native_msr(cpu->hvf->fd, MSR_LSTAR, 1);
diff --git a/target/i386/hvf/x86hvf.c b/target/i386/hvf/x86hvf.c
index 2ced2c2478..05ec1bddc4 100644
--- a/target/i386/hvf/x86hvf.c
+++ b/target/i386/hvf/x86hvf.c
@@ -73,14 +73,12 @@ void hvf_get_segment(SegmentCache *qseg, struct vmx_segment *vmx_seg)
 
 void hvf_put_xsave(CPUState *cpu_state)
 {
+    void *xsave = X86_CPU(cpu_state)->env.xsave_buf;
+    uint32_t xsave_len = X86_CPU(cpu_state)->env.xsave_buf_len;
 
-    struct X86XSaveArea *xsave;
+    x86_cpu_xsave_all_areas(X86_CPU(cpu_state), xsave, xsave_len);
 
-    xsave = X86_CPU(cpu_state)->env.xsave_buf;
-
-    x86_cpu_xsave_all_areas(X86_CPU(cpu_state), xsave);
-
-    if (hv_vcpu_write_fpstate(cpu_state->hvf->fd, (void*)xsave, 4096)) {
+    if (hv_vcpu_write_fpstate(cpu_state->hvf->fd, xsave, xsave_len)) {
         abort();
     }
 }
@@ -158,15 +156,14 @@ void hvf_put_msrs(CPUState *cpu_state)
 
 void hvf_get_xsave(CPUState *cpu_state)
 {
-    struct X86XSaveArea *xsave;
+    void *xsave = X86_CPU(cpu_state)->env.xsave_buf;
+    uint32_t xsave_len = X86_CPU(cpu_state)->env.xsave_buf_len;
 
-    xsave = X86_CPU(cpu_state)->env.xsave_buf;
-
-    if (hv_vcpu_read_fpstate(cpu_state->hvf->fd, (void*)xsave, 4096)) {
+    if (hv_vcpu_read_fpstate(cpu_state->hvf->fd, xsave, xsave_len)) {
         abort();
     }
 
-    x86_cpu_xrstor_all_areas(X86_CPU(cpu_state), xsave);
+    x86_cpu_xrstor_all_areas(X86_CPU(cpu_state), xsave, xsave_len);
 }
 
 void hvf_get_segments(CPUState *cpu_state)
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 3ab1d71775..41b0764ab7 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1888,8 +1888,9 @@ int kvm_arch_init_vcpu(CPUState *cs)
     }
 
     if (has_xsave) {
-        env->xsave_buf = qemu_memalign(4096, sizeof(struct kvm_xsave));
-        memset(env->xsave_buf, 0, sizeof(struct kvm_xsave));
+        env->xsave_buf_len = sizeof(struct kvm_xsave);
+        env->xsave_buf = qemu_memalign(4096, env->xsave_buf_len);
+        memset(env->xsave_buf, 0, env->xsave_buf_len);
     }
 
     max_nested_state_len = kvm_max_nested_state_length();
@@ -2469,12 +2470,12 @@ static int kvm_put_fpu(X86CPU *cpu)
 static int kvm_put_xsave(X86CPU *cpu)
 {
     CPUX86State *env = &cpu->env;
-    X86XSaveArea *xsave = env->xsave_buf;
+    void *xsave = env->xsave_buf;
 
     if (!has_xsave) {
         return kvm_put_fpu(cpu);
     }
-    x86_cpu_xsave_all_areas(cpu, xsave);
+    x86_cpu_xsave_all_areas(cpu, xsave, env->xsave_buf_len);
 
     return kvm_vcpu_ioctl(CPU(cpu), KVM_SET_XSAVE, xsave);
 }
@@ -3119,7 +3120,7 @@ static int kvm_get_fpu(X86CPU *cpu)
 static int kvm_get_xsave(X86CPU *cpu)
 {
     CPUX86State *env = &cpu->env;
-    X86XSaveArea *xsave = env->xsave_buf;
+    void *xsave = env->xsave_buf;
     int ret;
 
     if (!has_xsave) {
@@ -3130,7 +3131,7 @@ static int kvm_get_xsave(X86CPU *cpu)
     if (ret < 0) {
         return ret;
     }
-    x86_cpu_xrstor_all_areas(cpu, xsave);
+    x86_cpu_xrstor_all_areas(cpu, xsave, env->xsave_buf_len);
 
     return 0;
 }
diff --git a/target/i386/xsave_helper.c b/target/i386/xsave_helper.c
index 818115e7d2..b16c6ac0fe 100644
--- a/target/i386/xsave_helper.c
+++ b/target/i386/xsave_helper.c
@@ -6,14 +6,16 @@
 
 #include "cpu.h"
 
-void x86_cpu_xsave_all_areas(X86CPU *cpu, X86XSaveArea *buf)
+void x86_cpu_xsave_all_areas(X86CPU *cpu, void *buf, uint32_t buflen)
 {
     CPUX86State *env = &cpu->env;
     X86XSaveArea *xsave = buf;
-
     uint16_t cwd, swd, twd;
     int i;
-    memset(xsave, 0, sizeof(X86XSaveArea));
+
+    assert(buflen >= sizeof(*xsave));
+
+    memset(xsave, 0, buflen);
     twd = 0;
     swd = env->fpus & ~(7 << 11);
     swd |= (env->fpstt & 7) << 11;
@@ -56,17 +58,17 @@ void x86_cpu_xsave_all_areas(X86CPU *cpu, X86XSaveArea *buf)
             16 * sizeof env->xmm_regs[16]);
     memcpy(&xsave->pkru_state, &env->pkru, sizeof env->pkru);
 #endif
-
 }
 
-void x86_cpu_xrstor_all_areas(X86CPU *cpu, const X86XSaveArea *buf)
+void x86_cpu_xrstor_all_areas(X86CPU *cpu, const void *buf, uint32_t buflen)
 {
-
     CPUX86State *env = &cpu->env;
     const X86XSaveArea *xsave = buf;
-
     int i;
     uint16_t cwd, swd, twd;
+
+    assert(buflen >= sizeof(*xsave));
+
     cwd = xsave->legacy.fcw;
     swd = xsave->legacy.fsw;
     twd = xsave->legacy.ftw;
@@ -108,5 +110,4 @@ void x86_cpu_xrstor_all_areas(X86CPU *cpu, const X86XSaveArea *buf)
            16 * sizeof env->xmm_regs[16]);
     memcpy(&env->pkru, &xsave->pkru_state, sizeof env->pkru);
 #endif
-
 }
-- 
2.31.1



