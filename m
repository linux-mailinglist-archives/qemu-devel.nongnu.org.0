Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 853CC2CA1B0
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 12:43:35 +0100 (CET)
Received: from localhost ([::1]:41056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk44E-0003IW-Ju
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 06:43:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kk3yZ-0007Bk-Bm
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 06:37:44 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:43335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kk3yX-0000oF-2O
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 06:37:43 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-wt_5bDwdOoS3bOHTMZMOgQ-1; Tue, 01 Dec 2020 06:37:38 -0500
X-MC-Unique: wt_5bDwdOoS3bOHTMZMOgQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB3AB107B457;
 Tue,  1 Dec 2020 11:37:37 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-112-87.ams2.redhat.com [10.36.112.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9769D60BE5;
 Tue,  1 Dec 2020 11:37:36 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0 v2 3/4] spapr: Simplify error path of spapr_core_plug()
Date: Tue,  1 Dec 2020 12:37:27 +0100
Message-Id: <20201201113728.885700-4-groug@kaod.org>
In-Reply-To: <20201201113728.885700-1-groug@kaod.org>
References: <20201201113728.885700-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

spapr_core_pre_plug() already guarantees that the slot for the given core
ID is available. It is thus safe to assume that spapr_find_cpu_slot()
returns a slot during plug. Turn the error path into an assertion.
It is also safe to assume that no device is attached to the corresponding
DRC and that spapr_drc_attach() shouldn't fail.

Pass &error_abort to spapr_drc_attach() and simplify error handling.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/ppc/spapr.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 3a32918dd9a9..6707fafdd313 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3741,8 +3741,7 @@ int spapr_core_dt_populate(SpaprDrc *drc, SpaprMachin=
eState *spapr,
     return 0;
 }
=20
-static void spapr_core_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
-                            Error **errp)
+static void spapr_core_plug(HotplugHandler *hotplug_dev, DeviceState *dev)
 {
     SpaprMachineState *spapr =3D SPAPR_MACHINE(OBJECT(hotplug_dev));
     MachineClass *mc =3D MACHINE_GET_CLASS(spapr);
@@ -3757,20 +3756,20 @@ static void spapr_core_plug(HotplugHandler *hotplug=
_dev, DeviceState *dev,
     int i;
=20
     core_slot =3D spapr_find_cpu_slot(MACHINE(hotplug_dev), cc->core_id, &=
index);
-    if (!core_slot) {
-        error_setg(errp, "Unable to find CPU core with core-id: %d",
-                   cc->core_id);
-        return;
-    }
+    g_assert(core_slot); /* Already checked in spapr_core_pre_plug() */
+
     drc =3D spapr_drc_by_id(TYPE_SPAPR_DRC_CPU,
                           spapr_vcpu_id(spapr, cc->core_id));
=20
     g_assert(drc || !mc->has_hotpluggable_cpus);
=20
     if (drc) {
-        if (!spapr_drc_attach(drc, dev, errp)) {
-            return;
-        }
+        /*
+         * spapr_core_pre_plug() already buys us this is a brand new
+         * core being plugged into a free slot. Nothing should already
+         * be attached to the corresponding DRC.
+         */
+        spapr_drc_attach(drc, dev, &error_abort);
=20
         if (hotplugged) {
             /*
@@ -4012,7 +4011,7 @@ static void spapr_machine_device_plug(HotplugHandler =
*hotplug_dev,
     if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
         spapr_memory_plug(hotplug_dev, dev);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_SPAPR_CPU_CORE)) {
-        spapr_core_plug(hotplug_dev, dev, errp);
+        spapr_core_plug(hotplug_dev, dev);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_SPAPR_PCI_HOST_BRIDGE=
)) {
         spapr_phb_plug(hotplug_dev, dev);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_SPAPR_TPM_PROXY)) {
--=20
2.26.2


