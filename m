Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5580C19D888
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Apr 2020 16:03:05 +0200 (CEST)
Received: from localhost ([::1]:55890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jKMuW-00086f-CC
	for lists+qemu-devel@lfdr.de; Fri, 03 Apr 2020 10:03:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38032)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1jKMss-0006YJ-Su
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 10:01:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1jKMsr-000872-Op
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 10:01:22 -0400
Received: from 19.mo4.mail-out.ovh.net ([87.98.179.66]:48153)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1jKMsr-00081x-HQ
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 10:01:21 -0400
Received: from player697.ha.ovh.net (unknown [10.110.103.195])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id EA88922B6AB
 for <qemu-devel@nongnu.org>; Fri,  3 Apr 2020 16:01:19 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player697.ha.ovh.net (Postfix) with ESMTPSA id 949B5111A0182;
 Fri,  3 Apr 2020 14:01:11 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH v4 2/4] target/ppc: Extend ppc_radix64_check_prot() with a
 'partition_scoped' bool
Date: Fri,  3 Apr 2020 16:00:54 +0200
Message-Id: <20200403140056.59465-3-clg@kaod.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200403140056.59465-1-clg@kaod.org>
References: <20200403140056.59465-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 4733001735560203238
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrtdeigdejudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrieeljedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 87.98.179.66
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, Suraj Jitindar Singh <sjitindarsingh@gmail.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This prepares ground for partition-scoped Radix translation.

Signed-off-by: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 target/ppc/mmu-radix64.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index 4b0d0ff50a3c..11b3c6d48c65 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -105,7 +105,8 @@ static void ppc_radix64_raise_si(PowerPCCPU *cpu, int=
 rwx, vaddr eaddr,
=20
=20
 static bool ppc_radix64_check_prot(PowerPCCPU *cpu, int rwx, uint64_t pt=
e,
-                                   int *fault_cause, int *prot)
+                                   int *fault_cause, int *prot,
+                                   bool partition_scoped)
 {
     CPUPPCState *env =3D &cpu->env;
     const int need_prot[] =3D { PAGE_READ, PAGE_WRITE, PAGE_EXEC };
@@ -121,11 +122,11 @@ static bool ppc_radix64_check_prot(PowerPCCPU *cpu,=
 int rwx, uint64_t pte,
     }
=20
     /* Determine permissions allowed by Encoded Access Authority */
-    if ((pte & R_PTE_EAA_PRIV) && msr_pr) { /* Insufficient Privilege */
+    if (!partition_scoped && (pte & R_PTE_EAA_PRIV) && msr_pr) {
         *prot =3D 0;
-    } else if (msr_pr || (pte & R_PTE_EAA_PRIV)) {
+    } else if (msr_pr || (pte & R_PTE_EAA_PRIV) || partition_scoped) {
         *prot =3D ppc_radix64_get_prot_eaa(pte);
-    } else { /* !msr_pr && !(pte & R_PTE_EAA_PRIV) */
+    } else { /* !msr_pr && !(pte & R_PTE_EAA_PRIV) && !partition_scoped =
*/
         *prot =3D ppc_radix64_get_prot_eaa(pte);
         *prot &=3D ppc_radix64_get_prot_amr(cpu); /* Least combined perm=
issions */
     }
@@ -250,7 +251,7 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCP=
U *cpu, int rwx,
                                 g_raddr, g_page_size, &fault_cause, &pte=
_addr);
=20
     if (!(pte & R_PTE_VALID) ||
-        ppc_radix64_check_prot(cpu, rwx, pte, &fault_cause, g_prot)) {
+        ppc_radix64_check_prot(cpu, rwx, pte, &fault_cause, g_prot, fals=
e)) {
         /* No valid pte or access denied due to protection */
         if (cause_excp) {
             ppc_radix64_raise_si(cpu, rwx, eaddr, fault_cause);
--=20
2.25.1


