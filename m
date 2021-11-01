Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A484419C2
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 11:21:13 +0100 (CET)
Received: from localhost ([::1]:47076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhURE-0004VF-9V
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 06:21:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mhU8i-0001em-Ry; Mon, 01 Nov 2021 06:02:04 -0400
Received: from out28-221.mail.aliyun.com ([115.124.28.221]:51224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mhU8b-0001VG-Eb; Mon, 01 Nov 2021 06:02:04 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07459467|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.0131972-0.000673861-0.986129;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047213; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.LlcGtUT_1635760905; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LlcGtUT_1635760905)
 by smtp.aliyun-inc.com(10.147.43.230);
 Mon, 01 Nov 2021 18:01:50 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH 12/13] target/riscv: Don't save pc when exception return
Date: Mon,  1 Nov 2021 18:01:42 +0800
Message-Id: <20211101100143.44356-13-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101100143.44356-1-zhiwei_liu@c-sky.com>
References: <20211101100143.44356-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.221; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-221.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: palmer@dabbelt.com, richard.henderson@linaro.org, bin.meng@windriver.com,
 Alistair.Francis@wdc.com, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As pc will be written by the xepc in exception return, just ignore
pc in translation.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/helper.h                          | 4 ++--
 target/riscv/insn_trans/trans_privileged.c.inc | 7 ++-----
 target/riscv/op_helper.c                       | 4 ++--
 3 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 9b379d7232..34c57a6083 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -67,8 +67,8 @@ DEF_HELPER_2(csrr, tl, env, int)
 DEF_HELPER_3(csrw, void, env, int, tl)
 DEF_HELPER_4(csrrw, tl, env, int, tl, tl)
 #ifndef CONFIG_USER_ONLY
-DEF_HELPER_2(sret, tl, env, tl)
-DEF_HELPER_2(mret, tl, env, tl)
+DEF_HELPER_1(sret, tl, env)
+DEF_HELPER_1(mret, tl, env)
 DEF_HELPER_1(wfi, void, env)
 DEF_HELPER_1(tlb_flush, void, env)
 DEF_HELPER_1(switch_context_xl, void, env)
diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/riscv/insn_trans/trans_privileged.c.inc
index 6e39632f83..cf6dc98888 100644
--- a/target/riscv/insn_trans/trans_privileged.c.inc
+++ b/target/riscv/insn_trans/trans_privileged.c.inc
@@ -74,10 +74,8 @@ static bool trans_uret(DisasContext *ctx, arg_uret *a)
 static bool trans_sret(DisasContext *ctx, arg_sret *a)
 {
 #ifndef CONFIG_USER_ONLY
-    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
-
     if (has_ext(ctx, RVS)) {
-        gen_helper_sret(cpu_pc, cpu_env, cpu_pc);
+        gen_helper_sret(cpu_pc, cpu_env);
         gen_helper_switch_context_xl(cpu_env);
         tcg_gen_exit_tb(NULL, 0); /* no chaining */
         ctx->base.is_jmp = DISAS_NORETURN;
@@ -93,8 +91,7 @@ static bool trans_sret(DisasContext *ctx, arg_sret *a)
 static bool trans_mret(DisasContext *ctx, arg_mret *a)
 {
 #ifndef CONFIG_USER_ONLY
-    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
-    gen_helper_mret(cpu_pc, cpu_env, cpu_pc);
+    gen_helper_mret(cpu_pc, cpu_env);
     gen_helper_switch_context_xl(cpu_env);
     tcg_gen_exit_tb(NULL, 0); /* no chaining */
     ctx->base.is_jmp = DISAS_NORETURN;
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 20cf8ad883..3ce2767ccf 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -97,7 +97,7 @@ void helper_switch_context_xl(CPURISCVState *env)
     }
 }
 
-target_ulong helper_sret(CPURISCVState *env, target_ulong cpu_pc_deb)
+target_ulong helper_sret(CPURISCVState *env)
 {
     uint64_t mstatus;
     target_ulong prev_priv, prev_virt;
@@ -158,7 +158,7 @@ target_ulong helper_sret(CPURISCVState *env, target_ulong cpu_pc_deb)
     return retpc;
 }
 
-target_ulong helper_mret(CPURISCVState *env, target_ulong cpu_pc_deb)
+target_ulong helper_mret(CPURISCVState *env)
 {
     if (!(env->priv >= PRV_M)) {
         riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
-- 
2.25.1


