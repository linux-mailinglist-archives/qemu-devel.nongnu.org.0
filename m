Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4F5B67FC
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Sep 2019 18:24:55 +0200 (CEST)
Received: from localhost ([::1]:60634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAclC-0005cn-3l
	for lists+qemu-devel@lfdr.de; Wed, 18 Sep 2019 12:24:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50280)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1iAbtl-0000FI-J8
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 11:29:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1iAbtk-0007ea-AC
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 11:29:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60160)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1iAbtk-0007e2-2C; Wed, 18 Sep 2019 11:29:40 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 18D7F3084045;
 Wed, 18 Sep 2019 15:29:39 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-117-119.ams2.redhat.com [10.36.117.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A5735D70D;
 Wed, 18 Sep 2019 15:29:37 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 18 Sep 2019 17:28:57 +0200
Message-Id: <20190918152922.18949-5-david@redhat.com>
In-Reply-To: <20190918152922.18949-1-david@redhat.com>
References: <20190918152922.18949-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Wed, 18 Sep 2019 15:29:39 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL SUBSYSTEM s390x 04/29] s390x/tcg: MVCL: Process
 max 4k bytes at a time
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

Process max 4k bytes at a time, writing back registers between the
accesses. The instruction is interruptible.
    "For operands longer than 2K bytes, access exceptions are not
    recognized for locations more than 2K bytes beyond the current locati=
on
    being processed."
Note that on z/Architecture, 2k vs. 4k access cannot get differentiated a=
s
long as pages are not crossed. This seems to be a leftover from ESA/390.
Simply stay within single pages.

MVCL handling is quite different than MVCLE/MVCLU handling, so split up
the handlers.

Defer interrupt handling, as that will require more thought, add a TODO
for that.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/mem_helper.c | 44 +++++++++++++++++++++++++++++++++------
 1 file changed, 38 insertions(+), 6 deletions(-)

diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
index 223312a4b1..58ab2e48e3 100644
--- a/target/s390x/mem_helper.c
+++ b/target/s390x/mem_helper.c
@@ -798,19 +798,51 @@ uint32_t HELPER(mvcl)(CPUS390XState *env, uint32_t =
r1, uint32_t r2)
     uint64_t srclen =3D env->regs[r2 + 1] & 0xffffff;
     uint64_t src =3D get_address(env, r2);
     uint8_t pad =3D env->regs[r2 + 1] >> 24;
-    uint32_t cc;
+    uint32_t cc, cur_len;
=20
     if (is_destructive_overlap(env, dest, src, MIN(srclen, destlen))) {
         cc =3D 3;
+    } else if (srclen =3D=3D destlen) {
+        cc =3D 0;
+    } else if (destlen < srclen) {
+        cc =3D 1;
     } else {
-        cc =3D do_mvcl(env, &dest, &destlen, &src, &srclen, pad, 1, ra);
+        cc =3D 2;
     }
=20
-    env->regs[r1 + 1] =3D deposit64(env->regs[r1 + 1], 0, 24, destlen);
-    env->regs[r2 + 1] =3D deposit64(env->regs[r2 + 1], 0, 24, srclen);
-    set_address_zero(env, r1, dest);
-    set_address_zero(env, r2, src);
+    /* We might have to zero-out some bits even if there was no action. =
*/
+    if (unlikely(!destlen || cc =3D=3D 3)) {
+        set_address_zero(env, r2, src);
+        set_address_zero(env, r1, dest);
+        return cc;
+    } else if (!srclen) {
+        set_address_zero(env, r2, src);
+    }
=20
+    /*
+     * Only perform one type of type of operation (move/pad) in one step=
.
+     * Stay within single pages.
+     */
+    while (destlen) {
+        cur_len =3D MIN(destlen, -(dest | TARGET_PAGE_MASK));
+        if (!srclen) {
+            fast_memset(env, dest, pad, cur_len, ra);
+        } else {
+            cur_len =3D MIN(MIN(srclen, -(src | TARGET_PAGE_MASK)), cur_=
len);
+
+            fast_memmove(env, dest, src, cur_len, ra);
+            src =3D wrap_address(env, src + cur_len);
+            srclen -=3D cur_len;
+            env->regs[r2 + 1] =3D deposit64(env->regs[r2 + 1], 0, 24, sr=
clen);
+            set_address_zero(env, r2, src);
+        }
+        dest =3D wrap_address(env, dest + cur_len);
+        destlen -=3D cur_len;
+        env->regs[r1 + 1] =3D deposit64(env->regs[r1 + 1], 0, 24, destle=
n);
+        set_address_zero(env, r1, dest);
+
+        /* TODO: Deliver interrupts. */
+    }
     return cc;
 }
=20
--=20
2.21.0


