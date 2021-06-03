Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 927EE39A5AF
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:26:02 +0200 (CEST)
Received: from localhost ([::1]:48382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loqAT-0001Em-GB
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:26:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopl2-0001bw-Jl
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:44 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:39700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopl0-0007G5-H6
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:44 -0400
Received: by mail-wr1-x42b.google.com with SMTP id l2so6391727wrw.6
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 08:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=39zWw02n/PyDZkX7vmHiaIpTKhdewTRKIwY8LP7j41w=;
 b=zsDXGUqLMe9N0zzE507fKKk/RxkaLykvjHtf7y1BpzZnXR5sIzValqIy3aILoklbhh
 PBHTJ+Xj21lAizTevfpOo/Y0131VuHnQEcuwCz+N8NefemY+pcna7OvQQmTqEqdrEvzZ
 YmvU/3SDh0eAc79cZImOPvko99FkJ+RhMQZbh9COyT8oM7cJR2lDX41i2hZ3EFuG16nm
 wtyYDEHl4r2/528Rvvivwza2mlkxUtEZmq70vipjCikyU7nX1eL7RkdJjBmFvQXuAV9G
 w/uBmD+q+CqAWbhev05Fsy7FGDK/DiF0Wvt7/Xy5SYAtAMwXqLfAJyayZ+QKHuGmR60a
 71JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=39zWw02n/PyDZkX7vmHiaIpTKhdewTRKIwY8LP7j41w=;
 b=GBUGfn7GHnyDslg3iprBaa0XgXRQhobg3T77Qe5j1Nb2RNwws45UU2guhZjinIfrPI
 uQR1slZrs2Z1IjY5jiCJ7UwEUV0thUoLw3VkXS1doF0g7bgycNWhQOdlBnF2C8RHbVDJ
 j8SiL4ghNIiss/u4ee1xQBExtHPWQXd7Js53c9aq84e7rcw5w78CbroJ2uJ77tEgKacR
 eL9XqgwS7ZvVKzrBryAITktv22LEX33WM/vAqstBMmZRAjKVF4f4t+2CaF3JA6vF2iUf
 AGMralEaR1F4/SEHWIQ/E8MnBjaBYDknLp+3kf9YVGF+m+W3k1AghabRCxKRNq5GI2JR
 RkKQ==
X-Gm-Message-State: AOAM530S/NCfXS3l3/NJI7HrVZriWb7CUrOLBJm44ATVc6MD9cSuqnHo
 9mkSZsejyfD4GYm2iCyH/nJjDalu755d0bYn
X-Google-Smtp-Source: ABdhPJzta6AcObu/vNH/xNMCCHhltlnF3UXlMxYqWDP4FD3zrNu6iIpfpVNj3wH6mLM6MjbjiwZEBw==
X-Received: by 2002:adf:e109:: with SMTP id t9mr651201wrz.372.1622735981306;
 Thu, 03 Jun 2021 08:59:41 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m7sm3856470wrv.35.2021.06.03.08.59.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 08:59:40 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 34/45] hvf: Split out common code on vcpu init and destroy
Date: Thu,  3 Jun 2021 16:58:53 +0100
Message-Id: <20210603155904.26021-35-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210603155904.26021-1-peter.maydell@linaro.org>
References: <20210603155904.26021-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Graf <agraf@csgraf.de>

Until now, Hypervisor.framework has only been available on x86_64 systems.
With Apple Silicon shipping now, it extends its reach to aarch64. To
prepare for support for multiple architectures, let's start moving common
code out into its own accel directory.

This patch splits the vcpu init and destroy functions into a generic and
an architecture specific portion. This also allows us to move the generic
functions into the generic hvf code, removing exported functions.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
Reviewed-by: Sergio Lopez <slp@redhat.com>
Message-id: 20210519202253.76782-8-agraf@csgraf.de
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 accel/hvf/hvf-accel-ops.h |  2 --
 include/sysemu/hvf_int.h  |  2 ++
 accel/hvf/hvf-accel-ops.c | 30 ++++++++++++++++++++++++++++++
 target/i386/hvf/hvf.c     | 23 ++---------------------
 4 files changed, 34 insertions(+), 23 deletions(-)

diff --git a/accel/hvf/hvf-accel-ops.h b/accel/hvf/hvf-accel-ops.h
index 8f992da1686..09fcf220676 100644
--- a/accel/hvf/hvf-accel-ops.h
+++ b/accel/hvf/hvf-accel-ops.h
@@ -12,12 +12,10 @@
 
 #include "sysemu/cpus.h"
 
-int hvf_init_vcpu(CPUState *);
 int hvf_vcpu_exec(CPUState *);
 void hvf_cpu_synchronize_state(CPUState *);
 void hvf_cpu_synchronize_post_reset(CPUState *);
 void hvf_cpu_synchronize_post_init(CPUState *);
 void hvf_cpu_synchronize_pre_loadvm(CPUState *);
-void hvf_vcpu_destroy(CPUState *);
 
 #endif /* HVF_CPUS_H */
diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
index d15fa3302a9..80c1a8f9466 100644
--- a/include/sysemu/hvf_int.h
+++ b/include/sysemu/hvf_int.h
@@ -44,6 +44,8 @@ struct HVFState {
 extern HVFState *hvf_state;
 
 void assert_hvf_ok(hv_return_t ret);
+int hvf_arch_init_vcpu(CPUState *cpu);
+void hvf_arch_vcpu_destroy(CPUState *cpu);
 hvf_slot *hvf_find_overlap_slot(uint64_t, uint64_t);
 int hvf_put_registers(CPUState *);
 int hvf_get_registers(CPUState *);
diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index 7370fcfba09..b262efd8b6c 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -363,6 +363,36 @@ static void hvf_type_init(void)
 
 type_init(hvf_type_init);
 
+static void hvf_vcpu_destroy(CPUState *cpu)
+{
+    hv_return_t ret = hv_vcpu_destroy(cpu->hvf_fd);
+    assert_hvf_ok(ret);
+
+    hvf_arch_vcpu_destroy(cpu);
+}
+
+static int hvf_init_vcpu(CPUState *cpu)
+{
+    int r;
+
+    /* init cpu signals */
+    sigset_t set;
+    struct sigaction sigact;
+
+    memset(&sigact, 0, sizeof(sigact));
+    sigact.sa_handler = dummy_signal;
+    sigaction(SIG_IPI, &sigact, NULL);
+
+    pthread_sigmask(SIG_BLOCK, NULL, &set);
+    sigdelset(&set, SIG_IPI);
+
+    r = hv_vcpu_create((hv_vcpuid_t *)&cpu->hvf_fd, HV_VCPU_DEFAULT);
+    cpu->vcpu_dirty = 1;
+    assert_hvf_ok(r);
+
+    return hvf_arch_init_vcpu(cpu);
+}
+
 /*
  * The HVF-specific vCPU thread function. This one should only run when the host
  * CPU supports the VMX "unrestricted guest" feature.
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 100ede2a4d7..c7132ee370c 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -158,14 +158,12 @@ static bool ept_emulation_fault(hvf_slot *slot, uint64_t gpa, uint64_t ept_qual)
     return false;
 }
 
-void hvf_vcpu_destroy(CPUState *cpu)
+void hvf_arch_vcpu_destroy(CPUState *cpu)
 {
     X86CPU *x86_cpu = X86_CPU(cpu);
     CPUX86State *env = &x86_cpu->env;
 
-    hv_return_t ret = hv_vcpu_destroy((hv_vcpuid_t)cpu->hvf_fd);
     g_free(env->hvf_mmio_buf);
-    assert_hvf_ok(ret);
 }
 
 static void init_tsc_freq(CPUX86State *env)
@@ -210,23 +208,10 @@ static inline bool apic_bus_freq_is_known(CPUX86State *env)
     return env->apic_bus_freq != 0;
 }
 
-int hvf_init_vcpu(CPUState *cpu)
+int hvf_arch_init_vcpu(CPUState *cpu)
 {
-
     X86CPU *x86cpu = X86_CPU(cpu);
     CPUX86State *env = &x86cpu->env;
-    int r;
-
-    /* init cpu signals */
-    sigset_t set;
-    struct sigaction sigact;
-
-    memset(&sigact, 0, sizeof(sigact));
-    sigact.sa_handler = dummy_signal;
-    sigaction(SIG_IPI, &sigact, NULL);
-
-    pthread_sigmask(SIG_BLOCK, NULL, &set);
-    sigdelset(&set, SIG_IPI);
 
     init_emu();
     init_decoder();
@@ -243,10 +228,6 @@ int hvf_init_vcpu(CPUState *cpu)
         }
     }
 
-    r = hv_vcpu_create((hv_vcpuid_t *)&cpu->hvf_fd, HV_VCPU_DEFAULT);
-    cpu->vcpu_dirty = 1;
-    assert_hvf_ok(r);
-
     if (hv_vmx_read_capability(HV_VMX_CAP_PINBASED,
         &hvf_state->hvf_caps->vmx_cap_pinbased)) {
         abort();
-- 
2.20.1


