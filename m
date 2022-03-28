Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA03E4E97C6
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 15:16:21 +0200 (CEST)
Received: from localhost ([::1]:41266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYpEK-0001kL-VP
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 09:16:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nYoxE-00034H-B1
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 08:58:41 -0400
Received: from mail.loongson.cn ([114.242.206.163]:34918 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nYoxB-0001RY-6C
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 08:58:39 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxbxPOsEFih08RAA--.17957S14; 
 Mon, 28 Mar 2022 20:58:24 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v7 12/29] target/loongarch: Add timer related instructions
 support.
Date: Mon, 28 Mar 2022 20:57:32 +0800
Message-Id: <20220328125749.2918087-13-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220328125749.2918087-1-yangxiaojuan@loongson.cn>
References: <20220328125749.2918087-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxbxPOsEFih08RAA--.17957S14
X-Coremail-Antispam: 1UD129KBjvJXoWxGry8KFyUArW5Zr13tFyDAwb_yoW5tr1Dpa
 yIkrW5KFW8tFZxXay8J3WYgr98Xa1xKrW2qa9av395CF43XwsrZr10g3sI9Fy5XayDWry2
 v3Z5Aw17uF47X3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Cc: mark.cave-ayland@ilande.co.uk, richard.henderson@linaro.org,
 Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This includes:
-RDTIME{L/H}.W
-RDTIME.D

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/helper.h                     |  1 +
 target/loongarch/insn_trans/trans_extra.c.inc | 32 +++++++++++++++++++
 target/loongarch/op_helper.c                  |  6 ++++
 target/loongarch/translate.c                  |  2 ++
 4 files changed, 41 insertions(+)

diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index c916f2650b..035bd141ed 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -116,4 +116,5 @@ DEF_HELPER_4(lddir, tl, env, tl, tl, i32)
 DEF_HELPER_4(ldpte, void, env, tl, tl, i32)
 DEF_HELPER_1(ertn, void, env)
 DEF_HELPER_1(idle, void, env)
+DEF_HELPER_1(rdtime_d, i64, env)
 #endif /* !CONFIG_USER_ONLY */
diff --git a/target/loongarch/insn_trans/trans_extra.c.inc b/target/loongarch/insn_trans/trans_extra.c.inc
index 2ce95d3382..8d3425ba61 100644
--- a/target/loongarch/insn_trans/trans_extra.c.inc
+++ b/target/loongarch/insn_trans/trans_extra.c.inc
@@ -33,22 +33,54 @@ static bool trans_asrtgt_d(DisasContext *ctx, arg_asrtgt_d * a)
     return true;
 }
 
+#ifndef CONFIG_USER_ONLY
+static bool gen_rdtime(DisasContext *ctx, arg_rr *a,
+                       bool word, bool high)
+{
+    TCGv dst1 = gpr_dst(ctx, a->rd, EXT_NONE);
+    TCGv dst2 = gpr_dst(ctx, a->rj, EXT_NONE);
+
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+    gen_helper_rdtime_d(dst1, cpu_env);
+    if (word) {
+        tcg_gen_sextract_tl(dst1, dst1, high ? 32 : 0, 32);
+    }
+    tcg_gen_ld_i64(dst2, cpu_env, offsetof(CPULoongArchState, CSR_TID));
+
+    return true;
+}
+#endif
+
 static bool trans_rdtimel_w(DisasContext *ctx, arg_rdtimel_w *a)
 {
+#ifdef CONFIG_USER_ONLY
     tcg_gen_movi_tl(cpu_gpr[a->rd], 0);
     return true;
+#else
+    return gen_rdtime(ctx, a, 1, 0);
+#endif
 }
 
 static bool trans_rdtimeh_w(DisasContext *ctx, arg_rdtimeh_w *a)
 {
+#ifdef CONFIG_USER_ONLY
     tcg_gen_movi_tl(cpu_gpr[a->rd], 0);
     return true;
+#else
+    return gen_rdtime(ctx, a, 1, 1);
+#endif
 }
 
 static bool trans_rdtime_d(DisasContext *ctx, arg_rdtime_d *a)
 {
+#ifdef CONFIG_USER_ONLY
     tcg_gen_movi_tl(cpu_gpr[a->rd], 0);
     return true;
+#else
+    return gen_rdtime(ctx, a, 0, 0);
+#endif
 }
 
 static bool trans_cpucfg(DisasContext *ctx, arg_cpucfg *a)
diff --git a/target/loongarch/op_helper.c b/target/loongarch/op_helper.c
index 84175fbdcd..7330014308 100644
--- a/target/loongarch/op_helper.c
+++ b/target/loongarch/op_helper.c
@@ -128,4 +128,10 @@ void helper_idle(CPULoongArchState *env)
     cpu_reset_interrupt(cs, CPU_INTERRUPT_WAKE);
     do_raise_exception(env, EXCP_HLT, 0);
 }
+
+uint64_t helper_rdtime_d(CPULoongArchState *env)
+{
+     LoongArchCPU *cpu = LOONGARCH_CPU(env_cpu(env));
+     return cpu_loongarch_get_constant_timer_counter(cpu);
+}
 #endif /* !CONFIG_USER_ONLY */
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index c1cac2f006..9ce003980d 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -25,6 +25,8 @@ static TCGv cpu_lladdr, cpu_llval;
 TCGv_i32 cpu_fcsr0;
 TCGv_i64 cpu_fpr[32];
 
+#include "exec/gen-icount.h"
+
 #define DISAS_STOP       DISAS_TARGET_0
 #define DISAS_EXIT       DISAS_TARGET_1
 
-- 
2.31.1


