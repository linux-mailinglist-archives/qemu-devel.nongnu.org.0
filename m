Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E824EA008C
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Aug 2019 13:14:10 +0200 (CEST)
Received: from localhost ([::1]:34902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2vtx-0004pu-VG
	for lists+qemu-devel@lfdr.de; Wed, 28 Aug 2019 07:14:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34717)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1i2vq6-0002Kh-NF
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 07:10:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1i2vq5-00050l-Jm
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 07:10:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:14655)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1i2vq5-0004yk-Bv; Wed, 28 Aug 2019 07:10:09 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A3B93308FC22;
 Wed, 28 Aug 2019 11:10:08 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-117-166.ams2.redhat.com [10.36.117.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 015C319D7A;
 Wed, 28 Aug 2019 11:10:06 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 13:10:03 +0200
Message-Id: <20190828111004.28013-2-david@redhat.com>
In-Reply-To: <20190828111004.28013-1-david@redhat.com>
References: <20190828111004.28013-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Wed, 28 Aug 2019 11:10:08 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v1 1/2] tcg: Make probe_write() return a
 pointer to the host page
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
Cc: Thomas Huth <thuth@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

... similar to tlb_vaddr_to_host(); however, allow access to the host
page except when TLB_NOTDIRTY or TLB_MMIO is set.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 accel/tcg/cputlb.c      | 22 +++++++++++++++++-----
 accel/tcg/user-exec.c   |  6 ++++--
 include/exec/exec-all.h |  4 ++--
 3 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 09fe4cdcc4..2077685da0 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1078,11 +1078,12 @@ tb_page_addr_t get_page_addr_code(CPUArchState *e=
nv, target_ulong addr)
 /* Probe for whether the specified guest write access is permitted.
  * If it is not permitted then an exception will be taken in the same
  * way as if this were a real write access (and we will not return).
- * Otherwise the function will return, and there will be a valid
- * entry in the TLB for this access.
+ * If the access is permitted, returns the host address similar to
+ * tlb_vaddr_to_host(). Returns NULL in case direct access to the host p=
age
+ * is not allowed or if the size is 0.
  */
-void probe_write(CPUArchState *env, target_ulong addr, int size, int mmu=
_idx,
-                 uintptr_t retaddr)
+void *probe_write(CPUArchState *env, target_ulong addr, int size, int mm=
u_idx,
+                  uintptr_t retaddr)
 {
     uintptr_t index =3D tlb_index(env, mmu_idx, addr);
     CPUTLBEntry *entry =3D tlb_entry(env, mmu_idx, addr);
@@ -1101,12 +1102,23 @@ void probe_write(CPUArchState *env, target_ulong =
addr, int size, int mmu_idx,
         tlb_addr =3D tlb_addr_write(entry);
     }
=20
+    if (!size) {
+        return NULL;
+    }
+
     /* Handle watchpoints.  */
-    if ((tlb_addr & TLB_WATCHPOINT) && size > 0) {
+    if (tlb_addr & TLB_WATCHPOINT) {
         cpu_check_watchpoint(env_cpu(env), addr, size,
                              env_tlb(env)->d[mmu_idx].iotlb[index].attrs=
,
                              BP_MEM_WRITE, retaddr);
     }
+
+    if (tlb_addr & (TLB_NOTDIRTY | TLB_MMIO)) {
+        /* IO access */
+        return NULL;
+    }
+
+    return (void *)((uintptr_t)addr + entry->addend);
 }
=20
 void *tlb_vaddr_to_host(CPUArchState *env, abi_ptr addr,
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index b25a342eaa..420184571f 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -188,8 +188,8 @@ static inline int handle_cpu_signal(uintptr_t pc, sig=
info_t *info,
     g_assert_not_reached();
 }
=20
-void probe_write(CPUArchState *env, target_ulong addr, int size, int mmu=
_idx,
-                 uintptr_t retaddr)
+void *probe_write(CPUArchState *env, target_ulong addr, int size, int mm=
u_idx,
+                  uintptr_t retaddr)
 {
     CPUState *cpu =3D env_cpu(env);
     CPUClass *cc;
@@ -203,6 +203,8 @@ void probe_write(CPUArchState *env, target_ulong addr=
, int size, int mmu_idx,
                      retaddr);
         g_assert_not_reached();
     }
+
+    return size ? g2h(addr) : NULL;
 }
=20
 #if defined(__i386__)
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index cbcc85add3..a7893ed16b 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -310,8 +310,8 @@ static inline void tlb_flush_by_mmuidx_all_cpus_synce=
d(CPUState *cpu,
 {
 }
 #endif
-void probe_write(CPUArchState *env, target_ulong addr, int size, int mmu=
_idx,
-                 uintptr_t retaddr);
+void *probe_write(CPUArchState *env, target_ulong addr, int size, int mm=
u_idx,
+                  uintptr_t retaddr);
=20
 #define CODE_GEN_ALIGN           16 /* must be >=3D of the size of a ica=
che line */
=20
--=20
2.21.0


