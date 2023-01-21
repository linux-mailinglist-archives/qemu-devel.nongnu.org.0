Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C701967631A
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Jan 2023 03:36:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJ3jU-00053h-Tg; Fri, 20 Jan 2023 21:35:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1pJ3jT-00053S-Io
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 21:35:51 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1pJ3jR-0006Lq-Jw
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 21:35:51 -0500
Received: by mail-ej1-x62e.google.com with SMTP id qx13so18241191ejb.13
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 18:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mrDJX6tEw8eyIbS+SxBClOaPOhVzYIKsavfi8eYTSMU=;
 b=jrB7NZW7oiAo2rwhqbddSEB94iO2uEMB+34UeLrcKNYs7iIdUcbmtwn+omhqD1CEay
 4dkmDkywYyE3z8gTbqO9JJ9l+Ct80XGyz2aQ4ujOuORxkjAMJ6EdZXztogQnKcFP9xyH
 rcfEUifASBdlKzg+KCwRjiJrWhr07FuvODJoIM85D88TUtktPMNDCMRAqvnYI+WB08Dp
 aalhXcKvk2oEnvbU/vmeISKDkfMoBsif31z3oCTlazqnTg9xFrY5nFPLWy+EpCnGkO+a
 mzGvXaVZlpqdP7fI+Xz9raD3zvX013bVZmiaVlngWeAHiSXdgQdUvYyN0VN6mV47FYZ/
 T1sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mrDJX6tEw8eyIbS+SxBClOaPOhVzYIKsavfi8eYTSMU=;
 b=2T6Wk/6aT+mqr2xDHiB357a0MIiK5VB0RNAyKqA03pmp9AGbrZJ60a8Ftssy9q+QRN
 9WZiXB3LH9+6qkVT6KRFTvTuuTLOfcZqUNmk8qQlBqTKfvsAXAkkE/kJMeRdvfI1c29z
 Jh1jiW7RVu+x8zgso2Lg/mVnDDCzL0pQj0k/jOMypPiw5TMVn4uD3bEFEjAxREYTDlBE
 eWkKUAv8FkLb95dJ6pexow0GuOlqnjrL/sRV90JQidc7sZOquFpcoGAnf2AD8h8MzBL2
 ZDxED2myG/uRKVo7npmyyUmgEmz1d/p5v7a71FAVpH/r7+/+FvnkmeA2mZmNcuDO2JyR
 qSfQ==
X-Gm-Message-State: AFqh2krKB+ayY/AgMtM82NUnLyjVnvUEqNfUpQNA+K7nJzcvDC5I61aU
 V67LNkvbgzWR9yWO0xY/bf0TyahHXeHekZdwQfM=
X-Google-Smtp-Source: AMrXdXuZt63Q6OzlscTSA54Lm/FGXDgeewCwMFIqGBokq0j9nS44fwYgAhI+CZT0XkFck5Xkq26qvQ==
X-Received: by 2002:a17:906:6814:b0:870:ef77:e186 with SMTP id
 k20-20020a170906681400b00870ef77e186mr16673536ejr.49.1674268547185; 
 Fri, 20 Jan 2023 18:35:47 -0800 (PST)
Received: from ubuntu-focal.. ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170906059100b007933047f923sm18742430ejn.118.2023.01.20.18.35.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 18:35:46 -0800 (PST)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>,
 Christoph Muellner <christoph.muellner@vrull.eu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Subject: [PATCH v2 2/2] target/riscv: redirect XVentanaCondOps to use the
 Zicond functions
Date: Sat, 21 Jan 2023 03:35:42 +0100
Message-Id: <20230121023542.1726168-2-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230121023542.1726168-1-philipp.tomsich@vrull.eu>
References: <20230121023542.1726168-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-ej1-x62e.google.com
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

Changes in v2:
- Calls into the gen_czero_{eqz,nez} helpers instead of calling
  trans_czero_{eqz,nez} to bypass the require-check and ensure that
  XVentanaCondOps can be enabled/disabled independently of Zicond.

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


