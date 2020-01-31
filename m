Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B6F14E8A9
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 07:13:51 +0100 (CET)
Received: from localhost ([::1]:48746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixPYs-0005sU-K2
	for lists+qemu-devel@lfdr.de; Fri, 31 Jan 2020 01:13:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59390)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1ixPUy-0006ug-Gd
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 01:09:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1ixPUx-0000ZG-4F
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 01:09:48 -0500
Received: from ozlabs.org ([203.11.71.1]:59227)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1ixPUw-0000WJ-OR; Fri, 31 Jan 2020 01:09:47 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4886Hv3Mzgz9sSg; Fri, 31 Jan 2020 17:09:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1580450971;
 bh=fKPavTsxkuQdbNDZU0BEGGp8qbruBMk+OGeYF/Wc2+Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kGdE1Cw52xyAOEyObZFNTW02x4SjNxmYlqi087KRXJ0scY6Pd9m9oW+3xsgXtpWsU
 FJksaAvBS9sBiHdkpmPfMJkHJcrWEITnpvRIQAhCqNiFEoHJkDHPmSHTf7OLkEQEOP
 laeNU2VRG8HFi0AOtB150zej3RgKb2aM/LcVLcWg=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 22/34] spapr: Enable DD2.3 accelerated count cache flush in
 pseries-5.0 machine
Date: Fri, 31 Jan 2020 17:09:12 +1100
Message-Id: <20200131060924.147449-23-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200131060924.147449-1-david@gibson.dropbear.id.au>
References: <20200131060924.147449-1-david@gibson.dropbear.id.au>
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
Cc: lvivier@redhat.com, David Gibson <david@gibson.dropbear.id.au>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For POWER9 DD2.2 cpus, the best current Spectre v2 indirect branch
mitigation is "count cache disabled", which is configured with:
    -machine cap-ibs=3Dfixed-ccd
However, this option isn't available on DD2.3 CPUs with KVM, because they
don't have the count cache disabled.

For POWER9 DD2.3 cpus, it is "count cache flush with assist", configured
with:
    -machine cap-ibs=3Dworkaround,cap-ccf-assist=3Don
However this option isn't available on DD2.2 CPUs with KVM, because they
don't have the special CCF assist instruction this relies on.

On current machine types, we default to "count cache flush w/o assist",
that is:
    -machine cap-ibs=3Dworkaround,cap-ccf-assist=3Doff
This runs, with mitigation on both DD2.2 and DD2.3 host cpus, but has a
fairly significant performance impact.

It turns out we can do better.  The special instruction that CCF assist
uses to trigger a count cache flush is a no-op on earlier CPUs, rather th=
an
trapping or causing other badness.  It doesn't, of itself, implement the
mitigation, but *if* we have count-cache-disabled, then the count cache
flush is unnecessary, and so using the count cache flush mitigation is
harmless.

Therefore for the new pseries-5.0 machine type, enable cap-ccf-assist by
default.  Along with that, suppress throwing an error if cap-ccf-assist
is selected but KVM doesn't support it, as long as KVM *is* giving us
count-cache-disabled.  To allow TCG to work out of the box, even though i=
t
doesn't implement the ccf flush assist, downgrade the error in that case =
to
a warning.  This matches several Spectre mitigations where we allow TCG
to operate for debugging, since we don't really make guarantees about TCG
security properties anyway.

While we're there, make the TCG warning for this case match that for othe=
r
mitigations.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c      |  5 ++++-
 hw/ppc/spapr_caps.c | 21 +++++++++++++++++----
 2 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index a0076e5fbd..fe8266a1d1 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4397,7 +4397,7 @@ static void spapr_machine_class_init(ObjectClass *o=
c, void *data)
     smc->default_caps.caps[SPAPR_CAP_HPT_MAXPAGESIZE] =3D 16; /* 64kiB *=
/
     smc->default_caps.caps[SPAPR_CAP_NESTED_KVM_HV] =3D SPAPR_CAP_OFF;
     smc->default_caps.caps[SPAPR_CAP_LARGE_DECREMENTER] =3D SPAPR_CAP_ON=
;
-    smc->default_caps.caps[SPAPR_CAP_CCF_ASSIST] =3D SPAPR_CAP_OFF;
+    smc->default_caps.caps[SPAPR_CAP_CCF_ASSIST] =3D SPAPR_CAP_ON;
     spapr_caps_add_properties(smc, &error_abort);
     smc->irq =3D &spapr_irq_dual;
     smc->dr_phb_enabled =3D true;
@@ -4465,8 +4465,11 @@ DEFINE_SPAPR_MACHINE(5_0, "5.0", true);
  */
 static void spapr_machine_4_2_class_options(MachineClass *mc)
 {
+    SpaprMachineClass *smc =3D SPAPR_MACHINE_CLASS(mc);
+
     spapr_machine_5_0_class_options(mc);
     compat_props_add(mc->compat_props, hw_compat_4_2, hw_compat_4_2_len)=
;
+    smc->default_caps.caps[SPAPR_CAP_CCF_ASSIST] =3D SPAPR_CAP_OFF;
 }
=20
 DEFINE_SPAPR_MACHINE(4_2, "4.2", false);
diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
index 481dfd2a27..7f933a98ed 100644
--- a/hw/ppc/spapr_caps.c
+++ b/hw/ppc/spapr_caps.c
@@ -485,11 +485,24 @@ static void cap_ccf_assist_apply(SpaprMachineState =
*spapr, uint8_t val,
     uint8_t kvm_val =3D kvmppc_get_cap_count_cache_flush_assist();
=20
     if (tcg_enabled() && val) {
-        /* TODO - for now only allow broken for TCG */
-        error_setg(errp,
-"Requested count cache flush assist capability level not supported by tc=
g,"
-                   " try appending -machine cap-ccf-assist=3Doff");
+        /* TCG doesn't implement anything here, but allow with a warning=
 */
+        warn_report("TCG doesn't support requested feature, cap-ccf-assi=
st=3Don");
     } else if (kvm_enabled() && (val > kvm_val)) {
+        uint8_t kvm_ibs =3D kvmppc_get_cap_safe_indirect_branch();
+
+        if (kvm_ibs =3D=3D SPAPR_CAP_FIXED_CCD) {
+            /*
+             * If we don't have CCF assist on the host, the assist
+             * instruction is a harmless no-op.  It won't correctly
+             * implement the cache count flush *but* if we have
+             * count-cache-disabled in the host, that flush is
+             * unnnecessary.  So, specifically allow this case.  This
+             * allows us to have better performance on POWER9 DD2.3,
+             * while still working on POWER9 DD2.2 and POWER8 host
+             * cpus.
+             */
+            return;
+        }
         error_setg(errp,
 "Requested count cache flush assist capability level not supported by kv=
m,"
                    " try appending -machine cap-ccf-assist=3Doff");
--=20
2.24.1


