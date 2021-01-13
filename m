Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B87B2F5487
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 22:19:52 +0100 (CET)
Received: from localhost ([::1]:45540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kznYV-0005w3-6U
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 16:19:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1kzn8J-0005ly-1B; Wed, 13 Jan 2021 15:52:47 -0500
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:41947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1kzn8E-0008Qh-WE; Wed, 13 Jan 2021 15:52:46 -0500
Received: by mail-lf1-x12d.google.com with SMTP id s26so4773823lfc.8;
 Wed, 13 Jan 2021 12:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P6ZhPA0H7vSh/Bh463Dcax+Pk8uyXk7eLpEOeLQtIVY=;
 b=NJTNKu9Shntepq+YGXp4s+3aXmhCn8KWaPaKm8zhNCfsVOFi8nFByDkfCpL2DPcQrG
 BzSFms24R8nP3accs1UmWbUPkE4kejkp9xxKJ6N94qS+AEGDaX6zqvAOa6IGuScRgHWb
 zWbPNsEERTC45S4Z9VO/JW9lEhYOA8I9I5TAZGjWcaLJHMT8cx+UEwrKY/pjSEg1s/kf
 nyotFVOIt6CEcOjhBqI9cigpSIoQ48hHpGPyJoas6CIrfj0q2M7VnxpI6Qc7NjlHmiYd
 9vcVvuCWT+4K2Rffm+rgeuPQF4ruEsyjA+a6yzECXVWtMvo1h3+12Sv9Yb4t/2BUcBQg
 LpaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P6ZhPA0H7vSh/Bh463Dcax+Pk8uyXk7eLpEOeLQtIVY=;
 b=cWo/9aUOB23OFowp3i25c9cbQSA34xJAqYQQ5NraQ03wzjDwZTDxH5S10xlq1srAFx
 H8dIOwRUgfuQwXVyEaTP1ceAKlbVRBF4rK9OPQb2IWqjpbEjBj9x8GtdcVckPiDT9AG7
 1i7CtcG005UU76QfxKL7HzlTXg4HmUQ6otIcHuT5X5KPgQVPIdV2S6+wtcFAmcXy3MSC
 X9y71xBiAsokFryFDq+Ihu41A/9E+40ZdL7sPhnoJFp/jpawGmLTI3yhS7qxDWSkHVkY
 p+M3fRqnepoewcrhRjso+ywF5rNhG3HHJh9IOXRQ7rWG98mFbjj3r5nhesV8f8Npt/ez
 gu/w==
X-Gm-Message-State: AOAM530nyvJBDrgqu63pBrwk2swZaa98UepCGWf9+P5DYkJWlVbxwwv+
 FWRpFAKQL7kC/QzhVBLGzp+wrJ7/H7JmFdtN
X-Google-Smtp-Source: ABdhPJyBB3m+7UgzLR6B6HC5AlQyQAjgmDlaGSG3UQ8Dij2pJjUqmfqoAlrSlGbzOn05t3jjwaULAQ==
X-Received: by 2002:a19:7d85:: with SMTP id y127mr1596523lfc.253.1610571159718; 
 Wed, 13 Jan 2021 12:52:39 -0800 (PST)
Received: from localhost.localdomain ([188.243.183.134])
 by smtp.gmail.com with ESMTPSA id m7sm317605lfb.146.2021.01.13.12.52.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 12:52:38 -0800 (PST)
From: yaroshchuk2000@gmail.com
To: qemu-devel@nongnu.org
Subject: [PATCH] target/i386/hvf: add vmware-cpuid-freq cpu feature
Date: Wed, 13 Jan 2021 23:52:21 +0300
Message-Id: <20210113205221.32308-1-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 13 Jan 2021 16:18:39 -0500
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
Cc: qemu-trivial@nongnu.org, r.bolshakov@yadro.com,
 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>

For `-accel hvf` cpu_x86_cpuid() is wrapped with hvf_cpu_x86_cpuid() to
add paravirtualization cpuid leaf 0x40000010
https://lkml.org/lkml/2008/10/1/246

Leaf 0x40000010, Timing Information:
EAX: (Virtual) TSC frequency in kHz.
EBX: (Virtual) Bus (local apic timer) frequency in kHz.
ECX, EDX: RESERVED (Per above, reserved fields are set to zero).

On macOS TSC and APIC Bus frequencies can be readed by sysctl call with
names `machdep.tsc.frequency` and `hw.busfrequency`

This options is required for Darwin-XNU guest to be synchronized with
host

Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
---
 target/i386/hvf/hvf.c | 92 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 91 insertions(+), 1 deletion(-)

diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index ed9356565c..0873e4969e 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -65,6 +65,7 @@
 
 #include <Hypervisor/hv.h>
 #include <Hypervisor/hv_vmx.h>
+#include <sys/sysctl.h>
 
 #include "exec/address-spaces.h"
 #include "hw/i386/apic_internal.h"
@@ -456,6 +457,50 @@ static void dummy_signal(int sig)
 {
 }
 
+static void init_tsc_freq(CPUX86State *env)
+{
+    size_t length;
+    uint64_t tsc_freq;
+
+    if (env->tsc_khz != 0) {
+        return;
+    }
+
+    length = sizeof(uint64_t);
+    if (sysctlbyname("machdep.tsc.frequency", &tsc_freq, &length, NULL, 0)) {
+        /* fprintf(stderr, "%s: sysctl machdep.tsc.frequency errored\n", __func__); */
+        return;
+    }
+    env->tsc_khz = tsc_freq / 1000;  /* Hz to KHz */
+}
+
+static void init_apic_bus_freq(CPUX86State *env)
+{
+    size_t length;
+    uint64_t bus_freq;
+
+    if (env->apic_bus_freq != 0) {
+        return;
+    }
+
+    length = sizeof(uint64_t);
+    if (sysctlbyname("hw.busfrequency", &bus_freq, &length, NULL, 0)) {
+        /* fprintf(stderr, "%s: sysctl hw.busfrequency errored\n", __func__); */
+        return;
+    }
+    env->apic_bus_freq = bus_freq;
+}
+
+static inline bool tsc_is_known(CPUX86State *env)
+{
+    return env->tsc_khz != 0;
+}
+
+static inline bool apic_bus_freq_is_known(CPUX86State *env)
+{
+    return env->apic_bus_freq != 0;
+}
+
 int hvf_init_vcpu(CPUState *cpu)
 {
 
@@ -480,6 +525,15 @@ int hvf_init_vcpu(CPUState *cpu)
     hvf_state->hvf_caps = g_new0(struct hvf_vcpu_caps, 1);
     env->hvf_mmio_buf = g_new(char, 4096);
 
+    if (x86cpu->vmware_cpuid_freq) {
+        init_tsc_freq(env);
+        init_apic_bus_freq(env);
+
+        if (!tsc_is_known(env) || !apic_bus_freq_is_known(env)) {
+            error_report("vmware-cpuid-freq: feature couldn't be enabled");
+        }
+    }
+
     r = hv_vcpu_create((hv_vcpuid_t *)&cpu->hvf_fd, HV_VCPU_DEFAULT);
     cpu->vcpu_dirty = 1;
     assert_hvf_ok(r);
@@ -597,6 +651,42 @@ static void hvf_store_events(CPUState *cpu, uint32_t ins_len, uint64_t idtvec_in
     }
 }
 
+static void hvf_cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
+                              uint32_t *eax, uint32_t *ebx,
+                              uint32_t *ecx, uint32_t *edx)
+{
+    /*
+     * A wrapper extends cpu_x86_cpuid with 0x40000000 and 0x40000010 leafs
+     * Provides vmware-cpuid-freq support to hvf
+     */
+
+    uint32_t signature[3];
+
+    if (!tsc_is_known(env) || !apic_bus_freq_is_known(env)) {
+        cpu_x86_cpuid(env, index, count, eax, ebx, ecx, edx);
+        return;
+    }
+
+    switch (index) {
+        case 0x40000000:
+            memcpy(signature, "TCGTCGTCGTCG", 12); /* QEMU Signature */
+            *eax = 0x40000010;                     /* Max available cpuid leaf */
+            *ebx = signature[0];
+            *ecx = signature[1];
+            *edx = signature[2];
+            break;
+        case 0x40000010:
+            *eax = env->tsc_khz;
+            *ebx = env->apic_bus_freq / 1000; /* Hz to KHz */
+            *ecx = 0;
+            *edx = 0;
+            break;
+        default:
+            cpu_x86_cpuid(env, index, count, eax, ebx, ecx, edx);
+            break;
+    }
+}
+
 int hvf_vcpu_exec(CPUState *cpu)
 {
     X86CPU *x86_cpu = X86_CPU(cpu);
@@ -734,7 +824,7 @@ int hvf_vcpu_exec(CPUState *cpu)
             uint32_t rcx = (uint32_t)rreg(cpu->hvf_fd, HV_X86_RCX);
             uint32_t rdx = (uint32_t)rreg(cpu->hvf_fd, HV_X86_RDX);
 
-            cpu_x86_cpuid(env, rax, rcx, &rax, &rbx, &rcx, &rdx);
+            hvf_cpu_x86_cpuid(env, rax, rcx, &rax, &rbx, &rcx, &rdx);
 
             wreg(cpu->hvf_fd, HV_X86_RAX, rax);
             wreg(cpu->hvf_fd, HV_X86_RBX, rbx);
-- 
2.28.0


