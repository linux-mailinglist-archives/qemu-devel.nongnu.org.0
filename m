Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACF44952A2
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 17:52:43 +0100 (CET)
Received: from localhost ([::1]:43616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAafy-0006U5-9R
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 11:52:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nAWYF-0007qg-EH; Thu, 20 Jan 2022 07:28:27 -0500
Received: from out28-97.mail.aliyun.com ([115.124.28.97]:58851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nAWYB-0000DA-M5; Thu, 20 Jan 2022 07:28:27 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07450344|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.0061735-0.00216247-0.991664;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047204; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=9; RT=8; SR=0; TI=SMTPD_---.MfxfjN1_1642681687; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.MfxfjN1_1642681687)
 by smtp.aliyun-inc.com(10.147.43.230);
 Thu, 20 Jan 2022 20:28:07 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v8 12/23] target/riscv: Alloc tcg global for cur_pm[mask|base]
Date: Thu, 20 Jan 2022 20:20:39 +0800
Message-Id: <20220120122050.41546-13-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120122050.41546-1-zhiwei_liu@c-sky.com>
References: <20220120122050.41546-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.97; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-97.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

Replace the array of pm_mask/pm_base with scalar variables.
Remove the cached array value in DisasContext.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c | 32 ++++++++------------------------
 1 file changed, 8 insertions(+), 24 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 2a88bd99dc..43e2ec6dce 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -38,8 +38,8 @@ static TCGv_i64 cpu_fpr[32]; /* assume F and D extensions */
 static TCGv load_res;
 static TCGv load_val;
 /* globals for PM CSRs */
-static TCGv pm_mask[4];
-static TCGv pm_base[4];
+static TCGv pm_mask;
+static TCGv pm_base;
 
 #include "exec/gen-icount.h"
 
@@ -109,8 +109,6 @@ typedef struct DisasContext {
     TCGv temp[4];
     /* PointerMasking extension */
     bool pm_enabled;
-    TCGv pm_mask;
-    TCGv pm_base;
 } DisasContext;
 
 static inline bool has_ext(DisasContext *ctx, uint32_t ext)
@@ -403,8 +401,8 @@ static TCGv gen_pm_adjust_address(DisasContext *s, TCGv src)
         return src;
     } else {
         temp = temp_new(s);
-        tcg_gen_andc_tl(temp, src, s->pm_mask);
-        tcg_gen_or_tl(temp, temp, s->pm_base);
+        tcg_gen_andc_tl(temp, src, pm_mask);
+        tcg_gen_or_tl(temp, temp, pm_base);
         return temp;
     }
 }
@@ -929,10 +927,6 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->ntemp = 0;
     memset(ctx->temp, 0, sizeof(ctx->temp));
     ctx->pm_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_ENABLED);
-    int priv = tb_flags & TB_FLAGS_PRIV_MMU_MASK;
-    ctx->pm_mask = pm_mask[priv];
-    ctx->pm_base = pm_base[priv];
-
     ctx->zero = tcg_constant_tl(0);
 }
 
@@ -1050,19 +1044,9 @@ void riscv_translate_init(void)
                              "load_res");
     load_val = tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, load_val),
                              "load_val");
-#ifndef CONFIG_USER_ONLY
     /* Assign PM CSRs to tcg globals */
-    pm_mask[PRV_U] =
-      tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, upmmask), "upmmask");
-    pm_base[PRV_U] =
-      tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, upmbase), "upmbase");
-    pm_mask[PRV_S] =
-      tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, spmmask), "spmmask");
-    pm_base[PRV_S] =
-      tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, spmbase), "spmbase");
-    pm_mask[PRV_M] =
-      tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, mpmmask), "mpmmask");
-    pm_base[PRV_M] =
-      tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, mpmbase), "mpmbase");
-#endif
+    pm_mask = tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, cur_pmmask),
+                                 "pmmask");
+    pm_base = tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, cur_pmbase),
+                                 "pmbase");
 }
-- 
2.25.1


