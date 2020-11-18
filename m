Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B1C2B78F1
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 09:40:13 +0100 (CET)
Received: from localhost ([::1]:34582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfJ0e-0004lg-Rf
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 03:40:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kfIte-0002Bz-DR
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:32:58 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:51048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kfItb-0004qK-EO
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:32:58 -0500
Received: by mail-pj1-x102e.google.com with SMTP id js21so675921pjb.0
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 00:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=veRygLEh+ZMTL9IPwGFw2549Ey6aVX1s6xT0idS+Iow=;
 b=eb7i3oGzGTxGpDw7pJzfc5iDZB3L6kmoPPgf1VtSlXhk5aRJEU0965ASUWtCt7rUJV
 9Ep2m+MzhpV8LHQtoPLCr84ioOojOO8WWyLLUAR3831JNw/N4fXvOY5rRb821KZxnxu0
 ezxoh+dzWzhjubBahOnIa9eN6bINTxSSFZOshoDl0/UhvczssqMCAyZj7ZWEwfv3K39d
 rwCPQMTEfW+PQgAQ1HsDcIsv65kwbzBu13ToZn1L4smOTI7RCqh2ue/pATPnpSVCSlZg
 gMQrk78WmWrB9QnIxVFci3sCCAUOKbwt3Mdoy8axvppDtmiKeovHFad9Oe/cC02ocblv
 66+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=veRygLEh+ZMTL9IPwGFw2549Ey6aVX1s6xT0idS+Iow=;
 b=kLESdCVg4viOz5ZbfKPQ42KiiQFaZx3TxrMDWVhgovS4HCNsDAwmQMjfopFpOKhRcD
 NH0jCjPEtwLTcukjjij/WKhezcu46Zo2eXNoDkbIYv+l1YVZ6O6TRfD1Rb4OMlAbULNp
 x2AE/uCBvYMSiqGR4c/Be6dOg0AoB28bJ1InoliimO7v2Uva7eq6KTY8jXYIZGKBrOEL
 GKy83Ctxz6+IHzXJj5vaDcrU9+nROtOFCBYoJl48B83ks6ZAZJOuM2liu4s8ewBt8aHs
 2MuK4PFy8tFpQNQKeFIpK6v2UhmaZyq0xc2HORvbrdI+8IERqdQIdYKSoSTJYDW96hgZ
 36PQ==
X-Gm-Message-State: AOAM532q5IjYUlTA2H1NfaM0QDhCcNj1l5W0nJH4prx0R4/VUVGB7qpm
 8Twjs/OnN2QpIm2oe09jl3H5dveHZzb3utyU518=
X-Google-Smtp-Source: ABdhPJyX6dCtcP5Xv+k5zXptwc+g8RYrXFPU9ETSC/NhoCF2ImR93eksGK9jHLtbPxVybI06evZsQQ==
X-Received: by 2002:a17:90a:de86:: with SMTP id
 n6mr2914597pjv.214.1605688373938; 
 Wed, 18 Nov 2020 00:32:53 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id y10sm1618407pjm.34.2020.11.18.00.32.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 00:32:53 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC 10/15] target/riscv: rvb: rotate (left/right)
Date: Wed, 18 Nov 2020 16:29:48 +0800
Message-Id: <20201118083044.13992-11-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201118083044.13992-1-frank.chang@sifive.com>
References: <20201118083044.13992-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102e.google.com
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
 target/riscv/insn32-64.decode           |  3 ++
 target/riscv/insn32.decode              |  3 ++
 target/riscv/insn_trans/trans_rvb.c.inc | 54 +++++++++++++++++++++++++
 target/riscv/translate.c                | 48 ++++++++++++++++++++++
 4 files changed, 108 insertions(+)

diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index cc6b7d63774..a1a4b12f7ca 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -100,9 +100,12 @@ sbinvw     0110100 .......... 001 ..... 0111011 @r
 sbextw     0100100 .......... 101 ..... 0111011 @r
 slow       0010000 .......... 001 ..... 0111011 @r
 srow       0010000 .......... 101 ..... 0111011 @r
+rorw       0110000 .......... 101 ..... 0111011 @r
+rolw       0110000 .......... 001 ..... 0111011 @r
 
 sbsetiw    0010100 .......... 001 ..... 0011011 @sh5
 sbclriw    0100100 .......... 001 ..... 0011011 @sh5
 sbinviw    0110100 .......... 001 ..... 0011011 @sh5
 sloiw      0010000 .......... 001 ..... 0011011 @sh5
 sroiw      0010000 .......... 101 ..... 0011011 @sh5
+roriw      0110000 .......... 101 ..... 0011011 @sh5
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 6e3eef84144..01b8ebc4bee 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -617,6 +617,8 @@ sbinv      0110100 .......... 001 ..... 0110011 @r
 sbext      0100100 .......... 101 ..... 0110011 @r
 slo        0010000 .......... 001 ..... 0110011 @r
 sro        0010000 .......... 101 ..... 0110011 @r
+ror        0110000 .......... 101 ..... 0110011 @r
+rol        0110000 .......... 001 ..... 0110011 @r
 
 sbseti     001010 ........... 001 ..... 0010011 @sh
 sbclri     010010 ........... 001 ..... 0010011 @sh
@@ -624,3 +626,4 @@ sbinvi     011010 ........... 001 ..... 0010011 @sh
 sbexti     010010 ........... 101 ..... 0010011 @sh
 sloi       001000 ........... 001 ..... 0010011 @sh
 sroi       001000 ........... 101 ..... 0010011 @sh
+rori       011000 ........... 101 ..... 0010011 @sh
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 4c93c5aab8b..ba8734203ac 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -189,7 +189,29 @@ static bool trans_sroi(DisasContext *ctx, arg_sroi *a)
     return gen_arith_shamt_tl(ctx, a, &gen_sro);
 }
 
+static bool trans_ror(DisasContext *ctx, arg_ror *a)
 {
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &tcg_gen_rotr_tl);
+}
+
+static bool trans_rori(DisasContext *ctx, arg_rori *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+
+    if (a->shamt >= TARGET_LONG_BITS) {
+        return false;
+    }
+
+    return gen_arith_shamt_tl(ctx, a, &tcg_gen_rotr_tl);
+}
+
+static bool trans_rol(DisasContext *ctx, arg_rol *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &tcg_gen_rotl_tl);
+}
+
 /* RV64-only instructions */
 #ifdef TARGET_RISCV64
 
@@ -289,4 +311,36 @@ static bool trans_sroiw(DisasContext *ctx, arg_sroiw *a)
     return gen_arith_shamt_tl(ctx, a, &gen_srow);
 }
 
+static bool trans_rorw(DisasContext *ctx, arg_rorw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &gen_rorw);
+}
+
+static bool trans_roriw(DisasContext *ctx, arg_roriw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+
+    if (a->shamt >= 32) {
+        return false;
+    }
+
+    if (a->shamt == 0) {
+        TCGv t = tcg_temp_new();
+        gen_get_gpr(t, a->rs1);
+        tcg_gen_ext32s_tl(t, t);
+        gen_set_gpr(a->rd, t);
+        tcg_temp_free(t);
+        return true;
+    }
+
+    return gen_arith_shamt_tl(ctx, a, &gen_rorw);
+}
+
+static bool trans_rolw(DisasContext *ctx, arg_rolw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &gen_rolw);
+}
+
 #endif
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 8972e247bd7..68870bd9202 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1092,6 +1092,54 @@ static void gen_srow(TCGv ret, TCGv arg1, TCGv arg2)
     tcg_temp_free(t);
 }
 
+static void gen_rorw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv shamt;
+    TCGv_i32 t1, t2;
+    shamt = tcg_temp_new();
+    t1 = tcg_temp_new_i32();
+    t2 = tcg_temp_new_i32();
+
+    gen_sbopw_shamt(shamt, arg2);
+
+    /* truncate to 32-bits */
+    tcg_gen_trunc_tl_i32(t1, arg1);
+    tcg_gen_trunc_tl_i32(t2, shamt);
+
+    tcg_gen_rotr_i32(t1, t1, t2);
+
+    /* sign-extend 64-bits */
+    tcg_gen_ext_i32_tl(ret, t1);
+
+    tcg_temp_free(shamt);
+    tcg_temp_free_i32(t1);
+    tcg_temp_free_i32(t2);
+}
+
+static void gen_rolw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv shamt;
+    TCGv_i32 t1, t2;
+    shamt = tcg_temp_new();
+    t1 = tcg_temp_new_i32();
+    t2 = tcg_temp_new_i32();
+
+    gen_sbopw_shamt(shamt, arg2);
+
+    /* truncate to 32-bits */
+    tcg_gen_trunc_tl_i32(t1, arg1);
+    tcg_gen_trunc_tl_i32(t2, shamt);
+
+    tcg_gen_rotl_i32(t1, t1, t2);
+
+    /* sign-extend 64-bits */
+    tcg_gen_ext_i32_tl(ret, t1);
+
+    tcg_temp_free(shamt);
+    tcg_temp_free_i32(t1);
+    tcg_temp_free_i32(t2);
+}
+
 #endif
 
 static bool gen_arith(DisasContext *ctx, arg_r *a,
-- 
2.17.1


