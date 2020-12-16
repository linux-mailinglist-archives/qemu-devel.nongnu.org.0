Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8792DB8DB
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 03:16:31 +0100 (CET)
Received: from localhost ([::1]:60266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpMMg-0002K4-EE
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 21:16:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kpMB4-0000Vn-Nf
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 21:04:30 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:41010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kpMB1-0001AH-FL
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 21:04:30 -0500
Received: by mail-pl1-x633.google.com with SMTP id y8so12052999plp.8
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 18:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=jwt90askM0N+FSIMNOKGS+GZDK+252vo/sdulttaipM=;
 b=foUaviYXYy4C9DMBZl4AHeDHQrDdv0gKrVoGpMigIlvFJhN7j7fCgsKQNDViUJSZxb
 qh3vQJSqTwAiUHPMAASsrI5eJDkDexqoX0mLUICw1S5jsqi1EeOLgOv8Tyevjc5Kbi/t
 62nRoGe4zgGzEZw1dW+ed80ie9E9r7X/butzh9EzW/0CpRkYboUoADzBdIDJvfEFNS9b
 paOhpuVNd75Uqq/jeZPgjVt3FfWFTF/GXWPRRM0CrUoKsgheFUg1/FBoha+8lFXWVDJn
 oairG3RPp83e6KpueLi7slkjDNYHqnwT2KupTsIdhQlPUCjbdz+dz47ZFiSzp19Drz8n
 aKNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=jwt90askM0N+FSIMNOKGS+GZDK+252vo/sdulttaipM=;
 b=Ku4j/esvqiFXs07ues9Tdg9ciZjjcMsrqN4OYKDOhHj2e6VizdIUtQccBV7+8+9tsY
 IYMrrwvuSJ4cOsFQFajSDBMrqdTtERrpSZ8OvzVJOWfh/kphy5TfBcQYFJcHz988HlI0
 cPdVa2gxSc0h1z2b3R5hHT2LjPZvQ443J8qbLHmjFF3ZfnmmTda+MMv+Lop40s4POtw0
 bBiOWrB6ZUFP082ldvHtJwE8B/lupN2XMrszPmx/P7IGujfax+PfNq7/C0USR74AtirZ
 k4RZgLjr7MnCkMjQigY/p8FvcJ93DjsFMIQSXq2pMT7rnn8w5s2XWE44TWWP6eQLMwnA
 ak5A==
X-Gm-Message-State: AOAM5301k7D3W2fbDrrt0oiAlqlIkYY5iCWNFN2T7yGRsy/117cPrmhd
 HP6ilO6zJ4pcWMle1fm6n3jGsegOm7vzaqMz7hk=
X-Google-Smtp-Source: ABdhPJzBVmDUxRUZZMXyOsSUu9MaXom+M1tznWXeHYORcgiwJKKhGqQ5p+34b5DKxebv7NNV2YI6Fg==
X-Received: by 2002:a17:90a:ce0c:: with SMTP id
 f12mr1213873pju.89.1608084264984; 
 Tue, 15 Dec 2020 18:04:24 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id a13sm289150pfr.59.2020.12.15.18.04.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 18:04:24 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC v2 10/15] target/riscv: rvb: rotate (left/right)
Date: Wed, 16 Dec 2020 10:01:35 +0800
Message-Id: <20201216020150.3157-11-frank.chang@sifive.com>
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
 target/riscv/insn32-64.decode           |  3 ++
 target/riscv/insn32.decode              |  3 ++
 target/riscv/insn_trans/trans_rvb.c.inc | 61 +++++++++++++++++++++++++
 target/riscv/translate.c                | 36 +++++++++++++++
 4 files changed, 103 insertions(+)

diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index 6d017c70c74..ac0634d754a 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -100,9 +100,12 @@ sbinvw     0110100 .......... 001 ..... 0111011 @r
 sbextw     0100100 .......... 101 ..... 0111011 @r
 slow       0010000 .......... 001 ..... 0111011 @r
 srow       0010000 .......... 101 ..... 0111011 @r
+rorw       0110000 .......... 101 ..... 0111011 @r
+rolw       0110000 .......... 001 ..... 0111011 @r
 
 sbsetiw    0010100 .......... 001 ..... 0011011 @sh5
 sbclriw    0100100 .......... 001 ..... 0011011 @sh5
 sbinviw    0110100 .......... 001 ..... 0011011 @sh5
 sloiw      0010000 .......... 001 ..... 0011011 @sh5
 sroiw      0010000 .......... 101 ..... 0011011 @sh5
+roriw      0110000 .......... 101 ..... 0011011 @sh5
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 78ce4b11097..b4677293582 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -617,6 +617,8 @@ sbinv      0110100 .......... 001 ..... 0110011 @r
 sbext      0100100 .......... 101 ..... 0110011 @r
 slo        0010000 .......... 001 ..... 0110011 @r
 sro        0010000 .......... 101 ..... 0110011 @r
+ror        0110000 .......... 101 ..... 0110011 @r
+rol        0110000 .......... 001 ..... 0110011 @r
 
 sbseti     00101. ........... 001 ..... 0010011 @sh
 sbclri     01001. ........... 001 ..... 0010011 @sh
@@ -624,3 +626,4 @@ sbinvi     01101. ........... 001 ..... 0010011 @sh
 sbexti     01001. ........... 101 ..... 0010011 @sh
 sloi       00100. ........... 001 ..... 0010011 @sh
 sroi       00100. ........... 101 ..... 0010011 @sh
+rori       01100. ........... 101 ..... 0010011 @sh
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 11b5439e703..433cc7f9fc8 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -189,7 +189,36 @@ static bool trans_sroi(DisasContext *ctx, arg_sroi *a)
     return gen_shifti(ctx, a, &gen_sro);
 }
 
+static bool trans_ror(DisasContext *ctx, arg_ror *a)
 {
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &tcg_gen_rotr_tl);
+}
+
+static bool trans_rori(DisasContext *ctx, arg_rori *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+
+    if (a->shamt >= TARGET_LONG_BITS) {
+        return false;
+    }
+
+    TCGv source1 = tcg_temp_new();
+
+    gen_get_gpr(source1, a->rs1);
+    tcg_gen_rotri_tl(source1, source1, a->shamt);
+    gen_set_gpr(a->rd, source1);
+
+    tcg_temp_free(source1);
+    return true;
+}
+
+static bool trans_rol(DisasContext *ctx, arg_rol *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &tcg_gen_rotl_tl);
+}
+
 /* RV64-only instructions */
 #ifdef TARGET_RISCV64
 
@@ -289,4 +318,36 @@ static bool trans_sroiw(DisasContext *ctx, arg_sroiw *a)
     return gen_shiftiw(ctx, a, &gen_sro);
 }
 
+static bool trans_rorw(DisasContext *ctx, arg_rorw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftw(ctx, a, &gen_rorw);
+}
+
+static bool trans_roriw(DisasContext *ctx, arg_roriw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+
+    if (a->shamt >= 32) {
+        return false;
+    }
+
+    if (a->shamt == 0) {
+        TCGv t = tcg_temp_new();
+        gen_get_gpr(t, a->rs1);
+        tcg_gen_ext32s_tl(t, t);
+        gen_set_gpr(a->rd, t);
+        tcg_temp_free(t);
+        return true;
+    }
+
+    return gen_shiftiw(ctx, a, &gen_rorw);
+}
+
+static bool trans_rolw(DisasContext *ctx, arg_rolw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftw(ctx, a, &gen_rolw);
+}
+
 #endif
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 0c00d20ab1b..10b4142a3ab 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -849,6 +849,42 @@ static void gen_packuw(TCGv ret, TCGv arg1, TCGv arg2)
     tcg_temp_free(t);
 }
 
+static void gen_rorw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv_i32 t1 = tcg_temp_new_i32();
+    TCGv_i32 t2 = tcg_temp_new_i32();
+
+    /* truncate to 32-bits */
+    tcg_gen_trunc_tl_i32(t1, arg1);
+    tcg_gen_trunc_tl_i32(t2, arg2);
+
+    tcg_gen_rotr_i32(t1, t1, t2);
+
+    /* sign-extend 64-bits */
+    tcg_gen_ext_i32_tl(ret, t1);
+
+    tcg_temp_free_i32(t1);
+    tcg_temp_free_i32(t2);
+}
+
+static void gen_rolw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv_i32 t1 = tcg_temp_new_i32();
+    TCGv_i32 t2 = tcg_temp_new_i32();
+
+    /* truncate to 32-bits */
+    tcg_gen_trunc_tl_i32(t1, arg1);
+    tcg_gen_trunc_tl_i32(t2, arg2);
+
+    tcg_gen_rotl_i32(t1, t1, t2);
+
+    /* sign-extend 64-bits */
+    tcg_gen_ext_i32_tl(ret, t1);
+
+    tcg_temp_free_i32(t1);
+    tcg_temp_free_i32(t2);
+}
+
 #endif
 
 static bool gen_arith(DisasContext *ctx, arg_r *a,
-- 
2.17.1


