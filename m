Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B4D53964F
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 20:30:11 +0200 (CEST)
Received: from localhost ([::1]:55700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw6d6-0001XG-QQ
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 14:30:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nw6DY-0002uK-By
 for qemu-devel@nongnu.org; Tue, 31 May 2022 14:03:44 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:36836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nw6DT-0003cN-NK
 for qemu-devel@nongnu.org; Tue, 31 May 2022 14:03:41 -0400
Received: by mail-pl1-x633.google.com with SMTP id u18so7362465plb.3
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 11:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vjYLGSB3ObDslUscIl0Dk63/kMlA02p6GKEztuy7lNI=;
 b=A/jKgt0hP8CVUQM6PzyEgajPvmd5OzoXaZkAIpfkgjNI3culFIvNivmjnqVrvMvm5L
 FXIe19tRrzGxN4F7HzdRqbfQdV5iscYkt7LDnFIBMT5wQvCqiD3I5BpWtvUY/RUFd53s
 bSZgyXNLCKNlP73wdKCjXmAxN2eGHEI4V4Mc4UgWGneHKAP7xFZu+w7icBqBnFacPeI9
 T0aQK11h1Qk8r0RORTQXC9Nhl9+NHx0zVSwrhMSkyisJ+kxmpXoSJ1+8ioltwwd/SXMZ
 MJRH7c1hgDHLVTEGCDoyhhGvQv6vFhHpH3PSSxl7zxO+Ja+AhAtB0BsMq68XKdeDVl+S
 oCug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vjYLGSB3ObDslUscIl0Dk63/kMlA02p6GKEztuy7lNI=;
 b=nQjDGlFR+9vD7dM0V+w5nXyknIYrrj/rAD2ysdgLOKn+XOvz5+QVoooeJWUYeIlmgx
 2OI0Vp8KMGRFfQux+BreOhpmlhpwaw+Wjy/n816NC9UrpZDhv7OMET5IHJV7iRg2ERBp
 LXid9NsAIphKD4UqlnPKjRNwUVjfoxM64CiW73ZXmam3XVBaCAaZEqD0KypcvccWCcJO
 oj8kJMAWIvbxIGuNeNxYWr+BXEbGwpMX+sGdIoYVR1mJ5y5whrOzWrrX8AbDhB1ttrYm
 QIuK1lU57TlX7w5bhwvMiJiZJSiNm5AM9p4aYDA51SEMUCzVTZu4hHjzUSPUzCWkZLZK
 /0DQ==
X-Gm-Message-State: AOAM533zVehvEuaKhQU/AvlFPs91QONr279M1SKdjBYFj04WJURA4nWf
 eu8yEWkOzmK3eL2XDK2cMo4QCj0Y3kgQvw==
X-Google-Smtp-Source: ABdhPJz29P50RHnpnypF79SA3u8qRq6zCFhn+/MS+2yWQDRISVsAnAZA8v/b8nExfJ9iTIdOFRJLAQ==
X-Received: by 2002:a17:902:d491:b0:163:771a:55e7 with SMTP id
 c17-20020a170902d49100b00163771a55e7mr27954585plg.77.1654020213239; 
 Tue, 31 May 2022 11:03:33 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 s12-20020a632c0c000000b003f5e0c264bcsm10746611pgs.66.2022.05.31.11.03.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 11:03:32 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v5  3/3] target/riscv: Add vstimecmp support
Date: Tue, 31 May 2022 11:03:21 -0700
Message-Id: <20220531180321.34942-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220531180321.34942-1-atishp@rivosinc.com>
References: <20220531180321.34942-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=atishp@rivosinc.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

vstimecmp CSR allows the guest OS or to program the next guest timer
interrupt directly. Thus, hypervisor no longer need to inject the
timer interrupt to the guest if vstimecmp is used. This was ratified
as a part of the Sstc extension.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu.h         |   4 ++
 target/riscv/cpu_bits.h    |   4 ++
 target/riscv/cpu_helper.c  |  11 ++--
 target/riscv/csr.c         | 100 ++++++++++++++++++++++++++++++++++++-
 target/riscv/machine.c     |   1 +
 target/riscv/time_helper.c |  16 ++++++
 6 files changed, 131 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 9a5e02f217ba..063d90eebf4d 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -279,6 +279,8 @@ struct CPUArchState {
     /* Sstc CSRs */
     uint64_t stimecmp;
 
+    uint64_t vstimecmp;
+
     /* physical memory protection */
     pmp_table_t pmp_state;
     target_ulong mseccfg;
@@ -333,6 +335,8 @@ struct CPUArchState {
 
     /* Fields from here on are preserved across CPU reset. */
     QEMUTimer *stimer; /* Internal timer for S-mode interrupt */
+    QEMUTimer *vstimer; /* Internal timer for VS-mode interrupt */
+    bool vstime_irq;
 
     hwaddr kernel_addr;
     hwaddr fdt_addr;
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 29d0e4a1be01..5c9f512872e1 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -272,6 +272,10 @@
 #define CSR_VSIP            0x244
 #define CSR_VSATP           0x280
 
+/* Sstc virtual CSRs */
+#define CSR_VSTIMECMP       0x24D
+#define CSR_VSTIMECMPH      0x25D
+
 #define CSR_MTINST          0x34a
 #define CSR_MTVAL2          0x34b
 
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index e1aa4f2097c1..2715021c022e 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -344,8 +344,9 @@ static uint64_t riscv_cpu_all_pending(CPURISCVState *env)
 {
     uint32_t gein = get_field(env->hstatus, HSTATUS_VGEIN);
     uint64_t vsgein = (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
+    uint64_t vstip = (env->vstime_irq) ? MIP_VSTIP : 0;
 
-    return (env->mip | vsgein) & env->mie;
+    return (env->mip | vsgein | vstip) & env->mie;
 }
 
 int riscv_cpu_mirq_pending(CPURISCVState *env)
@@ -604,7 +605,7 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value)
 {
     CPURISCVState *env = &cpu->env;
     CPUState *cs = CPU(cpu);
-    uint64_t gein, vsgein = 0, old = env->mip;
+    uint64_t gein, vsgein = 0, vstip = 0, old = env->mip;
     bool locked = false;
 
     if (riscv_cpu_virt_enabled(env)) {
@@ -612,6 +613,10 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value)
         vsgein = (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
     }
 
+    /* No need to update mip for VSTIP */
+    mask = ((mask == MIP_VSTIP) && env->vstime_irq) ? 0 : mask;
+    vstip = env->vstime_irq ? MIP_VSTIP : 0;
+
     if (!qemu_mutex_iothread_locked()) {
         locked = true;
         qemu_mutex_lock_iothread();
@@ -619,7 +624,7 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value)
 
     env->mip = (env->mip & ~mask) | (value & mask);
 
-    if (env->mip | vsgein) {
+    if (env->mip | vsgein | vstip) {
         cpu_interrupt(cs, CPU_INTERRUPT_HARD);
     } else {
         cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 48d07911ae14..6d1875509ce2 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -567,17 +567,98 @@ static RISCVException sstc(CPURISCVState *env, int csrno)
     return RISCV_EXCP_NONE;
 }
 
+static RISCVException sstc_hmode(CPURISCVState *env, int csrno)
+{
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
+
+    if (!cpu->cfg.ext_sstc || !env->rdtime_fn) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    if (env->priv == PRV_M) {
+        return RISCV_EXCP_NONE;
+    }
+
+    if (!(get_field(env->mcounteren, COUNTEREN_TM) &
+          get_field(env->menvcfg, MENVCFG_STCE))) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    if (!(get_field(env->hcounteren, COUNTEREN_TM) &
+          get_field(env->henvcfg, HENVCFG_STCE))) {
+        return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_vstimecmp(CPURISCVState *env, int csrno,
+                                    target_ulong *val)
+{
+    *val = env->vstimecmp;
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_vstimecmph(CPURISCVState *env, int csrno,
+                                    target_ulong *val)
+{
+    *val = env->vstimecmp >> 32;
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_vstimecmp(CPURISCVState *env, int csrno,
+                                    target_ulong val)
+{
+    RISCVCPU *cpu = env_archcpu(env);
+
+    if (riscv_cpu_mxl(env) == MXL_RV32) {
+        env->vstimecmp = deposit64(env->vstimecmp, 0, 32, (uint64_t)val);
+    } else {
+        env->vstimecmp = val;
+    }
+
+    riscv_timer_write_timecmp(cpu, env->vstimer, env->vstimecmp,
+                              env->htimedelta, MIP_VSTIP);
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_vstimecmph(CPURISCVState *env, int csrno,
+                                    target_ulong val)
+{
+    RISCVCPU *cpu = env_archcpu(env);
+
+    env->vstimecmp = deposit64(env->vstimecmp, 32, 32, (uint64_t)val);
+    riscv_timer_write_timecmp(cpu, env->vstimer, env->vstimecmp,
+                              env->htimedelta, MIP_VSTIP);
+
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_stimecmp(CPURISCVState *env, int csrno,
                                     target_ulong *val)
 {
-    *val = env->stimecmp;
+    if (riscv_cpu_virt_enabled(env)) {
+        *val = env->vstimecmp;
+    } else {
+        *val = env->stimecmp;
+    }
+
     return RISCV_EXCP_NONE;
 }
 
 static RISCVException read_stimecmph(CPURISCVState *env, int csrno,
                                     target_ulong *val)
 {
-    *val = env->stimecmp >> 32;
+    if (riscv_cpu_virt_enabled(env)) {
+        *val = env->vstimecmp >> 32;
+    } else {
+        *val = env->stimecmp >> 32;
+    }
+
     return RISCV_EXCP_NONE;
 }
 
@@ -586,6 +667,10 @@ static RISCVException write_stimecmp(CPURISCVState *env, int csrno,
 {
     RISCVCPU *cpu = env_archcpu(env);
 
+    if (riscv_cpu_virt_enabled(env)) {
+        return write_vstimecmp(env, csrno, val);
+    }
+
     if (riscv_cpu_mxl(env) == MXL_RV32) {
         env->stimecmp = deposit64(env->stimecmp, 0, 32, (uint64_t)val);
     } else {
@@ -602,6 +687,10 @@ static RISCVException write_stimecmph(CPURISCVState *env, int csrno,
 {
     RISCVCPU *cpu = env_archcpu(env);
 
+    if (riscv_cpu_virt_enabled(env)) {
+        return write_vstimecmph(env, csrno, val);
+    }
+
     env->stimecmp = deposit64(env->stimecmp, 32, 32, (uint64_t)val);
     riscv_timer_write_timecmp(cpu, env->stimer, env->stimecmp, 0, MIP_STIP);
 
@@ -1601,6 +1690,7 @@ static RISCVException rmw_mip64(CPURISCVState *env, int csrno,
     if (csrno != CSR_HVIP) {
         gin = get_field(env->hstatus, HSTATUS_VGEIN);
         old_mip |= (env->hgeip & ((target_ulong)1 << gin)) ? MIP_VSEIP : 0;
+        old_mip |= env->vstime_irq ? MIP_VSTIP : 0;
     }
 
     if (ret_val) {
@@ -3422,6 +3512,12 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
                                           .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_STIMECMPH] = { "stimecmph", sstc, read_stimecmph, write_stimecmph,
                                           .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_VSTIMECMP] = { "vstimecmp", sstc_hmode, read_vstimecmp,
+                                          write_vstimecmp,
+                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_VSTIMECMPH] = { "vstimecmph", sstc_hmode, read_vstimecmph,
+                                          write_vstimecmph,
+                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
 
     /* Supervisor Protection and Translation */
     [CSR_SATP]     = { "satp",     smode, read_satp,    write_satp      },
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index ee02bfc18916..d453b401bdfd 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -92,6 +92,7 @@ static const VMStateDescription vmstate_hyper = {
         VMSTATE_UINTTL(env.hgeie, RISCVCPU),
         VMSTATE_UINTTL(env.hgeip, RISCVCPU),
         VMSTATE_UINT64(env.htimedelta, RISCVCPU),
+        VMSTATE_UINT64(env.vstimecmp, RISCVCPU),
 
         VMSTATE_UINTTL(env.hvictl, RISCVCPU),
         VMSTATE_UINT8_ARRAY(env.hviprio, RISCVCPU, 64),
diff --git a/target/riscv/time_helper.c b/target/riscv/time_helper.c
index f3fb5eac7b7b..8cce667dfd47 100644
--- a/target/riscv/time_helper.c
+++ b/target/riscv/time_helper.c
@@ -22,6 +22,14 @@
 #include "time_helper.h"
 #include "hw/intc/riscv_aclint.h"
 
+static void riscv_vstimer_cb(void *opaque)
+{
+    RISCVCPU *cpu = opaque;
+    CPURISCVState *env = &cpu->env;
+    env->vstime_irq = 1;
+    riscv_cpu_update_mip(cpu, MIP_VSTIP, BOOL_TO_MASK(1));
+}
+
 static void riscv_stimer_cb(void *opaque)
 {
     RISCVCPU *cpu = opaque;
@@ -47,10 +55,16 @@ void riscv_timer_write_timecmp(RISCVCPU *cpu, QEMUTimer *timer,
          * If we're setting an stimecmp value in the "past",
          * immediately raise the timer interrupt
          */
+        if (timer_irq == MIP_VSTIP) {
+            env->vstime_irq = 1;
+        }
         riscv_cpu_update_mip(cpu, timer_irq, BOOL_TO_MASK(1));
         return;
     }
 
+    if (timer_irq == MIP_VSTIP) {
+        env->vstime_irq = 0;
+    }
     /* Clear the [V]STIP bit in mip */
     riscv_cpu_update_mip(cpu, timer_irq, BOOL_TO_MASK(0));
 
@@ -95,4 +109,6 @@ void riscv_timer_init(RISCVCPU *cpu)
     env->stimer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &riscv_stimer_cb, cpu);
     env->stimecmp = 0;
 
+    env->vstimer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &riscv_vstimer_cb, cpu);
+    env->vstimecmp = 0;
 }
-- 
2.25.1


