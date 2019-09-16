Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 666B3B3CA4
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Sep 2019 16:35:47 +0200 (CEST)
Received: from localhost ([::1]:35206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i9s6T-0005XN-Lg
	for lists+qemu-devel@lfdr.de; Mon, 16 Sep 2019 10:35:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46461)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1i9rXY-0003xn-8d
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 09:59:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1i9rXW-0000cM-QB
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 09:59:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55146)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1i9rXW-0000bx-EH; Mon, 16 Sep 2019 09:59:38 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 732DFDDB20;
 Mon, 16 Sep 2019 13:59:37 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-117-103.ams2.redhat.com [10.36.117.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C6E8410013A1;
 Mon, 16 Sep 2019 13:59:32 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 16 Sep 2019 15:58:04 +0200
Message-Id: <20190916135806.1269-28-david@redhat.com>
In-Reply-To: <20190916135806.1269-1-david@redhat.com>
References: <20190916135806.1269-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Mon, 16 Sep 2019 13:59:37 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 27/29] s390x/tcg: MVST: Fault-safe handling
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
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Dan=20Hor=C3=A1k?= <dan@danny.cz>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Brivio <sbrivio@redhat.com>, qemu-s390x@nongnu.org,
 Cole Robinson <crobinso@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Access at most single pages and document why. Using the access helpers
might over-indicate watchpoints within the same page, I guess we can
live with that.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/mem_helper.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
index c836b69fcc..671e917dc1 100644
--- a/target/s390x/mem_helper.c
+++ b/target/s390x/mem_helper.c
@@ -860,23 +860,33 @@ uint32_t HELPER(mvpg)(CPUS390XState *env, uint64_t =
r0, uint64_t r1, uint64_t r2)
 /* string copy */
 uint32_t HELPER(mvst)(CPUS390XState *env, uint32_t r1, uint32_t r2)
 {
+    const int mmu_idx =3D cpu_mmu_index(env, false);
     const uint64_t d =3D get_address(env, r1);
     const uint64_t s =3D get_address(env, r2);
     const uint8_t c =3D env->regs[0];
+    const int len =3D MIN(-(d | TARGET_PAGE_MASK), -(s | TARGET_PAGE_MAS=
K));
+    S390Access srca, desta;
     uintptr_t ra =3D GETPC();
-    uint32_t len;
+    int i;
=20
     if (env->regs[0] & 0xffffff00ull) {
         s390_program_interrupt(env, PGM_SPECIFICATION, ILEN_AUTO, ra);
     }
=20
-    /* Lest we fail to service interrupts in a timely manner, limit the
-       amount of work we're willing to do.  For now, let's cap at 8k.  *=
/
-    for (len =3D 0; len < 0x2000; ++len) {
-        uint8_t v =3D cpu_ldub_data_ra(env, s + len, ra);
-        cpu_stb_data_ra(env, d + len, v, ra);
+    /*
+     * Our access should not exceed single pages, as we must not report =
access
+     * exceptions exceeding the actually copied range (which we don't kn=
ow at
+     * this point). We might over-indicate watchpoints within the pages
+     * (if we ever care, we have to limit processing to a single byte).
+     */
+    srca =3D access_prepare(env, s, len, MMU_DATA_LOAD, mmu_idx, ra);
+    desta =3D access_prepare(env, d, len, MMU_DATA_STORE, mmu_idx, ra);
+    for (i =3D 0; i < len; i++) {
+        const uint8_t v =3D access_get_byte(env, &srca, i, ra);
+
+        access_set_byte(env, &desta, i, v, ra);
         if (v =3D=3D c) {
-            set_address_zero(env, r1, d + len);
+            set_address_zero(env, r1, d + i);
             return 1;
         }
     }
--=20
2.21.0


