Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D419524832
	for <lists+qemu-devel@lfdr.de>; Tue, 21 May 2019 08:38:53 +0200 (CEST)
Received: from localhost ([127.0.0.1]:47427 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSyQG-0004QQ-SM
	for lists+qemu-devel@lfdr.de; Tue, 21 May 2019 02:38:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48706)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hSyHV-0005sb-CA
	for qemu-devel@nongnu.org; Tue, 21 May 2019 02:29:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hSyHT-0007lC-QQ
	for qemu-devel@nongnu.org; Tue, 21 May 2019 02:29:49 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:56593 helo=ozlabs.org)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1hSyHT-0007hU-D9; Tue, 21 May 2019 02:29:47 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 457Qpf5w1tz9sBp; Tue, 21 May 2019 16:29:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1558420170;
	bh=q7EImbd+kCVeaNJFxTgkqCNMD8+yJyoKHqONDrvQuek=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lt/QO7YhcIJBDS5QV5xrLGFfIQ/8LysJcD14jEOPatl0qG13ISfN/waPfnVm6IG7+
	q4QKam/su2h1ekAjDGYFHj0ZiwuzHslo3PJ2Zd9qYua/dGVVv8C1SFsDUBEUaPqmrc
	tikJ8UyD9cWoa+i08NqJqaB7dMY4xAjO1elgGZE0=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Tue, 21 May 2019 16:28:58 +1000
Message-Id: <20190521062924.6930-13-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190521062924.6930-1-david@gibson.dropbear.id.au>
References: <20190521062924.6930-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: [Qemu-devel] [PULL 12/38] target/ppc: Fix xxspltib
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
Cc: lvivier@redhat.com, gkurz@kaod.org, qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org, clg@kaod.org, Anton Blanchard <anton@ozlabs.org>,
	David Gibson <david@gibson.dropbear.id.au>
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


