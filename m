Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6393A373F72
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 18:19:48 +0200 (CEST)
Received: from localhost ([::1]:35504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leKFX-0002jh-EG
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 12:19:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1leK3M-00065g-UI
 for qemu-devel@nongnu.org; Wed, 05 May 2021 12:07:12 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:38761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1leK3J-0002Z9-65
 for qemu-devel@nongnu.org; Wed, 05 May 2021 12:07:12 -0400
Received: by mail-pl1-x62c.google.com with SMTP id y2so1350375plr.5
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 09:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/KxtJ/aibbL7AvY80jKpo9En88QTXF9J4oPX/Zra/ws=;
 b=YmjohzRJ7D3jpkf9MUTlWAS6rsbDTmft1tuJm9otKjo9urvD5BXS7tqBDchKkUBkrz
 Y2KBKFZO4ut6dSuuAMwO7SXZwd6mKgu32BESDvGSql6EK3PSPLZFeklsmH+A3vBxD8MX
 wUAEJz/2v3aI8wlMauzWq9CqbC3auyiqDJFE0shW03PXRWsWV3UAwRhvV8kzh9v+NSsg
 mztnmzgBMskHcg8xFbj9+Tz6qTzg5L6SnAx/Bk5QHhyKbcPBJzMDYRPW6B0jHg+3nAd3
 gzgGgDkAyYvGzm9cZaY5fNdQQRkpT5KCfIL0OzV19yIGwL1zLPClDYkR3v3WnaeSftcI
 c5uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=/KxtJ/aibbL7AvY80jKpo9En88QTXF9J4oPX/Zra/ws=;
 b=uDbAap+fNMShKg/d7SzPQUkThmf49bOYXkOID9rh9i/2cFIgplpTCn+k+0JiIsWQVf
 z5Kzr2AQzRo/Qq4AgjjB+rQQ9a5P80ljewcuMf60EG1tsyZDCbXYgJLZYJ5GObIDnSYl
 tLfXH5NenhFu/Q4b7wc52XNwGiPiLw8OanEgiDPbPy0qL8dgXGZ45vl/gkrdDbrSxC7r
 tz6y7yAEbteXHwuMcoCZh3wByWNDfKqIA4eKLz7oJmJqL61pYSLaYFn7L7Ok3XpwVoAD
 5M1P/OaT0BGAL9lGgBKkwcR+ExXp0zPIbGpwk+I5MoTsbLIEcitjrTzbesmT1CZgWBkg
 13Zw==
X-Gm-Message-State: AOAM531oF2mnY4qPMqvv4UYvm4MAdjxrKGNMgNKACaM8vh+t4q0FNUkQ
 Hkwye+7XGkTMMD0yrslqkkMpaN0WET7xSSJF
X-Google-Smtp-Source: ABdhPJzPW+4wj5A1Q13NQl/lyeFe+JPgEgcLB9C5K2U34EyUGX3625CatWE6PrhZt9pxoUkne/pRfw==
X-Received: by 2002:a17:90a:d41:: with SMTP id
 1mr36534803pju.232.1620230827433; 
 Wed, 05 May 2021 09:07:07 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id js6sm35877977pjb.0.2021.05.05.09.07.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 09:07:06 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v6 11/17] target/riscv: rvb: rotate (left/right)
Date: Thu,  6 May 2021 00:06:12 +0800
Message-Id: <20210505160620.15723-12-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210505160620.15723-1-frank.chang@sifive.com>
References: <20210505160620.15723-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62c.google.com
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
Cc: Frank Chang <frank.chang@sifive.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32.decode              |  6 ++++
 target/riscv/insn_trans/trans_rvb.c.inc | 39 +++++++++++++++++++++++++
 target/riscv/translate.c                | 36 +++++++++++++++++++++++
 3 files changed, 81 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 6bc9bbae9e0..71a9a182c01 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -682,6 +682,8 @@ binv       0110100 .......... 001 ..... 0110011 @r
 bext       0100100 .......... 101 ..... 0110011 @r
 slo        0010000 .......... 001 ..... 0110011 @r
 sro        0010000 .......... 101 ..... 0110011 @r
+ror        0110000 .......... 101 ..... 0110011 @r
+rol        0110000 .......... 001 ..... 0110011 @r
 
 bseti      00101. ........... 001 ..... 0010011 @sh
 bclri      01001. ........... 001 ..... 0010011 @sh
@@ -689,6 +691,7 @@ binvi      01101. ........... 001 ..... 0010011 @sh
 bexti      01001. ........... 101 ..... 0010011 @sh
 sloi       00100. ........... 001 ..... 0010011 @sh
 sroi       00100. ........... 101 ..... 0010011 @sh
+rori       01100. ........... 101 ..... 0010011 @sh
 
 # *** RV64B Standard Extension (in addition to RV32B) ***
 clzw       0110000 00000 ..... 001 ..... 0011011 @r2
@@ -703,9 +706,12 @@ binvw      0110100 .......... 001 ..... 0111011 @r
 bextw      0100100 .......... 101 ..... 0111011 @r
 slow       0010000 .......... 001 ..... 0111011 @r
 srow       0010000 .......... 101 ..... 0111011 @r
+rorw       0110000 .......... 101 ..... 0111011 @r
+rolw       0110000 .......... 001 ..... 0111011 @r
 
 bsetiw     0010100 .......... 001 ..... 0011011 @sh5
 bclriw     0100100 .......... 001 ..... 0011011 @sh5
 binviw     0110100 .......... 001 ..... 0011011 @sh5
 sloiw      0010000 .......... 001 ..... 0011011 @sh5
 sroiw      0010000 .......... 101 ..... 0011011 @sh5
+roriw      0110000 .......... 101 ..... 0011011 @sh5
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 28640322c43..429738db155 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -179,6 +179,24 @@ static bool trans_sroi(DisasContext *ctx, arg_sroi *a)
     return gen_shifti(ctx, a, gen_sro);
 }
 
+static bool trans_ror(DisasContext *ctx, arg_ror *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shift(ctx, a, tcg_gen_rotr_tl);
+}
+
+static bool trans_rori(DisasContext *ctx, arg_rori *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shifti(ctx, a, tcg_gen_rotr_tl);
+}
+
+static bool trans_rol(DisasContext *ctx, arg_rol *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shift(ctx, a, tcg_gen_rotl_tl);
+}
+
 static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
 {
     REQUIRE_64BIT(ctx);
@@ -290,3 +308,24 @@ static bool trans_sroiw(DisasContext *ctx, arg_sroiw *a)
     REQUIRE_EXT(ctx, RVB);
     return gen_shiftiw(ctx, a, gen_sro);
 }
+
+static bool trans_rorw(DisasContext *ctx, arg_rorw *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftw(ctx, a, gen_rorw);
+}
+
+static bool trans_roriw(DisasContext *ctx, arg_roriw *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftiw(ctx, a, gen_rorw);
+}
+
+static bool trans_rolw(DisasContext *ctx, arg_rolw *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftw(ctx, a, gen_rolw);
+}
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 088cf9f7678..c09b93f1b8a 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -663,6 +663,42 @@ static void gen_packuw(TCGv ret, TCGv arg1, TCGv arg2)
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
 static bool gen_arith(DisasContext *ctx, arg_r *a,
                       void(*func)(TCGv, TCGv, TCGv))
 {
-- 
2.17.1


