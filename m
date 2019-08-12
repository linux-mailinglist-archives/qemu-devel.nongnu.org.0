Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D8889D28
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Aug 2019 13:30:56 +0200 (CEST)
Received: from localhost ([::1]:44468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hx8XP-0001cj-LK
	for lists+qemu-devel@lfdr.de; Mon, 12 Aug 2019 07:30:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34717)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <david@redhat.com>) id 1hx8Uh-0004gg-5p
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 07:28:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1hx8Uf-0002hE-Kr
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 07:28:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:13274)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1hx8Ud-0002eY-Pd; Mon, 12 Aug 2019 07:28:05 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EDF76C015C30;
 Mon, 12 Aug 2019 11:28:01 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-117-110.ams2.redhat.com [10.36.117.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 21F40600C4;
 Mon, 12 Aug 2019 11:27:59 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 12 Aug 2019 13:27:37 +0200
Message-Id: <20190812112737.6652-7-david@redhat.com>
In-Reply-To: <20190812112737.6652-1-david@redhat.com>
References: <20190812112737.6652-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Mon, 12 Aug 2019 11:28:02 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH-for-4.2 v1 6/6] s390x/mmu: Factor out storage
 key handling
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
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Factor it out, add a comment how it all works, and also use it in the
REAL MMU.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/mmu_helper.c | 114 +++++++++++++++++++++++---------------
 1 file changed, 69 insertions(+), 45 deletions(-)

diff --git a/target/s390x/mmu_helper.c b/target/s390x/mmu_helper.c
index ba4b460ac6..d2c9285d0a 100644
--- a/target/s390x/mmu_helper.c
+++ b/target/s390x/mmu_helper.c
@@ -334,6 +334,73 @@ static int mmu_translate_asce(CPUS390XState *env, ta=
rget_ulong vaddr,
     return r;
 }
=20
+static void mmu_handle_skey(target_ulong addr, int rw, int *flags)
+{
+    static S390SKeysClass *skeyclass;
+    static S390SKeysState *ss;
+    uint8_t key;
+    int rc;
+
+    if (unlikely(!ss)) {
+        ss =3D s390_get_skeys_device();
+        skeyclass =3D S390_SKEYS_GET_CLASS(ss);
+    }
+
+    /*
+     * Whenever we create a new TLB entry, we set the storage key refere=
nce
+     * bit. In case we allow write accesses, we set the storage key chan=
ge
+     * bit. Whenever the guest changes the storage key, we have to flush=
 the
+     * TLBs of all CPUs (the whole TLB or all affected entries), so that=
 the
+     * next reference/change will result in an MMU fault and make us pro=
perly
+     * update the storage key here.
+     *
+     * Note 1: "record of references ... is not necessarily accurate",
+     *         "change bit may be set in case no storing has occurred".
+     *         -> We can set reference/change bits even on exceptions.
+     * Note 2: certain accesses seem to ignore storage keys. For example=
,
+     *         DAT translation does not set reference bits for table acc=
esses.
+     *
+     * TODO: key-controlled protection. Only CPU accesses make use of th=
e
+     *       PSW key. CSS accesses are different - we have to pass in th=
e key.
+     *
+     * TODO: we have races between getting and setting the key.
+     */
+    if (addr < ram_size) {
+        rc =3D skeyclass->get_skeys(ss, addr / TARGET_PAGE_SIZE, 1, &key=
);
+        if (rc) {
+            trace_get_skeys_nonzero(rc);
+            return;
+        }
+
+        switch (rw) {
+        case MMU_DATA_LOAD:
+        case MMU_INST_FETCH:
+            /*
+             * The TLB entry has to remain write-protected on read-fault=
s if
+             * the storage key does not indicate a change already. Other=
wise
+             * we might miss setting the change bit on write accesses.
+             */
+            if (!(key & SK_C)) {
+                *flags &=3D ~PAGE_WRITE;
+            }
+            break;
+        case MMU_DATA_STORE:
+            key |=3D SK_C;
+            break;
+        default:
+            g_assert_not_reached();
+        }
+
+        /* Any store/fetch sets the reference bit */
+        key |=3D SK_R;
+
+        rc =3D skeyclass->set_skeys(ss, addr / TARGET_PAGE_SIZE, 1, &key=
);
+        if (rc) {
+            trace_set_skeys_nonzero(rc);
+        }
+    }
+}
+
 /**
  * Translate a virtual (logical) address into a physical (absolute) addr=
ess.
  * @param vaddr  the virtual address
@@ -347,16 +414,8 @@ static int mmu_translate_asce(CPUS390XState *env, ta=
rget_ulong vaddr,
 int mmu_translate(CPUS390XState *env, target_ulong vaddr, int rw, uint64=
_t asc,
                   target_ulong *raddr, int *flags, bool exc)
 {
-    static S390SKeysState *ss;
-    static S390SKeysClass *skeyclass;
     uint64_t asce;
     int r =3D -1;
-    uint8_t key;
-
-    if (unlikely(!ss)) {
-        ss =3D s390_get_skeys_device();
-        skeyclass =3D S390_SKEYS_GET_CLASS(ss);
-    }
=20
     *flags =3D PAGE_READ | PAGE_WRITE | PAGE_EXEC;
     if (is_low_address(vaddr & TARGET_PAGE_MASK) && lowprot_enabled(env,=
 asc)) {
@@ -414,42 +473,7 @@ nodat:
     /* Convert real address -> absolute address */
     *raddr =3D mmu_real2abs(env, *raddr);
=20
-    if (*raddr < ram_size) {
-        r =3D skeyclass->get_skeys(ss, *raddr / TARGET_PAGE_SIZE, 1, &ke=
y);
-        if (r) {
-            trace_get_skeys_nonzero(r);
-            return 0;
-        }
-
-        switch (rw) {
-        case MMU_DATA_LOAD:
-        case MMU_INST_FETCH:
-            /*
-             * The TLB entry has to remain write-protected on read-fault=
s if
-             * the storage key does not indicate a change already. Other=
wise
-             * we might miss setting the change bit on write accesses.
-             */
-            if (!(key & SK_C)) {
-                *flags &=3D ~PAGE_WRITE;
-            }
-            break;
-        case MMU_DATA_STORE:
-            key |=3D SK_C;
-            break;
-        default:
-            g_assert_not_reached();
-        }
-
-        /* Any store/fetch sets the reference bit */
-        key |=3D SK_R;
-
-        r =3D skeyclass->set_skeys(ss, *raddr / TARGET_PAGE_SIZE, 1, &ke=
y);
-        if (r) {
-            trace_set_skeys_nonzero(r);
-            return 0;
-        }
-    }
-
+    mmu_handle_skey(*raddr, rw, flags);
     return 0;
 }
=20
@@ -567,6 +591,6 @@ int mmu_translate_real(CPUS390XState *env, target_ulo=
ng raddr, int rw,
=20
     *addr =3D mmu_real2abs(env, raddr & TARGET_PAGE_MASK);
=20
-    /* TODO: storage key handling */
+    mmu_handle_skey(*addr, rw, flags);
     return 0;
 }
--=20
2.21.0


