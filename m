Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB89B3C92
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Sep 2019 16:31:16 +0200 (CEST)
Received: from localhost ([::1]:35154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i9s26-0001YS-Jk
	for lists+qemu-devel@lfdr.de; Mon, 16 Sep 2019 10:31:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46376)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1i9rXO-0003ki-IB
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 09:59:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1i9rXM-0000ZK-NB
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 09:59:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43366)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1i9rXM-0000Z5-GO; Mon, 16 Sep 2019 09:59:28 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A6CD6307D8B9;
 Mon, 16 Sep 2019 13:59:27 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-117-103.ams2.redhat.com [10.36.117.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 84B8810013A1;
 Mon, 16 Sep 2019 13:59:25 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 16 Sep 2019 15:58:01 +0200
Message-Id: <20190916135806.1269-25-david@redhat.com>
In-Reply-To: <20190916135806.1269-1-david@redhat.com>
References: <20190916135806.1269-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Mon, 16 Sep 2019 13:59:27 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 24/29] s390x/tcg: MVCIN: Fault-safe handling
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

We can process a maximum of 256 bytes, crossing two pages. Calculate the
accessed range upfront - src is accessed right-to-left.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/mem_helper.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
index 20fc17d44d..4f46d0be90 100644
--- a/target/s390x/mem_helper.c
+++ b/target/s390x/mem_helper.c
@@ -473,12 +473,21 @@ void HELPER(mvc)(CPUS390XState *env, uint32_t l, ui=
nt64_t dest, uint64_t src)
 /* move inverse  */
 void HELPER(mvcin)(CPUS390XState *env, uint32_t l, uint64_t dest, uint64=
_t src)
 {
+    const int mmu_idx =3D cpu_mmu_index(env, false);
+    S390Access srca, desta;
     uintptr_t ra =3D GETPC();
     int i;
=20
-    for (i =3D 0; i <=3D l; i++) {
-        uint8_t v =3D cpu_ldub_data_ra(env, src - i, ra);
-        cpu_stb_data_ra(env, dest + i, v, ra);
+    /* MVCIN always copies one more byte than specified - maximum is 256=
 */
+    l++;
+
+    src =3D wrap_address(env, src - l + 1);
+    srca =3D access_prepare(env, src, l, MMU_DATA_LOAD, mmu_idx, ra);
+    desta =3D access_prepare(env, dest, l, MMU_DATA_STORE, mmu_idx, ra);
+    for (i =3D 0; i < l; i++) {
+        const uint8_t x =3D access_get_byte(env, &srca, l - i - 1, ra);
+
+        access_set_byte(env, &desta, i, x, ra);
     }
 }
=20
--=20
2.21.0


