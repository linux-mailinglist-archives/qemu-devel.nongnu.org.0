Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1817624831
	for <lists+qemu-devel@lfdr.de>; Tue, 21 May 2019 08:38:32 +0200 (CEST)
Received: from localhost ([127.0.0.1]:47422 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSyPv-00049O-5o
	for lists+qemu-devel@lfdr.de; Tue, 21 May 2019 02:38:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48757)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hSyHW-0005sy-3e
	for qemu-devel@nongnu.org; Tue, 21 May 2019 02:29:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hSyHU-0007mQ-Au
	for qemu-devel@nongnu.org; Tue, 21 May 2019 02:29:50 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:33973)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1hSyHT-0007he-QS; Tue, 21 May 2019 02:29:48 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 457Qpg2547z9sNl; Tue, 21 May 2019 16:29:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1558420171;
	bh=Wxt1t3FhOT2uMz7XmaWfjtoeKAG3JSyX+mqnnTg0kyU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BXY0PQSvi6Tt8cUw+z8NUDd/+7SVUhwgyS3BybmHzkB3rHNT13XMTlcEG166+XqEw
	rskZCF4cx1lcqPBKeGfAGvk53hmErTRCpsA1zYlWxcVq7ILkwM90Fmh2Tcvde6FpQy
	kvvsca6yR+x7NI/DftnCXifG0jRV4M4zWpbpZoNA=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Tue, 21 May 2019 16:28:54 +1000
Message-Id: <20190521062924.6930-9-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190521062924.6930-1-david@gibson.dropbear.id.au>
References: <20190521062924.6930-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: [Qemu-devel] [PULL 08/38] target/ppc: Fix xvxsigdp
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


