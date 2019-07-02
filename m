Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EA95C963
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 08:36:59 +0200 (CEST)
Received: from localhost ([::1]:49548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiCPS-0002in-RQ
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 02:36:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58765)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgibson@ozlabs.org>) id 1hiBzH-0005Md-Qj
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 02:09:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1hiBzE-0003EQ-UM
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 02:09:54 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:34975 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1hiBzD-0002xW-Is; Tue, 02 Jul 2019 02:09:52 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 45dDMl1GR9z9sPn; Tue,  2 Jul 2019 16:09:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1562047747;
 bh=JM4OsR1wgCV9226TKJfXvd2eiPjHdnnFycoI+37MOJM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=luw4w+CU5EwzyeGVzUquTcUQ8CMGrkcNYM0fM9hkdOE8IYtjFnih3xLiZnO7UzZcO
 SLttMZmuhGoub6iiw7sFEfg4YWDWsc7DeWUyUPD22i59lbuEnHd0eWKjCc4nS3Vjd/
 Ump9FGohxwIyyvex/qQebjsHLeLhiJyuUvcoG5LU=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Tue,  2 Jul 2019 16:08:34 +1000
Message-Id: <20190702060857.3926-27-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190702060857.3926-1-david@gibson.dropbear.id.au>
References: <20190702060857.3926-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
Subject: [Qemu-devel] [PULL 26/49] xics/kvm: Add proper rollback to
 xics_kvm_init()
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
 qemu-ppc@nongnu.org, clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

Make xics_kvm_disconnect() able to undo the changes of a partial executio=
n
of xics_kvm_connect() and use it to perform rollback.

Note that kvmppc_define_rtas_kernel_token(0) never fails, no matter the
RTAS call has been defined or not.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <156077922319.433243.609897156640506891.stgit@bahia.lan>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/xics_kvm.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/hw/intc/xics_kvm.c b/hw/intc/xics_kvm.c
index 4bfbe1a840..51433b19b0 100644
--- a/hw/intc/xics_kvm.c
+++ b/hw/intc/xics_kvm.c
@@ -421,10 +421,7 @@ int xics_kvm_connect(SpaprMachineState *spapr, Error=
 **errp)
=20
 fail:
     error_propagate(errp, local_err);
-    kvmppc_define_rtas_kernel_token(0, "ibm,set-xive");
-    kvmppc_define_rtas_kernel_token(0, "ibm,get-xive");
-    kvmppc_define_rtas_kernel_token(0, "ibm,int-on");
-    kvmppc_define_rtas_kernel_token(0, "ibm,int-off");
+    xics_kvm_disconnect(spapr, NULL);
     return -1;
 }
=20
@@ -448,8 +445,10 @@ void xics_kvm_disconnect(SpaprMachineState *spapr, E=
rror **errp)
      * removed from the list of devices of the VM. The VCPU presenters
      * are also detached from the device.
      */
-    close(kernel_xics_fd);
-    kernel_xics_fd =3D -1;
+    if (kernel_xics_fd !=3D -1) {
+        close(kernel_xics_fd);
+        kernel_xics_fd =3D -1;
+    }
=20
     kvmppc_define_rtas_kernel_token(0, "ibm,set-xive");
     kvmppc_define_rtas_kernel_token(0, "ibm,get-xive");
--=20
2.21.0


