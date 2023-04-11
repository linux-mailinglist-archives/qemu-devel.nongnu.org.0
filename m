Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9876DDDB9
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 16:25:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmEwQ-0003nC-8y; Tue, 11 Apr 2023 10:25:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1pmEwM-0003f0-Pj
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 10:25:46 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1pmEwK-0000x8-ST
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 10:25:46 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1a4f7b041dfso5961705ad.3
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 07:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681223143;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xHFM++PPiT79mr+nmbIkSSBQ/6Civ2Z9TYFi1uxFDzw=;
 b=IcU4tYVwYcdh2AX4hZHNlyKsZy9J//wi5Ywc2ItS9c3Nu0STwquU6FAJb7fItx3uzb
 KfBsMN7XWmE590Rh2bk2p1Bm7wXvJxeAcpDH0brjPAAkNaLAMKDZp1NLiI64lth0zJMt
 EYr5+KO9nmBwVxpYq5sioryMD+ZNO1fHpPwOEYFfJ6wjRpbL9KZgse36+ZlGNZ+QnS2Z
 A05+WPbSdaMuR8vfJcXxt2pfljT+7uuJrdNnRllhDFcvw50/3RE8FExyB7IPgFsvv1oh
 AgkiKKjeZ0rfAupP9i9EsEtzb0HILWJlLBWQ88NsnoVLtgvbAupEWYjjit2yHYwzlCbh
 jaeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681223143;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xHFM++PPiT79mr+nmbIkSSBQ/6Civ2Z9TYFi1uxFDzw=;
 b=7c1x5bx+hEik/FoDGquGsud2CMEcKmChihSaN09up+ptNItIt+7+0bH6oZltEjxpgS
 yzX5/EmwQJbbzxWQBi/tuG+8Y9sG5fdH+2jMuNJ5CIgSVxH7K29muzbXbWxKGxfko4VK
 Orp4sFi7X08/m5+6lVtXknorOBZKmwEwIDXKiWVj4swe1DBpHIgbSr0ttvSfn4B43u4O
 3aCDY8mMpyexonCv1+iYcFV6h/PZOKodqEFfr6uiviEuskY6VdzclQe0BpY17RAKLT/f
 ldkhsAhCNXh7z9xtNeR3bFZ9uCJdNJbpFfIEtbYBy1hkklnW0BLO6pL/EhngbFIXVUwA
 2x1g==
X-Gm-Message-State: AAQBX9drWJvLnyRj8bJW96Q9U1wYcuNDYMSBVcAz4tbsFIzcHgpOZRZY
 7UpztUfNGnZy5EVKGnKL5YFnegkkgX75IA==
X-Google-Smtp-Source: AKy350YvYQzVKFj39bysqqyOgbZuZclVuff6UwixIuDPrXpYkoM1D6CCEJvOeG+/Wv8toFw+m27pRQ==
X-Received: by 2002:aa7:8bc5:0:b0:638:dcdf:97d8 with SMTP id
 s5-20020aa78bc5000000b00638dcdf97d8mr6333333pfd.24.1681223142891; 
 Tue, 11 Apr 2023 07:25:42 -0700 (PDT)
Received: from localhost.localdomain ([2001:ee0:4fb3:2ba0:dcb1:c928:97e1:ce5f])
 by smtp.googlemail.com with ESMTPSA id
 n188-20020a6340c5000000b0050bc03741ffsm8822594pga.84.2023.04.11.07.25.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 07:25:42 -0700 (PDT)
From: Bui Quang Minh <minhquangbui99@gmail.com>
To: qemu-devel@nongnu.org
Cc: David Woodhouse <dwmw2@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Bui Quang Minh <minhquangbui99@gmail.com>
Subject: [REPOST PATCH v3 3/5] apic, i386/tcg: add x2apic transitions
Date: Tue, 11 Apr 2023 21:24:38 +0700
Message-Id: <20230411142440.8018-4-minhquangbui99@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230411142440.8018-1-minhquangbui99@gmail.com>
References: <20230411142440.8018-1-minhquangbui99@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=minhquangbui99@gmail.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This commit adds support for x2APIC transitions when writing to
MSR_IA32_APICBASE register and finally adds CPUID_EXT_X2APIC to
TCG_EXT_FEATURES.

Signed-off-by: Bui Quang Minh <minhquangbui99@gmail.com>
---
 hw/intc/apic.c                       | 50 ++++++++++++++++++++++++++++
 hw/intc/apic_common.c                |  7 ++--
 target/i386/cpu-sysemu.c             | 10 ++++++
 target/i386/cpu.c                    |  5 +--
 target/i386/cpu.h                    |  6 ++++
 target/i386/tcg/sysemu/misc_helper.c |  4 +++
 6 files changed, 75 insertions(+), 7 deletions(-)

diff --git a/hw/intc/apic.c b/hw/intc/apic.c
index 0f2f29e679..716fe865d7 100644
--- a/hw/intc/apic.c
+++ b/hw/intc/apic.c
@@ -309,8 +309,41 @@ bool is_x2apic_mode(DeviceState *dev)
     return s->apicbase & MSR_IA32_APICBASE_EXTD;
 }
 
+static void apic_set_base_check(APICCommonState *s, uint64_t val)
+{
+    /* Enable x2apic when x2apic is not supported by CPU */
+    if (!cpu_has_x2apic_feature(&s->cpu->env) &&
+        val & MSR_IA32_APICBASE_EXTD)
+        raise_exception_ra(&s->cpu->env, EXCP0D_GPF, GETPC());
+
+    /*
+     * Transition into invalid state
+     * (s->apicbase & MSR_IA32_APICBASE_ENABLE == 0) &&
+     * (s->apicbase & MSR_IA32_APICBASE_EXTD) == 1
+     */
+    if (!(val & MSR_IA32_APICBASE_ENABLE) &&
+        (val & MSR_IA32_APICBASE_EXTD))
+        raise_exception_ra(&s->cpu->env, EXCP0D_GPF, GETPC());
+
+    /* Invalid transition from disabled mode to x2APIC */
+    if (!(s->apicbase & MSR_IA32_APICBASE_ENABLE) &&
+        !(s->apicbase & MSR_IA32_APICBASE_EXTD) &&
+        (val & MSR_IA32_APICBASE_ENABLE) &&
+        (val & MSR_IA32_APICBASE_EXTD))
+        raise_exception_ra(&s->cpu->env, EXCP0D_GPF, GETPC());
+
+    /* Invalid transition from x2APIC to xAPIC */
+    if ((s->apicbase & MSR_IA32_APICBASE_ENABLE) &&
+        (s->apicbase & MSR_IA32_APICBASE_EXTD) &&
+        (val & MSR_IA32_APICBASE_ENABLE) &&
+        !(val & MSR_IA32_APICBASE_EXTD))
+        raise_exception_ra(&s->cpu->env, EXCP0D_GPF, GETPC());
+}
+
 static void apic_set_base(APICCommonState *s, uint64_t val)
 {
+    apic_set_base_check(s, val);
+
     s->apicbase = (val & 0xfffff000) |
         (s->apicbase & (MSR_IA32_APICBASE_BSP | MSR_IA32_APICBASE_ENABLE));
     /* if disabled, cannot be enabled again */
@@ -319,6 +352,23 @@ static void apic_set_base(APICCommonState *s, uint64_t val)
         cpu_clear_apic_feature(&s->cpu->env);
         s->spurious_vec &= ~APIC_SV_ENABLE;
     }
+
+    /* Transition from disabled mode to xAPIC */
+    if (!(s->apicbase & MSR_IA32_APICBASE_ENABLE) &&
+        (val & MSR_IA32_APICBASE_ENABLE)) {
+        s->apicbase |= MSR_IA32_APICBASE_ENABLE;
+        cpu_set_apic_feature(&s->cpu->env);
+    }
+
+    /* Transition from xAPIC to x2APIC */
+    if (cpu_has_x2apic_feature(&s->cpu->env) &&
+        !(s->apicbase & MSR_IA32_APICBASE_EXTD) &&
+        (val & MSR_IA32_APICBASE_EXTD)) {
+        s->apicbase |= MSR_IA32_APICBASE_EXTD;
+
+        s->log_dest = ((s->initial_apic_id & 0xffff0) << 16) |
+                      (1 << (s->initial_apic_id & 0xf));
+    }
 }
 
 static void apic_set_tpr(APICCommonState *s, uint8_t val)
diff --git a/hw/intc/apic_common.c b/hw/intc/apic_common.c
index d95914066e..396f828be8 100644
--- a/hw/intc/apic_common.c
+++ b/hw/intc/apic_common.c
@@ -43,11 +43,8 @@ void cpu_set_apic_base(DeviceState *dev, uint64_t val)
     if (dev) {
         APICCommonState *s = APIC_COMMON(dev);
         APICCommonClass *info = APIC_COMMON_GET_CLASS(s);
-        /* switching to x2APIC, reset possibly modified xAPIC ID */
-        if (!(s->apicbase & MSR_IA32_APICBASE_EXTD) &&
-            (val & MSR_IA32_APICBASE_EXTD)) {
-            s->id = s->initial_apic_id;
-        }
+        /* Reset possibly modified xAPIC ID */
+        s->id = s->initial_apic_id;
         info->set_base(s, val);
     }
 }
diff --git a/target/i386/cpu-sysemu.c b/target/i386/cpu-sysemu.c
index a9ff10c517..f6bbe33372 100644
--- a/target/i386/cpu-sysemu.c
+++ b/target/i386/cpu-sysemu.c
@@ -235,6 +235,16 @@ void cpu_clear_apic_feature(CPUX86State *env)
     env->features[FEAT_1_EDX] &= ~CPUID_APIC;
 }
 
+void cpu_set_apic_feature(CPUX86State *env)
+{
+    env->features[FEAT_1_EDX] |= CPUID_APIC;
+}
+
+bool cpu_has_x2apic_feature(CPUX86State *env)
+{
+    return env->features[FEAT_1_ECX] & CPUID_EXT_X2APIC;
+}
+
 bool cpu_is_bsp(X86CPU *cpu)
 {
     return cpu_get_apic_base(cpu->apic_state) & MSR_IA32_APICBASE_BSP;
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6576287e5b..6847b2ae02 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -627,12 +627,13 @@ void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
           CPUID_EXT_XSAVE | /* CPUID_EXT_OSXSAVE is dynamic */   \
           CPUID_EXT_MOVBE | CPUID_EXT_AES | CPUID_EXT_HYPERVISOR | \
           CPUID_EXT_RDRAND | CPUID_EXT_AVX | CPUID_EXT_F16C | \
-          CPUID_EXT_FMA)
+          CPUID_EXT_FMA | CPUID_EXT_X2APIC)
           /* missing:
           CPUID_EXT_DTES64, CPUID_EXT_DSCPL, CPUID_EXT_VMX, CPUID_EXT_SMX,
           CPUID_EXT_EST, CPUID_EXT_TM2, CPUID_EXT_CID,
           CPUID_EXT_XTPR, CPUID_EXT_PDCM, CPUID_EXT_PCID, CPUID_EXT_DCA,
-          CPUID_EXT_X2APIC, CPUID_EXT_TSC_DEADLINE_TIMER */
+          CPUID_EXT_TSC_DEADLINE_TIMER
+          */
 
 #ifdef TARGET_X86_64
 #define TCG_EXT2_X86_64_FEATURES (CPUID_EXT2_SYSCALL | CPUID_EXT2_LM)
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 02165a5ad2..53cd8f01dd 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -379,6 +379,10 @@ typedef enum X86Seg {
 #define MSR_IA32_APICBASE_ENABLE        (1<<11)
 #define MSR_IA32_APICBASE_EXTD          (1 << 10)
 #define MSR_IA32_APICBASE_BASE          (0xfffffU<<12)
+#define MSR_IA32_APICBASE_RESERVED \
+        (~(uint64_t)(MSR_IA32_APICBASE_BSP | MSR_IA32_APICBASE_ENABLE \
+                     | MSR_IA32_APICBASE_EXTD | MSR_IA32_APICBASE_BASE))
+
 #define MSR_IA32_FEATURE_CONTROL        0x0000003a
 #define MSR_TSC_ADJUST                  0x0000003b
 #define MSR_IA32_SPEC_CTRL              0x48
@@ -2158,8 +2162,10 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
                    uint32_t *eax, uint32_t *ebx,
                    uint32_t *ecx, uint32_t *edx);
 void cpu_clear_apic_feature(CPUX86State *env);
+void cpu_set_apic_feature(CPUX86State *env);
 void host_cpuid(uint32_t function, uint32_t count,
                 uint32_t *eax, uint32_t *ebx, uint32_t *ecx, uint32_t *edx);
+bool cpu_has_x2apic_feature(CPUX86State *env);
 
 /* helper.c */
 void x86_cpu_set_a20(X86CPU *cpu, int a20_state);
diff --git a/target/i386/tcg/sysemu/misc_helper.c b/target/i386/tcg/sysemu/misc_helper.c
index 1fce2076a3..91a58d4d97 100644
--- a/target/i386/tcg/sysemu/misc_helper.c
+++ b/target/i386/tcg/sysemu/misc_helper.c
@@ -159,6 +159,10 @@ void helper_wrmsr(CPUX86State *env)
         env->sysenter_eip = val;
         break;
     case MSR_IA32_APICBASE:
+        if (val & MSR_IA32_APICBASE_RESERVED) {
+            goto error;
+        }
+
         cpu_set_apic_base(env_archcpu(env)->apic_state, val);
         break;
     case MSR_EFER:
-- 
2.25.1


