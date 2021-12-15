Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A8D47610F
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 19:49:57 +0100 (CET)
Received: from localhost ([::1]:54958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxZLg-0001XR-11
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 13:49:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXik-0005aV-2Y; Wed, 15 Dec 2021 12:05:38 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:26668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXid-0004tH-Dv; Wed, 15 Dec 2021 12:05:37 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFGfZYf010436; 
 Wed, 15 Dec 2021 17:04:58 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cye72sp78-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:58 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BFGxPBp002598;
 Wed, 15 Dec 2021 17:04:57 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cye72sp67-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:57 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BFH2iVZ004364;
 Wed, 15 Dec 2021 17:04:55 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3cy7jqyfjy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:55 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BFH4qxP44106186
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 17:04:52 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B23EF4204B;
 Wed, 15 Dec 2021 17:04:52 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6870C42045;
 Wed, 15 Dec 2021 17:04:52 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 15 Dec 2021 17:04:52 +0000 (GMT)
Received: from yukon.home (unknown [9.171.19.61])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 8E98C220247;
 Wed, 15 Dec 2021 18:04:51 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 083/102] target/ppc: PMU basic cycle count for pseries TCG
Date: Wed, 15 Dec 2021 18:03:38 +0100
Message-Id: <20211215170357.321643-71-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215170357.321643-1-clg@kaod.org>
References: <20211215165847.321042-1-clg@kaod.org>
 <20211215170357.321643-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: fryuropMF4lLCCIah4B9Q9lPaHxWdixZ
X-Proofpoint-ORIG-GUID: UfypKbMr5Zb3CAfXQCgur22o78zkUZ-w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_10,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 bulkscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 mlxscore=0 suspectscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112150098
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

This patch adds the barebones of the PMU logic by enabling cycle
counting. The overall logic goes as follows:

- MMCR0 reg initial value is set to 0x80000000 (MMCR0_FC set) to avoid
having to spin the PMU right at system init;

- to retrieve the events that are being profiled, pmc_get_event() will
check the current MMCR0 and MMCR1 value and return the appropriate
PMUEventType. For PMCs 1-4, event 0x2 is the implementation dependent
value of PMU_EVENT_INSTRUCTIONS and event 0x1E is the implementation
dependent value of PMU_EVENT_CYCLES. These events are supported by IBM
Power chips since Power8, at least, and the Linux Perf driver makes use
of these events until kernel v5.15. For PMC1, event 0xF0 is the
architected PowerISA event for cycles. Event 0xFE is the architected
PowerISA event for instructions;

- if the counter is frozen, either via the global MMCR0_FC bit or its
individual frozen counter bits, PMU_EVENT_INACTIVE is returned;

- pmu_update_cycles() will go through each counter and update the
values of all PMCs that are counting cycles. This function will be
called every time a MMCR0 update is done to keep counters values
up to date. Upcoming patches will use this function to allow the
counters to be properly updated during read/write of the PMCs
and MMCR1 writes.

Given that the base CPU frequency is fixed at 1Ghz for both powernv and
pseries clock, cycle calculation assumes that 1 nanosecond equals 1 CPU
cycle. Cycle value is then calculated by adding the elapsed time, in
nanoseconds, of the last cycle update done via pmu_update_cycles().

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20211201151734.654994-3-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/cpu.h                 |  20 ++++++
 target/ppc/helper.h              |   1 +
 target/ppc/spr_tcg.h             |   1 +
 target/ppc/cpu_init.c            |   6 +-
 target/ppc/power8-pmu.c          | 110 +++++++++++++++++++++++++++++++
 target/ppc/power8-pmu-regs.c.inc |  23 ++++++-
 6 files changed, 157 insertions(+), 4 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 39fadca564bb..69cfb2e5f930 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -360,6 +360,9 @@ typedef enum {
 #define MMCR0_FCECE  PPC_BIT(38)         /* FC on Enabled Cond or Event =
*/
 #define MMCR0_PMCC0  PPC_BIT(44)         /* PMC Control bit 0 */
 #define MMCR0_PMCC1  PPC_BIT(45)         /* PMC Control bit 1 */
+#define MMCR0_PMCC   PPC_BITMASK(44, 45) /* PMC Control */
+#define MMCR0_FC14   PPC_BIT(58)         /* PMC Freeze Counters 1-4 bit =
*/
+#define MMCR0_FC56   PPC_BIT(59)         /* PMC Freeze Counters 5-6 bit =
*/
 /* MMCR0 userspace r/w mask */
 #define MMCR0_UREG_MASK (MMCR0_FC | MMCR0_PMAO | MMCR0_PMAE)
 /* MMCR2 userspace r/w mask */
@@ -372,6 +375,17 @@ typedef enum {
 #define MMCR2_UREG_MASK (MMCR2_FC1P0 | MMCR2_FC2P0 | MMCR2_FC3P0 | \
                          MMCR2_FC4P0 | MMCR2_FC5P0 | MMCR2_FC6P0)
=20
+#define MMCR1_EVT_SIZE 8
+/* extract64() does a right shift before extracting */
+#define MMCR1_PMC1SEL_START 32
+#define MMCR1_PMC1EVT_EXTR (64 - MMCR1_PMC1SEL_START - MMCR1_EVT_SIZE)
+#define MMCR1_PMC2SEL_START 40
+#define MMCR1_PMC2EVT_EXTR (64 - MMCR1_PMC2SEL_START - MMCR1_EVT_SIZE)
+#define MMCR1_PMC3SEL_START 48
+#define MMCR1_PMC3EVT_EXTR (64 - MMCR1_PMC3SEL_START - MMCR1_EVT_SIZE)
+#define MMCR1_PMC4SEL_START 56
+#define MMCR1_PMC4EVT_EXTR (64 - MMCR1_PMC4SEL_START - MMCR1_EVT_SIZE)
+
 /* LPCR bits */
 #define LPCR_VPM0         PPC_BIT(0)
 #define LPCR_VPM1         PPC_BIT(1)
@@ -1210,6 +1224,12 @@ struct CPUPPCState {
      * when counting cycles.
      */
     QEMUTimer *pmu_cyc_overflow_timers[PMU_COUNTERS_NUM];
+
+    /*
+     * PMU base time value used by the PMU to calculate
+     * running cycles.
+     */
+    uint64_t pmu_base_time;
 };
=20
 #define SET_FIT_PERIOD(a_, b_, c_, d_)          \
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index d166323b641c..0e6cf2d09d4e 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -20,6 +20,7 @@ DEF_HELPER_1(rfscv, void, env)
 DEF_HELPER_1(hrfid, void, env)
 DEF_HELPER_2(store_lpcr, void, env, tl)
 DEF_HELPER_2(store_pcr, void, env, tl)
+DEF_HELPER_2(store_mmcr0, void, env, tl)
 #endif
 DEF_HELPER_1(check_tlb_flush_local, void, env)
 DEF_HELPER_1(check_tlb_flush_global, void, env)
diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
index 520f1ef23336..eb1d0c2bf0dc 100644
--- a/target/ppc/spr_tcg.h
+++ b/target/ppc/spr_tcg.h
@@ -25,6 +25,7 @@
 void spr_noaccess(DisasContext *ctx, int gprn, int sprn);
 void spr_read_generic(DisasContext *ctx, int gprn, int sprn);
 void spr_write_generic(DisasContext *ctx, int sprn, int gprn);
+void spr_write_MMCR0(DisasContext *ctx, int sprn, int gprn);
 void spr_read_xer(DisasContext *ctx, int gprn, int sprn);
 void spr_write_xer(DisasContext *ctx, int sprn, int gprn);
 void spr_read_lr(DisasContext *ctx, int gprn, int sprn);
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 7c47ffd6e19b..cfa605a76b84 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6254,8 +6254,8 @@ static void register_book3s_pmu_sup_sprs(CPUPPCStat=
e *env)
 {
     spr_register_kvm(env, SPR_POWER_MMCR0, "MMCR0",
                      SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
-                     KVM_REG_PPC_MMCR0, 0x00000000);
+                     &spr_read_generic, &spr_write_MMCR0,
+                     KVM_REG_PPC_MMCR0, 0x80000000);
     spr_register_kvm(env, SPR_POWER_MMCR1, "MMCR1",
                      SPR_NOACCESS, SPR_NOACCESS,
                      &spr_read_generic, &spr_write_generic,
@@ -6303,7 +6303,7 @@ static void register_book3s_pmu_user_sprs(CPUPPCSta=
te *env)
     spr_register(env, SPR_POWER_UMMCR0, "UMMCR0",
                  &spr_read_MMCR0_ureg, &spr_write_MMCR0_ureg,
                  &spr_read_ureg, &spr_write_ureg,
-                 0x00000000);
+                 0x80000000);
     spr_register(env, SPR_POWER_UMMCR1, "UMMCR1",
                  &spr_read_ureg, SPR_NOACCESS,
                  &spr_read_ureg, &spr_write_ureg,
diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index d443bcb6c6ca..5e689144d712 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -23,6 +23,116 @@
=20
 #if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
=20
+static bool pmc_is_inactive(CPUPPCState *env, int sprn)
+{
+    if (env->spr[SPR_POWER_MMCR0] & MMCR0_FC) {
+        return true;
+    }
+
+    if (sprn < SPR_POWER_PMC5) {
+        return env->spr[SPR_POWER_MMCR0] & MMCR0_FC14;
+    }
+
+    return env->spr[SPR_POWER_MMCR0] & MMCR0_FC56;
+}
+
+/*
+ * For PMCs 1-4, IBM POWER chips has support for an implementation
+ * dependent event, 0x1E, that enables cycle counting. The Linux kernel
+ * makes extensive use of 0x1E, so let's also support it.
+ *
+ * Likewise, event 0x2 is an implementation-dependent event that IBM
+ * POWER chips implement (at least since POWER8) that is equivalent to
+ * PM_INST_CMPL. Let's support this event on PMCs 1-4 as well.
+ */
+static PMUEventType pmc_get_event(CPUPPCState *env, int sprn)
+{
+    uint8_t mmcr1_evt_extr[] =3D { MMCR1_PMC1EVT_EXTR, MMCR1_PMC2EVT_EXT=
R,
+                                 MMCR1_PMC3EVT_EXTR, MMCR1_PMC4EVT_EXTR =
};
+    PMUEventType evt_type =3D PMU_EVENT_INVALID;
+    uint8_t pmcsel;
+    int i;
+
+    if (pmc_is_inactive(env, sprn)) {
+        return PMU_EVENT_INACTIVE;
+    }
+
+    if (sprn =3D=3D SPR_POWER_PMC5) {
+        return PMU_EVENT_INSTRUCTIONS;
+    }
+
+    if (sprn =3D=3D SPR_POWER_PMC6) {
+        return PMU_EVENT_CYCLES;
+    }
+
+    i =3D sprn - SPR_POWER_PMC1;
+    pmcsel =3D extract64(env->spr[SPR_POWER_MMCR1], mmcr1_evt_extr[i],
+                       MMCR1_EVT_SIZE);
+
+    switch (pmcsel) {
+    case 0x2:
+        evt_type =3D PMU_EVENT_INSTRUCTIONS;
+        break;
+    case 0x1E:
+        evt_type =3D PMU_EVENT_CYCLES;
+        break;
+    case 0xF0:
+        /*
+         * PMC1SEL =3D 0xF0 is the architected PowerISA v3.1
+         * event that counts cycles using PMC1.
+         */
+        if (sprn =3D=3D SPR_POWER_PMC1) {
+            evt_type =3D PMU_EVENT_CYCLES;
+        }
+        break;
+    case 0xFE:
+        /*
+         * PMC1SEL =3D 0xFE is the architected PowerISA v3.1
+         * event to sample instructions using PMC1.
+         */
+        if (sprn =3D=3D SPR_POWER_PMC1) {
+            evt_type =3D PMU_EVENT_INSTRUCTIONS;
+        }
+        break;
+    default:
+        break;
+    }
+
+    return evt_type;
+}
+
+static void pmu_update_cycles(CPUPPCState *env)
+{
+    uint64_t now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    uint64_t time_delta =3D now - env->pmu_base_time;
+    int sprn;
+
+    for (sprn =3D SPR_POWER_PMC1; sprn <=3D SPR_POWER_PMC6; sprn++) {
+        if (pmc_get_event(env, sprn) !=3D PMU_EVENT_CYCLES) {
+            continue;
+        }
+
+        /*
+         * The pseries and powernv clock runs at 1Ghz, meaning
+         * that 1 nanosec equals 1 cycle.
+         */
+        env->spr[sprn] +=3D time_delta;
+    }
+
+    /* Update base_time for future calculations */
+    env->pmu_base_time =3D now;
+}
+
+void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
+{
+    pmu_update_cycles(env);
+
+    env->spr[SPR_POWER_MMCR0] =3D value;
+
+    /* MMCR0 writes can change HFLAGS_PMCCCLEAR */
+    hreg_compute_hflags(env);
+}
+
 static void fire_PMC_interrupt(PowerPCCPU *cpu)
 {
     CPUPPCState *env =3D &cpu->env;
diff --git a/target/ppc/power8-pmu-regs.c.inc b/target/ppc/power8-pmu-reg=
s.c.inc
index 739185123827..fbb89776414e 100644
--- a/target/ppc/power8-pmu-regs.c.inc
+++ b/target/ppc/power8-pmu-regs.c.inc
@@ -104,6 +104,17 @@ void spr_read_MMCR0_ureg(DisasContext *ctx, int gprn=
, int sprn)
     tcg_temp_free(t0);
 }
=20
+static void write_MMCR0_common(DisasContext *ctx, TCGv val)
+{
+    /*
+     * helper_store_mmcr0 will make clock based operations that
+     * will cause 'bad icount read' errors if we do not execute
+     * gen_icount_io_start() beforehand.
+     */
+    gen_icount_io_start(ctx);
+    gen_helper_store_mmcr0(cpu_env, val);
+}
+
 void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn, int gprn)
 {
     TCGv masked_gprn;
@@ -119,7 +130,7 @@ void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn=
, int gprn)
      */
     masked_gprn =3D masked_gprn_for_spr_write(gprn, SPR_POWER_MMCR0,
                                             MMCR0_UREG_MASK);
-    gen_store_spr(SPR_POWER_MMCR0, masked_gprn);
+    write_MMCR0_common(ctx, masked_gprn);
=20
     tcg_temp_free(masked_gprn);
 }
@@ -219,6 +230,11 @@ void spr_write_PMC56_ureg(DisasContext *ctx, int spr=
n, int gprn)
     /* The remaining steps are similar to PMCs 1-4 userspace write */
     spr_write_PMC14_ureg(ctx, sprn, gprn);
 }
+
+void spr_write_MMCR0(DisasContext *ctx, int sprn, int gprn)
+{
+    write_MMCR0_common(ctx, cpu_gpr[gprn]);
+}
 #else
 void spr_read_MMCR0_ureg(DisasContext *ctx, int gprn, int sprn)
 {
@@ -259,4 +275,9 @@ void spr_write_PMC56_ureg(DisasContext *ctx, int sprn=
, int gprn)
 {
     spr_noaccess(ctx, gprn, sprn);
 }
+
+void spr_write_MMCR0(DisasContext *ctx, int sprn, int gprn)
+{
+    spr_write_generic(ctx, sprn, gprn);
+}
 #endif /* defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY) */
--=20
2.31.1


