Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AADAE67588B
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 16:28:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pItIu-0000hY-4i; Fri, 20 Jan 2023 10:27:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1pItIt-0000hM-1d
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 10:27:43 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1pItIr-00018r-9R
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 10:27:42 -0500
Received: by mail-ed1-x52e.google.com with SMTP id y11so7095055edd.6
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 07:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OO8boWoJfM09Xq5sOkJUZOrEQC5aGkqlzTjNWCB2+cI=;
 b=fQNhrilS8xPRfq85+Ke11XeXFhSWXVjaSGQZ/NsC3d39guAcw9FLJC1zaCWtqWa1ml
 Hy44K47MKJnUwSVdHSb6+Nfqanw3TfQQyt5a3o+YALcB0yhRC1HHAa6wsq/uP6iWjmJG
 Av/XfJ6wBFXZmZj90Su4TecNn66QUpvUAEcjmtnz53TyceRoOqi6edm0xZ9AYLrEtI8y
 2Y4GkdqNq7JQm1H1hSdtKA62lLRAphzTG0aFA7FxO6/LTo8CNeseaYGxwIexDKg8mK3H
 MXUrF5F6sDA3JkXb3rYQ2naCcMGCeY7R+O8QcIxMh7k5KRCNJeuRo75aw6RUNfQzPehF
 0R5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OO8boWoJfM09Xq5sOkJUZOrEQC5aGkqlzTjNWCB2+cI=;
 b=5xdWKOU5pvzR7rJmRC1PZoAVJ/9I40fxOE2EjQYzK/tWRhwQB6NcUWmPf7T58tHYyI
 kqwpb32tAZDs8Zm2F4ri+uIBE3gKmxKLzPrvD/59w+l3GKfxyeZw77xSi6nJLj+sS4I5
 5sRjLyhRVZmIp3WMpvdBJ9mE6p4cWvSOh1Q0Bb+/NNgs+kK03YQ/hAS6XLktoPwSyXFF
 07943XcT50F2Zf+uOZsaOFPLY4f4e59kwrZoYHhfefwn4IIRS8aneBDngjCf8S+SKW8A
 YSPX1zw6tPgDzzwfTBjMLQxpiZoG26XqFZRiTocPW9gBWfdbyKXF9tvBbX3bQXBRgRgf
 drHw==
X-Gm-Message-State: AFqh2kr1jyhuCvKfzzghzke1mUYlS+WYtLGAAbSFXO7yAnXWrmQ6enK2
 RXLoFQdI0XNDAI/Bnu6cOfq2zkv4xtG2yL7LROE=
X-Google-Smtp-Source: AMrXdXsJP0pB59nPfeZDtmGUQXFncTK2+MbSJjkAaP2oFhDR/wrDBPEzxCd26pTX50agztQUpVWFVA==
X-Received: by 2002:a05:6402:5d3:b0:49b:58ca:ebbc with SMTP id
 n19-20020a05640205d300b0049b58caebbcmr18543445edx.32.1674228459303; 
 Fri, 20 Jan 2023 07:27:39 -0800 (PST)
Received: from ubuntu-focal.. ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id
 a3-20020aa7cf03000000b0049019b48373sm17404682edy.85.2023.01.20.07.27.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 07:27:38 -0800 (PST)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Cc: Christoph Muellner <christoph.muellner@vrull.eu>,
 Kito Cheng <kito.cheng@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Subject: [PATCH v1 2/2] target/riscv: redirect XVentanaCondOps to use the
 Zicond functions
Date: Fri, 20 Jan 2023 16:27:30 +0100
Message-Id: <20230120152730.1024206-2-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230120152730.1024206-1-philipp.tomsich@vrull.eu>
References: <20230120152730.1024206-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-ed1-x52e.google.com
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

Also updating MAINTAINERS as trans_xventanacondops.c.inc will not see
active maintenance from here forward.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
---

 MAINTAINERS                                    |  2 +-
 .../insn_trans/trans_xventanacondops.c.inc     | 18 +++---------------
 2 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ca914c42fa..293a9d1c8c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -305,7 +305,7 @@ F: target/riscv/insn_trans/trans_zicond.c.inc
 RISC-V XVentanaCondOps extension
 M: Philipp Tomsich <philipp.tomsich@vrull.eu>
 L: qemu-riscv@nongnu.org
-S: Supported
+S: Odd Fixes
 F: target/riscv/XVentanaCondOps.decode
 F: target/riscv/insn_trans/trans_xventanacondops.c.inc
 
diff --git a/target/riscv/insn_trans/trans_xventanacondops.c.inc b/target/riscv/insn_trans/trans_xventanacondops.c.inc
index 16849e6d4e..d6dbe89a77 100644
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
+    return trans_czero_eqz(ctx, a);
 }
 
 static bool trans_vt_maskcn(DisasContext *ctx, arg_r *a)
 {
-    return gen_vt_condmask(ctx, a, TCG_COND_EQ);
+    return trans_czero_nez(ctx, a);
 }
-- 
2.34.1


