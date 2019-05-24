Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E9329161
	for <lists+qemu-devel@lfdr.de>; Fri, 24 May 2019 08:58:43 +0200 (CEST)
Received: from localhost ([127.0.0.1]:50004 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hU4A6-0002ED-Q7
	for lists+qemu-devel@lfdr.de; Fri, 24 May 2019 02:58:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44601)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>) id 1hU48Y-0001Tl-Rq
	for qemu-devel@nongnu.org; Fri, 24 May 2019 02:57:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>) id 1hU48X-0002mW-OS
	for qemu-devel@nongnu.org; Fri, 24 May 2019 02:57:06 -0400
Received: from mail.ilande.co.uk ([46.43.2.167]:38058
	helo=mail.default.ilande.uk0.bigv.io)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1hU48X-0002Iw-IS; Fri, 24 May 2019 02:57:05 -0400
Received: from host86-185-106-199.range86-185.btcentralplus.com
	([86.185.106.199] helo=kentang.home)
	by mail.default.ilande.uk0.bigv.io with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1hU44b-0002tc-2P; Fri, 24 May 2019 07:53:02 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: david@gibson.dropbear.id.au,
	qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Date: Fri, 24 May 2019 07:53:45 +0100
Message-Id: <20190524065345.25591-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.11.0
X-SA-Exim-Connect-IP: 86.185.106.199
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.43.2.167
Subject: [Qemu-devel] [PATCH v2] target/ppc: Fix lxvw4x, lxvh8x and lxvb16x
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Anton Blanchard <anton@ozlabs.org>

During the conversion these instructions were incorrectly treated as
stores. We need to use set_cpu_vsr* and not get_cpu_vsr*.

Fixes: 8b3b2d75c7c0 ("introduce get_cpu_vsr{l,h}() and set_cpu_vsr{l,h}() helpers for VSR register access")
Signed-off-by: Anton Blanchard <anton@ozlabs.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 target/ppc/translate/vsx-impl.inc.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/target/ppc/translate/vsx-impl.inc.c b/target/ppc/translate/vsx-impl.inc.c
index 199d22da97..cdb44b8b70 100644
--- a/target/ppc/translate/vsx-impl.inc.c
+++ b/target/ppc/translate/vsx-impl.inc.c
@@ -102,8 +102,7 @@ static void gen_lxvw4x(DisasContext *ctx)
     }
     xth = tcg_temp_new_i64();
     xtl = tcg_temp_new_i64();
-    get_cpu_vsrh(xth, xT(ctx->opcode));
-    get_cpu_vsrl(xtl, xT(ctx->opcode));
+
     gen_set_access_type(ctx, ACCESS_INT);
     EA = tcg_temp_new();
 
@@ -126,6 +125,8 @@ static void gen_lxvw4x(DisasContext *ctx)
         tcg_gen_addi_tl(EA, EA, 8);
         tcg_gen_qemu_ld_i64(xtl, EA, ctx->mem_idx, MO_BEQ);
     }
+    set_cpu_vsrh(xT(ctx->opcode), xth);
+    set_cpu_vsrl(xT(ctx->opcode), xtl);
     tcg_temp_free(EA);
     tcg_temp_free_i64(xth);
     tcg_temp_free_i64(xtl);
@@ -185,8 +186,6 @@ static void gen_lxvh8x(DisasContext *ctx)
     }
     xth = tcg_temp_new_i64();
     xtl = tcg_temp_new_i64();
-    get_cpu_vsrh(xth, xT(ctx->opcode));
-    get_cpu_vsrl(xtl, xT(ctx->opcode));
     gen_set_access_type(ctx, ACCESS_INT);
 
     EA = tcg_temp_new();
@@ -197,6 +196,8 @@ static void gen_lxvh8x(DisasContext *ctx)
     if (ctx->le_mode) {
         gen_bswap16x8(xth, xtl, xth, xtl);
     }
+    set_cpu_vsrh(xT(ctx->opcode), xth);
+    set_cpu_vsrl(xT(ctx->opcode), xtl);
     tcg_temp_free(EA);
     tcg_temp_free_i64(xth);
     tcg_temp_free_i64(xtl);
@@ -214,14 +215,14 @@ static void gen_lxvb16x(DisasContext *ctx)
     }
     xth = tcg_temp_new_i64();
     xtl = tcg_temp_new_i64();
-    get_cpu_vsrh(xth, xT(ctx->opcode));
-    get_cpu_vsrl(xtl, xT(ctx->opcode));
     gen_set_access_type(ctx, ACCESS_INT);
     EA = tcg_temp_new();
     gen_addr_reg_index(ctx, EA);
     tcg_gen_qemu_ld_i64(xth, EA, ctx->mem_idx, MO_BEQ);
     tcg_gen_addi_tl(EA, EA, 8);
     tcg_gen_qemu_ld_i64(xtl, EA, ctx->mem_idx, MO_BEQ);
+    set_cpu_vsrh(xT(ctx->opcode), xth);
+    set_cpu_vsrl(xT(ctx->opcode), xtl);
     tcg_temp_free(EA);
     tcg_temp_free_i64(xth);
     tcg_temp_free_i64(xtl);
-- 
2.11.0


