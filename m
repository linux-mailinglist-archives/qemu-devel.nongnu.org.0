Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2C215715
	for <lists+qemu-devel@lfdr.de>; Tue,  7 May 2019 02:50:52 +0200 (CEST)
Received: from localhost ([127.0.0.1]:36021 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNoJn-0007qv-Jr
	for lists+qemu-devel@lfdr.de; Mon, 06 May 2019 20:50:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37353)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anton@ozlabs.org>) id 1hNoHW-0006qd-Fg
	for qemu-devel@nongnu.org; Mon, 06 May 2019 20:48:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anton@ozlabs.org>) id 1hNoHV-0002w4-E6
	for qemu-devel@nongnu.org; Mon, 06 May 2019 20:48:30 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:37571)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <anton@ozlabs.org>)
	id 1hNoHV-0002sY-08; Mon, 06 May 2019 20:48:29 -0400
Received: by ozlabs.org (Postfix, from userid 1010)
	id 44ygvX6pdXz9sB8; Tue,  7 May 2019 10:48:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
	t=1557190104; bh=SRPwm3An5+fJjsd0L6bwnIgSg1J0AqbyzQJpxhSUQEo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kqIaXQ3Hpik3ht83Rb0ODlmAovYzq29uRMQz604NDt+1LN86ToE238vwroYdS5mTG
	DHdKiF0hD1R0Pb8IrgiZlvwfC/QND0uAli0cQl2cpJlf+rVg6H9aUqyHmTAycgKSq8
	8K6JSQWe6xEFoZaEi8xhWYan9Rddpd4DffVfAgtx5dHS4z/oAbjIEd2WGcL0VWNybX
	lU6mQfngzeurB9C7DKkV8fNkF60HCnvx6CA+VfMy3ml/L6Xpjsf9s4dCCa8u/w4HC3
	W+L/ej12v2taWkD8Cjf93i8Gz00sVvQFhTTpxBYAmsw+wA2VMywRWvgOA9csVdjZQ8
	q9I5hq3/M1y8g==
From: Anton Blanchard <anton@ozlabs.org>
To: qemu-ppc@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  7 May 2019 10:48:05 +1000
Message-Id: <20190507004811.29968-3-anton@ozlabs.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190507004811.29968-1-anton@ozlabs.org>
References: <20190507004811.29968-1-anton@ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: [Qemu-devel] [PATCH 3/9] target/ppc: Fix xxbrq, xxbrw
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
Cc: ego@linux.vnet.ibm.com, sandipandas1990@gmail.com,
	richard.henderson@linaro.org, mark.cave-ayland@ilande.co.uk,
	f4bug@amsat.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix a typo in xxbrq and xxbrw where we put both results into the lower
doubleword.

Fixes: 8b3b2d75c7c0 ("introduce get_cpu_vsr{l,h}() and set_cpu_vsr{l,h}()=
 helpers for VSR register access")
Signed-off-by: Anton Blanchard <anton@ozlabs.org>
---
 target/ppc/translate/vsx-impl.inc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/translate/vsx-impl.inc.c b/target/ppc/translate/v=
sx-impl.inc.c
index d050cc03ed..05b75105be 100644
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
2.20.1


