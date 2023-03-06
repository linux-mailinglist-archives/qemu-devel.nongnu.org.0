Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B246AC4C0
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 16:24:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZCgD-0005fB-IP; Mon, 06 Mar 2023 10:23:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1pZCgB-0005dK-R5
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:23:11 -0500
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1pZCg9-000828-Ts
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:23:11 -0500
Received: by mail-lj1-x233.google.com with SMTP id by8so10021613ljb.7
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 07:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull.eu; s=google; t=1678116186;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=phQjsmBlC7b6EvZhKBuLx4oBLBAnc63bWomXpHH2g1M=;
 b=fIWBW78ravSTQs1XphWlZVb3S0NUZZBHXJ92HRTNkBUG/5Ljktcps1RfnfJVLZPi83
 IuTZ+A6Aq978YvmHMhnZxJ6/OI2rHxKfGAVEnswhJ9dnHCOWqZcnsPkd5/+hxaEv6pLX
 rIeH5EX2+XFW9ZdL1kXNqUPwo9tXV6TrVFWK7u7ud42/oLOLvBMQpu0DkWjJzUdc6a12
 9/0rQoOtD+IqHm8dObXAlXlznGiEakC8alvm9eiREKrP2XXQQGTFrwIjAKkJFl9O2lT3
 i93JTjUC3HJsR35IQroUG5RHAqer6Oj2v4ikDQF0zWpuM6L8iQYrHVeBGE/Z0kzSBBJp
 2Tlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678116186;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=phQjsmBlC7b6EvZhKBuLx4oBLBAnc63bWomXpHH2g1M=;
 b=L3a6vej4qV2QdfA42pIt+VTJRCyHChQ7RrwD0gG6y2r+mxfXto0axBTYcpi6IkaZhq
 Wy2JexgaPg9j8L10Tk5pdm+xzchSkFOcJHgkDuIEqwINm2X11ABnWa3kqxaBsmeTAYdl
 2oKyNOWTLJHwSj9sfbkcUQda3qzr263GGWrOu4eyZg0qaNj29tNktqwspWy753k/B7Rn
 rBpZaroJzPikhebouQXeZs1WlUC//6afXO3A5au1lcEr0UgayHt+mEztouZU0gQ8NHD5
 SbSSsJeXakPcxrK86UNpzuRBHVuXaxUKHGpmB1SlYDd69FwVEJ/0TcPUIin4vzun9cHK
 bWrg==
X-Gm-Message-State: AO0yUKXarsk/uQDHwl61aAsiiipMBX8Fk3g/Likq53HOtsKZFB/alz1f
 s63p5t2+lY9EFUd3sBgaWLcVCaKH2gc9p/2KH/0=
X-Google-Smtp-Source: AK7set9zCQqPKMqctJou/69qJLgqTB9OzgpjFi3DEhWJYb4IVCizX6FvaLbrtoTznnh1yBcZxXQrtg==
X-Received: by 2002:a2e:7c07:0:b0:295:a2d0:57ed with SMTP id
 x7-20020a2e7c07000000b00295a2d057edmr3804918ljc.4.1678116186552; 
 Mon, 06 Mar 2023 07:23:06 -0800 (PST)
Received: from ubuntu-focal.. ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id
 r19-20020a2e9953000000b00293534d9760sm1751058ljj.127.2023.03.06.07.23.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 07:23:06 -0800 (PST)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Cc: Christoph Muellner <christoph.muellner@vrull.eu>,
 Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Subject: [PATCH v4 1/2] target/riscv: refactor Zicond support
Date: Mon,  6 Mar 2023 16:23:02 +0100
Message-Id: <20230306152303.281313-1-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lj1-x233.google.com
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

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
---

Changes in v4:
- rebase onto master

Changes in v3:
- don't add this to MAINTAINERS, as it is an official extension

Changes in v2:
- gates availability of the instructions through a REQUIRE_ZICOND
  macro (these were previously always enabled)

 target/riscv/cpu.c                           |  3 --
 target/riscv/insn_trans/trans_rvzicond.c.inc | 36 ++++++++++++--------
 2 files changed, 21 insertions(+), 18 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 5bc0005cc7..88c2484eee 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1191,9 +1191,6 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("x-smaia", RISCVCPU, cfg.ext_smaia, false),
     DEFINE_PROP_BOOL("x-ssaia", RISCVCPU, cfg.ext_ssaia, false),
 
-    DEFINE_PROP_BOOL("x-zvfh", RISCVCPU, cfg.ext_zvfh, false),
-    DEFINE_PROP_BOOL("x-zvfhmin", RISCVCPU, cfg.ext_zvfhmin, false),
-
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/target/riscv/insn_trans/trans_rvzicond.c.inc b/target/riscv/insn_trans/trans_rvzicond.c.inc
index 645260164e..b35cb4cbc7 100644
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
+static inline void gen_czero(TCGv dest, TCGv src1, TCGv src2, TCGCond cond)
 {
-    REQUIRE_ZICOND(ctx);
+    TCGv zero = tcg_constant_tl(0);
+    tcg_gen_movcond_tl(cond, dest, src2, zero, zero, src1);
+}
 
-    TCGv dest = dest_gpr(ctx, a->rd);
-    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
-    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
+static inline void gen_czero_eqz(TCGv dest, TCGv src1, TCGv src2)
+{
+    gen_czero(dest, src1, src2, TCG_COND_EQ);
+}
 
-    tcg_gen_movcond_tl(TCG_COND_EQ, dest, src2, ctx->zero, ctx->zero, src1);
-    gen_set_gpr(ctx, a->rd, dest);
-    return true;
+static inline void gen_czero_nez(TCGv dest, TCGv src1, TCGv src2)
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


