Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB464483D55
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 08:57:29 +0100 (CET)
Received: from localhost ([::1]:34708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4ehE-000097-Ti
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 02:57:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n4eIs-0005x8-HT; Tue, 04 Jan 2022 02:32:18 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:43766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n4eIq-0008Nn-O8; Tue, 04 Jan 2022 02:32:18 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2044mWYN007961; 
 Tue, 4 Jan 2022 07:31:46 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dcfhn27km-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 07:31:45 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2047O1ws030589;
 Tue, 4 Jan 2022 07:31:43 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 3daek9f62b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 07:31:43 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2047Mus638076736
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 Jan 2022 07:22:56 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E2D9A42049;
 Tue,  4 Jan 2022 07:31:40 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A820142041;
 Tue,  4 Jan 2022 07:31:40 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue,  4 Jan 2022 07:31:40 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.33.19])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 08B5D2201F1;
 Tue,  4 Jan 2022 08:31:39 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 25/26] target/ppc: Use env->pnc_cyc_cnt
Date: Tue,  4 Jan 2022 08:31:20 +0100
Message-Id: <20220104073121.3784280-26-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220104073121.3784280-1-clg@kaod.org>
References: <20220104073121.3784280-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ZbjZ8v4FYlZicBtLq8Aat4Figfn5Yiv_
X-Proofpoint-ORIG-GUID: ZbjZ8v4FYlZicBtLq8Aat4Figfn5Yiv_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-04_04,2022-01-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 priorityscore=1501
 clxscore=1034 mlxscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201040049
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: 7
X-Spam_score: 0.7
X-Spam_bar: /
X-Spam_report: (0.7 / 5.0 requ) SPF_HELO_NONE=0.001,
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Use the cached pmc_cyc_cnt value in pmu_update_cycles
and pmc_update_overflow_timer.  This leaves pmc_get_event
and pmc_is_inactive unused, so remove them.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220103224746.167831-4-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/power8-pmu.c | 107 ++++------------------------------------
 1 file changed, 9 insertions(+), 98 deletions(-)

diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index 27c4c7915bf3..73713ca2a320 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -24,19 +24,6 @@
=20
 #define PMC_COUNTER_NEGATIVE_VAL 0x80000000UL
=20
-static bool pmc_is_inactive(CPUPPCState *env, int sprn)
-{
-    if (env->spr[SPR_POWER_MMCR0] & MMCR0_FC) {
-        return true;
-    }
-
-    if (sprn < SPR_POWER_PMC5) {
-        return env->spr[SPR_POWER_MMCR0] & MMCR0_FC14;
-    }
-
-    return env->spr[SPR_POWER_MMCR0] & MMCR0_FC56;
-}
-
 static bool pmc_has_overflow_enabled(CPUPPCState *env, int sprn)
 {
     if (sprn =3D=3D SPR_POWER_PMC1) {
@@ -46,80 +33,6 @@ static bool pmc_has_overflow_enabled(CPUPPCState *env,=
 int sprn)
     return env->spr[SPR_POWER_MMCR0] & MMCR0_PMCjCE;
 }
=20
-/*
- * For PMCs 1-4, IBM POWER chips has support for an implementation
- * dependent event, 0x1E, that enables cycle counting. The Linux kernel
- * makes extensive use of 0x1E, so let's also support it.
- *
- * Likewise, event 0x2 is an implementation-dependent event that IBM
- * POWER chips implement (at least since POWER8) that is equivalent to
- * PM_INST_CMPL. Let's support this event on PMCs 1-4 as well.
- */
-static PMUEventType pmc_get_event(CPUPPCState *env, int sprn)
-{
-    uint8_t mmcr1_evt_extr[] =3D { MMCR1_PMC1EVT_EXTR, MMCR1_PMC2EVT_EXT=
R,
-                                 MMCR1_PMC3EVT_EXTR, MMCR1_PMC4EVT_EXTR =
};
-    PMUEventType evt_type =3D PMU_EVENT_INVALID;
-    uint8_t pmcsel;
-    int i;
-
-    if (pmc_is_inactive(env, sprn)) {
-        return PMU_EVENT_INACTIVE;
-    }
-
-    if (sprn =3D=3D SPR_POWER_PMC5) {
-        return PMU_EVENT_INSTRUCTIONS;
-    }
-
-    if (sprn =3D=3D SPR_POWER_PMC6) {
-        return PMU_EVENT_CYCLES;
-    }
-
-    i =3D sprn - SPR_POWER_PMC1;
-    pmcsel =3D extract64(env->spr[SPR_POWER_MMCR1], mmcr1_evt_extr[i],
-                       MMCR1_EVT_SIZE);
-
-    switch (pmcsel) {
-    case 0x2:
-        evt_type =3D PMU_EVENT_INSTRUCTIONS;
-        break;
-    case 0x1E:
-        evt_type =3D PMU_EVENT_CYCLES;
-        break;
-    case 0xF0:
-        /*
-         * PMC1SEL =3D 0xF0 is the architected PowerISA v3.1
-         * event that counts cycles using PMC1.
-         */
-        if (sprn =3D=3D SPR_POWER_PMC1) {
-            evt_type =3D PMU_EVENT_CYCLES;
-        }
-        break;
-    case 0xFA:
-        /*
-         * PMC4SEL =3D 0xFA is the "instructions completed
-         * with run latch set" event.
-         */
-        if (sprn =3D=3D SPR_POWER_PMC4) {
-            evt_type =3D PMU_EVENT_INSN_RUN_LATCH;
-        }
-        break;
-    case 0xFE:
-        /*
-         * PMC1SEL =3D 0xFE is the architected PowerISA v3.1
-         * event to sample instructions using PMC1.
-         */
-        if (sprn =3D=3D SPR_POWER_PMC1) {
-            evt_type =3D PMU_EVENT_INSTRUCTIONS;
-        }
-        break;
-    default:
-        break;
-    }
-
-    return evt_type;
-}
-
 void pmu_update_summaries(CPUPPCState *env)
 {
     target_ulong mmcr0 =3D env->spr[SPR_POWER_MMCR0];
@@ -238,18 +151,16 @@ static void pmu_update_cycles(CPUPPCState *env)
 {
     uint64_t now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
     uint64_t time_delta =3D now - env->pmu_base_time;
-    int sprn;
+    int sprn, cyc_cnt =3D env->pmc_cyc_cnt;
=20
     for (sprn =3D SPR_POWER_PMC1; sprn <=3D SPR_POWER_PMC6; sprn++) {
-        if (pmc_get_event(env, sprn) !=3D PMU_EVENT_CYCLES) {
-            continue;
+        if (cyc_cnt & (1 << (sprn - SPR_POWER_PMC1 + 1))) {
+            /*
+             * The pseries and powernv clock runs at 1Ghz, meaning
+             * that 1 nanosec equals 1 cycle.
+             */
+            env->spr[sprn] +=3D time_delta;
         }
-
-        /*
-         * The pseries and powernv clock runs at 1Ghz, meaning
-         * that 1 nanosec equals 1 cycle.
-         */
-        env->spr[sprn] +=3D time_delta;
     }
=20
     /* Update base_time for future calculations */
@@ -278,7 +189,7 @@ static void pmc_update_overflow_timer(CPUPPCState *en=
v, int sprn)
         return;
     }
=20
-    if (pmc_get_event(env, sprn) !=3D PMU_EVENT_CYCLES ||
+    if (!(env->pmc_cyc_cnt & (1 << (sprn - SPR_POWER_PMC1 + 1))) ||
         !pmc_has_overflow_enabled(env, sprn)) {
         /* Overflow timer is not needed for this counter */
         timer_del(pmc_overflow_timer);
@@ -286,7 +197,7 @@ static void pmc_update_overflow_timer(CPUPPCState *en=
v, int sprn)
     }
=20
     if (env->spr[sprn] >=3D PMC_COUNTER_NEGATIVE_VAL) {
-        timeout =3D  0;
+        timeout =3D 0;
     } else {
         timeout =3D PMC_COUNTER_NEGATIVE_VAL - env->spr[sprn];
     }
--=20
2.31.1


