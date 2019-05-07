Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 351F61571A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 May 2019 02:53:27 +0200 (CEST)
Received: from localhost ([127.0.0.1]:36081 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNoMI-00023R-96
	for lists+qemu-devel@lfdr.de; Mon, 06 May 2019 20:53:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37370)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anton@ozlabs.org>) id 1hNoHW-0006qj-VW
	for qemu-devel@nongnu.org; Mon, 06 May 2019 20:48:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anton@ozlabs.org>) id 1hNoHW-0002wX-6F
	for qemu-devel@nongnu.org; Mon, 06 May 2019 20:48:30 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:38565)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <anton@ozlabs.org>)
	id 1hNoHV-0002v2-Pu; Mon, 06 May 2019 20:48:30 -0400
Received: by ozlabs.org (Postfix, from userid 1010)
	id 44ygvb2GcMz9sD4; Tue,  7 May 2019 10:48:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
	t=1557190107; bh=9iL95V4tI9tiMvxzjhmcg1y9UgmTSfYBeQNMzp9sbZQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gVU8nTChTsfqMTCOowYv3QUjRmatrBm8kyVTuf2pWR0Su6es0RzzsDOsE/meeU1iN
	kyHl3H/L/MrZiBpSfJVb9tyZgiGXiD3yNkazayQq43OqatbDm1b+cf16byYzBbiYXu
	U2Kjc0hBfFc0sLJX2RCTizL5ALkBVhWYaV0tEAT575ruMc3vAB4OpKc04hTORZ24N/
	YJfp8fF81UfwaRmo40gnygifmKC4yK8hdatOGxcIlYQaF4fl+gVQ62Zh3NDs4+9eOB
	w8orpwG906YjAUM4wCnZMyPN5Pv/tl2f+YpYb3lmbeML0NAaQXHuQpMzXpEDJ0W4lZ
	tnS2jYg261mDw==
From: Anton Blanchard <anton@ozlabs.org>
To: qemu-ppc@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  7 May 2019 10:48:07 +1000
Message-Id: <20190507004811.29968-5-anton@ozlabs.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190507004811.29968-1-anton@ozlabs.org>
References: <20190507004811.29968-1-anton@ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: [Qemu-devel] [PATCH 5/9] target/ppc: Fix xvabs[sd]p, xvnabs[sd]p,
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
Cc: ego@linux.vnet.ibm.com, sandipandas1990@gmail.com,
	richard.henderson@linaro.org, mark.cave-ayland@ilande.co.uk,
	f4bug@amsat.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We were using set_cpu_vsr* when we should have used set_cpu_vsrl*

Fixes: 8b3b2d75c7c0 ("introduce get_cpu_vsr{l,h}() and set_cpu_vsr{l,h}()=
 helpers for VSR register access")
Signed-off-by: Anton Blanchard <anton@ozlabs.org>
---
 target/ppc/translate/vsx-impl.inc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/translate/vsx-impl.inc.c b/target/ppc/translate/v=
sx-impl.inc.c
index c13f84e745..0a48020e3b 100644
--- a/target/ppc/translate/vsx-impl.inc.c
+++ b/target/ppc/translate/vsx-impl.inc.c
@@ -859,8 +859,8 @@ static void glue(gen_, name)(DisasContext *ctx)      =
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
2.20.1


