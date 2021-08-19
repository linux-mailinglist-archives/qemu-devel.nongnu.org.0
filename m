Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 733ED3F15E3
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 11:11:36 +0200 (CEST)
Received: from localhost ([::1]:42548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGe5H-0003pO-FR
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 05:11:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGdzD-0005s0-S3
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 05:05:19 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:55961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGdzC-00009k-84
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 05:05:19 -0400
Received: by mail-pj1-x102d.google.com with SMTP id mq3so4462197pjb.5
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 02:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZtzgxMrimjDaolvyiQ4xom5y79yzDTt02qA1Y6+PMUo=;
 b=RkRR9d0Mzi/vjBI9nLZi6FKS1j8kAHrIm1s89nZDTDBuORQc9YrTQk2/dME74wdaC7
 2NGfTCxCZC4/io2OKZ6GBCQp6hZbC7lwdeNXU+M5IQtDQ13Z6cb9FplPKusNTtQDvbk4
 EG6ZnU3YqHvHOgccIStxCpff/d2tee3sE602thVdxROHIiDB7CwXqMn+fAo+zc27KBAo
 x/GsVrTnBh7Iye5qObDMBgsqGXfe/p/tUvWElseJngqG3i4qwVkHwWC5xtWT7wEtWkiN
 tgBMobbgTZFf6kkU346KInDdF+FJ8jEI2z6k4tAb5LE8IBVhrFLx5j+1YfeJR2odkNkG
 TDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZtzgxMrimjDaolvyiQ4xom5y79yzDTt02qA1Y6+PMUo=;
 b=ioNY4AgsHoloXrW2Dj4uoVOi0vxNREhj38GGkbJ0hveAr4kQBuN2Gts/zI8CmrEtxB
 NqZGESNmtkAes2AM62JNw6e2O6R2Rnm/WLAkp2x2dnu3M13vCHvlyITOIPlDMl3jRn0L
 EsZrQO8c2uev6C50LstuoT0RIRUbIstV/YXEbIQMOtF6Q6Or3hf5SBRNf3BiO/xt4hyx
 rpDPru/fY0akaewx8TcTeUBz6GaCe2u38vtBN4N/3WWw/CaPpyRQZAn5xeVDO1ev51Z7
 I0rn0lB8/0hZf0KvzZPMdDQHvZkMXafhn+Qx77lYHOrtcp5dwOhtwXcgjGBEHAeYMgvA
 8mjA==
X-Gm-Message-State: AOAM5325j3x+tEPYca7rNiewLTljvLSjbPxt2vOqpcc3tHG4lgRhTkoy
 rsxX4mAbkoOfcbSQLtsVRcawAf8SATqluA==
X-Google-Smtp-Source: ABdhPJyJjjECokZLKeCvSOJJWX5jKMauL78/7xQUZU88DxjbyMROueqrvqWrbJweH7YyUtQMy2rmEg==
X-Received: by 2002:a17:90a:d711:: with SMTP id
 y17mr2584911pju.97.1629363916784; 
 Thu, 19 Aug 2021 02:05:16 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id j13sm2944707pgp.29.2021.08.19.02.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 02:05:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/21] target/riscv: Use gen_arith for mulh and mulhu
Date: Wed, 18 Aug 2021 23:04:48 -1000
Message-Id: <20210819090502.428068-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210819090502.428068-1-richard.henderson@linaro.org>
References: <20210819090502.428068-1-richard.henderson@linaro.org>
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
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split out gen_mulh and gen_mulhu and use the common helper.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvm.c.inc | 40 +++++++++++--------------
 1 file changed, 18 insertions(+), 22 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvm.c.inc b/target/riscv/insn_trans/trans_rvm.c.inc
index 3d93b24c25..80552be7a3 100644
--- a/target/riscv/insn_trans/trans_rvm.c.inc
+++ b/target/riscv/insn_trans/trans_rvm.c.inc
@@ -25,20 +25,18 @@ static bool trans_mul(DisasContext *ctx, arg_mul *a)
     return gen_arith(ctx, a, EXT_NONE, tcg_gen_mul_tl);
 }
 
+static void gen_mulh(TCGv ret, TCGv s1, TCGv s2)
+{
+    TCGv discard = tcg_temp_new();
+
+    tcg_gen_muls2_tl(discard, ret, s1, s2);
+    tcg_temp_free(discard);
+}
+
 static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    TCGv source1 = tcg_temp_new();
-    TCGv source2 = tcg_temp_new();
-    gen_get_gpr(ctx, source1, a->rs1);
-    gen_get_gpr(ctx, source2, a->rs2);
-
-    tcg_gen_muls2_tl(source2, source1, source1, source2);
-
-    gen_set_gpr(ctx, a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
-    return true;
+    return gen_arith(ctx, a, EXT_NONE, gen_mulh);
 }
 
 static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
@@ -47,20 +45,18 @@ static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
     return gen_arith(ctx, a, EXT_NONE, gen_mulhsu);
 }
 
+static void gen_mulhu(TCGv ret, TCGv s1, TCGv s2)
+{
+    TCGv discard = tcg_temp_new();
+
+    tcg_gen_mulu2_tl(discard, ret, s1, s2);
+    tcg_temp_free(discard);
+}
+
 static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    TCGv source1 = tcg_temp_new();
-    TCGv source2 = tcg_temp_new();
-    gen_get_gpr(ctx, source1, a->rs1);
-    gen_get_gpr(ctx, source2, a->rs2);
-
-    tcg_gen_mulu2_tl(source2, source1, source1, source2);
-
-    gen_set_gpr(ctx, a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
-    return true;
+    return gen_arith(ctx, a, EXT_NONE, gen_mulhu);
 }
 
 static bool trans_div(DisasContext *ctx, arg_div *a)
-- 
2.25.1


