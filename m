Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8BB2DB8B9
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 03:04:39 +0100 (CET)
Received: from localhost ([::1]:33688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpMBC-0007vj-DV
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 21:04:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kpM8o-0006BV-HS
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 21:02:10 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:43282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kpM8m-0000so-Lh
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 21:02:10 -0500
Received: by mail-pl1-x633.google.com with SMTP id x12so11582800plr.10
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 18:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=h0SIXfhlN2izVzAWt/OYZgz+lxvHF+H1Hc1qhXOYZL4=;
 b=XULSBSByb9MWU7NPkIRa8aE/6bmu9Xfo9IVmHPSzz+HE0QpEgLnBDH+ZMt3tXvIko5
 ID8fe6AyKWuUCsip8yCwXf+VsIPdN1yG6tBXoaz8+AAkh89DK8GSQJLmRuezLYt8NFe7
 7FSaiWMGHYed6d9sfHqiFTXidLJ3oaW56Vy3RudpQbd3tsgLwUVE6C9ngwnW89Olh8Av
 gNvXCP/0eBa1ANwgr2GWktLDnwGPuHjmW9BIiqnQzFJImV15xsI0lW4BqJCOSR8BK4+Q
 n0Y4vHr2D7FX77bgIuhsqAZeEq8Yg42AN/U3zONfop/l1WPczWTybZzRKIe6Ce8QI2KE
 RTXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=h0SIXfhlN2izVzAWt/OYZgz+lxvHF+H1Hc1qhXOYZL4=;
 b=UU8djno8e0+LQGT/0MZsziQch9Sv6Arv4eslHlR+qnfLDP3ZLjMk8Tw4OSOJb1LU1N
 Eyb8/iXAWsSE69xITz0TWZM0ii0ffZIubexHxdLQ1ngt6qswkpk7D66/IHoGZ89TuNVF
 0oee1tD0LiOSauscuD4CDct6zWsUvvWkk6k/Er/5SGIqT7rpLpP7Sge+m72KS072sPGQ
 0Gz/4FXpNwAfynCqzhSR3KKRkazz34DDRLREOwVUFPR2tNsl33by6ofyHUAuQ0ORAmnN
 ZWKrmjmnVjQfAyQ4SovjsUbKn3nfc9rA6ztIhga+BWEQfAjSuYDtpi5KkomiokD22vzn
 uWgg==
X-Gm-Message-State: AOAM530LbbehsXZ+mzIR4OmDJlQJajUgKHx0DaHddGoZ1f7/cST9wrOd
 EaiRzZlJFuXmTahFV7dx6Wn0Nt4v01GipMWo/EA=
X-Google-Smtp-Source: ABdhPJzHrTSfNCMaKL/z7JQE9MnQNPkxun7jdtCW8Ni/4ezX6t03OlpEfaf8jr2bK5zzkpP8JWkpQA==
X-Received: by 2002:a17:902:c104:b029:da:5206:8b9b with SMTP id
 4-20020a170902c104b02900da52068b9bmr20289983pli.46.1608084125958; 
 Tue, 15 Dec 2020 18:02:05 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id a13sm289150pfr.59.2020.12.15.18.02.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 18:02:05 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC v2 02/15] target/riscv: rvb: count leading/trailing zeros
Date: Wed, 16 Dec 2020 10:01:27 +0800
Message-Id: <20201216020150.3157-3-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201216020150.3157-1-frank.chang@sifive.com>
References: <20201216020150.3157-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Frank Chang <frank.chang@sifive.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32-64.decode           |  4 +++
 target/riscv/insn32.decode              |  7 +++-
 target/riscv/insn_trans/trans_rvb.c.inc | 47 +++++++++++++++++++++++++
 target/riscv/translate.c                | 42 ++++++++++++++++++++++
 4 files changed, 99 insertions(+), 1 deletion(-)
 create mode 100644 target/riscv/insn_trans/trans_rvb.c.inc

diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index 8157dee8b7c..f4c42720fc7 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -86,3 +86,7 @@ fmv_d_x    1111001  00000 ..... 000 ..... 1010011 @r2
 hlv_wu    0110100  00001   ..... 100 ..... 1110011 @r2
 hlv_d     0110110  00000   ..... 100 ..... 1110011 @r2
 hsv_d     0110111  .....   ..... 100 00000 1110011 @r2_s
+
+# *** RV64B Standard Extension (in addition to RV32B) ***
+clzw       0110000 00000 ..... 001 ..... 0011011 @r2
+ctzw       0110000 00001 ..... 001 ..... 0011011 @r2
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 3823b3ea800..8fe838cf0d0 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -40,6 +40,7 @@
 &i    imm rs1 rd
 &j    imm rd
 &r    rd rs1 rs2
+&r2   rd rs1
 &s    imm rs1 rs2
 &u    imm rd
 &shift     shamt rs1 rd
@@ -67,7 +68,7 @@
 @r4_rm   ..... ..  ..... ..... ... ..... ....... %rs3 %rs2 %rs1 %rm %rd
 @r_rm    .......   ..... ..... ... ..... ....... %rs2 %rs1 %rm %rd
 @r2_rm   .......   ..... ..... ... ..... ....... %rs1 %rm %rd
-@r2      .......   ..... ..... ... ..... ....... %rs1 %rd
+@r2      .......   ..... ..... ... ..... ....... &r2 %rs1 %rd
 @r2_nfvm ... ... vm:1 ..... ..... ... ..... ....... &r2nfvm %nf %rs1 %rd
 @r2_vm   ...... vm:1 ..... ..... ... ..... ....... &rmr %rs2 %rd
 @r1_vm   ...... vm:1 ..... ..... ... ..... ....... %rd
@@ -592,3 +593,7 @@ vcompress_vm    010111 - ..... ..... 010 ..... 1010111 @r
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
+
+# *** RV32B Standard Extension ***
+clz        011000 000000 ..... 001 ..... 0010011 @r2
+ctz        011000 000001 ..... 001 ..... 0010011 @r2
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
new file mode 100644
index 00000000000..fb6e16143db
--- /dev/null
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -0,0 +1,47 @@
+/*
+ * RISC-V translation routines for the RVB Standard Extension.
+ *
+ * Copyright (c) 2020 Kito Cheng, kito.cheng@sifive.com
+ * Copyright (c) 2020 Frank Chang, frank.chang@sifive.com
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
+static bool trans_clz(DisasContext *ctx, arg_clz *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_unary(ctx, a, &gen_clz);
+}
+
+static bool trans_ctz(DisasContext *ctx, arg_ctz *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_unary(ctx, a, &gen_ctz);
+}
+
+/* RV64-only instructions */
+#ifdef TARGET_RISCV64
+
+static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_unary(ctx, a, &gen_clzw);
+}
+
+static bool trans_ctzw(DisasContext *ctx, arg_ctzw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_unary(ctx, a, &gen_ctzw);
+}
+
+#endif
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 554d52a4be3..398d4502a96 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -711,6 +711,23 @@ static bool gen_arith_div_uw(DisasContext *ctx, arg_r *a,
 
 #endif
 
+#ifdef TARGET_RISCV64
+
+static void gen_ctzw(TCGv ret, TCGv arg1)
+{
+    tcg_gen_ori_i64(ret, arg1, MAKE_64BIT_MASK(32, 32));
+    tcg_gen_ctzi_i64(ret, ret, 32);
+}
+
+static void gen_clzw(TCGv ret, TCGv arg1)
+{
+    tcg_gen_ext32u_i64(ret, arg1);
+    tcg_gen_clzi_i64(ret, ret, 64);
+    tcg_gen_subi_i64(ret, ret, 32);
+}
+
+#endif
+
 static bool gen_arith(DisasContext *ctx, arg_r *a,
                       void(*func)(TCGv, TCGv, TCGv))
 {
@@ -747,6 +764,30 @@ static bool gen_shift(DisasContext *ctx, arg_r *a,
     return true;
 }
 
+static void gen_ctz(TCGv ret, TCGv arg1)
+{
+    tcg_gen_ctzi_tl(ret, arg1, TARGET_LONG_BITS);
+}
+
+static void gen_clz(TCGv ret, TCGv arg1)
+{
+    tcg_gen_clzi_tl(ret, arg1, TARGET_LONG_BITS);
+}
+
+static bool gen_unary(DisasContext *ctx, arg_r2 *a,
+                      void(*func)(TCGv, TCGv))
+{
+    TCGv source = tcg_temp_new();
+
+    gen_get_gpr(source, a->rs1);
+
+    (*func)(source, source);
+
+    gen_set_gpr(a->rd, source);
+    tcg_temp_free(source);
+    return true;
+}
+
 /* Include insn module translation function */
 #include "insn_trans/trans_rvi.c.inc"
 #include "insn_trans/trans_rvm.c.inc"
@@ -755,6 +796,7 @@ static bool gen_shift(DisasContext *ctx, arg_r *a,
 #include "insn_trans/trans_rvd.c.inc"
 #include "insn_trans/trans_rvh.c.inc"
 #include "insn_trans/trans_rvv.c.inc"
+#include "insn_trans/trans_rvb.c.inc"
 #include "insn_trans/trans_privileged.c.inc"
 
 /* Include the auto-generated decoder for 16 bit insn */
-- 
2.17.1


