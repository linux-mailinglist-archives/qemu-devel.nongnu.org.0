Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA0D373F5F
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 18:16:09 +0200 (CEST)
Received: from localhost ([::1]:53594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leKC0-0006sy-18
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 12:16:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1leK2u-0005Rb-0N
 for qemu-devel@nongnu.org; Wed, 05 May 2021 12:06:44 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:40783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1leK2p-0002IF-0n
 for qemu-devel@nongnu.org; Wed, 05 May 2021 12:06:43 -0400
Received: by mail-pg1-x52b.google.com with SMTP id y30so2100847pgl.7
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 09:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=T+989AocJ42ZgQVR+3+zF/iXoOOPxw2Wzmf9oPeMcyI=;
 b=gGGXq6ha9VkvAhDUXbb+ov9Kz7EczMHIOJnatWdQTUGRCuBtn03QCWuPWszmlEdkXE
 WMiOTi/ypmz5FoqeuL+U62kAaa+JHv5nOrpOUpEaUDNTQMi+AILrLJ5KzEqYljorFm2g
 unC2KFEBFiHheGoIP3HbcAx8M7bGTyVpV9NaFDpjqqceFPWnV4LxPP9uZravyCuxS7vJ
 fUFZAM3iunksUo3GqdhE1OlCMuG8Suf/73cw4EViZdicXt/J0Pt6XBcu9lN/T4G02eUw
 x8AnjTuegVYiVRz0WrVDgu6IMtf1uyTR3eE0Y0PKVi0wk7FoxiX4+lwnrOUqX7PmXaL6
 0vXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=T+989AocJ42ZgQVR+3+zF/iXoOOPxw2Wzmf9oPeMcyI=;
 b=oBzKL6gnpco6tNSogB4cmIN0FcjcCz4AVYcAx001610jhou1MItyr8xvU45v75TIYx
 iwJNjiSRQ6W3kQxE+p3AdTSjTTfjQMpzQlKdp9f5Diw/lW/TPq1DH36spVVX/Zcz2VKV
 HFxq8bENy3BKKcTfQ2FoegEeyZayEfZO4MmMtrQSR3CRcOOXbndWoB6T8zTfp5DrAMBz
 EAwzSViLYLbGpF1/6vR0nKXV+lJq8qJdSR37rKsQj2OCewkIiAPL2zGQQbf7Lj6LBP4h
 Ga/bMZuIklhiAzMK93fcLgE5jRLgZHOPTZRwJxw7EJO5ld0LB2WdKtyCIGpIfyXTt0+q
 u/+A==
X-Gm-Message-State: AOAM531YXuUWzV1Ie+qIZp8pAI6ICs5U+cxHM6AAuKv1bKs28Apg1ufa
 BbliYzH+CEgRQ3N4Y/lvHSZYdvXwfiT7lXrX
X-Google-Smtp-Source: ABdhPJxdja+Ul1BtNikk9PWZdDFsGWGgJDz/gALjHUYCiNr94TKiSkS0QDldQ9lClbpUMQ2kk1JBDA==
X-Received: by 2002:aa7:95b6:0:b029:28e:aa31:dd3c with SMTP id
 a22-20020aa795b60000b029028eaa31dd3cmr14247134pfk.43.1620230797287; 
 Wed, 05 May 2021 09:06:37 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id js6sm35877977pjb.0.2021.05.05.09.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 09:06:36 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v6 03/17] target/riscv: rvb: count bits set
Date: Thu,  6 May 2021 00:06:04 +0800
Message-Id: <20210505160620.15723-4-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210505160620.15723-1-frank.chang@sifive.com>
References: <20210505160620.15723-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52b.google.com
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

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32.decode              |  2 ++
 target/riscv/insn_trans/trans_rvb.c.inc | 13 +++++++++++++
 target/riscv/translate.c                |  6 ++++++
 3 files changed, 21 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 9a2ffab1504..6f7671872d2 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -662,7 +662,9 @@ vamomaxud_v     11100 . . ..... ..... 111 ..... 0101111 @r_wdvm
 # *** RV32B Standard Extension ***
 clz        011000 000000 ..... 001 ..... 0010011 @r2
 ctz        011000 000001 ..... 001 ..... 0010011 @r2
+cpop       011000 000010 ..... 001 ..... 0010011 @r2
 
 # *** RV64B Standard Extension (in addition to RV32B) ***
 clzw       0110000 00000 ..... 001 ..... 0011011 @r2
 ctzw       0110000 00001 ..... 001 ..... 0011011 @r2
+cpopw      0110000 00010 ..... 001 ..... 0011011 @r2
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 157b4e3c41d..4a5d271b438 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -29,6 +29,12 @@ static bool trans_ctz(DisasContext *ctx, arg_ctz *a)
     return gen_unary(ctx, a, gen_ctz);
 }
 
+static bool trans_cpop(DisasContext *ctx, arg_cpop *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_unary(ctx, a, tcg_gen_ctpop_tl);
+}
+
 static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
 {
     REQUIRE_64BIT(ctx);
@@ -42,3 +48,10 @@ static bool trans_ctzw(DisasContext *ctx, arg_ctzw *a)
     REQUIRE_EXT(ctx, RVB);
     return gen_unary(ctx, a, gen_ctzw);
 }
+
+static bool trans_cpopw(DisasContext *ctx, arg_cpopw *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+    return gen_unary(ctx, a, gen_cpopw);
+}
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 60fac0fe27e..c1a30c21723 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -561,6 +561,12 @@ static void gen_clzw(TCGv ret, TCGv arg1)
     tcg_gen_subi_tl(ret, ret, 32);
 }
 
+static void gen_cpopw(TCGv ret, TCGv arg1)
+{
+    tcg_gen_ext32u_tl(arg1, arg1);
+    tcg_gen_ctpop_tl(ret, arg1);
+}
+
 static bool gen_arith(DisasContext *ctx, arg_r *a,
                       void(*func)(TCGv, TCGv, TCGv))
 {
-- 
2.17.1


