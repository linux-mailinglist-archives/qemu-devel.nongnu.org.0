Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E5616B60A
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 00:50:14 +0100 (CET)
Received: from localhost ([::1]:46292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6NUL-0000Mg-Vm
	for lists+qemu-devel@lfdr.de; Mon, 24 Feb 2020 18:50:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47413)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1j6NIm-0007B1-IU
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 18:38:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1j6NIl-0008Hy-8H
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 18:38:16 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:39165)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1j6NIk-00089Z-U7; Mon, 24 Feb 2020 18:38:15 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48RJQ75DNQz9sSc; Tue, 25 Feb 2020 10:37:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1582587455;
 bh=5vj5hZheaPC8JaSv3aSxTYhdCA9hs4iVnlvVk/qgUQc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NUuAk5LZQ26KNU/bVSETT6sgwFWyQTACmGDl8gtSqS2SZerhJTr9HI7C7EaQBQaUJ
 4yXe0APc7s7gMF/dbzeXoT1KYUkhgUO34Yc6X1v63h62syV+Y/MJGVBTSEhnBQvDwF
 gBz60G+lhDjBrsy7+xPgolIwewLH/imyTDpouqEI=
From: David Gibson <david@gibson.dropbear.id.au>
To: groug@kaod.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org, clg@kaod.org
Subject: [PATCH v6 16/18] spapr: Don't clamp RMA to 16GiB on new machine types
Date: Tue, 25 Feb 2020 10:37:22 +1100
Message-Id: <20200224233724.46415-17-david@gibson.dropbear.id.au>
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

In spapr_machine_init() we clamp the size of the RMA to 16GiB and the
comment saying why doesn't make a whole lot of sense.  In fact, this was
done because the real mode handling code elsewhere limited the RMA in TCG
mode to the maximum value configurable in LPCR[RMLS], 16GiB.

But,
 * Actually LPCR[RMLS] has been able to encode a 256GiB size for a very
   long time, we just didn't implement it properly in the softmmu
 * LPCR[RMLS] shouldn't really be relevant anyway, it only was because we
   used to abuse the RMOR based translation mode in order to handle the
   fact that we're not modelling the hypervisor parts of the cpu

We've now removed those limitations in the modelling so the 16GiB clamp n=
o
longer serves a function.  However, we can't just remove the limit
universally: that would break migration to earlier qemu versions, where
the 16GiB RMLS limit still applies, no matter how bad the reasons for it
are.

So, we replace the 16GiB clamp, with a clamp to a limit defined in the
machine type class.  We set it to 16 GiB for machine types 4.2 and earlie=
r,
but set it to 0 meaning unlimited for the new 5.0 machine type.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c         | 13 ++++++++-----
 include/hw/ppc/spapr.h |  1 +
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 4dab489931..6e9f15f64d 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -2702,12 +2702,14 @@ static void spapr_machine_init(MachineState *mach=
ine)
=20
     spapr->rma_size =3D node0_size;
=20
-    /* Actually we don't support unbounded RMA anymore since we added
-     * proper emulation of HV mode. The max we can get is 16G which
-     * also happens to be what we configure for PAPR mode so make sure
-     * we don't do anything bigger than that
+    /*
+     * Clamp the RMA size based on machine type.  This is for
+     * migration compatibility with older qemu versions, which limited
+     * the RMA size for complicated and mostly bad reasons.
      */
-    spapr->rma_size =3D MIN(spapr->rma_size, 0x400000000ull);
+    if (smc->rma_limit) {
+        spapr->rma_size =3D MIN(spapr->rma_size, smc->rma_limit);
+    }
=20
     if (spapr->rma_size > node0_size) {
         error_report("Numa node 0 has to span the RMA (%#08"HWADDR_PRIx"=
)",
@@ -4600,6 +4602,7 @@ static void spapr_machine_4_2_class_options(Machine=
Class *mc)
     compat_props_add(mc->compat_props, hw_compat_4_2, hw_compat_4_2_len)=
;
     smc->default_caps.caps[SPAPR_CAP_CCF_ASSIST] =3D SPAPR_CAP_OFF;
     smc->default_caps.caps[SPAPR_CAP_FWNMI_MCE] =3D SPAPR_CAP_OFF;
+    smc->rma_limit =3D 16 * GiB;
     mc->nvdimm_supported =3D false;
 }
=20
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index fc49c1a710..8a44a1f488 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -126,6 +126,7 @@ struct SpaprMachineClass {
     bool pre_4_1_migration; /* don't migrate hpt-max-page-size */
     bool linux_pci_probe;
     bool smp_threads_vsmt; /* set VSMT to smp_threads by default */
+    hwaddr rma_limit;          /* clamp the RMA to this size */
=20
     void (*phb_placement)(SpaprMachineState *spapr, uint32_t index,
                           uint64_t *buid, hwaddr *pio,=20
--=20
2.24.1


