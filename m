Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 068C325DAC
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 07:37:21 +0200 (CEST)
Received: from localhost ([127.0.0.1]:36548 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTJwG-0006wz-6C
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 01:37:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48576)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hTJAU-0004l7-Gw
	for qemu-devel@nongnu.org; Wed, 22 May 2019 00:47:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hTJAT-0007b4-F4
	for qemu-devel@nongnu.org; Wed, 22 May 2019 00:47:58 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:42091 helo=ozlabs.org)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1hTJAT-0007KH-3O; Wed, 22 May 2019 00:47:57 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 4580T43sGcz9sQy; Wed, 22 May 2019 14:46:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1558500376;
	bh=6umsziP45kqLQbkhjysqubHMINrd6dPk0OGV7I94jHo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZjYY2d/piqJvmP+VXZvNTuyhP9FPw+OgNYW8qXhxMB6cxdC2lUvb5Mvu6hjwzwCmr
	r0Sj0JovBnV93+TZPLlM4PxeULDsVwWJ1rvgbo8ay65dK0jXl+qJpyFjpg7i5lNE7E
	ABbOGYyybZ9qhpdwvg2nr9Q0FMaaVhfEQlHZJMNQ=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Wed, 22 May 2019 14:45:31 +1000
Message-Id: <20190522044600.16534-10-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190522044600.16534-1-david@gibson.dropbear.id.au>
References: <20190522044600.16534-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: [Qemu-devel] [PULL 09/38] target/ppc: Fix xxbrq, xxbrw
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
	qemu-ppc@nongnu.org, clg@kaod.org, Anton Blanchard <anton@ozlabs.org>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Anton Blanchard <anton@ozlabs.org>

Fix a typo in xxbrq and xxbrw where we put both results into the lower
doubleword.

Fixes: 8b3b2d75c7c0 ("introduce get_cpu_vsr{l,h}() and set_cpu_vsr{l,h}()=
 helpers for VSR register access")
Signed-off-by: Anton Blanchard <anton@ozlabs.org>
Message-Id: <20190507004811.29968-3-anton@ozlabs.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/translate/vsx-impl.inc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/translate/vsx-impl.inc.c b/target/ppc/translate/v=
sx-impl.inc.c
index 4d8ca7cf32..d29f60e2f9 100644
--- a/target/ppc/translate/vsx-impl.inc.c
+++ b/target/ppc/translate/vsx-impl.inc.c
@@ -1192,7 +1192,7 @@ static void gen_xxbrq(DisasContext *ctx)
     tcg_gen_bswap64_i64(xtl, xbh);
     set_cpu_vsrl(xT(ctx->opcode), xtl);
     tcg_gen_mov_i64(xth, t0);
-    set_cpu_vsrl(xT(ctx->opcode), xth);
+    set_cpu_vsrh(xT(ctx->opcode), xth);
=20
     tcg_temp_free_i64(t0);
     tcg_temp_free_i64(xth);
@@ -1220,7 +1220,7 @@ static void gen_xxbrw(DisasContext *ctx)
     get_cpu_vsrl(xbl, xB(ctx->opcode));
=20
     gen_bswap32x4(xth, xtl, xbh, xbl);
-    set_cpu_vsrl(xT(ctx->opcode), xth);
+    set_cpu_vsrh(xT(ctx->opcode), xth);
     set_cpu_vsrl(xT(ctx->opcode), xtl);
=20
     tcg_temp_free_i64(xth);
--=20
2.21.0


