Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2208B6857
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Sep 2019 18:41:33 +0200 (CEST)
Received: from localhost ([::1]:60820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAd1I-0008Ef-7O
	for lists+qemu-devel@lfdr.de; Wed, 18 Sep 2019 12:41:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50741)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1iAbvR-00025n-4R
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 11:31:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1iAbvP-0000XV-4R
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 11:31:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33300)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1iAbvO-0000Wt-Rs; Wed, 18 Sep 2019 11:31:23 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2C72C3C93D;
 Wed, 18 Sep 2019 15:31:22 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-117-119.ams2.redhat.com [10.36.117.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 87FA95D6B2;
 Wed, 18 Sep 2019 15:31:20 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 18 Sep 2019 17:29:10 +0200
Message-Id: <20190918152922.18949-18-david@redhat.com>
In-Reply-To: <20190918152922.18949-1-david@redhat.com>
References: <20190918152922.18949-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Wed, 18 Sep 2019 15:31:22 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL SUBSYSTEM s390x 17/29] s390x/tcg: Fault-safe
 memmove
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

Replace fast_memmove() variants by access_memmove() variants, that
first try to probe access to all affected pages (maximum is two pages).

Introduce access_get_byte()/access_set_byte(). We might be able to speed
up memmove in special cases even further (do single-byte access, use
memmove() for remaining bytes in page), however, we'll skip that for now.

In MVCOS, simply always call access_memmove_as() and drop the TODO
about LAP. LAP is already handled in the MMU.

Get rid of adj_len_to_page(), which is now unused.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/mem_helper.c | 232 ++++++++++++++++++++++----------------
 1 file changed, 133 insertions(+), 99 deletions(-)

diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
index dd5da70746..e50cec9263 100644
--- a/target/s390x/mem_helper.c
+++ b/target/s390x/mem_helper.c
@@ -65,17 +65,6 @@ static bool is_destructive_overlap(CPUS390XState *env,=
 uint64_t dest,
     return dest > src && dest <=3D src + len - 1;
 }
=20
-/* Reduce the length so that addr + len doesn't cross a page boundary.  =
*/
-static inline uint32_t adj_len_to_page(uint32_t len, uint64_t addr)
-{
-#ifndef CONFIG_USER_ONLY
-    if ((addr & ~TARGET_PAGE_MASK) + len - 1 >=3D TARGET_PAGE_SIZE) {
-        return -(addr | TARGET_PAGE_MASK);
-    }
-#endif
-    return len;
-}
-
 /* Trigger a SPECIFICATION exception if an address or a length is not
    naturally aligned.  */
 static inline void check_alignment(CPUS390XState *env, uint64_t v,
@@ -208,39 +197,110 @@ static void access_memset(CPUS390XState *env, S390=
Access *desta,
                      desta->mmu_idx, ra);
 }
=20
-#ifndef CONFIG_USER_ONLY
-static void fast_memmove_idx(CPUS390XState *env, uint64_t dest, uint64_t=
 src,
-                             uint32_t len, int dest_idx, int src_idx,
-                             uintptr_t ra)
+static uint8_t do_access_get_byte(CPUS390XState *env, vaddr vaddr, char =
**haddr,
+                                  int offset, int mmu_idx, uintptr_t ra)
 {
-    TCGMemOpIdx oi_dest =3D make_memop_idx(MO_UB, dest_idx);
-    TCGMemOpIdx oi_src =3D make_memop_idx(MO_UB, src_idx);
-    uint32_t len_adj;
-    void *src_p;
-    void *dest_p;
-    uint8_t x;
-
-    while (len > 0) {
-        src =3D wrap_address(env, src);
-        dest =3D wrap_address(env, dest);
-        src_p =3D tlb_vaddr_to_host(env, src, MMU_DATA_LOAD, src_idx);
-        dest_p =3D tlb_vaddr_to_host(env, dest, MMU_DATA_STORE, dest_idx=
);
-
-        if (src_p && dest_p) {
-            /* Access to both whole pages granted.  */
-            len_adj =3D adj_len_to_page(adj_len_to_page(len, src), dest)=
;
-            memmove(dest_p, src_p, len_adj);
-        } else {
-            /* We failed to get access to one or both whole pages. The n=
ext
-               read or write access will likely fill the QEMU TLB for th=
e
-               next iteration.  */
-            len_adj =3D 1;
-            x =3D helper_ret_ldub_mmu(env, src, oi_src, ra);
-            helper_ret_stb_mmu(env, dest, x, oi_dest, ra);
+#ifdef CONFIG_USER_ONLY
+    return ldub_p(*haddr + offset);
+#else
+    TCGMemOpIdx oi =3D make_memop_idx(MO_UB, mmu_idx);
+    uint8_t byte;
+
+    if (likely(*haddr)) {
+        return ldub_p(*haddr + offset);
+    }
+    /*
+     * Do a single access and test if we can then get access to the
+     * page. This is especially relevant to speed up TLB_NOTDIRTY.
+     */
+    byte =3D helper_ret_ldub_mmu(env, vaddr + offset, oi, ra);
+    *haddr =3D tlb_vaddr_to_host(env, vaddr, MMU_DATA_LOAD, mmu_idx);
+    return byte;
+#endif
+}
+
+static uint8_t access_get_byte(CPUS390XState *env, S390Access *access,
+                               int offset, uintptr_t ra)
+{
+    if (offset < access->size1) {
+        return do_access_get_byte(env, access->vaddr1, &access->haddr1,
+                                  offset, access->mmu_idx, ra);
+    }
+    return do_access_get_byte(env, access->vaddr2, &access->haddr2,
+                              offset - access->size1, access->mmu_idx, r=
a);
+}
+
+static void do_access_set_byte(CPUS390XState *env, vaddr vaddr, char **h=
addr,
+                               int offset, uint8_t byte, int mmu_idx,
+                               uintptr_t ra)
+{
+#ifdef CONFIG_USER_ONLY
+    stb_p(*haddr + offset, byte);
+#else
+    TCGMemOpIdx oi =3D make_memop_idx(MO_UB, mmu_idx);
+
+    if (likely(*haddr)) {
+        stb_p(*haddr + offset, byte);
+        return;
+    }
+    /*
+     * Do a single access and test if we can then get access to the
+     * page. This is especially relevant to speed up TLB_NOTDIRTY.
+     */
+    helper_ret_stb_mmu(env, vaddr + offset, byte, oi, ra);
+    *haddr =3D tlb_vaddr_to_host(env, vaddr, MMU_DATA_STORE, mmu_idx);
+#endif
+}
+
+static void access_set_byte(CPUS390XState *env, S390Access *access,
+                            int offset, uint8_t byte, uintptr_t ra)
+{
+    if (offset < access->size1) {
+        do_access_set_byte(env, access->vaddr1, &access->haddr1, offset,=
 byte,
+                           access->mmu_idx, ra);
+    } else {
+        do_access_set_byte(env, access->vaddr2, &access->haddr2,
+                           offset - access->size1, byte, access->mmu_idx=
, ra);
+    }
+}
+
+/*
+ * Move data with the same semantics as memmove() in case ranges don't o=
verlap
+ * or src > dest. Undefined behavior on destructive overlaps.
+ */
+static void access_memmove(CPUS390XState *env, S390Access *desta,
+                           S390Access *srca, uintptr_t ra)
+{
+    int diff;
+
+    g_assert(desta->size1 + desta->size2 =3D=3D srca->size1 + srca->size=
2);
+
+    /* Fallback to slow access in case we don't have access to all host =
pages */
+    if (unlikely(!desta->haddr1 || (desta->size2 && !desta->haddr2) ||
+                 !srca->haddr1 || (srca->size2 && !srca->haddr2))) {
+        int i;
+
+        for (i =3D 0; i < desta->size1 + desta->size2; i++) {
+            uint8_t byte =3D access_get_byte(env, srca, i, ra);
+
+            access_set_byte(env, desta, i, byte, ra);
         }
-        src +=3D len_adj;
-        dest +=3D len_adj;
-        len -=3D len_adj;
+        return;
+    }
+
+    if (srca->size1 =3D=3D desta->size1) {
+        memmove(desta->haddr1, srca->haddr1, srca->size1);
+        memmove(desta->haddr2, srca->haddr2, srca->size2);
+    } else if (srca->size1 < desta->size1) {
+        diff =3D desta->size1 - srca->size1;
+        memmove(desta->haddr1, srca->haddr1, srca->size1);
+        memmove(desta->haddr1 + srca->size1, srca->haddr2, diff);
+        memmove(desta->haddr2, srca->haddr2 + diff, desta->size2);
+    } else {
+        diff =3D srca->size1 - desta->size1;
+        memmove(desta->haddr1, srca->haddr1, desta->size1);
+        memmove(desta->haddr2, srca->haddr1 + desta->size1, diff);
+        memmove(desta->haddr2 + diff, srca->haddr2, srca->size2);
     }
 }
=20
@@ -259,45 +319,6 @@ static int mmu_idx_from_as(uint8_t as)
     }
 }
=20
-static void fast_memmove_as(CPUS390XState *env, uint64_t dest, uint64_t =
src,
-                            uint32_t len, uint8_t dest_as, uint8_t src_a=
s,
-                            uintptr_t ra)
-{
-    int src_idx =3D mmu_idx_from_as(src_as);
-    int dest_idx =3D mmu_idx_from_as(dest_as);
-
-    fast_memmove_idx(env, dest, src, len, dest_idx, src_idx, ra);
-}
-#endif
-
-static void fast_memmove(CPUS390XState *env, uint64_t dest, uint64_t src=
,
-                         uint32_t l, uintptr_t ra)
-{
-    int mmu_idx =3D cpu_mmu_index(env, false);
-
-    while (l > 0) {
-        void *src_p =3D tlb_vaddr_to_host(env, src, MMU_DATA_LOAD, mmu_i=
dx);
-        void *dest_p =3D tlb_vaddr_to_host(env, dest, MMU_DATA_STORE, mm=
u_idx);
-        if (src_p && dest_p) {
-            /* Access to both whole pages granted.  */
-            uint32_t l_adj =3D adj_len_to_page(l, src);
-            l_adj =3D adj_len_to_page(l_adj, dest);
-            memmove(dest_p, src_p, l_adj);
-            src +=3D l_adj;
-            dest +=3D l_adj;
-            l -=3D l_adj;
-        } else {
-            /* We failed to get access to one or both whole pages. The n=
ext
-               read or write access will likely fill the QEMU TLB for th=
e
-               next iteration.  */
-            cpu_stb_data_ra(env, dest, cpu_ldub_data_ra(env, src, ra), r=
a);
-            src++;
-            dest++;
-            l--;
-        }
-    }
-}
-
 /* and on array */
 static uint32_t do_helper_nc(CPUS390XState *env, uint32_t l, uint64_t de=
st,
                              uint64_t src, uintptr_t ra)
@@ -388,7 +409,7 @@ static uint32_t do_helper_mvc(CPUS390XState *env, uin=
t32_t l, uint64_t dest,
                               uint64_t src, uintptr_t ra)
 {
     const int mmu_idx =3D cpu_mmu_index(env, false);
-    S390Access desta;
+    S390Access srca, desta;
     uint32_t i;
=20
     HELPER_LOG("%s l %d dest %" PRIx64 " src %" PRIx64 "\n",
@@ -397,6 +418,7 @@ static uint32_t do_helper_mvc(CPUS390XState *env, uin=
t32_t l, uint64_t dest,
     /* MVC always copies one more byte than specified - maximum is 256 *=
/
     l++;
=20
+    srca =3D access_prepare(env, src, l, MMU_DATA_LOAD, mmu_idx, ra);
     desta =3D access_prepare(env, dest, l, MMU_DATA_STORE, mmu_idx, ra);
=20
     /*
@@ -405,9 +427,9 @@ static uint32_t do_helper_mvc(CPUS390XState *env, uin=
t32_t l, uint64_t dest,
      * behave like memmove().
      */
     if (dest =3D=3D src + 1) {
-        access_memset(env, &desta, cpu_ldub_data_ra(env, src, ra), ra);
+        access_memset(env, &desta, access_get_byte(env, &srca, 0, ra), r=
a);
     } else if (!is_destructive_overlap(env, dest, src, l)) {
-        fast_memmove(env, dest, src, l, ra);
+        access_memmove(env, &desta, &srca, ra);
     } else {
         for (i =3D 0; i < l; i++) {
             uint8_t x =3D cpu_ldub_data_ra(env, src + i, ra);
@@ -756,8 +778,11 @@ uint64_t HELPER(clst)(CPUS390XState *env, uint64_t c=
, uint64_t s1, uint64_t s2)
 /* move page */
 uint32_t HELPER(mvpg)(CPUS390XState *env, uint64_t r0, uint64_t r1, uint=
64_t r2)
 {
+    const int mmu_idx =3D cpu_mmu_index(env, false);
     const bool f =3D extract64(r0, 11, 1);
     const bool s =3D extract64(r0, 10, 1);
+    uintptr_t ra =3D GETPC();
+    S390Access srca, desta;
=20
     if ((f && s) || extract64(r0, 12, 4)) {
         s390_program_interrupt(env, PGM_SPECIFICATION, ILEN_AUTO, GETPC(=
));
@@ -772,7 +797,11 @@ uint32_t HELPER(mvpg)(CPUS390XState *env, uint64_t r=
0, uint64_t r1, uint64_t r2)
      * - CC-option with surpression of page-translation exceptions
      * - Store r1/r2 register identifiers at real location 162
      */
-    fast_memmove(env, r1, r2, TARGET_PAGE_SIZE, GETPC());
+    srca =3D access_prepare(env, r2, TARGET_PAGE_SIZE, MMU_DATA_LOAD, mm=
u_idx,
+                          ra);
+    desta =3D access_prepare(env, r1, TARGET_PAGE_SIZE, MMU_DATA_STORE, =
mmu_idx,
+                           ra);
+    access_memmove(env, &desta, &srca, ra);
     return 0; /* data moved */
 }
=20
@@ -853,7 +882,7 @@ static inline uint32_t do_mvcl(CPUS390XState *env,
 {
     const int mmu_idx =3D cpu_mmu_index(env, false);
     int len =3D MIN(*destlen, -(*dest | TARGET_PAGE_MASK));
-    S390Access desta;
+    S390Access srca, desta;
     int i, cc;
=20
     if (*destlen =3D=3D *srclen) {
@@ -877,7 +906,9 @@ static inline uint32_t do_mvcl(CPUS390XState *env,
         len =3D MIN(MIN(*srclen, -(*src | TARGET_PAGE_MASK)), len);
         *destlen -=3D len;
         *srclen -=3D len;
-        fast_memmove(env, *dest, *src, len, ra);
+        srca =3D access_prepare(env, *src, len, MMU_DATA_LOAD, mmu_idx, =
ra);
+        desta =3D access_prepare(env, *dest, len, MMU_DATA_STORE, mmu_id=
x, ra);
+        access_memmove(env, &desta, &srca, ra);
         *src =3D wrap_address(env, *src + len);
         *dest =3D wrap_address(env, *dest + len);
     } else if (wordsize =3D=3D 1) {
@@ -911,8 +942,8 @@ uint32_t HELPER(mvcl)(CPUS390XState *env, uint32_t r1=
, uint32_t r2)
     uint64_t srclen =3D env->regs[r2 + 1] & 0xffffff;
     uint64_t src =3D get_address(env, r2);
     uint8_t pad =3D env->regs[r2 + 1] >> 24;
+    S390Access srca, desta;
     uint32_t cc, cur_len;
-    S390Access desta;
=20
     if (is_destructive_overlap(env, dest, src, MIN(srclen, destlen))) {
         cc =3D 3;
@@ -946,7 +977,11 @@ uint32_t HELPER(mvcl)(CPUS390XState *env, uint32_t r=
1, uint32_t r2)
         } else {
             cur_len =3D MIN(MIN(srclen, -(src | TARGET_PAGE_MASK)), cur_=
len);
=20
-            fast_memmove(env, dest, src, cur_len, ra);
+            srca =3D access_prepare(env, src, cur_len, MMU_DATA_LOAD, mm=
u_idx,
+                                  ra);
+            desta =3D access_prepare(env, dest, cur_len, MMU_DATA_STORE,=
 mmu_idx,
+                                   ra);
+            access_memmove(env, &desta, &srca, ra);
             src =3D wrap_address(env, src + cur_len);
             srclen -=3D cur_len;
             env->regs[r2 + 1] =3D deposit64(env->regs[r2 + 1], 0, 24, sr=
clen);
@@ -2488,16 +2523,15 @@ uint32_t HELPER(mvcos)(CPUS390XState *env, uint64=
_t dest, uint64_t src,
         s390_program_interrupt(env, PGM_ADDRESSING, 6, ra);
     }
=20
-    /* FIXME: a) LAP
-     *        b) Access using correct keys
-     *        c) AR-mode
-     */
-#ifdef CONFIG_USER_ONLY
-    /* psw keys are never valid in user mode, we will never reach this *=
/
-    g_assert_not_reached();
-#else
-    fast_memmove_as(env, dest, src, len, dest_as, src_as, ra);
-#endif
+    /* FIXME: Access using correct keys and AR-mode */
+    if (len) {
+        S390Access srca =3D access_prepare(env, src, len, MMU_DATA_LOAD,
+                                         mmu_idx_from_as(src_as), ra);
+        S390Access desta =3D access_prepare(env, dest, len, MMU_DATA_STO=
RE,
+                                          mmu_idx_from_as(dest_as), ra);
+
+        access_memmove(env, &desta, &srca, ra);
+    }
=20
     return cc;
 }
--=20
2.21.0


