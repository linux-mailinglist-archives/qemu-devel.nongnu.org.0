Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C8CAB39A
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Sep 2019 10:00:52 +0200 (CEST)
Received: from localhost ([::1]:53172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i69Ao-0005JG-Ik
	for lists+qemu-devel@lfdr.de; Fri, 06 Sep 2019 04:00:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41995)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1i698C-0003T0-Pn
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 03:58:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1i698B-0002nu-IL
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 03:58:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54562)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1i698B-0002mM-C0; Fri, 06 Sep 2019 03:58:07 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A31D6307D930;
 Fri,  6 Sep 2019 07:58:06 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-117-162.ams2.redhat.com [10.36.117.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D26611001B00;
 Fri,  6 Sep 2019 07:58:04 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  6 Sep 2019 09:57:27 +0200
Message-Id: <20190906075750.14791-6-david@redhat.com>
In-Reply-To: <20190906075750.14791-1-david@redhat.com>
References: <20190906075750.14791-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Fri, 06 Sep 2019 07:58:06 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 05/28] s390x/tcg: MVC: Increment the length
 once
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
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Brivio <sbrivio@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's increment the length once.

While at it, cleanup the comment. The memset() example is given as a
programming note in the PoP, so drop the description.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/mem_helper.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
index 2e22c183bd..2bc2cd09c1 100644
--- a/target/s390x/mem_helper.c
+++ b/target/s390x/mem_helper.c
@@ -320,16 +320,20 @@ static uint32_t do_helper_mvc(CPUS390XState *env, u=
int32_t l, uint64_t dest,
     HELPER_LOG("%s l %d dest %" PRIx64 " src %" PRIx64 "\n",
                __func__, l, dest, src);
=20
-    /* mvc and memmove do not behave the same when areas overlap! */
-    /* mvc with source pointing to the byte after the destination is the
-       same as memset with the first source byte */
+    /* MVC always copies one more byte than specified - maximum is 256 *=
/
+    l++;
+
+    /*
+     * "When the operands overlap, the result is obtained as if the oper=
ands
+     * were processed one byte at a time". Only non-destructive overlaps
+     * behave like memmove().
+     */
     if (dest =3D=3D src + 1) {
-        fast_memset(env, dest, cpu_ldub_data_ra(env, src, ra), l + 1, ra=
);
-    } else if (dest < src || src + l < dest) {
-        fast_memmove(env, dest, src, l + 1, ra);
+        fast_memset(env, dest, cpu_ldub_data_ra(env, src, ra), l, ra);
+    } else if (dest < src || src + l <=3D dest) {
+        fast_memmove(env, dest, src, l, ra);
     } else {
-        /* slow version with byte accesses which always work */
-        for (i =3D 0; i <=3D l; i++) {
+        for (i =3D 0; i < l; i++) {
             uint8_t x =3D cpu_ldub_data_ra(env, src + i, ra);
             cpu_stb_data_ra(env, dest + i, x, ra);
         }
--=20
2.21.0


