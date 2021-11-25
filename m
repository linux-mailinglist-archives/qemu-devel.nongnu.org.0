Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B944445D5D1
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 08:56:32 +0100 (CET)
Received: from localhost ([::1]:40440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mq9cN-0000kW-Qs
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 02:56:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mq9O2-0002KI-6l; Thu, 25 Nov 2021 02:41:42 -0500
Received: from out28-4.mail.aliyun.com ([115.124.28.4]:57365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mq9Nz-00018l-U0; Thu, 25 Nov 2021 02:41:41 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.103833|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_alarm|0.0320985-0.000647087-0.967254; FP=0|0|0|0|0|-1|-1|-1;
 HT=ay29a033018047207; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS; RN=8; RT=7; SR=0;
 TI=SMTPD_---.LyzYpCp_1637826093; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LyzYpCp_1637826093)
 by smtp.aliyun-inc.com(10.147.41.187);
 Thu, 25 Nov 2021 15:41:34 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v5 03/22] target/riscv: Sign extend pc for different XLEN
Date: Thu, 25 Nov 2021 15:39:32 +0800
Message-Id: <20211125073951.57678-4-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211125073951.57678-1-zhiwei_liu@c-sky.com>
References: <20211125073951.57678-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.4; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-4.mail.aliyun.com
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

When pc is written, it is sign-extended to fill the widest supported XLEN.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 1d57bc97b5..a6a73ced9e 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -150,16 +150,24 @@ static void gen_check_nanbox_s(TCGv_i64 out, TCGv_i64 in)
     tcg_gen_movcond_i64(TCG_COND_GEU, out, in, t_max, in, t_nan);
 }
 
+static void gen_set_pc(DisasContext *ctx, target_ulong dest)
+{
+    if (get_xl(ctx) == MXL_RV32) {
+        dest = (int32_t)dest;
+    }
+    tcg_gen_movi_tl(cpu_pc, dest);
+}
+
 static void generate_exception(DisasContext *ctx, int excp)
 {
-    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
+    gen_set_pc(ctx, ctx->base.pc_next);
     gen_helper_raise_exception(cpu_env, tcg_constant_i32(excp));
     ctx->base.is_jmp = DISAS_NORETURN;
 }
 
 static void generate_exception_mtval(DisasContext *ctx, int excp)
 {
-    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
+    gen_set_pc(ctx, ctx->base.pc_next);
     tcg_gen_st_tl(cpu_pc, cpu_env, offsetof(CPURISCVState, badaddr));
     gen_helper_raise_exception(cpu_env, tcg_constant_i32(excp));
     ctx->base.is_jmp = DISAS_NORETURN;
@@ -179,10 +187,10 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
 {
     if (translator_use_goto_tb(&ctx->base, dest)) {
         tcg_gen_goto_tb(n);
-        tcg_gen_movi_tl(cpu_pc, dest);
+        gen_set_pc(ctx, dest);
         tcg_gen_exit_tb(ctx->base.tb, n);
     } else {
-        tcg_gen_movi_tl(cpu_pc, dest);
+        gen_set_pc(ctx, dest);
         tcg_gen_lookup_and_goto_ptr();
     }
 }
-- 
2.25.1


