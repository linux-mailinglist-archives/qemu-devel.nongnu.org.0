Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5EABAFA1
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Sep 2019 10:34:05 +0200 (CEST)
Received: from localhost ([::1]:53634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCJnH-0000QS-Np
	for lists+qemu-devel@lfdr.de; Mon, 23 Sep 2019 04:34:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43134)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1iCJOP-0002f8-P7
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 04:08:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1iCJOO-0004Nw-Le
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 04:08:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57090)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1iCJOO-0004NI-G6; Mon, 23 Sep 2019 04:08:20 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id ADDED10CC1F0;
 Mon, 23 Sep 2019 08:08:19 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0989B19D70;
 Mon, 23 Sep 2019 08:08:17 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 23/30] s390x/tcg: NC: Fault-safe handling
Date: Mon, 23 Sep 2019 10:07:05 +0200
Message-Id: <20190923080712.23951-24-david@redhat.com>
In-Reply-To: <20190923080712.23951-1-david@redhat.com>
References: <20190923080712.23951-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.65]); Mon, 23 Sep 2019 08:08:19 +0000 (UTC)
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

We can process a maximum of 256 bytes, crossing two pages.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/mem_helper.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
index 0d4e0bc45a..a97e4aa535 100644
--- a/target/s390x/mem_helper.c
+++ b/target/s390x/mem_helper.c
@@ -329,17 +329,26 @@ static int mmu_idx_from_as(uint8_t as)
 static uint32_t do_helper_nc(CPUS390XState *env, uint32_t l, uint64_t de=
st,
                              uint64_t src, uintptr_t ra)
 {
+    const int mmu_idx =3D cpu_mmu_index(env, false);
+    S390Access srca1, srca2, desta;
     uint32_t i;
     uint8_t c =3D 0;
=20
     HELPER_LOG("%s l %d dest %" PRIx64 " src %" PRIx64 "\n",
                __func__, l, dest, src);
=20
-    for (i =3D 0; i <=3D l; i++) {
-        uint8_t x =3D cpu_ldub_data_ra(env, src + i, ra);
-        x &=3D cpu_ldub_data_ra(env, dest + i, ra);
+    /* NC always processes one more byte than specified - maximum is 256=
 */
+    l++;
+
+    srca1 =3D access_prepare(env, src, l, MMU_DATA_LOAD, mmu_idx, ra);
+    srca2 =3D access_prepare(env, dest, l, MMU_DATA_LOAD, mmu_idx, ra);
+    desta =3D access_prepare(env, dest, l, MMU_DATA_STORE, mmu_idx, ra);
+    for (i =3D 0; i < l; i++) {
+        const uint8_t x =3D access_get_byte(env, &srca1, i, ra) &
+                          access_get_byte(env, &srca2, i, ra);
+
         c |=3D x;
-        cpu_stb_data_ra(env, dest + i, x, ra);
+        access_set_byte(env, &desta, i, x, ra);
     }
     return c !=3D 0;
 }
--=20
2.21.0


