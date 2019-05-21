Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE0A2482B
	for <lists+qemu-devel@lfdr.de>; Tue, 21 May 2019 08:36:42 +0200 (CEST)
Received: from localhost ([127.0.0.1]:47394 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSyO9-0002QM-Ai
	for lists+qemu-devel@lfdr.de; Tue, 21 May 2019 02:36:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48883)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hSyHY-0005w6-Gd
	for qemu-devel@nongnu.org; Tue, 21 May 2019 02:29:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hSyHX-0007ts-0o
	for qemu-devel@nongnu.org; Tue, 21 May 2019 02:29:52 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:59803 helo=ozlabs.org)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1hSyHW-0007nt-LX; Tue, 21 May 2019 02:29:50 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 457Qph3D3bz9sNw; Tue, 21 May 2019 16:29:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1558420172;
	bh=dxtI+obZW42V9bCVu26yu2XJpSf9yoTW1u7C1lthdqY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UVbTyWflu2wv++PV0pKAoPnvQ9fedZrORYocoN7Vndog5SnyyGj6nSkBWfErumGY3
	/rTA0zQb4NLdMQVa+3/eOA3+2QEt2hlwhXqquonFgQUcvuyayKw5zpIeHmHf7Je4nh
	LDFoq3DhmRIvFUcK0JG4fc3bfs4bi92o08UFpVVI=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Tue, 21 May 2019 16:29:04 +1000
Message-Id: <20190521062924.6930-19-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190521062924.6930-1-david@gibson.dropbear.id.au>
References: <20190521062924.6930-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: [Qemu-devel] [PULL 18/38] target/ppc: Fix xvabs[sd]p, xvnabs[sd]p,
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
Cc: lvivier@redhat.com, gkurz@kaod.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org,
	Anton Blanchard <anton@ozlabs.org>,
	David Gibson <david@gibson.dropbear.id.au>
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


