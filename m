Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8269037410B
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 18:43:05 +0200 (CEST)
Received: from localhost ([::1]:54172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leKc4-0006BG-I0
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 12:43:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1leK3D-0005rX-H8
 for qemu-devel@nongnu.org; Wed, 05 May 2021 12:07:03 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:36728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1leK3B-0002UQ-Ab
 for qemu-devel@nongnu.org; Wed, 05 May 2021 12:07:03 -0400
Received: by mail-pf1-x429.google.com with SMTP id p4so2370749pfo.3
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 09:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=PUYMdViSmZJxy9sb4CXvuKo2qdLdXwHyi30Y5ybdlZ4=;
 b=FXrJC/tf//W59bZj900M9QUkaw0fOERRGjNq1YkNDr6Ay4++Vwudk9cehY5UbcCiB2
 56KPrLLnW/Es1AytSuvjURnvnpeZgHkNbcq9M3CNJj9Nvklx2U2n4vzA3XFT1GnGNIJh
 CrC7uTn+7uI3iCiHQC6UGcV/c1Sqwf9xc51z1ZR4Hyj70lWhYFq1ml00bksOJdPbFOBl
 sOggMtWTZcsTbiPHYZTGAoqNuzGc2PxLr6drOlBMRj6pHflMlH2WnsNwWW2JH4b8Msc1
 2nrrO6wNQPVAsBs9P/gGwqCWH9pTRy4eHt0QErKRXqgE8L62UkSEP4xBQleMMZ7TfxPQ
 vCIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=PUYMdViSmZJxy9sb4CXvuKo2qdLdXwHyi30Y5ybdlZ4=;
 b=s+OdOjP3GTqCFGKkzGmQkV0Og4PNrbMJs9vbR8frW2ID7695yBta1C6q3aAwubCiJi
 vWmu8ZQdpRJ7rTaiqFcBC2AV0ZmOg27yF5HC8EjmoH64vYt8QhBJmadWUViU/M3XzWmJ
 PhyZwxn1UhT45Q9lSy1JyLCE4dp9yWgDdy3MObjn+KsQJXh43QQadFvy2j1WVcS5e5+1
 5wLApNrLyAL3agCn/V0iyfLguUEH681RuE8XSa7ZElTW2mSjoLLSOL/lIK7+ElR2+4w1
 /0ysAwyoc3UzYzq7NbkBjCRd/BtlOrzKsZ3qa6hoi+jNBYGRvZdgg8N7hX54zTUOxFQA
 4t9w==
X-Gm-Message-State: AOAM533UrlrkugrVQngTwmeRlM7sUiKguaYDofzNRxgK+xXNwwA4Ds31
 dDL1d6Qzf3pXrKBrJHF2pm6Rja045MfSmd6R
X-Google-Smtp-Source: ABdhPJxQM9WvH8vUeahImnqxPulFMQ8zKWp7W2EV5KLgWkdlwd+461dy2NCcyS6FVc30J+uS9rLpTA==
X-Received: by 2002:a65:4c0f:: with SMTP id u15mr10773642pgq.288.1620230819443; 
 Wed, 05 May 2021 09:06:59 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id js6sm35877977pjb.0.2021.05.05.09.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 09:06:59 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v6 09/17] target/riscv: rvb: single-bit instructions
Date: Thu,  6 May 2021 00:06:10 +0800
Message-Id: <20210505160620.15723-10-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210505160620.15723-1-frank.chang@sifive.com>
References: <20210505160620.15723-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x429.google.com
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

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32.decode              | 17 +++++
 target/riscv/insn_trans/trans_rvb.c.inc | 97 +++++++++++++++++++++++++
 target/riscv/translate.c                | 61 ++++++++++++++++
 3 files changed, 175 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 93619846349..433b601b934 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -676,6 +676,15 @@ min        0000101 .......... 100 ..... 0110011 @r
 minu       0000101 .......... 101 ..... 0110011 @r
 max        0000101 .......... 110 ..... 0110011 @r
 maxu       0000101 .......... 111 ..... 0110011 @r
+bset       0010100 .......... 001 ..... 0110011 @r
+bclr       0100100 .......... 001 ..... 0110011 @r
+binv       0110100 .......... 001 ..... 0110011 @r
+bext       0100100 .......... 101 ..... 0110011 @r
+
+bseti      00101. ........... 001 ..... 0010011 @sh
+bclri      01001. ........... 001 ..... 0010011 @sh
+binvi      01101. ........... 001 ..... 0010011 @sh
+bexti      01001. ........... 101 ..... 0010011 @sh
 
 # *** RV64B Standard Extension (in addition to RV32B) ***
 clzw       0110000 00000 ..... 001 ..... 0011011 @r2
@@ -684,3 +693,11 @@ cpopw      0110000 00010 ..... 001 ..... 0011011 @r2
 
 packw      0000100 .......... 100 ..... 0111011 @r
 packuw     0100100 .......... 100 ..... 0111011 @r
+bsetw      0010100 .......... 001 ..... 0111011 @r
+bclrw      0100100 .......... 001 ..... 0111011 @r
+binvw      0110100 .......... 001 ..... 0111011 @r
+bextw      0100100 .......... 101 ..... 0111011 @r
+
+bsetiw     0010100 .......... 001 ..... 0011011 @sh5
+bclriw     0100100 .......... 001 ..... 0011011 @sh5
+binviw     0110100 .......... 001 ..... 0011011 @sh5
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 3d594e8cb40..69e5af44a18 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -107,6 +107,54 @@ static bool trans_sext_h(DisasContext *ctx, arg_sext_h *a)
     return gen_unary(ctx, a, tcg_gen_ext16s_tl);
 }
 
+static bool trans_bset(DisasContext *ctx, arg_bset *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shift(ctx, a, gen_bset);
+}
+
+static bool trans_bseti(DisasContext *ctx, arg_bseti *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shifti(ctx, a, gen_bset);
+}
+
+static bool trans_bclr(DisasContext *ctx, arg_bclr *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shift(ctx, a, gen_bclr);
+}
+
+static bool trans_bclri(DisasContext *ctx, arg_bclri *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shifti(ctx, a, gen_bclr);
+}
+
+static bool trans_binv(DisasContext *ctx, arg_binv *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shift(ctx, a, gen_binv);
+}
+
+static bool trans_binvi(DisasContext *ctx, arg_binvi *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shifti(ctx, a, gen_binv);
+}
+
+static bool trans_bext(DisasContext *ctx, arg_bext *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shift(ctx, a, gen_bext);
+}
+
+static bool trans_bexti(DisasContext *ctx, arg_bexti *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shifti(ctx, a, gen_bext);
+}
+
 static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
 {
     REQUIRE_64BIT(ctx);
@@ -141,3 +189,52 @@ static bool trans_packuw(DisasContext *ctx, arg_packuw *a)
     REQUIRE_EXT(ctx, RVB);
     return gen_arith(ctx, a, gen_packuw);
 }
+
+static bool trans_bsetw(DisasContext *ctx, arg_bsetw *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftw(ctx, a, gen_bset);
+}
+
+static bool trans_bsetiw(DisasContext *ctx, arg_bsetiw *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftiw(ctx, a, gen_bset);
+}
+
+static bool trans_bclrw(DisasContext *ctx, arg_bclrw *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftw(ctx, a, gen_bclr);
+}
+
+static bool trans_bclriw(DisasContext *ctx, arg_bclriw *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftiw(ctx, a, gen_bclr);
+}
+
+static bool trans_binvw(DisasContext *ctx, arg_binvw *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftw(ctx, a, gen_binv);
+}
+
+static bool trans_binviw(DisasContext *ctx, arg_binviw *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftiw(ctx, a, gen_binv);
+}
+
+static bool trans_bextw(DisasContext *ctx, arg_bextw *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftw(ctx, a, gen_bext);
+}
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 292cf09932d..e12240d1255 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -571,6 +571,48 @@ static void gen_packh(TCGv ret, TCGv arg1, TCGv arg2)
     tcg_temp_free(t);
 }
 
+static void gen_sbop_mask(TCGv ret, TCGv shamt)
+{
+    tcg_gen_movi_tl(ret, 1);
+    tcg_gen_shl_tl(ret, ret, shamt);
+}
+
+static void gen_bset(TCGv ret, TCGv arg1, TCGv shamt)
+{
+    TCGv t = tcg_temp_new();
+
+    gen_sbop_mask(t, shamt);
+    tcg_gen_or_tl(ret, arg1, t);
+
+    tcg_temp_free(t);
+}
+
+static void gen_bclr(TCGv ret, TCGv arg1, TCGv shamt)
+{
+    TCGv t = tcg_temp_new();
+
+    gen_sbop_mask(t, shamt);
+    tcg_gen_andc_tl(ret, arg1, t);
+
+    tcg_temp_free(t);
+}
+
+static void gen_binv(TCGv ret, TCGv arg1, TCGv shamt)
+{
+    TCGv t = tcg_temp_new();
+
+    gen_sbop_mask(t, shamt);
+    tcg_gen_xor_tl(ret, arg1, t);
+
+    tcg_temp_free(t);
+}
+
+static void gen_bext(TCGv ret, TCGv arg1, TCGv shamt)
+{
+    tcg_gen_shr_tl(ret, arg1, shamt);
+    tcg_gen_andi_tl(ret, ret, 1);
+}
+
 static void gen_ctzw(TCGv ret, TCGv arg1)
 {
     tcg_gen_ori_tl(ret, arg1, (target_ulong)MAKE_64BIT_MASK(32, 32));
@@ -673,6 +715,25 @@ static bool gen_shifti(DisasContext *ctx, arg_shift *a,
     return true;
 }
 
+static bool gen_shiftw(DisasContext *ctx, arg_r *a,
+                       void(*func)(TCGv, TCGv, TCGv))
+{
+    TCGv source1 = tcg_temp_new();
+    TCGv source2 = tcg_temp_new();
+
+    gen_get_gpr(source1, a->rs1);
+    gen_get_gpr(source2, a->rs2);
+
+    tcg_gen_andi_tl(source2, source2, 31);
+    (*func)(source1, source1, source2);
+    tcg_gen_ext32s_tl(source1, source1);
+
+    gen_set_gpr(a->rd, source1);
+    tcg_temp_free(source1);
+    tcg_temp_free(source2);
+    return true;
+}
+
 static bool gen_shiftiw(DisasContext *ctx, arg_shift *a,
                         void(*func)(TCGv, TCGv, TCGv))
 {
-- 
2.17.1


