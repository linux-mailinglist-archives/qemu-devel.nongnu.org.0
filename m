Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7DB4CEBC4
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 14:35:49 +0100 (CET)
Received: from localhost ([::1]:41860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQr36-0003Wu-FN
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 08:35:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqWu-0002Vf-L8
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:02:32 -0500
Received: from [2a00:1450:4864:20::42e] (port=36644
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqWs-0004Hp-KK
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:02:32 -0500
Received: by mail-wr1-x42e.google.com with SMTP id r10so19341695wrp.3
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 05:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zik4svTXLmhP3fhJJiS9T7bQoX7f00akyiPHxtoYpHA=;
 b=HLR+i60YkejGyW8kVGDU8Gi2py0ruyH7aKdR4Ja0t1L3cQ+xWPn3rdJXTPmmF4EhAn
 ub63AXF8v+XLib13Ja3W7qO4lI4AnXrAW/2V57+NlQwTY+XwLOft6iGLVLjo/+7+hUo8
 m+ybxXmV2NAMm4LRugbM96gFnWJ1VcvsI1C4XiNcDcu3Dcyfi1OzgMvKaFhWBwTEGtBL
 GaHEhsnh5K4H06GUT7jgcAvjw1ner5+T6JrjfGchngcyupS1NE5hWh8FemYVPW0cqD3i
 G/fvmcXNjcLgdXV12bl08oWddP1UJ1AWm2dHLJIMa4jecQxrDSZ/Fm0FF9WWrQAMyIke
 PeBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zik4svTXLmhP3fhJJiS9T7bQoX7f00akyiPHxtoYpHA=;
 b=lqsATm36XOUFHWmywPWY3cubay4psIGQE04g0LuLHHVQbzn6f0B/ZkZSYNLt8erFyi
 F8nmMh7GGZuQL0iC9+ig6IVuTucwW09ZivEFFidf82G+uR9inqWQGqyc3HqVCiyjwYos
 LTDccpNm9ihstmzf1IW8kJUmYDsDtIxEXJoj9ESE4pZPkOC3b1xwISr8Bo3PN0kAS25g
 9vp1jM0Zb2fl/5FRYFZL2n9A/ar2UL2Gmzhx9EfYBVh/m6hK6UpJM4CbCV86KueADamr
 f1QKvStVluI+psSTAvj0RrWJI9I+aD5ogqql0kdMgLyIy9ABEzNuLOwLvFRHw98pOHvr
 GGKw==
X-Gm-Message-State: AOAM532l3LSJchm9inLbWNxfFy1ST2uCiKx+OUICNPIEZHxk+fr08PD2
 eWrjs0NJXAHstv6wehgrYUdf4ZGMtdw=
X-Google-Smtp-Source: ABdhPJydoWs4wzWhAPQExluYC+/EnSrdbz21KsueIaLxrQmjBjbnTEZB4Ql9MqtrDeEjllPPIzBuOA==
X-Received: by 2002:adf:f082:0:b0:1f1:d917:c286 with SMTP id
 n2-20020adff082000000b001f1d917c286mr5317914wro.490.1646571749111; 
 Sun, 06 Mar 2022 05:02:29 -0800 (PST)
Received: from nuc.lan ([185.126.107.38]) by smtp.gmail.com with ESMTPSA id
 o11-20020adf9d4b000000b001f0077ea337sm9344875wre.22.2022.03.06.05.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 05:02:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 28/33] target: Use forward declared type instead of structure
 type
Date: Sun,  6 Mar 2022 13:59:55 +0100
Message-Id: <20220306130000.8104-29-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
References: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The CPU / CPU state are forward declared.

  $ git grep -E 'struct [A-Za-z]+CPU\ \*'
  target/arm/hvf_arm.h:16:void hvf_arm_set_cpu_features_from_host(struct ARMCPU *cpu);
  target/openrisc/cpu.h:234:    int (*cpu_openrisc_map_address_code)(struct OpenRISCCPU *cpu,
  target/openrisc/cpu.h:238:    int (*cpu_openrisc_map_address_data)(struct OpenRISCCPU *cpu,

  $ git grep -E 'struct CPU[A-Za-z]+State\ \*'
  target/mips/internal.h:137:    int (*map_address)(struct CPUMIPSState *env, hwaddr *physical, int *prot,
  target/mips/internal.h:139:    void (*helper_tlbwi)(struct CPUMIPSState *env);
  target/mips/internal.h:140:    void (*helper_tlbwr)(struct CPUMIPSState *env);
  target/mips/internal.h:141:    void (*helper_tlbp)(struct CPUMIPSState *env);
  target/mips/internal.h:142:    void (*helper_tlbr)(struct CPUMIPSState *env);
  target/mips/internal.h:143:    void (*helper_tlbinv)(struct CPUMIPSState *env);
  target/mips/internal.h:144:    void (*helper_tlbinvf)(struct CPUMIPSState *env);
  target/xtensa/cpu.h:347:    struct CPUXtensaState *env;

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220214183144.27402-12-f4bug@amsat.org>
---
 target/arm/hvf_arm.h        |  2 +-
 target/mips/internal.h      | 14 +++++++-------
 target/openrisc/cpu.h       |  4 ++--
 target/xtensa/cpu.h         |  2 +-
 target/i386/nvmm/nvmm-all.c | 14 +++++++-------
 target/i386/whpx/whpx-all.c | 18 +++++++++---------
 6 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/target/arm/hvf_arm.h b/target/arm/hvf_arm.h
index ea238cff83f..9a9d1a0bf59 100644
--- a/target/arm/hvf_arm.h
+++ b/target/arm/hvf_arm.h
@@ -13,6 +13,6 @@
 
 #include "cpu.h"
 
-void hvf_arm_set_cpu_features_from_host(struct ARMCPU *cpu);
+void hvf_arm_set_cpu_features_from_host(ARMCPU *cpu);
 
 #endif
diff --git a/target/mips/internal.h b/target/mips/internal.h
index f705d6bfa61..ac6e03e2f25 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -134,14 +134,14 @@ struct r4k_tlb_t {
 struct CPUMIPSTLBContext {
     uint32_t nb_tlb;
     uint32_t tlb_in_use;
-    int (*map_address)(struct CPUMIPSState *env, hwaddr *physical, int *prot,
+    int (*map_address)(CPUMIPSState *env, hwaddr *physical, int *prot,
                        target_ulong address, MMUAccessType access_type);
-    void (*helper_tlbwi)(struct CPUMIPSState *env);
-    void (*helper_tlbwr)(struct CPUMIPSState *env);
-    void (*helper_tlbp)(struct CPUMIPSState *env);
-    void (*helper_tlbr)(struct CPUMIPSState *env);
-    void (*helper_tlbinv)(struct CPUMIPSState *env);
-    void (*helper_tlbinvf)(struct CPUMIPSState *env);
+    void (*helper_tlbwi)(CPUMIPSState *env);
+    void (*helper_tlbwr)(CPUMIPSState *env);
+    void (*helper_tlbp)(CPUMIPSState *env);
+    void (*helper_tlbr)(CPUMIPSState *env);
+    void (*helper_tlbinv)(CPUMIPSState *env);
+    void (*helper_tlbinvf)(CPUMIPSState *env);
     union {
         struct {
             r4k_tlb_t tlb[MIPS_TLB_MAX];
diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
index ee069b080c9..5711591520d 100644
--- a/target/openrisc/cpu.h
+++ b/target/openrisc/cpu.h
@@ -231,11 +231,11 @@ typedef struct CPUOpenRISCTLBContext {
     OpenRISCTLBEntry itlb[TLB_SIZE];
     OpenRISCTLBEntry dtlb[TLB_SIZE];
 
-    int (*cpu_openrisc_map_address_code)(struct OpenRISCCPU *cpu,
+    int (*cpu_openrisc_map_address_code)(OpenRISCCPU *cpu,
                                          hwaddr *physical,
                                          int *prot,
                                          target_ulong address, int rw);
-    int (*cpu_openrisc_map_address_data)(struct OpenRISCCPU *cpu,
+    int (*cpu_openrisc_map_address_data)(OpenRISCCPU *cpu,
                                          hwaddr *physical,
                                          int *prot,
                                          target_ulong address, int rw);
diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 02143f2f776..f2165b17e2d 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -344,7 +344,7 @@ typedef struct XtensaGdbRegmap {
 } XtensaGdbRegmap;
 
 typedef struct XtensaCcompareTimer {
-    struct CPUXtensaState *env;
+    CPUXtensaState *env;
     QEMUTimer *timer;
 } XtensaCcompareTimer;
 
diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
index 9af261eea32..e159dd2b939 100644
--- a/target/i386/nvmm/nvmm-all.c
+++ b/target/i386/nvmm/nvmm-all.c
@@ -85,7 +85,7 @@ nvmm_set_segment(struct nvmm_x64_state_seg *nseg, const SegmentCache *qseg)
 static void
 nvmm_set_registers(CPUState *cpu)
 {
-    struct CPUX86State *env = (CPUArchState *)cpu->env_ptr;
+    CPUX86State *env = (CPUArchState *)cpu->env_ptr;
     struct nvmm_machine *mach = get_nvmm_mach();
     struct qemu_vcpu *qcpu = get_qemu_vcpu(cpu);
     struct nvmm_vcpu *vcpu = &qcpu->vcpu;
@@ -222,7 +222,7 @@ nvmm_get_segment(SegmentCache *qseg, const struct nvmm_x64_state_seg *nseg)
 static void
 nvmm_get_registers(CPUState *cpu)
 {
-    struct CPUX86State *env = (CPUArchState *)cpu->env_ptr;
+    CPUX86State *env = (CPUArchState *)cpu->env_ptr;
     struct nvmm_machine *mach = get_nvmm_mach();
     struct qemu_vcpu *qcpu = get_qemu_vcpu(cpu);
     struct nvmm_vcpu *vcpu = &qcpu->vcpu;
@@ -347,7 +347,7 @@ nvmm_get_registers(CPUState *cpu)
 static bool
 nvmm_can_take_int(CPUState *cpu)
 {
-    struct CPUX86State *env = (CPUArchState *)cpu->env_ptr;
+    CPUX86State *env = (CPUArchState *)cpu->env_ptr;
     struct qemu_vcpu *qcpu = get_qemu_vcpu(cpu);
     struct nvmm_vcpu *vcpu = &qcpu->vcpu;
     struct nvmm_machine *mach = get_nvmm_mach();
@@ -394,7 +394,7 @@ nvmm_can_take_nmi(CPUState *cpu)
 static void
 nvmm_vcpu_pre_run(CPUState *cpu)
 {
-    struct CPUX86State *env = (CPUArchState *)cpu->env_ptr;
+    CPUX86State *env = (CPUArchState *)cpu->env_ptr;
     struct nvmm_machine *mach = get_nvmm_mach();
     struct qemu_vcpu *qcpu = get_qemu_vcpu(cpu);
     struct nvmm_vcpu *vcpu = &qcpu->vcpu;
@@ -480,7 +480,7 @@ static void
 nvmm_vcpu_post_run(CPUState *cpu, struct nvmm_vcpu_exit *exit)
 {
     struct qemu_vcpu *qcpu = get_qemu_vcpu(cpu);
-    struct CPUX86State *env = (CPUArchState *)cpu->env_ptr;
+    CPUX86State *env = (CPUArchState *)cpu->env_ptr;
     X86CPU *x86_cpu = X86_CPU(cpu);
     uint64_t tpr;
 
@@ -652,7 +652,7 @@ static int
 nvmm_handle_halted(struct nvmm_machine *mach, CPUState *cpu,
     struct nvmm_vcpu_exit *exit)
 {
-    struct CPUX86State *env = (CPUArchState *)cpu->env_ptr;
+    CPUX86State *env = (CPUArchState *)cpu->env_ptr;
     int ret = 0;
 
     qemu_mutex_lock_iothread();
@@ -685,7 +685,7 @@ nvmm_inject_ud(struct nvmm_machine *mach, struct nvmm_vcpu *vcpu)
 static int
 nvmm_vcpu_loop(CPUState *cpu)
 {
-    struct CPUX86State *env = (CPUArchState *)cpu->env_ptr;
+    CPUX86State *env = (CPUArchState *)cpu->env_ptr;
     struct nvmm_machine *mach = get_nvmm_mach();
     struct qemu_vcpu *qcpu = get_qemu_vcpu(cpu);
     struct nvmm_vcpu *vcpu = &qcpu->vcpu;
diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index ef896da0a21..a8222461440 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -221,7 +221,7 @@ static SegmentCache whpx_seg_h2q(const WHV_X64_SEGMENT_REGISTER *hs)
 
 static int whpx_set_tsc(CPUState *cpu)
 {
-    struct CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
+    CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
     WHV_REGISTER_NAME tsc_reg = WHvX64RegisterTsc;
     WHV_REGISTER_VALUE tsc_val;
     HRESULT hr;
@@ -260,7 +260,7 @@ static void whpx_set_registers(CPUState *cpu, int level)
 {
     struct whpx_state *whpx = &whpx_global;
     struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
-    struct CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
+    CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
     X86CPU *x86_cpu = X86_CPU(cpu);
     struct whpx_register_set vcxt;
     HRESULT hr;
@@ -428,7 +428,7 @@ static void whpx_set_registers(CPUState *cpu, int level)
 
 static int whpx_get_tsc(CPUState *cpu)
 {
-    struct CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
+    CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
     WHV_REGISTER_NAME tsc_reg = WHvX64RegisterTsc;
     WHV_REGISTER_VALUE tsc_val;
     HRESULT hr;
@@ -449,7 +449,7 @@ static void whpx_get_registers(CPUState *cpu)
 {
     struct whpx_state *whpx = &whpx_global;
     struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
-    struct CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
+    CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
     X86CPU *x86_cpu = X86_CPU(cpu);
     struct whpx_register_set vcxt;
     uint64_t tpr, apic_base;
@@ -760,7 +760,7 @@ static int whpx_handle_portio(CPUState *cpu,
 
 static int whpx_handle_halt(CPUState *cpu)
 {
-    struct CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
+    CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
     int ret = 0;
 
     qemu_mutex_lock_iothread();
@@ -781,7 +781,7 @@ static void whpx_vcpu_pre_run(CPUState *cpu)
     HRESULT hr;
     struct whpx_state *whpx = &whpx_global;
     struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
-    struct CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
+    CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
     X86CPU *x86_cpu = X86_CPU(cpu);
     int irq;
     uint8_t tpr;
@@ -903,7 +903,7 @@ static void whpx_vcpu_pre_run(CPUState *cpu)
 static void whpx_vcpu_post_run(CPUState *cpu)
 {
     struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
-    struct CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
+    CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
     X86CPU *x86_cpu = X86_CPU(cpu);
 
     env->eflags = vcpu->exit_ctx.VpContext.Rflags;
@@ -927,7 +927,7 @@ static void whpx_vcpu_post_run(CPUState *cpu)
 
 static void whpx_vcpu_process_async_events(CPUState *cpu)
 {
-    struct CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
+    CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
     X86CPU *x86_cpu = X86_CPU(cpu);
     struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
 
@@ -1333,7 +1333,7 @@ int whpx_init_vcpu(CPUState *cpu)
     struct whpx_state *whpx = &whpx_global;
     struct whpx_vcpu *vcpu = NULL;
     Error *local_error = NULL;
-    struct CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
+    CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
     X86CPU *x86_cpu = X86_CPU(cpu);
     UINT64 freq = 0;
     int ret;
-- 
2.35.1


