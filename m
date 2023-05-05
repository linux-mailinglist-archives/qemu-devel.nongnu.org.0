Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE1D6F7A57
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:05:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujrs-0008Oq-DG; Thu, 04 May 2023 21:04:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujro-0008HW-EA
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:04:12 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujrm-0006yv-2y
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:04:12 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1ab0c697c2bso10723165ad.1
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248648; x=1685840648;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GSrByuyf+Wr8vm0cbqDXr0XzyjlqN/trYJTbY/9Zt6c=;
 b=b10wNwlLNExRguFeReHvqohzJQAfGLsdVcnt+gAa+GLOjJsjVyOYnGXdgZg38aY6Bq
 IquFu8w8cLGtIzOT+DfjQydrGzHve/LArfj25ARhqCs+VWMoF932cf2EQgYrm1Iiyk1S
 IRFKarb086i+FUFrgr1OHX9vfECTB4GCjikpz38hcLTDZP96fdLJMhm32g9qJG/CuMIQ
 HTVubydUfkbpUID3RxJnrF5cBPzCz9UPPC7Ew8R0nyIKlh87yi/I1g4QF1GrfJXIpriT
 uy+8D5bS5Rt+j5kzIltGa/8oQwiPIM3X0nNOGTusHmgEH1iUZQkrg9AlyDogX0SOtv51
 X9RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248648; x=1685840648;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GSrByuyf+Wr8vm0cbqDXr0XzyjlqN/trYJTbY/9Zt6c=;
 b=WZpMmm6FHsaeDzpoLjXafnmLsWjjGc2+Rm7qtloW8mALuB6FLBOkEpxMezpgOpGudS
 jBA0stiNW96pqKNX2n5OwMTBzwnCmfhImk4apv0SDqlbPyeYfOnO3daBaSMSkliHtiwo
 lRoAOXsJyqIyo0Pr6hNIhX4l3NOj7c0uHNX+ehnNNUMwxlIVTPnvxTdeggHvAUNFk5Qn
 mg/lp3OVDniwb5x8Y9IFRd34z1paJeF9uPtoyaSDMN4GonJIapKpU66P6bPbJ6G9uKMI
 UZ63JDpwGTtfjY/OLexx/RrL/YageMCDz+cpsgD+WZ4k4fno9z2ZWdAxopiOt+Vx8XSZ
 yVaw==
X-Gm-Message-State: AC+VfDz1HVWmVzl1aokv+ktSXPVNbukrotQYY1mGchaP15RfOB6+bxfl
 Yye1wZrPHwixPZ3CHFxFnT/ha5Qt4Tskdg==
X-Google-Smtp-Source: ACHHUZ57Bpl5eXX/x/qsuQiKer19i6HFZZH9aHUOfTS4On30yWrNN14OyTMqWPmLz+PDwa7yyxXgmQ==
X-Received: by 2002:a17:902:778a:b0:1aa:f612:cdf with SMTP id
 o10-20020a170902778a00b001aaf6120cdfmr5008936pll.37.1683248648340; 
 Thu, 04 May 2023 18:04:08 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:04:07 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 15/89] target/riscv: add support for Zcmt extension
Date: Fri,  5 May 2023 11:01:27 +1000
Message-Id: <20230505010241.21812-16-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x62c.google.com
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

Add encode, trans* functions and helper functions support for Zcmt
instrutions.
Add support for jvt csr.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230307081403.61950-8-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h                        |  4 ++
 target/riscv/cpu_bits.h                   |  7 +++
 target/riscv/helper.h                     |  3 ++
 target/riscv/insn16.decode                |  7 ++-
 target/riscv/csr.c                        | 36 ++++++++++++++-
 target/riscv/machine.c                    | 19 ++++++++
 target/riscv/zce_helper.c                 | 55 +++++++++++++++++++++++
 target/riscv/insn_trans/trans_rvzce.c.inc | 28 +++++++++++-
 target/riscv/meson.build                  |  3 +-
 9 files changed, 157 insertions(+), 5 deletions(-)
 create mode 100644 target/riscv/zce_helper.c

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index e5f7c860d1..8d66365f60 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -176,6 +176,8 @@ struct CPUArchState {
     /* 128-bit helpers upper part return value */
     target_ulong retxh;
 
+    target_ulong jvt;
+
 #ifdef CONFIG_USER_ONLY
     uint32_t elf_flags;
 #endif
@@ -620,6 +622,8 @@ void riscv_cpu_set_aia_ireg_rmw_fn(CPURISCVState *env, uint32_t priv,
                                                  target_ulong new_val,
                                                  target_ulong write_mask),
                                    void *rmw_fn_arg);
+
+RISCVException smstateen_acc_ok(CPURISCVState *env, int index, uint64_t bit);
 #endif
 void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv);
 
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index fca7ef0cef..a92313a06f 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -319,6 +319,7 @@
 #define SMSTATEEN_MAX_COUNT 4
 #define SMSTATEEN0_CS       (1ULL << 0)
 #define SMSTATEEN0_FCSR     (1ULL << 1)
+#define SMSTATEEN0_JVT      (1ULL << 2)
 #define SMSTATEEN0_HSCONTXT (1ULL << 57)
 #define SMSTATEEN0_IMSIC    (1ULL << 58)
 #define SMSTATEEN0_AIA      (1ULL << 59)
@@ -523,6 +524,9 @@
 /* Crypto Extension */
 #define CSR_SEED            0x015
 
+/* Zcmt Extension */
+#define CSR_JVT             0x017
+
 /* mstatus CSR bits */
 #define MSTATUS_UIE         0x00000001
 #define MSTATUS_SIE         0x00000002
@@ -898,4 +902,7 @@ typedef enum RISCVException {
 #define MHPMEVENT_IDX_MASK                 0xFFFFF
 #define MHPMEVENT_SSCOF_RESVD              16
 
+/* JVT CSR bits */
+#define JVT_MODE                           0x3F
+#define JVT_BASE                           (~0x3F)
 #endif
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 37b54e0991..1880e95c50 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1142,3 +1142,6 @@ DEF_HELPER_FLAGS_1(aes64im, TCG_CALL_NO_RWG_SE, tl, tl)
 
 DEF_HELPER_FLAGS_3(sm4ed, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
 DEF_HELPER_FLAGS_3(sm4ks, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
+
+/* Zce helper */
+DEF_HELPER_FLAGS_2(cm_jalt, TCG_CALL_NO_WG, tl, env, i32)
diff --git a/target/riscv/insn16.decode b/target/riscv/insn16.decode
index 55c9574299..b96c534e73 100644
--- a/target/riscv/insn16.decode
+++ b/target/riscv/insn16.decode
@@ -49,6 +49,7 @@
 %uimm_cl_h  5:1                      !function=ex_shift_1
 %spimm      2:2                      !function=ex_shift_4
 %urlist     4:4
+%index      2:8
 
 # Argument sets imported from insn32.decode:
 &empty                  !extern
@@ -63,6 +64,7 @@
 &r2_s      rs1 rs2      !extern
 
 &cmpp      urlist spimm
+&cmjt      index
 
 # Formats 16:
 @cr        ....  ..... .....  .. &r      rs2=%rs2_5       rs1=%rd     %rd
@@ -105,6 +107,7 @@
 @cs_h         ... . .. ... .. ... ..  &s  imm=%uimm_cl_h  rs1=%rs1_3 rs2=%rs2_3
 @cm_pp        ... ...  ........   ..  &cmpp  %urlist      %spimm
 @cm_mv        ... ...  ... .. ... ..  &r2_s  rs2=%r2s     rs1=%r1s
+@cm_jt        ... ...  ........   ..  &cmjt  %index
 
 # *** RV32/64C Standard Extension (Quadrant 0) ***
 {
@@ -185,7 +188,7 @@ slli              000 .  .....  ..... 10 @c_shift2
   sq              101  ... ... .. ... 10 @c_sqsp
   c_fsd           101   ......  ..... 10 @c_sdsp
 
-  # *** RV64 and RV32 Zcmp Extension ***
+  # *** RV64 and RV32 Zcmp/Zcmt Extension ***
   [
     cm_push         101  11000  .... .. 10 @cm_pp
     cm_pop          101  11010  .... .. 10 @cm_pp
@@ -193,6 +196,8 @@ slli              000 .  .....  ..... 10 @c_shift2
     cm_popretz      101  11100  .... .. 10 @cm_pp
     cm_mva01s       101  011 ... 11 ... 10 @cm_mv
     cm_mvsa01       101  011 ... 01 ... 10 @cm_mv
+
+    cm_jalt         101  000   ........ 10 @cm_jt
   ]
 }
 sw                110 .  .....  ..... 10 @c_swsp
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 8f4d5eb13f..777d7fbac0 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -43,8 +43,7 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops)
 
 /* Predicates */
 #if !defined(CONFIG_USER_ONLY)
-static RISCVException smstateen_acc_ok(CPURISCVState *env, int index,
-                                       uint64_t bit)
+RISCVException smstateen_acc_ok(CPURISCVState *env, int index, uint64_t bit)
 {
     bool virt = riscv_cpu_virt_enabled(env);
 
@@ -161,6 +160,22 @@ static RISCVException ctr32(CPURISCVState *env, int csrno)
     return ctr(env, csrno);
 }
 
+static RISCVException zcmt(CPURISCVState *env, int csrno)
+{
+    if (!riscv_cpu_cfg(env)->ext_zcmt) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+#if !defined(CONFIG_USER_ONLY)
+    RISCVException ret = smstateen_acc_ok(env, 0, SMSTATEEN0_JVT);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+#endif
+
+    return RISCV_EXCP_NONE;
+}
+
 #if !defined(CONFIG_USER_ONLY)
 static RISCVException mctr(CPURISCVState *env, int csrno)
 {
@@ -3958,6 +3973,20 @@ RISCVException riscv_csrrw_debug(CPURISCVState *env, int csrno,
     return ret;
 }
 
+static RISCVException read_jvt(CPURISCVState *env, int csrno,
+                               target_ulong *val)
+{
+    *val = env->jvt;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_jvt(CPURISCVState *env, int csrno,
+                                target_ulong val)
+{
+    env->jvt = val;
+    return RISCV_EXCP_NONE;
+}
+
 /* Control and Status Register function table */
 riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     /* User Floating-Point CSRs */
@@ -3988,6 +4017,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     /* Crypto Extension */
     [CSR_SEED] = { "seed", seed, NULL, NULL, rmw_seed },
 
+    /* Zcmt Extension */
+    [CSR_JVT] = {"jvt", zcmt, read_jvt, write_jvt},
+
 #if !defined(CONFIG_USER_ONLY)
     /* Machine Timers and Counters */
     [CSR_MCYCLE]    = { "mcycle",    any,   read_hpmcounter,
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 9c455931d8..27f430ad74 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -329,6 +329,24 @@ static const VMStateDescription vmstate_pmu_ctr_state = {
     }
 };
 
+static bool jvt_needed(void *opaque)
+{
+    RISCVCPU *cpu = opaque;
+
+    return cpu->cfg.ext_zcmt;
+}
+
+static const VMStateDescription vmstate_jvt = {
+    .name = "cpu/jvt",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = jvt_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINTTL(env.jvt, RISCVCPU),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 const VMStateDescription vmstate_riscv_cpu = {
     .name = "cpu",
     .version_id = 7,
@@ -395,6 +413,7 @@ const VMStateDescription vmstate_riscv_cpu = {
         &vmstate_envcfg,
         &vmstate_debug,
         &vmstate_smstateen,
+        &vmstate_jvt,
         NULL
     }
 };
diff --git a/target/riscv/zce_helper.c b/target/riscv/zce_helper.c
new file mode 100644
index 0000000000..b433bda16d
--- /dev/null
+++ b/target/riscv/zce_helper.c
@@ -0,0 +1,55 @@
+/*
+ * RISC-V Zcmt Extension Helper for QEMU.
+ *
+ * Copyright (c) 2021-2022 PLCT Lab
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "exec/exec-all.h"
+#include "exec/helper-proto.h"
+#include "exec/cpu_ldst.h"
+
+target_ulong HELPER(cm_jalt)(CPURISCVState *env, uint32_t index)
+{
+
+#if !defined(CONFIG_USER_ONLY)
+    RISCVException ret = smstateen_acc_ok(env, 0, SMSTATEEN0_JVT);
+    if (ret != RISCV_EXCP_NONE) {
+        riscv_raise_exception(env, ret, 0);
+    }
+#endif
+
+    target_ulong target;
+    target_ulong val = env->jvt;
+    int xlen = riscv_cpu_xlen(env);
+    uint8_t mode = get_field(val, JVT_MODE);
+    target_ulong base = val & JVT_BASE;
+    target_ulong t0;
+
+    if (mode != 0) {
+        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, 0);
+    }
+
+    if (xlen == 32) {
+        t0 = base + (index << 2);
+        target = cpu_ldl_code(env, t0);
+    } else {
+        t0 = base + (index << 3);
+        target = cpu_ldq_code(env, t0);
+    }
+
+    return target & ~0x1;
+}
diff --git a/target/riscv/insn_trans/trans_rvzce.c.inc b/target/riscv/insn_trans/trans_rvzce.c.inc
index a47959eb67..d75acbc4a6 100644
--- a/target/riscv/insn_trans/trans_rvzce.c.inc
+++ b/target/riscv/insn_trans/trans_rvzce.c.inc
@@ -1,5 +1,5 @@
 /*
- * RISC-V translation routines for the Zc[b,mp] Standard Extensions.
+ * RISC-V translation routines for the Zc[b,mp,mt] Standard Extensions.
  *
  * Copyright (c) 2021-2022 PLCT Lab
  *
@@ -26,6 +26,11 @@
         return false;            \
 } while (0)
 
+#define REQUIRE_ZCMT(ctx) do {   \
+    if (!ctx->cfg_ptr->ext_zcmt) \
+        return false;            \
+} while (0)
+
 static bool trans_c_zext_b(DisasContext *ctx, arg_c_zext_b *a)
 {
     REQUIRE_ZCB(ctx);
@@ -283,3 +288,24 @@ static bool trans_cm_mvsa01(DisasContext *ctx, arg_cm_mvsa01 *a)
 
     return true;
 }
+
+static bool trans_cm_jalt(DisasContext *ctx, arg_cm_jalt *a)
+{
+    REQUIRE_ZCMT(ctx);
+
+    /*
+     * Update pc to current for the non-unwinding exception
+     * that might come from cpu_ld*_code() in the helper.
+     */
+    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
+    gen_helper_cm_jalt(cpu_pc, cpu_env, tcg_constant_i32(a->index));
+
+    /* c.jt vs c.jalt depends on the index. */
+    if (a->index >= 32) {
+        gen_set_gpri(ctx, xRA, ctx->pc_succ_insn);
+    }
+
+    tcg_gen_lookup_and_goto_ptr();
+    ctx->base.is_jmp = DISAS_NORETURN;
+    return true;
+}
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index 5dee37a242..5b7f813a3e 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -19,7 +19,8 @@ riscv_ss.add(files(
   'bitmanip_helper.c',
   'translate.c',
   'm128_helper.c',
-  'crypto_helper.c'
+  'crypto_helper.c',
+  'zce_helper.c'
 ))
 riscv_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'), if_false: files('kvm-stub.c'))
 
-- 
2.40.0


