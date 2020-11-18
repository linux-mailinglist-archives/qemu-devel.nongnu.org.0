Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C72C72B78DB
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 09:35:31 +0100 (CET)
Received: from localhost ([::1]:42332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfIw6-0004m0-IM
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 03:35:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kfItG-00019A-KS
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:32:34 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:45425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kfItE-0004nb-7s
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:32:34 -0500
Received: by mail-pg1-x52e.google.com with SMTP id 62so677910pgg.12
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 00:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Uk5OG9uc1EISaedrmN2IAjR/3Ptt8iCg5bDof/w6oYw=;
 b=M+udbSRKsZXUTrU1Y9RQcIUNJ1xovJpsiaXTk6smo3ycPOvYg00uWWzbDTGqOgq+PZ
 CWuWHY440vUVn6+8F6zMhQyCKqEnpx/gCWsaDY5zo8FNmbFB5zBlLvA/71LDYGyS2ZgS
 EZkyi7fkStt3/fxojBa6cwnCCBwu2Z+k12bWqkvuBT6Ig7gyw7p/h67WNYkAv8gsslFN
 kGzjKxYy6tpkQaMgs/EWvymtBJiSj9eaUcE2Dpn8diVVJ6oY8CTbRe0yZoNO+xXqthhi
 B8Le2rX2nR6Yb2HRLUUo9nrEXBjVo2F0SrE2CsIuNaf/pSGJjaG5DrcAuLnOFGVzkS1E
 J4XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Uk5OG9uc1EISaedrmN2IAjR/3Ptt8iCg5bDof/w6oYw=;
 b=pI6kAq2vNGemufS9Qrg4Hf5VfoKdFRJkRr/y2i7ijExhRgpOIF9ExcM2QYxc+DnDDd
 kAzl8UuoLC+ENLD121bKZO45GED+gs9BMUqRjyAqiDkI9rHy3YYp64g05OcH9OmzcF5k
 IdrqEJ9uqf6GefCJB0kZj5+QMfu5QX3Lk0FlVBeQz4fyjv/M84wditnYanmu/Dqy/kIj
 LIRrPY1Y2l+72oE1fIKXFobV8YompQ3w0GLhltAWltn8osb/Zvds2OzZgcpIzDlR2qpW
 O/SCIb1upULUHVw9QVyfRc465TRmtUfflKUEoSn9KbpoWMx/bD4BN0fc2IPLLYqWd0nj
 6NPA==
X-Gm-Message-State: AOAM532+QXVftn0u5ysr2mxEwu9IfUzdFtXPvECtBO+ivsyQB/JgU36w
 rzxCYQcsAroOe2xaNjcVnq6QMfpF5vrVnynMJFM=
X-Google-Smtp-Source: ABdhPJzLqQTtTcRGHaOlY7s6/1suyDicvZM17kEfCFa3SMjO34uTOPO2z60h3TOq3dq1cBFytwYlbA==
X-Received: by 2002:a62:7b4a:0:b029:18b:b3f:3fe6 with SMTP id
 w71-20020a627b4a0000b029018b0b3f3fe6mr3489019pfc.80.1605688350785; 
 Wed, 18 Nov 2020 00:32:30 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id y10sm1618407pjm.34.2020.11.18.00.32.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 00:32:30 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC 05/15] target/riscv: rvb: pack two words into one register
Date: Wed, 18 Nov 2020 16:29:43 +0800
Message-Id: <20201118083044.13992-6-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201118083044.13992-1-frank.chang@sifive.com>
References: <20201118083044.13992-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
---
 target/riscv/insn32-64.decode           |  3 +
 target/riscv/insn32.decode              |  3 +
 target/riscv/insn_trans/trans_rvb.c.inc | 30 ++++++++
 target/riscv/translate.c                | 92 +++++++++++++++++++++++++
 4 files changed, 128 insertions(+)

diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index d5bea5af273..2f00f96e36b 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -91,3 +91,6 @@ hsv_d     0110111  .....   ..... 100 00000 1110011 @r2_s
 clzw       011000000000 ..... 001 ..... 0011011 @r2
 ctzw       011000000001 ..... 001 ..... 0011011 @r2
 pcntw      011000000010 ..... 001 ..... 0011011 @r2
+
+packw      0000100 .......... 100 ..... 0111011 @r
+packuw     0100100 .......... 100 ..... 0111011 @r
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 29a3d4c6ebc..79aa40f03dd 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -602,3 +602,6 @@ pcnt       011000000010 ..... 001 ..... 0010011 @r2
 andn       0100000 .......... 111 ..... 0110011 @r
 orn        0100000 .......... 110 ..... 0110011 @r
 xnor       0100000 .......... 100 ..... 0110011 @r
+pack       0000100 .......... 100 ..... 0110011 @r
+packu      0100100 .......... 100 ..... 0110011 @r
+packh      0000100 .......... 111 ..... 0110011 @r
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index be25431e990..9257373ae0b 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -53,6 +53,24 @@ static bool trans_xnor(DisasContext *ctx, arg_xnor *a)
     return gen_arith(ctx, a, &gen_xnor);
 }
 
+static bool trans_pack(DisasContext *ctx, arg_pack *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &gen_pack);
+}
+
+static bool trans_packu(DisasContext *ctx, arg_packu *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &gen_packu);
+}
+
+static bool trans_packh(DisasContext *ctx, arg_packh *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &gen_packh);
+}
+
 /* RV64-only instructions */
 #ifdef TARGET_RISCV64
 
@@ -74,4 +92,16 @@ static bool trans_pcntw(DisasContext *ctx, arg_pcntw *a)
     return gen_unary(ctx, a, &gen_pcntw);
 }
 
+static bool trans_packw(DisasContext *ctx, arg_packw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &gen_packw);
+}
+
+static bool trans_packuw(DisasContext *ctx, arg_packuw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &gen_packuw);
+}
+
 #endif
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 254a9dca8c2..fb30ee83aa8 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -743,6 +743,65 @@ static void gen_xnor(TCGv ret, TCGv arg1, TCGv arg2)
     tcg_temp_free(t);
 }
 
+static void gen_pack(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv lower, higher;
+    lower = tcg_temp_new();
+    higher = tcg_temp_new();
+
+#ifdef TARGET_RISCV64
+    tcg_gen_ext32u_tl(lower, arg1);
+    tcg_gen_shli_tl(higher, arg2, 32);
+#else
+    tcg_gen_ext16u_tl(lower, arg1);
+    tcg_gen_shli_tl(higher, arg2, 16);
+#endif
+
+    tcg_gen_or_tl(ret, higher, lower);
+
+    tcg_temp_free(lower);
+    tcg_temp_free(higher);
+}
+
+static void gen_packu(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv lower, higher;
+    lower = tcg_temp_new();
+    higher = tcg_temp_new();
+
+#ifdef TARGET_RISCV64
+    tcg_gen_shri_tl(lower, arg1, 32);
+    tcg_gen_shri_tl(higher, arg2, 32);
+    tcg_gen_shli_tl(higher, higher, 32);
+#else
+    tcg_gen_shri_tl(lower, arg1, 16);
+    tcg_gen_shri_tl(higher, arg2, 16);
+    tcg_gen_shli_tl(higher, higher, 16);
+#endif
+
+    tcg_gen_or_tl(ret, higher, lower);
+
+    tcg_temp_free(lower);
+    tcg_temp_free(higher);
+}
+
+static void gen_packh(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv lower, higher;
+    lower = tcg_temp_new();
+    higher = tcg_temp_new();
+
+    tcg_gen_ext8u_tl(lower, arg1);
+    tcg_gen_ext8u_tl(higher, arg2);
+    tcg_gen_shli_tl(higher, higher, 8);
+
+    tcg_gen_or_tl(ret, higher, lower);
+
+    tcg_temp_free(lower);
+    tcg_temp_free(higher);
+}
+
+
 #ifdef TARGET_RISCV64
 
 static bool gen_cxzw(DisasContext *ctx, arg_r2 *a,
@@ -775,6 +834,39 @@ static void gen_pcntw(TCGv ret, TCGv arg1)
     tcg_gen_ctpop_tl(ret, arg1);
 }
 
+static void gen_packw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv lower, higher;
+    lower = tcg_temp_new();
+    higher = tcg_temp_new();
+
+    tcg_gen_ext16u_tl(lower, arg1);
+    tcg_gen_shli_tl(higher, arg2, 16);
+    tcg_gen_or_tl(ret, higher, lower);
+
+    tcg_gen_ext32s_tl(ret, ret);
+
+    tcg_temp_free(lower);
+    tcg_temp_free(higher);
+}
+
+static void gen_packuw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv lower, higher;
+    lower = tcg_temp_new();
+    higher = tcg_temp_new();
+
+    tcg_gen_shri_tl(lower, arg1, 16);
+    tcg_gen_shri_tl(higher, arg2, 16);
+    tcg_gen_shli_tl(higher, higher, 16);
+    tcg_gen_or_tl(ret, higher, lower);
+
+    tcg_gen_ext32s_tl(ret, ret);
+
+    tcg_temp_free(lower);
+    tcg_temp_free(higher);
+}
+
 #endif
 
 static bool gen_arith(DisasContext *ctx, arg_r *a,
-- 
2.17.1


