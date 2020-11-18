Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB902B78DD
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 09:36:57 +0100 (CET)
Received: from localhost ([::1]:48114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfIxT-0007BD-W7
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 03:36:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kfItC-0000ww-6U
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:32:30 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:40249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kfItA-0004mz-3c
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:32:29 -0500
Received: by mail-pg1-x52f.google.com with SMTP id t37so611905pga.7
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 00:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=KmqWH1PGMfksoIEDQlG0wfODklz3c3A9y1+TZN4fHAI=;
 b=KYNQUjWyOflsAwvF9ixV8gL7ebvkNpTBG4YopCAGas3H/hkQUDkc+9wutt3vTXc6zU
 jW1GP3yPoURKs3P1jJpk6WV7xAVqkJL8Fakit/elU8zN/Z2Lk2VgZNIXELhbAvxqNLBr
 KmyqTUFiR01KrCBe3boLmuLgfm4ASz4TijLlsbEzcmiVvSy/HxTok8m3Yua/K7dmMWFl
 PtbIYlCh13225Z01tpAF6rwtDvFKnq+vYJhgHF4Ly84dPhe8UtVs3z8wmj8hRNTbyJ8b
 VSdP7ozcombnKUKcETaZW8NyhqGQLFsdJVQ0cNWijsR/1VX+FdX1mEADeqO2KKa9YAQa
 uYDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=KmqWH1PGMfksoIEDQlG0wfODklz3c3A9y1+TZN4fHAI=;
 b=sAZ9S4NH+78hAGh6oJiU8vxlaNDkkrCn1KpwNOYgGZKmndRIxqH38JRqH3kAoMSIEY
 91Y4Rx8s0ANPPZuqQRRX7cjkmjN0gC5HQUpxFQSIisyQnUTfrJeBLpifxRz9KjN94F4X
 YnafjPwlNFJiBijYbqqlfNIug6gTGXrY79tCuFkWFMizr7KnOyHbDzUKtAdZnFtPZKkb
 0DGU8Ma9NazA3ZEcpl/wbgSDs5aQCQYePBTjM51viYjlhFE4vPw7M/NaCYWicypfUn7f
 PfmsYA/wFlr3bkSC4gEj1DiLSi8Uq1ocpVd0zsksIlIU9FsRMUHSmrVjgwRde6VMUaHK
 GzNg==
X-Gm-Message-State: AOAM53282/CpaoVSvyOPu0PQiNmrVZEXrTRsczVR/6tbDaXzTWwrur66
 iCtaln4s/jETOUi5LtSfJ83vvqRTEo4otMG0Ix8=
X-Google-Smtp-Source: ABdhPJx68QV8U8tLT8FphUtBW55m1uVzcqYCAiPEyG30CFtM/uvQTI0eLklN1cVYVZZeLy0OrTQv/Q==
X-Received: by 2002:a63:1f50:: with SMTP id q16mr6961356pgm.214.1605688346677; 
 Wed, 18 Nov 2020 00:32:26 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id y10sm1618407pjm.34.2020.11.18.00.32.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 00:32:26 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC 04/15] target/riscv: rvb: logic-with-negate
Date: Wed, 18 Nov 2020 16:29:42 +0800
Message-Id: <20201118083044.13992-5-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201118083044.13992-1-frank.chang@sifive.com>
References: <20201118083044.13992-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
---
 target/riscv/insn32.decode              |  4 +++
 target/riscv/insn_trans/trans_rvb.c.inc | 18 ++++++++++++++
 target/riscv/translate.c                | 33 +++++++++++++++++++++++++
 3 files changed, 55 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 9e70a85d6f0..29a3d4c6ebc 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -598,3 +598,7 @@ vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
 clz        011000000000 ..... 001 ..... 0010011 @r2
 ctz        011000000001 ..... 001 ..... 0010011 @r2
 pcnt       011000000010 ..... 001 ..... 0010011 @r2
+
+andn       0100000 .......... 111 ..... 0110011 @r
+orn        0100000 .......... 110 ..... 0110011 @r
+xnor       0100000 .......... 100 ..... 0110011 @r
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 6f1054e3908..be25431e990 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -35,6 +35,24 @@ static bool trans_pcnt(DisasContext *ctx, arg_pcnt *a)
     return gen_unary(ctx, a, &tcg_gen_ctpop_tl);
 }
 
+static bool trans_andn(DisasContext *ctx, arg_andn *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &gen_andn);
+}
+
+static bool trans_orn(DisasContext *ctx, arg_orn *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &gen_orn);
+}
+
+static bool trans_xnor(DisasContext *ctx, arg_xnor *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &gen_xnor);
+}
+
 /* RV64-only instructions */
 #ifdef TARGET_RISCV64
 
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 97e5899750e..254a9dca8c2 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -710,6 +710,39 @@ static bool gen_arith_div_uw(DisasContext *ctx, arg_r *a,
 
 #endif
 
+static void gen_andn(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv t;
+    t = tcg_temp_new();
+
+    tcg_gen_not_tl(t, arg2);
+    tcg_gen_and_tl(ret, arg1, t);
+
+    tcg_temp_free(t);
+}
+
+static void gen_orn(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv t;
+    t = tcg_temp_new();
+
+    tcg_gen_not_tl(t, arg2);
+    tcg_gen_or_tl(ret, arg1, t);
+
+    tcg_temp_free(t);
+}
+
+static void gen_xnor(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv t;
+    t = tcg_temp_new();
+
+    tcg_gen_not_tl(t, arg2);
+    tcg_gen_xor_tl(ret, arg1, t);
+
+    tcg_temp_free(t);
+}
+
 #ifdef TARGET_RISCV64
 
 static bool gen_cxzw(DisasContext *ctx, arg_r2 *a,
-- 
2.17.1


