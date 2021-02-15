Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F9931BA7B
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 14:40:23 +0100 (CET)
Received: from localhost ([::1]:46108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBe6w-0002Q2-E5
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 08:40:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lBdk2-0005hL-4n
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 08:16:42 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:33609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lBdk0-0005ZP-FO
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 08:16:41 -0500
Received: by mail-ed1-x52d.google.com with SMTP id c6so8021234ede.0
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 05:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kax+fTmbEkmsBktA3FVc+VoFFDt7mh+TEtj+R0qVDHE=;
 b=Nz6k3F99nHkK1qCdHVuMMN97WZfVX7hrOx3ZYY9egGeereTGTBBS/Umzy0hYi6dPqS
 rU4JpGpX6W4UGObKzcSnkPOI4tv26d1iUMSLnJLMXId0aqiDPIyWksiFqFbt5KWr4gWa
 h7RnV0S/YXwSNT5eGH3HyKml+aSQe/xo065mtMSXHsD0S4EgT9SVCGqAJvQyKbqe4HvB
 ZYLGtLSPWHtp1h1wNnsbUK4EutMWolxr07hiWUKL7ZutswR191S0Y4odnXlzgUTYpEJX
 7dleSwbmLKc5r/EuMKaqKYwNNmyRGYm6bLnKtRly6tsYgRrhtffqoHT0+LijxmLSFPj5
 i14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Kax+fTmbEkmsBktA3FVc+VoFFDt7mh+TEtj+R0qVDHE=;
 b=UaOLGsqqg6J76M7bwQClAsLnuWLnhFgZet+rR3wppeZq5JfHzTShf16KhAXe6pLkPi
 5jwJlnCHfxoHt4Xl5QKGdd/LOmmt1FxL5QN0WCoZFz/dqGBzVOagYARQUTpvSeZkI6SY
 ZLjZqckxVi1vvPyi2D+UTmdHcBN7NxyJzkDyqUjxQ/02/DQLUps+kuel9NM2+uklEDDj
 qwI0GmSFgm3/wRisVEnUWcRhNhOnEcdjPqVCNcadqijjm2RnD2GZGAlgLgL+diKeL882
 xXnkwMfAPPe3DXAF9tA1HTk+2ctSVax1KkRAdFL60wdpvC2AGf18GaXc7cdY2EHjVX/f
 XABg==
X-Gm-Message-State: AOAM532En/MUw44w+pzqX4MU46dYIoyVGlwntmAeqgma8fUXb5ca4Dwl
 Ua8ceercQPnd+8KZaSsTpIgRVPxldTk=
X-Google-Smtp-Source: ABdhPJzSellroVhCP7ElTyG3U7nUHLjhkkvRv2CAJ17oo+b0kocLlJVJVAGCpfRBc9wTiOhSVidqtw==
X-Received: by 2002:a05:6402:2053:: with SMTP id
 bc19mr15127370edb.230.1613394999181; 
 Mon, 15 Feb 2021 05:16:39 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o4sm9950184edw.78.2021.02.15.05.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 05:16:38 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/19] target/i386/hvf: add vmware-cpuid-freq cpu feature
Date: Mon, 15 Feb 2021 14:16:23 +0100
Message-Id: <20210215131626.65640-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210215131626.65640-1-pbonzini@redhat.com>
References: <20210215131626.65640-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>,
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

Leaf 0x40000000 not exposes HVF leaving hypervisor signature empty

Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Message-Id: <20210122150518.3551-1-yaroshchuk2000@gmail.com>
Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/hvf/hvf.c | 96 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 95 insertions(+), 1 deletion(-)

diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 5b90dcdf88..10a06c3c79 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -65,6 +65,7 @@
 
 #include <Hypervisor/hv.h>
 #include <Hypervisor/hv_vmx.h>
+#include <sys/sysctl.h>
 
 #include "exec/address-spaces.h"
 #include "hw/i386/apic_internal.h"
@@ -456,6 +457,48 @@ static void dummy_signal(int sig)
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
 
@@ -480,6 +523,15 @@ int hvf_init_vcpu(CPUState *cpu)
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
@@ -597,6 +649,48 @@ static void hvf_store_events(CPUState *cpu, uint32_t ins_len, uint64_t idtvec_in
     }
 }
 
+static void hvf_cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
+                              uint32_t *eax, uint32_t *ebx,
+                              uint32_t *ecx, uint32_t *edx)
+{
+    /*
+     * A wrapper extends cpu_x86_cpuid with 0x40000000 and 0x40000010 leafs,
+     * leafs 0x40000001-0x4000000F are filled with zeros
+     * Provides vmware-cpuid-freq support to hvf
+     *
+     * Note: leaf 0x40000000 not exposes HVF,
+     * leaving hypervisor signature empty
+     */
+
+    if (index < 0x40000000 || index > 0x40000010 ||
+        !tsc_is_known(env) || !apic_bus_freq_is_known(env)) {
+
+        cpu_x86_cpuid(env, index, count, eax, ebx, ecx, edx);
+        return;
+    }
+
+    switch (index) {
+    case 0x40000000:
+        *eax = 0x40000010;    /* Max available cpuid leaf */
+        *ebx = 0;             /* Leave signature empty */
+        *ecx = 0;
+        *edx = 0;
+        break;
+    case 0x40000010:
+        *eax = env->tsc_khz;
+        *ebx = env->apic_bus_freq / 1000; /* Hz to KHz */
+        *ecx = 0;
+        *edx = 0;
+        break;
+    default:
+        *eax = 0;
+        *ebx = 0;
+        *ecx = 0;
+        *edx = 0;
+        break;
+    }
+}
+
 int hvf_vcpu_exec(CPUState *cpu)
 {
     X86CPU *x86_cpu = X86_CPU(cpu);
@@ -734,7 +828,7 @@ int hvf_vcpu_exec(CPUState *cpu)
             uint32_t rcx = (uint32_t)rreg(cpu->hvf_fd, HV_X86_RCX);
             uint32_t rdx = (uint32_t)rreg(cpu->hvf_fd, HV_X86_RDX);
 
-            cpu_x86_cpuid(env, rax, rcx, &rax, &rbx, &rcx, &rdx);
+            hvf_cpu_x86_cpuid(env, rax, rcx, &rax, &rbx, &rcx, &rdx);
 
             wreg(cpu->hvf_fd, HV_X86_RAX, rax);
             wreg(cpu->hvf_fd, HV_X86_RBX, rbx);
-- 
2.29.2



