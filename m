Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B64E6F7A44
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:04:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujrK-0007ya-GP; Thu, 04 May 2023 21:03:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujrI-0007yP-KX
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:03:40 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujrH-0006sM-09
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:03:40 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-64115e652eeso16410845b3a.0
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248617; x=1685840617;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T4aY8YM6365clacuLSclfItYOK7GtpdOeg6+yztwDiQ=;
 b=I9vaWfCw1+l53EJyvYjlAbS6HqxlhdjXoKaQUkNBnz8yTvq/Vlswkvmhg320jdMON3
 muQ+G6ctRCycLh81uRN38j0c3t4nDowQZE/7NibUnTOGfNVsf3dZx0pVOzeQWPyCh1HP
 kyQZ6HayyaKUEN4OAibpsgl3Wn3EQ1itcV2Zkj5WGq1QznqIku/DCyP+jJFKo/1j/Yxw
 clF+qoBr32sgZX6HnpdoEqKU6nihqK7CJBK7h9gAP8W1gUJNoNEe5rYriIPj/tHeYMOl
 jiyTAuoFSjG4wr+/CRxCGtCVokBQGjOLfLU9EK7/w506ZLPtvJHTa9xe164QrV9Fonu8
 D6sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248617; x=1685840617;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T4aY8YM6365clacuLSclfItYOK7GtpdOeg6+yztwDiQ=;
 b=YgsHkRiJx55KCNpxvcxEfI57T00by1EaYrzQ8F6mdhScndvIGfsKEyRyQ6IkYE0Irg
 V2jT9Tqw2bOPxobj92fFteWcFGuU9iS/OjjlUXdCYnFpscu6qrqczwvK+IH3v6fVdmWX
 y1Y2uy57AFl/j8XZjfYVeyDRwT5sC3KcFnH3eLBoC5rbeP0c5NujstTlTAuymviyWP7h
 8COJamySEUoUrT//KQ9cA6gWdC0sJnS4Tbq9MCnQGGW3IUcPaoAd2ABMIEeaOEP/Qf2n
 GrE8pvcWe3E+HNsFI9JiVBD2Z4D1y1Ph8JeT6r4pLGUUSRoXK+q9Bb6B37lKUtf9rKcQ
 GOEw==
X-Gm-Message-State: AC+VfDx4/u8BVnfQMhaVp3KLqaWqh35+9SyWOlw6g1CbnCTE8YHauAnC
 HK/ZbOv3HBZOmbQ5ziNC1dA8YjTIuzXrDA==
X-Google-Smtp-Source: ACHHUZ68gkrxpTfCdu30NGdd60equh36hn0eRXNB8besKs03V8urFJVPKgrQIDklfIL3VtXDhwbp9w==
X-Received: by 2002:a17:903:1cd:b0:1a9:581b:fbb1 with SMTP id
 e13-20020a17090301cd00b001a9581bfbb1mr6173188plh.32.1683248617335; 
 Thu, 04 May 2023 18:03:37 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:03:36 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 06/89] target/riscv: refactor Zicond support
Date: Fri,  5 May 2023 11:01:18 +1000
Message-Id: <20230505010241.21812-7-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Philipp Tomsich <philipp.tomsich@vrull.eu>

After the original Zicond support was stuck/fell through the cracks on
the mailing list at v3 (and a different implementation was merged in
the meanwhile), we need to refactor Zicond to prepare it to be reused
by XVentanaCondOps.

This commit lifts the common logic out into gen_czero and uses this
via gen_logic and 2 helper functions (effectively partial closures).

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230307180708.302867-2-philipp.tomsich@vrull.eu>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
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
2.40.0


