Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2164B53E4DC
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 15:49:20 +0200 (CEST)
Received: from localhost ([::1]:34010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyD6d-0006v3-8e
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 09:49:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nyCCL-0007s7-QL
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 08:51:10 -0400
Received: from mail.loongson.cn ([114.242.206.163]:41760 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nyCCG-0005tO-GV
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 08:51:09 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Cxr+Z29p1ishIXAA--.3714S31; 
 Mon, 06 Jun 2022 20:44:11 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, maobibo@loongson.cn
Subject: [PATCH v7 29/43] target/loongarch: Add timer related instructions
 support.
Date: Mon,  6 Jun 2022 20:43:19 +0800
Message-Id: <20220606124333.2060567-30-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220606124333.2060567-1-yangxiaojuan@loongson.cn>
References: <20220606124333.2060567-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Cxr+Z29p1ishIXAA--.3714S31
X-Coremail-Antispam: 1UD129KBjvJXoWxGry8AryfXFy5Kr43Aw4UXFb_yoWrtr4fpr
 429ryUKrW8JrZxZ3Z3t3s8Xr15Xw4xCF42qa93t3s5CF47X3WkZr18t3srKF4UJw4DXryj
 qF1kA34UKFWxXaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This includes:
-RDTIME{L/H}.W
-RDTIME.D

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/disas.c                      |  3 ++
 target/loongarch/helper.h                     |  2 ++
 target/loongarch/insn_trans/trans_extra.c.inc | 33 +++++++++++++++++++
 target/loongarch/insns.decode                 |  3 ++
 target/loongarch/op_helper.c                  | 13 ++++++++
 target/loongarch/translate.c                  |  2 ++
 6 files changed, 56 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 9d790b172c..858dfcc53a 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -352,6 +352,9 @@ INSN(bitrev_w,     rr)
 INSN(bitrev_d,     rr)
 INSN(ext_w_h,      rr)
 INSN(ext_w_b,      rr)
+INSN(rdtimel_w,    rr)
+INSN(rdtimeh_w,    rr)
+INSN(rdtime_d,     rr)
 INSN(cpucfg,       rr)
 INSN(asrtle_d,     rr_jk)
 INSN(asrtgt_d,     rr_jk)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 626fc32e1e..85c11a60d4 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -93,6 +93,8 @@ DEF_HELPER_2(frint_d, i64, env, i64)
 
 DEF_HELPER_FLAGS_2(set_rounding_mode, TCG_CALL_NO_RWG, void, env, i32)
 
+DEF_HELPER_1(rdtime_d, i64, env)
+
 /* CSRs helper */
 DEF_HELPER_1(csrrd_pgd, i64, env)
 DEF_HELPER_1(csrrd_tval, i64, env)
diff --git a/target/loongarch/insn_trans/trans_extra.c.inc b/target/loongarch/insn_trans/trans_extra.c.inc
index 549f75a867..ad713cd61e 100644
--- a/target/loongarch/insn_trans/trans_extra.c.inc
+++ b/target/loongarch/insn_trans/trans_extra.c.inc
@@ -33,6 +33,39 @@ static bool trans_asrtgt_d(DisasContext *ctx, arg_asrtgt_d * a)
     return true;
 }
 
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
+
+static bool trans_rdtimel_w(DisasContext *ctx, arg_rdtimel_w *a)
+{
+    return gen_rdtime(ctx, a, 1, 0);
+}
+
+static bool trans_rdtimeh_w(DisasContext *ctx, arg_rdtimeh_w *a)
+{
+    return gen_rdtime(ctx, a, 1, 1);
+}
+
+static bool trans_rdtime_d(DisasContext *ctx, arg_rdtime_d *a)
+{
+    return gen_rdtime(ctx, a, 0, 0);
+}
+
 static bool trans_cpucfg(DisasContext *ctx, arg_cpucfg *a)
 {
     TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index ebd3d505fb..3fdc6e148c 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -309,6 +309,9 @@ break           0000 00000010 10100 ...............      @i15
 syscall         0000 00000010 10110 ...............      @i15
 asrtle_d        0000 00000000 00010 ..... ..... 00000    @rr_jk
 asrtgt_d        0000 00000000 00011 ..... ..... 00000    @rr_jk
+rdtimel_w       0000 00000000 00000 11000 ..... .....    @rr
+rdtimeh_w       0000 00000000 00000 11001 ..... .....    @rr
+rdtime_d        0000 00000000 00000 11010 ..... .....    @rr
 cpucfg          0000 00000000 00000 11011 ..... .....    @rr
 
 #
diff --git a/target/loongarch/op_helper.c b/target/loongarch/op_helper.c
index a9ba72d5b2..d87049851f 100644
--- a/target/loongarch/op_helper.c
+++ b/target/loongarch/op_helper.c
@@ -84,6 +84,19 @@ target_ulong helper_cpucfg(CPULoongArchState *env, target_ulong rj)
     return rj > 21 ? 0 : env->cpucfg[rj];
 }
 
+uint64_t helper_rdtime_d(CPULoongArchState *env)
+{
+    uint64_t plv;
+    LoongArchCPU *cpu = env_archcpu(env);
+
+    plv = FIELD_EX64(env->CSR_CRMD, CSR_CRMD, PLV);
+    if (extract64(env->CSR_MISC, R_CSR_MISC_DRDTL_SHIFT + plv, 1)) {
+        do_raise_exception(env, EXCCODE_IPE, GETPC());
+    }
+
+    return cpu_loongarch_get_constant_timer_counter(cpu);
+}
+
 void helper_ertn(CPULoongArchState *env)
 {
     uint64_t csr_pplv, csr_pie;
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index 0f098924a3..c9afd11420 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -25,6 +25,8 @@ static TCGv cpu_lladdr, cpu_llval;
 TCGv_i32 cpu_fcsr0;
 TCGv_i64 cpu_fpr[32];
 
+#include "exec/gen-icount.h"
+
 #define DISAS_STOP        DISAS_TARGET_0
 #define DISAS_EXIT        DISAS_TARGET_1
 #define DISAS_EXIT_UPDATE DISAS_TARGET_2
-- 
2.31.1


