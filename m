Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8B013E10F
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jan 2020 17:47:38 +0100 (CET)
Received: from localhost ([::1]:44928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1is8Iy-00089T-RI
	for lists+qemu-devel@lfdr.de; Thu, 16 Jan 2020 11:47:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43703)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ganeshgr@linux.ibm.com>) id 1is8Cz-00015C-Uc
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 11:41:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ganeshgr@linux.ibm.com>) id 1is8Cw-0005z6-8o
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 11:41:25 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:5092)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ganeshgr@linux.ibm.com>)
 id 1is8Cw-0005y1-1a
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 11:41:22 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00GGcTbn146415
 for <qemu-devel@nongnu.org>; Thu, 16 Jan 2020 11:41:21 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xh8d6dhv8-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 16 Jan 2020 11:41:20 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <ganeshgr@linux.ibm.com>;
 Thu, 16 Jan 2020 16:41:18 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 16 Jan 2020 16:41:15 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00GGfEDl34406652
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Jan 2020 16:41:14 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5384AA405D;
 Thu, 16 Jan 2020 16:41:14 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2E73AA406B;
 Thu, 16 Jan 2020 16:41:12 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.49.154])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 16 Jan 2020 16:41:11 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: aik@ozlabs.ru, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au
Subject: [PATCH v19 6/7] migration: Include migration support for machine
 check handling
Date: Thu, 16 Jan 2020 22:09:51 +0530
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20200116163952.11090-1-ganeshgr@linux.ibm.com>
References: <20200116163952.11090-1-ganeshgr@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 20011616-0012-0000-0000-0000037DF004
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20011616-0013-0000-0000-000021BA2496
Message-Id: <20200116163952.11090-7-ganeshgr@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-16_05:2020-01-16,
 2020-01-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=2 adultscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001160136
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.156.1
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
Cc: paulus@ozlabs.org, Ganesh Goudar <ganeshgr@linux.ibm.com>,
 Aravinda Prasad <arawinda.p@gmail.com>, groug@kaod.org
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
---
 hw/ppc/spapr.c         | 47 ++++++++++++++++++++++++++++++++++++++++++
 hw/ppc/spapr_events.c  | 16 +++++++++++++-
 hw/ppc/spapr_rtas.c    |  4 ++++
 include/hw/ppc/spapr.h |  2 +-
 4 files changed, 67 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 46bac1a83c..c8bc2fa9f3 100644
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
@@ -1683,6 +1684,8 @@ static void spapr_machine_reset(MachineState *machine)
 
     /* Signal all vCPUs waiting on this condition */
     qemu_cond_broadcast(&spapr->mc_delivery_cond);
+
+    migrate_del_blocker(spapr->fwnmi_migration_blocker);
 }
 
 static void spapr_create_nvram(SpaprMachineState *spapr)
@@ -1965,6 +1968,42 @@ static const VMStateDescription vmstate_spapr_dtb = {
     },
 };
 
+static bool spapr_fwnmi_needed(void *opaque)
+{
+    SpaprMachineState *spapr = (SpaprMachineState *)opaque;
+
+    return spapr->guest_machine_check_addr != -1;
+}
+
+static int spapr_fwnmi_pre_save(void *opaque)
+{
+    SpaprMachineState *spapr = (SpaprMachineState *)opaque;
+
+    /*
+     * Check if machine check handling is in progress and print a
+     * warning message.
+     */
+    if (spapr->mc_status != -1) {
+        warn_report("A machine check is being handled during migration. The"
+                "handler may run and log hardware error on the destination");
+    }
+
+    return 0;
+}
+
+static const VMStateDescription vmstate_spapr_machine_check = {
+    .name = "spapr_machine_check",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = spapr_fwnmi_needed,
+    .pre_save = spapr_fwnmi_pre_save,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64(guest_machine_check_addr, SpaprMachineState),
+        VMSTATE_INT32(mc_status, SpaprMachineState),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
 static const VMStateDescription vmstate_spapr = {
     .name = "spapr",
     .version_id = 3,
@@ -1999,6 +2038,7 @@ static const VMStateDescription vmstate_spapr = {
         &vmstate_spapr_cap_large_decr,
         &vmstate_spapr_cap_ccf_assist,
         &vmstate_spapr_cap_fwnmi,
+        &vmstate_spapr_machine_check,
         NULL
     }
 };
@@ -2814,6 +2854,13 @@ static void spapr_machine_init(MachineState *machine)
         spapr_create_lmb_dr_connectors(spapr);
     }
 
+    if (spapr_get_cap(spapr, SPAPR_CAP_FWNMI_MCE) == SPAPR_CAP_ON) {
+        /* Create the error string for live migration blocker */
+        error_setg(&spapr->fwnmi_migration_blocker,
+            "A machine check is being handled during migration. The handler"
+            "may run and log hardware error on the destination");
+    }
+
     /* Set up RTAS event infrastructure */
     spapr_events_init(spapr);
 
diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
index 54eaf28a9e..884e455f02 100644
--- a/hw/ppc/spapr_events.c
+++ b/hw/ppc/spapr_events.c
@@ -43,6 +43,7 @@
 #include "qemu/main-loop.h"
 #include "hw/ppc/spapr_ovec.h"
 #include <libfdt.h>
+#include "migration/blocker.h"
 
 #define RTAS_LOG_VERSION_MASK                   0xff000000
 #define   RTAS_LOG_VERSION_6                    0x06000000
@@ -843,6 +844,8 @@ void spapr_mce_req_event(PowerPCCPU *cpu, bool recovered)
 {
     SpaprMachineState *spapr = SPAPR_MACHINE(qdev_get_machine());
     CPUState *cs = CPU(cpu);
+    int ret;
+    Error *local_err = NULL;
 
     if (spapr->guest_machine_check_addr == -1) {
         /*
@@ -872,8 +875,19 @@ void spapr_mce_req_event(PowerPCCPU *cpu, bool recovered)
             return;
         }
     }
-    spapr->mc_status = cpu->vcpu_id;
 
+    ret = migrate_add_blocker(spapr->fwnmi_migration_blocker, &local_err);
+    if (ret == -EBUSY) {
+        /*
+         * We don't want to abort so we let the migration to continue.
+         * In a rare case, the machine check handler will run on the target.
+         * Though this is not preferable, it is better than aborting
+         * the migration or killing the VM.
+         */
+        warn_report("Received a fwnmi while migration was in progress");
+    }
+
+    spapr->mc_status = cpu->vcpu_id;
     spapr_mce_dispatch_elog(cpu, recovered);
 }
 
diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
index 3f162d82f5..b1594443c7 100644
--- a/hw/ppc/spapr_rtas.c
+++ b/hw/ppc/spapr_rtas.c
@@ -50,6 +50,7 @@
 #include "hw/ppc/fdt.h"
 #include "target/ppc/mmu-hash64.h"
 #include "target/ppc/mmu-book3s-v3.h"
+#include "migration/blocker.h"
 
 static void rtas_display_character(PowerPCCPU *cpu, SpaprMachineState *spapr,
                                    uint32_t token, uint32_t nargs,
@@ -453,6 +454,9 @@ static void rtas_ibm_nmi_interlock(PowerPCCPU *cpu,
     spapr->mc_status = -1;
     qemu_cond_signal(&spapr->mc_delivery_cond);
     rtas_st(rets, 0, RTAS_OUT_SUCCESS);
+    migrate_del_blocker(spapr->fwnmi_migration_blocker);
+    error_free(spapr->fwnmi_migration_blocker);
+    spapr->fwnmi_migration_blocker = NULL;
 }
 
 static struct rtas_call {
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index a90e677cc3..12e7b1eddc 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -219,7 +219,7 @@ struct SpaprMachineState {
     unsigned gpu_numa_id;
     SpaprTpmProxy *tpm_proxy;
 
-    bool fwnmi_calls_registered;
+    Error *fwnmi_migration_blocker;
 };
 
 #define H_SUCCESS         0
-- 
2.17.2


