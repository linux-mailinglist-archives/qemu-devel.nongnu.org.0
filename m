Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C77A6B7A0E
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Sep 2019 15:04:15 +0200 (CEST)
Received: from localhost ([::1]:43724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAw6W-0001RP-Jk
	for lists+qemu-devel@lfdr.de; Thu, 19 Sep 2019 09:04:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41418)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1iAvsR-0006Ji-RE
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 08:49:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1iAvmD-0001wg-NR
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 08:43:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49960)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1iAvmD-0001vY-IC; Thu, 19 Sep 2019 08:43:13 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9B6C710DCC82;
 Thu, 19 Sep 2019 12:43:12 +0000 (UTC)
Received: from localhost (dhcp-192-230.str.redhat.com [10.33.192.230])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B88DE19C7F;
 Thu, 19 Sep 2019 12:43:09 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Sep 2019 14:41:08 +0200
Message-Id: <20190919124115.11510-28-cohuck@redhat.com>
In-Reply-To: <20190919124115.11510-1-cohuck@redhat.com>
References: <20190919124115.11510-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Thu, 19 Sep 2019 12:43:12 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 27/34] s390x/tcg: MVST: Fault-safe handling
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
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

Access at most single pages and document why. Using the access helpers
might over-indicate watchpoints within the same page, I guess we can
live with that.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/mem_helper.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
index c836b69fcc12..671e917dc1f8 100644
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
2.20.1


