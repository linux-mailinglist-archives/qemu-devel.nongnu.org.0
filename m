Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 251B62DB8C3
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 03:09:33 +0100 (CET)
Received: from localhost ([::1]:43496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpMFw-0003bz-4G
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 21:09:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kpMBG-0000uZ-C9
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 21:04:42 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:39367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kpMBD-0001C2-FB
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 21:04:42 -0500
Received: by mail-pj1-x1029.google.com with SMTP id hk16so678596pjb.4
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 18:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=LgIzG47TTsQTTKfkiPYlk72tQJacsoAvRrzsU/VHOlw=;
 b=S+WptiQmINO+R16VNqPWMoFfrmpJByOtWsx43iBNQRk/b4CIL6WLUKpYSbY/xzE0/6
 ZKTOoa372aeEX1enEcgbXCi08uEbs8+vPvHlyzQSR3oC+3egixDtGDE/sGveWeD17Zl4
 DOJYlCQQzcPv/4W8V1Y24ydoQGDRpfzvDOW/RiSynw/0umVBJRkO1Uu6ArE+DGy1Ja0x
 nWiLusWyJFALlblBRs2q/3uDkuOKDYEYs7eUfAk2WZnX7uYHRI0x3wrBDz8+oRcgmoyF
 OE3BNkzKZnUkInErDfWQjbskcrULKu3we8P49pbYRBJFxErtg4830/hy8A65Iv7lKpW1
 g9fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=LgIzG47TTsQTTKfkiPYlk72tQJacsoAvRrzsU/VHOlw=;
 b=hOCcCpsLfMZRUJaGLttHsa0xtRHvBv6hbCUWSpFs5HbjPuTkC++294tWSnMotP1chr
 ul81HUDoLpShHm4dRklQm9ju8ate+DR/a/enGfbnrZ3pJyQ0+zGvT1cBSfJhIzVOsgur
 WDvyGvGvnQks+m0oQF/UNjveoG9DKx211NFPxLkEfnqX/HQj13ANjtvJ+GowN7eDMf+2
 q2xoUfVS/rTAcBQFR907vyw8U766ENxzvPMNGlGanI9b5hoBrwpPHM2gdmzx22iFw+Rp
 RzlTGb2Fgqg/FDAb2oBCESlWRl/uFx/HdiEjAOisqIcKemc0BMRbvDzaINeofIiB5F/1
 sEPg==
X-Gm-Message-State: AOAM531lgKClUUNKt1p+pe0IsHwjIXdnqf3ik+kviBiwD6bujEMp7t3Q
 4C9A8kLOvmbD/ShnHBwA02IV6xKll1/a0JBNK2E=
X-Google-Smtp-Source: ABdhPJyL3NQYcaGKWM4RJhE/I5KsPvACh+QG1umCSBz7l+E4EOgvDNmzXodEiogv1Byyz5Wu0sm7Qg==
X-Received: by 2002:a17:902:c382:b029:db:fa52:c24 with SMTP id
 g2-20020a170902c382b02900dbfa520c24mr13457500plg.53.1608084277939; 
 Tue, 15 Dec 2020 18:04:37 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id a13sm289150pfr.59.2020.12.15.18.04.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 18:04:37 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC v2 13/15] target/riscv: rvb: address calculation
Date: Wed, 16 Dec 2020 10:01:38 +0800
Message-Id: <20201216020150.3157-14-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201216020150.3157-1-frank.chang@sifive.com>
References: <20201216020150.3157-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1029.google.com
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
 target/riscv/insn_trans/trans_rvb.c.inc | 23 ++++++++++++++++++
 target/riscv/translate.c                | 32 +++++++++++++++++++++++++
 4 files changed, 61 insertions(+)

diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index 46f469700b5..1059cab5aa4 100644
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
index 98d2ee0ab56..67c8bc5485b 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -621,6 +621,9 @@ ror        0110000 .......... 101 ..... 0110011 @r
 rol        0110000 .......... 001 ..... 0110011 @r
 grev       0110100 .......... 101 ..... 0110011 @r
 gorc       0010100 .......... 101 ..... 0110011 @r
+sh1add     0010000 .......... 010 ..... 0110011 @r
+sh2add     0010000 .......... 100 ..... 0110011 @r
+sh3add     0010000 .......... 110 ..... 0110011 @r
 
 sbseti     00101. ........... 001 ..... 0010011 @sh
 sbclri     01001. ........... 001 ..... 0010011 @sh
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index c35fe84444c..07fe662b005 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -253,6 +253,17 @@ static bool trans_gorci(DisasContext *ctx, arg_gorci *a)
     return gen_shifti(ctx, a, &gen_helper_gorc);
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
 
@@ -418,4 +429,16 @@ static bool trans_gorciw(DisasContext *ctx, arg_gorciw *a)
     return gen_shiftiw(ctx, a, &gen_gorcw);
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
index 021daf10875..f9385bbcd4f 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -837,6 +837,21 @@ static bool gen_grevi(DisasContext *ctx, arg_grevi *a)
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
@@ -923,6 +938,23 @@ static void gen_gorcw(TCGv ret, TCGv arg1, TCGv arg2)
     gen_helper_gorc(ret, arg1, arg2);
 }
 
+#define GEN_SHADDU_W(SHAMT)                                       \
+static void gen_sh##SHAMT##addu_w(TCGv ret, TCGv arg1, TCGv arg2) \
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
+GEN_SHADDU_W(1)
+GEN_SHADDU_W(2)
+GEN_SHADDU_W(3)
+
 #endif
 
 static bool gen_arith(DisasContext *ctx, arg_r *a,
-- 
2.17.1


