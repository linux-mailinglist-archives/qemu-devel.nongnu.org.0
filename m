Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF96B483D0C
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 08:39:11 +0100 (CET)
Received: from localhost ([::1]:55012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4ePW-0000aa-Jm
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 02:39:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n4eIW-0005qE-NS; Tue, 04 Jan 2022 02:32:06 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:49104
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n4eIT-0008NC-A7; Tue, 04 Jan 2022 02:31:56 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2044DUsG008777; 
 Tue, 4 Jan 2022 07:31:45 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dcf182pjn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 07:31:45 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 2047ViEN002555;
 Tue, 4 Jan 2022 07:31:44 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dcf182pj7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 07:31:44 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2047UOXA011832;
 Tue, 4 Jan 2022 07:31:42 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 3daek96agv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 07:31:42 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2047MtA349480164
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 Jan 2022 07:22:55 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C4FBBA405F;
 Tue,  4 Jan 2022 07:31:39 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7BEDFA4055;
 Tue,  4 Jan 2022 07:31:39 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue,  4 Jan 2022 07:31:39 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.33.19])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id B06932201F1;
 Tue,  4 Jan 2022 08:31:38 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 23/26] target/ppc: Cache per-pmc insn and cycle count settings
Date: Tue,  4 Jan 2022 08:31:18 +0100
Message-Id: <20220104073121.3784280-24-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220104073121.3784280-1-clg@kaod.org>
References: <20220104073121.3784280-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mmZzYTmaGNDnMAHcB8KYyILwR3Q0O4u9
X-Proofpoint-ORIG-GUID: WPjyenBKjS-F15ETdaoJyrMKk-3A7xP9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-04_04,2022-01-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 mlxscore=0 bulkscore=0 malwarescore=0 phishscore=0
 clxscore=1034 spamscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2201040049
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) KHOP_HELO_FCRDNS=0.399,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

This is the combination of frozen bit and counter type, on a per
counter basis. So far this is only used by HFLAGS_INSN_CNT, but
will be used more later.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
[danielhb: fixed PMC4 cyc_cnt shift, insn run latch code,
           MMCR0_FC handling, "PMC[1-6]" comment]
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220103224746.167831-2-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/cpu.h         |  3 +++
 target/ppc/power8-pmu.h  | 14 +++++-----
 target/ppc/cpu_init.c    |  1 +
 target/ppc/helper_regs.c |  2 +-
 target/ppc/machine.c     |  2 ++
 target/ppc/power8-pmu.c  | 56 ++++++++++++++++++++++++++++++++--------
 6 files changed, 58 insertions(+), 20 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 4808e10ebe8b..f20d4ffa6d32 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1144,6 +1144,9 @@ struct CPUPPCState {
     /* Other registers */
     target_ulong spr[1024]; /* special purpose registers */
     ppc_spr_t spr_cb[1024];
+    /* Composite status for PMC[1-6] enabled and counting insns or cycle=
s. */
+    uint8_t pmc_ins_cnt;
+    uint8_t pmc_cyc_cnt;
     /* Vector status and control register, minus VSCR_SAT */
     uint32_t vscr;
     /* VSX registers (including FP and AVR) */
diff --git a/target/ppc/power8-pmu.h b/target/ppc/power8-pmu.h
index 3ee4b4cda5a9..a8391995618a 100644
--- a/target/ppc/power8-pmu.h
+++ b/target/ppc/power8-pmu.h
@@ -13,14 +13,12 @@
 #ifndef POWER8_PMU
 #define POWER8_PMU
=20
-#include "qemu/osdep.h"
-#include "cpu.h"
-#include "exec/exec-all.h"
-#include "exec/helper-proto.h"
-#include "qemu/error-report.h"
-#include "qemu/main-loop.h"
-
 void cpu_ppc_pmu_init(CPUPPCState *env);
-bool pmu_insn_cnt_enabled(CPUPPCState *env);
+
+#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
+void pmu_update_summaries(CPUPPCState *env);
+#else
+static inline void pmu_update_summaries(CPUPPCState *env) { }
+#endif
=20
 #endif
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 25970bd79f20..cc93bff3fac4 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -8313,6 +8313,7 @@ static void ppc_cpu_reset(DeviceState *dev)
 #endif /* CONFIG_TCG */
 #endif
=20
+    pmu_update_summaries(env);
     hreg_compute_hflags(env);
     env->reserve_addr =3D (target_ulong)-1ULL;
     /* Be sure no exception or interrupt is pending */
diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index b8479288426b..8671b7bb691f 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -123,7 +123,7 @@ static uint32_t hreg_compute_hflags_value(CPUPPCState=
 *env)
     }
=20
 #if defined(TARGET_PPC64)
-    if (pmu_insn_cnt_enabled(env)) {
+    if (env->pmc_ins_cnt) {
         hflags |=3D 1 << HFLAGS_INSN_CNT;
     }
 #endif
diff --git a/target/ppc/machine.c b/target/ppc/machine.c
index 93972df58ea9..756d8de5d8dd 100644
--- a/target/ppc/machine.c
+++ b/target/ppc/machine.c
@@ -8,6 +8,7 @@
 #include "qapi/error.h"
 #include "qemu/main-loop.h"
 #include "kvm_ppc.h"
+#include "power8-pmu.h"
=20
 static void post_load_update_msr(CPUPPCState *env)
 {
@@ -19,6 +20,7 @@ static void post_load_update_msr(CPUPPCState *env)
      */
     env->msr ^=3D env->msr_mask & ~((1ULL << MSR_TGPR) | MSR_HVB);
     ppc_store_msr(env, msr);
+    pmu_update_summaries(env);
 }
=20
 static int cpu_load_old(QEMUFile *f, void *opaque, int version_id)
diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index 08d1902cd5d6..1f4f6119943a 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -11,8 +11,6 @@
  */
=20
 #include "qemu/osdep.h"
-
-#include "power8-pmu.h"
 #include "cpu.h"
 #include "helper_regs.h"
 #include "exec/exec-all.h"
@@ -20,6 +18,7 @@
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "hw/ppc/ppc.h"
+#include "power8-pmu.h"
=20
 #if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
=20
@@ -121,18 +120,52 @@ static PMUEventType pmc_get_event(CPUPPCState *env,=
 int sprn)
     return evt_type;
 }
=20
-bool pmu_insn_cnt_enabled(CPUPPCState *env)
+void pmu_update_summaries(CPUPPCState *env)
 {
-    int sprn;
+    target_ulong mmcr0 =3D env->spr[SPR_POWER_MMCR0];
+    target_ulong mmcr1 =3D env->spr[SPR_POWER_MMCR1];
+    int ins_cnt =3D 0;
+    int cyc_cnt =3D 0;
=20
-    for (sprn =3D SPR_POWER_PMC1; sprn <=3D SPR_POWER_PMC5; sprn++) {
-        if (pmc_get_event(env, sprn) =3D=3D PMU_EVENT_INSTRUCTIONS ||
-            pmc_get_event(env, sprn) =3D=3D PMU_EVENT_INSN_RUN_LATCH) {
-            return true;
+    if (mmcr0 & MMCR0_FC) {
+        goto hflags_calc;
+    }
+
+    if (!(mmcr0 & MMCR0_FC14) && mmcr1 !=3D 0) {
+        target_ulong sel;
+
+        sel =3D extract64(mmcr1, MMCR1_PMC1EVT_EXTR, MMCR1_EVT_SIZE);
+        switch (sel) {
+        case 0x02:
+        case 0xfe:
+            ins_cnt |=3D 1 << 1;
+            break;
+        case 0x1e:
+        case 0xf0:
+            cyc_cnt |=3D 1 << 1;
+            break;
         }
+
+        sel =3D extract64(mmcr1, MMCR1_PMC2EVT_EXTR, MMCR1_EVT_SIZE);
+        ins_cnt |=3D (sel =3D=3D 0x02) << 2;
+        cyc_cnt |=3D (sel =3D=3D 0x1e) << 2;
+
+        sel =3D extract64(mmcr1, MMCR1_PMC3EVT_EXTR, MMCR1_EVT_SIZE);
+        ins_cnt |=3D (sel =3D=3D 0x02) << 3;
+        cyc_cnt |=3D (sel =3D=3D 0x1e) << 3;
+
+        sel =3D extract64(mmcr1, MMCR1_PMC4EVT_EXTR, MMCR1_EVT_SIZE);
+        ins_cnt |=3D ((sel =3D=3D 0xfa) || (sel =3D=3D 0x2)) << 4;
+        cyc_cnt |=3D (sel =3D=3D 0x1e) << 4;
     }
=20
-    return false;
+    ins_cnt |=3D !(mmcr0 & MMCR0_FC56) << 5;
+    cyc_cnt |=3D !(mmcr0 & MMCR0_FC56) << 6;
+
+ hflags_calc:
+    env->pmc_ins_cnt =3D ins_cnt;
+    env->pmc_cyc_cnt =3D cyc_cnt;
+    env->hflags =3D deposit32(env->hflags, HFLAGS_INSN_CNT, 1, ins_cnt !=
=3D 0);
 }
=20
 static bool pmu_increment_insns(CPUPPCState *env, uint32_t num_insns)
@@ -264,8 +297,9 @@ void helper_store_mmcr0(CPUPPCState *env, target_ulon=
g value)
=20
     env->spr[SPR_POWER_MMCR0] =3D value;
=20
-    /* MMCR0 writes can change HFLAGS_PMCCCLEAR and HFLAGS_INSN_CNT */
+    /* MMCR0 writes can change HFLAGS_PMCC[01] and HFLAGS_INSN_CNT */
     hreg_compute_hflags(env);
+    pmu_update_summaries(env);
=20
     /* Update cycle overflow timers with the current MMCR0 state */
     pmu_update_overflow_timers(env);
@@ -278,7 +312,7 @@ void helper_store_mmcr1(CPUPPCState *env, uint64_t va=
lue)
     env->spr[SPR_POWER_MMCR1] =3D value;
=20
     /* MMCR1 writes can change HFLAGS_INSN_CNT */
-    hreg_compute_hflags(env);
+    pmu_update_summaries(env);
 }
=20
 target_ulong helper_read_pmc(CPUPPCState *env, uint32_t sprn)
--=20
2.31.1


