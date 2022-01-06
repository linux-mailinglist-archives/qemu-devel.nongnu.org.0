Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49364486BA0
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 22:10:01 +0100 (CET)
Received: from localhost ([::1]:57898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5a1I-0007LL-B4
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 16:10:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1n5ZtQ-0002UV-1e; Thu, 06 Jan 2022 16:01:52 -0500
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:56398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1n5ZtO-0002gc-DW; Thu, 06 Jan 2022 16:01:51 -0500
Received: from mailhost.u-ga.fr (mailhost2.u-ga.fr [129.88.177.242])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 60E2140421;
 Thu,  6 Jan 2022 22:01:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1641502883;
 bh=HtpkLMVpnXT31JxGhix9UUNSWoBaDCKviaxWe6h3ueg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HQgsKeEqRNrRmZnaoYDnjgYaDkVjBXeI2iYtjRcv1qy0/veMzXrSxlq1/j21D4xIk
 vqijB5UbCEw5HR4K22FaX/YZ73rE8vnkUu5PHP+PoZAyRX7cVk1C/ynFs7NAi3X1Sk
 qtnn2ACC4o4F8bIhwiumBCPN6WQGeI1auB52jmZqWryc3fAruVWgyKZV2u3TGxGTge
 6sdTfCwj+sJ+lYQsTUSNstqwb27Q6v/QDyJFZr9ghUk//1aUt0rJ6sHKpVYKCeT/Na
 oQkdDKqEzg2LsrjMtTEVpc++44TMKb1DXQN4Yhs96aKUOz13mJfMI5Vqw7lcDJMwEq
 xg+fcegcarQwA==
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 489FF6005B;
 Thu,  6 Jan 2022 22:01:23 +0100 (CET)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 17F5414007F;
 Thu,  6 Jan 2022 22:01:23 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v8 10/18] target/riscv: support for 128-bit bitwise
 instructions
Date: Thu,  6 Jan 2022 22:01:00 +0100
Message-Id: <20220106210108.138226-11-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220106210108.138226-1-frederic.petrot@univ-grenoble-alpes.fr>
References: <20220106210108.138226-1-frederic.petrot@univ-grenoble-alpes.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (42)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 152.77.18.2
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: bin.meng@windriver.com, richard.henderson@linaro.org, f4bug@amsat.org,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org, alistair.francis@wdc.com,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
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
index d4cf965c9e..b43efc9bc3 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -523,7 +523,15 @@ static bool gen_logic_imm_fn(DisasContext *ctx, arg_i *a,
 
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
@@ -537,7 +545,16 @@ static bool gen_logic(DisasContext *ctx, arg_r *a,
 
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
2.34.1


