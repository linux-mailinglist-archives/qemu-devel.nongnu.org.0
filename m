Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2943E10D068
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Nov 2019 02:46:07 +0100 (CET)
Received: from localhost ([::1]:54326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iaVME-0005Q6-8x
	for lists+qemu-devel@lfdr.de; Thu, 28 Nov 2019 20:46:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56309)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iaVBn-0002Xj-5j
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 20:35:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iaVBl-0003KF-CB
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 20:35:18 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:32825 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iaVBk-0002u7-Rm; Thu, 28 Nov 2019 20:35:17 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47PHBN1wbdz9sR7; Fri, 29 Nov 2019 12:35:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1574991308;
 bh=kVMG34bg0BfZw8om11xhIz2XVEZNaDRXs7q11jdpRyU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mUEEZXoFdBg6uaXjXASAQhZ8DuDAMMxsKK8hO60JT6W/B1/W7oZ9hCz0lBGeaMO+f
 ODRos4UaEeERnaUN+BP+KDNnUokrpr6qdv5BJoa5+ndk5I2ER2623Zl+GdNz1BQ4Tl
 JFQ1w/ZAbXa/EIFLxw7dYUM+d/8FXXb34wcj2Fp8=
From: David Gibson <david@gibson.dropbear.id.au>
To: groug@kaod.org,
	clg@kaod.org
Subject: [for-5.0 4/4] spapr: Correct clamping of RMA to Node 0 size
Date: Fri, 29 Nov 2019 12:35:04 +1100
Message-Id: <20191129013504.145455-5-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191129013504.145455-1-david@gibson.dropbear.id.au>
References: <20191129013504.145455-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 203.11.71.1
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
Cc: aik@ozlabs.ru, lvivier@redhat.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Real Mode Area (RMA) needs to fit within Node 0 in NUMA configuration=
s.
We use a helper function spapr_node0_size() to calculate this.

But that function doesn't actually get the size of Node 0, it gets the
minimum size of all nodes, ever since b082d65a300 "spapr: Add a helper fo=
r
node0_size calculation".  That was added, apparently, because Node 0 in
qemu's terms might not have corresponded to Node 0 in PAPR terms (i.e. th=
e
node with memory at address 0).

That might not have been the case at the time, but it *is* the case now
that qemu node 0 must have the lowest address, which is the node we need.
So, we can simplify this logic, folding it into spapr_rma_size(), the onl=
y
remaining caller.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 7efd4f2b85..6611f75bdf 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -295,20 +295,6 @@ static void spapr_populate_pa_features(SpaprMachineS=
tate *spapr,
     _FDT((fdt_setprop(fdt, offset, "ibm,pa-features", pa_features, pa_si=
ze)));
 }
=20
-static hwaddr spapr_node0_size(MachineState *machine)
-{
-    if (machine->numa_state->num_nodes) {
-        int i;
-        for (i =3D 0; i < machine->numa_state->num_nodes; ++i) {
-            if (machine->numa_state->nodes[i].node_mem) {
-                return MIN(pow2floor(machine->numa_state->nodes[i].node_=
mem),
-                           machine->ram_size);
-            }
-        }
-    }
-    return machine->ram_size;
-}
-
 static void add_str(GString *s, const gchar *s1)
 {
     g_string_append_len(s, s1, strlen(s1) + 1);
@@ -2668,10 +2654,13 @@ static hwaddr spapr_rma_size(SpaprMachineState *s=
papr, Error **errp)
 {
     MachineState *machine =3D MACHINE(spapr);
     hwaddr rma_size =3D machine->ram_size;
-    hwaddr node0_size =3D spapr_node0_size(machine);
=20
     /* RMA has to fit in the first NUMA node */
-    rma_size =3D MIN(rma_size, node0_size);
+    if (machine->numa_state->num_nodes) {
+        hwaddr node0_size =3D machine->numa_state->nodes[0].node_mem;
+
+        rma_size =3D MIN(rma_size, node0_size);
+    }
=20
     /*
      * VRMA access is via a special 1TiB SLB mapping, so the RMA can
@@ -2688,6 +2677,11 @@ static hwaddr spapr_rma_size(SpaprMachineState *sp=
apr, Error **errp)
         rma_size =3D MIN(rma_size, 16 * GiB);
     }
=20
+    /*
+     * RMA size must be a power of 2
+     */
+    rma_size =3D pow2floor(rma_size);
+
     if (rma_size < (MIN_RMA_SLOF * MiB)) {
         error_setg(errp,
 "pSeries SLOF firmware requires >=3D %ldMiB guest RMA (Real Mode Area)",
--=20
2.23.0


