Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1241D373F45
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 18:10:44 +0200 (CEST)
Received: from localhost ([::1]:37710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leK6k-00081L-OD
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 12:10:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1leK3G-0005yJ-Vo
 for qemu-devel@nongnu.org; Wed, 05 May 2021 12:07:07 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:36453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1leK3E-0002Ve-Tx
 for qemu-devel@nongnu.org; Wed, 05 May 2021 12:07:06 -0400
Received: by mail-pl1-x631.google.com with SMTP id a11so1351467plh.3
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 09:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=uHAiuWCqHaDO7Ge09WA88RZBdb7btN1C8K0x7pPYjcw=;
 b=WFLkjq9TJOXNRCdvg1zLxDrvj3H1DIUB9KurxmccUrwnVDa8EjxrbwarCDvNKN3TRj
 X5qJybbVkzpZtRg6Q7dypCOnjfGRhKe/2rbAhFWmKFJ+hk5LiM1mXCREK2/76wJNtTS6
 m2ML+trBPis96BLz42ZLwjJyMjFq6VAmasVLsLTlD9lVdjVXahH6AfP+62sCzeGvwvGU
 ReD1HGZ4kvfIYgjkqWtCfPkjJESF51M4ClArTEpE5UoH+T4N7746GLIOB3Z9GeShlOsI
 BbSdEFkyYb0IivAjevF8EFCxtvZBvMXtLlxkcvjFo0NFwT0EpQ0ta1mpV38hDLAe2WQL
 GDqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=uHAiuWCqHaDO7Ge09WA88RZBdb7btN1C8K0x7pPYjcw=;
 b=GIVuFv91rWGXEvgKnKUgp0ktabo3Ts9U9z/QxGkrMZIZfquhWUtrrR7ky2VajLsUQD
 z10adSpPpxLdHDNjr/ioaftJpQDMtDqgxV2ByF3Ws1BpBFVr9q0AcFdtalc4HBtRjyuJ
 ub8PVGuUtOfxoKNz1iuufFcvJ6I3C40Eixwnmx70/YaTSvxWBRnGcnBhGyfTY81Ml+kQ
 ZOyyVu0PHxiLyZdQunG0ydhzydTzkBeHuILFlvq2SESMIdr+edxc9AkA6QBDS6/+WlFM
 F+n0y9iQh0cEZrLWfitLtTuzvgfCrSPw7u7ZQeD5NuSW+f3rFCCJKH3tENQvF4F+3mJx
 tkQg==
X-Gm-Message-State: AOAM530qbodcnrpZH+hD1LXtYV389GIiiKQhnYnhc5SAjQe5Ze4owOAT
 pr7Ba9PDB+x7JzfsCvxCmrHnS8pAz0kTd+v7
X-Google-Smtp-Source: ABdhPJwFBgHQPh6AxcVlFI5c/nh1ZmLksn7C1Ko7k1J202ktVLst6Q9QmHORAinl4ss0h8iRcmvvpA==
X-Received: by 2002:a17:902:dac2:b029:ec:7fcb:1088 with SMTP id
 q2-20020a170902dac2b02900ec7fcb1088mr32646110plx.65.1620230823259; 
 Wed, 05 May 2021 09:07:03 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id js6sm35877977pjb.0.2021.05.05.09.07.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 09:07:02 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v6 10/17] target/riscv: rvb: shift ones
Date: Thu,  6 May 2021 00:06:11 +0800
Message-Id: <20210505160620.15723-11-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210505160620.15723-1-frank.chang@sifive.com>
References: <20210505160620.15723-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x631.google.com
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
 target/riscv/insn32.decode              |  8 ++++
 target/riscv/insn_trans/trans_rvb.c.inc | 52 +++++++++++++++++++++++++
 target/riscv/translate.c                | 14 +++++++
 3 files changed, 74 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 433b601b934..6bc9bbae9e0 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -680,11 +680,15 @@ bset       0010100 .......... 001 ..... 0110011 @r
 bclr       0100100 .......... 001 ..... 0110011 @r
 binv       0110100 .......... 001 ..... 0110011 @r
 bext       0100100 .......... 101 ..... 0110011 @r
+slo        0010000 .......... 001 ..... 0110011 @r
+sro        0010000 .......... 101 ..... 0110011 @r
 
 bseti      00101. ........... 001 ..... 0010011 @sh
 bclri      01001. ........... 001 ..... 0010011 @sh
 binvi      01101. ........... 001 ..... 0010011 @sh
 bexti      01001. ........... 101 ..... 0010011 @sh
+sloi       00100. ........... 001 ..... 0010011 @sh
+sroi       00100. ........... 101 ..... 0010011 @sh
 
 # *** RV64B Standard Extension (in addition to RV32B) ***
 clzw       0110000 00000 ..... 001 ..... 0011011 @r2
@@ -697,7 +701,11 @@ bsetw      0010100 .......... 001 ..... 0111011 @r
 bclrw      0100100 .......... 001 ..... 0111011 @r
 binvw      0110100 .......... 001 ..... 0111011 @r
 bextw      0100100 .......... 101 ..... 0111011 @r
+slow       0010000 .......... 001 ..... 0111011 @r
+srow       0010000 .......... 101 ..... 0111011 @r
 
 bsetiw     0010100 .......... 001 ..... 0011011 @sh5
 bclriw     0100100 .......... 001 ..... 0011011 @sh5
 binviw     0110100 .......... 001 ..... 0011011 @sh5
+sloiw      0010000 .......... 001 ..... 0011011 @sh5
+sroiw      0010000 .......... 101 ..... 0011011 @sh5
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 69e5af44a18..28640322c43 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -155,6 +155,30 @@ static bool trans_bexti(DisasContext *ctx, arg_bexti *a)
     return gen_shifti(ctx, a, gen_bext);
 }
 
+static bool trans_slo(DisasContext *ctx, arg_slo *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shift(ctx, a, gen_slo);
+}
+
+static bool trans_sloi(DisasContext *ctx, arg_sloi *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shifti(ctx, a, gen_slo);
+}
+
+static bool trans_sro(DisasContext *ctx, arg_sro *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shift(ctx, a, gen_sro);
+}
+
+static bool trans_sroi(DisasContext *ctx, arg_sroi *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shifti(ctx, a, gen_sro);
+}
+
 static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
 {
     REQUIRE_64BIT(ctx);
@@ -238,3 +262,31 @@ static bool trans_bextw(DisasContext *ctx, arg_bextw *a)
     REQUIRE_EXT(ctx, RVB);
     return gen_shiftw(ctx, a, gen_bext);
 }
+
+static bool trans_slow(DisasContext *ctx, arg_slow *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftw(ctx, a, gen_slo);
+}
+
+static bool trans_sloiw(DisasContext *ctx, arg_sloiw *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftiw(ctx, a, gen_slo);
+}
+
+static bool trans_srow(DisasContext *ctx, arg_srow *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftw(ctx, a, gen_sro);
+}
+
+static bool trans_sroiw(DisasContext *ctx, arg_sroiw *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftiw(ctx, a, gen_sro);
+}
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index e12240d1255..088cf9f7678 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -613,6 +613,20 @@ static void gen_bext(TCGv ret, TCGv arg1, TCGv shamt)
     tcg_gen_andi_tl(ret, ret, 1);
 }
 
+static void gen_slo(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    tcg_gen_not_tl(ret, arg1);
+    tcg_gen_shl_tl(ret, ret, arg2);
+    tcg_gen_not_tl(ret, ret);
+}
+
+static void gen_sro(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    tcg_gen_not_tl(ret, arg1);
+    tcg_gen_shr_tl(ret, ret, arg2);
+    tcg_gen_not_tl(ret, ret);
+}
+
 static void gen_ctzw(TCGv ret, TCGv arg1)
 {
     tcg_gen_ori_tl(ret, arg1, (target_ulong)MAKE_64BIT_MASK(32, 32));
-- 
2.17.1


