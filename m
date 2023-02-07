Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 494B168DBCE
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 15:40:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPP8a-00079F-9K; Tue, 07 Feb 2023 09:40:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1pPP8X-00078p-Tj
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:39:57 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1pPP8U-00019M-S1
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:39:57 -0500
Received: by mail-ed1-x534.google.com with SMTP id l14so5869599eds.4
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 06:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QIUGw87YvOml+etbXafxEw1gLC4ghxYHYpZXODHiBRo=;
 b=NWDg5Yj/ofVHps05/b+bL8k5+IvVh5ZKU7FLRkE1oLqkuS4CzXN4IUVtmblyLpWcz4
 Xj2v28A8jIegO+8Up2gLNI0y04RUM7yPnfH6tpCHROVWZVxSl7u2ANQZUPs3BouYhPs+
 suib9EDUtepS9K1GYRaNbinmfB90hxFv3eQBa1whpnjP+WwDmp8hA2z+x1PxoZajewkM
 POvm/NM+dHucWEfxjB3LQpp0MsyxEa1l7LBlhiYLFuxClkNqAQVcL3YDZiWZb4OEi1e8
 lsPn4m4ARYGYBNvheN6q3kYy3kNX3+55B3qr833vmDxGkawzW6uFdg901qmQU8/mBfzy
 WV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QIUGw87YvOml+etbXafxEw1gLC4ghxYHYpZXODHiBRo=;
 b=KqTm4YUoHvofOxOh4Cwryw56aSodDOleFbJgayucRQN3i39vkjKIsng8NZVJKns6u4
 rLMMD02MgVk1NXbywd7ZXKxc7wXFrs9K/8Ef62vBGa7xynH3F549L8WihUq5H1InzK1N
 xi86k3Hb213cfPU6/j6nOcrg+MlzIvwwMfQdTbf0eTY4hZOLePOdBlOweW6kKxmpIgnG
 2VFNx8XOKmmNpOolQqBYOrakLwFziGRpWbgg2ZG1xKWPOm2/WlMWXq+3OdGW5nw2UIbf
 /g57Bm+tiURM6RPJ+oFCEzCZONL4KqPsZaOKQ4uuPSYocyYMlB54h9WiZauQVTeIkvWA
 337w==
X-Gm-Message-State: AO0yUKWBZS4UelcJtVZLNGNWo8V0KFDIorTDCbgEc9REn21/xUko2XJB
 F11tkcBSqJW9nhOslvzdJNVGalSxxj8nFC9RDNE=
X-Google-Smtp-Source: AK7set/lcyKN/ll2rRJRtPQayNE9esghwOJrZeKKxmM7MpM5+ACYsnZnLiLxp9Mg8L8Uqko3/pa99Q==
X-Received: by 2002:a50:cd17:0:b0:4aa:a964:e6e0 with SMTP id
 z23-20020a50cd17000000b004aaa964e6e0mr3828367edi.18.1675780792092; 
 Tue, 07 Feb 2023 06:39:52 -0800 (PST)
Received: from ubuntu-focal.. ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id
 v21-20020a50d595000000b004aaa09d50adsm4742249edi.94.2023.02.07.06.39.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 06:39:51 -0800 (PST)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>,
 Christoph Muellner <christoph.muellner@vrull.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Subject: [PATCH v3 2/2] target/riscv: redirect XVentanaCondOps to use the
 Zicond functions
Date: Tue,  7 Feb 2023 15:39:44 +0100
Message-Id: <20230207143944.1883400-2-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230207143944.1883400-1-philipp.tomsich@vrull.eu>
References: <20230207143944.1883400-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-ed1-x534.google.com
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
index fa10ecaeb9..0ee82c5213 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -298,7 +298,7 @@ F: linux-user/host/riscv64/
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


