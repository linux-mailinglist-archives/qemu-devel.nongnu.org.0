Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEE844E9F5
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 16:22:08 +0100 (CET)
Received: from localhost ([::1]:43592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlYNT-0003Hv-Gd
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 10:22:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mlY2k-000480-Ob; Fri, 12 Nov 2021 10:00:42 -0500
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:41354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mlY2e-0005xO-PA; Fri, 12 Nov 2021 10:00:40 -0500
Received: from mailhost.u-ga.fr (mailhost2.u-ga.fr [129.88.177.242])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id A778141F4B;
 Fri, 12 Nov 2021 16:00:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1636729202;
 bh=OQYpdTI/TXeJNZqJxWgOtOpWNx5Pe2PJGi5/7VlsCSY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=xwBz6Y0eaatvBKIRZ8/d8YBW6q4ihIqOvHVYeeIn6TJwHPHmPbNDVsnPY4/gn+LPj
 NeAvl3g1kvNgzA7pQQwrwCZ9t8hAOPP1zTQu46mRdJ8XWxLaqNm/1Bazz7hM/3Vzm5
 NAV3D3p5QaFU5dHgucrgHYr3o0YpptypZEXJ8tP11MXpeBQUXoz2Eh5Z/UBJXBoS0b
 9AHMLOV8/GjyMrJ1a5jRx83O96+T9r+Oiw87EV9gOp8gq8roI0+mXScYw3s2FvFMXa
 devczadauZxM7xtdpPePrOnLOoEMopQPIvTulWc7IEmMzQvcx/6c3UQBKWEZEUsqmy
 xpXv4Z4aZhzVA==
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 8DB0860066;
 Fri, 12 Nov 2021 16:00:02 +0100 (CET)
Received: from palmier.tima.u-ga.fr (unknown [217.114.201.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 42D2614005C;
 Fri, 12 Nov 2021 16:00:02 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v5 10/18] target/riscv: support for 128-bit bitwise
 instructions
Date: Fri, 12 Nov 2021 15:58:54 +0100
Message-Id: <20211112145902.205131-11-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112145902.205131-1-frederic.petrot@univ-grenoble-alpes.fr>
References: <20211112145902.205131-1-frederic.petrot@univ-grenoble-alpes.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (41)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 152.77.18.2
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
---
 target/riscv/translate.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 554cf05084..508ae87985 100644
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
2.33.1


