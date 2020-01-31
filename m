Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8885A14E8C6
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 07:25:18 +0100 (CET)
Received: from localhost ([::1]:48952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixPjx-00005H-HZ
	for lists+qemu-devel@lfdr.de; Fri, 31 Jan 2020 01:25:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59574)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1ixPVE-0007aj-He
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 01:10:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1ixPVD-0000w3-Ex
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 01:10:04 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:35313 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1ixPVD-0000QE-43; Fri, 31 Jan 2020 01:10:03 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4886Hs6m0Cz9sSP; Fri, 31 Jan 2020 17:09:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1580450969;
 bh=T5HcPQ8r1av4lIVQhAhCglYzvv+qvm2F5/heyqORLNc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Dz+uyYOrBLwVdlL/qHGNijlOP8C7TmmeXhkLYqbpT3rYpzAvT6myYMBws5Ryk3vYX
 hGsRQZ4EcJkm4GVspo0pjDZc+ShKgimyW942eQHcCIcISm4VMEIiFg5rX8S0+SpB4i
 WaCiPHLi/z2KsSUurTqpihy8u0FRGlPudqBctVoI=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 14/34] spapr: Implement get_dt_compatible() callback
Date: Fri, 31 Jan 2020 17:09:04 +1100
Message-Id: <20200131060924.147449-15-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200131060924.147449-1-david@gibson.dropbear.id.au>
References: <20200131060924.147449-1-david@gibson.dropbear.id.au>
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
Cc: lvivier@redhat.com, Stefan Berger <stefanb@linux.vnet.ibm.com>,
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Berger <stefanb@linux.vnet.ibm.com>

For devices that cannot be statically initialized, implement a
get_dt_compatible() callback that allows us to ask the device for
the 'compatible' value.

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Message-Id: <20200121152935.649898-3-stefanb@linux.ibm.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_vio.c         | 11 +++++++++--
 include/hw/ppc/spapr_vio.h |  1 +
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/spapr_vio.c b/hw/ppc/spapr_vio.c
index f14944e900..0b085eabe4 100644
--- a/hw/ppc/spapr_vio.c
+++ b/hw/ppc/spapr_vio.c
@@ -87,6 +87,7 @@ static int vio_make_devnode(SpaprVioDevice *dev,
     SpaprVioDeviceClass *pc =3D VIO_SPAPR_DEVICE_GET_CLASS(dev);
     int vdevice_off, node_off, ret;
     char *dt_name;
+    const char *dt_compatible;
=20
     vdevice_off =3D fdt_path_offset(fdt, "/vdevice");
     if (vdevice_off < 0) {
@@ -113,9 +114,15 @@ static int vio_make_devnode(SpaprVioDevice *dev,
         }
     }
=20
-    if (pc->dt_compatible) {
+    if (pc->get_dt_compatible) {
+        dt_compatible =3D pc->get_dt_compatible(dev);
+    } else {
+        dt_compatible =3D pc->dt_compatible;
+    }
+
+    if (dt_compatible) {
         ret =3D fdt_setprop_string(fdt, node_off, "compatible",
-                                 pc->dt_compatible);
+                                 dt_compatible);
         if (ret < 0) {
             return ret;
         }
diff --git a/include/hw/ppc/spapr_vio.h b/include/hw/ppc/spapr_vio.h
index ce6d9b0c66..bed7df60e3 100644
--- a/include/hw/ppc/spapr_vio.h
+++ b/include/hw/ppc/spapr_vio.h
@@ -58,6 +58,7 @@ typedef struct SpaprVioDeviceClass {
     void (*realize)(SpaprVioDevice *dev, Error **errp);
     void (*reset)(SpaprVioDevice *dev);
     int (*devnode)(SpaprVioDevice *dev, void *fdt, int node_off);
+    const char *(*get_dt_compatible)(SpaprVioDevice *dev);
 } SpaprVioDeviceClass;
=20
 struct SpaprVioDevice {
--=20
2.24.1


