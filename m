Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3886A2DB8C9
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 03:11:40 +0100 (CET)
Received: from localhost ([::1]:49194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpMHz-000608-8h
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 21:11:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kpM9T-0006lA-Rq
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 21:02:51 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:43634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kpM9P-0000wW-Dl
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 21:02:51 -0500
Received: by mail-pf1-x431.google.com with SMTP id c12so15606551pfo.10
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 18:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=xANIL9U+q7VdaNhhAev9PcT5i/fCcTrRk81O4BPTh6g=;
 b=UilA1OcnOajy4PQmYxm7BEu/4uDCWbkBrAJFEsQdrrN3J9fPKu5NrBh4RxzuvOnDJF
 1dRB4O30VL6H2yOVh+gJi6pqYkiyUqpR2rnSMVrKGtwL4uCalhErSEq1AvKGG0XTRbvH
 IPfNip9/Z5XTiHwyhW6+7W8p9vikVB8AgfI0RJH4vbYbEvivmgq4HshqPjHSmIFrR6e7
 8Zqq8ggLA4/lTZnN60wbOcyVVPRTS958LF0esa3oWaXm4VipjmFFjpzFTj6P8YUCQ02W
 C+hADvjl+9kq/Wt0TCD+NGwegaoYv54Hc+MAxurQLXnuGC7K9Ibv2z+1o7mxyckMMveN
 DkCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=xANIL9U+q7VdaNhhAev9PcT5i/fCcTrRk81O4BPTh6g=;
 b=q+OLjCiUHWsbVybfRMk4BIIGsJNxwo2KUhdO1JVIHkfeKH/iu7AgjLc8eEgTcoWdOu
 7PNvcl9f41g3EyZ28/uUGhl0pSHZcRTYnDR157GT/P5wyhq8iSYsFS1Q9ndU8pp2TPhC
 irZ2I97H716ewDKjDdbdUIQCfeX9cqGLXlfK9BXwIGkHnXGV+4xZCKbZhrPgI7j6Wgt0
 b4av1bnfFzl8rQcmKvDPrG1V0IzOp0EAq6Lhvzgc6Dn8CVrpALY5FJa3GYCyjOXfxh/v
 e/NJZNFmiEdKe98SrP2YnnlNpAScVCM/YFw5BBGRoi0WfAeaRZKA5+F20fiHgfNMnf3w
 eNfg==
X-Gm-Message-State: AOAM5313ysGaoU7ltlEOlMCZR5ZoDIN25QPdLVUacTNjExWcamdVbjh6
 26ACqluC5VKt9D6evB8fyirzrKCz7GI1t5F7T1U=
X-Google-Smtp-Source: ABdhPJyc39VeUpWJF+7G+/jbt+4nSP7zkMKZa0miJTujccRlLYckguZ5ZRr/j6P4enz/orYaPtA6/g==
X-Received: by 2002:a63:c908:: with SMTP id o8mr8485628pgg.124.1608084165906; 
 Tue, 15 Dec 2020 18:02:45 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id a13sm289150pfr.59.2020.12.15.18.02.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 18:02:45 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC v2 06/15] target/riscv: rvb: min/max instructions
Date: Wed, 16 Dec 2020 10:01:31 +0800
Message-Id: <20201216020150.3157-7-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201216020150.3157-1-frank.chang@sifive.com>
References: <20201216020150.3157-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x431.google.com
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
 target/riscv/insn32.decode              |  4 ++++
 target/riscv/insn_trans/trans_rvb.c.inc | 24 ++++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index c337aed8ca3..0d6a8a1c0a5 100644
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
index 3da233047a9..bd66c2ad84d 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -71,6 +71,30 @@ static bool trans_packh(DisasContext *ctx, arg_packh *a)
     return gen_arith(ctx, a, &gen_packh);
 }
 
+static bool trans_min(DisasContext *ctx, arg_min *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &tcg_gen_smin_tl);
+}
+
+static bool trans_max(DisasContext *ctx, arg_max *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &tcg_gen_smax_tl);
+}
+
+static bool trans_minu(DisasContext *ctx, arg_minu *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &tcg_gen_umin_tl);
+}
+
+static bool trans_maxu(DisasContext *ctx, arg_maxu *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &tcg_gen_umax_tl);
+}
+
 /* RV64-only instructions */
 #ifdef TARGET_RISCV64
 
-- 
2.17.1


