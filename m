Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8AD493482
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 06:29:17 +0100 (CET)
Received: from localhost ([::1]:40628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA3X2-0007Sq-MA
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 00:29:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nA3OH-0007s1-Em; Wed, 19 Jan 2022 00:20:14 -0500
Received: from out28-76.mail.aliyun.com ([115.124.28.76]:40933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nA3OE-00010J-2Z; Wed, 19 Jan 2022 00:20:12 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1085765|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_alarm|0.0613642-0.000762315-0.937873; FP=0|0|0|0|0|-1|-1|-1;
 HT=ay29a033018047212; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS; RN=9; RT=8; SR=0;
 TI=SMTPD_---.MfC0mtw_1642569602; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.MfC0mtw_1642569602)
 by smtp.aliyun-inc.com(10.147.43.95); Wed, 19 Jan 2022 13:20:02 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v7 03/22] target/riscv: Sign extend link reg for jal and jalr
Date: Wed, 19 Jan 2022 13:18:05 +0800
Message-Id: <20220119051824.17494-4-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220119051824.17494-1-zhiwei_liu@c-sky.com>
References: <20220119051824.17494-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.76; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-76.mail.aliyun.com
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

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvi.c.inc | 4 +---
 target/riscv/translate.c                | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index 3a0ae28fef..b9ba57f266 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -68,9 +68,7 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
         tcg_temp_free(t0);
     }
 
-    if (a->rd != 0) {
-        tcg_gen_movi_tl(cpu_gpr[a->rd], ctx->pc_succ_insn);
-    }
+    gen_set_gpri(ctx, a->rd, ctx->pc_succ_insn);
     tcg_gen_lookup_and_goto_ptr();
 
     if (misaligned) {
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 330904265e..30c0e28778 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -369,10 +369,8 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
             return;
         }
     }
-    if (rd != 0) {
-        tcg_gen_movi_tl(cpu_gpr[rd], ctx->pc_succ_insn);
-    }
 
+    gen_set_gpri(ctx, rd, ctx->pc_succ_insn);
     gen_goto_tb(ctx, 0, ctx->base.pc_next + imm); /* must use this for safety */
     ctx->base.is_jmp = DISAS_NORETURN;
 }
-- 
2.25.1


