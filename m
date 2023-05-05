Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AAA6F7A42
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:04:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujrF-0007xZ-OK; Thu, 04 May 2023 21:03:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujrC-0007xA-2a
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:03:34 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujr9-0006rI-SO
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:03:33 -0400
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-51fcf5d1e44so998372a12.3
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248610; x=1685840610;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=APTyY3hc2vM0RicVRK0p1IL56eRDbDC/MUZ7Ub4+IDE=;
 b=mwyf1sdvN/jAoLa4eFYb751oltYMLX8tYzQP5cSv1OSv9Nv4tTs6pDzC1ljqryppXJ
 P9e79NeKCwc0/KOnhwLNeuFGqAlASqZbFl6JrwjRgU6FphY4vBFJd7ZjgjtpL4Snsh+J
 Zr3H9aTq8eF/XATbnBFHClMGaAPGUQ/sVktf4vZPfZosL+UJ4uaHA6uwWegt+aqWI2Sk
 pv/bsEBcG4o1O+ZPTaqSyZfXYx8qBdSGomnBFmsUOQyHhLcaikdag+ndlELi2SGECt/3
 fkhpwx4fc3zhAkjbNm6N4+vk4ID+ugCq6mJ9ZbPW3oAoNDCVKRNfmj9aFg4PnEb0+aal
 Wulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248610; x=1685840610;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=APTyY3hc2vM0RicVRK0p1IL56eRDbDC/MUZ7Ub4+IDE=;
 b=GAsKqik9yO35unrc47KF172ra32KUf7jyJy8zq1qxB/KX/v8c2cV6TSwITVsvckzJd
 XpkXb9Vmsa+8htfISnCetRna7bUx+DnDYamfPoNzwIBPirgSw0Vq0v6XM23Af2KmJYgZ
 ezoOC0fboiWwDnbsdAj36wmq4C9MqddFXgQPRmWX9L79QB4vWdewUEgfADaLEDdvVCqz
 UMQ3t4nse+Tu1Q1+jlqvKIYocz15UMITgvLYRFbe0lO0w59lWNdXXMOffm7/UYzIVi2/
 C8nSn31vt6710uPwuYHqZCt99K5u3z5KZ7e7GOogy+O4hUYsCGtcdxnXKpmzYZqsnQmF
 47TA==
X-Gm-Message-State: AC+VfDzpSncYaaCQ8vDdgcPhYzpHi08WkaQ9Hp2Ho9uVTngiZPjtedIA
 sfuHaLGLLGZLo2aSNRDh1N4V2hunTm+tng==
X-Google-Smtp-Source: ACHHUZ4Fzy+HbNVhWT0V5bSjjFNG64mb5PxOuG3EH3q3jYSsO1kN1hsWIrSnm/YlrzTTe6jU45REBg==
X-Received: by 2002:a17:902:f7cc:b0:1ab:1c09:2df8 with SMTP id
 h12-20020a170902f7cc00b001ab1c092df8mr4895047plw.50.1683248610101; 
 Thu, 04 May 2023 18:03:30 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:03:29 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PULL 04/89] target/riscv: Simplify type conversion for CPURISCVState
Date: Fri,  5 May 2023 11:01:16 +1000
Message-Id: <20230505010241.21812-5-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Weiwei Li <liweiwei@iscas.ac.cn>

Use CPURISCVState as argument directly in riscv_cpu_update_mip and
riscv_timer_write_timecmp, since type converts from CPURISCVState to
RISCVCPU in many caller of them and then back to CPURISCVState in them.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230309071329.45932-4-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h         |  3 ++-
 target/riscv/time_helper.h |  2 +-
 target/riscv/cpu.c         |  6 +++---
 target/riscv/cpu_helper.c  |  8 ++++----
 target/riscv/csr.c         | 35 +++++++++++------------------------
 target/riscv/pmu.c         |  6 +++---
 target/riscv/time_helper.c | 15 +++++++--------
 7 files changed, 31 insertions(+), 44 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 638e47c75a..5adefe4ab5 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -602,7 +602,8 @@ hwaddr riscv_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
 void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env);
 int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts);
-uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value);
+uint64_t riscv_cpu_update_mip(CPURISCVState *env, uint64_t mask,
+                              uint64_t value);
 #define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip value */
 void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(void *),
                              void *arg);
diff --git a/target/riscv/time_helper.h b/target/riscv/time_helper.h
index 7b3cdcc350..cacd79b80c 100644
--- a/target/riscv/time_helper.h
+++ b/target/riscv/time_helper.h
@@ -22,7 +22,7 @@
 #include "cpu.h"
 #include "qemu/timer.h"
 
-void riscv_timer_write_timecmp(RISCVCPU *cpu, QEMUTimer *timer,
+void riscv_timer_write_timecmp(CPURISCVState *env, QEMUTimer *timer,
                                uint64_t timecmp, uint64_t delta,
                                uint32_t timer_irq);
 void riscv_timer_init(RISCVCPU *cpu);
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index eaf75a00a6..cea0d3cbdd 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1302,7 +1302,7 @@ static void riscv_cpu_set_irq(void *opaque, int irq, int level)
             if (kvm_enabled()) {
                 kvm_riscv_set_irq(cpu, irq, level);
             } else {
-                riscv_cpu_update_mip(cpu, 1 << irq, BOOL_TO_MASK(level));
+                riscv_cpu_update_mip(env, 1 << irq, BOOL_TO_MASK(level));
             }
              break;
         case IRQ_S_EXT:
@@ -1310,7 +1310,7 @@ static void riscv_cpu_set_irq(void *opaque, int irq, int level)
                 kvm_riscv_set_irq(cpu, irq, level);
             } else {
                 env->external_seip = level;
-                riscv_cpu_update_mip(cpu, 1 << irq,
+                riscv_cpu_update_mip(env, 1 << irq,
                                      BOOL_TO_MASK(level | env->software_seip));
             }
             break;
@@ -1336,7 +1336,7 @@ static void riscv_cpu_set_irq(void *opaque, int irq, int level)
         }
 
         /* Update mip.SGEIP bit */
-        riscv_cpu_update_mip(cpu, MIP_SGEIP,
+        riscv_cpu_update_mip(env, MIP_SGEIP,
                              BOOL_TO_MASK(!!(env->hgeie & env->hgeip)));
     } else {
         g_assert_not_reached();
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index e677255f87..824f0cbd92 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -590,7 +590,7 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)
          *
          * To solve this, we check and inject interrupt after setting V=1.
          */
-        riscv_cpu_update_mip(env_archcpu(env), 0, 0);
+        riscv_cpu_update_mip(env, 0, 0);
     }
 }
 
@@ -610,10 +610,10 @@ int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts)
     }
 }
 
-uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value)
+uint64_t riscv_cpu_update_mip(CPURISCVState *env, uint64_t mask,
+                              uint64_t value)
 {
-    CPURISCVState *env = &cpu->env;
-    CPUState *cs = CPU(cpu);
+    CPUState *cs = env_cpu(env);
     uint64_t gein, vsgein = 0, vstip = 0, old = env->mip;
 
     if (riscv_cpu_virt_enabled(env)) {
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 70468572fe..a7d0157d33 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -991,15 +991,13 @@ static RISCVException read_vstimecmph(CPURISCVState *env, int csrno,
 static RISCVException write_vstimecmp(CPURISCVState *env, int csrno,
                                       target_ulong val)
 {
-    RISCVCPU *cpu = env_archcpu(env);
-
     if (riscv_cpu_mxl(env) == MXL_RV32) {
         env->vstimecmp = deposit64(env->vstimecmp, 0, 32, (uint64_t)val);
     } else {
         env->vstimecmp = val;
     }
 
-    riscv_timer_write_timecmp(cpu, env->vstimer, env->vstimecmp,
+    riscv_timer_write_timecmp(env, env->vstimer, env->vstimecmp,
                               env->htimedelta, MIP_VSTIP);
 
     return RISCV_EXCP_NONE;
@@ -1008,10 +1006,8 @@ static RISCVException write_vstimecmp(CPURISCVState *env, int csrno,
 static RISCVException write_vstimecmph(CPURISCVState *env, int csrno,
                                        target_ulong val)
 {
-    RISCVCPU *cpu = env_archcpu(env);
-
     env->vstimecmp = deposit64(env->vstimecmp, 32, 32, (uint64_t)val);
-    riscv_timer_write_timecmp(cpu, env->vstimer, env->vstimecmp,
+    riscv_timer_write_timecmp(env, env->vstimer, env->vstimecmp,
                               env->htimedelta, MIP_VSTIP);
 
     return RISCV_EXCP_NONE;
@@ -1044,8 +1040,6 @@ static RISCVException read_stimecmph(CPURISCVState *env, int csrno,
 static RISCVException write_stimecmp(CPURISCVState *env, int csrno,
                                      target_ulong val)
 {
-    RISCVCPU *cpu = env_archcpu(env);
-
     if (riscv_cpu_virt_enabled(env)) {
         if (env->hvictl & HVICTL_VTI) {
             return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
@@ -1059,7 +1053,7 @@ static RISCVException write_stimecmp(CPURISCVState *env, int csrno,
         env->stimecmp = val;
     }
 
-    riscv_timer_write_timecmp(cpu, env->stimer, env->stimecmp, 0, MIP_STIP);
+    riscv_timer_write_timecmp(env, env->stimer, env->stimecmp, 0, MIP_STIP);
 
     return RISCV_EXCP_NONE;
 }
@@ -1067,8 +1061,6 @@ static RISCVException write_stimecmp(CPURISCVState *env, int csrno,
 static RISCVException write_stimecmph(CPURISCVState *env, int csrno,
                                       target_ulong val)
 {
-    RISCVCPU *cpu = env_archcpu(env);
-
     if (riscv_cpu_virt_enabled(env)) {
         if (env->hvictl & HVICTL_VTI) {
             return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
@@ -1077,7 +1069,7 @@ static RISCVException write_stimecmph(CPURISCVState *env, int csrno,
     }
 
     env->stimecmp = deposit64(env->stimecmp, 32, 32, (uint64_t)val);
-    riscv_timer_write_timecmp(cpu, env->stimer, env->stimecmp, 0, MIP_STIP);
+    riscv_timer_write_timecmp(env, env->stimer, env->stimecmp, 0, MIP_STIP);
 
     return RISCV_EXCP_NONE;
 }
@@ -2212,7 +2204,6 @@ static RISCVException rmw_mip64(CPURISCVState *env, int csrno,
                                 uint64_t *ret_val,
                                 uint64_t new_val, uint64_t wr_mask)
 {
-    RISCVCPU *cpu = env_archcpu(env);
     uint64_t old_mip, mask = wr_mask & delegable_ints;
     uint32_t gin;
 
@@ -2221,14 +2212,14 @@ static RISCVException rmw_mip64(CPURISCVState *env, int csrno,
         new_val |= env->external_seip * MIP_SEIP;
     }
 
-    if (cpu->cfg.ext_sstc && (env->priv == PRV_M) &&
+    if (riscv_cpu_cfg(env)->ext_sstc && (env->priv == PRV_M) &&
         get_field(env->menvcfg, MENVCFG_STCE)) {
         /* sstc extension forbids STIP & VSTIP to be writeable in mip */
         mask = mask & ~(MIP_STIP | MIP_VSTIP);
     }
 
     if (mask) {
-        old_mip = riscv_cpu_update_mip(cpu, mask, (new_val & mask));
+        old_mip = riscv_cpu_update_mip(env, mask, (new_val & mask));
     } else {
         old_mip = env->mip;
     }
@@ -2988,7 +2979,7 @@ static RISCVException write_hgeie(CPURISCVState *env, int csrno,
     val &= ((((target_ulong)1) << env->geilen) - 1) << 1;
     env->hgeie = val;
     /* Update mip.SGEIP bit */
-    riscv_cpu_update_mip(env_archcpu(env), MIP_SGEIP,
+    riscv_cpu_update_mip(env, MIP_SGEIP,
                          BOOL_TO_MASK(!!(env->hgeie & env->hgeip)));
     return RISCV_EXCP_NONE;
 }
@@ -3057,8 +3048,6 @@ static RISCVException read_htimedelta(CPURISCVState *env, int csrno,
 static RISCVException write_htimedelta(CPURISCVState *env, int csrno,
                                        target_ulong val)
 {
-    RISCVCPU *cpu = env_archcpu(env);
-
     if (!env->rdtime_fn) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
@@ -3069,8 +3058,8 @@ static RISCVException write_htimedelta(CPURISCVState *env, int csrno,
         env->htimedelta = val;
     }
 
-    if (cpu->cfg.ext_sstc && env->rdtime_fn) {
-        riscv_timer_write_timecmp(cpu, env->vstimer, env->vstimecmp,
+    if (riscv_cpu_cfg(env)->ext_sstc && env->rdtime_fn) {
+        riscv_timer_write_timecmp(env, env->vstimer, env->vstimecmp,
                                   env->htimedelta, MIP_VSTIP);
     }
 
@@ -3091,16 +3080,14 @@ static RISCVException read_htimedeltah(CPURISCVState *env, int csrno,
 static RISCVException write_htimedeltah(CPURISCVState *env, int csrno,
                                         target_ulong val)
 {
-    RISCVCPU *cpu = env_archcpu(env);
-
     if (!env->rdtime_fn) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
     env->htimedelta = deposit64(env->htimedelta, 32, 32, (uint64_t)val);
 
-    if (cpu->cfg.ext_sstc && env->rdtime_fn) {
-        riscv_timer_write_timecmp(cpu, env->vstimer, env->vstimecmp,
+    if (riscv_cpu_cfg(env)->ext_sstc && env->rdtime_fn) {
+        riscv_timer_write_timecmp(env, env->vstimer, env->vstimecmp,
                                   env->htimedelta, MIP_VSTIP);
     }
 
diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
index a200741083..22e2283c76 100644
--- a/target/riscv/pmu.c
+++ b/target/riscv/pmu.c
@@ -133,7 +133,7 @@ static int riscv_pmu_incr_ctr_rv32(RISCVCPU *cpu, uint32_t ctr_idx)
             /* Generate interrupt only if OF bit is clear */
             if (!(env->mhpmeventh_val[ctr_idx] & MHPMEVENTH_BIT_OF)) {
                 env->mhpmeventh_val[ctr_idx] |= MHPMEVENTH_BIT_OF;
-                riscv_cpu_update_mip(cpu, MIP_LCOFIP, BOOL_TO_MASK(1));
+                riscv_cpu_update_mip(env, MIP_LCOFIP, BOOL_TO_MASK(1));
             }
         } else {
             counter->mhpmcounterh_val++;
@@ -172,7 +172,7 @@ static int riscv_pmu_incr_ctr_rv64(RISCVCPU *cpu, uint32_t ctr_idx)
         /* Generate interrupt only if OF bit is clear */
         if (!(env->mhpmevent_val[ctr_idx] & MHPMEVENT_BIT_OF)) {
             env->mhpmevent_val[ctr_idx] |= MHPMEVENT_BIT_OF;
-            riscv_cpu_update_mip(cpu, MIP_LCOFIP, BOOL_TO_MASK(1));
+            riscv_cpu_update_mip(env, MIP_LCOFIP, BOOL_TO_MASK(1));
         }
     } else {
         counter->mhpmcounter_val++;
@@ -371,7 +371,7 @@ static void pmu_timer_trigger_irq(RISCVCPU *cpu,
         /* Generate interrupt only if OF bit is clear */
         if (!(*mhpmevent_val & of_bit_mask)) {
             *mhpmevent_val |= of_bit_mask;
-            riscv_cpu_update_mip(cpu, MIP_LCOFIP, BOOL_TO_MASK(1));
+            riscv_cpu_update_mip(env, MIP_LCOFIP, BOOL_TO_MASK(1));
         }
     }
 }
diff --git a/target/riscv/time_helper.c b/target/riscv/time_helper.c
index b654f91af9..8d245bed3a 100644
--- a/target/riscv/time_helper.c
+++ b/target/riscv/time_helper.c
@@ -27,25 +27,24 @@ static void riscv_vstimer_cb(void *opaque)
     RISCVCPU *cpu = opaque;
     CPURISCVState *env = &cpu->env;
     env->vstime_irq = 1;
-    riscv_cpu_update_mip(cpu, 0, BOOL_TO_MASK(1));
+    riscv_cpu_update_mip(env, 0, BOOL_TO_MASK(1));
 }
 
 static void riscv_stimer_cb(void *opaque)
 {
     RISCVCPU *cpu = opaque;
-    riscv_cpu_update_mip(cpu, MIP_STIP, BOOL_TO_MASK(1));
+    riscv_cpu_update_mip(&cpu->env, MIP_STIP, BOOL_TO_MASK(1));
 }
 
 /*
  * Called when timecmp is written to update the QEMU timer or immediately
  * trigger timer interrupt if mtimecmp <= current timer value.
  */
-void riscv_timer_write_timecmp(RISCVCPU *cpu, QEMUTimer *timer,
+void riscv_timer_write_timecmp(CPURISCVState *env, QEMUTimer *timer,
                                uint64_t timecmp, uint64_t delta,
                                uint32_t timer_irq)
 {
     uint64_t diff, ns_diff, next;
-    CPURISCVState *env = &cpu->env;
     RISCVAclintMTimerState *mtimer = env->rdtime_fn_arg;
     uint32_t timebase_freq = mtimer->timebase_freq;
     uint64_t rtc_r = env->rdtime_fn(env->rdtime_fn_arg) + delta;
@@ -57,9 +56,9 @@ void riscv_timer_write_timecmp(RISCVCPU *cpu, QEMUTimer *timer,
          */
         if (timer_irq == MIP_VSTIP) {
             env->vstime_irq = 1;
-            riscv_cpu_update_mip(cpu, 0, BOOL_TO_MASK(1));
+            riscv_cpu_update_mip(env, 0, BOOL_TO_MASK(1));
         } else {
-            riscv_cpu_update_mip(cpu, MIP_STIP, BOOL_TO_MASK(1));
+            riscv_cpu_update_mip(env, MIP_STIP, BOOL_TO_MASK(1));
         }
         return;
     }
@@ -67,9 +66,9 @@ void riscv_timer_write_timecmp(RISCVCPU *cpu, QEMUTimer *timer,
     /* Clear the [VS|S]TIP bit in mip */
     if (timer_irq == MIP_VSTIP) {
         env->vstime_irq = 0;
-        riscv_cpu_update_mip(cpu, 0, BOOL_TO_MASK(0));
+        riscv_cpu_update_mip(env, 0, BOOL_TO_MASK(0));
     } else {
-        riscv_cpu_update_mip(cpu, timer_irq, BOOL_TO_MASK(0));
+        riscv_cpu_update_mip(env, timer_irq, BOOL_TO_MASK(0));
     }
 
     /*
-- 
2.40.0


