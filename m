Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 828C62D5ED
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 09:08:17 +0200 (CEST)
Received: from localhost ([127.0.0.1]:48609 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVsh6-0005la-I4
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 03:08:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47630)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hVsQ2-0008FV-21
	for qemu-devel@nongnu.org; Wed, 29 May 2019 02:50:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hVsQ0-0002a5-Qh
	for qemu-devel@nongnu.org; Wed, 29 May 2019 02:50:37 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:39521 helo=ozlabs.org)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1hVsQ0-0002Wy-E5; Wed, 29 May 2019 02:50:36 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 45DLv2699Mz9sNf; Wed, 29 May 2019 16:50:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1559112622;
	bh=Wxt1t3FhOT2uMz7XmaWfjtoeKAG3JSyX+mqnnTg0kyU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qIx1gq4RG8wWv2R3u+iZTSCUoJjwiV01ovFvDjgsoZjosnoohKmdrc+LcoAyJSy9f
	YFShq9JgCZLaa8Pw+Y6y6RXL71XnlpGLcYF77gT2ZvgORxrz2jDpJ0TQyDof1ve1pS
	7k3kP773P9sBje+9zkEXhQKEHV2alBG7SE8Ajpuk=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Wed, 29 May 2019 16:49:42 +1000
Message-Id: <20190529065017.15149-10-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190529065017.15149-1-david@gibson.dropbear.id.au>
References: <20190529065017.15149-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: [Qemu-devel] [PULL 09/44] target/ppc: Fix xvxsigdp
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
Cc: lvivier@redhat.com, qemu-devel@nongnu.org, groug@kaod.org,
	qemu-ppc@nongnu.org, clg@kaod.org,
	David Gibson <david@gibson.dropbear.id.au>,
	Anton Blanchard <anton@ozlabs.org>, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Anton Blanchard <anton@ozlabs.org>

Fix a typo in xvxsigdp where we put both results into the lower
doubleword.

Fixes: dd977e4f45cb ("target/ppc: Optimize x[sv]xsigdp using deposit_i64(=
)")
Signed-off-by: Anton Blanchard <anton@ozlabs.org>
Message-Id: <20190507004811.29968-1-anton@ozlabs.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/translate/vsx-impl.inc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/translate/vsx-impl.inc.c b/target/ppc/translate/v=
sx-impl.inc.c
index 11d9b75d01..4d8ca7cf32 100644
--- a/target/ppc/translate/vsx-impl.inc.c
+++ b/target/ppc/translate/vsx-impl.inc.c
@@ -1820,7 +1820,7 @@ static void gen_xvxsigdp(DisasContext *ctx)
     tcg_gen_movi_i64(t0, 0x0010000000000000);
     tcg_gen_movcond_i64(TCG_COND_EQ, t0, exp, zr, zr, t0);
     tcg_gen_movcond_i64(TCG_COND_EQ, t0, exp, nan, zr, t0);
-    tcg_gen_deposit_i64(xth, t0, xbl, 0, 52);
+    tcg_gen_deposit_i64(xtl, t0, xbl, 0, 52);
     set_cpu_vsrl(xT(ctx->opcode), xtl);
=20
     tcg_temp_free_i64(t0);
--=20
2.21.0


