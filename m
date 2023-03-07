Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5849D6AEDE6
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:08:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbis-0007cu-N6; Tue, 07 Mar 2023 13:07:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1pZbib-0007HU-As
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:07:21 -0500
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1pZbiX-0002Ed-Vj
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:07:21 -0500
Received: by mail-lf1-x12f.google.com with SMTP id i9so18222241lfc.6
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 10:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull.eu; s=google; t=1678212435;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ERC/6VeDxTNXUnmBsoLervfyIDOlgZLJqgjanTmGNl4=;
 b=nXiJ2Ul04KbM0Yi5l3KtOjN1zIgYX9R8DCB8hG7kITam8GR3XigCnp9IvOyNHER3+X
 8SFLLC0a001B5RGg1JOjt09Qtt3gApEuXODp4TKBLczfLTY9mUvpqs4TFL2k2UvNUbxx
 gfvPbmD8r9bVnfCPqM3N3/7QUmFuM9r3gQnuwwuX1Z4CawMcW/nCkhVk88G1wTi8JIT4
 gd6zNQal2/+VeJDXZAiJ2GBuhIWybN+aEE3n4lOmSwf/XVAdisVT/cGaj8KByEeYU5qh
 Cf3t+0keqzGl5BO0MNTySSJXG5h6Nqw4SN+R0ZSv8sAU+jGWxseDCo/rZt2esoxdhcbX
 2S0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678212435;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ERC/6VeDxTNXUnmBsoLervfyIDOlgZLJqgjanTmGNl4=;
 b=75/QJrr97gOnFLcu2jAx/2A2TPEKe4sUVjjF0P3w+yGgspMqNJXCfORYi7WbYbkpxl
 /hPrXeUd2j9AGF5OF7+PBm9LxpZss9xB/JRqDy5SUJKEP0JZDsZVy4LpBs/cxpKu9INk
 FYwjxXhNasLsDLcgz6nMm6lZCaWzDodXO9POBHzlxg65PQzi2Pa0VosPILQWd4c5RpYi
 a19Guq3VsPEVSSWwb7BWZzioVKrylP3wqsxmqbgJkdfl2o+J/ewKnhobhfMIiAStD4YM
 SO5e8i1iSkAwS8RJb9yFwE77z06nE1DwnTAQBM9o9qo/v4hlAxaP6i9cMzC8w73SOqcZ
 Dk/A==
X-Gm-Message-State: AO0yUKX+emRCxUPqA5JgQma5KLZu7ZK+x5qqRWQrZgV8ZXM9o0G+n1iR
 xirxu+U2HNEIN8P5Xv2HC5JtWululGvM9rNUz9zWbw==
X-Google-Smtp-Source: AK7set+YRT+pXLw7FD1p2wP9GYfbE4X0CDHpOKc/VAlOX1b2WlZYUoY19LH+vlpqgdITf+uPn2W/9Q==
X-Received: by 2002:ac2:4857:0:b0:4e6:630f:3c1d with SMTP id
 23-20020ac24857000000b004e6630f3c1dmr4019133lfy.19.1678212435536; 
 Tue, 07 Mar 2023 10:07:15 -0800 (PST)
Received: from ubuntu-focal.. ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a2eb5ad000000b0028b6e922ba1sm2266952ljn.30.2023.03.07.10.07.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 10:07:15 -0800 (PST)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Christoph Muellner <christoph.muellner@vrull.eu>,
 Kito Cheng <kito.cheng@sifive.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Subject: [PATCH v5 1/2] target/riscv: refactor Zicond support
Date: Tue,  7 Mar 2023 19:07:07 +0100
Message-Id: <20230307180708.302867-2-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307180708.302867-1-philipp.tomsich@vrull.eu>
References: <20230307180708.302867-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x12f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

After the original Zicond support was stuck/fell through the cracks on
the mailing list at v3 (and a different implementation was merged in
the meanwhile), we need to refactor Zicond to prepare it to be reused
by XVentanaCondOps.

This commit lifts the common logic out into gen_czero and uses this
via gen_logic and 2 helper functions (effectively partial closures).

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
---

Changes in v5:
- fix a rebase artifact
- drop the 'inline' specifiers (as per review comments)

Changes in v4:
- rebase onto master

Changes in v3:
- don't add this to MAINTAINERS, as it is an official extension

Changes in v2:
- gates availability of the instructions through a REQUIRE_ZICOND
  macro (these were previously always enabled)

 target/riscv/insn_trans/trans_rvzicond.c.inc | 36 ++++++++++++--------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvzicond.c.inc b/target/riscv/insn_trans/trans_rvzicond.c.inc
index 645260164e..c8e43fa325 100644
--- a/target/riscv/insn_trans/trans_rvzicond.c.inc
+++ b/target/riscv/insn_trans/trans_rvzicond.c.inc
@@ -2,6 +2,7 @@
  * RISC-V translation routines for the Zicond Standard Extension.
  *
  * Copyright (c) 2020-2023 PLCT Lab
+ * Copyright (c) 2022 VRULL GmbH.
  *
  * This program is free software; you can redistribute it and/or modify it
  * under the terms and conditions of the GNU General Public License,
@@ -22,28 +23,33 @@
     }                                     \
 } while (0)
 
-static bool trans_czero_eqz(DisasContext *ctx, arg_czero_eqz *a)
+/* Emits "$rd = ($rs2 <cond> $zero) ? $zero : $rs1" */
+static void gen_czero(TCGv dest, TCGv src1, TCGv src2, TCGCond cond)
 {
-    REQUIRE_ZICOND(ctx);
+    TCGv zero = tcg_constant_tl(0);
+    tcg_gen_movcond_tl(cond, dest, src2, zero, zero, src1);
+}
 
-    TCGv dest = dest_gpr(ctx, a->rd);
-    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
-    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
+static void gen_czero_eqz(TCGv dest, TCGv src1, TCGv src2)
+{
+    gen_czero(dest, src1, src2, TCG_COND_EQ);
+}
 
-    tcg_gen_movcond_tl(TCG_COND_EQ, dest, src2, ctx->zero, ctx->zero, src1);
-    gen_set_gpr(ctx, a->rd, dest);
-    return true;
+static void gen_czero_nez(TCGv dest, TCGv src1, TCGv src2)
+{
+    gen_czero(dest, src1, src2, TCG_COND_NE);
 }
 
-static bool trans_czero_nez(DisasContext *ctx, arg_czero_nez *a)
+static bool trans_czero_eqz(DisasContext *ctx, arg_r *a)
 {
     REQUIRE_ZICOND(ctx);
 
-    TCGv dest = dest_gpr(ctx, a->rd);
-    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
-    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
+    return gen_logic(ctx, a, gen_czero_eqz);
+}
+
+static bool trans_czero_nez(DisasContext *ctx, arg_r *a)
+{
+    REQUIRE_ZICOND(ctx);
 
-    tcg_gen_movcond_tl(TCG_COND_NE, dest, src2, ctx->zero, ctx->zero, src1);
-    gen_set_gpr(ctx, a->rd, dest);
-    return true;
+    return gen_logic(ctx, a, gen_czero_nez);
 }
-- 
2.34.1


