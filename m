Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3702B78E1
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 09:38:42 +0100 (CET)
Received: from localhost ([::1]:57310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfIzB-0002Uf-BY
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 03:38:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kfItx-0002i2-Vf
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:33:17 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:51049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kfItu-0004t1-Of
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:33:17 -0500
Received: by mail-pj1-x102e.google.com with SMTP id js21so676335pjb.0
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 00:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=VaebsCk9K1Y9qJEuu5VY5G+5Sx7GFsn+qQdyCJE/iJw=;
 b=aoFMcbXcdO4UpK+WiTh0SsMuImS0LD0lCaQXsLsKWX/gPtq2gM2H0v7ODjWMMEJm+F
 vyn4CD/8yfgn92MR6VqsJ0V9sQkVIKa/+FRpSrdnn7B/jebaJ3WVsejZhqyQ3muPs8zk
 xrX92QwXNVBUoD4mSqGTYQa9OXiY7/yNzxogCDOfaF7EFlTeyZgSrXSFdbBPSGXIh8nh
 5jmPXdSuGaUN4fbpIC8uhzDEaznsrn0vBNp8j45hKTo9bvalMFSQgmLJkhR0rOBImIC6
 DMgizieawaS2URNzFuWqPKOyem2agWP0l7NO/rnLoUS1j/RfV+lDQmFxti0lVEAzE+Ke
 Ip5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=VaebsCk9K1Y9qJEuu5VY5G+5Sx7GFsn+qQdyCJE/iJw=;
 b=SRW58P48mvhSSgfB7PHafZttOhrvwMYGnMSVXNYhzSrADAzgmdYAsMKc1cL0EiW/TQ
 wstu/eDfs3Z2N+sNpuPQV4N4ATESQQH99Uy+CerlPglFI5BmnlkmST117oh28yWP4u73
 CWEj5bXeZcWrSCZDQsUvgpKT0s7OfGcr064fpT7e9YriWN2lRC2138AL9jKmtM103WmV
 KNMbJqBjZXLSdvaqHBLdw1j/o/CastGK0ICKTDU62DU0kmHKpfNhh+S2icdziCODdSPW
 vjZxx2tzULGmcQT98nnU9XUzG1irFDL9R2xunoVA76Ez7KoAL38emFTWwzSCGl14nn97
 rZAQ==
X-Gm-Message-State: AOAM532JBeB/x9llOK/Bg6S7Vvi//lrIgUYbUJNWo+yR11a+G4CPvOoU
 Zm/cdgXpet4fVlFGdJ3z9xvpXqsuDBNuqCWsdoc=
X-Google-Smtp-Source: ABdhPJwx8ugxSLW0pUZ47g8UkvSZ9kvd4W786Xy61zhsVjjhdC57ztzCPTfo4sUDgWnnLJnTWI8IlA==
X-Received: by 2002:a17:90a:62c4:: with SMTP id
 k4mr3123683pjs.32.1605688392770; 
 Wed, 18 Nov 2020 00:33:12 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id y10sm1618407pjm.34.2020.11.18.00.33.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 00:33:12 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC 14/15] target/riscv: rvb: add/sub with postfix zero-extend
Date: Wed, 18 Nov 2020 16:29:52 +0800
Message-Id: <20201118083044.13992-15-frank.chang@sifive.com>
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
---
 target/riscv/insn32-64.decode           |  7 +++++
 target/riscv/insn_trans/trans_rvb.c.inc | 38 +++++++++++++++++++++++++
 target/riscv/translate.c                | 18 ++++++++++++
 3 files changed, 63 insertions(+)

diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index 42bafbc03a0..5df10cd3066 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -107,6 +107,9 @@ gorcw      0010100 .......... 101 ..... 0111011 @r
 sh1addu_w  0010000 .......... 010 ..... 0111011 @r
 sh2addu_w  0010000 .......... 100 ..... 0111011 @r
 sh3addu_w  0010000 .......... 110 ..... 0111011 @r
+addwu      0000101 .......... 000 ..... 0111011 @r
+subwu      0100101 .......... 000 ..... 0111011 @r
+addu_w     0000100 .......... 000 ..... 0111011 @r
 
 sbsetiw    0010100 .......... 001 ..... 0011011 @sh5
 sbclriw    0100100 .......... 001 ..... 0011011 @sh5
@@ -116,3 +119,7 @@ sroiw      0010000 .......... 101 ..... 0011011 @sh5
 roriw      0110000 .......... 101 ..... 0011011 @sh5
 greviw     0110100 .......... 101 ..... 0011011 @sh5
 gorciw     0010100 .......... 101 ..... 0011011 @sh5
+
+addiwu     ................. 100 ..... 0011011 @i
+
+slliu_w    000010 ........... 001 ..... 0011011 @sh
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 31d791236d9..c6fcdc5f0c1 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -434,4 +434,42 @@ GEN_TRANS_SHADDU_W(1)
 GEN_TRANS_SHADDU_W(2)
 GEN_TRANS_SHADDU_W(3)
 
+static bool trans_addwu(DisasContext *ctx, arg_addwu *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &gen_addwu);
+}
+
+static bool trans_addiwu(DisasContext *ctx, arg_addiwu *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith_imm_tl(ctx, a, &gen_addwu);
+}
+
+static bool trans_subwu(DisasContext *ctx, arg_subwu *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &gen_subwu);
+}
+
+static bool trans_addu_w(DisasContext *ctx, arg_addu_w *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &gen_addu_w);
+}
+
+static bool trans_slliu_w(DisasContext *ctx, arg_slliu_w *a)
+{
+    TCGv source1;
+    source1 = tcg_temp_new();
+    gen_get_gpr(source1, a->rs1);
+
+    tcg_gen_ext32u_tl(source1, source1);
+    tcg_gen_shli_tl(source1, source1, a->shamt);
+    gen_set_gpr(a->rd, source1);
+
+    tcg_temp_free(source1);
+    return true;
+}
+
 #endif
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 584550a9db2..9d36d2bd685 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -672,12 +672,24 @@ static void gen_addw(TCGv ret, TCGv arg1, TCGv arg2)
     tcg_gen_ext32s_tl(ret, ret);
 }
 
+static void gen_addwu(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    tcg_gen_add_tl(ret, arg1, arg2);
+    tcg_gen_ext32u_tl(ret, ret);
+}
+
 static void gen_subw(TCGv ret, TCGv arg1, TCGv arg2)
 {
     tcg_gen_sub_tl(ret, arg1, arg2);
     tcg_gen_ext32s_tl(ret, ret);
 }
 
+static void gen_subwu(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    tcg_gen_sub_tl(ret, arg1, arg2);
+    tcg_gen_ext32u_tl(ret, ret);
+}
+
 static void gen_mulw(TCGv ret, TCGv arg1, TCGv arg2)
 {
     tcg_gen_mul_tl(ret, arg1, arg2);
@@ -1252,6 +1264,12 @@ GEN_SHADDU_W(1)
 GEN_SHADDU_W(2)
 GEN_SHADDU_W(3)
 
+static void gen_addu_w(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    tcg_gen_ext32u_tl(arg1, arg1);
+    tcg_gen_add_tl(ret, arg1, arg2);
+}
+
 #endif
 
 static bool gen_arith(DisasContext *ctx, arg_r *a,
-- 
2.17.1


