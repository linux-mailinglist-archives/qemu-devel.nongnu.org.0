Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A804CB891
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Oct 2019 12:46:12 +0200 (CEST)
Received: from localhost ([::1]:45914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGL6A-0000vh-J7
	for lists+qemu-devel@lfdr.de; Fri, 04 Oct 2019 06:46:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53867)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iGK3q-0006pZ-CX
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 05:39:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iGK3p-0006fM-Al
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 05:39:42 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:50199)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iGK3o-0006Ks-Vf; Fri, 04 Oct 2019 05:39:41 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46l4YT6qBSz9sSf; Fri,  4 Oct 2019 19:38:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1570181885;
 bh=6po48o0Vb7lEsTowG2N9p/x6N2CKy8EDDBuPab4nSoU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oMJI0sOT2oi3h2kht68fCzag5Hrk/loIYolWpRmP7n1pD6Q1jg8CbFgl+RDR4xvi6
 T0ycbp0UfZjVmQRmxU/eBG/12gGmvZY2alLDtuCcVJajkY6+tVqM4Rkuns+8CPp0uR
 tsHnyWYXk3eDHTfQW3ApaowsnL1Vl7DjXSgEABFk=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 53/53] ppc/pnv: Remove the XICSFabric Interface from the POWER9
 machine
Date: Fri,  4 Oct 2019 19:37:47 +1000
Message-Id: <20191004093747.31350-54-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191004093747.31350-1-david@gibson.dropbear.id.au>
References: <20191004093747.31350-1-david@gibson.dropbear.id.au>
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

From: C=C3=A9dric Le Goater <clg@kaod.org>

The POWER8 PowerNV machine needs to implement a XICSFabric interface
as this is the POWER8 interrupt controller model. But the POWER9
machine uselessly inherits of XICSFabric from the common PowerNV
machine definition.

Open code machine definitions to have a better control on the
different interfaces each machine should define.

Fixes: f30c843ced50 ("ppc/pnv: Introduce PowerNV machines with fixed CPU =
models")
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20191003143617.21682-1-clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/pnv.c | 31 ++++++++++++++-----------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 77a86c6a23..7cf64b6d25 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1485,23 +1485,21 @@ static void pnv_machine_class_init(ObjectClass *o=
c, void *data)
         .parent        =3D TYPE_PNV9_CHIP,          \
     }
=20
-#define DEFINE_PNV_MACHINE_TYPE(cpu, class_initfn)      \
-    {                                                   \
-        .name          =3D MACHINE_TYPE_NAME(cpu),        \
-        .parent        =3D TYPE_PNV_MACHINE,              \
-        .instance_size =3D sizeof(PnvMachineState),       \
-        .instance_init =3D pnv_machine_instance_init,     \
-        .class_init    =3D class_initfn,                  \
-        .interfaces =3D (InterfaceInfo[]) {               \
-            { TYPE_XICS_FABRIC },                       \
-            { TYPE_INTERRUPT_STATS_PROVIDER },          \
-            { },                                        \
-        },                                              \
-    }
-
 static const TypeInfo types[] =3D {
-    DEFINE_PNV_MACHINE_TYPE("powernv8", pnv_machine_power8_class_init),
-    DEFINE_PNV_MACHINE_TYPE("powernv9", pnv_machine_power9_class_init),
+    {
+        .name          =3D MACHINE_TYPE_NAME("powernv9"),
+        .parent        =3D TYPE_PNV_MACHINE,
+        .class_init    =3D pnv_machine_power9_class_init,
+    },
+    {
+        .name          =3D MACHINE_TYPE_NAME("powernv8"),
+        .parent        =3D TYPE_PNV_MACHINE,
+        .class_init    =3D pnv_machine_power8_class_init,
+        .interfaces =3D (InterfaceInfo[]) {
+            { TYPE_XICS_FABRIC },
+            { },
+        },
+    },
     {
         .name          =3D TYPE_PNV_MACHINE,
         .parent        =3D TYPE_MACHINE,
@@ -1510,7 +1508,6 @@ static const TypeInfo types[] =3D {
         .instance_init =3D pnv_machine_instance_init,
         .class_init    =3D pnv_machine_class_init,
         .interfaces =3D (InterfaceInfo[]) {
-            { TYPE_XICS_FABRIC },
             { TYPE_INTERRUPT_STATS_PROVIDER },
             { },
         },
--=20
2.21.0


