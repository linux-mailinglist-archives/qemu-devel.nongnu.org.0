Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E345B3C27
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Sep 2019 16:06:14 +0200 (CEST)
Received: from localhost ([::1]:34566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i9rdt-0000Fl-CB
	for lists+qemu-devel@lfdr.de; Mon, 16 Sep 2019 10:06:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45984)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1i9rWr-0002wf-9J
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 09:58:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1i9rWp-0000Jl-U3
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 09:58:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55988)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1i9rWp-0000FN-Jf; Mon, 16 Sep 2019 09:58:55 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 008A38980FB;
 Mon, 16 Sep 2019 13:58:52 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-117-103.ams2.redhat.com [10.36.117.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0BFFD10013A1;
 Mon, 16 Sep 2019 13:58:49 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 16 Sep 2019 15:57:46 +0200
Message-Id: <20190916135806.1269-10-david@redhat.com>
In-Reply-To: <20190916135806.1269-1-david@redhat.com>
References: <20190916135806.1269-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Mon, 16 Sep 2019 13:58:52 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 09/29] s390x/tcg: MVCLU/MVCLE: Process max
 4k bytes at a time
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
 Stefano Brivio <sbrivio@redhat.com>, qemu-s390x@nongnu.org,
 Cole Robinson <crobinso@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's stay within single pages.

... and indicate cc=3D3 in case there is work remaining. Keep unicode
padding simple.

While reworking, properly wrap the addresses.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/mem_helper.c | 54 ++++++++++++++++++++++-----------------
 1 file changed, 31 insertions(+), 23 deletions(-)

diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
index 746f647303..86238e0163 100644
--- a/target/s390x/mem_helper.c
+++ b/target/s390x/mem_helper.c
@@ -768,8 +768,8 @@ static inline uint32_t do_mvcl(CPUS390XState *env,
                                uint64_t *src, uint64_t *srclen,
                                uint16_t pad, int wordsize, uintptr_t ra)
 {
-    uint64_t len =3D MIN(*srclen, *destlen);
-    uint32_t cc;
+    int len =3D MIN(*destlen, -(*dest | TARGET_PAGE_MASK));
+    int i, cc;
=20
     if (*destlen =3D=3D *srclen) {
         cc =3D 0;
@@ -779,32 +779,40 @@ static inline uint32_t do_mvcl(CPUS390XState *env,
         cc =3D 2;
     }
=20
-    /* Copy the src array */
-    fast_memmove(env, *dest, *src, len, ra);
-    *src +=3D len;
-    *srclen -=3D len;
-    *dest +=3D len;
-    *destlen -=3D len;
+    if (!*destlen) {
+        return cc;
+    }
=20
-    /* Pad the remaining area */
-    if (wordsize =3D=3D 1) {
-        fast_memset(env, *dest, pad, *destlen, ra);
-        *dest +=3D *destlen;
-        *destlen =3D 0;
+    /*
+     * Only perform one type of type of operation (move/pad) at a time.
+     * Stay within single pages.
+     */
+    if (*srclen) {
+        /* Copy the src array */
+        len =3D MIN(MIN(*srclen, -(*src | TARGET_PAGE_MASK)), len);
+        *destlen -=3D len;
+        *srclen -=3D len;
+        fast_memmove(env, *dest, *src, len, ra);
+        *src =3D wrap_address(env, *src + len);
+        *dest =3D wrap_address(env, *dest + len);
+    } else if (wordsize =3D=3D 1) {
+        /* Pad the remaining area */
+        *destlen -=3D len;
+        fast_memset(env, *dest, pad, len, ra);
+        *dest =3D wrap_address(env, *dest + len);
     } else {
-        /* If remaining length is odd, pad with odd byte first.  */
-        if (*destlen & 1) {
-            cpu_stb_data_ra(env, *dest, pad & 0xff, ra);
-            *dest +=3D 1;
-            *destlen -=3D 1;
-        }
-        /* The remaining length is even, pad using words.  */
-        for (; *destlen; *dest +=3D 2, *destlen -=3D 2) {
-            cpu_stw_data_ra(env, *dest, pad, ra);
+        /* The remaining length selects the padding byte. */
+        for (i =3D 0; i < len; (*destlen)--, i++) {
+            if (*destlen & 1) {
+                cpu_stb_data_ra(env, *dest, pad, ra);
+            } else {
+                cpu_stb_data_ra(env, *dest, pad >> 8, ra);
+            }
+            *dest =3D wrap_address(env, *dest + 1);
         }
     }
=20
-    return cc;
+    return *destlen ? 3 : cc;
 }
=20
 /* move long */
--=20
2.21.0


