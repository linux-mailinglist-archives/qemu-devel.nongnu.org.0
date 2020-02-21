Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0251166DDD
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Feb 2020 04:38:49 +0100 (CET)
Received: from localhost ([::1]:51686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4z9M-0003t3-SO
	for lists+qemu-devel@lfdr.de; Thu, 20 Feb 2020 22:38:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48475)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1j4z7l-0001sU-21
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 22:37:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1j4z7j-0007vS-UP
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 22:37:09 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:41503 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1j4z7j-0007b3-IW; Thu, 20 Feb 2020 22:37:07 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48NxwC15XBz9sSL; Fri, 21 Feb 2020 14:36:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1582256219;
 bh=jqqnMtQm/SacavvOrUfYgqe7ZLRmn4/doK7w+JdQW7M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pyplSiCGs/W/ap2NIN9SXqa8vhkRyFR9MhCBMIOwa4FBkf6p0i+QLsFhERR0AestS
 EWdKylhv70dype41MWIWfHoTpUk0nTalLG4LELYt3yd7dcxakZfg3BUkqpi+INh9vK
 8f6cve1/Saizc73cTrlXepySETfB4PXPZlf3Ua44=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 04/20] ppc: function to setup latest class options
Date: Fri, 21 Feb 2020 14:36:34 +1100
Message-Id: <20200221033650.444386-5-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200221033650.444386-1-david@gibson.dropbear.id.au>
References: <20200221033650.444386-1-david@gibson.dropbear.id.au>
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
Cc: lvivier@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>, aik@ozlabs.ru,
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Michael S. Tsirkin" <mst@redhat.com>

We are going to add more init for the latest machine, so move the setup
to a function so we don't have to change the DEFINE_SPAPR_MACHINE macro
each time.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20200207064628.1196095-1-mst@redhat.com>
Reviewed-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index c9b2e0a5e0..691c391060 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4485,6 +4485,12 @@ static const TypeInfo spapr_machine_info =3D {
     },
 };
=20
+static void spapr_machine_latest_class_options(MachineClass *mc)
+{
+    mc->alias =3D "pseries";
+    mc->is_default =3D 1;
+}
+
 #define DEFINE_SPAPR_MACHINE(suffix, verstr, latest)                 \
     static void spapr_machine_##suffix##_class_init(ObjectClass *oc, \
                                                     void *data)      \
@@ -4492,8 +4498,7 @@ static const TypeInfo spapr_machine_info =3D {
         MachineClass *mc =3D MACHINE_CLASS(oc);                        \
         spapr_machine_##suffix##_class_options(mc);                  \
         if (latest) {                                                \
-            mc->alias =3D "pseries";                                   \
-            mc->is_default =3D 1;                                      \
+            spapr_machine_latest_class_options(mc);                  \
         }                                                            \
     }                                                                \
     static const TypeInfo spapr_machine_##suffix##_info =3D {          \
--=20
2.24.1


