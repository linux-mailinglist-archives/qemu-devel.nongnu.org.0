Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CE92B78F9
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 09:43:53 +0100 (CET)
Received: from localhost ([::1]:44410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfJ4C-0000Oz-C0
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 03:43:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kfItt-0002dN-Es
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:33:13 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:42715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kfItq-0004sR-Bd
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:33:13 -0500
Received: by mail-pg1-x52c.google.com with SMTP id i13so687448pgm.9
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 00:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=6L4v4SPsDem5ox91pLXTcrxEfX1EaDKKRe7gRDU0tDo=;
 b=KwBmDOB94CTXqqzBSVrkVwVkF57ZmcbY8eNbWCk81RAFzTiPWxE8Q1fPlP77lOIhBW
 nY53+ad9nPSGN/NkrwYQsPEaGCXLV7JQKmCrLTU6DoeL+xMWRAN3fHtblRQkYkZTNyF1
 2URdIeTz+PrxBCQWnOCGSxLLtIhwx7/A4PkEGIGQgVikIFYibdEqZiy2ggG4mbu3UQee
 25wX5CwC7F1rQL+Ox7tK7k43eqJ4HzzzaysDU2n0RGJQSpGzSNcuv0KfORnHj3EsZVfx
 aiv29z4mSf6MhBB9kkDdi8mePc2N3Q5Y5dWatPMcYCXkTA5E8CRYHE3pMus41M44aE0B
 ih/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=6L4v4SPsDem5ox91pLXTcrxEfX1EaDKKRe7gRDU0tDo=;
 b=OdYcH++f5UmCDa8vA62S8+PGA7muj3TtcwnyARhyHaaU4tmNuPYGo50qvN5cNkUe/u
 k1OgG3eOzBKyJ5UCQqMEllMFS2v7qRPMiH6mWeXQqiS5CNQGTOg9eJ5KW17LBtIkK82w
 YJ+xSBcRIc4eRQI9gAB+33NHskNkW8s+EtI2KFMiXJbS7ZPRoT+0xRi7nq4FvOM42bJX
 OSYgv/qJ6/6KRnDAe4TZAuZqhWJY9CF4CuJFrqyaZjmckXl00HskShiHLcGNS1+Ppv/t
 Mrq1a6kiWz+68OGTbbxCKLfOecDknFog/f89F1fLshORZUjX6MSOvPfT1AevinfVULiO
 L4wg==
X-Gm-Message-State: AOAM530Gc4KwsC8dk5jsZU56Qz2fjMm51tw8szI1FIYe7LWKsj2ZeZLY
 pEo02gFNQh8vgnUFX5Eiu4n4JPwLEFkbVM/i0H8=
X-Google-Smtp-Source: ABdhPJwgfpFWO8i7Wd3ziYp+TS/DPx8QWJjSa3ZTrjakdOi5N6Xy+5lR5VbSOUlU41brOWx6psBDFQ==
X-Received: by 2002:a62:1b58:0:b029:18a:df98:24fa with SMTP id
 b85-20020a621b580000b029018adf9824famr3405320pfb.25.1605688388823; 
 Wed, 18 Nov 2020 00:33:08 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id y10sm1618407pjm.34.2020.11.18.00.33.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 00:33:08 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC 13/15] target/riscv: rvb: address calculation
Date: Wed, 18 Nov 2020 16:29:51 +0800
Message-Id: <20201118083044.13992-14-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201118083044.13992-1-frank.chang@sifive.com>
References: <20201118083044.13992-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52c.google.com
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
Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32-64.decode           |  3 +++
 target/riscv/insn32.decode              |  3 +++
 target/riscv/insn_trans/trans_rvb.c.inc | 23 +++++++++++++++++
 target/riscv/translate.c                | 33 +++++++++++++++++++++++++
 4 files changed, 62 insertions(+)

diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index 8e6ec4750f3..42bafbc03a0 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -104,6 +104,9 @@ rorw       0110000 .......... 101 ..... 0111011 @r
 rolw       0110000 .......... 001 ..... 0111011 @r
 grevw      0110100 .......... 101 ..... 0111011 @r
 gorcw      0010100 .......... 101 ..... 0111011 @r
+sh1addu_w  0010000 .......... 010 ..... 0111011 @r
+sh2addu_w  0010000 .......... 100 ..... 0111011 @r
+sh3addu_w  0010000 .......... 110 ..... 0111011 @r
 
 sbsetiw    0010100 .......... 001 ..... 0011011 @sh5
 sbclriw    0100100 .......... 001 ..... 0011011 @sh5
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 76ba0698511..e23a378dec4 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -621,6 +621,9 @@ ror        0110000 .......... 101 ..... 0110011 @r
 rol        0110000 .......... 001 ..... 0110011 @r
 grev       0110100 .......... 101 ..... 0110011 @r
 gorc       0010100 .......... 101 ..... 0110011 @r
+sh1add     0010000 .......... 010 ..... 0110011 @r
+sh2add     0010000 .......... 100 ..... 0110011 @r
+sh3add     0010000 .......... 110 ..... 0110011 @r
 
 sbseti     001010 ........... 001 ..... 0010011 @sh
 sbclri     010010 ........... 001 ..... 0010011 @sh
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index eade85125c5..31d791236d9 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -246,6 +246,17 @@ static bool trans_gorci(DisasContext *ctx, arg_gorci *a)
     return gen_arith_shamt_tl(ctx, a, &gen_gorc);
 }
 
+#define GEN_TRANS_SHADD(SHAMT)                                             \
+static bool trans_sh##SHAMT##add(DisasContext *ctx, arg_sh##SHAMT##add *a) \
+{                                                                          \
+    REQUIRE_EXT(ctx, RVB);                                                 \
+    return gen_arith(ctx, a, &gen_sh##SHAMT##add);                         \
+}
+
+GEN_TRANS_SHADD(1)
+GEN_TRANS_SHADD(2)
+GEN_TRANS_SHADD(3)
+
 /* RV64-only instructions */
 #ifdef TARGET_RISCV64
 
@@ -411,4 +422,16 @@ static bool trans_gorciw(DisasContext *ctx, arg_gorciw *a)
     return gen_arith_shamt_tl(ctx, a, &gen_gorcw);
 }
 
+#define GEN_TRANS_SHADDU_W(SHAMT)                             \
+static bool trans_sh##SHAMT##addu_w(DisasContext *ctx,        \
+                                    arg_sh##SHAMT##addu_w *a) \
+{                                                             \
+    REQUIRE_EXT(ctx, RVB);                                    \
+    return gen_arith(ctx, a, &gen_sh##SHAMT##addu_w);         \
+}
+
+GEN_TRANS_SHADDU_W(1)
+GEN_TRANS_SHADDU_W(2)
+GEN_TRANS_SHADDU_W(3)
+
 #endif
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 566e60d0d20..584550a9db2 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -968,6 +968,21 @@ static void gen_gorc(TCGv ret, TCGv arg1, TCGv arg2)
     tcg_temp_free(shamt);
 }
 
+#define GEN_SHADD(SHAMT)                                       \
+static void gen_sh##SHAMT##add(TCGv ret, TCGv arg1, TCGv arg2) \
+{                                                              \
+    TCGv t;                                                    \
+    t = tcg_temp_new();                                        \
+                                                               \
+    tcg_gen_shli_tl(t, arg1, SHAMT);                           \
+    tcg_gen_add_tl(ret, t, arg2);                              \
+                                                               \
+    tcg_temp_free(t);                                          \
+}
+
+GEN_SHADD(1)
+GEN_SHADD(2)
+GEN_SHADD(3)
 
 #ifdef TARGET_RISCV64
 
@@ -1219,6 +1234,24 @@ static void gen_gorcw(TCGv ret, TCGv arg1, TCGv arg2)
     tcg_temp_free(shamt);
 }
 
+#define GEN_SHADDU_W(SHAMT)                                       \
+static void gen_sh##SHAMT##addu_w(TCGv ret, TCGv arg1, TCGv arg2) \
+{                                                                 \
+    TCGv t;                                                       \
+    t = tcg_temp_new();                                           \
+                                                                  \
+    tcg_gen_ext32u_tl(t, arg1);                                   \
+                                                                  \
+    tcg_gen_shli_tl(t, t, SHAMT);                                 \
+    tcg_gen_add_tl(ret, t, arg2);                                 \
+                                                                  \
+    tcg_temp_free(t);                                             \
+}
+
+GEN_SHADDU_W(1)
+GEN_SHADDU_W(2)
+GEN_SHADDU_W(3)
+
 #endif
 
 static bool gen_arith(DisasContext *ctx, arg_r *a,
-- 
2.17.1


