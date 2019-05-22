Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B50625D08
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 06:50:01 +0200 (CEST)
Received: from localhost ([127.0.0.1]:35726 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTJCQ-0005Uy-5j
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 00:49:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47211)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hTJ8s-0003MK-O5
	for qemu-devel@nongnu.org; Wed, 22 May 2019 00:46:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hTJ8r-0006dy-FX
	for qemu-devel@nongnu.org; Wed, 22 May 2019 00:46:18 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:56187 helo=ozlabs.org)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1hTJ8r-0006aq-28; Wed, 22 May 2019 00:46:17 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 4580St0qTYz9sNR; Wed, 22 May 2019 14:46:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1558500366;
	bh=Q3OdL5JEc/xax8Ko3xFpbQldrSgTWaBBNtqg7R0C8TU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KDLsHnKlhXNE2IN9h2yXs0gV0lm3nuob4AFaTiwRY1Y/wcGS/w8eYkfySJLvPYgGu
	YayU5PGRWUYpwVgdGB7gJ4Q2rsXAWXkrQROoe9pPfRac24Y99KW/s32unFDERGSfaR
	yOihVMg2XfRlepE5KQ60eLCltgOY1Iwov6f4BObE=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Wed, 22 May 2019 14:45:33 +1000
Message-Id: <20190522044600.16534-12-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190522044600.16534-1-david@gibson.dropbear.id.au>
References: <20190522044600.16534-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: [Qemu-devel] [PULL 11/38] target/ppc: Fix vsum2sws
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

A recent cleanup changed the pre zeroing of the result from 64 bit
to 32 bit operations:

-        result.u64[i] =3D 0;
+        result.VsrW(i) =3D 0;

This corrupts the result.

Fixes: 60594fea298d ("target/ppc: remove various HOST_WORDS_BIGENDIAN hac=
ks in int_helper.c")
Signed-off-by: Anton Blanchard <anton@ozlabs.org>
Message-Id: <20190507004811.29968-9-anton@ozlabs.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/int_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index fd715b4076..f5c81acd53 100644
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
2.21.0


