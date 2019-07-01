Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D786A2D601
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 09:12:58 +0200 (CEST)
Received: from localhost ([127.0.0.1]:48695 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVsld-0001Xr-TP
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 03:12:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48079)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hVsQR-0000LA-0j
	for qemu-devel@nongnu.org; Wed, 29 May 2019 02:51:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hVsQQ-0002qZ-2Y
	for qemu-devel@nongnu.org; Wed, 29 May 2019 02:51:02 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:42105 helo=ozlabs.org)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1hVsQP-0002dj-Mx; Wed, 29 May 2019 02:51:02 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 45DLv60vfTz9sPC; Wed, 29 May 2019 16:50:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1559112626;
	bh=dxtI+obZW42V9bCVu26yu2XJpSf9yoTW1u7C1lthdqY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GGcHyBNzClr6Lez39zg2BafD5B6ScBlN8RzvBmzRYshm+1NmP2gvDx55TQ8/gtmbl
	j65WNUoI0+A6ksl83JqFBP2++Wock48cxMv0V+xkTotCGe4xOgJweB/GZrXFVZZvqI
	D1gmjKG9OpgQ9/wFrcPtC9IrktT/+x5jI1EL/lkY=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Wed, 29 May 2019 16:49:52 +1000
Message-Id: <20190529065017.15149-20-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190529065017.15149-1-david@gibson.dropbear.id.au>
References: <20190529065017.15149-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: [Qemu-devel] [PULL 19/44] target/ppc: Fix xvabs[sd]p, xvnabs[sd]p,
 xvneg[sd]p, xvcpsgn[sd]p
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
Cc: lvivier@redhat.com, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org,
	clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>,
	Anton Blanchard <anton@ozlabs.org>, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Anton Blanchard <anton@ozlabs.org>

We were using set_cpu_vsr*() when we should have used get_cpu_vsr*().

Fixes: 8b3b2d75c7c0 ("introduce get_cpu_vsr{l,h}() and set_cpu_vsr{l,h}()=
 helpers for VSR register access")
Signed-off-by: Anton Blanchard <anton@ozlabs.org>
Message-Id: <20190509104912.6b754dff@kryten>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/translate/vsx-impl.inc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/translate/vsx-impl.inc.c b/target/ppc/translate/v=
sx-impl.inc.c
index c39829cf33..199d22da97 100644
--- a/target/ppc/translate/vsx-impl.inc.c
+++ b/target/ppc/translate/vsx-impl.inc.c
@@ -906,8 +906,8 @@ static void glue(gen_, name)(DisasContext *ctx)      =
            \
         xbh =3D tcg_temp_new_i64();                                \
         xbl =3D tcg_temp_new_i64();                                \
         sgm =3D tcg_temp_new_i64();                                \
-        set_cpu_vsrh(xB(ctx->opcode), xbh);                      \
-        set_cpu_vsrl(xB(ctx->opcode), xbl);                      \
+        get_cpu_vsrh(xbh, xB(ctx->opcode));                      \
+        get_cpu_vsrl(xbl, xB(ctx->opcode));                      \
         tcg_gen_movi_i64(sgm, sgn_mask);                         \
         switch (op) {                                            \
             case OP_ABS: {                                       \
--=20
2.21.0


