Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 853542DE135
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 11:42:02 +0100 (CET)
Received: from localhost ([::1]:44832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqDCz-0002XI-Hu
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 05:42:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kqD5V-0000kO-Nq
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:34:17 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:31670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kqD5T-0001zM-7M
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:34:16 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-LEGz206sOdCmX2uoMkzq-g-1; Fri, 18 Dec 2020 05:34:09 -0500
X-MC-Unique: LEGz206sOdCmX2uoMkzq-g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E8B9104ED15;
 Fri, 18 Dec 2020 10:34:08 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-114-254.ams2.redhat.com [10.36.114.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6796460BE5;
 Fri, 18 Dec 2020 10:34:07 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/6] spapr: Use spapr_drc_reset_all() at machine reset
Date: Fri, 18 Dec 2020 11:33:58 +0100
Message-Id: <20201218103400.689660-5-groug@kaod.org>
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
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: Daniel Henrique Barboza <danielhb@linux.ibm.com>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Documentation of object_child_foreach_recursive() clearly stipulates
that "it is forbidden to add or remove children from @obj from the @fn
callback". But this is exactly what we do during machine reset. The call
to spapr_drc_reset() can finalize the hot-unplug sequence of a PHB or a
PCI bridge, both of which will then in turn destroy their PCI DRCs. This
could potentially invalidate the iterator used by do_object_child_foreach()=
.
It is pure luck that this haven't caused any issues so far.

Use spapr_drc_reset_all() since it can cope with DRC removal.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/ppc/spapr.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 43dded87f498..8528bc90fec4 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1566,19 +1566,6 @@ void spapr_setup_hpt(SpaprMachineState *spapr)
     }
 }
=20
-static int spapr_reset_drcs(Object *child, void *opaque)
-{
-    SpaprDrc *drc =3D
-        (SpaprDrc *) object_dynamic_cast(child,
-                                                 TYPE_SPAPR_DR_CONNECTOR);
-
-    if (drc) {
-        spapr_drc_reset(drc);
-    }
-
-    return 0;
-}
-
 static void spapr_machine_reset(MachineState *machine)
 {
     SpaprMachineState *spapr =3D SPAPR_MACHINE(machine);
@@ -1633,7 +1620,7 @@ static void spapr_machine_reset(MachineState *machine=
)
      * will crash QEMU if the DIMM holding the vring goes away). To avoid =
such
      * situations, we reset DRCs after all devices have been reset.
      */
-    object_child_foreach_recursive(object_get_root(), spapr_reset_drcs, NU=
LL);
+    spapr_drc_reset_all(spapr);
=20
     spapr_clear_pending_events(spapr);
=20
--=20
2.26.2


