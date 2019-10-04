Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A68ACB872
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Oct 2019 12:37:29 +0200 (CEST)
Received: from localhost ([::1]:45838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGKxj-0008Og-Qi
	for lists+qemu-devel@lfdr.de; Fri, 04 Oct 2019 06:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53697)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iGK3c-0006Ro-0f
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 05:39:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iGK3a-0006T6-Hj
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 05:39:27 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:42145 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iGK3a-00069F-6H; Fri, 04 Oct 2019 05:39:26 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46l4YS4VyJz9sSY; Fri,  4 Oct 2019 19:38:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1570181884;
 bh=cy9gyLqDPGUtk2o5RpCfwdiKF45fFSPX8h9YpV09mio=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cnKDtOacoFNp35np86GNg3aTV2XSDbHX0O15zz8fqqkYpuiSiLICc6vrPmkzsAjMA
 3c3J2gRY+ZltBDUpLrWsXATfpqyEsOYOsov2V6AplA7oWUpyt9KgQYnLq/tFK0YSUe
 iTWHHMM/WqFKNHOBhK1iaaQNSNOZf8bMUacHCeuM=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 49/53] xive: Improve irq claim/free path
Date: Fri,  4 Oct 2019 19:37:43 +1000
Message-Id: <20191004093747.31350-50-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191004093747.31350-1-david@gibson.dropbear.id.au>
References: <20191004093747.31350-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: lvivier@redhat.com, aik@ozlabs.ru, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

spapr_xive_irq_claim() returns a bool to indicate if it succeeded.
But most of the callers and one callee use int return values and/or an
Error * with more information instead.  In any case, ints are a more
common idiom for success/failure states than bools (one never knows
what sense they'll be in).

So instead change to an int return value to indicate presence of error
+ an Error * to describe the details through that call chain.

It also didn't actually check if the irq was already claimed, which is
one of the primary purposes of the claim path, so do that.

spapr_xive_irq_free() also returned a bool... which no callers checked
and was always true, so just drop it.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 hw/intc/spapr_xive.c        | 20 +++++++++-----------
 hw/intc/spapr_xive_kvm.c    |  8 ++++----
 hw/ppc/spapr_irq.c          | 11 +++++------
 include/hw/ppc/spapr_xive.h |  4 ++--
 include/hw/ppc/xive.h       |  2 +-
 5 files changed, 21 insertions(+), 24 deletions(-)

diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
index 47b5ec0b56..04879abf2e 100644
--- a/hw/intc/spapr_xive.c
+++ b/hw/intc/spapr_xive.c
@@ -528,12 +528,17 @@ static void spapr_xive_register_types(void)
=20
 type_init(spapr_xive_register_types)
=20
-bool spapr_xive_irq_claim(SpaprXive *xive, uint32_t lisn, bool lsi)
+int spapr_xive_irq_claim(SpaprXive *xive, int lisn, bool lsi, Error **er=
rp)
 {
     XiveSource *xsrc =3D &xive->source;
=20
     assert(lisn < xive->nr_irqs);
=20
+    if (xive_eas_is_valid(&xive->eat[lisn])) {
+        error_setg(errp, "IRQ %d is not free", lisn);
+        return -EBUSY;
+    }
+
     /*
      * Set default values when allocating an IRQ number
      */
@@ -543,24 +548,17 @@ bool spapr_xive_irq_claim(SpaprXive *xive, uint32_t=
 lisn, bool lsi)
     }
=20
     if (kvm_irqchip_in_kernel()) {
-        Error *local_err =3D NULL;
-
-        kvmppc_xive_source_reset_one(xsrc, lisn, &local_err);
-        if (local_err) {
-            error_report_err(local_err);
-            return false;
-        }
+        return kvmppc_xive_source_reset_one(xsrc, lisn, errp);
     }
=20
-    return true;
+    return 0;
 }
=20
-bool spapr_xive_irq_free(SpaprXive *xive, uint32_t lisn)
+void spapr_xive_irq_free(SpaprXive *xive, int lisn)
 {
     assert(lisn < xive->nr_irqs);
=20
     xive->eat[lisn].w &=3D cpu_to_be64(~EAS_VALID);
-    return true;
 }
=20
 /*
diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
index 2006f96aec..51b334b676 100644
--- a/hw/intc/spapr_xive_kvm.c
+++ b/hw/intc/spapr_xive_kvm.c
@@ -232,14 +232,14 @@ void kvmppc_xive_sync_source(SpaprXive *xive, uint3=
2_t lisn, Error **errp)
  * only need to inform the KVM XIVE device about their type: LSI or
  * MSI.
  */
-void kvmppc_xive_source_reset_one(XiveSource *xsrc, int srcno, Error **e=
rrp)
+int kvmppc_xive_source_reset_one(XiveSource *xsrc, int srcno, Error **er=
rp)
 {
     SpaprXive *xive =3D SPAPR_XIVE(xsrc->xive);
     uint64_t state =3D 0;
=20
     /* The KVM XIVE device is not in use */
     if (xive->fd =3D=3D -1) {
-        return;
+        return -ENODEV;
     }
=20
     if (xive_source_irq_is_lsi(xsrc, srcno)) {
@@ -249,8 +249,8 @@ void kvmppc_xive_source_reset_one(XiveSource *xsrc, i=
nt srcno, Error **errp)
         }
     }
=20
-    kvm_device_access(xive->fd, KVM_DEV_XIVE_GRP_SOURCE, srcno, &state,
-                      true, errp);
+    return kvm_device_access(xive->fd, KVM_DEV_XIVE_GRP_SOURCE, srcno, &=
state,
+                             true, errp);
 }
=20
 static void kvmppc_xive_source_reset(XiveSource *xsrc, Error **errp)
diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
index 025c802e7b..516bf00a35 100644
--- a/hw/ppc/spapr_irq.c
+++ b/hw/ppc/spapr_irq.c
@@ -246,7 +246,10 @@ static void spapr_irq_init_xive(SpaprMachineState *s=
papr, Error **errp)
=20
     /* Enable the CPU IPIs */
     for (i =3D 0; i < nr_servers; ++i) {
-        spapr_xive_irq_claim(spapr->xive, SPAPR_IRQ_IPI + i, false);
+        if (spapr_xive_irq_claim(spapr->xive, SPAPR_IRQ_IPI + i,
+                                 false, errp) < 0) {
+            return;
+        }
     }
=20
     spapr_xive_hcall_init(spapr);
@@ -255,11 +258,7 @@ static void spapr_irq_init_xive(SpaprMachineState *s=
papr, Error **errp)
 static int spapr_irq_claim_xive(SpaprMachineState *spapr, int irq, bool =
lsi,
                                 Error **errp)
 {
-    if (!spapr_xive_irq_claim(spapr->xive, irq, lsi)) {
-        error_setg(errp, "IRQ %d is invalid", irq);
-        return -1;
-    }
-    return 0;
+    return spapr_xive_irq_claim(spapr->xive, irq, lsi, errp);
 }
=20
 static void spapr_irq_free_xive(SpaprMachineState *spapr, int irq)
diff --git a/include/hw/ppc/spapr_xive.h b/include/hw/ppc/spapr_xive.h
index bfd40f01d8..0df20a6590 100644
--- a/include/hw/ppc/spapr_xive.h
+++ b/include/hw/ppc/spapr_xive.h
@@ -54,8 +54,8 @@ typedef struct SpaprXive {
  */
 #define SPAPR_XIVE_BLOCK_ID 0x0
=20
-bool spapr_xive_irq_claim(SpaprXive *xive, uint32_t lisn, bool lsi);
-bool spapr_xive_irq_free(SpaprXive *xive, uint32_t lisn);
+int spapr_xive_irq_claim(SpaprXive *xive, int lisn, bool lsi, Error **er=
rp);
+void spapr_xive_irq_free(SpaprXive *xive, int lisn);
 void spapr_xive_pic_print_info(SpaprXive *xive, Monitor *mon);
 int spapr_xive_post_load(SpaprXive *xive, int version_id);
=20
diff --git a/include/hw/ppc/xive.h b/include/hw/ppc/xive.h
index 6d38755f84..fd3319bd32 100644
--- a/include/hw/ppc/xive.h
+++ b/include/hw/ppc/xive.h
@@ -425,7 +425,7 @@ static inline uint32_t xive_nvt_cam_line(uint8_t nvt_=
blk, uint32_t nvt_idx)
  * KVM XIVE device helpers
  */
=20
-void kvmppc_xive_source_reset_one(XiveSource *xsrc, int srcno, Error **e=
rrp);
+int kvmppc_xive_source_reset_one(XiveSource *xsrc, int srcno, Error **er=
rp);
 void kvmppc_xive_source_set_irq(void *opaque, int srcno, int val);
 void kvmppc_xive_cpu_connect(XiveTCTX *tctx, Error **errp);
 void kvmppc_xive_cpu_synchronize_state(XiveTCTX *tctx, Error **errp);
--=20
2.21.0


