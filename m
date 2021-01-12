Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 287E92F2652
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 03:34:44 +0100 (CET)
Received: from localhost ([::1]:58164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz9W7-0006CG-8a
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 21:34:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kz9JK-0001Zu-Px
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 21:21:34 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:44891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kz9JF-0002HJ-K6
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 21:21:30 -0500
Received: by mail-pf1-x42c.google.com with SMTP id a188so444643pfa.11
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 18:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=cg/XSyBDgfWMKTaj4H5pnj/4AfFpWEh9kdHo1QO7YT0=;
 b=Gtnw3v5FUpK1H6/purLkZ93mas1FsvcJomvY7C8aKAx/o0qpOozR8ev0DHf0flkq55
 K38cK4+O3q8a95h1F8kuHs5Zj5HFy1a4ykPR7i1mKBeYssIcIBEWuQCIS7aXnUNE4vml
 az+bEdpRbUqjlxYqO3IvCifZuLpNc1e5IcWdbZCPRVE8sWUYIgxV/G4fbyPPcxC63Lo8
 Wi83RrIQhdniYUtrowua4Uj8+utMZxDY/3+/b9bJYt4X0mJ1rKe9pzisZTU91TNlvtcA
 vayw1o24FFSVon8bWo6e8VRsvilsuSmQxfBKaluMezJVZcxp41/j/Hl9DsCJmoVaBR/C
 SNkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=cg/XSyBDgfWMKTaj4H5pnj/4AfFpWEh9kdHo1QO7YT0=;
 b=QPbW+yLqFsCQ17/L2pK4Cl1p8HCEyJe2ff8UFd2PQSoL7qoioNsjo3dQ1OcD0+fiBL
 32vPR2pQdyh16XvHyDJcAM8HQVbGz1aePRWSeRF6WS0zOR2qqZt4rIOdlgl5ALIFVP5X
 RLoWaLfB12BdDKlNy2Qsa8ZI6LstCa681gf8O2PHwiDCzpB/ZafXw1LED0HXScuqSzEZ
 Iea0eOwINSdEHfht3SRW6t0omvpS3y3l5j+nANOkwe1BlVUK6yoXF55XECcRbJoNwcoT
 HDZToS03+MIPCxm1MNtT8tnfvRiE38gnCCslRJWRe+CFituYCQSXr2VSePomTj1nEzG4
 +99g==
X-Gm-Message-State: AOAM531hOKCMkYztwEIHapUUMdkGHkRvwIpefiZzle2HHZgRcnMNsPe+
 EnV16+0v48TeSC5Cu3nypnFyC4GkfjSyCTor
X-Google-Smtp-Source: ABdhPJziseDVwwJ9jz5I6IHZ73FTZgu6EdmFdX4X6E3/WwC/gRfLjQ7pxXt1DvE+Y+6+7OSwTWlzxg==
X-Received: by 2002:a62:7ac4:0:b029:19d:b6ee:c64c with SMTP id
 v187-20020a627ac40000b029019db6eec64cmr2276214pfc.3.1610418080080; 
 Mon, 11 Jan 2021 18:21:20 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id x14sm981326pfp.77.2021.01.11.18.21.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 18:21:19 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC v3 15/16] target/riscv: rvb: add/shift with prefix zero-extend
Date: Tue, 12 Jan 2021 10:19:56 +0800
Message-Id: <20210112022001.20521-16-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112022001.20521-1-frank.chang@sifive.com>
References: <20210112022001.20521-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42c.google.com
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
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32-64.decode           |  3 +++
 target/riscv/insn_trans/trans_rvb.c.inc | 22 ++++++++++++++++++++++
 target/riscv/translate.c                |  6 ++++++
 3 files changed, 31 insertions(+)

diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index 2f80b0c07ae..01b28718af5 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -107,6 +107,7 @@ gorcw      0010100 .......... 101 ..... 0111011 @r
 sh1add_uw  0010000 .......... 010 ..... 0111011 @r
 sh2add_uw  0010000 .......... 100 ..... 0111011 @r
 sh3add_uw  0010000 .......... 110 ..... 0111011 @r
+add_uw     0000100 .......... 000 ..... 0111011 @r
 
 bsetiw     0010100 .......... 001 ..... 0011011 @sh5
 bclriw     0100100 .......... 001 ..... 0011011 @sh5
@@ -116,3 +117,5 @@ sroiw      0010000 .......... 101 ..... 0011011 @sh5
 roriw      0110000 .......... 101 ..... 0011011 @sh5
 greviw     0110100 .......... 101 ..... 0011011 @sh5
 gorciw     0010100 .......... 101 ..... 0011011 @sh5
+
+slli_uw    00001. ........... 001 ..... 0011011 @sh
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index ca987f2705f..94fcf822a36 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -390,4 +390,26 @@ GEN_TRANS_SHADD_UW(1)
 GEN_TRANS_SHADD_UW(2)
 GEN_TRANS_SHADD_UW(3)
 
+static bool trans_add_uw(DisasContext *ctx, arg_add_uw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, gen_add_uw);
+}
+
+static bool trans_slli_uw(DisasContext *ctx, arg_slli_uw *a)
+{
+    TCGv source1 = tcg_temp_new();
+    gen_get_gpr(source1, a->rs1);
+
+    if (a->shamt < 32) {
+        tcg_gen_deposit_z_i64(source1, source1, a->shamt, 32);
+    } else {
+        tcg_gen_shli_i64(source1, source1, a->shamt);
+    }
+
+    gen_set_gpr(a->rd, source1);
+    tcg_temp_free(source1);
+    return true;
+}
+
 #endif
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 7365e591eb7..dbcc15ed73f 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -930,6 +930,12 @@ GEN_SHADD_UW(1)
 GEN_SHADD_UW(2)
 GEN_SHADD_UW(3)
 
+static void gen_add_uw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    tcg_gen_ext32u_tl(arg1, arg1);
+    tcg_gen_add_tl(ret, arg1, arg2);
+}
+
 #endif
 
 static bool gen_arith(DisasContext *ctx, arg_r *a,
-- 
2.17.1


