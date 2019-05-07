Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B601571F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 May 2019 02:58:36 +0200 (CEST)
Received: from localhost ([127.0.0.1]:36157 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNoRH-0006Yb-Ov
	for lists+qemu-devel@lfdr.de; Mon, 06 May 2019 20:58:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37501)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anton@ozlabs.org>) id 1hNoHb-0006vd-Oe
	for qemu-devel@nongnu.org; Mon, 06 May 2019 20:48:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anton@ozlabs.org>) id 1hNoHa-00030r-SE
	for qemu-devel@nongnu.org; Mon, 06 May 2019 20:48:35 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:54287 helo=ozlabs.org)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <anton@ozlabs.org>)
	id 1hNoHa-0002zD-HO; Mon, 06 May 2019 20:48:34 -0400
Received: by ozlabs.org (Postfix, from userid 1010)
	id 44ygvh24W4z9sNd; Tue,  7 May 2019 10:48:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
	t=1557190112; bh=PV30V+n2ix1wUzog6kf0leep14XUJIgVODpJqs+D7EU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aXcq/Yxt18TVXsJtIVJW0W2RgAkBQEW6MZVPgjjRnyn9ANB0klGoX3r9XJi7Enk2x
	vNPYct63mITaMVtCqib5zYdroM37s5N5gz2Waj0cmN2DyfxaJ20wltRytaB+ipCfy2
	sitNvBUH2yEQeJ4mmLiNLnUFbTdhja5Oq80NnZ0GLzxwAhwv3hzymSb5R5p3s0z8X2
	95O1ugIdVqti2RXcU+ELfXn5t5CQStxkg9klL0YNC4FL0yO8X1GTwyPBLFc2aMDLku
	MSlOe449rffAbK+KzCXMyKwKpWpVMtask3RHMsl0Wzf9UHa6Ne5JOjRoh0SQ0WboB+
	Y1HanMONhFGfQ==
From: Anton Blanchard <anton@ozlabs.org>
To: qemu-ppc@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  7 May 2019 10:48:11 +1000
Message-Id: <20190507004811.29968-9-anton@ozlabs.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190507004811.29968-1-anton@ozlabs.org>
References: <20190507004811.29968-1-anton@ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: [Qemu-devel] [PATCH 9/9] target/ppc: Fix vsum2sws
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

A recent cleanup changed the pre zeroing of the result from 64 bit
to 32 bit operations:

-        result.u64[i] =3D 0;
+        result.VsrW(i) =3D 0;

This corrupts the result.

Fixes: 60594fea298d ("target/ppc: remove various HOST_WORDS_BIGENDIAN hac=
ks in int_helper.c")
Signed-off-by: Anton Blanchard <anton@ozlabs.org>
---
 target/ppc/int_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 111586c981..b8b3279f71 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -2038,7 +2038,7 @@ void helper_vsum2sws(CPUPPCState *env, ppc_avr_t *r=
, ppc_avr_t *a, ppc_avr_t *b)
     for (i =3D 0; i < ARRAY_SIZE(r->u64); i++) {
         int64_t t =3D (int64_t)b->VsrSW(upper + i * 2);
=20
-        result.VsrW(i) =3D 0;
+        result.VsrD(i) =3D 0;
         for (j =3D 0; j < ARRAY_SIZE(r->u64); j++) {
             t +=3D a->VsrSW(2 * i + j);
         }
--=20
2.20.1


