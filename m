Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A59836D7995
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 12:20:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk0Ff-0002de-6n; Wed, 05 Apr 2023 06:20:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk0FA-0002Kl-JH
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 06:19:57 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk0F6-0003dR-RM
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 06:19:55 -0400
Received: by mail-wr1-x42a.google.com with SMTP id r29so35617104wra.13
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 03:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680689989;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jksVpkvUC0Cd0t39UFdIwyYip+p/HLpViupo0kEzavo=;
 b=M14p41XBeC2pDOXONWRmVPh/g0bgtOaeo2kq2u+TWuJbxjfFyLRtQYnT6xjEliAwSd
 Gmn7vgNMSmnVxfuYpWs2aBjugNVuv4EcJIwJLGMmyZg0QDYfH3i/sc7Kh/q/3WK7qsdn
 F60Wv7glyCGVMo3BOtpHfdZkvOyzxwN+gH3+Hex9JK/WUrdLUi4yf74vk34hUq78UiYb
 AORBP6ycIQAo33OBYSJhlzh69AqqlN5KQ4LDwsQpdYmaxHN8h7YoC/jYUnRSJ6PAS/Fc
 moP7c9mQFfmYCYIySXHMkSb6ncs0eKD1DYTa0llVPqgHxXnFQBGyNcDmOUOFGwExmveQ
 mqGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680689989;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jksVpkvUC0Cd0t39UFdIwyYip+p/HLpViupo0kEzavo=;
 b=RhpZZO9pyQJ9KE8mfBhMVlRbieGncSxNpACQETPRovtBuLCs3I3yTnpeGd6utlJzDJ
 tiEm1hy06ZRF9JIHhX/w6/EulW2CxVOce1ZSS0PO0+BB4kZ/RWnRMZi6RGhqimRTPYFn
 4xpAIemBDq6plL/tKulmV27FiY4QF+vAtyCpnIOMCMeoDwJIbTHVM5y7PZKH57zQeP9G
 z5BDsm6v31JWfbO8WYtvrAmW3o3M0IhBGPokdt5BkiB10VCNcFSFpN981qGw1XxVGW+8
 PRM8BNb/IfV38sBG1eRipILByrAJRr/T6NOK8MYoLTlDruVY+k5sbI6posO5FY7ruOTR
 ma5Q==
X-Gm-Message-State: AAQBX9crHnjfUWtj3kSuu528N5JYOHo8/exvqyBUJ40cQpWrITMxT2jQ
 qHAruhgx+UJOgMocuu33CfkcgKCAjeg/htMaZ0M=
X-Google-Smtp-Source: AKy350ab1egrbimBmhajh9GEqufBtAURJQuxG6H/Hs7JpaNOdz6mu7HJAmIyOPKcGGllVT4MOOnVWA==
X-Received: by 2002:adf:df85:0:b0:2ce:a85f:1313 with SMTP id
 z5-20020adfdf85000000b002cea85f1313mr3358628wrl.35.1680689989199; 
 Wed, 05 Apr 2023 03:19:49 -0700 (PDT)
Received: from localhost.localdomain
 (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr. [176.184.52.81])
 by smtp.gmail.com with ESMTPSA id
 o7-20020adfe807000000b002e4cd2ec5c7sm14692347wrm.86.2023.04.05.03.19.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 05 Apr 2023 03:19:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Sunil Muthuswamy <sunilmut@microsoft.com>
Subject: [PATCH 13/14] accel: Inline WHPX get_whpx_vcpu()
Date: Wed,  5 Apr 2023 12:18:10 +0200
Message-Id: <20230405101811.76663-14-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230405101811.76663-1-philmd@linaro.org>
References: <20230405101811.76663-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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
 target/i386/whpx/whpx-all.c | 29 ++++++++++-------------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index 2372c4227a..2cca6bc004 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -256,15 +256,6 @@ static bool whpx_has_xsave(void)
     return whpx_xsave_cap.XsaveSupport;
 }
 
-/*
- * VP support
- */
-
-static struct AccelvCPUState *get_whpx_vcpu(CPUState *cpu)
-{
-    return (struct AccelvCPUState *)cpu->accel;
-}
-
 static WHV_X64_SEGMENT_REGISTER whpx_seg_q2h(const SegmentCache *qs, int v86,
                                              int r86)
 {
@@ -390,7 +381,7 @@ static uint64_t whpx_cr8_to_apic_tpr(uint64_t cr8)
 static void whpx_set_registers(CPUState *cpu, int level)
 {
     struct whpx_state *whpx = &whpx_global;
-    struct AccelvCPUState *vcpu = get_whpx_vcpu(cpu);
+    struct AccelvCPUState *vcpu = cpu->accel;
     CPUX86State *env = cpu->env_ptr;
     X86CPU *x86_cpu = X86_CPU(cpu);
     struct whpx_register_set vcxt;
@@ -609,7 +600,7 @@ static void whpx_get_xcrs(CPUState *cpu)
 static void whpx_get_registers(CPUState *cpu)
 {
     struct whpx_state *whpx = &whpx_global;
-    struct AccelvCPUState *vcpu = get_whpx_vcpu(cpu);
+    struct AccelvCPUState *vcpu = cpu->accel;
     CPUX86State *env = cpu->env_ptr;
     X86CPU *x86_cpu = X86_CPU(cpu);
     struct whpx_register_set vcxt;
@@ -892,7 +883,7 @@ static const WHV_EMULATOR_CALLBACKS whpx_emu_callbacks = {
 static int whpx_handle_mmio(CPUState *cpu, WHV_MEMORY_ACCESS_CONTEXT *ctx)
 {
     HRESULT hr;
-    struct AccelvCPUState *vcpu = get_whpx_vcpu(cpu);
+    struct AccelvCPUState *vcpu = cpu->accel;
     WHV_EMULATOR_STATUS emu_status;
 
     hr = whp_dispatch.WHvEmulatorTryMmioEmulation(
@@ -917,7 +908,7 @@ static int whpx_handle_portio(CPUState *cpu,
                               WHV_X64_IO_PORT_ACCESS_CONTEXT *ctx)
 {
     HRESULT hr;
-    struct AccelvCPUState *vcpu = get_whpx_vcpu(cpu);
+    struct AccelvCPUState *vcpu = cpu->accel;
     WHV_EMULATOR_STATUS emu_status;
 
     hr = whp_dispatch.WHvEmulatorTryIoEmulation(
@@ -1417,7 +1408,7 @@ static vaddr whpx_vcpu_get_pc(CPUState *cpu, bool exit_context_valid)
          * of QEMU, nor this port by calling WHvSetVirtualProcessorRegisters().
          * This is the most common case.
          */
-        struct AccelvCPUState *vcpu = get_whpx_vcpu(cpu);
+        struct AccelvCPUState *vcpu = cpu->accel;
         return vcpu->exit_ctx.VpContext.Rip;
     } else {
         /*
@@ -1468,7 +1459,7 @@ static void whpx_vcpu_pre_run(CPUState *cpu)
 {
     HRESULT hr;
     struct whpx_state *whpx = &whpx_global;
-    struct AccelvCPUState *vcpu = get_whpx_vcpu(cpu);
+    struct AccelvCPUState *vcpu = cpu->accel;
     CPUX86State *env = cpu->env_ptr;
     X86CPU *x86_cpu = X86_CPU(cpu);
     int irq;
@@ -1590,7 +1581,7 @@ static void whpx_vcpu_pre_run(CPUState *cpu)
 
 static void whpx_vcpu_post_run(CPUState *cpu)
 {
-    struct AccelvCPUState *vcpu = get_whpx_vcpu(cpu);
+    struct AccelvCPUState *vcpu = cpu->accel;
     CPUX86State *env = cpu->env_ptr;
     X86CPU *x86_cpu = X86_CPU(cpu);
 
@@ -1617,7 +1608,7 @@ static void whpx_vcpu_process_async_events(CPUState *cpu)
 {
     CPUX86State *env = cpu->env_ptr;
     X86CPU *x86_cpu = X86_CPU(cpu);
-    struct AccelvCPUState *vcpu = get_whpx_vcpu(cpu);
+    struct AccelvCPUState *vcpu = cpu->accel;
 
     if ((cpu->interrupt_request & CPU_INTERRUPT_INIT) &&
         !(env->hflags & HF_SMM_MASK)) {
@@ -1656,7 +1647,7 @@ static int whpx_vcpu_run(CPUState *cpu)
 {
     HRESULT hr;
     struct whpx_state *whpx = &whpx_global;
-    struct AccelvCPUState *vcpu = get_whpx_vcpu(cpu);
+    struct AccelvCPUState *vcpu = cpu->accel;
     struct whpx_breakpoint *stepped_over_bp = NULL;
     WhpxStepMode exclusive_step_mode = WHPX_STEP_NONE;
     int ret;
@@ -2296,7 +2287,7 @@ int whpx_vcpu_exec(CPUState *cpu)
 void whpx_destroy_vcpu(CPUState *cpu)
 {
     struct whpx_state *whpx = &whpx_global;
-    struct AccelvCPUState *vcpu = get_whpx_vcpu(cpu);
+    struct AccelvCPUState *vcpu = cpu->accel;
 
     whp_dispatch.WHvDeleteVirtualProcessor(whpx->partition, cpu->cpu_index);
     whp_dispatch.WHvEmulatorDestroyEmulator(vcpu->emulator);
-- 
2.38.1


