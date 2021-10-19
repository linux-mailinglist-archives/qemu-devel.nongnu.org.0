Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 623FD432B04
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 02:07:35 +0200 (CEST)
Received: from localhost ([::1]:59870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mccfG-0005dU-FJ
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 20:07:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mccZI-0004r1-EJ
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 20:01:29 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:44027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mccZA-0001eq-W7
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 20:01:23 -0400
Received: by mail-pl1-x62e.google.com with SMTP id y1so12402463plk.10
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 17:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X6q/MRbAFAFtB483mpgrCV5jJyP32WJZt950gYxzILo=;
 b=D9SMLCQk4xys5O2tx8HEYrtQcmzmLTgdrni+qaPj5G9W9zsIn6aWC5hsqpMWryHAAd
 rwszmVwzaa+t6ruxxOVZWe2Gyz7sBJrix0itmMKNEhyDAnrpC8nSMmDK0+o8jsYG0Itq
 0gCLvnHtPqnHXtXdXllv2ykX5t11Os1HPISaerfaGvvs5H5lqAMofrx7cYq+X8FkOuV4
 X/JVRK7+solem5rXdFLcwOzAlxZP/IJPbVxqio8lVgpWRnbtJBB+BFO/xGP0sgviM+eE
 HAQ87iGpkVN5e55Thv1+luGMldQ3xZqrVZihNOFx4j08A3t7Z32HRsiK7W7soDbkUZp3
 +Nug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X6q/MRbAFAFtB483mpgrCV5jJyP32WJZt950gYxzILo=;
 b=MLRgryIQRSyIrLRUey5D1dwjI9c61APA2sZCYBxPYu/2ym8jgMzb8NSg8LuT9JhXhO
 dK8OB0/h0ltHfjFPK3mkZU8yyBWYA5AzpxkBwb+PxyafspcdZOqCkhVz+62LyiJJGjtW
 cXD/QOfa4mvMaEQnuQVqdAcQ4r9my1NiaT0RJoeiG2u+i2NkJrKJ6MV61+HhKIeDunIK
 RkkhfBOD7iuV6+3XUPTxK9cVDeV1FmLkYMzy+uThbPoQI1us/ocb0CT8fPUNCQks20n1
 vGhcshhkbeJ1q7thyQSLYQznHVK8f8jbJ5+8jXzryfzJ5L6BoLw2fQfi6zzwzTX3lSzq
 bGBg==
X-Gm-Message-State: AOAM532c3Cqf0w2bhT0GQMc3vXmYLFTYz6NrQW6C8PEQdLdxK2/bfaFQ
 Ri0rtNo3EiJaOPN73+rdB8qt1yimxFqQEQ==
X-Google-Smtp-Source: ABdhPJzZuFeMOP6uUYRQhn/fVG3IsTkcn3Mb7u+yiat+ZJIx+TB5nayMAoQyxRQx+vvOYqwcr7Gi6Q==
X-Received: by 2002:a17:90a:384a:: with SMTP id
 l10mr2362607pjf.168.1634601672258; 
 Mon, 18 Oct 2021 17:01:12 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q14sm3068220pfk.3.2021.10.18.17.01.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 17:01:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 04/16] target/riscv: Replace riscv_cpu_is_32bit with
 riscv_cpu_mxl
Date: Mon, 18 Oct 2021 17:00:56 -0700
Message-Id: <20211019000108.3678724-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019000108.3678724-1-richard.henderson@linaro.org>
References: <20211019000108.3678724-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: alistair.francis@wdc.com, qemu-riscv@nongnu.org, zhiwei_liu@c-sky.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Shortly, the set of supported XL will not be just 32 and 64,
and representing that properly using the enumeration will be
imperative.

Two places, booting and gdb, intentionally use misa_mxl_max
to emphasize the use of the reset value of misa.mxl, and not
the current cpu state.

Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.h            |  9 ++++++++-
 hw/riscv/boot.c               |  2 +-
 semihosting/arm-compat-semi.c |  2 +-
 target/riscv/cpu.c            | 24 ++++++++++++++----------
 target/riscv/cpu_helper.c     | 12 ++++++------
 target/riscv/csr.c            | 24 ++++++++++++------------
 target/riscv/gdbstub.c        |  2 +-
 target/riscv/monitor.c        |  4 ++--
 8 files changed, 45 insertions(+), 34 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index e708fcc168..d0e82135a9 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -396,7 +396,14 @@ FIELD(TB_FLAGS, VILL, 8, 1)
 FIELD(TB_FLAGS, HLSX, 9, 1)
 FIELD(TB_FLAGS, MSTATUS_HS_FS, 10, 2)
 
-bool riscv_cpu_is_32bit(CPURISCVState *env);
+#ifdef TARGET_RISCV32
+#define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
+#else
+static inline RISCVMXL riscv_cpu_mxl(CPURISCVState *env)
+{
+    return env->misa_mxl;
+}
+#endif
 
 /*
  * A simplification for VLMAX
diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 993bf89064..d1ffc7b56c 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -35,7 +35,7 @@
 
 bool riscv_is_32bit(RISCVHartArrayState *harts)
 {
-    return riscv_cpu_is_32bit(&harts->harts[0].env);
+    return harts->harts[0].env.misa_mxl_max == MXL_RV32;
 }
 
 target_ulong riscv_calc_kernel_start_addr(RISCVHartArrayState *harts,
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 01badea99c..37963becae 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -775,7 +775,7 @@ static inline bool is_64bit_semihosting(CPUArchState *env)
 #if defined(TARGET_ARM)
     return is_a64(env);
 #elif defined(TARGET_RISCV)
-    return !riscv_cpu_is_32bit(env);
+    return riscv_cpu_mxl(env) != MXL_RV32;
 #else
 #error un-handled architecture
 #endif
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index fdf031a394..1857670a69 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -108,11 +108,6 @@ const char *riscv_cpu_get_trap_name(target_ulong cause, bool async)
     }
 }
 
-bool riscv_cpu_is_32bit(CPURISCVState *env)
-{
-    return env->misa_mxl == MXL_RV32;
-}
-
 static void set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext)
 {
     env->misa_mxl_max = env->misa_mxl = mxl;
@@ -249,7 +244,7 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 #ifndef CONFIG_USER_ONLY
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mhartid ", env->mhartid);
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mstatus ", (target_ulong)env->mstatus);
-    if (riscv_cpu_is_32bit(env)) {
+    if (riscv_cpu_mxl(env) == MXL_RV32) {
         qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mstatush ",
                      (target_ulong)(env->mstatus >> 32));
     }
@@ -372,10 +367,16 @@ static void riscv_cpu_reset(DeviceState *dev)
 static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
 {
     RISCVCPU *cpu = RISCV_CPU(s);
-    if (riscv_cpu_is_32bit(&cpu->env)) {
+
+    switch (riscv_cpu_mxl(&cpu->env)) {
+    case MXL_RV32:
         info->print_insn = print_insn_riscv32;
-    } else {
+        break;
+    case MXL_RV64:
         info->print_insn = print_insn_riscv64;
+        break;
+    default:
+        g_assert_not_reached();
     }
 }
 
@@ -631,10 +632,13 @@ static gchar *riscv_gdb_arch_name(CPUState *cs)
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
 
-    if (riscv_cpu_is_32bit(env)) {
+    switch (riscv_cpu_mxl(env)) {
+    case MXL_RV32:
         return g_strdup("riscv:rv32");
-    } else {
+    case MXL_RV64:
         return g_strdup("riscv:rv64");
+    default:
+        g_assert_not_reached();
     }
 }
 
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 14d1d3cb72..403f54171d 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -152,7 +152,7 @@ bool riscv_cpu_fp_enabled(CPURISCVState *env)
 
 void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env)
 {
-    uint64_t sd = riscv_cpu_is_32bit(env) ? MSTATUS32_SD : MSTATUS64_SD;
+    uint64_t sd = riscv_cpu_mxl(env) == MXL_RV32 ? MSTATUS32_SD : MSTATUS64_SD;
     uint64_t mstatus_mask = MSTATUS_MXR | MSTATUS_SUM | MSTATUS_FS |
                             MSTATUS_SPP | MSTATUS_SPIE | MSTATUS_SIE |
                             MSTATUS64_UXL | sd;
@@ -447,7 +447,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
 
     if (first_stage == true) {
         if (use_background) {
-            if (riscv_cpu_is_32bit(env)) {
+            if (riscv_cpu_mxl(env) == MXL_RV32) {
                 base = (hwaddr)get_field(env->vsatp, SATP32_PPN) << PGSHIFT;
                 vm = get_field(env->vsatp, SATP32_MODE);
             } else {
@@ -455,7 +455,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
                 vm = get_field(env->vsatp, SATP64_MODE);
             }
         } else {
-            if (riscv_cpu_is_32bit(env)) {
+            if (riscv_cpu_mxl(env) == MXL_RV32) {
                 base = (hwaddr)get_field(env->satp, SATP32_PPN) << PGSHIFT;
                 vm = get_field(env->satp, SATP32_MODE);
             } else {
@@ -465,7 +465,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
         }
         widened = 0;
     } else {
-        if (riscv_cpu_is_32bit(env)) {
+        if (riscv_cpu_mxl(env) == MXL_RV32) {
             base = (hwaddr)get_field(env->hgatp, SATP32_PPN) << PGSHIFT;
             vm = get_field(env->hgatp, SATP32_MODE);
         } else {
@@ -558,7 +558,7 @@ restart:
         }
 
         target_ulong pte;
-        if (riscv_cpu_is_32bit(env)) {
+        if (riscv_cpu_mxl(env) == MXL_RV32) {
             pte = address_space_ldl(cs->as, pte_addr, attrs, &res);
         } else {
             pte = address_space_ldq(cs->as, pte_addr, attrs, &res);
@@ -678,7 +678,7 @@ static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
     int page_fault_exceptions, vm;
     uint64_t stap_mode;
 
-    if (riscv_cpu_is_32bit(env)) {
+    if (riscv_cpu_mxl(env) == MXL_RV32) {
         stap_mode = SATP32_MODE;
     } else {
         stap_mode = SATP64_MODE;
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d0c86a300d..9c0753bc8b 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -95,7 +95,7 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
             }
             break;
         }
-        if (riscv_cpu_is_32bit(env)) {
+        if (riscv_cpu_mxl(env) == MXL_RV32) {
             switch (csrno) {
             case CSR_CYCLEH:
                 if (!get_field(env->hcounteren, COUNTEREN_CY) &&
@@ -130,7 +130,7 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
 
 static RISCVException ctr32(CPURISCVState *env, int csrno)
 {
-    if (!riscv_cpu_is_32bit(env)) {
+    if (riscv_cpu_mxl(env) != MXL_RV32) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
@@ -145,7 +145,7 @@ static RISCVException any(CPURISCVState *env, int csrno)
 
 static RISCVException any32(CPURISCVState *env, int csrno)
 {
-    if (!riscv_cpu_is_32bit(env)) {
+    if (riscv_cpu_mxl(env) != MXL_RV32) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
@@ -180,7 +180,7 @@ static RISCVException hmode(CPURISCVState *env, int csrno)
 
 static RISCVException hmode32(CPURISCVState *env, int csrno)
 {
-    if (!riscv_cpu_is_32bit(env)) {
+    if (riscv_cpu_mxl(env) != MXL_RV32) {
         if (riscv_cpu_virt_enabled(env)) {
             return RISCV_EXCP_ILLEGAL_INST;
         } else {
@@ -486,7 +486,7 @@ static RISCVException read_mstatus(CPURISCVState *env, int csrno,
 
 static int validate_vm(CPURISCVState *env, target_ulong vm)
 {
-    if (riscv_cpu_is_32bit(env)) {
+    if (riscv_cpu_mxl(env) == MXL_RV32) {
         return valid_vm_1_10_32[vm & 0xf];
     } else {
         return valid_vm_1_10_64[vm & 0xf];
@@ -510,7 +510,7 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
         MSTATUS_MPP | MSTATUS_MXR | MSTATUS_TVM | MSTATUS_TSR |
         MSTATUS_TW;
 
-    if (!riscv_cpu_is_32bit(env)) {
+    if (riscv_cpu_mxl(env) != MXL_RV32) {
         /*
          * RV32: MPV and GVA are not in mstatus. The current plan is to
          * add them to mstatush. For now, we just don't support it.
@@ -522,7 +522,7 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
 
     dirty = ((mstatus & MSTATUS_FS) == MSTATUS_FS) |
             ((mstatus & MSTATUS_XS) == MSTATUS_XS);
-    if (riscv_cpu_is_32bit(env)) {
+    if (riscv_cpu_mxl(env) == MXL_RV32) {
         mstatus = set_field(mstatus, MSTATUS32_SD, dirty);
     } else {
         mstatus = set_field(mstatus, MSTATUS64_SD, dirty);
@@ -795,7 +795,7 @@ static RISCVException read_sstatus(CPURISCVState *env, int csrno,
 {
     target_ulong mask = (sstatus_v1_10_mask);
 
-    if (riscv_cpu_is_32bit(env)) {
+    if (riscv_cpu_mxl(env) == MXL_RV32) {
         mask |= SSTATUS32_SD;
     } else {
         mask |= SSTATUS64_SD;
@@ -1006,7 +1006,7 @@ static RISCVException write_satp(CPURISCVState *env, int csrno,
         return RISCV_EXCP_NONE;
     }
 
-    if (riscv_cpu_is_32bit(env)) {
+    if (riscv_cpu_mxl(env) == MXL_RV32) {
         vm = validate_vm(env, get_field(val, SATP32_MODE));
         mask = (val ^ env->satp) & (SATP32_MODE | SATP32_ASID | SATP32_PPN);
         asid = (val ^ env->satp) & SATP32_ASID;
@@ -1034,7 +1034,7 @@ static RISCVException read_hstatus(CPURISCVState *env, int csrno,
                                    target_ulong *val)
 {
     *val = env->hstatus;
-    if (!riscv_cpu_is_32bit(env)) {
+    if (riscv_cpu_mxl(env) != MXL_RV32) {
         /* We only support 64-bit VSXL */
         *val = set_field(*val, HSTATUS_VSXL, 2);
     }
@@ -1047,7 +1047,7 @@ static RISCVException write_hstatus(CPURISCVState *env, int csrno,
                                     target_ulong val)
 {
     env->hstatus = val;
-    if (!riscv_cpu_is_32bit(env) && get_field(val, HSTATUS_VSXL) != 2) {
+    if (riscv_cpu_mxl(env) != MXL_RV32 && get_field(val, HSTATUS_VSXL) != 2) {
         qemu_log_mask(LOG_UNIMP, "QEMU does not support mixed HSXLEN options.");
     }
     if (get_field(val, HSTATUS_VSBE) != 0) {
@@ -1215,7 +1215,7 @@ static RISCVException write_htimedelta(CPURISCVState *env, int csrno,
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
-    if (riscv_cpu_is_32bit(env)) {
+    if (riscv_cpu_mxl(env) == MXL_RV32) {
         env->htimedelta = deposit64(env->htimedelta, 0, 32, (uint64_t)val);
     } else {
         env->htimedelta = val;
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 5257df0217..23429179e2 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -161,7 +161,7 @@ static int riscv_gen_dynamic_csr_xml(CPUState *cs, int base_reg)
     CPURISCVState *env = &cpu->env;
     GString *s = g_string_new(NULL);
     riscv_csr_predicate_fn predicate;
-    int bitsize = riscv_cpu_is_32bit(env) ? 32 : 64;
+    int bitsize = 16 << env->misa_mxl_max;
     int i;
 
     g_string_printf(s, "<?xml version=\"1.0\"?>");
diff --git a/target/riscv/monitor.c b/target/riscv/monitor.c
index f7e6ea72b3..7efb4b62c1 100644
--- a/target/riscv/monitor.c
+++ b/target/riscv/monitor.c
@@ -150,7 +150,7 @@ static void mem_info_svxx(Monitor *mon, CPUArchState *env)
     target_ulong last_size;
     int last_attr;
 
-    if (riscv_cpu_is_32bit(env)) {
+    if (riscv_cpu_mxl(env) == MXL_RV32) {
         base = (hwaddr)get_field(env->satp, SATP32_PPN) << PGSHIFT;
         vm = get_field(env->satp, SATP32_MODE);
     } else {
@@ -220,7 +220,7 @@ void hmp_info_mem(Monitor *mon, const QDict *qdict)
         return;
     }
 
-    if (riscv_cpu_is_32bit(env)) {
+    if (riscv_cpu_mxl(env) == MXL_RV32) {
         if (!(env->satp & SATP32_MODE)) {
             monitor_printf(mon, "No translation or protection\n");
             return;
-- 
2.25.1


