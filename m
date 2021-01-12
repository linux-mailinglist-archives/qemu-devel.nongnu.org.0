Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FDA2F263A
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 03:23:26 +0100 (CET)
Received: from localhost ([::1]:57972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz9LB-0002jS-OK
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 21:23:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kz9If-0000yT-E2
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 21:20:52 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:33073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kz9IY-000277-FQ
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 21:20:44 -0500
Received: by mail-pl1-x62b.google.com with SMTP id b8so581251plx.0
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 18:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=RraFfTNt+SH5tIi672hGt9gZVL+nLzbf3TvbyQmG2ss=;
 b=GJZ8Uph0uvMvprkuNJHQT9mmvXL+NmackZN5+SBO6Gp4oUg81+tjequm/k18V7TNUi
 IReLapVoWA/kFpzGyjQta6Mdrfg3w1kI3P2fsaJlHxDhzrh1cbSLKz7cqFWJYCXn8/bF
 wOFDR/WTphWcxQ3wB96w2XXfnaVVVOKEw8/CP32d2Og2j+qvTXk4/41R2uOZ3MvSxaUQ
 p5clnHixQPCLMiX+xqsI/982smZOQuIaM/fZTT9Av4CTtcKfOvegwb9AEnGlPS+EJEt4
 TlaACKDsTxVFHSxpuCOlASayS9n9GPt/FH8P+8bMQldFDhlnSUVkXegIqlKfCYl4EU0w
 3hWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=RraFfTNt+SH5tIi672hGt9gZVL+nLzbf3TvbyQmG2ss=;
 b=WTbT32fUfP5gVDNpH5ufA5f8vA0khwulbEjrOaP+QG4yi4ShCorYKNuVTCGv/dBauD
 Ce8dKoQpoL7VwxXq4mYWoP6B2bf550CQvMVbAapQRbIlaZfjXejdURuTnFdjejxf37UR
 /FeMp+RjZHuWv2b56BPU6OuUxNIuX/T02hdWa3VMf7I6yObwU62uzdHfowoi+06bcZda
 1kGOUYDPnWl8IFTdal34PrupJQCW2MPjWzks7AlZNnVy+CQ0KahR/ih2RLB+6l0CWoDK
 S3xhwj5XPkWeAmxbVUraYc1wMhb6+XH9NuII3woTzILlqbA1yhJXMVY9yI+djg77+07T
 da2g==
X-Gm-Message-State: AOAM5320FYiq1yMTVtKAZm6RJJfVD2rCQCGwUTHhoEyHsSyUhuOcyA58
 HljOQ8TmqGID+k6fF1jfbYA+sFZu0cFXr7R/
X-Google-Smtp-Source: ABdhPJxpJVJ6x2FB5FoPXUB2CXIvRwZUJEG1IEXpiZwkhX8w7h/diaWNb6sLea9Ph0KzjDDuBke8ug==
X-Received: by 2002:a17:90a:7085:: with SMTP id
 g5mr1932677pjk.132.1610418041008; 
 Mon, 11 Jan 2021 18:20:41 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id x14sm981326pfp.77.2021.01.11.18.20.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 18:20:40 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC v3 06/16] target/riscv: rvb: min/max instructions
Date: Tue, 12 Jan 2021 10:19:47 +0800
Message-Id: <20210112022001.20521-7-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112022001.20521-1-frank.chang@sifive.com>
References: <20210112022001.20521-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62b.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32.decode              |  4 ++++
 target/riscv/insn_trans/trans_rvb.c.inc | 24 ++++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 7f32b8c6d15..d64326fd864 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -605,3 +605,7 @@ xnor       0100000 .......... 100 ..... 0110011 @r
 pack       0000100 .......... 100 ..... 0110011 @r
 packu      0100100 .......... 100 ..... 0110011 @r
 packh      0000100 .......... 111 ..... 0110011 @r
+min        0000101 .......... 100 ..... 0110011 @r
+minu       0000101 .......... 101 ..... 0110011 @r
+max        0000101 .......... 110 ..... 0110011 @r
+maxu       0000101 .......... 111 ..... 0110011 @r
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 2d24dafac09..2aa4515fe31 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -71,6 +71,30 @@ static bool trans_packh(DisasContext *ctx, arg_packh *a)
     return gen_arith(ctx, a, gen_packh);
 }
 
+static bool trans_min(DisasContext *ctx, arg_min *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, tcg_gen_smin_tl);
+}
+
+static bool trans_max(DisasContext *ctx, arg_max *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, tcg_gen_smax_tl);
+}
+
+static bool trans_minu(DisasContext *ctx, arg_minu *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, tcg_gen_umin_tl);
+}
+
+static bool trans_maxu(DisasContext *ctx, arg_maxu *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, tcg_gen_umax_tl);
+}
+
 /* RV64-only instructions */
 #ifdef TARGET_RISCV64
 
-- 
2.17.1


