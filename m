Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DED47321B
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 17:44:06 +0100 (CET)
Received: from localhost ([::1]:60476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwoQn-00042T-Cm
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 11:44:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mwoM4-0003CW-1q; Mon, 13 Dec 2021 11:39:12 -0500
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:46710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mwoM1-0003aY-PI; Mon, 13 Dec 2021 11:39:11 -0500
Received: from mailhost.u-ga.fr (mailhost1.u-ga.fr [152.77.1.10])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id D3A684026B;
 Mon, 13 Dec 2021 17:38:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1639413521;
 bh=tMQ5RfQwsSqD/plFoCev/nkFbzHlmq7WR5aXLjaF/jI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Hk/vbSLjeZasVpwyVh1OVekXvjpZS5Rak9N3Z804iU0xBYFH4vdJvJ90xEW0vjbV9
 S1I6/M9Q0yXh1ygF+CsO3Qop4LT3ViVRBkwPjU6CVxQMLEVSPoQ4zkwFoBiYLOHCE/
 7gPDWDY3MVtJV0J/95QzMA5ABlfxp9V+pZNwfZGd9tWcAxk/eZWQhQmB3hntp+8G11
 TFzO+w307ch9AhcyH6kUCpY4oBJmYxGAVwsUNdVfcVlcnqn2EB+jCAKmBGhZUA+jRX
 bQlCxyFqnCMoW/jIhJqJiovRMiUEdPFPe0iRuSO7Kf9nUkfwXcgZ3YsL0OGYgSsa7M
 nUs4VkUKOsvVw==
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id BE44760067;
 Mon, 13 Dec 2021 17:38:41 +0100 (CET)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 8EF69140080;
 Mon, 13 Dec 2021 17:38:41 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v7 11/18] target/riscv: support for 128-bit U-type instructions
Date: Mon, 13 Dec 2021 17:38:27 +0100
Message-Id: <20211213163834.170504-12-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211213163834.170504-1-frederic.petrot@univ-grenoble-alpes.fr>
References: <20211213163834.170504-1-frederic.petrot@univ-grenoble-alpes.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (42)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 152.77.18.2
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: bin.meng@windriver.com, richard.henderson@linaro.org,
 alistair.francis@wdc.com, fabien.portas@grenoble-inp.org, palmer@dabbelt.com,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Adding the 128-bit version of lui and auipc, and introducing to that end
a "set register with immediat" function to handle extension on 128 bits.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c                | 21 +++++++++++++++++++++
 target/riscv/insn_trans/trans_rvi.c.inc |  8 ++++----
 2 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 4790dc0cb4..0b87312dda 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -289,6 +289,27 @@ static void gen_set_gpr(DisasContext *ctx, int reg_num, TCGv t)
     }
 }
 
+static void gen_set_gpri(DisasContext *ctx, int reg_num, target_long imm)
+{
+    if (reg_num != 0) {
+        switch (get_ol(ctx)) {
+        case MXL_RV32:
+            tcg_gen_movi_tl(cpu_gpr[reg_num], (int32_t)imm);
+            break;
+        case MXL_RV64:
+        case MXL_RV128:
+            tcg_gen_movi_tl(cpu_gpr[reg_num], imm);
+            break;
+        default:
+            g_assert_not_reached();
+        }
+
+        if (get_xl_max(ctx) == MXL_RV128) {
+            tcg_gen_movi_tl(cpu_gprh[reg_num], -(imm < 0));
+        }
+    }
+}
+
 static void gen_set_gpr128(DisasContext *ctx, int reg_num, TCGv rl, TCGv rh)
 {
     assert(get_ol(ctx) == MXL_RV128);
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index e572976e88..6113acc669 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -26,14 +26,14 @@ static bool trans_illegal(DisasContext *ctx, arg_empty *a)
 
 static bool trans_c64_illegal(DisasContext *ctx, arg_empty *a)
 {
-     REQUIRE_64BIT(ctx);
-     return trans_illegal(ctx, a);
+    REQUIRE_64_OR_128BIT(ctx);
+    return trans_illegal(ctx, a);
 }
 
 static bool trans_lui(DisasContext *ctx, arg_lui *a)
 {
     if (a->rd != 0) {
-        tcg_gen_movi_tl(cpu_gpr[a->rd], a->imm);
+        gen_set_gpri(ctx, a->rd, a->imm);
     }
     return true;
 }
@@ -41,7 +41,7 @@ static bool trans_lui(DisasContext *ctx, arg_lui *a)
 static bool trans_auipc(DisasContext *ctx, arg_auipc *a)
 {
     if (a->rd != 0) {
-        tcg_gen_movi_tl(cpu_gpr[a->rd], a->imm + ctx->base.pc_next);
+        gen_set_gpri(ctx, a->rd, a->imm + ctx->base.pc_next);
     }
     return true;
 }
-- 
2.34.1


