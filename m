Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 785E635023
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jun 2019 21:07:23 +0200 (CEST)
Received: from localhost ([127.0.0.1]:56666 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYEmI-000612-L9
	for lists+qemu-devel@lfdr.de; Tue, 04 Jun 2019 15:07:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44022)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>) id 1hYEgt-0002HL-PH
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 15:01:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>) id 1hYEgs-0007mU-QX
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 15:01:47 -0400
Received: from mail.ilande.co.uk ([46.43.2.167]:54810
	helo=mail.default.ilande.uk0.bigv.io)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1hYEgs-0007kY-KX; Tue, 04 Jun 2019 15:01:46 -0400
Received: from host81-158-188-206.range81-158.btcentralplus.com
	([81.158.188.206] helo=kentang.home)
	by mail.default.ilande.uk0.bigv.io with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1hYEfy-00013x-9L; Tue, 04 Jun 2019 20:00:50 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-stable@nongnu.org,
	david@gibson.dropbear.id.au
Date: Tue,  4 Jun 2019 20:01:13 +0100
Message-Id: <20190604190115.8053-4-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190604190115.8053-1-mark.cave-ayland@ilande.co.uk>
References: <20190604190115.8053-1-mark.cave-ayland@ilande.co.uk>
X-SA-Exim-Connect-IP: 81.158.188.206
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.43.2.167
Subject: [Qemu-devel] [PATCH for-stable 3/5] target/ppc: Fix xxbrq, xxbrw
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

Fix a typo in xxbrq and xxbrw where we put both results into the lower
doubleword.

Fixes: 8b3b2d75c7c0 ("introduce get_cpu_vsr{l,h}() and set_cpu_vsr{l,h}() helpers for VSR register access")
Signed-off-by: Anton Blanchard <anton@ozlabs.org>
Message-Id: <20190507004811.29968-3-anton@ozlabs.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/translate/vsx-impl.inc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/translate/vsx-impl.inc.c b/target/ppc/translate/vsx-impl.inc.c
index 96e4ff4411..7778d5d651 100644
--- a/target/ppc/translate/vsx-impl.inc.c
+++ b/target/ppc/translate/vsx-impl.inc.c
@@ -1192,7 +1192,7 @@ static void gen_xxbrq(DisasContext *ctx)
     tcg_gen_bswap64_i64(xtl, xbh);
     set_cpu_vsrl(xT(ctx->opcode), xtl);
     tcg_gen_mov_i64(xth, t0);
-    set_cpu_vsrl(xT(ctx->opcode), xth);
+    set_cpu_vsrh(xT(ctx->opcode), xth);
 
     tcg_temp_free_i64(t0);
     tcg_temp_free_i64(xth);
@@ -1220,7 +1220,7 @@ static void gen_xxbrw(DisasContext *ctx)
     get_cpu_vsrl(xbl, xB(ctx->opcode));
 
     gen_bswap32x4(xth, xtl, xbh, xbl);
-    set_cpu_vsrl(xT(ctx->opcode), xth);
+    set_cpu_vsrh(xT(ctx->opcode), xth);
     set_cpu_vsrl(xT(ctx->opcode), xtl);
 
     tcg_temp_free_i64(xth);
-- 
2.11.0


