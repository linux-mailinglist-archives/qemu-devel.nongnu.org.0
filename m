Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1735A2F2643
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 03:28:05 +0100 (CET)
Received: from localhost ([::1]:42440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz9Pg-000811-5A
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 21:28:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kz9J9-0001WK-Qi
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 21:21:20 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:44317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kz9J6-0002Gm-Ub
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 21:21:19 -0500
Received: by mail-pl1-x62a.google.com with SMTP id r4so548864pls.11
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 18:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=1kUMsBJeTTaJT5hWSf4ZQEPL/s217cbvOOKIMRYR0N0=;
 b=MpI53JLL4Kmhg2UW8DayTB0e2RLl//t5ww2/qE9a7iGWcubDwufNmyzt599YVg+uuF
 09d2K5J3z5fNYgMceqx0LaM1APW4j3i2euQiMYlnwG9gypvCjMUXeQiE1WRXdLQ1ufSu
 V2jL1bUwax0w4XtEGmY+BiTWFEA/3/6Y+mAxtuHBa/ZPkAa7LjH4q4vIR2Sqg6m0T71k
 kDPGyYIHufYnX3/iXMlwGQJ10MeCIOCoyfvYAZxRMdUZ/4sgf8QwuIRzynB6/rxVCvZG
 jt64T90Fcqh6IITz6uBVuJ2ughGPmkCWUFQEk/0hVZSvXuOXpz4Q5gVv/rgpGjDQe7Dn
 rVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=1kUMsBJeTTaJT5hWSf4ZQEPL/s217cbvOOKIMRYR0N0=;
 b=hHLnvVU1StNKNmLjYPt5klzWqQWoAUVLHHCzeOPIydVTdSZCSR1346JxhHv7YZLEWy
 GN6SpKuv1+jLUubRzqfSgZIoyxzj6ElELayl8yUWk2B1YJIthja/W8qlyAEanrc0h9Jl
 hiFqj/rO+Yd6a5LHgE6ts3qcRVnFjDlX/x9yTLqYbfTbnvR9VdzLIr8eyRRayDqAvKvF
 NQQGIiBSzOIE5pGArX48x7m+XQJxc9dXz1GMDj5jM6q7/3LCKhEbxRTjiG6sBE1eAS8y
 h7BiSTHDMDDtEnKdlOrkyUeAPPeeI6cihVOJxA6YeB84KSoDyDr3Gn2EGTh2mKjbNPcZ
 i6zQ==
X-Gm-Message-State: AOAM530O+8kGkL1Wrn1HeUQ7iaJSqBV+P8dpESGq4R4yPK/3eR/B9DMo
 CFnEmbYRQSV82N8zQsYUf7mYxL7Z1XYLhc90
X-Google-Smtp-Source: ABdhPJyYBsj7sfcoN1NgM8nF6jFc1/U3Q92hmLt8PRIe/tmj6K1DqIlPvNff8Id7q6Hiqz1j+gRSdw==
X-Received: by 2002:a17:902:9043:b029:dc:299b:b9bb with SMTP id
 w3-20020a1709029043b02900dc299bb9bbmr2811643plz.66.1610418075586; 
 Mon, 11 Jan 2021 18:21:15 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id x14sm981326pfp.77.2021.01.11.18.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 18:21:15 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC v3 14/16] target/riscv: rvb: address calculation
Date: Tue, 12 Jan 2021 10:19:55 +0800
Message-Id: <20210112022001.20521-15-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112022001.20521-1-frank.chang@sifive.com>
References: <20210112022001.20521-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62a.google.com
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
 target/riscv/insn32.decode              |  3 +++
 target/riscv/insn_trans/trans_rvb.c.inc | 23 ++++++++++++++++++
 target/riscv/translate.c                | 32 +++++++++++++++++++++++++
 4 files changed, 61 insertions(+)

diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index 894db5e3abf..2f80b0c07ae 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -104,6 +104,9 @@ rorw       0110000 .......... 101 ..... 0111011 @r
 rolw       0110000 .......... 001 ..... 0111011 @r
 grevw      0110100 .......... 101 ..... 0111011 @r
 gorcw      0010100 .......... 101 ..... 0111011 @r
+sh1add_uw  0010000 .......... 010 ..... 0111011 @r
+sh2add_uw  0010000 .......... 100 ..... 0111011 @r
+sh3add_uw  0010000 .......... 110 ..... 0111011 @r
 
 bsetiw     0010100 .......... 001 ..... 0011011 @sh5
 bclriw     0100100 .......... 001 ..... 0011011 @sh5
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 0756ea5cc28..b90c1c0a350 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -621,6 +621,9 @@ ror        0110000 .......... 101 ..... 0110011 @r
 rol        0110000 .......... 001 ..... 0110011 @r
 grev       0110100 .......... 101 ..... 0110011 @r
 gorc       0010100 .......... 101 ..... 0110011 @r
+sh1add     0010000 .......... 010 ..... 0110011 @r
+sh2add     0010000 .......... 100 ..... 0110011 @r
+sh3add     0010000 .......... 110 ..... 0110011 @r
 
 bseti      00101. ........... 001 ..... 0010011 @sh
 bclri      01001. ........... 001 ..... 0010011 @sh
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index a4181dbf0de..ca987f2705f 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -226,6 +226,17 @@ static bool trans_gorci(DisasContext *ctx, arg_gorci *a)
     return gen_shifti(ctx, a, gen_helper_gorc);
 }
 
+#define GEN_TRANS_SHADD(SHAMT)                                             \
+static bool trans_sh##SHAMT##add(DisasContext *ctx, arg_sh##SHAMT##add *a) \
+{                                                                          \
+    REQUIRE_EXT(ctx, RVB);                                                 \
+    return gen_arith(ctx, a, gen_sh##SHAMT##add);                          \
+}
+
+GEN_TRANS_SHADD(1)
+GEN_TRANS_SHADD(2)
+GEN_TRANS_SHADD(3)
+
 /* RV64-only instructions */
 #ifdef TARGET_RISCV64
 
@@ -367,4 +378,16 @@ static bool trans_gorciw(DisasContext *ctx, arg_gorciw *a)
     return gen_shiftiw(ctx, a, gen_gorcw);
 }
 
+#define GEN_TRANS_SHADD_UW(SHAMT)                             \
+static bool trans_sh##SHAMT##add_uw(DisasContext *ctx,        \
+                                    arg_sh##SHAMT##add_uw *a) \
+{                                                             \
+    REQUIRE_EXT(ctx, RVB);                                    \
+    return gen_arith(ctx, a, gen_sh##SHAMT##add_uw);          \
+}
+
+GEN_TRANS_SHADD_UW(1)
+GEN_TRANS_SHADD_UW(2)
+GEN_TRANS_SHADD_UW(3)
+
 #endif
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index e845b311a3d..7365e591eb7 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -812,6 +812,21 @@ static bool gen_grevi(DisasContext *ctx, arg_grevi *a)
     return true;
 }
 
+#define GEN_SHADD(SHAMT)                                       \
+static void gen_sh##SHAMT##add(TCGv ret, TCGv arg1, TCGv arg2) \
+{                                                              \
+    TCGv t = tcg_temp_new();                                   \
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
+
 #ifdef TARGET_RISCV64
 
 static void gen_ctzw(TCGv ret, TCGv arg1)
@@ -898,6 +913,23 @@ static void gen_gorcw(TCGv ret, TCGv arg1, TCGv arg2)
     gen_helper_gorcw(ret, arg1, arg2);
 }
 
+#define GEN_SHADD_UW(SHAMT)                                       \
+static void gen_sh##SHAMT##add_uw(TCGv ret, TCGv arg1, TCGv arg2) \
+{                                                                 \
+    TCGv t = tcg_temp_new();                                      \
+                                                                  \
+    tcg_gen_ext32u_tl(t, arg1);                                   \
+                                                                  \
+    tcg_gen_shli_tl(t, t, SHAMT);                                 \
+    tcg_gen_add_tl(ret, t, arg2);                                 \
+                                                                  \
+    tcg_temp_free(t);                                             \
+}
+
+GEN_SHADD_UW(1)
+GEN_SHADD_UW(2)
+GEN_SHADD_UW(3)
+
 #endif
 
 static bool gen_arith(DisasContext *ctx, arg_r *a,
-- 
2.17.1


