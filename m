Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDF2300696
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 16:07:08 +0100 (CET)
Received: from localhost ([::1]:45620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2y1j-00032I-KG
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 10:07:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1l2y0g-0002Ss-Dn; Fri, 22 Jan 2021 10:06:03 -0500
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a]:36734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1l2y0e-0006KW-Cc; Fri, 22 Jan 2021 10:06:02 -0500
Received: by mail-lj1-x22a.google.com with SMTP id l12so4331266ljc.3;
 Fri, 22 Jan 2021 07:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vtoZeXbkRhPamv52lDb/5xK0jrFHIrqLvC9yePUBcAc=;
 b=ASOZKECV+WY5zAAk1QxBryDKCJ6YCyo/GXp9/XbdaplXJXq0ua/MfqW9O5h3EYABT2
 8RFUDS4RXTxjck7nhVNH+pcLLR8ixPIwmYmqAs33tWRshCjfkBPgEf6KnhbzajGR2u+j
 Ox2a9PbXGsjx+532m9Mm/d0xth0eoyiGaF7LTecwIwpDrEJKpdEVwlMz2HoaXRZ+Lw3M
 TOpmV1AVHcUPCi/9qqcFh0cmR/MLxcxG89GVWfDYCAd/TmM64Sq7zDQFUH1FP1pY25vf
 PErHcc6PMJUgdAC87qmms7xvAzWjLzQrXEF5hFu91ds+hm352lypNbe/AsxdFJfqXa+M
 nzzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vtoZeXbkRhPamv52lDb/5xK0jrFHIrqLvC9yePUBcAc=;
 b=c5lhxt1b6SA7ZZTNhfq7VavFh4FnyNYHIQ3/864tzlfGayfEF7urcmViyRN8h1QmhR
 lOcwTPX5/1Ijlu8q37WhUGg9IPr27YqmXpGYSVDNygKZBfUi4ASy42vUIlfhBCMev9Jw
 FZATrK4lXAjizifygoamR4aLHIHcM5ADFAI83uf77ZIahA6pGO1B5bS7Z9e0Uug/Fkwt
 /fCjljgUTvwKuOiBXlozYUvdwo5DLfuuXNIe5VxEvcykhjJX+qhjyIRmSsghCP+ZzA+J
 6JhWyYH4crj5ta7HXDurb38E5bDq0Z5f0T89XUTmTEWiAo8NrKxV+7BHilwmHznLKwoE
 YuYQ==
X-Gm-Message-State: AOAM532WRvBjNWYwxabiCvqsjb1VHzNOfHMXLKA4QmucNT+HWkRGH9jq
 jQL9YYtkG5zuUl4zBgEkWl15eLSy0ZXuZpUQ
X-Google-Smtp-Source: ABdhPJwaVqQA57UbQyAoynbNdVD/X/yaComIiIuQBZr+owvHX2NEHFjdMLOLpUvBMo2FzAwY7ZrhiA==
X-Received: by 2002:a2e:5011:: with SMTP id e17mr609344ljb.430.1611327957186; 
 Fri, 22 Jan 2021 07:05:57 -0800 (PST)
Received: from localhost.localdomain ([188.243.183.134])
 by smtp.gmail.com with ESMTPSA id a15sm918571lfr.68.2021.01.22.07.05.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 07:05:56 -0800 (PST)
From: yaroshchuk2000@gmail.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3] target/i386/hvf: add vmware-cpuid-freq cpu feature
Date: Fri, 22 Jan 2021 18:05:18 +0300
Message-Id: <20210122150518.3551-1-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210114194703.134333-1-yaroshchuk2000@gmail.com>
References: <20210114194703.134333-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lj1-x22a.google.com
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
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, r.bolshakov@yadro.com,
 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>, dirty@apple.com
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
2.23.0


