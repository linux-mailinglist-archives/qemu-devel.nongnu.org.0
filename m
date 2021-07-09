Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6A03C1E7A
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 06:36:51 +0200 (CEST)
Received: from localhost ([::1]:49850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1iFu-0006WP-Ou
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 00:36:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1i5u-0006Hp-4j
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 00:26:30 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:38723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1i5f-0001Vh-QE
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 00:26:29 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 cs1-20020a17090af501b0290170856e1a8aso7512316pjb.3
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 21:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DQ/WLskyXUz/4g9AcF1OXEaIbORFX+tdwkCAhBd67iI=;
 b=t62uCxDJyyuOML2V/zxRaCAFQL/YvzaGpqNm5sDhmGQh2Wg98M5CuOAVssim/okHnY
 Dr+5LyvICiSsjO6mEYz/+7t1aN9z/lWOLL8LJ81nBs9MgwpfQHgRMxGj7dWZmwQ3s2Bq
 1DutUOk12P6zXWGraas89alDnBIZxgcHjYrsW4IW6tmw7zbaoYu51cv/lFV61sZQFukk
 t4kjWWen2+hSAl7ONvsKZUQqJYpq9Kw+QgJcAj8GESjZxMFQmuEWBnq7uEUxqNwmExNW
 283vHXj+X7cvOsQQb5qda76nCPcwFgZu85ckxBbvC9u17UFyDUiM+2j1DAxPn0SdadgN
 XQ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DQ/WLskyXUz/4g9AcF1OXEaIbORFX+tdwkCAhBd67iI=;
 b=DmpxodevMUNYyqv5vCODooSjx6k1RD+/rW8toZte2rI4XQrDNeQDkk3i75RBDbfUhF
 J/flLp80TUhXL2BSin4XvXKcKkmpZKXrspxz4PkbXk6FfVPkUkh8N68iIalAeOnLtup4
 Zz7j4KrbT6g2cS6Xw8uWfIc9XfZWvY906hEVqeweXdWyH4tFbd2WXzgsPmK5CInq1YHe
 Z1Y7nKlEfYBJzkT1vC9mqnslTkoU15JLGQ7ahhefrBQFwWFUtGvUDXy5YRZu2Fd2WtA0
 NM5/3LCEZebyCyWunV9Ya7BMZ2d/TWd7//RPCS6KNdwTwAq091O+RNW7tfLoy1cBMVc/
 e1RQ==
X-Gm-Message-State: AOAM53033koWPXr89gCX1MCBJYmnwALkqOnjB/ifyFX4T1ToKRLhB3Q6
 ZfvpUD0DAdfvlHR6fpGZF9kttSjIkMVTKA==
X-Google-Smtp-Source: ABdhPJww0OpCZAbOhbfkM7wnreiH8o7Dx8690Z4Q4NIdMrUhdhXhBlWBvf/mBm1w0IT7DaOAkTHErA==
X-Received: by 2002:a17:90a:7442:: with SMTP id
 o2mr8556000pjk.47.1625804774556; 
 Thu, 08 Jul 2021 21:26:14 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id y16sm4406727pfe.70.2021.07.08.21.26.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 21:26:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/17] target/riscv: Use gpr_{src,
 dst} for word shift operations
Date: Thu,  8 Jul 2021 21:25:59 -0700
Message-Id: <20210709042608.883256-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210709042608.883256-1-richard.henderson@linaro.org>
References: <20210709042608.883256-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alistair.francis@wdc.com, qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For trans_sllw, we can just use gen_shiftw.  The others use
various tricks to reduce the tcg operation count.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvi.c.inc | 82 ++++++++++---------------
 1 file changed, 31 insertions(+), 51 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index a422dc9ef4..840187a4d6 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -352,24 +352,23 @@ static bool trans_slliw(DisasContext *ctx, arg_slliw *a)
 static bool trans_srliw(DisasContext *ctx, arg_srliw *a)
 {
     REQUIRE_64BIT(ctx);
-    TCGv t = tcg_temp_new();
-    gen_get_gpr(t, a->rs1);
-    tcg_gen_extract_tl(t, t, a->shamt, 32 - a->shamt);
-    /* sign-extend for W instructions */
-    tcg_gen_ext32s_tl(t, t);
-    gen_set_gpr(a->rd, t);
-    tcg_temp_free(t);
+
+    TCGv dest = gpr_dst(ctx, a->rd);
+    TCGv src1 = gpr_src(ctx, a->rs1);
+
+    tcg_gen_extract_tl(dest, src1, a->shamt, 32 - a->shamt);
+    tcg_gen_ext32s_tl(dest, dest);
     return true;
 }
 
 static bool trans_sraiw(DisasContext *ctx, arg_sraiw *a)
 {
     REQUIRE_64BIT(ctx);
-    TCGv t = tcg_temp_new();
-    gen_get_gpr(t, a->rs1);
-    tcg_gen_sextract_tl(t, t, a->shamt, 32 - a->shamt);
-    gen_set_gpr(a->rd, t);
-    tcg_temp_free(t);
+
+    TCGv dest = gpr_dst(ctx, a->rd);
+    TCGv src1 = gpr_src(ctx, a->rs1);
+
+    tcg_gen_sextract_tl(dest, src1, a->shamt, 32 - a->shamt);
     return true;
 }
 
@@ -388,64 +387,45 @@ static bool trans_subw(DisasContext *ctx, arg_subw *a)
 static bool trans_sllw(DisasContext *ctx, arg_sllw *a)
 {
     REQUIRE_64BIT(ctx);
-    TCGv source1 = tcg_temp_new();
-    TCGv source2 = tcg_temp_new();
-
-    gen_get_gpr(source1, a->rs1);
-    gen_get_gpr(source2, a->rs2);
-
-    tcg_gen_andi_tl(source2, source2, 0x1F);
-    tcg_gen_shl_tl(source1, source1, source2);
-
-    tcg_gen_ext32s_tl(source1, source1);
-    gen_set_gpr(a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
-    return true;
+    return gen_shiftw(ctx, a, tcg_gen_shl_tl);
 }
 
 static bool trans_srlw(DisasContext *ctx, arg_srlw *a)
 {
     REQUIRE_64BIT(ctx);
-    TCGv source1 = tcg_temp_new();
-    TCGv source2 = tcg_temp_new();
 
-    gen_get_gpr(source1, a->rs1);
-    gen_get_gpr(source2, a->rs2);
+    TCGv dest = gpr_dst(ctx, a->rd);
+    TCGv src1 = gpr_src(ctx, a->rs1);
+    TCGv src2 = gpr_src(ctx, a->rs2);
+    TCGv ext2 = tcg_temp_new();
 
-    /* clear upper 32 */
-    tcg_gen_ext32u_tl(source1, source1);
-    tcg_gen_andi_tl(source2, source2, 0x1F);
-    tcg_gen_shr_tl(source1, source1, source2);
+    tcg_gen_andi_tl(ext2, src2, 31);
+    tcg_gen_ext32u_tl(dest, src1);
+    tcg_gen_shr_tl(dest, dest, ext2);
+    tcg_gen_ext32s_tl(dest, dest);
 
-    tcg_gen_ext32s_tl(source1, source1);
-    gen_set_gpr(a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
+    tcg_temp_free(ext2);
     return true;
 }
 
 static bool trans_sraw(DisasContext *ctx, arg_sraw *a)
 {
     REQUIRE_64BIT(ctx);
-    TCGv source1 = tcg_temp_new();
-    TCGv source2 = tcg_temp_new();
 
-    gen_get_gpr(source1, a->rs1);
-    gen_get_gpr(source2, a->rs2);
+    TCGv dest = gpr_dst(ctx, a->rd);
+    TCGv src1 = gpr_src(ctx, a->rs1);
+    TCGv src2 = gpr_src(ctx, a->rs2);
+    TCGv ext2 = tcg_temp_new();
 
+    tcg_gen_andi_tl(ext2, src2, 31);
     /*
-     * first, trick to get it to act like working on 32 bits (get rid of
-     * upper 32, sign extend to fill space)
+     * First, trick to get it to act like working on 32 bits
+     * (get rid of upper 32, sign extend to fill space)
      */
-    tcg_gen_ext32s_tl(source1, source1);
-    tcg_gen_andi_tl(source2, source2, 0x1F);
-    tcg_gen_sar_tl(source1, source1, source2);
-
-    gen_set_gpr(a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
+    tcg_gen_ext32s_tl(dest, src1);
+    tcg_gen_sar_tl(dest, dest, ext2);
 
+    tcg_temp_free(ext2);
     return true;
 }
 
-- 
2.25.1


