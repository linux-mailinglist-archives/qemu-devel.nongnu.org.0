Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C942DB8BE
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 03:05:25 +0100 (CET)
Received: from localhost ([::1]:35372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpMBw-0000Ad-Go
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 21:05:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kpM9O-0006eM-FA
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 21:02:46 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:36380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kpM9I-0000vv-1j
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 21:02:46 -0500
Received: by mail-pl1-x634.google.com with SMTP id j1so12064743pld.3
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 18:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=6kltOaUaQM8Up9UZKk3VgaYZ0eQi7w4XGfhC/ez/hIw=;
 b=YoeInQIkyQjd7attGxhU2baIz54KpV1ZiDON/33oD/KYuHvbEj54WJgP5TJaBoKBcX
 54E5vrd+6kZr3uD8nIJPxo/3HrRsVh5+H7AEZdTE3rUG0GwJ552to3PzxHRYDBRZn1rK
 SHBqgxKvTtMlLE75zXyKknN5pWOKz+gHe7SkxdhfKsPRiA4UBvTC4gTe44vSLWV2EihT
 h5Mhl4snhbaXnrIVo0mrPxJ7cfrb4ZiHwEQNF3MCeXVsNJnvf0C8rat/19wh8hHUmUXi
 H/odmSamYr7p6K5+bY6sAxD8QecgBDlfhTBWfn2QhMhNtl3D0XB8JwjupuX735D0ixZV
 5aIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=6kltOaUaQM8Up9UZKk3VgaYZ0eQi7w4XGfhC/ez/hIw=;
 b=SXLNeEb92inaWxawev71EJZkn0qJRWkwwLFtr08XPuIPKextlAOo5bThXoHZnIr1EQ
 WhrVxpNioHdGkjGiboXu2WGnUYZDAq39uM5XHCk86Js97CPoWYu5QoMgBUp7/ayyXX3/
 sxppOOA2+L0V21mhX0asEwuk04YpsnP9DeL5T/8q68YdVGX6RcoK4diw9JXG/XMOI5/k
 JhxqAPTDcnkOkfXD6OKWt6yWp/7m/iAQ6rT5EMKzJ4nQYAe+BJvRYJ61retfjlSXYykN
 SR5FcDc6krlSTsglIcAKMyaEkxgBy4bhkSVB+vRzZAkHlNmDbF8Ov28+YMAe3bi/bO2k
 zUTQ==
X-Gm-Message-State: AOAM530rVJpUXkxLOUL2cHT0TtOsqiR0c2mWRE23EvgTwqEbZo3Uu9z4
 jWvEnHSOnJpNLm4DJ4NvEga91zmSMvI1Et2O8dM=
X-Google-Smtp-Source: ABdhPJydicypKK/dVD5sYXiJb7ZareXrDtpM9mqy7q2Ah9ncRXoz4j+w0zEaaP6DcJULoNLkLRelyg==
X-Received: by 2002:a17:90a:ad82:: with SMTP id
 s2mr1161392pjq.167.1608084157339; 
 Tue, 15 Dec 2020 18:02:37 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id a13sm289150pfr.59.2020.12.15.18.02.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 18:02:36 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC v2 05/15] target/riscv: rvb: pack two words into one register
Date: Wed, 16 Dec 2020 10:01:30 +0800
Message-Id: <20201216020150.3157-6-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201216020150.3157-1-frank.chang@sifive.com>
References: <20201216020150.3157-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x634.google.com
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
 target/riscv/insn32-64.decode           |  3 ++
 target/riscv/insn32.decode              |  3 ++
 target/riscv/insn_trans/trans_rvb.c.inc | 30 ++++++++++++++++++
 target/riscv/translate.c                | 41 +++++++++++++++++++++++++
 4 files changed, 77 insertions(+)

diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index 00c56a93151..fd7e0492372 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -91,3 +91,6 @@ hsv_d     0110111  .....   ..... 100 00000 1110011 @r2_s
 clzw       0110000 00000 ..... 001 ..... 0011011 @r2
 ctzw       0110000 00001 ..... 001 ..... 0011011 @r2
 pcntw      0110000 00010 ..... 001 ..... 0011011 @r2
+
+packw      0000100 .......... 100 ..... 0111011 @r
+packuw     0100100 .......... 100 ..... 0111011 @r
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 85421dccb99..c337aed8ca3 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -602,3 +602,6 @@ pcnt       011000 000010 ..... 001 ..... 0010011 @r2
 andn       0100000 .......... 111 ..... 0110011 @r
 orn        0100000 .......... 110 ..... 0110011 @r
 xnor       0100000 .......... 100 ..... 0110011 @r
+pack       0000100 .......... 100 ..... 0110011 @r
+packu      0100100 .......... 100 ..... 0110011 @r
+packh      0000100 .......... 111 ..... 0110011 @r
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 6016ceefd64..3da233047a9 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -53,6 +53,24 @@ static bool trans_xnor(DisasContext *ctx, arg_xnor *a)
     return gen_arith(ctx, a, &gen_xnor);
 }
 
+static bool trans_pack(DisasContext *ctx, arg_pack *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &gen_pack);
+}
+
+static bool trans_packu(DisasContext *ctx, arg_packu *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &gen_packu);
+}
+
+static bool trans_packh(DisasContext *ctx, arg_packh *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &gen_packh);
+}
+
 /* RV64-only instructions */
 #ifdef TARGET_RISCV64
 
@@ -74,4 +92,16 @@ static bool trans_pcntw(DisasContext *ctx, arg_pcntw *a)
     return gen_unary(ctx, a, &gen_pcntw);
 }
 
+static bool trans_packw(DisasContext *ctx, arg_packw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &gen_packw);
+}
+
+static bool trans_packuw(DisasContext *ctx, arg_packuw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &gen_packuw);
+}
+
 #endif
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index fb0b2fd0728..7b427a9caec 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -732,6 +732,30 @@ static void gen_xnor(TCGv ret, TCGv arg1, TCGv arg2)
     tcg_temp_free(t);
 }
 
+static void gen_pack(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    tcg_gen_deposit_tl(ret, arg1, arg2,
+                       TARGET_LONG_BITS / 2,
+                       TARGET_LONG_BITS / 2);
+}
+
+static void gen_packu(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv t = tcg_temp_new();
+    tcg_gen_shri_tl(t, arg1, TARGET_LONG_BITS / 2);
+    tcg_gen_deposit_tl(ret, arg2, t, 0, TARGET_LONG_BITS / 2);
+    tcg_temp_free(t);
+}
+
+static void gen_packh(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv t = tcg_temp_new();
+    tcg_gen_ext8u_tl(t, arg2);
+    tcg_gen_deposit_tl(ret, arg1, t, 8, TARGET_LONG_BITS - 8);
+    tcg_temp_free(t);
+}
+
+
 #ifdef TARGET_RISCV64
 
 static void gen_ctzw(TCGv ret, TCGv arg1)
@@ -753,6 +777,23 @@ static void gen_pcntw(TCGv ret, TCGv arg1)
     tcg_gen_ctpop_tl(ret, arg1);
 }
 
+static void gen_packw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv t = tcg_temp_new();
+    tcg_gen_ext16s_i64(t, arg2);
+    tcg_gen_deposit_i64(ret, arg1, t, 16, 48);
+    tcg_temp_free(t);
+}
+
+static void gen_packuw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv t = tcg_temp_new();
+    tcg_gen_shri_i64(t, arg1, 16);
+    tcg_gen_deposit_i64(ret, arg2, t, 0, 16);
+    tcg_gen_ext32s_i64(ret, ret);
+    tcg_temp_free(t);
+}
+
 #endif
 
 static bool gen_arith(DisasContext *ctx, arg_r *a,
-- 
2.17.1


