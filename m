Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B332D5CD
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 08:59:04 +0200 (CEST)
Received: from localhost ([127.0.0.1]:48461 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVsYC-0006l8-1F
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 02:59:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47783)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hVsQ4-0008JU-Ps
	for qemu-devel@nongnu.org; Wed, 29 May 2019 02:50:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hVsQ3-0002d3-2y
	for qemu-devel@nongnu.org; Wed, 29 May 2019 02:50:40 -0400
Received: from ozlabs.org ([203.11.71.1]:37433)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1hVsQ2-0002aE-MR; Wed, 29 May 2019 02:50:38 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 45DLv40w8Hz9sP6; Wed, 29 May 2019 16:50:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1559112624;
	bh=q7EImbd+kCVeaNJFxTgkqCNMD8+yJyoKHqONDrvQuek=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ntA/XQ9MVcZ2jZoF+XtVspD2S/lvrapatqW5sLywTbVT0Te7HBgh4s0YETf79Yzgc
	qp3xnF9WHixaUoO6Jy+Gt32N31jVcfFbh/MQUG2+qagxGePIQ7TrjRF44B5ccW0nt8
	6c1qrHiErVQPep4cA91KCCZymDh9uKIy7CZydXJY=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Wed, 29 May 2019 16:49:46 +1000
Message-Id: <20190529065017.15149-14-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190529065017.15149-1-david@gibson.dropbear.id.au>
References: <20190529065017.15149-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: [Qemu-devel] [PULL 13/44] target/ppc: Fix xxspltib
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

xxspltib raises a VMX or a VSX exception depending on the register
set it is operating on. We had a check, but it was backwards.

Fixes: f113283525a4 ("target-ppc: add xxspltib instruction")
Signed-off-by: Anton Blanchard <anton@ozlabs.org>
Message-Id: <20190509061713.69490488@kryten>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/translate/vsx-impl.inc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/ppc/translate/vsx-impl.inc.c b/target/ppc/translate/v=
sx-impl.inc.c
index d29f60e2f9..4b8f6cefe3 100644
--- a/target/ppc/translate/vsx-impl.inc.c
+++ b/target/ppc/translate/vsx-impl.inc.c
@@ -1355,13 +1355,13 @@ static void gen_xxspltib(DisasContext *ctx)
     int rt =3D xT(ctx->opcode);
=20
     if (rt < 32) {
-        if (unlikely(!ctx->altivec_enabled)) {
-            gen_exception(ctx, POWERPC_EXCP_VPU);
+        if (unlikely(!ctx->vsx_enabled)) {
+            gen_exception(ctx, POWERPC_EXCP_VSXU);
             return;
         }
     } else {
-        if (unlikely(!ctx->vsx_enabled)) {
-            gen_exception(ctx, POWERPC_EXCP_VSXU);
+        if (unlikely(!ctx->altivec_enabled)) {
+            gen_exception(ctx, POWERPC_EXCP_VPU);
             return;
         }
     }
--=20
2.21.0


