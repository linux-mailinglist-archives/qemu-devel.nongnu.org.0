Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA55245D5FC
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 09:11:16 +0100 (CET)
Received: from localhost ([::1]:40494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mq9qd-0003yq-TT
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 03:11:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mq9S9-0004uk-0s; Thu, 25 Nov 2021 02:45:57 -0500
Received: from out28-195.mail.aliyun.com ([115.124.28.195]:41844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mq9S5-0002LK-KS; Thu, 25 Nov 2021 02:45:56 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07449317|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.0061735-0.00216247-0.991664;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047193; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=8; RT=7; SR=0; TI=SMTPD_---.LyytwBx_1637826346; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LyytwBx_1637826346)
 by smtp.aliyun-inc.com(10.147.42.198);
 Thu, 25 Nov 2021 15:45:47 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v5 11/22] target/riscv: Alloc tcg global for cur_pm[mask|base]
Date: Thu, 25 Nov 2021 15:39:40 +0800
Message-Id: <20211125073951.57678-12-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211125073951.57678-1-zhiwei_liu@c-sky.com>
References: <20211125073951.57678-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.195; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-195.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Alistair Francis <alistair.francis@wdc.com>, bin.meng@windriver.com,
 richard.henderson@linaro.org, palmer@dabbelt.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
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
index a6a73ced9e..6cb74c6355 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -37,8 +37,8 @@ static TCGv_i64 cpu_fpr[32]; /* assume F and D extensions */
 static TCGv load_res;
 static TCGv load_val;
 /* globals for PM CSRs */
-static TCGv pm_mask[4];
-static TCGv pm_base[4];
+static TCGv pm_mask;
+static TCGv pm_base;
 
 #include "exec/gen-icount.h"
 
@@ -88,8 +88,6 @@ typedef struct DisasContext {
     TCGv temp[4];
     /* PointerMasking extension */
     bool pm_enabled;
-    TCGv pm_mask;
-    TCGv pm_base;
 } DisasContext;
 
 static inline bool has_ext(DisasContext *ctx, uint32_t ext)
@@ -297,8 +295,8 @@ static TCGv gen_pm_adjust_address(DisasContext *s, TCGv src)
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
@@ -647,10 +645,6 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->ntemp = 0;
     memset(ctx->temp, 0, sizeof(ctx->temp));
     ctx->pm_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_ENABLED);
-    int priv = tb_flags & TB_FLAGS_PRIV_MMU_MASK;
-    ctx->pm_mask = pm_mask[priv];
-    ctx->pm_base = pm_base[priv];
-
     ctx->zero = tcg_constant_tl(0);
 }
 
@@ -763,19 +757,9 @@ void riscv_translate_init(void)
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


