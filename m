Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D292BB1D5
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 18:57:36 +0100 (CET)
Received: from localhost ([::1]:60526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgAf9-00030p-9D
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 12:57:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kgAV7-0008UY-0m
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 12:47:14 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:43338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kgAV2-00059G-JN
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 12:47:12 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-XutxK6N-Oo2VrwJAmco-EA-1; Fri, 20 Nov 2020 12:47:00 -0500
X-MC-Unique: XutxK6N-Oo2VrwJAmco-EA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30BCB80ED8A;
 Fri, 20 Nov 2020 17:46:59 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-112-44.ams2.redhat.com [10.36.112.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0A6935C1D5;
 Fri, 20 Nov 2020 17:46:57 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0 7/8] spapr: Drop "nr_servers" argument of the sPAPR IC
 activate() operation
Date: Fri, 20 Nov 2020 18:46:45 +0100
Message-Id: <20201120174646.619395-8-groug@kaod.org>
In-Reply-To: <20201120174646.619395-1-groug@kaod.org>
References: <20201120174646.619395-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This argument isn't used by the backends anymore.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 include/hw/ppc/spapr_irq.h | 3 +--
 hw/intc/spapr_xive.c       | 3 +--
 hw/intc/xics_spapr.c       | 3 +--
 hw/ppc/spapr_irq.c         | 3 +--
 4 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/include/hw/ppc/spapr_irq.h b/include/hw/ppc/spapr_irq.h
index c22a72c9e270..3e1c619d4c06 100644
--- a/include/hw/ppc/spapr_irq.h
+++ b/include/hw/ppc/spapr_irq.h
@@ -43,8 +43,7 @@ DECLARE_CLASS_CHECKERS(SpaprInterruptControllerClass, SPA=
PR_INTC,
 struct SpaprInterruptControllerClass {
     InterfaceClass parent;
=20
-    int (*activate)(SpaprInterruptController *intc, uint32_t nr_servers,
-                    Error **errp);
+    int (*activate)(SpaprInterruptController *intc, Error **errp);
     void (*deactivate)(SpaprInterruptController *intc);
=20
     /*
diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
index d13a2955ce9b..8331026fdb12 100644
--- a/hw/intc/spapr_xive.c
+++ b/hw/intc/spapr_xive.c
@@ -754,8 +754,7 @@ static void spapr_xive_dt(SpaprInterruptController *int=
c, uint32_t nr_servers,
                      plat_res_int_priorities, sizeof(plat_res_int_prioriti=
es)));
 }
=20
-static int spapr_xive_activate(SpaprInterruptController *intc,
-                               uint32_t nr_servers, Error **errp)
+static int spapr_xive_activate(SpaprInterruptController *intc, Error **err=
p)
 {
     SpaprXive *xive =3D SPAPR_XIVE(intc);
=20
diff --git a/hw/intc/xics_spapr.c b/hw/intc/xics_spapr.c
index ce147e8980ed..8810bd93c856 100644
--- a/hw/intc/xics_spapr.c
+++ b/hw/intc/xics_spapr.c
@@ -426,8 +426,7 @@ static int xics_spapr_post_load(SpaprInterruptControlle=
r *intc, int version_id)
     return 0;
 }
=20
-static int xics_spapr_activate(SpaprInterruptController *intc,
-                               uint32_t nr_servers, Error **errp)
+static int xics_spapr_activate(SpaprInterruptController *intc, Error **err=
p)
 {
     if (kvm_enabled()) {
         return spapr_irq_init_kvm(xics_kvm_connect, intc,
diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
index be6f4041e433..f2897fbc942a 100644
--- a/hw/ppc/spapr_irq.c
+++ b/hw/ppc/spapr_irq.c
@@ -480,7 +480,6 @@ static void set_active_intc(SpaprMachineState *spapr,
                             SpaprInterruptController *new_intc)
 {
     SpaprInterruptControllerClass *sicc;
-    uint32_t nr_servers =3D spapr_max_server_number(spapr);
=20
     assert(new_intc);
=20
@@ -498,7 +497,7 @@ static void set_active_intc(SpaprMachineState *spapr,
=20
     sicc =3D SPAPR_INTC_GET_CLASS(new_intc);
     if (sicc->activate) {
-        sicc->activate(new_intc, nr_servers, &error_fatal);
+        sicc->activate(new_intc, &error_fatal);
     }
=20
     spapr->active_intc =3D new_intc;
--=20
2.26.2


