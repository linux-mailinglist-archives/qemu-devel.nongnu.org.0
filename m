Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 358D06AEE14
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:09:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbiq-0007X7-4g; Tue, 07 Mar 2023 13:07:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1pZbia-0007HT-LF
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:07:21 -0500
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1pZbiY-0002Et-On
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:07:20 -0500
Received: by mail-lj1-x22f.google.com with SMTP id h9so14093052ljq.2
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 10:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull.eu; s=google; t=1678212436;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NHJay4ce3B+fiMZgQq8mM0+ZSTOYugM1PlSvfvjKr04=;
 b=so7XTYdlB8XW05XMRlIYTQGkabileW49aPd/Mj/RG+DUnI8cdrauwCkRzPG5+oLBFa
 qLk3YYh6VXv7DEGBXuXGWhRNaUHV7bC1+KWnJPcog6i8Z5zmVbXKHUdJBXq946b+Dule
 IrXiSHi00dFbKuj8WBRjDIIRNVR8wrPPTvTo+tv/ZuYYLiI/8OQZCe+VEschtU7Lb+Nc
 tStZkmF9tSfsGRcmaoZ+DWlsgCbjaMEdJOLeKJTLxY4Id8nKPOOvWO0E8oMN6uF/NV9r
 kWzb9hDCA8XoTVp1PPSAbxSmQsmGbtMK4oYZfkaRnwV+IYu3E182PyP/SgDUa274rGAN
 bl5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678212436;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NHJay4ce3B+fiMZgQq8mM0+ZSTOYugM1PlSvfvjKr04=;
 b=fROlq+QF0xYLzCjZ0FbGoFaDX0RbQTTH1X62hEa3VzBpX8JEKmp6FvD2qcqv0Ck4Yl
 NYZy8RNDf4xxt/tEv3Wr1lrYl1SNjov2m9N3LwUi3FK03HxriE66uaJFsck2fquESA0j
 yLvK621lAUG2gwu0aGhCKJzwqZcuXuP34ZmsIut1SsWIKEYpQFO6319gViACvGO+fg3E
 DCBtVdXbgn0A7pVwUBOoTRgCZbS23Ey7Z9SazU/LFUZ0UxhWly1p+CqZHJS5AI24hUAB
 XK9SWQ9U6f865C1Fdn2bfmjAurn+NBUEq5+STUWUx0Ka92Gr1DI0xv/GJDT9cuAzS4b3
 xOBA==
X-Gm-Message-State: AO0yUKWxQeD+/zrO0QahBeBtAkYp2C1m0QONLtBBVPBXMMxPltUiez/a
 yMQBmv9Uq8Jt/vg31SjXvcupvF3Ga7K8UYw/S3InGw==
X-Google-Smtp-Source: AK7set/T7YbHwlX/+eCZFb2+olZsYtsOuGAOp7L94h+EdV5oSXlBGIK7KHux3ldoDCAiTK7q+7D47A==
X-Received: by 2002:a2e:b051:0:b0:295:9d9c:24aa with SMTP id
 d17-20020a2eb051000000b002959d9c24aamr4634619ljl.11.1678212436379; 
 Tue, 07 Mar 2023 10:07:16 -0800 (PST)
Received: from ubuntu-focal.. ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a2eb5ad000000b0028b6e922ba1sm2266952ljn.30.2023.03.07.10.07.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 10:07:15 -0800 (PST)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Christoph Muellner <christoph.muellner@vrull.eu>,
 Kito Cheng <kito.cheng@sifive.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Subject: [PATCH v5 2/2] target/riscv: redirect XVentanaCondOps to use the
 Zicond functions
Date: Tue,  7 Mar 2023 19:07:08 +0100
Message-Id: <20230307180708.302867-3-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307180708.302867-1-philipp.tomsich@vrull.eu>
References: <20230307180708.302867-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lj1-x22f.google.com
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

The Zicond standard extension implements the same instruction
semantics as XVentanaCondOps, although using different mnemonics and
opcodes.

Point XVentanaCondOps to the (newly implemented) Zicond implementation
to reduce the future maintenance burden.

Also updating MAINTAINERS as trans_xventanacondops.c.inc.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
---

(no changes since v3)

Changes in v3:
- Don't downgrade to "Odd Fixes", but rather to "Maintained" (we are
  not being paid to look after this, but will look after it
  nonetheless).

Changes in v2:
- Calls into the gen_czero_{eqz,nez} helpers instead of calling
  trans_czero_{eqz,nez} to bypass the require-check and ensure that
  XVentanaCondOps can be enabled/disabled independently of Zicond.

 MAINTAINERS                                    |  2 +-
 .../insn_trans/trans_xventanacondops.c.inc     | 18 +++---------------
 2 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 011fd85a09..1ad3c6fc9a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -311,7 +311,7 @@ F: target/riscv/xthead*.decode
 RISC-V XVentanaCondOps extension
 M: Philipp Tomsich <philipp.tomsich@vrull.eu>
 L: qemu-riscv@nongnu.org
-S: Supported
+S: Maintained
 F: target/riscv/XVentanaCondOps.decode
 F: target/riscv/insn_trans/trans_xventanacondops.c.inc
 
diff --git a/target/riscv/insn_trans/trans_xventanacondops.c.inc b/target/riscv/insn_trans/trans_xventanacondops.c.inc
index 16849e6d4e..38c15f2825 100644
--- a/target/riscv/insn_trans/trans_xventanacondops.c.inc
+++ b/target/riscv/insn_trans/trans_xventanacondops.c.inc
@@ -1,7 +1,7 @@
 /*
  * RISC-V translation routines for the XVentanaCondOps extension.
  *
- * Copyright (c) 2021-2022 VRULL GmbH.
+ * Copyright (c) 2021-2023 VRULL GmbH.
  *
  * This program is free software; you can redistribute it and/or modify it
  * under the terms and conditions of the GNU General Public License,
@@ -16,24 +16,12 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-static bool gen_vt_condmask(DisasContext *ctx, arg_r *a, TCGCond cond)
-{
-    TCGv dest = dest_gpr(ctx, a->rd);
-    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
-    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
-
-    tcg_gen_movcond_tl(cond, dest, src2, ctx->zero, src1, ctx->zero);
-
-    gen_set_gpr(ctx, a->rd, dest);
-    return true;
-}
-
 static bool trans_vt_maskc(DisasContext *ctx, arg_r *a)
 {
-    return gen_vt_condmask(ctx, a, TCG_COND_NE);
+    return gen_logic(ctx, a, gen_czero_eqz);
 }
 
 static bool trans_vt_maskcn(DisasContext *ctx, arg_r *a)
 {
-    return gen_vt_condmask(ctx, a, TCG_COND_EQ);
+    return gen_logic(ctx, a, gen_czero_nez);
 }
-- 
2.34.1


