Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D539D15518B
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Feb 2020 05:32:45 +0100 (CET)
Received: from localhost ([::1]:49902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izvJs-0008I6-TK
	for lists+qemu-devel@lfdr.de; Thu, 06 Feb 2020 23:32:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44172)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1izvIN-00076Z-Qs
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 23:31:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1izvIM-000730-Hd
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 23:31:11 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:52131)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1izvIL-0005Yi-7r; Thu, 06 Feb 2020 23:31:10 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48DMmy3dpDz9sRR; Fri,  7 Feb 2020 15:30:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1581049858;
 bh=EwdYg3FefC4Fvpkhng+3OTYBYJN53OgOv/NfvAW3sFQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=J0A8r8wkf79fd2twMhkgz+VN61OWTJmgST74EsRNyBQQEpgwQeENBjvPFma1AV8ie
 2q4OQdZROw1n3AYAuVSN0mpxfbMXFD3sqLzL77Lri58/4pjTZfGdUjNFPoWi+F908A
 C+NVN7xl8mGajieYSdwRK5J+3e5jLIvIlJ5WW6bs=
From: David Gibson <david@gibson.dropbear.id.au>
To: groug@kaod.org,
	clg@kaod.org,
	pair@us.ibm.com
Subject: [PATCH 1/2] spapr: Disable legacy virtio devices for pseries-5.0 and
 later
Date: Fri,  7 Feb 2020 15:30:54 +1100
Message-Id: <20200207043055.218856-2-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200207043055.218856-1-david@gibson.dropbear.id.au>
References: <20200207043055.218856-1-david@gibson.dropbear.id.au>
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
Cc: mst@redhat.com, aik@ozlabs.ru, qemu-devel@nongnu.org, paulus@samba.org,
 mdroth@us.ibm.com, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PAPR specifies a kind of odd, paravirtualized PCI bus, which looks to
the guess mostly like classic PCI, even if some of the individual
devices on the bus are PCI Express.  One consequence of that is that
virtio-pci devices still default to being in transitional mode, though
legacy mode is now disabled by default on current q35 x86 machine
types.

Legacy mode virtio devices aren't really necessary any more, and are
causing some problems for future changes.  Therefore, for the
pseries-5.0 machine type (and onwards), switch to modern-only
virtio-pci devices by default.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index c9b2e0a5e0..216d3b34dc 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -65,6 +65,7 @@
=20
 #include "hw/pci/pci.h"
 #include "hw/scsi/scsi.h"
+#include "hw/virtio/virtio-pci.h"
 #include "hw/virtio/virtio-scsi.h"
 #include "hw/virtio/vhost-scsi-common.h"
=20
@@ -4512,7 +4513,14 @@ static const TypeInfo spapr_machine_info =3D {
  */
 static void spapr_machine_5_0_class_options(MachineClass *mc)
 {
-    /* Defaults for the latest behaviour inherited from the base class *=
/
+    /* Most defaults for the latest behaviour are inherited from the
+     * base class, but we need to override the (non ppc specific)
+     * default behaviour for virtio */
+    static GlobalProperty compat[] =3D {
+        { TYPE_VIRTIO_PCI, "disable-legacy", "on", },
+    };
+
+    compat_props_add(mc->compat_props, compat, G_N_ELEMENTS(compat));
 }
=20
 DEFINE_SPAPR_MACHINE(5_0, "5.0", true);
@@ -4523,11 +4531,15 @@ DEFINE_SPAPR_MACHINE(5_0, "5.0", true);
 static void spapr_machine_4_2_class_options(MachineClass *mc)
 {
     SpaprMachineClass *smc =3D SPAPR_MACHINE_CLASS(mc);
+    static GlobalProperty compat[] =3D {
+        { TYPE_VIRTIO_PCI, "disable-legacy", "auto" },
+    };
=20
     spapr_machine_5_0_class_options(mc);
     compat_props_add(mc->compat_props, hw_compat_4_2, hw_compat_4_2_len)=
;
     smc->default_caps.caps[SPAPR_CAP_CCF_ASSIST] =3D SPAPR_CAP_OFF;
     smc->default_caps.caps[SPAPR_CAP_FWNMI_MCE] =3D SPAPR_CAP_OFF;
+    compat_props_add(mc->compat_props, compat, G_N_ELEMENTS(compat));
 }
=20
 DEFINE_SPAPR_MACHINE(4_2, "4.2", false);
--=20
2.24.1


