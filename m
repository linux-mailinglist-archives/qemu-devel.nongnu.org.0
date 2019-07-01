Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D55CE26BF0
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 21:32:04 +0200 (CEST)
Received: from localhost ([127.0.0.1]:50200 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTWy4-00066V-0p
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 15:32:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36603)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1hTWRz-0003FL-M1
	for qemu-devel@nongnu.org; Wed, 22 May 2019 14:58:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1hTWRy-0000Ov-9p
	for qemu-devel@nongnu.org; Wed, 22 May 2019 14:58:55 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:60497 helo=mail.rt-rk.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
	id 1hTWRx-0000Nb-UQ
	for qemu-devel@nongnu.org; Wed, 22 May 2019 14:58:54 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.rt-rk.com (Postfix) with ESMTP id D41181A2160;
	Wed, 22 May 2019 20:58:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
	[10.10.13.43])
	by mail.rt-rk.com (Postfix) with ESMTPSA id AEB7C1A4545;
	Wed, 22 May 2019 20:58:49 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Wed, 22 May 2019 20:58:41 +0200
Message-Id: <1558551522-24147-11-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558551522-24147-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1558551522-24147-1-git-send-email-aleksandar.markovic@rt-rk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PULL v2 10/11] mips: Decide to map PAGE_EXEC in
 map_address
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jakub Jerm=C3=A1=C5=99 <jakub.jermar@kernkonzept.com>

This commit addresses QEMU Bug #1825311:

  mips_cpu_handle_mmu_fault renders all accessed pages executable

It allows finer-grained control over whether the accessed page should
be executable by moving the decision to the underlying map_address
function, which has more information for this.

As a result, pages that have the XI bit set in the TLB and are accessed
for read/write, don't suddenly end up being executable.

Fixes: https://bugs.launchpad.net/qemu/+bug/1825311
Fixes: 2fb58b73746e ('target-mips: add RI and XI fields to TLB entry')

Signed-off-by: Jakub Jerm=C3=A1=C5=99 <jakub.jermar@kernkonzept.com>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-Id: <20190517123533.868479-1-jakub.jermar@kernkonzept.com>
---
 target/mips/helper.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/target/mips/helper.c b/target/mips/helper.c
index 9799f2e..68e44df 100644
--- a/target/mips/helper.c
+++ b/target/mips/helper.c
@@ -43,7 +43,7 @@ int no_mmu_map_address (CPUMIPSState *env, hwaddr *phys=
ical, int *prot,
                         target_ulong address, int rw, int access_type)
 {
     *physical =3D address;
-    *prot =3D PAGE_READ | PAGE_WRITE;
+    *prot =3D PAGE_READ | PAGE_WRITE | PAGE_EXEC;
     return TLBRET_MATCH;
 }
=20
@@ -61,7 +61,7 @@ int fixed_mmu_map_address (CPUMIPSState *env, hwaddr *p=
hysical, int *prot,
     else
         *physical =3D address;
=20
-    *prot =3D PAGE_READ | PAGE_WRITE;
+    *prot =3D PAGE_READ | PAGE_WRITE | PAGE_EXEC;
     return TLBRET_MATCH;
 }
=20
@@ -101,6 +101,9 @@ int r4k_map_address (CPUMIPSState *env, hwaddr *physi=
cal, int *prot,
                 *prot =3D PAGE_READ;
                 if (n ? tlb->D1 : tlb->D0)
                     *prot |=3D PAGE_WRITE;
+                if (!(n ? tlb->XI1 : tlb->XI0)) {
+                    *prot |=3D PAGE_EXEC;
+                }
                 return TLBRET_MATCH;
             }
             return TLBRET_DIRTY;
@@ -182,7 +185,7 @@ static int get_seg_physical_address(CPUMIPSState *env=
, hwaddr *physical,
     } else {
         /* The segment is unmapped */
         *physical =3D physical_base | (real_address & segmask);
-        *prot =3D PAGE_READ | PAGE_WRITE;
+        *prot =3D PAGE_READ | PAGE_WRITE | PAGE_EXEC;
         return TLBRET_MATCH;
     }
 }
@@ -907,7 +910,7 @@ bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, i=
nt size,
     }
     if (ret =3D=3D TLBRET_MATCH) {
         tlb_set_page(cs, address & TARGET_PAGE_MASK,
-                     physical & TARGET_PAGE_MASK, prot | PAGE_EXEC,
+                     physical & TARGET_PAGE_MASK, prot,
                      mmu_idx, TARGET_PAGE_SIZE);
         return true;
     }
@@ -927,7 +930,7 @@ bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, i=
nt size,
                                        access_type, mips_access_type, mm=
u_idx);
             if (ret =3D=3D TLBRET_MATCH) {
                 tlb_set_page(cs, address & TARGET_PAGE_MASK,
-                             physical & TARGET_PAGE_MASK, prot | PAGE_EX=
EC,
+                             physical & TARGET_PAGE_MASK, prot,
                              mmu_idx, TARGET_PAGE_SIZE);
                 return true;
             }
--=20
2.7.4


