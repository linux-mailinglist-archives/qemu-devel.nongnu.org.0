Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC282BBA4E
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 00:47:07 +0100 (CET)
Received: from localhost ([::1]:45474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgG7O-0002vZ-Gj
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 18:47:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kgG2z-00064e-Eo
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 18:42:33 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:46997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kgG2w-0003ot-L1
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 18:42:33 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-CA_hywLVPN28yxIKbMp6QA-1; Fri, 20 Nov 2020 18:42:23 -0500
X-MC-Unique: CA_hywLVPN28yxIKbMp6QA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C474080ED8B;
 Fri, 20 Nov 2020 23:42:21 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-112-44.ams2.redhat.com [10.36.112.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 98C8C60BFA;
 Fri, 20 Nov 2020 23:42:20 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0 7/9] spapr: Do PHB hoplug sanity check at pre-plug
Date: Sat, 21 Nov 2020 00:42:06 +0100
Message-Id: <20201120234208.683521-8-groug@kaod.org>
In-Reply-To: <20201120234208.683521-1-groug@kaod.org>
References: <20201120234208.683521-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We currently detect that a PHB index is already in use at plug time.
But this can be decteted at pre-plug in order to error out earlier.

This allows to pass &error_abort to spapr_drc_attach() and to end
up with a plug handler that doesn't need to report errors anymore.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/ppc/spapr.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 81bac59887ab..bded059d59c8 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3872,6 +3872,7 @@ static bool spapr_phb_pre_plug(HotplugHandler *hotplu=
g_dev, DeviceState *dev,
     SpaprPhbState *sphb =3D SPAPR_PCI_HOST_BRIDGE(dev);
     SpaprMachineClass *smc =3D SPAPR_MACHINE_GET_CLASS(spapr);
     const unsigned windows_supported =3D spapr_phb_windows_supported(sphb)=
;
+    SpaprDrc *drc;
=20
     if (dev->hotplugged && !smc->dr_phb_enabled) {
         error_setg(errp, "PHB hotplug not supported for this machine");
@@ -3883,6 +3884,12 @@ static bool spapr_phb_pre_plug(HotplugHandler *hotpl=
ug_dev, DeviceState *dev,
         return false;
     }
=20
+    drc =3D spapr_drc_by_id(TYPE_SPAPR_DRC_PHB, sphb->index);
+    if (drc && drc->dev) {
+        error_setg(errp, "PHB %d already attached", sphb->index);
+        return false;
+    }
+
     /*
      * This will check that sphb->index doesn't exceed the maximum number =
of
      * PHBs for the current machine type.
@@ -3896,8 +3903,7 @@ static bool spapr_phb_pre_plug(HotplugHandler *hotplu=
g_dev, DeviceState *dev,
                            errp);
 }
=20
-static void spapr_phb_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
-                           Error **errp)
+static void spapr_phb_plug(HotplugHandler *hotplug_dev, DeviceState *dev)
 {
     SpaprMachineState *spapr =3D SPAPR_MACHINE(OBJECT(hotplug_dev));
     SpaprMachineClass *smc =3D SPAPR_MACHINE_GET_CLASS(spapr);
@@ -3913,9 +3919,8 @@ static void spapr_phb_plug(HotplugHandler *hotplug_de=
v, DeviceState *dev,
     /* hotplug hooks should check it's enabled before getting this far */
     assert(drc);
=20
-    if (!spapr_drc_attach(drc, dev, errp)) {
-        return;
-    }
+    /* spapr_phb_pre_plug() already checked the DRC is attachable */
+    spapr_drc_attach(drc, dev, &error_abort);
=20
     if (hotplugged) {
         spapr_hotplug_req_add_by_index(drc);
@@ -3983,7 +3988,7 @@ static void spapr_machine_device_plug(HotplugHandler =
*hotplug_dev,
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_SPAPR_CPU_CORE)) {
         spapr_core_plug(hotplug_dev, dev);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_SPAPR_PCI_HOST_BRIDGE=
)) {
-        spapr_phb_plug(hotplug_dev, dev, errp);
+        spapr_phb_plug(hotplug_dev, dev);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_SPAPR_TPM_PROXY)) {
         spapr_tpm_proxy_plug(hotplug_dev, dev, errp);
     }
--=20
2.26.2


