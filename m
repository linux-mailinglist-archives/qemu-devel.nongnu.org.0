Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D7A477F77
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 22:43:37 +0100 (CET)
Received: from localhost ([::1]:38988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxyXI-0004G9-SN
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 16:43:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxM1-0004Lf-OF; Thu, 16 Dec 2021 15:27:53 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:4308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxLz-0007ZQ-3e; Thu, 16 Dec 2021 15:27:53 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BGJH7G4012414; 
 Thu, 16 Dec 2021 20:27:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cyq8v3qvp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:27:18 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BGKGA8V018564;
 Thu, 16 Dec 2021 20:27:17 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cyq8v3qva-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:27:17 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BGKDE5L019549;
 Thu, 16 Dec 2021 20:27:15 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 3cy78ek0sc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:27:15 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BGKRD5F46072120
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Dec 2021 20:27:13 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4A002A4062;
 Thu, 16 Dec 2021 20:27:13 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F4239A405C;
 Thu, 16 Dec 2021 20:27:12 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 16 Dec 2021 20:27:12 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.48.122])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 39192220238;
 Thu, 16 Dec 2021 21:27:12 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 085/101] target/ppc: enable PMU counter overflow with cycle
 events
Date: Thu, 16 Dec 2021 21:25:58 +0100
Message-Id: <20211216202614.414266-86-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216202614.414266-1-clg@kaod.org>
References: <20211216202614.414266-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: weP7qN7n9hLZ09D5y1BkFQfiRqKgnUU5
X-Proofpoint-GUID: EFCamlJ2B0YWqibB-vJ0tC_SzzlpRTW4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-16_08,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2112160109
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
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

The PowerISA v3.1 defines that if the proper bits are set (MMCR0_PMC1CE
for PMC1 and MMCR0_PMCjCE for the remaining PMCs), counter negative
conditions are enabled. This means that if the counter value overflows
(i.e. exceeds 0x80000000) a performance monitor alert will occur. This al=
ert
can trigger an event-based exception (to be implemented in the next patch=
es)
if the MMCR0_EBE bit is set.

For now, overflowing the counter when the PMC is counting cycles will
just trigger a performance monitor alert. This is done by starting the
overflow timer to expire in the moment the overflow would be occuring. Th=
e
timer will call fire_PMC_interrupt() (via cpu_ppc_pmu_timer_cb) which wil=
l
trigger the PMU alert and, if the conditions are met, an EBB exception.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20211201151734.654994-6-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/cpu.h        |  2 ++
 target/ppc/power8-pmu.c | 71 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 73 insertions(+)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 69cfb2e5f930..cf637f0f6dfb 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -363,6 +363,8 @@ typedef enum {
 #define MMCR0_PMCC   PPC_BITMASK(44, 45) /* PMC Control */
 #define MMCR0_FC14   PPC_BIT(58)         /* PMC Freeze Counters 1-4 bit =
*/
 #define MMCR0_FC56   PPC_BIT(59)         /* PMC Freeze Counters 5-6 bit =
*/
+#define MMCR0_PMC1CE PPC_BIT(48)         /* MMCR0 PMC1 Condition Enabled=
 */
+#define MMCR0_PMCjCE PPC_BIT(49)         /* MMCR0 PMCj Condition Enabled=
 */
 /* MMCR0 userspace r/w mask */
 #define MMCR0_UREG_MASK (MMCR0_FC | MMCR0_PMAO | MMCR0_PMAE)
 /* MMCR2 userspace r/w mask */
diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index 73252529beee..399234a2fce8 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -23,6 +23,8 @@
=20
 #if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
=20
+#define PMC_COUNTER_NEGATIVE_VAL 0x80000000UL
+
 static bool pmc_is_inactive(CPUPPCState *env, int sprn)
 {
     if (env->spr[SPR_POWER_MMCR0] & MMCR0_FC) {
@@ -36,6 +38,15 @@ static bool pmc_is_inactive(CPUPPCState *env, int sprn=
)
     return env->spr[SPR_POWER_MMCR0] & MMCR0_FC56;
 }
=20
+static bool pmc_has_overflow_enabled(CPUPPCState *env, int sprn)
+{
+    if (sprn =3D=3D SPR_POWER_PMC1) {
+        return env->spr[SPR_POWER_MMCR0] & MMCR0_PMC1CE;
+    }
+
+    return env->spr[SPR_POWER_MMCR0] & MMCR0_PMCjCE;
+}
+
 /*
  * For PMCs 1-4, IBM POWER chips has support for an implementation
  * dependent event, 0x1E, that enables cycle counting. The Linux kernel
@@ -123,6 +134,61 @@ static void pmu_update_cycles(CPUPPCState *env)
     env->pmu_base_time =3D now;
 }
=20
+/*
+ * Helper function to retrieve the cycle overflow timer of the
+ * 'sprn' counter.
+ */
+static QEMUTimer *get_cyc_overflow_timer(CPUPPCState *env, int sprn)
+{
+    return env->pmu_cyc_overflow_timers[sprn - SPR_POWER_PMC1];
+}
+
+static void pmc_update_overflow_timer(CPUPPCState *env, int sprn)
+{
+    QEMUTimer *pmc_overflow_timer =3D get_cyc_overflow_timer(env, sprn);
+    int64_t timeout;
+
+    /*
+     * PMC5 does not have an overflow timer and this pointer
+     * will be NULL.
+     */
+    if (!pmc_overflow_timer) {
+        return;
+    }
+
+    if (pmc_get_event(env, sprn) !=3D PMU_EVENT_CYCLES ||
+        !pmc_has_overflow_enabled(env, sprn)) {
+        /* Overflow timer is not needed for this counter */
+        timer_del(pmc_overflow_timer);
+        return;
+    }
+
+    if (env->spr[sprn] >=3D PMC_COUNTER_NEGATIVE_VAL) {
+        timeout =3D  0;
+    } else {
+        timeout =3D PMC_COUNTER_NEGATIVE_VAL - env->spr[sprn];
+    }
+
+    /*
+     * Use timer_mod_anticipate() because an overflow timer might
+     * be already running for this PMC.
+     */
+    timer_mod_anticipate(pmc_overflow_timer, env->pmu_base_time + timeou=
t);
+}
+
+static void pmu_update_overflow_timers(CPUPPCState *env)
+{
+    int sprn;
+
+    /*
+     * Scroll through all PMCs and start counter overflow timers for
+     * PM_CYC events, if needed.
+     */
+    for (sprn =3D SPR_POWER_PMC1; sprn <=3D SPR_POWER_PMC6; sprn++) {
+        pmc_update_overflow_timer(env, sprn);
+    }
+}
+
 void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
 {
     pmu_update_cycles(env);
@@ -131,6 +197,9 @@ void helper_store_mmcr0(CPUPPCState *env, target_ulon=
g value)
=20
     /* MMCR0 writes can change HFLAGS_PMCCCLEAR */
     hreg_compute_hflags(env);
+
+    /* Update cycle overflow timers with the current MMCR0 state */
+    pmu_update_overflow_timers(env);
 }
=20
 void helper_store_mmcr1(CPUPPCState *env, uint64_t value)
@@ -152,6 +221,8 @@ void helper_store_pmc(CPUPPCState *env, uint32_t sprn=
, uint64_t value)
     pmu_update_cycles(env);
=20
     env->spr[sprn] =3D value;
+
+    pmc_update_overflow_timer(env, sprn);
 }
=20
 static void fire_PMC_interrupt(PowerPCCPU *cpu)
--=20
2.31.1


