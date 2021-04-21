Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FD936644B
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 06:18:51 +0200 (CEST)
Received: from localhost ([::1]:51272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZ4KA-0003Vb-E1
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 00:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lZ4Fs-0006le-5C
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 00:14:24 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:36638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lZ4Fn-0002yG-JI
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 00:14:23 -0400
Received: by mail-pl1-x62c.google.com with SMTP id g16so4038547plq.3
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 21:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=VCtK6MeJWrRcE924S2JR9pxGgosMYU4dcOsKsyLoLCo=;
 b=MvBe6X9y403En8aRd6Voq59fjR8tqvM+1t7VPyi7BRWZrdqCKXnfLC22O8RkRRWczx
 2q98o0WxlfMRktFtk0vO9ZDdzYZsB2spLAgqCm+q5MlEgTk8ztZ233n0XuADret23x/B
 xaQIczVvIPVJjdrBCPRDu/00EntLZOIk8N8ky59X+0ApoPeGGf8ZtZtgJlK6zYHT0P2i
 lcPY3MyE3PSXSeqY1jKW2l2lQuB3NqISznr3sI618TD+5glI3M+yT+p9Za9LM01Zot8Z
 hOEx/dqh85/At66Cni4yoSuwhoESjac+YNpQTeRxt+8KgIoU6k3GNzrFLcywPUTfOnCw
 ymLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=VCtK6MeJWrRcE924S2JR9pxGgosMYU4dcOsKsyLoLCo=;
 b=lKPhU0FMR2DhzvZjP4AYlJsmbb+mRtrbVSK3DWAcAza7gLsIZOWwP1NTaNb7iks5Ln
 noZjdVNzmUrykQ/yYubxiWCRuOAFUSGWC+Hq7sshYXeO79MN66VirFaMT0pUC/3wrFlB
 5yT1gP1+r2+0TAtt3xg+LMJJrz9fHR3b9qblKHubnConOYR5aCtTpUqaBwdnloYDvLzo
 P6cie3CuPXteOAlSuN0kAQxQ/ruhGkAv5jS18W2wvEfcnq68MQhCmSiZuNaxXlaikk8p
 34jZzTZ/heLUqGjiQHDB/XjLKjoD8EU0UfM7thQ1cDG25IQDzZ1w8R4W+e8NqM79ueyN
 +fvQ==
X-Gm-Message-State: AOAM5325jV61S/eF5i74PHGZaf3j0eEZwROj6U5+fTZdQMAgPHtk9cVF
 4EYVOAsk2kcvZ7trn6Dt/fiU+97+YNrmjCBm
X-Google-Smtp-Source: ABdhPJwq0hsaMlXsSbynJI6trwPMhdoztwTXd0OuxvaqwzqJRDhotAkflS9Sw0HXw8xd0kce3iTRNQ==
X-Received: by 2002:a17:902:e313:b029:ec:9ca9:ff69 with SMTP id
 q19-20020a170902e313b02900ec9ca9ff69mr17134872plc.54.1618978458077; 
 Tue, 20 Apr 2021 21:14:18 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id jx20sm551465pjb.41.2021.04.20.21.14.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 21:14:17 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v5 04/17] target/riscv: rvb: logic-with-negate
Date: Wed, 21 Apr 2021 12:13:46 +0800
Message-Id: <20210421041400.22243-5-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210421041400.22243-1-frank.chang@sifive.com>
References: <20210421041400.22243-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62c.google.com
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
 target/riscv/insn32.decode              |  4 ++++
 target/riscv/insn_trans/trans_rvb.c.inc | 18 ++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 0e321da37f4..d0b3f109b4e 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -598,3 +598,7 @@ vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
 clz        011000 000000 ..... 001 ..... 0010011 @r2
 ctz        011000 000001 ..... 001 ..... 0010011 @r2
 cpop       011000 000010 ..... 001 ..... 0010011 @r2
+
+andn       0100000 .......... 111 ..... 0110011 @r
+orn        0100000 .......... 110 ..... 0110011 @r
+xnor       0100000 .......... 100 ..... 0110011 @r
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index dbbd94e1015..73c4693a263 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -35,6 +35,24 @@ static bool trans_cpop(DisasContext *ctx, arg_cpop *a)
     return gen_unary(ctx, a, tcg_gen_ctpop_tl);
 }
 
+static bool trans_andn(DisasContext *ctx, arg_andn *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, tcg_gen_andc_tl);
+}
+
+static bool trans_orn(DisasContext *ctx, arg_orn *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, tcg_gen_orc_tl);
+}
+
+static bool trans_xnor(DisasContext *ctx, arg_xnor *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, tcg_gen_eqv_tl);
+}
+
 /* RV64-only instructions */
 #ifdef TARGET_RISCV64
 
-- 
2.17.1


