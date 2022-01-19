Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1F04934A6
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 06:51:33 +0100 (CET)
Received: from localhost ([::1]:43808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA3sa-00042O-CY
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 00:51:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nA3UH-0005KQ-Nw; Wed, 19 Jan 2022 00:26:29 -0500
Received: from out28-172.mail.aliyun.com ([115.124.28.172]:41489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nA3UE-0001oi-Dx; Wed, 19 Jan 2022 00:26:25 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07438248|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.00462344-3.32179e-05-0.995343;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047188; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=9; RT=8; SR=0; TI=SMTPD_---.MfCdxuE_1642569938; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.MfCdxuE_1642569938)
 by smtp.aliyun-inc.com(10.147.42.241);
 Wed, 19 Jan 2022 13:25:38 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v7 14/22] target/riscv: Split pm_enabled into mask and base
Date: Wed, 19 Jan 2022 13:18:16 +0800
Message-Id: <20220119051824.17494-15-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220119051824.17494-1-zhiwei_liu@c-sky.com>
References: <20220119051824.17494-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.172; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-172.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: guoren@linux.alibaba.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, palmer@dabbelt.com,
 Alistair Francis <alistair.francis@wdc.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use cached cur_pmmask and cur_pmbase to infer the
current PM mode.

This may decrease the TCG IR by one when pm_enabled
is true and pm_base_enabled is false.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h        |  3 ++-
 target/riscv/cpu_helper.c | 24 ++++++------------------
 target/riscv/translate.c  | 12 ++++++++----
 3 files changed, 16 insertions(+), 23 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 6fe842edfd..89621e1996 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -448,7 +448,8 @@ FIELD(TB_FLAGS, MSTATUS_HS_VS, 18, 2)
 /* The combination of MXL/SXL/UXL that applies to the current cpu mode. */
 FIELD(TB_FLAGS, XL, 20, 2)
 /* If PointerMasking should be applied */
-FIELD(TB_FLAGS, PM_ENABLED, 22, 1)
+FIELD(TB_FLAGS, PM_MASK_ENABLED, 22, 1)
+FIELD(TB_FLAGS, PM_BASE_ENABLED, 23, 1)
 
 #ifdef TARGET_RISCV32
 #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index b239d721f4..502aee84ab 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -97,27 +97,15 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
         flags = FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_VS,
                            get_field(env->mstatus_hs, MSTATUS_VS));
     }
-    if (riscv_has_ext(env, RVJ)) {
-        int priv = flags & TB_FLAGS_PRIV_MMU_MASK;
-        bool pm_enabled = false;
-        switch (priv) {
-        case PRV_U:
-            pm_enabled = env->mmte & U_PM_ENABLE;
-            break;
-        case PRV_S:
-            pm_enabled = env->mmte & S_PM_ENABLE;
-            break;
-        case PRV_M:
-            pm_enabled = env->mmte & M_PM_ENABLE;
-            break;
-        default:
-            g_assert_not_reached();
-        }
-        flags = FIELD_DP32(flags, TB_FLAGS, PM_ENABLED, pm_enabled);
-    }
 #endif
 
     flags = FIELD_DP32(flags, TB_FLAGS, XL, env->xl);
+    if (env->cur_pmmask < (env->xl == MXL_RV32 ? UINT32_MAX : UINT64_MAX)) {
+        flags = FIELD_DP32(flags, TB_FLAGS, PM_MASK_ENABLED, 1);
+    }
+    if (env->cur_pmbase != 0) {
+        flags = FIELD_DP32(flags, TB_FLAGS, PM_BASE_ENABLED, 1);
+    }
 
     *pflags = flags;
 }
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 33564d059d..f0bbe80875 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -108,7 +108,8 @@ typedef struct DisasContext {
     /* Space for 3 operands plus 1 extra for address computation. */
     TCGv temp[4];
     /* PointerMasking extension */
-    bool pm_enabled;
+    bool pm_mask_enabled;
+    bool pm_base_enabled;
 } DisasContext;
 
 static inline bool has_ext(DisasContext *ctx, uint32_t ext)
@@ -397,12 +398,14 @@ static TCGv get_address(DisasContext *ctx, int rs1, int imm)
     TCGv src1 = get_gpr(ctx, rs1, EXT_NONE);
 
     tcg_gen_addi_tl(addr, src1, imm);
-    if (ctx->pm_enabled) {
+    if (ctx->pm_mask_enabled) {
         tcg_gen_and_tl(addr, addr, pm_mask);
-        tcg_gen_or_tl(addr, addr, pm_base);
     } else if (get_xl(ctx) == MXL_RV32) {
         tcg_gen_ext32u_tl(addr, addr);
     }
+    if (ctx->pm_base_enabled) {
+        tcg_gen_or_tl(addr, addr, pm_base);
+    }
     return addr;
 }
 
@@ -925,7 +928,8 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->cs = cs;
     ctx->ntemp = 0;
     memset(ctx->temp, 0, sizeof(ctx->temp));
-    ctx->pm_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_ENABLED);
+    ctx->pm_mask_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_MASK_ENABLED);
+    ctx->pm_base_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_BASE_ENABLED);
     ctx->zero = tcg_constant_tl(0);
 }
 
-- 
2.25.1


