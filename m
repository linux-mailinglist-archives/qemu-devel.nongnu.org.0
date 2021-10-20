Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B934343E7
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 05:32:31 +0200 (CEST)
Received: from localhost ([::1]:56384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md2L8-0003q5-AX
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 23:32:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1md26a-0007FG-Um
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 23:17:28 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:36422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1md26S-00015h-Pc
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 23:17:28 -0400
Received: by mail-pg1-x533.google.com with SMTP id 75so21263860pga.3
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 20:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QFWFub+5wE7W42UBz/jcA4FNUYPA4Vi+1cQLKv1Yk3Y=;
 b=RtfOd1nxFhg6icd1gCOsmriixbl2Fw4Ht6Ze2sXvAbT7mLYN/ai1VciGDKmxu31+Ln
 wKkhmKcxwDuxH4EbMQdf3QMQYxxyJjGZjGRs4yc60XcvIpq036Y5eiUZsIk9uv4IhzJO
 4tDTYslspBKlHHfB3a/jmh/h263lek+rHJTw08JVxY1T3uP4b2xwlLOF+3Nek0AR+Ys4
 fygGb/Yq7OAWbaqU2zm05EIV/crxpZH4yXsosTK3YTCxHxFI24DHDhpN9lCyUBhtxqEu
 howqR2nrhjfpWBzrGfxvTy/miRUZGLAR2YKWO5jGiUtDwmSdeCyiIkGGeKaSVXv3QrDv
 1Ppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QFWFub+5wE7W42UBz/jcA4FNUYPA4Vi+1cQLKv1Yk3Y=;
 b=S+w6FVwf6b7j9gKGPEbbhtZqGdoBtnXVggiDFVjAtvQ84dmlW603ECqmu/Z2Zd5ALK
 QQS7QjZQq8tfQvquE2gdOT3FJ/VN2rPFILiwgIBNAveR9zg6UcCoQWsnqV6uiXfvlNaa
 xqNpL9+woPExm6P8GLDrF+AA/eKjPYm7ZI9WV+V3UuNwcEKxK5u6YGr9zlaCCBhFw4ek
 sDz2VRVNaIRvsWukcEOYn8DBJJlKrF6+aoaFX8fjUKDDTHDI5QjnOc4swQFfoRICTFeo
 gQ7L+tMrXHyApu77PTsaFa9ZXGtVtKAkRG3HBh6kyzxtV+N6wJMPTi4nsAvrYr2JTGs3
 PCXw==
X-Gm-Message-State: AOAM531vQPJ3Ccnu7ow1gID7FgcTODBe3yOj9YIcIPelIcxNNSosp3NR
 bN1NGLDeH/YebswxZRUm3QvZ8n5Sle+HbA==
X-Google-Smtp-Source: ABdhPJxctfkOz43wk8yZasf49RH0VY6fTt96yCh4QggAgcGgvP33J5oCKWmg7jlWysfyOfUe/65xpw==
X-Received: by 2002:a63:7a54:: with SMTP id j20mr2248037pgn.327.1634699839340; 
 Tue, 19 Oct 2021 20:17:19 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c8sm505364pjr.38.2021.10.19.20.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 20:17:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 12/15] target/riscv: Use gen_unary_per_ol for RVB
Date: Tue, 19 Oct 2021 20:17:06 -0700
Message-Id: <20211020031709.359469-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211020031709.359469-1-richard.henderson@linaro.org>
References: <20211020031709.359469-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: alistair.francis@wdc.com, qemu-riscv@nongnu.org, zhiwei_liu@c-sky.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The count zeros instructions require a separate implementation
for RV32 when TARGET_LONG_BITS == 64.

Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c                | 16 ++++++++++++
 target/riscv/insn_trans/trans_rvb.c.inc | 33 ++++++++++++-------------
 2 files changed, 32 insertions(+), 17 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 8f5f39d143..7286791c0f 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -511,6 +511,22 @@ static bool gen_unary(DisasContext *ctx, arg_r2 *a, DisasExtend ext,
     return true;
 }
 
+static bool gen_unary_per_ol(DisasContext *ctx, arg_r2 *a, DisasExtend ext,
+                             void (*f_tl)(TCGv, TCGv),
+                             void (*f_32)(TCGv, TCGv))
+{
+    int olen = get_olen(ctx);
+
+    if (olen != TARGET_LONG_BITS) {
+        if (olen == 32) {
+            f_tl = f_32;
+        } else {
+            g_assert_not_reached();
+        }
+    }
+    return gen_unary(ctx, a, ext, f_tl);
+}
+
 static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index d6f9e9fc83..4eb41756fa 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -47,10 +47,18 @@ static void gen_clz(TCGv ret, TCGv arg1)
     tcg_gen_clzi_tl(ret, arg1, TARGET_LONG_BITS);
 }
 
+static void gen_clzw(TCGv ret, TCGv arg1)
+{
+    TCGv t = tcg_temp_new();
+    tcg_gen_shli_tl(t, arg1, 32);
+    tcg_gen_clzi_tl(ret, t, 32);
+    tcg_temp_free(t);
+}
+
 static bool trans_clz(DisasContext *ctx, arg_clz *a)
 {
     REQUIRE_ZBB(ctx);
-    return gen_unary(ctx, a, EXT_ZERO, gen_clz);
+    return gen_unary_per_ol(ctx, a, EXT_NONE, gen_clz, gen_clzw);
 }
 
 static void gen_ctz(TCGv ret, TCGv arg1)
@@ -58,10 +66,15 @@ static void gen_ctz(TCGv ret, TCGv arg1)
     tcg_gen_ctzi_tl(ret, arg1, TARGET_LONG_BITS);
 }
 
+static void gen_ctzw(TCGv ret, TCGv arg1)
+{
+    tcg_gen_ctzi_tl(ret, arg1, 32);
+}
+
 static bool trans_ctz(DisasContext *ctx, arg_ctz *a)
 {
     REQUIRE_ZBB(ctx);
-    return gen_unary(ctx, a, EXT_ZERO, gen_ctz);
+    return gen_unary_per_ol(ctx, a, EXT_ZERO, gen_ctz, gen_ctzw);
 }
 
 static bool trans_cpop(DisasContext *ctx, arg_cpop *a)
@@ -317,14 +330,6 @@ static bool trans_zext_h_64(DisasContext *ctx, arg_zext_h_64 *a)
     return gen_unary(ctx, a, EXT_NONE, tcg_gen_ext16u_tl);
 }
 
-static void gen_clzw(TCGv ret, TCGv arg1)
-{
-    TCGv t = tcg_temp_new();
-    tcg_gen_shli_tl(t, arg1, 32);
-    tcg_gen_clzi_tl(ret, t, 32);
-    tcg_temp_free(t);
-}
-
 static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
 {
     REQUIRE_64BIT(ctx);
@@ -332,17 +337,11 @@ static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
     return gen_unary(ctx, a, EXT_NONE, gen_clzw);
 }
 
-static void gen_ctzw(TCGv ret, TCGv arg1)
-{
-    tcg_gen_ori_tl(ret, arg1, (target_ulong)MAKE_64BIT_MASK(32, 32));
-    tcg_gen_ctzi_tl(ret, ret, 64);
-}
-
 static bool trans_ctzw(DisasContext *ctx, arg_ctzw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_ZBB(ctx);
-    return gen_unary(ctx, a, EXT_NONE, gen_ctzw);
+    return gen_unary(ctx, a, EXT_ZERO, gen_ctzw);
 }
 
 static bool trans_cpopw(DisasContext *ctx, arg_cpopw *a)
-- 
2.25.1


