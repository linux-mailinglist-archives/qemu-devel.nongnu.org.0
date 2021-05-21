Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EC038CA64
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 17:48:15 +0200 (CEST)
Received: from localhost ([::1]:53562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk7Nm-0005oi-C8
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 11:48:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lk7L0-0003X4-9V
 for qemu-devel@nongnu.org; Fri, 21 May 2021 11:45:22 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:58302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lk7Kx-0001zE-Cs
 for qemu-devel@nongnu.org; Fri, 21 May 2021 11:45:21 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-RAaprXOKNQqOKlUeycO92Q-1; Fri, 21 May 2021 11:45:16 -0400
X-MC-Unique: RAaprXOKNQqOKlUeycO92Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A727F180FD67;
 Fri, 21 May 2021 15:45:14 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-112-49.ams2.redhat.com [10.36.112.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0762161F47;
 Fri, 21 May 2021 15:45:12 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] spapr: Make spapr_boot_set() a nop
Date: Fri, 21 May 2021 17:45:12 +0200
Message-Id: <20210521154512.1897150-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
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
Cc: pbonzini@redhat.com, qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU 6.0 moved all the -boot variables to the machine. Especially, the
removal of the boot_order static changed the handling of '-boot once'
from:

    if (boot_once) {
        qemu_boot_set(boot_once, &error_fatal);
        qemu_register_reset(restore_boot_order, g_strdup(boot_order));
    }

to

    if (current_machine->boot_once) {
        qemu_boot_set(current_machine->boot_once, &error_fatal);
        qemu_register_reset(restore_boot_order,
                            g_strdup(current_machine->boot_order));
    }

This means that we now register as subsequent boot order a copy
of current_machine->boot_once that was just set with the previous
call to qemu_boot_set(), i.e. we never transition away from the
once boot order.

It is certainly fragile^Wwrong for the spapr code to hijack a
field of the base machine type object like that. The boot order
rework simply turned this software boundary violation into an
actual bug.

Have the spapr code to handle that with its own field in
SpaprMachineState. Also kfree() the initial boot device
string when "once" was used.

Fixes: 4b7acd2ac821 ("vl: clean up -boot variables")
Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=3D1960119
Cc: pbonzini@redhat.com
Signed-off-by: Greg Kurz <groug@kaod.org>
---
 include/hw/ppc/spapr.h | 3 +++
 hw/ppc/spapr.c         | 8 +++++---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index bbf817af4647..f05219f75ef6 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -223,6 +223,9 @@ struct SpaprMachineState {
     int fwnmi_machine_check_interlock;
     QemuCond fwnmi_machine_check_interlock_cond;
=20
+    /* Set by -boot */
+    char *boot_device;
+
     /*< public >*/
     char *kvm_type;
     char *host_model;
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index c23bcc449071..4dd90b75cc52 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1005,7 +1005,7 @@ static void spapr_dt_chosen(SpaprMachineState *spapr,=
 void *fdt, bool reset)
     _FDT(chosen =3D fdt_add_subnode(fdt, 0, "chosen"));
=20
     if (reset) {
-        const char *boot_device =3D machine->boot_order;
+        const char *boot_device =3D spapr->boot_device;
         char *stdout_path =3D spapr_vio_stdout_path(spapr->vio_bus);
         size_t cb =3D 0;
         char *bootlist =3D get_boot_devices_list(&cb);
@@ -2376,8 +2376,10 @@ static SaveVMHandlers savevm_htab_handlers =3D {
 static void spapr_boot_set(void *opaque, const char *boot_device,
                            Error **errp)
 {
-    MachineState *machine =3D MACHINE(opaque);
-    machine->boot_order =3D g_strdup(boot_device);
+    SpaprMachineState *spapr =3D SPAPR_MACHINE(opaque);
+
+    g_free(spapr->boot_device);
+    spapr->boot_device =3D g_strdup(boot_device);
 }
=20
 static void spapr_create_lmb_dr_connectors(SpaprMachineState *spapr)
--=20
2.26.3


