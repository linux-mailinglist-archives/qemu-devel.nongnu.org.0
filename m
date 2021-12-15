Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A06476069
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 19:14:43 +0100 (CET)
Received: from localhost ([::1]:49542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxYna-0007fv-Hi
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 13:14:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXiX-0005TM-OY; Wed, 15 Dec 2021 12:05:26 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:25098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXiV-0004pC-P1; Wed, 15 Dec 2021 12:05:25 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFGfaxD019429; 
 Wed, 15 Dec 2021 17:04:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cyh6nw43s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:56 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BFGgbL9022760;
 Wed, 15 Dec 2021 17:04:56 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cyh6nw437-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:56 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BFH2hid024816;
 Wed, 15 Dec 2021 17:04:54 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 3cy78e7kyx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:54 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BFH4q1x47317476
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 17:04:52 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E7C5542045;
 Wed, 15 Dec 2021 17:04:51 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9DCC24204B;
 Wed, 15 Dec 2021 17:04:51 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 15 Dec 2021 17:04:51 +0000 (GMT)
Received: from yukon.home (unknown [9.171.19.61])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id C27C6220295;
 Wed, 15 Dec 2021 18:04:50 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 082/102] target/ppc: introduce PMUEventType and PMU overflow
 timers
Date: Wed, 15 Dec 2021 18:03:37 +0100
Message-Id: <20211215170357.321643-70-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215170357.321643-1-clg@kaod.org>
References: <20211215165847.321042-1-clg@kaod.org>
 <20211215170357.321643-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: P_L5t_svZce0x9bJwX5WSSm-VsKFxuYO
X-Proofpoint-GUID: Q728jUbnxPb2jB4NpuJBiOxEw2IvwLY_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_10,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 phishscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1034 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112150098
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

This patch starts an IBM Power8+ compatible PMU implementation by adding
the representation of PMU events that we are going to sample,
PMUEventType. This enum represents a Perf event that is being sampled by
a specific counter 'sprn'. Events that aren't available (i.e. no event
was set in MMCR1) will be of type 'PMU_EVENT_INVALID'. Events that are
inactive due to frozen counter bits state are of type
'PMU_EVENT_INACTIVE'. Other types added in this patch are
PMU_EVENT_CYCLES and PMU_EVENT_INSTRUCTIONS.  More types will be added
later on.

Let's also add the required PMU cycle overflow timers. They will be used
to trigger cycle overflows when cycle events are being sampled. This
timer will call cpu_ppc_pmu_timer_cb(), which in turn calls
fire_PMC_interrupt().  Both functions are stubs that will be implemented
later on when EBB support is added.

Two new helper files are created to host this new logic.
cpu_ppc_pmu_init() will init all overflow timers during CPU init time.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20211201151734.654994-2-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/cpu.h        | 15 ++++++++++
 target/ppc/power8-pmu.h | 25 +++++++++++++++++
 hw/ppc/spapr_cpu_core.c |  1 +
 target/ppc/cpu_init.c   | 24 ++++++++++++++++
 target/ppc/power8-pmu.c | 62 +++++++++++++++++++++++++++++++++++++++++
 target/ppc/meson.build  |  1 +
 6 files changed, 128 insertions(+)
 create mode 100644 target/ppc/power8-pmu.h
 create mode 100644 target/ppc/power8-pmu.c

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index c07a8e9f7d4b..39fadca564bb 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -296,6 +296,15 @@ typedef struct ppc_v3_pate_t {
     uint64_t dw1;
 } ppc_v3_pate_t;
=20
+/* PMU related structs and defines */
+#define PMU_COUNTERS_NUM 6
+typedef enum {
+    PMU_EVENT_INVALID =3D 0,
+    PMU_EVENT_INACTIVE,
+    PMU_EVENT_CYCLES,
+    PMU_EVENT_INSTRUCTIONS,
+} PMUEventType;
+
 /***********************************************************************=
******/
 /* Machine state register bits definition                               =
     */
 #define MSR_SF   63 /* Sixty-four-bit mode                            hf=
lags */
@@ -1195,6 +1204,12 @@ struct CPUPPCState {
     uint32_t tm_vscr;
     uint64_t tm_dscr;
     uint64_t tm_tar;
+
+    /*
+     * Timers used to fire performance monitor alerts
+     * when counting cycles.
+     */
+    QEMUTimer *pmu_cyc_overflow_timers[PMU_COUNTERS_NUM];
 };
=20
 #define SET_FIT_PERIOD(a_, b_, c_, d_)          \
diff --git a/target/ppc/power8-pmu.h b/target/ppc/power8-pmu.h
new file mode 100644
index 000000000000..49a813a443d7
--- /dev/null
+++ b/target/ppc/power8-pmu.h
@@ -0,0 +1,25 @@
+/*
+ * PMU emulation helpers for TCG IBM POWER chips
+ *
+ *  Copyright IBM Corp. 2021
+ *
+ * Authors:
+ *  Daniel Henrique Barboza      <danielhb413@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef POWER8_PMU
+#define POWER8_PMU
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "exec/exec-all.h"
+#include "exec/helper-proto.h"
+#include "qemu/error-report.h"
+#include "qemu/main-loop.h"
+
+void cpu_ppc_pmu_init(CPUPPCState *env);
+
+#endif
diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
index 58e7341cb784..a57ba70a8781 100644
--- a/hw/ppc/spapr_cpu_core.c
+++ b/hw/ppc/spapr_cpu_core.c
@@ -20,6 +20,7 @@
 #include "target/ppc/kvm_ppc.h"
 #include "hw/ppc/ppc.h"
 #include "target/ppc/mmu-hash64.h"
+#include "target/ppc/power8-pmu.h"
 #include "sysemu/numa.h"
 #include "sysemu/reset.h"
 #include "sysemu/hw_accel.h"
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index c8e6868389cb..7c47ffd6e19b 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -45,6 +45,7 @@
 #include "helper_regs.h"
 #include "internal.h"
 #include "spr_tcg.h"
+#include "power8-pmu.h"
=20
 /* #define PPC_DEBUG_SPR */
 /* #define USE_APPLE_GDB */
@@ -6810,6 +6811,20 @@ static void register_power9_mmu_sprs(CPUPPCState *=
env)
 #endif
 }
=20
+/*
+ * Initialize PMU counter overflow timers for Power8 and
+ * newer Power chips when using TCG.
+ */
+static void init_tcg_pmu_power8(CPUPPCState *env)
+{
+#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
+    /* Init PMU overflow timers */
+    if (!kvm_enabled()) {
+        cpu_ppc_pmu_init(env);
+    }
+#endif
+}
+
 static void init_proc_book3s_common(CPUPPCState *env)
 {
     register_ne_601_sprs(env);
@@ -7127,6 +7142,9 @@ static void init_proc_POWER8(CPUPPCState *env)
     register_sdr1_sprs(env);
     register_book3s_207_dbg_sprs(env);
=20
+    /* Common TCG PMU */
+    init_tcg_pmu_power8(env);
+
     /* POWER8 Specific Registers */
     register_book3s_ids_sprs(env);
     register_rmor_sprs(env);
@@ -7321,6 +7339,9 @@ static void init_proc_POWER9(CPUPPCState *env)
     init_proc_book3s_common(env);
     register_book3s_207_dbg_sprs(env);
=20
+    /* Common TCG PMU */
+    init_tcg_pmu_power8(env);
+
     /* POWER8 Specific Registers */
     register_book3s_ids_sprs(env);
     register_amr_sprs(env);
@@ -7537,6 +7558,9 @@ static void init_proc_POWER10(CPUPPCState *env)
     init_proc_book3s_common(env);
     register_book3s_207_dbg_sprs(env);
=20
+    /* Common TCG PMU */
+    init_tcg_pmu_power8(env);
+
     /* POWER8 Specific Registers */
     register_book3s_ids_sprs(env);
     register_amr_sprs(env);
diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
new file mode 100644
index 000000000000..d443bcb6c6ca
--- /dev/null
+++ b/target/ppc/power8-pmu.c
@@ -0,0 +1,62 @@
+/*
+ * PMU emulation helpers for TCG IBM POWER chips
+ *
+ *  Copyright IBM Corp. 2021
+ *
+ * Authors:
+ *  Daniel Henrique Barboza      <danielhb413@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+
+#include "power8-pmu.h"
+#include "cpu.h"
+#include "helper_regs.h"
+#include "exec/exec-all.h"
+#include "exec/helper-proto.h"
+#include "qemu/error-report.h"
+#include "qemu/main-loop.h"
+#include "hw/ppc/ppc.h"
+
+#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
+
+static void fire_PMC_interrupt(PowerPCCPU *cpu)
+{
+    CPUPPCState *env =3D &cpu->env;
+
+    if (!(env->spr[SPR_POWER_MMCR0] & MMCR0_EBE)) {
+        return;
+    }
+
+    /* PMC interrupt not implemented yet */
+    return;
+}
+
+static void cpu_ppc_pmu_timer_cb(void *opaque)
+{
+    PowerPCCPU *cpu =3D opaque;
+
+    fire_PMC_interrupt(cpu);
+}
+
+void cpu_ppc_pmu_init(CPUPPCState *env)
+{
+    PowerPCCPU *cpu =3D env_archcpu(env);
+    int i, sprn;
+
+    for (sprn =3D SPR_POWER_PMC1; sprn <=3D SPR_POWER_PMC6; sprn++) {
+        if (sprn =3D=3D SPR_POWER_PMC5) {
+            continue;
+        }
+
+        i =3D sprn - SPR_POWER_PMC1;
+
+        env->pmu_cyc_overflow_timers[i] =3D timer_new_ns(QEMU_CLOCK_VIRT=
UAL,
+                                                       &cpu_ppc_pmu_time=
r_cb,
+                                                       cpu);
+    }
+}
+#endif /* defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY) */
diff --git a/target/ppc/meson.build b/target/ppc/meson.build
index b85f29570391..a49a8911e069 100644
--- a/target/ppc/meson.build
+++ b/target/ppc/meson.build
@@ -51,6 +51,7 @@ ppc_softmmu_ss.add(when: 'TARGET_PPC64', if_true: files=
(
   'mmu-book3s-v3.c',
   'mmu-hash64.c',
   'mmu-radix64.c',
+  'power8-pmu.c',
 ))
=20
 target_arch +=3D {'ppc': ppc_ss}
--=20
2.31.1


