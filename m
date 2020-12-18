Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DAE2DE12A
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 11:37:49 +0100 (CET)
Received: from localhost ([::1]:58094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqD8u-0004Tw-D1
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 05:37:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kqD5S-0000jC-P1
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:34:15 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:21623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kqD5Q-0001yS-5V
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:34:13 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-bwShnYEUPFWPsXAiR96pRg-1; Fri, 18 Dec 2020 05:34:06 -0500
X-MC-Unique: bwShnYEUPFWPsXAiR96pRg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D53F835DE1;
 Fri, 18 Dec 2020 10:34:05 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-114-254.ams2.redhat.com [10.36.114.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 77E5460BE5;
 Fri, 18 Dec 2020 10:34:04 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/6] spapr: Fix reset of transient DR connectors
Date: Fri, 18 Dec 2020 11:33:56 +0100
Message-Id: <20201218103400.689660-3-groug@kaod.org>
In-Reply-To: <20201218103400.689660-1-groug@kaod.org>
References: <20201218103400.689660-1-groug@kaod.org>
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
Cc: Daniel Henrique Barboza <danielhb@linux.ibm.com>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Documentation of object_property_iter_init() clearly stipulates that
"it is forbidden to modify the property list while iterating". But this
is exactly what we do when resetting transient DR connectors during CAS.
The call to spapr_drc_reset() can finalize the hot-unplug sequence of a
PHB or a PCI bridge, both of which will then in turn destroy their PCI
DRCs. This could potentially invalidate the iterator. It is pure luck
that this haven't caused any issues so far.

Change spapr_drc_reset() to return true if it caused a device to be
removed. Restart from scratch in this case. This can potentially
increase the overall DRC reset time, especially with a high maxmem
which generates a lot of LMB DRCs. But this kind of setup is rare,
and so is the use case of rebooting a guest while doing hot-unplug.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 include/hw/ppc/spapr_drc.h | 3 ++-
 hw/ppc/spapr_drc.c         | 6 +++++-
 hw/ppc/spapr_hcall.c       | 8 +++++++-
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/include/hw/ppc/spapr_drc.h b/include/hw/ppc/spapr_drc.h
index cff5e707d0d9..5d80019f82e2 100644
--- a/include/hw/ppc/spapr_drc.h
+++ b/include/hw/ppc/spapr_drc.h
@@ -224,7 +224,8 @@ static inline bool spapr_drc_hotplugged(DeviceState *de=
v)
     return dev->hotplugged && !runstate_check(RUN_STATE_INMIGRATE);
 }
=20
-void spapr_drc_reset(SpaprDrc *drc);
+/* Returns true if an unplug request completed */
+bool spapr_drc_reset(SpaprDrc *drc);
=20
 uint32_t spapr_drc_index(SpaprDrc *drc);
 SpaprDrcType spapr_drc_type(SpaprDrc *drc);
diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index 8d62f55066b6..5b5e2ac58a7e 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -417,9 +417,10 @@ void spapr_drc_detach(SpaprDrc *drc)
     spapr_drc_release(drc);
 }
=20
-void spapr_drc_reset(SpaprDrc *drc)
+bool spapr_drc_reset(SpaprDrc *drc)
 {
     SpaprDrcClass *drck =3D SPAPR_DR_CONNECTOR_GET_CLASS(drc);
+    bool unplug_completed =3D false;
=20
     trace_spapr_drc_reset(spapr_drc_index(drc));
=20
@@ -428,6 +429,7 @@ void spapr_drc_reset(SpaprDrc *drc)
      */
     if (drc->unplug_requested) {
         spapr_drc_release(drc);
+        unplug_completed =3D true;
     }
=20
     if (drc->dev) {
@@ -444,6 +446,8 @@ void spapr_drc_reset(SpaprDrc *drc)
         drc->ccs_offset =3D -1;
         drc->ccs_depth =3D -1;
     }
+
+    return unplug_completed;
 }
=20
 static bool spapr_drc_unplug_requested_needed(void *opaque)
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 4e9d50c254f0..aa22830ac4bd 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1639,6 +1639,7 @@ static void spapr_handle_transient_dev_before_cas(Spa=
prMachineState *spapr)
     ObjectPropertyIterator iter;
=20
     drc_container =3D container_get(object_get_root(), "/dr-connector");
+restart:
     object_property_iter_init(&iter, drc_container);
     while ((prop =3D object_property_iter_next(&iter))) {
         SpaprDrc *drc;
@@ -1652,8 +1653,13 @@ static void spapr_handle_transient_dev_before_cas(Sp=
aprMachineState *spapr)
=20
         /*
          * This will complete any pending plug/unplug requests.
+         * In case of a unplugged PHB or PCI bridge, this will
+         * cause some DRCs to be destroyed and thus potentially
+         * invalidate the iterator.
          */
-        spapr_drc_reset(drc);
+        if (spapr_drc_reset(drc)) {
+            goto restart;
+        }
     }
=20
     spapr_clear_pending_hotplug_events(spapr);
--=20
2.26.2


