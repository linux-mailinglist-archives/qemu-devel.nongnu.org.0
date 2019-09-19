Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D209B7A19
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Sep 2019 15:07:30 +0200 (CEST)
Received: from localhost ([::1]:43766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAw9g-0004zy-JK
	for lists+qemu-devel@lfdr.de; Thu, 19 Sep 2019 09:07:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41468)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1iAvsU-0006KH-B9
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 08:49:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1iAvm5-0001mF-92
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 08:43:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46888)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1iAvm5-0001jt-2B; Thu, 19 Sep 2019 08:43:05 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B5B62C04AC69;
 Thu, 19 Sep 2019 12:43:03 +0000 (UTC)
Received: from localhost (dhcp-192-230.str.redhat.com [10.33.192.230])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EEF335D9CC;
 Thu, 19 Sep 2019 12:43:00 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Sep 2019 14:41:06 +0200
Message-Id: <20190919124115.11510-26-cohuck@redhat.com>
In-Reply-To: <20190919124115.11510-1-cohuck@redhat.com>
References: <20190919124115.11510-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Thu, 19 Sep 2019 12:43:03 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 25/34] s390x/tcg: MVN: Fault-safe handling
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

We can process a maximum of 256 bytes, crossing two pages.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/mem_helper.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
index 4f46d0be90b3..fbf65ac42bd2 100644
--- a/target/s390x/mem_helper.c
+++ b/target/s390x/mem_helper.c
@@ -494,13 +494,22 @@ void HELPER(mvcin)(CPUS390XState *env, uint32_t l, =
uint64_t dest, uint64_t src)
 /* move numerics  */
 void HELPER(mvn)(CPUS390XState *env, uint32_t l, uint64_t dest, uint64_t=
 src)
 {
+    const int mmu_idx =3D cpu_mmu_index(env, false);
+    S390Access srca1, srca2, desta;
     uintptr_t ra =3D GETPC();
     int i;
=20
-    for (i =3D 0; i <=3D l; i++) {
-        uint8_t v =3D cpu_ldub_data_ra(env, dest + i, ra) & 0xf0;
-        v |=3D cpu_ldub_data_ra(env, src + i, ra) & 0x0f;
-        cpu_stb_data_ra(env, dest + i, v, ra);
+    /* MVN always copies one more byte than specified - maximum is 256 *=
/
+    l++;
+
+    srca1 =3D access_prepare(env, src, l, MMU_DATA_LOAD, mmu_idx, ra);
+    srca2 =3D access_prepare(env, dest, l, MMU_DATA_LOAD, mmu_idx, ra);
+    desta =3D access_prepare(env, dest, l, MMU_DATA_STORE, mmu_idx, ra);
+    for (i =3D 0; i < l; i++) {
+        const uint8_t x =3D (access_get_byte(env, &srca1, i, ra) & 0x0f)=
 |
+                          (access_get_byte(env, &srca2, i, ra) & 0xf0);
+
+        access_set_byte(env, &desta, i, x, ra);
     }
 }
=20
--=20
2.20.1


