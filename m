Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 437326D7998
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 12:20:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk0En-00013L-9L; Wed, 05 Apr 2023 06:19:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk0Ek-0000ta-Ve
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 06:19:31 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk0Ei-0003SY-Ot
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 06:19:30 -0400
Received: by mail-wr1-x42f.google.com with SMTP id r11so35629429wrr.12
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 03:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680689967;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zfz8X/GUHgutjcuWgCA2LWUZkCc4gRaFUTsRO6OH06g=;
 b=yL8zWIHfSIdBZYPkNDculPyk2YWRIlBQX8fQHgjeuSYeTxaloVwCCglH5DXA7/0zDg
 TZoThoM/7Yzk229VxX9xWe1sKCb9xPkVbKN8Rue8VJ9iqfCxkzpWDThAQYbFg2V+tT4n
 0lFcGByrmLtNLB2oRBl4LbPvsUeFbnwE43+pzddA4+wnnvx5l0rEaM3ytpPw2h5NOvmZ
 DVCYR6+eBbGkSb54pQlKLGqI1fhY/v3/lWGMSe4bZ8LvxqbH70eUp/6qo6vPZ7mUdh5Y
 PeQA12GP5hcgxOvodwGCZ4f1KCUcAPsr/zlEr6sTgBGcMgExpeywl1vstjMaVXIEP1HP
 4juw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680689967;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zfz8X/GUHgutjcuWgCA2LWUZkCc4gRaFUTsRO6OH06g=;
 b=n1VyGn6qxx/KuGIFOHZZQk7L2rKX0RliU1JmPWTmSmZjVHfkxb1j5CwJsC8sgBZ1W4
 cyIoaSohH7aTrQpr3rqRzCKBkrSksrhfh7q3zgTtmIy5sdMBApHUVux3Qxzh7oNdlQ7j
 t181bbH89ZK8sB9LCIl77DHwO8aNzmUFbhA6lgitDRybpTEI5fqeHJzSGR0/VlN1IXwW
 TyMY+bGnt5uT4P5gLjQnhD5Xce7rby41jLFHaaK101dz2Og9kK/x9uKraoKlRQ4yZ6hY
 IlX8VTacmdbUwdtg8F1lJnbX/uGg82d3l2t9MyDNEp97qaf7shdyIRgxSg/iIOk1xRWD
 w1Ng==
X-Gm-Message-State: AAQBX9dqyEu2oO7EPPxkujaqE0F4aXPdvjlF2l1pR1Cd3Oh3wRxQ1jAh
 CVL3RICw4Vxu5aSGeutm2adJrNecTTwX4hCV9fI=
X-Google-Smtp-Source: AKy350Zvml7eWtPRqrRcRnGg6qq51tcU3Hzdj52W85LNQPphjff69u1l2lWyWIRrXMamHJtWfSOkkw==
X-Received: by 2002:adf:e48b:0:b0:2c7:6bb:fb7a with SMTP id
 i11-20020adfe48b000000b002c706bbfb7amr4270631wrm.54.1680689967157; 
 Wed, 05 Apr 2023 03:19:27 -0700 (PDT)
Received: from localhost.localdomain
 (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr. [176.184.52.81])
 by smtp.gmail.com with ESMTPSA id
 q12-20020adff78c000000b002c5d3f0f737sm14591138wrp.30.2023.04.05.03.19.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 05 Apr 2023 03:19:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Reinoud Zandijk <reinoud@netbsd.org>
Subject: [PATCH 10/14] accel: Rename NVMM struct qemu_vcpu -> struct
 AccelvCPUState
Date: Wed,  5 Apr 2023 12:18:07 +0200
Message-Id: <20230405101811.76663-11-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230405101811.76663-1-philmd@linaro.org>
References: <20230405101811.76663-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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

We want all accelerators to share the same opaque pointer in
CPUState. Rename NVMM 'qemu_vcpu' as 'AccelvCPUState'.

Replace g_try_malloc0() by g_try_new0() for readability.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/nvmm/nvmm-all.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
index 45fd318d23..97a7225598 100644
--- a/target/i386/nvmm/nvmm-all.c
+++ b/target/i386/nvmm/nvmm-all.c
@@ -26,7 +26,7 @@
 
 #include <nvmm.h>
 
-struct qemu_vcpu {
+struct AccelvCPUState {
     struct nvmm_vcpu vcpu;
     uint8_t tpr;
     bool stop;
@@ -49,10 +49,10 @@ struct qemu_machine {
 static bool nvmm_allowed;
 static struct qemu_machine qemu_mach;
 
-static struct qemu_vcpu *
+static struct AccelvCPUState *
 get_qemu_vcpu(CPUState *cpu)
 {
-    return (struct qemu_vcpu *)cpu->accel;
+    return cpu->accel;
 }
 
 static struct nvmm_machine *
@@ -86,7 +86,7 @@ nvmm_set_registers(CPUState *cpu)
 {
     CPUX86State *env = cpu->env_ptr;
     struct nvmm_machine *mach = get_nvmm_mach();
-    struct qemu_vcpu *qcpu = get_qemu_vcpu(cpu);
+    struct AccelvCPUState *qcpu = get_qemu_vcpu(cpu);
     struct nvmm_vcpu *vcpu = &qcpu->vcpu;
     struct nvmm_x64_state *state = vcpu->state;
     uint64_t bitmap;
@@ -223,7 +223,7 @@ nvmm_get_registers(CPUState *cpu)
 {
     CPUX86State *env = cpu->env_ptr;
     struct nvmm_machine *mach = get_nvmm_mach();
-    struct qemu_vcpu *qcpu = get_qemu_vcpu(cpu);
+    struct AccelvCPUState *qcpu = get_qemu_vcpu(cpu);
     struct nvmm_vcpu *vcpu = &qcpu->vcpu;
     X86CPU *x86_cpu = X86_CPU(cpu);
     struct nvmm_x64_state *state = vcpu->state;
@@ -347,7 +347,7 @@ static bool
 nvmm_can_take_int(CPUState *cpu)
 {
     CPUX86State *env = cpu->env_ptr;
-    struct qemu_vcpu *qcpu = get_qemu_vcpu(cpu);
+    struct AccelvCPUState *qcpu = get_qemu_vcpu(cpu);
     struct nvmm_vcpu *vcpu = &qcpu->vcpu;
     struct nvmm_machine *mach = get_nvmm_mach();
 
@@ -372,7 +372,7 @@ nvmm_can_take_int(CPUState *cpu)
 static bool
 nvmm_can_take_nmi(CPUState *cpu)
 {
-    struct qemu_vcpu *qcpu = get_qemu_vcpu(cpu);
+    struct AccelvCPUState *qcpu = get_qemu_vcpu(cpu);
 
     /*
      * Contrary to INTs, NMIs always schedule an exit when they are
@@ -395,7 +395,7 @@ nvmm_vcpu_pre_run(CPUState *cpu)
 {
     CPUX86State *env = cpu->env_ptr;
     struct nvmm_machine *mach = get_nvmm_mach();
-    struct qemu_vcpu *qcpu = get_qemu_vcpu(cpu);
+    struct AccelvCPUState *qcpu = get_qemu_vcpu(cpu);
     struct nvmm_vcpu *vcpu = &qcpu->vcpu;
     X86CPU *x86_cpu = X86_CPU(cpu);
     struct nvmm_x64_state *state = vcpu->state;
@@ -478,7 +478,7 @@ nvmm_vcpu_pre_run(CPUState *cpu)
 static void
 nvmm_vcpu_post_run(CPUState *cpu, struct nvmm_vcpu_exit *exit)
 {
-    struct qemu_vcpu *qcpu = get_qemu_vcpu(cpu);
+    struct AccelvCPUState *qcpu = get_qemu_vcpu(cpu);
     CPUX86State *env = cpu->env_ptr;
     X86CPU *x86_cpu = X86_CPU(cpu);
     uint64_t tpr;
@@ -565,7 +565,7 @@ static int
 nvmm_handle_rdmsr(struct nvmm_machine *mach, CPUState *cpu,
     struct nvmm_vcpu_exit *exit)
 {
-    struct qemu_vcpu *qcpu = get_qemu_vcpu(cpu);
+    struct AccelvCPUState *qcpu = get_qemu_vcpu(cpu);
     struct nvmm_vcpu *vcpu = &qcpu->vcpu;
     X86CPU *x86_cpu = X86_CPU(cpu);
     struct nvmm_x64_state *state = vcpu->state;
@@ -610,7 +610,7 @@ static int
 nvmm_handle_wrmsr(struct nvmm_machine *mach, CPUState *cpu,
     struct nvmm_vcpu_exit *exit)
 {
-    struct qemu_vcpu *qcpu = get_qemu_vcpu(cpu);
+    struct AccelvCPUState *qcpu = get_qemu_vcpu(cpu);
     struct nvmm_vcpu *vcpu = &qcpu->vcpu;
     X86CPU *x86_cpu = X86_CPU(cpu);
     struct nvmm_x64_state *state = vcpu->state;
@@ -686,7 +686,7 @@ nvmm_vcpu_loop(CPUState *cpu)
 {
     CPUX86State *env = cpu->env_ptr;
     struct nvmm_machine *mach = get_nvmm_mach();
-    struct qemu_vcpu *qcpu = get_qemu_vcpu(cpu);
+    struct AccelvCPUState *qcpu = get_qemu_vcpu(cpu);
     struct nvmm_vcpu *vcpu = &qcpu->vcpu;
     X86CPU *x86_cpu = X86_CPU(cpu);
     struct nvmm_vcpu_exit *exit = vcpu->exit;
@@ -892,7 +892,7 @@ static void
 nvmm_ipi_signal(int sigcpu)
 {
     if (current_cpu) {
-        struct qemu_vcpu *qcpu = get_qemu_vcpu(current_cpu);
+        struct AccelvCPUState *qcpu = get_qemu_vcpu(current_cpu);
 #if NVMM_USER_VERSION >= 2
         struct nvmm_vcpu *vcpu = &qcpu->vcpu;
         nvmm_vcpu_stop(vcpu);
@@ -926,7 +926,7 @@ nvmm_init_vcpu(CPUState *cpu)
     struct nvmm_vcpu_conf_cpuid cpuid;
     struct nvmm_vcpu_conf_tpr tpr;
     Error *local_error = NULL;
-    struct qemu_vcpu *qcpu;
+    struct AccelvCPUState *qcpu;
     int ret, err;
 
     nvmm_init_cpu_signals();
@@ -942,7 +942,7 @@ nvmm_init_vcpu(CPUState *cpu)
         }
     }
 
-    qcpu = g_try_malloc0(sizeof(*qcpu));
+    qcpu = g_try_new0(struct AccelvCPUState, 1);
     if (qcpu == NULL) {
         error_report("NVMM: Failed to allocate VCPU context.");
         return -ENOMEM;
@@ -995,7 +995,7 @@ nvmm_init_vcpu(CPUState *cpu)
     }
 
     cpu->vcpu_dirty = true;
-    cpu->accel = (struct AccelvCPUState *)qcpu;
+    cpu->accel = qcpu;
 
     return 0;
 }
@@ -1027,7 +1027,7 @@ void
 nvmm_destroy_vcpu(CPUState *cpu)
 {
     struct nvmm_machine *mach = get_nvmm_mach();
-    struct qemu_vcpu *qcpu = get_qemu_vcpu(cpu);
+    struct AccelvCPUState *qcpu = get_qemu_vcpu(cpu);
 
     nvmm_vcpu_destroy(mach, &qcpu->vcpu);
     g_free(cpu->accel);
-- 
2.38.1


