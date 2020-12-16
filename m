Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 290F92DB8CC
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 03:11:53 +0100 (CET)
Received: from localhost ([::1]:49928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpMIC-0006OQ-6r
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 21:11:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kpM9W-0006oo-Ga
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 21:02:54 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:35371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kpM9T-0000x1-OT
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 21:02:53 -0500
Received: by mail-pf1-x42a.google.com with SMTP id c79so15618843pfc.2
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 18:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=m9+UgyEv7/CO9wcFF/2mGY7NcDjbZFpPGSL5WyqYbRw=;
 b=jsfAMlRog6lr6cdtoc9VTj6pNRdzO4yqrLP5tqp+NF246t74gF8RvEeCtItq/IbVkD
 HUvpdmhBKRrRMz9LXReWPKsnIX76OmS0//ah+cJ+c54FhRWMnYqOcBtiaLdXhgOLM3wG
 AWDjE2wgfDuiWcDQ6AYp9+quGjTDBT6Gv3mBtqIDcp7tn1LDROjkWd+29y3ePh1h+xs9
 OYgcz3TAxQPqOmSjAhSEwmkdlfCOHB3F76AAJ8M+Rr9527yLqJMYY4rvA5Uaw7ZJpkoK
 /iFpSUsZDpmpr0KLIC+pXpWEeN1ItmOSur/r8f6Ur6SoTqhJq2aAI3oMIlE8jBQ2Ach1
 Bg0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=m9+UgyEv7/CO9wcFF/2mGY7NcDjbZFpPGSL5WyqYbRw=;
 b=YPzTWdrtKQRpNCLK8/1r2QNytstdeKzFcGnBu9v2m6bZB1n/+T8W8mBhjl7buAa1uJ
 dtWyMnCXpfH3FWPQYdwceofN8LuzfH+DcoOAfeJmblbORTp3YhwqEX357EwXRvlka0bz
 i2zzsCJDPbJzsOWXt7nVIN8GtQ5GDbifsUR9BYdjBWaSIOX5I9y57W6IVR0Joz14Pw1B
 CtRS5g/78meXdzJzaBktR8ZzpMP8z50BzEwvNxIHP6sO9kl/hbpQ7f0o3hZEZwIdrKD9
 wPIHPOm03MEBQvLrNo/j6FhzhntS6Vu8OTxZdyHIROTffw5uz5tKwLfBW6dayeTP1O/C
 gQcQ==
X-Gm-Message-State: AOAM530/7VSUczSQaODczfajkyCMQjU6SZ75+d8a2xkglXHOk0sXt9+X
 AldGC/o3hE7vIMeA+lXdacjYH99/injwd5CUoTo=
X-Google-Smtp-Source: ABdhPJwzeBY1gBzUwhdqUUFhWehU/YRnYD79VWMt1PES/Cywi7zIbVmqItA88iu2AbVoQdD9oiEFMg==
X-Received: by 2002:a63:2406:: with SMTP id k6mr31526592pgk.453.1608084170397; 
 Tue, 15 Dec 2020 18:02:50 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id a13sm289150pfr.59.2020.12.15.18.02.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 18:02:49 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC v2 07/15] target/riscv: rvb: sign-extend instructions
Date: Wed, 16 Dec 2020 10:01:32 +0800
Message-Id: <20201216020150.3157-8-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201216020150.3157-1-frank.chang@sifive.com>
References: <20201216020150.3157-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 target/riscv/insn32.decode              |  2 ++
 target/riscv/insn_trans/trans_rvb.c.inc | 13 +++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 0d6a8a1c0a5..4baafed21f1 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -598,6 +598,8 @@ vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
 clz        011000 000000 ..... 001 ..... 0010011 @r2
 ctz        011000 000001 ..... 001 ..... 0010011 @r2
 pcnt       011000 000010 ..... 001 ..... 0010011 @r2
+sext_b     011000 000100 ..... 001 ..... 0010011 @r2
+sext_h     011000 000101 ..... 001 ..... 0010011 @r2
 
 andn       0100000 .......... 111 ..... 0110011 @r
 orn        0100000 .......... 110 ..... 0110011 @r
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index bd66c2ad84d..5ea0f0ff81c 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -95,6 +95,19 @@ static bool trans_maxu(DisasContext *ctx, arg_maxu *a)
     return gen_arith(ctx, a, &tcg_gen_umax_tl);
 }
 
+static bool trans_sext_b(DisasContext *ctx, arg_sext_b *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_unary(ctx, a, &tcg_gen_ext8s_tl);
+}
+
+static bool trans_sext_h(DisasContext *ctx, arg_sext_h *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_unary(ctx, a, &tcg_gen_ext16s_tl);
+}
+
+{
 /* RV64-only instructions */
 #ifdef TARGET_RISCV64
 
-- 
2.17.1


