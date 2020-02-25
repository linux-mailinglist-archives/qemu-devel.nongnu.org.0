Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D1316B5FA
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 00:45:57 +0100 (CET)
Received: from localhost ([::1]:46244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6NQC-0004vN-OX
	for lists+qemu-devel@lfdr.de; Mon, 24 Feb 2020 18:45:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47347)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1j6NIT-0006g9-Hw
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 18:38:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1j6NIQ-0008BJ-QN
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 18:37:57 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:40869)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1j6NIQ-00086w-6n; Mon, 24 Feb 2020 18:37:54 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48RJQ510Gkz9sSR; Tue, 25 Feb 2020 10:37:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1582587453;
 bh=QIIJTxC1CVum2uJ2TEw+qN4tR/LbdQA/xEU74HqkcYg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CMX3rpK7a77iV2wIdQZRB3hp5tqqkqESkeW4ttuvaHytZKmdHiLzMofwsa+65XU84
 gYZ6hevLoRXTHQA6dNaH1+S3PiqWJnLzrbwBeuBnx66b++0b0t0rLhtmceMPT5KZIR
 E+kgDi43Bubi1wcehfzyFwRCyUpzrkUGHeaWK00w=
From: David Gibson <david@gibson.dropbear.id.au>
To: groug@kaod.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org, clg@kaod.org
Subject: [PATCH v6 15/18] spapr: Don't attempt to clamp RMA to VRMA constraint
Date: Tue, 25 Feb 2020 10:37:21 +1100
Message-Id: <20200224233724.46415-16-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200224233724.46415-1-david@gibson.dropbear.id.au>
References: <20200224233724.46415-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
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
Cc: lvivier@redhat.com, Thomas Huth <thuth@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, aik@ozlabs.ru, farosas@linux.ibm.com,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Igor Mammedov <imammedo@redhat.com>, paulus@samba.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Real Mode Area (RMA) is the part of memory which a guest can access
when in real (MMU off) mode.  Of course, for a guest under KVM, the MMU
isn't really turned off, it's just in a special translation mode - Virtua=
l
Real Mode Area (VRMA) - which looks like real mode in guest mode.

The mechanics of how this works when using the hash MMU (HPT) put a
constraint on the size of the RMA, which depends on the size of the
HPT.  So, the latter part of spapr_setup_hpt_and_vrma() clamps the RMA
we advertise to the guest based on this VRMA limit.

There are several things wrong with this:
 1) spapr_setup_hpt_and_vrma() doesn't actually clamp, it takes the minim=
um
    of Node 0 memory size and the VRMA limit.  That will *often* work the
    same as clamping, but there can be other constraints on RMA size whic=
h
    supersede Node 0 memory size.  We have real bugs caused by this
    (currently worked around in the guest kernel)
 2) Some callers of spapr_setup_hpt_and_vrma() are in a situation where
    we're past the point that we can actually advertise an RMA limit to t=
he
    guest
 3) But most fundamentally, the VRMA limit depends on host configuration
    (page size) which shouldn't be visible to the guest, but this partial=
ly
    exposes it.  This can cause problems with migration in certain edge
    cases, although we will mostly get away with it.

In practice, this clamping is almost never applied anyway.  With 64kiB
pages and the normal rules for sizing of the HPT, the theoretical VRMA
limit will be 4x(guest memory size) and so never hit.  It will hit with
4kiB pages, where it will be (guest memory size)/4.  However all mainstre=
am
distro kernels for POWER have used a 64kiB page size for at least 10 year=
s.

So, simply replace this logic with a check that the RMA we've calculated
based only on guest visible configuration will fit within the host implie=
d
VRMA limit.  This can break if running HPT guests on a host kernel with
4kiB page size.  As noted that's very rare.  There also exist several
possible workarounds:
  * Change the host kernel to use 64kiB pages
  * Use radix MMU (RPT) guests instead of HPT
  * Use 64kiB hugepages on the host to back guest memory
  * Increase the guest memory size so that the RMA hits one of the fixed
    limits before the RMA limit.  This is relatively easy on POWER8 which
    has a 16GiB limit, harder on POWER9 which has a 1TiB limit.
  * Use a guest NUMA configuration which artificially constrains the RMA
    within the VRMA limit (the RMA must always fit within Node 0).

Previously, on KVM, we also temporarily reduced the rma_size to 256M so
that the we'd load the kernel and initrd safely, regardless of the VRMA
limit.  This was a) confusing, b) could significantly limit the size of
images we could load and c) introduced a behavioural difference between
KVM and TCG.  So we remove that as well.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 hw/ppc/spapr.c         | 28 ++++++++++------------------
 hw/ppc/spapr_hcall.c   |  4 ++--
 include/hw/ppc/spapr.h |  3 +--
 3 files changed, 13 insertions(+), 22 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index b68d80ba69..4dab489931 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1569,7 +1569,7 @@ void spapr_reallocate_hpt(SpaprMachineState *spapr,=
 int shift,
     spapr_set_all_lpcrs(0, LPCR_HR | LPCR_UPRT);
 }
=20
-void spapr_setup_hpt_and_vrma(SpaprMachineState *spapr)
+void spapr_setup_hpt(SpaprMachineState *spapr)
 {
     int hpt_shift;
=20
@@ -1585,10 +1585,16 @@ void spapr_setup_hpt_and_vrma(SpaprMachineState *=
spapr)
     }
     spapr_reallocate_hpt(spapr, hpt_shift, &error_fatal);
=20
-    if (spapr->vrma_adjust) {
+    if (kvm_enabled()) {
         hwaddr vrma_limit =3D kvmppc_vrma_limit(spapr->htab_shift);
=20
-        spapr->rma_size =3D MIN(spapr_node0_size(MACHINE(spapr)), vrma_l=
imit);
+        /* Check our RMA fits in the possible VRMA */
+        if (vrma_limit < spapr->rma_size) {
+            error_report("Unable to create %" HWADDR_PRIu
+                         "MiB RMA (VRMA only allows %" HWADDR_PRIu "MiB"=
,
+                         spapr->rma_size / MiB, vrma_limit / MiB);
+            exit(EXIT_FAILURE);
+        }
     }
 }
=20
@@ -1628,7 +1634,7 @@ static void spapr_machine_reset(MachineState *machi=
ne)
         spapr->patb_entry =3D PATE1_GR;
         spapr_set_all_lpcrs(LPCR_HR | LPCR_UPRT, LPCR_HR | LPCR_UPRT);
     } else {
-        spapr_setup_hpt_and_vrma(spapr);
+        spapr_setup_hpt(spapr);
     }
=20
     qemu_devices_reset();
@@ -2696,20 +2702,6 @@ static void spapr_machine_init(MachineState *machi=
ne)
=20
     spapr->rma_size =3D node0_size;
=20
-    /* With KVM, we don't actually know whether KVM supports an
-     * unbounded RMA (PR KVM) or is limited by the hash table size
-     * (HV KVM using VRMA), so we always assume the latter
-     *
-     * In that case, we also limit the initial allocations for RTAS
-     * etc... to 256M since we have no way to know what the VRMA size
-     * is going to be as it depends on the size of the hash table
-     * which isn't determined yet.
-     */
-    if (kvm_enabled()) {
-        spapr->vrma_adjust =3D 1;
-        spapr->rma_size =3D MIN(spapr->rma_size, 0x10000000);
-    }
-
     /* Actually we don't support unbounded RMA anymore since we added
      * proper emulation of HV mode. The max we can get is 16G which
      * also happens to be what we configure for PAPR mode so make sure
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 6db3dbde9c..11e8a4f153 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1458,7 +1458,7 @@ static void spapr_check_setup_free_hpt(SpaprMachine=
State *spapr,
         spapr_free_hpt(spapr);
     } else if (!(patbe_new & PATE1_GR)) {
         /* RADIX->HASH || NOTHING->HASH : Allocate HPT */
-        spapr_setup_hpt_and_vrma(spapr);
+        spapr_setup_hpt(spapr);
     }
     return;
 }
@@ -1846,7 +1846,7 @@ static target_ulong h_client_architecture_support(P=
owerPCCPU *cpu,
          * (because the guest isn't going to use radix) then set it up h=
ere. */
         if ((spapr->patb_entry & PATE1_GR) && !guest_radix) {
             /* legacy hash or new hash: */
-            spapr_setup_hpt_and_vrma(spapr);
+            spapr_setup_hpt(spapr);
         }
=20
         if (fdt_bufsize < sizeof(hdr)) {
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index 09110961a5..fc49c1a710 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -156,7 +156,6 @@ struct SpaprMachineState {
     SpaprPendingHpt *pending_hpt; /* in-progress resize */
=20
     hwaddr rma_size;
-    int vrma_adjust;
     uint32_t fdt_size;
     uint32_t fdt_initial_size;
     void *fdt_blob;
@@ -795,7 +794,7 @@ void *spapr_build_fdt(SpaprMachineState *spapr, bool =
reset, size_t space);
 void spapr_events_init(SpaprMachineState *sm);
 void spapr_dt_events(SpaprMachineState *sm, void *fdt);
 void close_htab_fd(SpaprMachineState *spapr);
-void spapr_setup_hpt_and_vrma(SpaprMachineState *spapr);
+void spapr_setup_hpt(SpaprMachineState *spapr);
 void spapr_free_hpt(SpaprMachineState *spapr);
 SpaprTceTable *spapr_tce_new_table(DeviceState *owner, uint32_t liobn);
 void spapr_tce_table_enable(SpaprTceTable *tcet,
--=20
2.24.1


