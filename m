Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A00433B0A
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 17:47:57 +0200 (CEST)
Received: from localhost ([::1]:46864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcrLI-0006Vh-67
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 11:47:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcqyu-0004qm-NZ
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 11:24:49 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:44673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcqyp-0007Uh-9Y
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 11:24:48 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 oa12-20020a17090b1bcc00b0019f715462a8so131808pjb.3
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 08:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=axUeM4wR3ZbiQZ9gN07cf/OmbYseQ9DiBDAnxCabNms=;
 b=RUhG/S6YYdTCuPZ4MM1Knxgo8cng9PlOEBTG+10a6BaHwGpqWEJKiWWIv7YM+A1H4M
 /bKW4DjkYyft23Ya896B0QzjA66D4//Hl8HWz4De+k6nB2W/EFLY6z1R4OTsCPFoYCq4
 JdyV5MvzWhx2KuPDYUSA7KDSleXsKNWxiLJXbNazpaj3Kb++cos3bF3JTqaG3k/MrMwT
 Qni+LsOu76FdQNsmUxpd5EFBhzS3Mha9Pjq7PlTcFU4FSWID1AI50G/1N0ZwLavEHTh1
 TwP2KTp0rIOK2cmAmYF5IJh2Gq+g9vWKbzvh2FeYw8x0Rz/f45q4NosXfRa0XewpBkbV
 105A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=axUeM4wR3ZbiQZ9gN07cf/OmbYseQ9DiBDAnxCabNms=;
 b=bLWjs9Ave0nxZsVq+9eRFcIjxZg9Y6kSX+X1J5wNGNw7Mj4HAIiCSHwKVD5228UAtp
 VzBF6+DjtngAeCEJekc0GI/hioJYalJkHrZMTGEjXhqNijcKzTMEk40iSU3mPNllJDar
 Kto8AfhB6MKS4cmmy5sujBtvMoKGu2q/nJ5YmohEXiTVciPx7TRhfERCZHNoc9LRf10i
 /6mrkeuuzCyZMyqKrBKnt23xk3Kz3PDk9sdmSwk7G/JHOdnMRoZo4XKgZvwmU+Ygq0Mh
 KZtXkttLr09QaAzWsbhVZE8uJoG8bjaV40zdAFHsPte0f6rIAVeI34kUVeUdKem/KEeT
 ggeA==
X-Gm-Message-State: AOAM532cDYwz67ZionSyDqrfuDovfUMtNRlEfAI6Bo0AJR55irr50VIR
 b4y0qjqpbhJmqCLtriRg7PLGn1WqHExaww==
X-Google-Smtp-Source: ABdhPJxRK1pUX6PG+Xe45+mowdTzIiiiA9R/QvoVEjcoISnx3m53rE68F7hzVv/3NCJyHRayabS94A==
X-Received: by 2002:a17:902:db0a:b0:13e:e968:e144 with SMTP id
 m10-20020a170902db0a00b0013ee968e144mr33936236plx.43.1634657081803; 
 Tue, 19 Oct 2021 08:24:41 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id i2sm3293814pjt.19.2021.10.19.08.24.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 08:24:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 03/16] target/riscv: Split misa.mxl and misa.ext
Date: Tue, 19 Oct 2021 08:24:25 -0700
Message-Id: <20211019152438.269077-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019152438.269077-1-richard.henderson@linaro.org>
References: <20211019152438.269077-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: alistair.francis@wdc.com, qemu-riscv@nongnu.org, zhiwei_liu@c-sky.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The hw representation of misa.mxl is at the high bits of the
misa csr.  Representing this in the same way inside QEMU
results in overly complex code trying to check that field.

Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.h          | 15 +++----
 linux-user/elfload.c        |  2 +-
 linux-user/riscv/cpu_loop.c |  2 +-
 target/riscv/cpu.c          | 78 +++++++++++++++++++++----------------
 target/riscv/csr.c          | 44 ++++++++++++++-------
 target/riscv/gdbstub.c      |  8 ++--
 target/riscv/machine.c      | 10 +++--
 target/riscv/translate.c    | 10 +++--
 8 files changed, 100 insertions(+), 69 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7084efc452..e708fcc168 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -25,6 +25,7 @@
 #include "exec/cpu-defs.h"
 #include "fpu/softfloat-types.h"
 #include "qom/object.h"
+#include "cpu_bits.h"
 
 #define TCG_GUEST_DEFAULT_MO 0
 
@@ -51,9 +52,6 @@
 # define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE64
 #endif
 
-#define RV32 ((target_ulong)1 << (TARGET_LONG_BITS - 2))
-#define RV64 ((target_ulong)2 << (TARGET_LONG_BITS - 2))
-
 #define RV(x) ((target_ulong)1 << (x - 'A'))
 
 #define RVI RV('I')
@@ -133,8 +131,12 @@ struct CPURISCVState {
     target_ulong priv_ver;
     target_ulong bext_ver;
     target_ulong vext_ver;
-    target_ulong misa;
-    target_ulong misa_mask;
+
+    /* RISCVMXL, but uint32_t for vmstate migration */
+    uint32_t misa_mxl;      /* current mxl */
+    uint32_t misa_mxl_max;  /* max mxl for this cpu */
+    uint32_t misa_ext;      /* current extensions */
+    uint32_t misa_ext_mask; /* max ext for this cpu */
 
     uint32_t features;
 
@@ -313,7 +315,7 @@ struct RISCVCPU {
 
 static inline int riscv_has_ext(CPURISCVState *env, target_ulong ext)
 {
-    return (env->misa & ext) != 0;
+    return (env->misa_ext & ext) != 0;
 }
 
 static inline bool riscv_feature(CPURISCVState *env, int feature)
@@ -322,7 +324,6 @@ static inline bool riscv_feature(CPURISCVState *env, int feature)
 }
 
 #include "cpu_user.h"
-#include "cpu_bits.h"
 
 extern const char * const riscv_int_regnames[];
 extern const char * const riscv_fpr_regnames[];
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 2404d482ba..214c1aa40d 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -1448,7 +1448,7 @@ static uint32_t get_elf_hwcap(void)
     uint32_t mask = MISA_BIT('I') | MISA_BIT('M') | MISA_BIT('A')
                     | MISA_BIT('F') | MISA_BIT('D') | MISA_BIT('C');
 
-    return cpu->env.misa & mask;
+    return cpu->env.misa_ext & mask;
 #undef MISA_BIT
 }
 
diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
index 9859a366e4..e5bb6d908a 100644
--- a/linux-user/riscv/cpu_loop.c
+++ b/linux-user/riscv/cpu_loop.c
@@ -133,7 +133,7 @@ void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
     env->gpr[xSP] = regs->sp;
     env->elf_flags = info->elf_flags;
 
-    if ((env->misa & RVE) && !(env->elf_flags & EF_RISCV_RVE)) {
+    if ((env->misa_ext & RVE) && !(env->elf_flags & EF_RISCV_RVE)) {
         error_report("Incompatible ELF: RVE cpu requires RVE ABI binary");
         exit(EXIT_FAILURE);
     }
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1d69d1887e..fdf031a394 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -110,16 +110,13 @@ const char *riscv_cpu_get_trap_name(target_ulong cause, bool async)
 
 bool riscv_cpu_is_32bit(CPURISCVState *env)
 {
-    if (env->misa & RV64) {
-        return false;
-    }
-
-    return true;
+    return env->misa_mxl == MXL_RV32;
 }
 
-static void set_misa(CPURISCVState *env, target_ulong misa)
+static void set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext)
 {
-    env->misa_mask = env->misa = misa;
+    env->misa_mxl_max = env->misa_mxl = mxl;
+    env->misa_ext_mask = env->misa_ext = ext;
 }
 
 static void set_priv_version(CPURISCVState *env, int priv_ver)
@@ -148,9 +145,9 @@ static void riscv_any_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
 #if defined(TARGET_RISCV32)
-    set_misa(env, RV32 | RVI | RVM | RVA | RVF | RVD | RVC | RVU);
+    set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
 #elif defined(TARGET_RISCV64)
-    set_misa(env, RV64 | RVI | RVM | RVA | RVF | RVD | RVC | RVU);
+    set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
 #endif
     set_priv_version(env, PRIV_VERSION_1_11_0);
 }
@@ -160,20 +157,20 @@ static void rv64_base_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
-    set_misa(env, RV64);
+    set_misa(env, MXL_RV64, 0);
 }
 
 static void rv64_sifive_u_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
-    set_misa(env, RV64 | RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
+    set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
 }
 
 static void rv64_sifive_e_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
-    set_misa(env, RV64 | RVI | RVM | RVA | RVC | RVU);
+    set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
     qdev_prop_set_bit(DEVICE(obj), "mmu", false);
 }
@@ -182,20 +179,20 @@ static void rv32_base_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
-    set_misa(env, RV32);
+    set_misa(env, MXL_RV32, 0);
 }
 
 static void rv32_sifive_u_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
-    set_misa(env, RV32 | RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
+    set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
 }
 
 static void rv32_sifive_e_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
-    set_misa(env, RV32 | RVI | RVM | RVA | RVC | RVU);
+    set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
     qdev_prop_set_bit(DEVICE(obj), "mmu", false);
 }
@@ -203,7 +200,7 @@ static void rv32_sifive_e_cpu_init(Object *obj)
 static void rv32_ibex_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
-    set_misa(env, RV32 | RVI | RVM | RVC | RVU);
+    set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
     qdev_prop_set_bit(DEVICE(obj), "mmu", false);
     qdev_prop_set_bit(DEVICE(obj), "x-epmp", true);
@@ -212,7 +209,7 @@ static void rv32_ibex_cpu_init(Object *obj)
 static void rv32_imafcu_nommu_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
-    set_misa(env, RV32 | RVI | RVM | RVA | RVF | RVC | RVU);
+    set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
     set_resetvec(env, DEFAULT_RSTVEC);
     qdev_prop_set_bit(DEVICE(obj), "mmu", false);
@@ -360,6 +357,7 @@ static void riscv_cpu_reset(DeviceState *dev)
 
     mcc->parent_reset(dev);
 #ifndef CONFIG_USER_ONLY
+    env->misa_mxl = env->misa_mxl_max;
     env->priv = PRV_M;
     env->mstatus &= ~(MSTATUS_MIE | MSTATUS_MPRV);
     env->mcause = 0;
@@ -388,7 +386,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     CPURISCVState *env = &cpu->env;
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
     int priv_version = 0;
-    target_ulong target_misa = env->misa;
     Error *local_err = NULL;
 
     cpu_exec_realizefn(cs, &local_err);
@@ -434,8 +431,23 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 
     set_resetvec(env, cpu->cfg.resetvec);
 
-    /* If only XLEN is set for misa, then set misa from properties */
-    if (env->misa == RV32 || env->misa == RV64) {
+    /* Validate that MISA_MXL is set properly. */
+    switch (env->misa_mxl_max) {
+#ifdef TARGET_RISCV64
+    case MXL_RV64:
+        break;
+#endif
+    case MXL_RV32:
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    assert(env->misa_mxl_max == env->misa_mxl);
+
+    /* If only MISA_EXT is unset for misa, then set it from properties */
+    if (env->misa_ext == 0) {
+        uint32_t ext = 0;
+
         /* Do some ISA extension error checking */
         if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
             error_setg(errp,
@@ -462,38 +474,38 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 
         /* Set the ISA extensions, checks should have happened above */
         if (cpu->cfg.ext_i) {
-            target_misa |= RVI;
+            ext |= RVI;
         }
         if (cpu->cfg.ext_e) {
-            target_misa |= RVE;
+            ext |= RVE;
         }
         if (cpu->cfg.ext_m) {
-            target_misa |= RVM;
+            ext |= RVM;
         }
         if (cpu->cfg.ext_a) {
-            target_misa |= RVA;
+            ext |= RVA;
         }
         if (cpu->cfg.ext_f) {
-            target_misa |= RVF;
+            ext |= RVF;
         }
         if (cpu->cfg.ext_d) {
-            target_misa |= RVD;
+            ext |= RVD;
         }
         if (cpu->cfg.ext_c) {
-            target_misa |= RVC;
+            ext |= RVC;
         }
         if (cpu->cfg.ext_s) {
-            target_misa |= RVS;
+            ext |= RVS;
         }
         if (cpu->cfg.ext_u) {
-            target_misa |= RVU;
+            ext |= RVU;
         }
         if (cpu->cfg.ext_h) {
-            target_misa |= RVH;
+            ext |= RVH;
         }
         if (cpu->cfg.ext_v) {
             int vext_version = VEXT_VERSION_0_07_1;
-            target_misa |= RVV;
+            ext |= RVV;
             if (!is_power_of_2(cpu->cfg.vlen)) {
                 error_setg(errp,
                         "Vector extension VLEN must be power of 2");
@@ -532,7 +544,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             set_vext_version(env, vext_version);
         }
 
-        set_misa(env, target_misa);
+        set_misa(env, env->misa_mxl, ext);
     }
 
     riscv_cpu_register_gdb_regs_for_features(cs);
@@ -705,7 +717,7 @@ char *riscv_isa_string(RISCVCPU *cpu)
     char *isa_str = g_new(char, maxlen);
     char *p = isa_str + snprintf(isa_str, maxlen, "rv%d", TARGET_LONG_BITS);
     for (i = 0; i < sizeof(riscv_exts); i++) {
-        if (cpu->env.misa & RV(riscv_exts[i])) {
+        if (cpu->env.misa_ext & RV(riscv_exts[i])) {
             *p++ = qemu_tolower(riscv_exts[i]);
         }
     }
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 23fbbd3216..d0c86a300d 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -39,7 +39,7 @@ static RISCVException fs(CPURISCVState *env, int csrno)
 {
 #if !defined(CONFIG_USER_ONLY)
     /* loose check condition for fcsr in vector extension */
-    if ((csrno == CSR_FCSR) && (env->misa & RVV)) {
+    if ((csrno == CSR_FCSR) && (env->misa_ext & RVV)) {
         return RISCV_EXCP_NONE;
     }
     if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
@@ -51,7 +51,7 @@ static RISCVException fs(CPURISCVState *env, int csrno)
 
 static RISCVException vs(CPURISCVState *env, int csrno)
 {
-    if (env->misa & RVV) {
+    if (env->misa_ext & RVV) {
         return RISCV_EXCP_NONE;
     }
     return RISCV_EXCP_ILLEGAL_INST;
@@ -557,7 +557,22 @@ static RISCVException write_mstatush(CPURISCVState *env, int csrno,
 static RISCVException read_misa(CPURISCVState *env, int csrno,
                                 target_ulong *val)
 {
-    *val = env->misa;
+    target_ulong misa;
+
+    switch (env->misa_mxl) {
+    case MXL_RV32:
+        misa = (target_ulong)MXL_RV32 << 30;
+        break;
+#ifdef TARGET_RISCV64
+    case MXL_RV64:
+        misa = (target_ulong)MXL_RV64 << 62;
+        break;
+#endif
+    default:
+        g_assert_not_reached();
+    }
+
+    *val = misa | env->misa_ext;
     return RISCV_EXCP_NONE;
 }
 
@@ -583,8 +598,13 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
         return RISCV_EXCP_NONE;
     }
 
+    /*
+     * misa.MXL writes are not supported by QEMU.
+     * Drop writes to those bits.
+     */
+
     /* Mask extensions that are not supported by this hart */
-    val &= env->misa_mask;
+    val &= env->misa_ext_mask;
 
     /* Mask extensions that are not supported by QEMU */
     val &= (RVI | RVE | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
@@ -601,20 +621,14 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
         val &= ~RVC;
     }
 
-    /* misa.MXL writes are not supported by QEMU */
-    if (riscv_cpu_is_32bit(env)) {
-        val = (env->misa & MISA32_MXL) | (val & ~MISA32_MXL);
-    } else {
-        val = (env->misa & MISA64_MXL) | (val & ~MISA64_MXL);
+    /* If nothing changed, do nothing. */
+    if (val == env->misa_ext) {
+        return RISCV_EXCP_NONE;
     }
 
     /* flush translation cache */
-    if (val != env->misa) {
-        tb_flush(env_cpu(env));
-    }
-
-    env->misa = val;
-
+    tb_flush(env_cpu(env));
+    env->misa_ext = val;
     return RISCV_EXCP_NONE;
 }
 
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index a7a9c0b1fe..5257df0217 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -54,10 +54,10 @@ int riscv_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
 static int riscv_gdb_get_fpu(CPURISCVState *env, GByteArray *buf, int n)
 {
     if (n < 32) {
-        if (env->misa & RVD) {
+        if (env->misa_ext & RVD) {
             return gdb_get_reg64(buf, env->fpr[n]);
         }
-        if (env->misa & RVF) {
+        if (env->misa_ext & RVF) {
             return gdb_get_reg32(buf, env->fpr[n]);
         }
     /* there is hole between ft11 and fflags in fpu.xml */
@@ -191,10 +191,10 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
-    if (env->misa & RVD) {
+    if (env->misa_ext & RVD) {
         gdb_register_coprocessor(cs, riscv_gdb_get_fpu, riscv_gdb_set_fpu,
                                  36, "riscv-64bit-fpu.xml", 0);
-    } else if (env->misa & RVF) {
+    } else if (env->misa_ext & RVF) {
         gdb_register_coprocessor(cs, riscv_gdb_get_fpu, riscv_gdb_set_fpu,
                                  36, "riscv-32bit-fpu.xml", 0);
     }
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 16a08302da..f64b2a96c1 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -140,8 +140,8 @@ static const VMStateDescription vmstate_hyper = {
 
 const VMStateDescription vmstate_riscv_cpu = {
     .name = "cpu",
-    .version_id = 2,
-    .minimum_version_id = 2,
+    .version_id = 3,
+    .minimum_version_id = 3,
     .fields = (VMStateField[]) {
         VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
         VMSTATE_UINT64_ARRAY(env.fpr, RISCVCPU, 32),
@@ -153,8 +153,10 @@ const VMStateDescription vmstate_riscv_cpu = {
         VMSTATE_UINTTL(env.guest_phys_fault_addr, RISCVCPU),
         VMSTATE_UINTTL(env.priv_ver, RISCVCPU),
         VMSTATE_UINTTL(env.vext_ver, RISCVCPU),
-        VMSTATE_UINTTL(env.misa, RISCVCPU),
-        VMSTATE_UINTTL(env.misa_mask, RISCVCPU),
+        VMSTATE_UINT32(env.misa_mxl, RISCVCPU),
+        VMSTATE_UINT32(env.misa_ext, RISCVCPU),
+        VMSTATE_UINT32(env.misa_mxl_max, RISCVCPU),
+        VMSTATE_UINT32(env.misa_ext_mask, RISCVCPU),
         VMSTATE_UINT32(env.features, RISCVCPU),
         VMSTATE_UINTTL(env.priv, RISCVCPU),
         VMSTATE_UINTTL(env.virt, RISCVCPU),
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 6d7fbca1fa..66857732e8 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -55,7 +55,8 @@ typedef struct DisasContext {
     /* pc_succ_insn points to the instruction following base.pc_next */
     target_ulong pc_succ_insn;
     target_ulong priv_ver;
-    target_ulong misa;
+    RISCVMXL xl;
+    uint32_t misa_ext;
     uint32_t opcode;
     uint32_t mstatus_fs;
     uint32_t mstatus_hs_fs;
@@ -86,7 +87,7 @@ typedef struct DisasContext {
 
 static inline bool has_ext(DisasContext *ctx, uint32_t ext)
 {
-    return ctx->misa & ext;
+    return ctx->misa_ext & ext;
 }
 
 #ifdef TARGET_RISCV32
@@ -96,7 +97,7 @@ static inline bool has_ext(DisasContext *ctx, uint32_t ext)
 #else
 static inline bool is_32bit(DisasContext *ctx)
 {
-    return (ctx->misa & RV32) == RV32;
+    return ctx->xl == MXL_RV32;
 }
 #endif
 
@@ -513,7 +514,8 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 #else
     ctx->virt_enabled = false;
 #endif
-    ctx->misa = env->misa;
+    ctx->xl = env->misa_mxl;
+    ctx->misa_ext = env->misa_ext;
     ctx->frm = -1;  /* unknown rounding mode */
     ctx->ext_ifencei = cpu->cfg.ext_ifencei;
     ctx->vlen = cpu->cfg.vlen;
-- 
2.25.1


