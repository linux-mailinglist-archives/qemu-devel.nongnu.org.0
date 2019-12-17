Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86129122359
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Dec 2019 06:02:24 +0100 (CET)
Received: from localhost ([::1]:35330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ih502-0006u6-Uy
	for lists+qemu-devel@lfdr.de; Tue, 17 Dec 2019 00:02:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33480)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1ih4i0-00087w-10
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 23:43:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1ih4hy-0005PO-S7
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 23:43:43 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:40345 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1ih4hy-0005IT-Gb; Mon, 16 Dec 2019 23:43:42 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47cQWQ1BM3z9sSR; Tue, 17 Dec 2019 15:43:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1576557810;
 bh=/bVJz8FI8ZTVWwvUmPr/bk76ycZKdhdgCe/CQD3lNcU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aDveKUjxtBsezpxRKF71hef+xdIR8PlvVfdS2M9ociV5MIpK0605jwrGBVGY/zsTu
 1WhOOToprven+U/F89xG3Zvbz1uhxyvbpnIw1EM5xgiYHGSfCft5fiPzIA/Z29opVH
 qB9hZNmKm5Rv4+LZeRx2w8tELuMih8ceWhT+Efik=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 20/88] xive/kvm: Trigger interrupts from userspace
Date: Tue, 17 Dec 2019 15:42:14 +1100
Message-Id: <20191217044322.351838-21-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191217044322.351838-1-david@gibson.dropbear.id.au>
References: <20191217044322.351838-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: lvivier@redhat.com, aik@ozlabs.ru, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

When using the XIVE KVM device, the trigger page is directly accessible
in QEMU. Unlike with XICS, no need to ask KVM to fire the interrupt. A
simple store on the trigger page does the job.

Just call xive_esb_trigger().

This may improve performance of emulated devices that go through
qemu_set_irq(), eg. virtio devices created with ioeventfd=3Doff or
configured by the guest to use LSI interrupts, which aren't really
recommended setups.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <157408992731.494439.3405812941731584740.stgit@bahia.lan>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/spapr_xive_kvm.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
index 08012ac7cd..69e73552f1 100644
--- a/hw/intc/spapr_xive_kvm.c
+++ b/hw/intc/spapr_xive_kvm.c
@@ -354,32 +354,20 @@ static void kvmppc_xive_source_get_state(XiveSource=
 *xsrc)
 void kvmppc_xive_source_set_irq(void *opaque, int srcno, int val)
 {
     XiveSource *xsrc =3D opaque;
-    SpaprXive *xive =3D SPAPR_XIVE(xsrc->xive);
-    struct kvm_irq_level args;
-    int rc;
-
-    /* The KVM XIVE device should be in use */
-    assert(xive->fd !=3D -1);
=20
-    args.irq =3D srcno;
     if (!xive_source_irq_is_lsi(xsrc, srcno)) {
         if (!val) {
             return;
         }
-        args.level =3D KVM_INTERRUPT_SET;
     } else {
         if (val) {
             xsrc->status[srcno] |=3D XIVE_STATUS_ASSERTED;
-            args.level =3D KVM_INTERRUPT_SET_LEVEL;
         } else {
             xsrc->status[srcno] &=3D ~XIVE_STATUS_ASSERTED;
-            args.level =3D KVM_INTERRUPT_UNSET;
         }
     }
-    rc =3D kvm_vm_ioctl(kvm_state, KVM_IRQ_LINE, &args);
-    if (rc < 0) {
-        error_report("XIVE: kvm_irq_line() failed : %s", strerror(errno)=
);
-    }
+
+    xive_esb_trigger(xsrc, srcno);
 }
=20
 /*
--=20
2.23.0


