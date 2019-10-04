Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 887D6CB80B
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Oct 2019 12:17:56 +0200 (CEST)
Received: from localhost ([::1]:44848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGKep-0003RL-5K
	for lists+qemu-devel@lfdr.de; Fri, 04 Oct 2019 06:17:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53147)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iGK35-0005hP-Sv
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 05:38:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iGK34-0005y0-1x
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 05:38:55 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:46677 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iGK33-0005Ug-LD; Fri, 04 Oct 2019 05:38:53 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46l4YN4W7zz9sSG; Fri,  4 Oct 2019 19:38:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1570181880;
 bh=lUi1h7mkfdblyuP4UD186bZ+KRfIT8I60hvDArNEODU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=j8L2YP3kiWLs7zkIN3YTAF9tEimX2dbfZRNS0euZs8cjP6kPW/41c1L62BQWzo3l0
 a39v+TtZiu/nXeL4KTVqv2qSIzanNK5Pf9yLWZNS2JskblfHvI3J1mox3ye2mO0xjU
 1TPRwYVXSPQHsciMEKMnISxCOA2JFCDC3GdaIky0=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 34/53] xics: Eliminate 'reject', 'resend' and 'eoi' class hooks
Date: Fri,  4 Oct 2019 19:37:28 +1000
Message-Id: <20191004093747.31350-35-david@gibson.dropbear.id.au>
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

Currently ics_reject(), ics_resend() and ics_eoi() indirect through
class methods.  But there's only one implementation of each method,
the one in TYPE_ICS_SIMPLE.  TYPE_ICS_BASE has no implementation, but
it's never instantiated, and has no other subtypes.

So clean up by eliminating the method and just having ics_reject(),
ics_resend() and ics_eoi() contain the logic directly.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 hw/intc/trace-events  |  4 ++--
 hw/intc/xics.c        | 54 +++++++++++--------------------------------
 include/hw/ppc/xics.h |  4 ----
 3 files changed, 15 insertions(+), 47 deletions(-)

diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 719f46b516..fdc716c2cc 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -70,8 +70,8 @@ xics_ics_simple_set_irq_msi(int srcno, int nr) "set_irq=
_msi: srcno %d [irq 0x%x]
 xics_masked_pending(void) "set_irq_msi: masked pending"
 xics_ics_simple_set_irq_lsi(int srcno, int nr) "set_irq_lsi: srcno %d [i=
rq 0x%x]"
 xics_ics_simple_write_xive(int nr, int srcno, int server, uint8_t priori=
ty) "ics_write_xive: irq 0x%x [src %d] server 0x%x prio 0x%x"
-xics_ics_simple_reject(int nr, int srcno) "reject irq 0x%x [src %d]"
-xics_ics_simple_eoi(int nr) "ics_eoi: irq 0x%x"
+xics_ics_reject(int nr, int srcno) "reject irq 0x%x [src %d]"
+xics_ics_eoi(int nr) "ics_eoi: irq 0x%x"
=20
 # s390_flic_kvm.c
 flic_create_device(int err) "flic: create device failed %d"
diff --git a/hw/intc/xics.c b/hw/intc/xics.c
index b2fca2975c..93139b0189 100644
--- a/hw/intc/xics.c
+++ b/hw/intc/xics.c
@@ -98,32 +98,8 @@ void ics_pic_print_info(ICSState *ics, Monitor *mon)
 #define XISR(icp)   (((icp)->xirr) & XISR_MASK)
 #define CPPR(icp)   (((icp)->xirr) >> 24)
=20
-static void ics_reject(ICSState *ics, uint32_t nr)
-{
-    ICSStateClass *k =3D ICS_BASE_GET_CLASS(ics);
-
-    if (k->reject) {
-        k->reject(ics, nr);
-    }
-}
-
-void ics_resend(ICSState *ics)
-{
-    ICSStateClass *k =3D ICS_BASE_GET_CLASS(ics);
-
-    if (k->resend) {
-        k->resend(ics);
-    }
-}
-
-static void ics_eoi(ICSState *ics, int nr)
-{
-    ICSStateClass *k =3D ICS_BASE_GET_CLASS(ics);
-
-    if (k->eoi) {
-        k->eoi(ics, nr);
-    }
-}
+static void ics_reject(ICSState *ics, uint32_t nr);
+static void ics_eoi(ICSState *ics, uint32_t nr);
=20
 static void icp_check_ipi(ICPState *icp)
 {
@@ -427,7 +403,7 @@ Object *icp_create(Object *cpu, const char *type, XIC=
SFabric *xi, Error **errp)
 /*
  * ICS: Source layer
  */
-static void ics_simple_resend_msi(ICSState *ics, int srcno)
+static void ics_resend_msi(ICSState *ics, int srcno)
 {
     ICSIRQState *irq =3D ics->irqs + srcno;
=20
@@ -440,7 +416,7 @@ static void ics_simple_resend_msi(ICSState *ics, int =
srcno)
     }
 }
=20
-static void ics_simple_resend_lsi(ICSState *ics, int srcno)
+static void ics_resend_lsi(ICSState *ics, int srcno)
 {
     ICSIRQState *irq =3D ics->irqs + srcno;
=20
@@ -478,7 +454,7 @@ static void ics_simple_set_irq_lsi(ICSState *ics, int=
 srcno, int val)
     } else {
         irq->status &=3D ~XICS_STATUS_ASSERTED;
     }
-    ics_simple_resend_lsi(ics, srcno);
+    ics_resend_lsi(ics, srcno);
 }
=20
 void ics_simple_set_irq(void *opaque, int srcno, int val)
@@ -512,7 +488,7 @@ static void ics_simple_write_xive_msi(ICSState *ics, =
int srcno)
=20
 static void ics_simple_write_xive_lsi(ICSState *ics, int srcno)
 {
-    ics_simple_resend_lsi(ics, srcno);
+    ics_resend_lsi(ics, srcno);
 }
=20
 void ics_simple_write_xive(ICSState *ics, int srcno, int server,
@@ -534,11 +510,11 @@ void ics_simple_write_xive(ICSState *ics, int srcno=
, int server,
     }
 }
=20
-static void ics_simple_reject(ICSState *ics, uint32_t nr)
+static void ics_reject(ICSState *ics, uint32_t nr)
 {
     ICSIRQState *irq =3D ics->irqs + nr - ics->offset;
=20
-    trace_xics_ics_simple_reject(nr, nr - ics->offset);
+    trace_xics_ics_reject(nr, nr - ics->offset);
     if (irq->flags & XICS_FLAGS_IRQ_MSI) {
         irq->status |=3D XICS_STATUS_REJECTED;
     } else if (irq->flags & XICS_FLAGS_IRQ_LSI) {
@@ -546,26 +522,26 @@ static void ics_simple_reject(ICSState *ics, uint32=
_t nr)
     }
 }
=20
-static void ics_simple_resend(ICSState *ics)
+void ics_resend(ICSState *ics)
 {
     int i;
=20
     for (i =3D 0; i < ics->nr_irqs; i++) {
         /* FIXME: filter by server#? */
         if (ics->irqs[i].flags & XICS_FLAGS_IRQ_LSI) {
-            ics_simple_resend_lsi(ics, i);
+            ics_resend_lsi(ics, i);
         } else {
-            ics_simple_resend_msi(ics, i);
+            ics_resend_msi(ics, i);
         }
     }
 }
=20
-static void ics_simple_eoi(ICSState *ics, uint32_t nr)
+static void ics_eoi(ICSState *ics, uint32_t nr)
 {
     int srcno =3D nr - ics->offset;
     ICSIRQState *irq =3D ics->irqs + srcno;
=20
-    trace_xics_ics_simple_eoi(nr);
+    trace_xics_ics_eoi(nr);
=20
     if (ics->irqs[srcno].flags & XICS_FLAGS_IRQ_LSI) {
         irq->status &=3D ~XICS_STATUS_SENT;
@@ -617,10 +593,6 @@ static void ics_simple_class_init(ObjectClass *klass=
, void *data)
                                     &isc->parent_realize);
     device_class_set_parent_reset(dc, ics_simple_reset,
                                   &isc->parent_reset);
-
-    isc->reject =3D ics_simple_reject;
-    isc->resend =3D ics_simple_resend;
-    isc->eoi =3D ics_simple_eoi;
 }
=20
 static const TypeInfo ics_simple_info =3D {
diff --git a/include/hw/ppc/xics.h b/include/hw/ppc/xics.h
index faa33ae943..ecca17695d 100644
--- a/include/hw/ppc/xics.h
+++ b/include/hw/ppc/xics.h
@@ -106,10 +106,6 @@ struct ICSStateClass {
=20
     DeviceRealize parent_realize;
     DeviceReset parent_reset;
-
-    void (*reject)(ICSState *s, uint32_t irq);
-    void (*resend)(ICSState *s);
-    void (*eoi)(ICSState *s, uint32_t irq);
 };
=20
 struct ICSState {
--=20
2.21.0


