Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D2CB79F0
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Sep 2019 14:58:27 +0200 (CEST)
Received: from localhost ([::1]:43682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAw0u-0005vH-Ok
	for lists+qemu-devel@lfdr.de; Thu, 19 Sep 2019 08:58:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41468)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1iAvsR-0006KH-Hd
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 08:49:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1iAvmH-00021f-Vf
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 08:43:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48360)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1iAvmH-00020p-QO; Thu, 19 Sep 2019 08:43:17 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1F6D2C057F20;
 Thu, 19 Sep 2019 12:43:17 +0000 (UTC)
Received: from localhost (dhcp-192-230.str.redhat.com [10.33.192.230])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1908260BF1;
 Thu, 19 Sep 2019 12:43:13 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Sep 2019 14:41:09 +0200
Message-Id: <20190919124115.11510-29-cohuck@redhat.com>
In-Reply-To: <20190919124115.11510-1-cohuck@redhat.com>
References: <20190919124115.11510-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Thu, 19 Sep 2019 12:43:17 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 28/34] s390x/tcg: MVO: Fault-safe handling
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

Each operand can have a maximum length of 16. Make sure to prepare all
reads/writes before writing.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/mem_helper.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
index 671e917dc1f8..504542002033 100644
--- a/target/s390x/mem_helper.c
+++ b/target/s390x/mem_helper.c
@@ -516,31 +516,34 @@ void HELPER(mvn)(CPUS390XState *env, uint32_t l, ui=
nt64_t dest, uint64_t src)
 /* move with offset  */
 void HELPER(mvo)(CPUS390XState *env, uint32_t l, uint64_t dest, uint64_t=
 src)
 {
+    const int mmu_idx =3D cpu_mmu_index(env, false);
+    /* MVO always processes one more byte than specified - maximum is 16=
 */
+    const int len_dest =3D (l >> 4) + 1;
+    const int len_src =3D (l & 0xf) + 1;
     uintptr_t ra =3D GETPC();
-    int len_dest =3D l >> 4;
-    int len_src =3D l & 0xf;
     uint8_t byte_dest, byte_src;
-    int i;
+    S390Access srca, desta;
+    int i, j;
=20
-    src +=3D len_src;
-    dest +=3D len_dest;
+    srca =3D access_prepare(env, src, len_src, MMU_DATA_LOAD, mmu_idx, r=
a);
+    desta =3D access_prepare(env, dest, len_dest, MMU_DATA_STORE, mmu_id=
x, ra);
=20
     /* Handle rightmost byte */
-    byte_src =3D cpu_ldub_data_ra(env, src, ra);
-    byte_dest =3D cpu_ldub_data_ra(env, dest, ra);
+    byte_dest =3D cpu_ldub_data_ra(env, dest + len_dest - 1, ra);
+    byte_src =3D access_get_byte(env, &srca, len_src - 1, ra);
     byte_dest =3D (byte_dest & 0x0f) | (byte_src << 4);
-    cpu_stb_data_ra(env, dest, byte_dest, ra);
+    access_set_byte(env, &desta, len_dest - 1, byte_dest, ra);
=20
     /* Process remaining bytes from right to left */
-    for (i =3D 1; i <=3D len_dest; i++) {
+    for (i =3D len_dest - 2, j =3D len_src - 2; i >=3D 0; i--, j--) {
         byte_dest =3D byte_src >> 4;
-        if (len_src - i >=3D 0) {
-            byte_src =3D cpu_ldub_data_ra(env, src - i, ra);
+        if (j >=3D 0) {
+            byte_src =3D access_get_byte(env, &srca, j, ra);
         } else {
             byte_src =3D 0;
         }
         byte_dest |=3D byte_src << 4;
-        cpu_stb_data_ra(env, dest - i, byte_dest, ra);
+        access_set_byte(env, &desta, i, byte_dest, ra);
     }
 }
=20
--=20
2.20.1


