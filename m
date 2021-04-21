Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D3536644C
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 06:18:52 +0200 (CEST)
Received: from localhost ([::1]:51254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZ4KB-0003VD-Ku
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 00:18:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lZ4Fz-0006uG-Nk
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 00:14:32 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:36607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lZ4Fr-00030j-0x
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 00:14:31 -0400
Received: by mail-pg1-x52c.google.com with SMTP id j7so19099892pgi.3
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 21:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=nsWy8+hwU7LvZTGTkxgTamSV94SJvVJihIhMCEHHooo=;
 b=jdvnAHRsFaz3zJrN41SAqBFUxKxFWtmGFN0CREECY/VCdYmFbT27yvC20j+W9zvwR7
 2RZxaeWNds5tlprM7Z1L/d6PmLhcObhKOwzsZC5Jv9v2gXt6CL7yn/hzpEwtaIzgqkeN
 674qEhwQ9Gc++ziBjt1tM3WvRgHfmCCxglaApPg54lJNgJGZ21teNaAfbeIVl+tO+Y8R
 87yTN1/+IXQEibTKcf9ZQOR19NpPtOc3umIJP+ApLv+yXH/Hao0AKq7g3gDp4I32BaEP
 EnqNMK2fouizatLzwrchc2VuThLOQO74TldhOvQQjA6YUBdQ/Q/J3SduWZP04FmjQfcX
 +vNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=nsWy8+hwU7LvZTGTkxgTamSV94SJvVJihIhMCEHHooo=;
 b=so+EFNzcoprS678VdhuNyNQgPU8ae2KjiiuyXqAKg7dEQNgTY63qbEO+Fp84z9MmQU
 lMSLI6xr66KMNOy2+PaQQ8wDfGOuvUdFh3G+iNzItVsTJ3RKBWBjrA21G/s2Vqxmp3mZ
 Wp6S8AFfbIE29vJsVMlWo9FIfk5nFWVjnib8v2o1A7GtsXUOY7T2gqEuOt1J1jobnuj9
 Czg4+u1vD6c26GEk8L/q+9m7mmuzidyPtJF5bOlZgRWZqWpESkYsjHNInfWbH+yI65YP
 5SoKNa+7Uo/SAiMryyRF12j1TXtI6adSpum0RKy0D38Fa0vULQQ3YP2zuJNr+fi43hX8
 QP0A==
X-Gm-Message-State: AOAM531fqFQDIp10Br9Isw4DANA90SY47KpXtd3XXFLNpXqphEkz43zM
 Bbx8qoEueGmMSTvuki8dHblrmikVnl3cjGvZ
X-Google-Smtp-Source: ABdhPJx0j7dja1QXCaj/+ZSDucuhkh/mAxiqYZ9Vt+NRBIlDFSyhk9qVng836PuA3vtFvQBN2NHz8Q==
X-Received: by 2002:a63:2226:: with SMTP id i38mr17047302pgi.215.1618978461467; 
 Tue, 20 Apr 2021 21:14:21 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id jx20sm551465pjb.41.2021.04.20.21.14.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 21:14:21 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v5 05/17] target/riscv: rvb: pack two words into one register
Date: Wed, 21 Apr 2021 12:13:47 +0800
Message-Id: <20210421041400.22243-6-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210421041400.22243-1-frank.chang@sifive.com>
References: <20210421041400.22243-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52c.google.com
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
 target/riscv/insn32-64.decode           |  3 ++
 target/riscv/insn32.decode              |  3 ++
 target/riscv/insn_trans/trans_rvb.c.inc | 30 +++++++++++++++++++
 target/riscv/translate.c                | 40 +++++++++++++++++++++++++
 4 files changed, 76 insertions(+)

diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index 89498a9a28a..d28c0bcf2c1 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -91,3 +91,6 @@ hsv_d     0110111  .....   ..... 100 00000 1110011 @r2_s
 clzw       0110000 00000 ..... 001 ..... 0011011 @r2
 ctzw       0110000 00001 ..... 001 ..... 0011011 @r2
 cpopw      0110000 00010 ..... 001 ..... 0011011 @r2
+
+packw      0000100 .......... 100 ..... 0111011 @r
+packuw     0100100 .......... 100 ..... 0111011 @r
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index d0b3f109b4e..7f32b8c6d15 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -602,3 +602,6 @@ cpop       011000 000010 ..... 001 ..... 0010011 @r2
 andn       0100000 .......... 111 ..... 0110011 @r
 orn        0100000 .......... 110 ..... 0110011 @r
 xnor       0100000 .......... 100 ..... 0110011 @r
+pack       0000100 .......... 100 ..... 0110011 @r
+packu      0100100 .......... 100 ..... 0110011 @r
+packh      0000100 .......... 111 ..... 0110011 @r
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 73c4693a263..2d24dafac09 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -53,6 +53,24 @@ static bool trans_xnor(DisasContext *ctx, arg_xnor *a)
     return gen_arith(ctx, a, tcg_gen_eqv_tl);
 }
 
+static bool trans_pack(DisasContext *ctx, arg_pack *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, gen_pack);
+}
+
+static bool trans_packu(DisasContext *ctx, arg_packu *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, gen_packu);
+}
+
+static bool trans_packh(DisasContext *ctx, arg_packh *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, gen_packh);
+}
+
 /* RV64-only instructions */
 #ifdef TARGET_RISCV64
 
@@ -74,4 +92,16 @@ static bool trans_cpopw(DisasContext *ctx, arg_cpopw *a)
     return gen_unary(ctx, a, gen_cpopw);
 }
 
+static bool trans_packw(DisasContext *ctx, arg_packw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, gen_packw);
+}
+
+static bool trans_packuw(DisasContext *ctx, arg_packuw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, gen_packuw);
+}
+
 #endif
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index b20a58c63b4..4333207aeff 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -536,6 +536,29 @@ static bool gen_arith_div_uw(DisasContext *ctx, arg_r *a,
 
 #endif
 
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
 #ifdef TARGET_RISCV64
 
 static void gen_ctzw(TCGv ret, TCGv arg1)
@@ -557,6 +580,23 @@ static void gen_cpopw(TCGv ret, TCGv arg1)
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


