Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1CA6D7992
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 12:20:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk0Ew-0001So-4l; Wed, 05 Apr 2023 06:19:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk0Et-0001Ri-Ku
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 06:19:39 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk0Eq-0003X4-IK
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 06:19:39 -0400
Received: by mail-wm1-x329.google.com with SMTP id n19so20588683wms.0
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 03:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680689975;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=reJpuebcoI5BKEfS88SjCkcplXXPmguVbMU9Olmibx0=;
 b=Q2+dqv8HKpPQKTf9cQJSeqsGPGkeqsXxu8v+C2JYWo/wkdpZHobUDc9N35z1UbQyXo
 9C6lndVpWvjoGdquQUathNsJoiIiN7nJn3kgNVvT5T7tc01blota5eXmXHc1hE2a/9ew
 2Wf7CCzhPcSAgNhjaTij8S5PpdLVkajwG2fdrCTckKDaeIUqcPO5ZI4SEhoPCSlpK/xc
 jQRVVytzUEGa2Ydc7bSMmlI+Bj89/EomAs72KzqL8mlaSY0qlyPq25y3stucFF3G2pSS
 /sRRUshA2hioO50En8HSMUOtDGPuoJV66S46OhB8lo7qSEotmJH2F75Zpnda8gdb6yr0
 tHhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680689975;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=reJpuebcoI5BKEfS88SjCkcplXXPmguVbMU9Olmibx0=;
 b=36IFppfqZwqfE9nRy4ogZDHz0j+7CAcPI6eoFYg/090jB3s+vLvxdRvNkYtHw6DA02
 oUwlNxcBynzI95jSCTdnBJ/aHOzppPIQVR8nNHE7rOQk4T8zfBcOCvrg/lMm5ymy+2NA
 PYnuRf6OJcVuMTYHk3IEGR3kAMHO74So3DCl12SgfdWV1f21CkhWahp5jjhtjax8b81u
 nNp4YoRrHdkigIOJmF+TcZY7MqlqY5jVGuHGbbZS8i0fkMXyD8KoJymyDunHyai04rDp
 CcbBTT2s39BCAdUd1IqH8umzT9xIL5I1+CeuODsk6S9/L6b3QU68ik90XXWN411Tacrh
 xBIA==
X-Gm-Message-State: AAQBX9cl2+I+Jf9z2hSdU2dMsBTSexDlTvXICrVc09drPdysPmIcr4T1
 P0mOgkSfekqCkh5fLOFDpAPDHoMu5Oa7r0HVGY4=
X-Google-Smtp-Source: AKy350ZAz7PsFWbSoWRxQBkCoHp/n/DjoRXVF/1COGNHcX9m4lAa529X6M54U1ZwDgyYhrM/EeN7Fw==
X-Received: by 2002:a1c:7717:0:b0:3f0:48f4:8454 with SMTP id
 t23-20020a1c7717000000b003f048f48454mr4350332wmi.27.1680689974915; 
 Wed, 05 Apr 2023 03:19:34 -0700 (PDT)
Received: from localhost.localdomain
 (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr. [176.184.52.81])
 by smtp.gmail.com with ESMTPSA id
 d21-20020a1c7315000000b003ed1f6878a5sm1770353wmb.5.2023.04.05.03.19.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 05 Apr 2023 03:19:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Reinoud Zandijk <reinoud@netbsd.org>
Subject: [PATCH 11/14] accel: Inline NVMM get_qemu_vcpu()
Date: Wed,  5 Apr 2023 12:18:08 +0200
Message-Id: <20230405101811.76663-12-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230405101811.76663-1-philmd@linaro.org>
References: <20230405101811.76663-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

No need for this helper to access the CPUState::accel field.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/nvmm/nvmm-all.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
index 97a7225598..1c0168d83c 100644
--- a/target/i386/nvmm/nvmm-all.c
+++ b/target/i386/nvmm/nvmm-all.c
@@ -49,12 +49,6 @@ struct qemu_machine {
 static bool nvmm_allowed;
 static struct qemu_machine qemu_mach;
 
-static struct AccelvCPUState *
-get_qemu_vcpu(CPUState *cpu)
-{
-    return cpu->accel;
-}
-
 static struct nvmm_machine *
 get_nvmm_mach(void)
 {
@@ -86,7 +80,7 @@ nvmm_set_registers(CPUState *cpu)
 {
     CPUX86State *env = cpu->env_ptr;
     struct nvmm_machine *mach = get_nvmm_mach();
-    struct AccelvCPUState *qcpu = get_qemu_vcpu(cpu);
+    struct AccelvCPUState *qcpu = cpu->accel;
     struct nvmm_vcpu *vcpu = &qcpu->vcpu;
     struct nvmm_x64_state *state = vcpu->state;
     uint64_t bitmap;
@@ -223,7 +217,7 @@ nvmm_get_registers(CPUState *cpu)
 {
     CPUX86State *env = cpu->env_ptr;
     struct nvmm_machine *mach = get_nvmm_mach();
-    struct AccelvCPUState *qcpu = get_qemu_vcpu(cpu);
+    struct AccelvCPUState *qcpu = cpu->accel;
     struct nvmm_vcpu *vcpu = &qcpu->vcpu;
     X86CPU *x86_cpu = X86_CPU(cpu);
     struct nvmm_x64_state *state = vcpu->state;
@@ -347,7 +341,7 @@ static bool
 nvmm_can_take_int(CPUState *cpu)
 {
     CPUX86State *env = cpu->env_ptr;
-    struct AccelvCPUState *qcpu = get_qemu_vcpu(cpu);
+    struct AccelvCPUState *qcpu = cpu->accel;
     struct nvmm_vcpu *vcpu = &qcpu->vcpu;
     struct nvmm_machine *mach = get_nvmm_mach();
 
@@ -372,7 +366,7 @@ nvmm_can_take_int(CPUState *cpu)
 static bool
 nvmm_can_take_nmi(CPUState *cpu)
 {
-    struct AccelvCPUState *qcpu = get_qemu_vcpu(cpu);
+    struct AccelvCPUState *qcpu = cpu->accel;
 
     /*
      * Contrary to INTs, NMIs always schedule an exit when they are
@@ -395,7 +389,7 @@ nvmm_vcpu_pre_run(CPUState *cpu)
 {
     CPUX86State *env = cpu->env_ptr;
     struct nvmm_machine *mach = get_nvmm_mach();
-    struct AccelvCPUState *qcpu = get_qemu_vcpu(cpu);
+    struct AccelvCPUState *qcpu = cpu->accel;
     struct nvmm_vcpu *vcpu = &qcpu->vcpu;
     X86CPU *x86_cpu = X86_CPU(cpu);
     struct nvmm_x64_state *state = vcpu->state;
@@ -478,7 +472,7 @@ nvmm_vcpu_pre_run(CPUState *cpu)
 static void
 nvmm_vcpu_post_run(CPUState *cpu, struct nvmm_vcpu_exit *exit)
 {
-    struct AccelvCPUState *qcpu = get_qemu_vcpu(cpu);
+    struct AccelvCPUState *qcpu = cpu->accel;
     CPUX86State *env = cpu->env_ptr;
     X86CPU *x86_cpu = X86_CPU(cpu);
     uint64_t tpr;
@@ -565,7 +559,7 @@ static int
 nvmm_handle_rdmsr(struct nvmm_machine *mach, CPUState *cpu,
     struct nvmm_vcpu_exit *exit)
 {
-    struct AccelvCPUState *qcpu = get_qemu_vcpu(cpu);
+    struct AccelvCPUState *qcpu = cpu->accel;
     struct nvmm_vcpu *vcpu = &qcpu->vcpu;
     X86CPU *x86_cpu = X86_CPU(cpu);
     struct nvmm_x64_state *state = vcpu->state;
@@ -610,7 +604,7 @@ static int
 nvmm_handle_wrmsr(struct nvmm_machine *mach, CPUState *cpu,
     struct nvmm_vcpu_exit *exit)
 {
-    struct AccelvCPUState *qcpu = get_qemu_vcpu(cpu);
+    struct AccelvCPUState *qcpu = cpu->accel;
     struct nvmm_vcpu *vcpu = &qcpu->vcpu;
     X86CPU *x86_cpu = X86_CPU(cpu);
     struct nvmm_x64_state *state = vcpu->state;
@@ -686,7 +680,7 @@ nvmm_vcpu_loop(CPUState *cpu)
 {
     CPUX86State *env = cpu->env_ptr;
     struct nvmm_machine *mach = get_nvmm_mach();
-    struct AccelvCPUState *qcpu = get_qemu_vcpu(cpu);
+    struct AccelvCPUState *qcpu = cpu->accel;
     struct nvmm_vcpu *vcpu = &qcpu->vcpu;
     X86CPU *x86_cpu = X86_CPU(cpu);
     struct nvmm_vcpu_exit *exit = vcpu->exit;
@@ -892,7 +886,7 @@ static void
 nvmm_ipi_signal(int sigcpu)
 {
     if (current_cpu) {
-        struct AccelvCPUState *qcpu = get_qemu_vcpu(current_cpu);
+        struct AccelvCPUState *qcpu = current_cpu->accel;
 #if NVMM_USER_VERSION >= 2
         struct nvmm_vcpu *vcpu = &qcpu->vcpu;
         nvmm_vcpu_stop(vcpu);
@@ -1027,7 +1021,7 @@ void
 nvmm_destroy_vcpu(CPUState *cpu)
 {
     struct nvmm_machine *mach = get_nvmm_mach();
-    struct AccelvCPUState *qcpu = get_qemu_vcpu(cpu);
+    struct AccelvCPUState *qcpu = cpu->accel;
 
     nvmm_vcpu_destroy(mach, &qcpu->vcpu);
     g_free(cpu->accel);
-- 
2.38.1


