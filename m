Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E9F4606BC
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Nov 2021 15:15:47 +0100 (CET)
Received: from localhost ([::1]:60738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrKy1-00087z-Rf
	for lists+qemu-devel@lfdr.de; Sun, 28 Nov 2021 09:15:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mrKhC-0006HS-1U; Sun, 28 Nov 2021 08:58:22 -0500
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:34526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mrKh5-0004fS-0u; Sun, 28 Nov 2021 08:58:21 -0500
Received: from mailhost.u-ga.fr (mailhost1.u-ga.fr [152.77.1.10])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id F19C3402A2;
 Sun, 28 Nov 2021 14:57:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1638107868;
 bh=WGQAv6+5Kh8wKM6v+02trGtG8TpdNE72XAOl2ytPiz8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=zJCk9ypUUuuarUoQKg/4LcBxN12oDCWnEP4nvv+aCxWxRmStBrczQz69g/ihbN8HL
 74/Diu8UZp6P3nG12z2hqFT/KVCl76dvIPmcBaYfVcNFqXy3PNjhCbMSDSxDsyyNYB
 3KZX5kq4/bplrU1EVIzoyc+QvEOn+MZ36sv6Y0K0qJBO1S7tKkpMywNNg/zWdMF9JF
 1oxugWIxm7TBe63TtSSaT7Qux35jnMQg422uegjzjhBlCpYXmhWIdnL5D8PW4Ze23C
 3LRwXOF0TP2nfZQ0Jqrt8YbNiOrKTV+u+7qA2fxw8GvGBjBrpRMSKemuZIEOnIQJxp
 kKVOIxj8ZrQiA==
Received: from smtps.univ-grenoble-alpes.fr (smtps3.u-ga.fr [195.83.24.62])
 by mailhost.u-ga.fr (Postfix) with ESMTP id DAB8F60067;
 Sun, 28 Nov 2021 14:57:48 +0100 (CET)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id ABF7140069;
 Sun, 28 Nov 2021 14:57:48 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v6 10/18] target/riscv: support for 128-bit bitwise
 instructions
Date: Sun, 28 Nov 2021 14:57:11 +0100
Message-Id: <20211128135719.50444-11-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211128135719.50444-1-frederic.petrot@univ-grenoble-alpes.fr>
References: <20211128135719.50444-1-frederic.petrot@univ-grenoble-alpes.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (41)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 195.83.24.62
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: bin.meng@windriver.com, richard.henderson@linaro.org,
 alistair.francis@wdc.com, fabien.portas@grenoble-inp.org, palmer@dabbelt.com,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 128-bit bitwise instructions do not need any function prototype change
as the functions can be applied independently on the lower and upper part of
the registers.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index b6127783b3..4790dc0cb4 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -448,7 +448,15 @@ static bool gen_logic_imm_fn(DisasContext *ctx, arg_i *a,
 
     func(dest, src1, a->imm);
 
-    gen_set_gpr(ctx, a->rd, dest);
+    if (get_xl(ctx) == MXL_RV128) {
+        TCGv src1h = get_gprh(ctx, a->rs1);
+        TCGv desth = dest_gprh(ctx, a->rd);
+
+        func(desth, src1h, -(a->imm < 0));
+        gen_set_gpr128(ctx, a->rd, dest, desth);
+    } else {
+        gen_set_gpr(ctx, a->rd, dest);
+    }
 
     return true;
 }
@@ -462,7 +470,16 @@ static bool gen_logic(DisasContext *ctx, arg_r *a,
 
     func(dest, src1, src2);
 
-    gen_set_gpr(ctx, a->rd, dest);
+    if (get_xl(ctx) == MXL_RV128) {
+        TCGv src1h = get_gprh(ctx, a->rs1);
+        TCGv src2h = get_gprh(ctx, a->rs2);
+        TCGv desth = dest_gprh(ctx, a->rd);
+
+        func(desth, src1h, src2h);
+        gen_set_gpr128(ctx, a->rd, dest, desth);
+    } else {
+        gen_set_gpr(ctx, a->rd, dest);
+    }
 
     return true;
 }
-- 
2.34.0


