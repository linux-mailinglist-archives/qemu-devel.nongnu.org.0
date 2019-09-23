Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 076F6BAEEE
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Sep 2019 10:10:51 +0200 (CEST)
Received: from localhost ([::1]:53408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCJQn-0003gh-4G
	for lists+qemu-devel@lfdr.de; Mon, 23 Sep 2019 04:10:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42647)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1iCJNZ-0001ei-NZ
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 04:07:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1iCJNX-0003yy-Ig
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 04:07:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53552)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1iCJNX-0003yk-DZ; Mon, 23 Sep 2019 04:07:27 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B40C510F2E82;
 Mon, 23 Sep 2019 08:07:26 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1322F19C78;
 Mon, 23 Sep 2019 08:07:24 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 05/30] s390x/tcg: MVC: Increment the length once
Date: Mon, 23 Sep 2019 10:06:47 +0200
Message-Id: <20190923080712.23951-6-david@redhat.com>
In-Reply-To: <20190923080712.23951-1-david@redhat.com>
References: <20190923080712.23951-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.66]); Mon, 23 Sep 2019 08:07:26 +0000 (UTC)
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

Let's increment the length once.

While at it, cleanup the comment. The memset() example is given as a
programming note in the PoP, so drop the description.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/mem_helper.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
index 58ab2e48e3..013e8d6045 100644
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


