Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E693C1E8F
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 06:42:45 +0200 (CEST)
Received: from localhost ([::1]:39564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1iLb-0003kR-Q1
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 00:42:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1i62-0006X7-4d
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 00:26:38 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:39700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1i5k-0001Z1-4b
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 00:26:37 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 p14-20020a17090ad30eb02901731c776526so5197217pju.4
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 21:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lbT7rR4xAZ+TINcw0n3vg8MxSKcWXYHtQH2vV0PJUA8=;
 b=GCNmFCvx+2bFPvSIENUpcshqAYTMWkdpmFvPDuO0pMn1alP4Zqw6TuIPTiUEBdEWFC
 HchAPqDg3fgVLZrcMKG1N9h6N+y0WYGSaJ1gc1g55NucRmhPqXuKe2h6Jrf7o7evhhQn
 VhdQ4Cv+MezTroeIC9vtIFwmLu8MPU8vV2a4YqJYYNQTSDXbvOaoAiiB240sxn3k33UE
 qJQlu4UfajGAh4MuupnzoAq7zYlVUglJU1RTiiYunIv5dlI8BqzMLlevDzHoXWSKwunQ
 nL6y8Fik8JX3ZWo7CSn17kTzV8jQl29cHgn8dmHZ9qPBQ/rsdrUoS/bmozp3axbcUtfx
 Qoqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lbT7rR4xAZ+TINcw0n3vg8MxSKcWXYHtQH2vV0PJUA8=;
 b=Rwdn10xjatUkGOsTtD0oErhccKMVS7UpyNherL/Z0wGy3YUvcYQqjQ4gi/Bm9l/S+6
 Hu8ihRO8U+/4rlHErmv7kzDo7oLOOMoP02xgnvvuWZfRvi3dYyGra0yjISGNRKUxPyh+
 4Q+tTwFsSb5xdD6dBYUO770OwDccEE5hM7SG8JdWHCjmEIU+/XU86ExXtT+o3QpX3OA9
 S+FDEqbFYm+lk7yHVsc91m1krPi7aNp7nWkuloi6kfkybuG8iNp9eTs6w3frbu3VMDRY
 jChm1fhfRb3cFPHsedP+tEgV+cyMwJcx3qzcD9bo3Ulkl3mVYdgbHGtjMqWEsTt4KKtu
 dTZA==
X-Gm-Message-State: AOAM5320on4Bnte0F2HuSXMuz00nWFpSmbVbQIvuE0iizEDfchefI0jb
 E3CxkaMWIdBWTxeq2Ez24Dd5Ugyu6RFt/w==
X-Google-Smtp-Source: ABdhPJymI9HTMxv336TjQ2Je1aq8eBSSvFDhp8WdCPeDVJClN8M7c8W0Ys9mS8d6cMXwn/JCzcUspg==
X-Received: by 2002:a17:90a:4e4a:: with SMTP id
 t10mr35752021pjl.173.1625804778835; 
 Thu, 08 Jul 2021 21:26:18 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id y16sm4406727pfe.70.2021.07.08.21.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 21:26:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/17] target/riscv: Use gen_arith for mulh and mulhu
Date: Thu,  8 Jul 2021 21:26:06 -0700
Message-Id: <20210709042608.883256-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210709042608.883256-1-richard.henderson@linaro.org>
References: <20210709042608.883256-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

Split out gen_mulh and gen_mulhu and use the common helper.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c                | 16 ++++++++++++++++
 target/riscv/insn_trans/trans_rvm.c.inc | 24 ++----------------------
 2 files changed, 18 insertions(+), 22 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 6ad40e43b0..8ff75a5798 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -235,6 +235,22 @@ static TCGv gpr_dst(DisasContext *ctx, int reg_num)
     return cpu_gpr[reg_num];
 }
 
+static void gen_mulh(TCGv ret, TCGv s1, TCGv s2)
+{
+    TCGv discard = tcg_temp_new();
+
+    tcg_gen_muls2_tl(discard, ret, s1, s2);
+    tcg_temp_free(discard);
+}
+
+static void gen_mulhu(TCGv ret, TCGv s1, TCGv s2)
+{
+    TCGv discard = tcg_temp_new();
+
+    tcg_gen_mulu2_tl(discard, ret, s1, s2);
+    tcg_temp_free(discard);
+}
+
 static void gen_mulhsu(TCGv ret, TCGv arg1, TCGv arg2)
 {
     TCGv rl = tcg_temp_new();
diff --git a/target/riscv/insn_trans/trans_rvm.c.inc b/target/riscv/insn_trans/trans_rvm.c.inc
index 10ecc456fc..34220b824d 100644
--- a/target/riscv/insn_trans/trans_rvm.c.inc
+++ b/target/riscv/insn_trans/trans_rvm.c.inc
@@ -28,17 +28,7 @@ static bool trans_mul(DisasContext *ctx, arg_mul *a)
 static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    TCGv source1 = tcg_temp_new();
-    TCGv source2 = tcg_temp_new();
-    gen_get_gpr(source1, a->rs1);
-    gen_get_gpr(source2, a->rs2);
-
-    tcg_gen_muls2_tl(source2, source1, source1, source2);
-
-    gen_set_gpr(a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
-    return true;
+    return gen_arith(ctx, a, gen_mulh);
 }
 
 static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
@@ -50,17 +40,7 @@ static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
 static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    TCGv source1 = tcg_temp_new();
-    TCGv source2 = tcg_temp_new();
-    gen_get_gpr(source1, a->rs1);
-    gen_get_gpr(source2, a->rs2);
-
-    tcg_gen_mulu2_tl(source2, source1, source1, source2);
-
-    gen_set_gpr(a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
-    return true;
+    return gen_arith(ctx, a, gen_mulhu);
 }
 
 static bool trans_div(DisasContext *ctx, arg_div *a)
-- 
2.25.1


