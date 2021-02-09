Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05198315129
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 15:03:52 +0100 (CET)
Received: from localhost ([::1]:48254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9TcN-0003pY-22
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 09:03:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1l9TWH-0001ep-Dl
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 08:57:33 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:56180 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1l9TWE-0007xy-VL
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 08:57:33 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 944C1412ED;
 Tue,  9 Feb 2021 13:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1612879047; x=1614693448; bh=P+9c7vJXzbsR73k8ga57NVKMU6p5NL/P3p/
 ufBJCCGQ=; b=XwLO8G7kHdaTrZvgzoQFKe6AsYP056t6glxHCRjjBjZL5iNOAnF
 IPTtGm7e43ZCfO0RA2s+SpHwDVQ+zndiZgwfiyTysFbX3Fv8iK4kR4GzVxRGiDQi
 PsuybVgyNN3f89tjhmj3ACh/2ORbfxTk0kDMzamwd3myPnI+ADEpk61s=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7NuzmIs_9aAW; Tue,  9 Feb 2021 16:57:27 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 3AF3A412E9;
 Tue,  9 Feb 2021 16:57:26 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 9 Feb
 2021 16:57:26 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL hvf 2/5] target/i386/hvf: add vmware-cpuid-freq cpu feature
Date: Tue, 9 Feb 2021 16:57:19 +0300
Message-ID: <20210209135722.4891-3-r.bolshakov@yadro.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210209135722.4891-1-r.bolshakov@yadro.com>
References: <20210209135722.4891-1-r.bolshakov@yadro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>,
 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>
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
---
 target/i386/hvf/hvf.c | 96 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 95 insertions(+), 1 deletion(-)

diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index ed9356565c..5a8914564b 100644
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
2.30.0


