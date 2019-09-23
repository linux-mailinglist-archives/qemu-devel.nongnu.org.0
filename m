Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2E0BAF47
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Sep 2019 10:23:29 +0200 (CEST)
Received: from localhost ([::1]:53516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCJd1-0006vL-NJ
	for lists+qemu-devel@lfdr.de; Mon, 23 Sep 2019 04:23:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42969)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1iCJO9-0002LP-Oc
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 04:08:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1iCJO8-0004E8-1m
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 04:08:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47446)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1iCJO7-0004Dl-Q2; Mon, 23 Sep 2019 04:08:03 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 10A9BA2668E;
 Mon, 23 Sep 2019 08:08:03 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1DB7119C78;
 Mon, 23 Sep 2019 08:07:59 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 18/30] s390x/tcg: MVCS/MVCP: Use access_memmove()
Date: Mon, 23 Sep 2019 10:07:00 +0200
Message-Id: <20190923080712.23951-19-david@redhat.com>
In-Reply-To: <20190923080712.23951-1-david@redhat.com>
References: <20190923080712.23951-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.68]); Mon, 23 Sep 2019 08:08:03 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As we are moving between address spaces, we can use access_memmove()
without checking for destructive overlaps (especially of real storage
locations):
    "Each storage operand is processed left to right. The
    storage-operand-consistency rules are the same as
    for MOVE (MVC), except that when the operands
    overlap in real storage, the use of the common real-
    storage locations is not necessarily recognized."

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/mem_helper.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
index 12ffe72c88..04c4228f13 100644
--- a/target/s390x/mem_helper.c
+++ b/target/s390x/mem_helper.c
@@ -2092,8 +2092,9 @@ uint32_t HELPER(rrbe)(CPUS390XState *env, uint64_t =
r2)
 uint32_t HELPER(mvcs)(CPUS390XState *env, uint64_t l, uint64_t a1, uint6=
4_t a2)
 {
     const uint8_t psw_as =3D (env->psw.mask & PSW_MASK_ASC) >> PSW_SHIFT=
_ASC;
+    S390Access srca, desta;
     uintptr_t ra =3D GETPC();
-    int cc =3D 0, i;
+    int cc =3D 0;
=20
     HELPER_LOG("%s: %16" PRIx64 " %16" PRIx64 " %16" PRIx64 "\n",
                __func__, l, a1, a2);
@@ -2112,20 +2113,19 @@ uint32_t HELPER(mvcs)(CPUS390XState *env, uint64_=
t l, uint64_t a1, uint64_t a2)
         return cc;
     }
=20
-    /* XXX replace w/ memcpy */
-    for (i =3D 0; i < l; i++) {
-        uint8_t x =3D cpu_ldub_primary_ra(env, a2 + i, ra);
-        cpu_stb_secondary_ra(env, a1 + i, x, ra);
-    }
-
+    /* TODO: Access key handling */
+    srca =3D access_prepare(env, a2, l, MMU_DATA_LOAD, MMU_PRIMARY_IDX, =
ra);
+    desta =3D access_prepare(env, a1, l, MMU_DATA_STORE, MMU_SECONDARY_I=
DX, ra);
+    access_memmove(env, &desta, &srca, ra);
     return cc;
 }
=20
 uint32_t HELPER(mvcp)(CPUS390XState *env, uint64_t l, uint64_t a1, uint6=
4_t a2)
 {
     const uint8_t psw_as =3D (env->psw.mask & PSW_MASK_ASC) >> PSW_SHIFT=
_ASC;
+    S390Access srca, desta;
     uintptr_t ra =3D GETPC();
-    int cc =3D 0, i;
+    int cc =3D 0;
=20
     HELPER_LOG("%s: %16" PRIx64 " %16" PRIx64 " %16" PRIx64 "\n",
                __func__, l, a1, a2);
@@ -2144,12 +2144,10 @@ uint32_t HELPER(mvcp)(CPUS390XState *env, uint64_=
t l, uint64_t a1, uint64_t a2)
         return cc;
     }
=20
-    /* XXX replace w/ memcpy */
-    for (i =3D 0; i < l; i++) {
-        uint8_t x =3D cpu_ldub_secondary_ra(env, a2 + i, ra);
-        cpu_stb_primary_ra(env, a1 + i, x, ra);
-    }
-
+    /* TODO: Access key handling */
+    srca =3D access_prepare(env, a2, l, MMU_DATA_LOAD, MMU_SECONDARY_IDX=
, ra);
+    desta =3D access_prepare(env, a1, l, MMU_DATA_STORE, MMU_PRIMARY_IDX=
, ra);
+    access_memmove(env, &desta, &srca, ra);
     return cc;
 }
=20
--=20
2.21.0


