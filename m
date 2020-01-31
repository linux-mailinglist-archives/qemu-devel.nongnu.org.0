Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C78F14E8BF
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 07:22:22 +0100 (CET)
Received: from localhost ([::1]:48888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixPh7-0002yQ-G6
	for lists+qemu-devel@lfdr.de; Fri, 31 Jan 2020 01:22:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59622)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1ixPVH-0007hz-It
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 01:10:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1ixPVF-00010O-W6
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 01:10:07 -0500
Received: from ozlabs.org ([203.11.71.1]:34403)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1ixPVF-0000we-IX; Fri, 31 Jan 2020 01:10:05 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4886Hw6BPmz9sSt; Fri, 31 Jan 2020 17:09:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1580450972;
 bh=CMV8i1Q0DUxLm1v+JtgxXzORxfe3XQG8AI5U6bX5kEo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=F+z2HxmcswGVcPT7CbFYr/NY9AAkUqnKkkaoozQ3iQ4dn107sAdFSlEmqoFAwUhbv
 0aigm+G3rSCx+5mgz7Xpnc2NVA/EfaJA3OuCcplDU31aBea2nuIlngrWifYX6lH6Fu
 rEqKd4g2JKsobxHLbl7+msYb51zxlNf7LrtEggps=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 29/34] migration: Include migration support for machine check
 handling
Date: Fri, 31 Jan 2020 17:09:19 +1100
Message-Id: <20200131060924.147449-30-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200131060924.147449-1-david@gibson.dropbear.id.au>
References: <20200131060924.147449-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 203.11.71.1
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
Cc: lvivier@redhat.com, Aravinda Prasad <arawinda.p@gmail.com>,
 qemu-devel@nongnu.org, groug@kaod.org, Ganesh Goudar <ganeshgr@linux.ibm.com>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aravinda Prasad <arawinda.p@gmail.com>

This patch includes migration support for machine check
handling. Especially this patch blocks VM migration
requests until the machine check error handling is
complete as these errors are specific to the source
hardware and is irrelevant on the target hardware.

Signed-off-by: Aravinda Prasad <arawinda.p@gmail.com>
[Do not set FWNMI cap in post_load, now its done in .apply hook]
Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
Message-Id: <20200130184423.20519-7-ganeshgr@linux.ibm.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c         | 47 ++++++++++++++++++++++++++++++++++++++++++
 hw/ppc/spapr_events.c  | 16 +++++++++++++-
 hw/ppc/spapr_rtas.c    |  2 ++
 include/hw/ppc/spapr.h |  2 ++
 4 files changed, 66 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 06e295cdf1..137f5c9a33 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -46,6 +46,7 @@
 #include "migration/qemu-file-types.h"
 #include "migration/global_state.h"
 #include "migration/register.h"
+#include "migration/blocker.h"
 #include "mmu-hash64.h"
 #include "mmu-book3s-v3.h"
 #include "cpu-models.h"
@@ -1683,6 +1684,8 @@ static void spapr_machine_reset(MachineState *machi=
ne)
=20
     /* Signal all vCPUs waiting on this condition */
     qemu_cond_broadcast(&spapr->mc_delivery_cond);
+
+    migrate_del_blocker(spapr->fwnmi_migration_blocker);
 }
=20
 static void spapr_create_nvram(SpaprMachineState *spapr)
@@ -1965,6 +1968,42 @@ static const VMStateDescription vmstate_spapr_dtb =
=3D {
     },
 };
=20
+static bool spapr_fwnmi_needed(void *opaque)
+{
+    SpaprMachineState *spapr =3D (SpaprMachineState *)opaque;
+
+    return spapr->guest_machine_check_addr !=3D -1;
+}
+
+static int spapr_fwnmi_pre_save(void *opaque)
+{
+    SpaprMachineState *spapr =3D (SpaprMachineState *)opaque;
+
+    /*
+     * Check if machine check handling is in progress and print a
+     * warning message.
+     */
+    if (spapr->mc_status !=3D -1) {
+        warn_report("A machine check is being handled during migration. =
The"
+                "handler may run and log hardware error on the destinati=
on");
+    }
+
+    return 0;
+}
+
+static const VMStateDescription vmstate_spapr_machine_check =3D {
+    .name =3D "spapr_machine_check",
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+    .needed =3D spapr_fwnmi_needed,
+    .pre_save =3D spapr_fwnmi_pre_save,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINT64(guest_machine_check_addr, SpaprMachineState),
+        VMSTATE_INT32(mc_status, SpaprMachineState),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
 static const VMStateDescription vmstate_spapr =3D {
     .name =3D "spapr",
     .version_id =3D 3,
@@ -1999,6 +2038,7 @@ static const VMStateDescription vmstate_spapr =3D {
         &vmstate_spapr_cap_large_decr,
         &vmstate_spapr_cap_ccf_assist,
         &vmstate_spapr_cap_fwnmi,
+        &vmstate_spapr_machine_check,
         NULL
     }
 };
@@ -2814,6 +2854,13 @@ static void spapr_machine_init(MachineState *machi=
ne)
         spapr_create_lmb_dr_connectors(spapr);
     }
=20
+    if (spapr_get_cap(spapr, SPAPR_CAP_FWNMI_MCE) =3D=3D SPAPR_CAP_ON) {
+        /* Create the error string for live migration blocker */
+        error_setg(&spapr->fwnmi_migration_blocker,
+            "A machine check is being handled during migration. The hand=
ler"
+            "may run and log hardware error on the destination");
+    }
+
     /* Set up RTAS event infrastructure */
     spapr_events_init(spapr);
=20
diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
index 54eaf28a9e..884e455f02 100644
--- a/hw/ppc/spapr_events.c
+++ b/hw/ppc/spapr_events.c
@@ -43,6 +43,7 @@
 #include "qemu/main-loop.h"
 #include "hw/ppc/spapr_ovec.h"
 #include <libfdt.h>
+#include "migration/blocker.h"
=20
 #define RTAS_LOG_VERSION_MASK                   0xff000000
 #define   RTAS_LOG_VERSION_6                    0x06000000
@@ -843,6 +844,8 @@ void spapr_mce_req_event(PowerPCCPU *cpu, bool recove=
red)
 {
     SpaprMachineState *spapr =3D SPAPR_MACHINE(qdev_get_machine());
     CPUState *cs =3D CPU(cpu);
+    int ret;
+    Error *local_err =3D NULL;
=20
     if (spapr->guest_machine_check_addr =3D=3D -1) {
         /*
@@ -872,8 +875,19 @@ void spapr_mce_req_event(PowerPCCPU *cpu, bool recov=
ered)
             return;
         }
     }
-    spapr->mc_status =3D cpu->vcpu_id;
=20
+    ret =3D migrate_add_blocker(spapr->fwnmi_migration_blocker, &local_e=
rr);
+    if (ret =3D=3D -EBUSY) {
+        /*
+         * We don't want to abort so we let the migration to continue.
+         * In a rare case, the machine check handler will run on the tar=
get.
+         * Though this is not preferable, it is better than aborting
+         * the migration or killing the VM.
+         */
+        warn_report("Received a fwnmi while migration was in progress");
+    }
+
+    spapr->mc_status =3D cpu->vcpu_id;
     spapr_mce_dispatch_elog(cpu, recovered);
 }
=20
diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
index 35d91260e6..883fe28465 100644
--- a/hw/ppc/spapr_rtas.c
+++ b/hw/ppc/spapr_rtas.c
@@ -50,6 +50,7 @@
 #include "hw/ppc/fdt.h"
 #include "target/ppc/mmu-hash64.h"
 #include "target/ppc/mmu-book3s-v3.h"
+#include "migration/blocker.h"
=20
 static void rtas_display_character(PowerPCCPU *cpu, SpaprMachineState *s=
papr,
                                    uint32_t token, uint32_t nargs,
@@ -452,6 +453,7 @@ static void rtas_ibm_nmi_interlock(PowerPCCPU *cpu,
     spapr->mc_status =3D -1;
     qemu_cond_signal(&spapr->mc_delivery_cond);
     rtas_st(rets, 0, RTAS_OUT_SUCCESS);
+    migrate_del_blocker(spapr->fwnmi_migration_blocker);
 }
=20
 static struct rtas_call {
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index f6f82d88aa..a1fba95c82 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -218,6 +218,8 @@ struct SpaprMachineState {
=20
     unsigned gpu_numa_id;
     SpaprTpmProxy *tpm_proxy;
+
+    Error *fwnmi_migration_blocker;
 };
=20
 #define H_SUCCESS         0
--=20
2.24.1


