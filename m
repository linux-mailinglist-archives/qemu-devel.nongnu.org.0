Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D15AB3A9
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Sep 2019 10:04:16 +0200 (CEST)
Received: from localhost ([::1]:53212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i69E7-0000pE-3K
	for lists+qemu-devel@lfdr.de; Fri, 06 Sep 2019 04:04:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42157)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1i698T-0003qC-LV
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 03:58:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1i698S-0003HS-Dv
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 03:58:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59900)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1i698S-0003Gs-8C; Fri, 06 Sep 2019 03:58:24 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 86FBB3084288;
 Fri,  6 Sep 2019 07:58:22 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-117-162.ams2.redhat.com [10.36.117.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC35A1001284;
 Fri,  6 Sep 2019 07:58:20 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  6 Sep 2019 09:57:32 +0200
Message-Id: <20190906075750.14791-11-david@redhat.com>
In-Reply-To: <20190906075750.14791-1-david@redhat.com>
References: <20190906075750.14791-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Fri, 06 Sep 2019 07:58:23 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 10/28] s390x/tcg: MVCS/MVCP: Check for
 special operation exceptions
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
Cc: Florian Weimer <fweimer@redhat.com>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Stefano Brivio <sbrivio@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's perform the documented checks.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/mem_helper.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
index 6d8ebd18fa..041d01d63d 100644
--- a/target/s390x/mem_helper.c
+++ b/target/s390x/mem_helper.c
@@ -1961,12 +1961,18 @@ uint32_t HELPER(rrbe)(CPUS390XState *env, uint64_=
t r2)
=20
 uint32_t HELPER(mvcs)(CPUS390XState *env, uint64_t l, uint64_t a1, uint6=
4_t a2)
 {
+    const uint8_t psw_as =3D (env->psw.mask & PSW_MASK_ASC) >> PSW_SHIFT=
_ASC;
     uintptr_t ra =3D GETPC();
     int cc =3D 0, i;
=20
     HELPER_LOG("%s: %16" PRIx64 " %16" PRIx64 " %16" PRIx64 "\n",
                __func__, l, a1, a2);
=20
+    if (!(env->psw.mask & PSW_MASK_DAT) || !(env->cregs[0] & CR0_SECONDA=
RY) ||
+        psw_as =3D=3D AS_HOME || psw_as =3D=3D AS_ACCREG) {
+        s390_program_interrupt(env, PGM_SPECIAL_OP, ILEN_AUTO, ra);
+    }
+
     if (l > 256) {
         /* max 256 */
         l =3D 256;
@@ -1984,12 +1990,18 @@ uint32_t HELPER(mvcs)(CPUS390XState *env, uint64_=
t l, uint64_t a1, uint64_t a2)
=20
 uint32_t HELPER(mvcp)(CPUS390XState *env, uint64_t l, uint64_t a1, uint6=
4_t a2)
 {
+    const uint8_t psw_as =3D (env->psw.mask & PSW_MASK_ASC) >> PSW_SHIFT=
_ASC;
     uintptr_t ra =3D GETPC();
     int cc =3D 0, i;
=20
     HELPER_LOG("%s: %16" PRIx64 " %16" PRIx64 " %16" PRIx64 "\n",
                __func__, l, a1, a2);
=20
+    if (!(env->psw.mask & PSW_MASK_DAT) || !(env->cregs[0] & CR0_SECONDA=
RY) ||
+        psw_as =3D=3D AS_HOME || psw_as =3D=3D AS_ACCREG) {
+        s390_program_interrupt(env, PGM_SPECIAL_OP, ILEN_AUTO, ra);
+    }
+
     if (l > 256) {
         /* max 256 */
         l =3D 256;
--=20
2.21.0


