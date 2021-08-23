Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 477EC3F51A4
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 22:02:40 +0200 (CEST)
Received: from localhost ([::1]:36730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIG9X-0003xR-B6
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 16:02:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIG2p-00062w-Nd
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 15:55:43 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:34532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIG2l-00036F-01
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 15:55:43 -0400
Received: by mail-pl1-x633.google.com with SMTP id j2so6401213pll.1
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 12:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZtzgxMrimjDaolvyiQ4xom5y79yzDTt02qA1Y6+PMUo=;
 b=dzGccQw1okVr4STQRfIPzRwzKR8tCS4rlgwZKE7uCYczzsDiOqVb71cyM8nRVsOCyJ
 pYbavkJgECi0PKlSc3Q088/xl3zBh99XXA395X2ebAmiBx38fJVy/Rfin6ODgTETRdVE
 1Gob8sEJzgKABgOUC5k2W+iu39iWeFZPiRSIoEPndbGmJkN07EDILjvvMHGG8eHdZxPx
 ZbPxofocJITzTQQN6vlXG7bKdPHdCNlXLREGC4zSJuWrpTbAY8FNVCSeH10Lp9wy7Bey
 U2zAO4JI2jadAxWmBjErgoZw8dyfm0Ay9HCoj7QRCjBhvy+sDUDnE1yNfAz9hMmcTLiJ
 ik9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZtzgxMrimjDaolvyiQ4xom5y79yzDTt02qA1Y6+PMUo=;
 b=gFSAT5FgQVuCDHPFsJ9oIbygbdRilzKiwNMYBc18E8JYcObHAhFhWl86wMGpDVLw83
 AXVtLusizbU7klmQSyhRTG3HNhyuuO7UOwWaEsh3/Dj8D2aBDNXAnsgUxbxikpIjLH7D
 ttR6oMiIE/eBG5DlcRl7rNyZjJtbs7DPBOW4eCJ7eG834V3/wrr0cMTrz7py28kVKNk4
 PdUmv1+U5nolIJNV5lK6nJG40RKov6qwz7NWOOdl/mD/yZS6NJYcctzExHO+7Zg/r4uU
 IcOutBtbz+3BYRLAi66dbkRkHwPZgjiV50CvPKjdyb3a0Dib6+x1WtXTGC25DzpO6pIE
 FkBQ==
X-Gm-Message-State: AOAM533H6ywy7GJhlFNoqRdqGhNWKnY5P28jqaVUxwnU33R2pj2tqFVZ
 TJyyp0h5O7BXSLDTzwNs0UZBfNPjFVr93A==
X-Google-Smtp-Source: ABdhPJw5EKcjEJHuqb26toi8CfDOwwNO5ncOhTsqe7GJL4MvDaKmKxwk7uwT584HyXTUjTZhlE+wcA==
X-Received: by 2002:a17:90b:23d1:: with SMTP id
 md17mr233092pjb.105.1629748537654; 
 Mon, 23 Aug 2021 12:55:37 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v15sm16685078pff.105.2021.08.23.12.55.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 12:55:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 08/24] target/riscv: Use gen_arith for mulh and mulhu
Date: Mon, 23 Aug 2021 12:55:13 -0700
Message-Id: <20210823195529.560295-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823195529.560295-1-richard.henderson@linaro.org>
References: <20210823195529.560295-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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


