Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD466D7997
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 12:20:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk0FH-00028V-M9; Wed, 05 Apr 2023 06:20:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk0Ez-0001xu-D0
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 06:19:46 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk0Ex-0003aj-CI
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 06:19:45 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 v20-20020a05600c471400b003ed8826253aso2032081wmo.0
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 03:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680689981;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S/MtLkEvv/mpFG8xdDJ5UGIDl6QuLPsc27INO07zRJs=;
 b=j3hNNVtnFSkeMmMMmVP7MwKIlYYAEqbhDpfKTMInG3a+9K0+YXceoJPZJ4jZAHCBFI
 VPa6eMgi/+9TXCgyr86xjuKK9t4zNhPlw7CAX0fvenTdKFSa3t+eBYp0hgH6m98d3/lR
 jnJJMwWe2cN5PCDDRMn3ZiOfvLvOx0KgfKGPNgpITrxaoDPAOFx1uqGJJWFNIk4jpdv7
 NGGSO2xZQkFpOwy7mhzr21QREPPwjCH42qXvKwpRx5Hf1PwrV8q3x4WiQL9Zq/cJZpvA
 +TtnCQgltM297hRRmytaXGZhpTBrxwBYRmMmPEjntzUo7iHBOLTSWiIxfEFT8knJMWNo
 rgog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680689981;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S/MtLkEvv/mpFG8xdDJ5UGIDl6QuLPsc27INO07zRJs=;
 b=Vk5iw77DRxAE6WXTVZfB5ameW24d6Ckz6xzWmoxJB5+R5nJHN5jVaVIYHLinXb0ErG
 ohfOIa945/NGsdqwHvZ940+pcucdmL4OdEExMY6MAIHoQkE8FFXLjGgd7GSrtDdkr50J
 CkoJKjr3gCdKjwVjkZEA8F2HMi3SFS9sSJK0atS+EnZFMAXCQC/eh+Ks5EdwPtNSbz9X
 g9b0aCpIXqmeemf8ffPsl3iiqAwsM8IQZWXobEM8UaZWP3SgET/Y/1f+3mMt3cngzSrc
 gUJHCXwwmEr4yaLnmU9H9hG5q4615cDyjACD0hmQUh7h844VeCdLg+J7yuYQ8ohQOaey
 Aieg==
X-Gm-Message-State: AAQBX9cstxnrTWex5KIvBECebQF3I9oSQL1vFOg5r4/E28GjE0xeo7O8
 o7u+DBrwcFTFZubNOI2EPtmFO3Q7Ph94InnEBhI=
X-Google-Smtp-Source: AKy350ZceuduIKjGNIdlkcOLlYLJL5KbbisXjbggRXGoX4b3J2s4uJbs/AyE+v9R+USsxTJSDNjt2g==
X-Received: by 2002:a1c:f707:0:b0:3ee:9909:acc8 with SMTP id
 v7-20020a1cf707000000b003ee9909acc8mr4174177wmh.32.1680689981231; 
 Wed, 05 Apr 2023 03:19:41 -0700 (PDT)
Received: from localhost.localdomain
 (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr. [176.184.52.81])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a05600c4f8700b003ee9c8cc631sm1780821wmq.23.2023.04.05.03.19.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 05 Apr 2023 03:19:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Sunil Muthuswamy <sunilmut@microsoft.com>
Subject: [PATCH 12/14] accel: Rename WHPX struct whpx_vcpu -> struct
 AccelvCPUState
Date: Wed,  5 Apr 2023 12:18:09 +0200
Message-Id: <20230405101811.76663-13-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230405101811.76663-1-philmd@linaro.org>
References: <20230405101811.76663-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
CPUState. Rename WHPX 'whpx_vcpu' as 'AccelvCPUState'.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/whpx/whpx-all.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index 70eadb7f05..2372c4227a 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -229,7 +229,7 @@ typedef enum WhpxStepMode {
     WHPX_STEP_EXCLUSIVE,
 } WhpxStepMode;
 
-struct whpx_vcpu {
+struct AccelvCPUState {
     WHV_EMULATOR_HANDLE emulator;
     bool window_registered;
     bool interruptable;
@@ -260,9 +260,9 @@ static bool whpx_has_xsave(void)
  * VP support
  */
 
-static struct whpx_vcpu *get_whpx_vcpu(CPUState *cpu)
+static struct AccelvCPUState *get_whpx_vcpu(CPUState *cpu)
 {
-    return (struct whpx_vcpu *)cpu->accel;
+    return (struct AccelvCPUState *)cpu->accel;
 }
 
 static WHV_X64_SEGMENT_REGISTER whpx_seg_q2h(const SegmentCache *qs, int v86,
@@ -390,7 +390,7 @@ static uint64_t whpx_cr8_to_apic_tpr(uint64_t cr8)
 static void whpx_set_registers(CPUState *cpu, int level)
 {
     struct whpx_state *whpx = &whpx_global;
-    struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
+    struct AccelvCPUState *vcpu = get_whpx_vcpu(cpu);
     CPUX86State *env = cpu->env_ptr;
     X86CPU *x86_cpu = X86_CPU(cpu);
     struct whpx_register_set vcxt;
@@ -609,7 +609,7 @@ static void whpx_get_xcrs(CPUState *cpu)
 static void whpx_get_registers(CPUState *cpu)
 {
     struct whpx_state *whpx = &whpx_global;
-    struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
+    struct AccelvCPUState *vcpu = get_whpx_vcpu(cpu);
     CPUX86State *env = cpu->env_ptr;
     X86CPU *x86_cpu = X86_CPU(cpu);
     struct whpx_register_set vcxt;
@@ -892,7 +892,7 @@ static const WHV_EMULATOR_CALLBACKS whpx_emu_callbacks = {
 static int whpx_handle_mmio(CPUState *cpu, WHV_MEMORY_ACCESS_CONTEXT *ctx)
 {
     HRESULT hr;
-    struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
+    struct AccelvCPUState *vcpu = get_whpx_vcpu(cpu);
     WHV_EMULATOR_STATUS emu_status;
 
     hr = whp_dispatch.WHvEmulatorTryMmioEmulation(
@@ -917,7 +917,7 @@ static int whpx_handle_portio(CPUState *cpu,
                               WHV_X64_IO_PORT_ACCESS_CONTEXT *ctx)
 {
     HRESULT hr;
-    struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
+    struct AccelvCPUState *vcpu = get_whpx_vcpu(cpu);
     WHV_EMULATOR_STATUS emu_status;
 
     hr = whp_dispatch.WHvEmulatorTryIoEmulation(
@@ -1417,7 +1417,7 @@ static vaddr whpx_vcpu_get_pc(CPUState *cpu, bool exit_context_valid)
          * of QEMU, nor this port by calling WHvSetVirtualProcessorRegisters().
          * This is the most common case.
          */
-        struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
+        struct AccelvCPUState *vcpu = get_whpx_vcpu(cpu);
         return vcpu->exit_ctx.VpContext.Rip;
     } else {
         /*
@@ -1468,7 +1468,7 @@ static void whpx_vcpu_pre_run(CPUState *cpu)
 {
     HRESULT hr;
     struct whpx_state *whpx = &whpx_global;
-    struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
+    struct AccelvCPUState *vcpu = get_whpx_vcpu(cpu);
     CPUX86State *env = cpu->env_ptr;
     X86CPU *x86_cpu = X86_CPU(cpu);
     int irq;
@@ -1590,7 +1590,7 @@ static void whpx_vcpu_pre_run(CPUState *cpu)
 
 static void whpx_vcpu_post_run(CPUState *cpu)
 {
-    struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
+    struct AccelvCPUState *vcpu = get_whpx_vcpu(cpu);
     CPUX86State *env = cpu->env_ptr;
     X86CPU *x86_cpu = X86_CPU(cpu);
 
@@ -1617,7 +1617,7 @@ static void whpx_vcpu_process_async_events(CPUState *cpu)
 {
     CPUX86State *env = cpu->env_ptr;
     X86CPU *x86_cpu = X86_CPU(cpu);
-    struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
+    struct AccelvCPUState *vcpu = get_whpx_vcpu(cpu);
 
     if ((cpu->interrupt_request & CPU_INTERRUPT_INIT) &&
         !(env->hflags & HF_SMM_MASK)) {
@@ -1656,7 +1656,7 @@ static int whpx_vcpu_run(CPUState *cpu)
 {
     HRESULT hr;
     struct whpx_state *whpx = &whpx_global;
-    struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
+    struct AccelvCPUState *vcpu = get_whpx_vcpu(cpu);
     struct whpx_breakpoint *stepped_over_bp = NULL;
     WhpxStepMode exclusive_step_mode = WHPX_STEP_NONE;
     int ret;
@@ -2154,7 +2154,7 @@ int whpx_init_vcpu(CPUState *cpu)
 {
     HRESULT hr;
     struct whpx_state *whpx = &whpx_global;
-    struct whpx_vcpu *vcpu = NULL;
+    struct AccelvCPUState *vcpu = NULL;
     Error *local_error = NULL;
     CPUX86State *env = cpu->env_ptr;
     X86CPU *x86_cpu = X86_CPU(cpu);
@@ -2177,7 +2177,7 @@ int whpx_init_vcpu(CPUState *cpu)
         }
     }
 
-    vcpu = g_new0(struct whpx_vcpu, 1);
+    vcpu = g_new0(struct AccelvCPUState, 1);
 
     if (!vcpu) {
         error_report("WHPX: Failed to allocte VCPU context.");
@@ -2296,7 +2296,7 @@ int whpx_vcpu_exec(CPUState *cpu)
 void whpx_destroy_vcpu(CPUState *cpu)
 {
     struct whpx_state *whpx = &whpx_global;
-    struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
+    struct AccelvCPUState *vcpu = get_whpx_vcpu(cpu);
 
     whp_dispatch.WHvDeleteVirtualProcessor(whpx->partition, cpu->cpu_index);
     whp_dispatch.WHvEmulatorDestroyEmulator(vcpu->emulator);
-- 
2.38.1


