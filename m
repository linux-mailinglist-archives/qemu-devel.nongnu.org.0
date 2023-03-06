Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9B86AC4BF
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 16:24:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZCgE-0005fX-6l; Mon, 06 Mar 2023 10:23:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1pZCgD-0005f8-1V
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:23:13 -0500
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1pZCgB-00082U-5r
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:23:12 -0500
Received: by mail-lj1-x22e.google.com with SMTP id y14so10042950ljq.4
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 07:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull.eu; s=google; t=1678116189;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4mcInI/4U4N6i5DJo3tcvri06NK+P9/SIGrxpJh3TAU=;
 b=gb8AzOeyPIH5AqZSzzbITXzU1Wyh9mIrObM64pUiVgVJdZqfviDF5v30nT1TDafm7L
 ycWERpMXOZpTTFcVOo3I1U3vs/l8EJ0g4B9PMgI/cfj1+c/0/q1zP5PV70OUO2TJvSzp
 li5MgYXoOu+U3SmKCDTxfdaMEKvV9WbjYS5voArWifOd6EhaKI2PAhjxzue71MFjgc7/
 0DaHK2NvuNIDz9koeWWRwkvgCyKYJKXaKnqyBbQkDcok0tgs9g8BrwZn55wMSIOfmvkd
 y5gYeidthQz6gfoCXc6yUvi4Ya0v+JWHYfPfGBsnygB2APBvAVLixxbFve5p7HUs5A8o
 34oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678116189;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4mcInI/4U4N6i5DJo3tcvri06NK+P9/SIGrxpJh3TAU=;
 b=J5/zQEJRoHQn97qkjlmEvMcgSTS48q3B/lfrZDx+SExHuC7pq3QfvTgkPP5TAgqP5C
 52euAL9+oVBDFwpZZ9RZKw3Nio0B8Rvvxk9vUm4fQ6ranGJxLpl4JMjR/t9HmkUYxnBp
 QrljdmYaDQMrAS8s8+7AhgnJacfINy1JM9QPponcvlYbODoPrSMuXELpH36OC3K2gBcc
 9EPim6OAg0d7TrtmZOxNJi6QboT32mCbV3+CrlvNR+LTfvTNuxAWEpwteTgf4aCSlYED
 I5huBSNEe3f1FjbyimS4IEreZl+iWcGbugqEVtEU04C6ILY9v7Un7QOi6i5lO7xxMTEp
 MVkA==
X-Gm-Message-State: AO0yUKVW+ql5ur2TGNjrAifVT+XJhas9FFVUC+Mxyn8t5drNsE1XAy48
 czN8IZjM8S9oXJdJ8DB3pdnqAyIi6scW8aEjwX51uQ==
X-Google-Smtp-Source: AK7set/wno6+QSqenjvLCpViE2qXZ1LsDrKpQZhr9pQThcjJ7Fqy6r0TiL5dqaY9gV796hzuNDMT/w==
X-Received: by 2002:a2e:7d0e:0:b0:295:c454:7579 with SMTP id
 y14-20020a2e7d0e000000b00295c4547579mr3058686ljc.33.1678116188911; 
 Mon, 06 Mar 2023 07:23:08 -0800 (PST)
Received: from ubuntu-focal.. ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id
 r19-20020a2e9953000000b00293534d9760sm1751058ljj.127.2023.03.06.07.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 07:23:08 -0800 (PST)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Cc: Christoph Muellner <christoph.muellner@vrull.eu>,
 Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Subject: [PATCH v4 2/2] target/riscv: redirect XVentanaCondOps to use the
 Zicond functions
Date: Mon,  6 Mar 2023 16:23:03 +0100
Message-Id: <20230306152303.281313-2-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306152303.281313-1-philipp.tomsich@vrull.eu>
References: <20230306152303.281313-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lj1-x22e.google.com
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


