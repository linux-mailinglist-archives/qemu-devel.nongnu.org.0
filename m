Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AC42BBA50
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 00:48:38 +0100 (CET)
Received: from localhost ([::1]:49882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgG8r-0004jc-VJ
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 18:48:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kgG31-00068T-02
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 18:42:35 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:44215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kgG2x-0003qg-3n
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 18:42:34 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-WnjQsAg_M9eiGMbRVaTiLQ-1; Fri, 20 Nov 2020 18:42:26 -0500
X-MC-Unique: WnjQsAg_M9eiGMbRVaTiLQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 518C88030BF;
 Fri, 20 Nov 2020 23:42:25 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-112-44.ams2.redhat.com [10.36.112.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1C92F60BFA;
 Fri, 20 Nov 2020 23:42:21 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0 8/9] spapr: Do TPM proxy hotplug sanity checks at
 pre-plug
Date: Sat, 21 Nov 2020 00:42:07 +0100
Message-Id: <20201120234208.683521-9-groug@kaod.org>
In-Reply-To: <20201120234208.683521-1-groug@kaod.org>
References: <20201120234208.683521-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
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

There can be only one TPM proxy at a time. This is currently
checked at plug time. But this can be detected at pre-plug in
order to error out earlier.

This allows to get rid of error handling in the plug handler.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/ppc/spapr.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index bded059d59c8..5e32d1d396b4 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3957,17 +3957,28 @@ static void spapr_phb_unplug_request(HotplugHandler=
 *hotplug_dev,
     }
 }
=20
-static void spapr_tpm_proxy_plug(HotplugHandler *hotplug_dev, DeviceState =
*dev,
-                                 Error **errp)
+static
+bool spapr_tpm_proxy_pre_plug(HotplugHandler *hotplug_dev, DeviceState *de=
v,
+                              Error **errp)
 {
     SpaprMachineState *spapr =3D SPAPR_MACHINE(OBJECT(hotplug_dev));
-    SpaprTpmProxy *tpm_proxy =3D SPAPR_TPM_PROXY(dev);
=20
     if (spapr->tpm_proxy !=3D NULL) {
         error_setg(errp, "Only one TPM proxy can be specified for this mac=
hine");
-        return;
+        return false;
     }
=20
+    return true;
+}
+
+static void spapr_tpm_proxy_plug(HotplugHandler *hotplug_dev, DeviceState =
*dev)
+{
+    SpaprMachineState *spapr =3D SPAPR_MACHINE(OBJECT(hotplug_dev));
+    SpaprTpmProxy *tpm_proxy =3D SPAPR_TPM_PROXY(dev);
+
+    /* Already checked in spapr_tpm_proxy_pre_plug() */
+    g_assert(spapr->tpm_proxy =3D=3D NULL);
+
     spapr->tpm_proxy =3D tpm_proxy;
 }
=20
@@ -3990,7 +4001,7 @@ static void spapr_machine_device_plug(HotplugHandler =
*hotplug_dev,
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_SPAPR_PCI_HOST_BRIDGE=
)) {
         spapr_phb_plug(hotplug_dev, dev);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_SPAPR_TPM_PROXY)) {
-        spapr_tpm_proxy_plug(hotplug_dev, dev, errp);
+        spapr_tpm_proxy_plug(hotplug_dev, dev);
     }
 }
=20
@@ -4053,6 +4064,8 @@ static void spapr_machine_device_pre_plug(HotplugHand=
ler *hotplug_dev,
         spapr_core_pre_plug(hotplug_dev, dev, errp);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_SPAPR_PCI_HOST_BRIDGE=
)) {
         spapr_phb_pre_plug(hotplug_dev, dev, errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_SPAPR_TPM_PROXY)) {
+        spapr_tpm_proxy_pre_plug(hotplug_dev, dev, errp);
     }
 }
=20
--=20
2.26.2


