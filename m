Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0037240789F
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 16:06:50 +0200 (CEST)
Received: from localhost ([::1]:44958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mP3eb-0002Vp-1S
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 10:06:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mP3YS-0002QL-8J
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 10:00:28 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229]:45978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mP3YO-0005bq-Dp
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 10:00:28 -0400
Received: by mail-lj1-x229.google.com with SMTP id l18so8179002lji.12
 for <qemu-devel@nongnu.org>; Sat, 11 Sep 2021 07:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FknMPYOgK+/+tCJkyRWpYg+Sv0qspb3//ySmMWIz1cg=;
 b=dhEFz7V+aOD5DDcQgA3TInTqFZ/5BJCpczPkkTWGYs11bbwhm09GLdVJj+BPnMlhme
 4LxoC8gFqdkF4ORbnHtxhcXiXk2yEBCWvEaRnEpAyyrKEdA6l9n0lK0jsxhwE+83VYIg
 HRjes3GFwJgd9Iwl/RkeSMC4R95iauvFnbKt2TkbhHLkyS1dgKWgoH2F9qVup1f2+cb+
 NnCcJQpfGNHCG+nH7MOPAKcVYX2c4j0zPzL3a/PkSHH8YHiP4t9bipCkDKFGbj8a1BtB
 Ue7NgwMHZl+ojffgQ7zw3lEzPTQqexi8DylFMXuGmSee92bG20WS2WXWicjiPzQM1F6C
 nnJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FknMPYOgK+/+tCJkyRWpYg+Sv0qspb3//ySmMWIz1cg=;
 b=KC8lSZESKZZN5BPnAPG1RyHECw2QSl5YXwpH/nLfgH+ZsCPs5XKz6j+Nd28IMEybID
 lOY3fJAbIVFcxhDjfXYZNU0RzRn+RHkisFLRB4JSuCyi7IL/H7ViR2wU4iOrH8DtbLL/
 oxA3+Z+fxbJuO0jGLwJSkCAOr2svvHOBC/QZv2wTprcMaQcj8kDQ+0FPLtQgnWG4k58I
 vVaqHnWkzkDa/NV3En4YDqHCD5uPTwn1dESs86H4FOahh0cqx9hG5xlfzL+5PQMPKHMc
 B/wLay021JkfP+gJ3aZeLEf8KnJsfGioBIHVSI9ZaGCEQbADq4EfgJQ8NA1XuTydY/ni
 KVeA==
X-Gm-Message-State: AOAM532KIBE3Z14Nz11kZsL+GgthnLCU0QmPdMZb+gCL0RBv1PMvinFW
 AD+btVu7iPlwsb4oh1MtCdz+7+QeRJV3LGuJ
X-Google-Smtp-Source: ABdhPJzE+vk9HVNo2sTo3vBdGuQz+Q9rA5FputuqOMn+pvjocmSnu4uxJ5cq1kRfLs+j79pJ0OMTbA==
X-Received: by 2002:a2e:a546:: with SMTP id e6mr2348920ljn.517.1631368822552; 
 Sat, 11 Sep 2021 07:00:22 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id u15sm213052lfk.26.2021.09.11.07.00.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Sep 2021 07:00:22 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 03/16] target/riscv: clwz must ignore high bits (use
 shift-left & changed logic)
Date: Sat, 11 Sep 2021 16:00:03 +0200
Message-Id: <20210911140016.834071-4-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210911140016.834071-1-philipp.tomsich@vrull.eu>
References: <20210911140016.834071-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lj1-x229.google.com
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Assume clzw being executed on a register that is not sign-extended, such
as for the following sequence that uses (1ULL << 63) | 392 as the operand
to clzw:
	bseti	a2, zero, 63
	addi	a2, a2, 392
	clzw    a3, a2
The correct result of clzw would be 23, but the current implementation
returns -32 (as it performs a 64bit clz, which results in 0 leading zero
bits, and then subtracts 32).

Fix this by changing the implementation to:
 1. shift the original register up by 32
 2. performs a target-length (64bit) clz
 3. return 32 if no bits are set

Marking this instruction as 'w-form' (i.e., setting ctx->w) would not
correctly model the behaviour, as the instruction should not perform
a zero-extensions on the input (after all, it is not a .uw instruction)
and the result is always in the range 0..32 (so neither a sign-extension
nor a zero-extension on the result will ever be needed).  Consequently,
we do not set ctx->w and mark the instruction as EXT_NONE.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
---

Changes in v11:
- Swaps out the EXT_ZERO to EXT_NONE, as no extension is to be performed.

Changes in v10:
- New patch, fixing correctnes for clzw called on a register with undefined
  (as in: not properly sign-extended) upper bits.

 target/riscv/insn_trans/trans_rvb.c.inc | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 6c85c89f6d..73d1e45026 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -349,15 +349,17 @@ GEN_TRANS_SHADD(3)
 
 static void gen_clzw(TCGv ret, TCGv arg1)
 {
-    tcg_gen_clzi_tl(ret, arg1, 64);
-    tcg_gen_subi_tl(ret, ret, 32);
+    TCGv t = tcg_temp_new();
+    tcg_gen_shli_tl(t, arg1, 32);
+    tcg_gen_clzi_tl(ret, t, 32);
+    tcg_temp_free(t);
 }
 
 static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_unary(ctx, a, EXT_ZERO, gen_clzw);
+    return gen_unary(ctx, a, EXT_NONE, gen_clzw);
 }
 
 static void gen_ctzw(TCGv ret, TCGv arg1)
-- 
2.25.1


