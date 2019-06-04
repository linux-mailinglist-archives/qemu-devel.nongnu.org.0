Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4B835025
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jun 2019 21:08:12 +0200 (CEST)
Received: from localhost ([127.0.0.1]:56672 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYEn5-0006lE-Nw
	for lists+qemu-devel@lfdr.de; Tue, 04 Jun 2019 15:08:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44074)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>) id 1hYEgx-0002II-9D
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 15:01:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>) id 1hYEgw-0007t9-7R
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 15:01:51 -0400
Received: from mail.ilande.co.uk ([46.43.2.167]:54820
	helo=mail.default.ilande.uk0.bigv.io)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1hYEgw-0007rC-1F; Tue, 04 Jun 2019 15:01:50 -0400
Received: from host81-158-188-206.range81-158.btcentralplus.com
	([81.158.188.206] helo=kentang.home)
	by mail.default.ilande.uk0.bigv.io with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1hYEfx-00013x-76; Tue, 04 Jun 2019 20:00:49 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-stable@nongnu.org,
	david@gibson.dropbear.id.au
Date: Tue,  4 Jun 2019 20:01:11 +0100
Message-Id: <20190604190115.8053-2-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190604190115.8053-1-mark.cave-ayland@ilande.co.uk>
References: <20190604190115.8053-1-mark.cave-ayland@ilande.co.uk>
X-SA-Exim-Connect-IP: 81.158.188.206
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.43.2.167
Subject: [Qemu-devel] [PATCH for-stable 1/5] target/ppc: Fix xvabs[sd]p,
 xvnabs[sd]p, xvneg[sd]p, xvcpsgn[sd]p
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

We were using set_cpu_vsr*() when we should have used get_cpu_vsr*().

Fixes: 8b3b2d75c7c0 ("introduce get_cpu_vsr{l,h}() and set_cpu_vsr{l,h}() helpers for VSR register access")
Signed-off-by: Anton Blanchard <anton@ozlabs.org>
Message-Id: <20190509104912.6b754dff@kryten>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/translate/vsx-impl.inc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/translate/vsx-impl.inc.c b/target/ppc/translate/vsx-impl.inc.c
index 489b2436e4..1b483fc27e 100644
--- a/target/ppc/translate/vsx-impl.inc.c
+++ b/target/ppc/translate/vsx-impl.inc.c
@@ -858,8 +858,8 @@ static void glue(gen_, name)(DisasContext * ctx)                 \
         xbh = tcg_temp_new_i64();                                \
         xbl = tcg_temp_new_i64();                                \
         sgm = tcg_temp_new_i64();                                \
-        set_cpu_vsrh(xB(ctx->opcode), xbh);                      \
-        set_cpu_vsrl(xB(ctx->opcode), xbl);                      \
+        get_cpu_vsrh(xbh, xB(ctx->opcode));                      \
+        get_cpu_vsrl(xbl, xB(ctx->opcode));                      \
         tcg_gen_movi_i64(sgm, sgn_mask);                         \
         switch (op) {                                            \
             case OP_ABS: {                                       \
-- 
2.11.0


