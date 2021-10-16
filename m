Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F0943016E
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Oct 2021 11:13:32 +0200 (CEST)
Received: from localhost ([::1]:46820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbfkx-0002Mp-AT
	for lists+qemu-devel@lfdr.de; Sat, 16 Oct 2021 05:13:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbffk-0002q7-Bv
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 05:08:08 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:40797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbffi-0002YL-J7
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 05:08:08 -0400
Received: by mail-pl1-x630.google.com with SMTP id v20so7898702plo.7
 for <qemu-devel@nongnu.org>; Sat, 16 Oct 2021 02:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gvT+ugt0RnwUYBQp1GdTW5HfV8/drZC1OIWiYgfWmCk=;
 b=bJiTOylpIVoP0+rMky2FSZ5gOp9gc1/paCv0mNWaZcJZTIf0BXps+5FmmU69gg9G6X
 iAVfsLxOjPWm2rakSCUXo9JclCezM9uDkCXjNTltkWJ3uFOyXdzQZzxOWwu/5INYa4w8
 JNGS5UXZ8Gpq9UDMiZqPEGJSOqLivKvuRD5OmQB402A5UedXmc7qhnqVshOSrov2Fr2h
 FhOKoAJ4ub8M6IjBccZcbFov/j0A78O2ClOWcjmUO2ZuogPG88nqN52/pTa2s77PBOZL
 mA7CSx0how8PdYAx6V+6L3a0vzOcOVoSmDMxPnsPyFyGZlbYX34KalbOlJruciXxFxJ8
 w6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gvT+ugt0RnwUYBQp1GdTW5HfV8/drZC1OIWiYgfWmCk=;
 b=dEs7W676FrX14mdFpe5yQSYfLCi4h7wH5ewlqGbULqI0KR9Mrf8lL8aAzZQDETuc1f
 3idsr2KQFpHV0/7QgaYp0FHcpydSQUmzz4LRYVgOvCMnWOLcrMUVMaxX+7RVHI0exBew
 BkDkJSZmRf3x5U+PnSj3h6EFd7+29a5xGVMcECeFKJTsforfBm7BP4Yd8/a6zjFTJ1Td
 pSD3yGiljF5RQb9cFgZDjOMSqXtw36HmF3jB/WJ4jmJNM/k7VqyVd/DMVyM0+erwbhpq
 2Lifxj6mI5b9mV5FPOwYr2SbJd22+YFYDi6YYPIZ875RB+vkbenShBuULx9v1qAZ2Pm6
 Rm+A==
X-Gm-Message-State: AOAM531FfBRMtt/sA+KT+DsZv+kbrBC7Da24elYq14mf0Cz2v2tUbR/D
 /DUHnmklDPt0EtO1vU5YAZNhflbjmkI=
X-Google-Smtp-Source: ABdhPJwOZny19K2oWV3ZV7lt0zCwoQTHwbXcl4EgzKNHhU1+38M203/6WU9zRFbbbkc4i45yxYHlYA==
X-Received: by 2002:a17:902:6b0c:b0:13f:aaf4:3df3 with SMTP id
 o12-20020a1709026b0c00b0013faaf43df3mr60206plk.75.1634375284865; 
 Sat, 16 Oct 2021 02:08:04 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:487:fa85:301f:cc98:b428:6b86])
 by smtp.gmail.com with ESMTPSA id d138sm7208936pfd.74.2021.10.16.02.08.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 02:08:04 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v3 5/6] target/riscv: zfh: half-precision floating-point
 classify
Date: Sat, 16 Oct 2021 17:07:40 +0800
Message-Id: <20211016090742.3034669-6-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211016090742.3034669-1-frank.chang@sifive.com>
References: <20211016090742.3034669-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x630.google.com
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
Cc: Frank Chang <frank.chang@sifive.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Chih-Min Chao <chihmin.chao@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/fpu_helper.c                 |  6 ++++++
 target/riscv/helper.h                     |  1 +
 target/riscv/insn32.decode                |  1 +
 target/riscv/insn_trans/trans_rvzfh.c.inc | 12 ++++++++++++
 4 files changed, 20 insertions(+)

diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index ec2009ee65b..388e23ca670 100644
--- a/target/riscv/fpu_helper.c
+++ b/target/riscv/fpu_helper.c
@@ -482,6 +482,12 @@ target_ulong helper_feq_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
     return float16_eq_quiet(frs1, frs2, &env->fp_status);
 }
 
+target_ulong helper_fclass_h(uint64_t rs1)
+{
+    float16 frs1 = check_nanbox_h(rs1);
+    return fclass_h(frs1);
+}
+
 target_ulong helper_fcvt_w_h(CPURISCVState *env, uint64_t rs1)
 {
     float16 frs1 = check_nanbox_h(rs1);
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 9c89521d4ad..d25cf725c57 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -89,6 +89,7 @@ DEF_HELPER_FLAGS_2(fcvt_h_w, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_2(fcvt_h_wu, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_2(fcvt_h_l, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_2(fcvt_h_lu, TCG_CALL_NO_RWG, i64, env, tl)
+DEF_HELPER_FLAGS_1(fclass_h, TCG_CALL_NO_RWG_SE, tl, i64)
 
 /* Special functions */
 DEF_HELPER_2(csrr, tl, env, int)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 3906c9fb201..6c4cde216bc 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -754,6 +754,7 @@ fmv_x_h    1110010  00000 ..... 000 ..... 1010011 @r2
 feq_h      1010010  ..... ..... 010 ..... 1010011 @r
 flt_h      1010010  ..... ..... 001 ..... 1010011 @r
 fle_h      1010010  ..... ..... 000 ..... 1010011 @r
+fclass_h   1110010  00000 ..... 001 ..... 1010011 @r2
 fcvt_h_w   1101010  00000 ..... ... ..... 1010011 @r2_rm
 fcvt_h_wu  1101010  00001 ..... ... ..... 1010011 @r2_rm
 fmv_h_x    1111010  00000 ..... 000 ..... 1010011 @r2
diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
index 8d0959a6671..0549e25fb45 100644
--- a/target/riscv/insn_trans/trans_rvzfh.c.inc
+++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
@@ -372,6 +372,18 @@ static bool trans_fle_h(DisasContext *ctx, arg_fle_h *a)
     return true;
 }
 
+static bool trans_fclass_h(DisasContext *ctx, arg_fclass_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+
+    gen_helper_fclass_h(dest, cpu_fpr[a->rs1]);
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
 static bool trans_fcvt_w_h(DisasContext *ctx, arg_fcvt_w_h *a)
 {
     REQUIRE_FPU;
-- 
2.25.1


