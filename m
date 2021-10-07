Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73438425A16
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 19:56:18 +0200 (CEST)
Received: from localhost ([::1]:44690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYXcv-0001yi-FA
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 13:56:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYXUb-00044L-NM
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:47:44 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:46015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYXUU-0006wR-Po
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:47:41 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 ls14-20020a17090b350e00b001a00e2251c8so5695570pjb.4
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 10:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XBpFvHyAXfKxFmNRmo3FDaOehv00YfeTHltGHuiouDk=;
 b=QZB4D9fvFkzhdRbgvQpM+Vyj30PFl4nL9NioDzPcRuZ9wxV1tHZhlWWp/YErYws/X/
 tUcaIYFaOETQzneMSpb1Nadot8Vy55m/BcMnwaOwNlKZv56c3Fiwx5IE3Qll97jpdnOO
 ICRKlSOz9nIitW3SX9GUsHiqa8SFlvbxZrKR1QC/ahlM4tcGV44z/Lku2ezZOjCcnmpV
 Ss1kNc0Zir+EXhZMDu+PaKxveB6b9E4ngpH8lXvQ0ZOlbDNX/Mx77DMkkuL6aJqTN201
 6ZyTqtl+JXO1oq1QzSy0jfsJ+0jKq+uARomLrrsA9BuEALsbiwEMfMTGATxl/gJ/XuPd
 VTsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XBpFvHyAXfKxFmNRmo3FDaOehv00YfeTHltGHuiouDk=;
 b=v+FLRjcqXCOeookHEDqXUBADi+LEPEFx61i9vEvIPtCdUjDgLNffoXzLM+htKom1vp
 nr+BBciuOtZQLAK8ahp6z3JfAy3/PjgSwi0fnNGZ5xigpTg08k6QRxGCmFNqhOlQ5kOX
 AdeXX9gcy8qOiB5wLnJU7LKVBC0HSCCmciLYahUkheoikK/GGFS9QgTrVC7Cwli8Mrgc
 nYQQGEGv+P5phmbH4/TInj5/ZCmOOePhPDk39baW2+5QRjJfwOaRU74n3K/ggXZN0IGw
 yNZnZmmXUouXumIrJ0oVYRE2RI9w9psPL+23HJ96TuWD967lbYdTvEy2DQSigqAduTXz
 u2Aw==
X-Gm-Message-State: AOAM532FeBVLvbZkxeg6PlOOihfFPWbqb1+B+YQYU4XNNmKaSOx3m37S
 rcnbknSwnlwZdqyHTj0d9mNNFrkcNB8gQg==
X-Google-Smtp-Source: ABdhPJxBudqE/NyfdZI+cPW7GW+q41c2DmWfQwk6qj8VsIK5dshO4OHNAxEXCJnwOIVz7kWZoryGlg==
X-Received: by 2002:a17:902:7843:b0:13d:c728:69c9 with SMTP id
 e3-20020a170902784300b0013dc72869c9mr5035407pln.55.1633628852686; 
 Thu, 07 Oct 2021 10:47:32 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 197sm83318pfv.6.2021.10.07.10.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 10:47:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/13] target/riscv: Use gen_unary_per_ol for RVB
Date: Thu,  7 Oct 2021 10:47:21 -0700
Message-Id: <20211007174722.929993-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007174722.929993-1-richard.henderson@linaro.org>
References: <20211007174722.929993-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Cc: alistair.francis@wdc.com, frederic.petrot@univ-grenoble-alpes.fr,
 qemu-riscv@nongnu.org, fabien.portas@grenoble-inp.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The count zeros instructions require a separate implementation
for RV32 when TARGET_LONG_BITS == 64.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c                | 16 ++++++++++++
 target/riscv/insn_trans/trans_rvb.c.inc | 33 ++++++++++++-------------
 2 files changed, 32 insertions(+), 17 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index f960929c16..be458ae0c2 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -510,6 +510,22 @@ static bool gen_unary(DisasContext *ctx, arg_r2 *a, DisasExtend ext,
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
index c62eea433a..adc35b6491 100644
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
+    tcg_gen_ctzi_tl(ret, ret, 32);
+}
+
 static bool trans_ctz(DisasContext *ctx, arg_ctz *a)
 {
     REQUIRE_ZBB(ctx);
-    return gen_unary(ctx, a, EXT_ZERO, gen_ctz);
+    return gen_unary_per_ol(ctx, a, EXT_ZERO, gen_ctz, gen_ctzw);
 }
 
 static bool trans_cpop(DisasContext *ctx, arg_cpop *a)
@@ -314,14 +327,6 @@ static bool trans_zext_h_64(DisasContext *ctx, arg_zext_h_64 *a)
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
@@ -329,17 +334,11 @@ static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
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


