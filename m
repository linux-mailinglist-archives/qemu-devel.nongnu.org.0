Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB87B67F0
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Sep 2019 18:20:48 +0200 (CEST)
Received: from localhost ([::1]:60580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAchC-0008HB-Kz
	for lists+qemu-devel@lfdr.de; Wed, 18 Sep 2019 12:20:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50253)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1iAbtj-0000Ay-9K
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 11:29:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1iAbth-0007bz-TX
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 11:29:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44294)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1iAbth-0007bB-O2; Wed, 18 Sep 2019 11:29:37 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1282F8980EF;
 Wed, 18 Sep 2019 15:29:37 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-117-119.ams2.redhat.com [10.36.117.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 80D535D6B2;
 Wed, 18 Sep 2019 15:29:35 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 18 Sep 2019 17:28:56 +0200
Message-Id: <20190918152922.18949-4-david@redhat.com>
In-Reply-To: <20190918152922.18949-1-david@redhat.com>
References: <20190918152922.18949-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Wed, 18 Sep 2019 15:29:37 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL SUBSYSTEM s390x 03/29] s390x/tcg: MVCL: Detect
 destructive overlaps
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

We'll have to zero-out unused bit positions, so make sure to write the
addresses back.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/mem_helper.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
index b02ad148e5..223312a4b1 100644
--- a/target/s390x/mem_helper.c
+++ b/target/s390x/mem_helper.c
@@ -52,6 +52,19 @@ static inline bool psw_key_valid(CPUS390XState *env, u=
int8_t psw_key)
     return true;
 }
=20
+static bool is_destructive_overlap(CPUS390XState *env, uint64_t dest,
+                                   uint64_t src, uint32_t len)
+{
+    if (!len || src =3D=3D dest) {
+        return false;
+    }
+    /* Take care of wrapping at the end of address space. */
+    if (unlikely(wrap_address(env, src + len - 1) < src)) {
+        return dest > src || dest <=3D wrap_address(env, src + len - 1);
+    }
+    return dest > src && dest <=3D src + len - 1;
+}
+
 /* Reduce the length so that addr + len doesn't cross a page boundary.  =
*/
 static inline uint32_t adj_len_to_page(uint32_t len, uint64_t addr)
 {
@@ -787,7 +800,11 @@ uint32_t HELPER(mvcl)(CPUS390XState *env, uint32_t r=
1, uint32_t r2)
     uint8_t pad =3D env->regs[r2 + 1] >> 24;
     uint32_t cc;
=20
-    cc =3D do_mvcl(env, &dest, &destlen, &src, &srclen, pad, 1, ra);
+    if (is_destructive_overlap(env, dest, src, MIN(srclen, destlen))) {
+        cc =3D 3;
+    } else {
+        cc =3D do_mvcl(env, &dest, &destlen, &src, &srclen, pad, 1, ra);
+    }
=20
     env->regs[r1 + 1] =3D deposit64(env->regs[r1 + 1], 0, 24, destlen);
     env->regs[r2 + 1] =3D deposit64(env->regs[r2 + 1], 0, 24, srclen);
--=20
2.21.0


