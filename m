Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D34FE4CA339
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 12:17:45 +0100 (CET)
Received: from localhost ([::1]:53088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPMzI-0006cX-Uq
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 06:17:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqK-0008QE-A1; Wed, 02 Mar 2022 06:08:28 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:31628
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqH-0001hq-Ge; Wed, 02 Mar 2022 06:08:28 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222Am3dT002383; 
 Wed, 2 Mar 2022 11:08:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ej7570dw7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:16 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 222B63Js006056;
 Wed, 2 Mar 2022 11:08:15 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ej7570dum-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:15 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2mPL022555;
 Wed, 2 Mar 2022 11:08:14 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3efbu9efh9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:13 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B8BYC40632678
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:11 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C06F011C054;
 Wed,  2 Mar 2022 11:08:11 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7EEDE11C05C;
 Wed,  2 Mar 2022 11:08:11 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:11 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id C61E22201C1;
 Wed,  2 Mar 2022 12:08:10 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 06/87] target/ppc: trigger PERFM EBBs from power8-pmu.c
Date: Wed,  2 Mar 2022 12:06:42 +0100
Message-Id: <20220302110803.849505-7-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YAPa02sXCtZpvBpkfIt_o7-dmL-hrzwq
X-Proofpoint-ORIG-GUID: kmJhIw4CLx5gsOb_rsMHpuAN9GqycOO7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=890 priorityscore=1501 mlxscore=0 spamscore=0 clxscore=1034
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203020047
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.187,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

From: Daniel Henrique Barboza <danielhb413@gmail.com>

This patch adds the EBB exception support that are triggered by
Performance Monitor alerts. This happens when a Performance Monitor
alert occurs and MMCR0_EBE, BESCR_PME and BESCR_GE are set.

fire_PMC_interrupt() will execute the raise_ebb_perfm_exception() helper
which will check for MMCR0_EBE, BESCR_PME and BESCR_GE bits. If all bits
are set, do_ebb() will attempt to trigger a PERFM EBB event.

If the EBB facility is enabled in both FSCR and HFSCR we consider that
the EBB is valid and set BESCR_PMEO. After that, if we're running in
problem state, fire a POWERPC_EXCP_PERM_EBB immediately. Otherwise we'll
queue a PPC_INTERRUPT_EBB.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220225101140.1054160-5-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/cpu.h         |  5 +++++
 target/ppc/excp_helper.c | 48 ++++++++++++++++++++++++++++++++++++++++
 target/ppc/power8-pmu.c  |  3 +--
 3 files changed, 54 insertions(+), 2 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 79375e8df489..1b687521c76c 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -2502,6 +2502,11 @@ void QEMU_NORETURN raise_exception_err(CPUPPCState=
 *env, uint32_t exception,
 void QEMU_NORETURN raise_exception_err_ra(CPUPPCState *env, uint32_t exc=
eption,
                                           uint32_t error_code, uintptr_t=
 raddr);
=20
+/* PERFM EBB helper*/
+#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
+void raise_ebb_perfm_exception(CPUPPCState *env);
+#endif
+
 #if !defined(CONFIG_USER_ONLY)
 static inline int booke206_tlbm_id(CPUPPCState *env, ppcmas_tlb_t *tlbm)
 {
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 5e7d29ae0081..d3e2cfcd7120 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -2066,6 +2066,54 @@ void helper_rfebb(CPUPPCState *env, target_ulong s=
)
         env->spr[SPR_BESCR] &=3D ~BESCR_GE;
     }
 }
+
+/*
+ * Triggers or queues an 'ebb_excp' EBB exception. All checks
+ * but FSCR, HFSCR and msr_pr must be done beforehand.
+ *
+ * PowerISA v3.1 isn't clear about whether an EBB should be
+ * postponed or cancelled if the EBB facility is unavailable.
+ * Our assumption here is that the EBB is cancelled if both
+ * FSCR and HFSCR EBB facilities aren't available.
+ */
+static void do_ebb(CPUPPCState *env, int ebb_excp)
+{
+    PowerPCCPU *cpu =3D env_archcpu(env);
+    CPUState *cs =3D CPU(cpu);
+
+    /*
+     * FSCR_EBB and FSCR_IC_EBB are the same bits used with
+     * HFSCR.
+     */
+    helper_fscr_facility_check(env, FSCR_EBB, 0, FSCR_IC_EBB);
+    helper_hfscr_facility_check(env, FSCR_EBB, "EBB", FSCR_IC_EBB);
+
+    if (ebb_excp =3D=3D POWERPC_EXCP_PERFM_EBB) {
+        env->spr[SPR_BESCR] |=3D BESCR_PMEO;
+    } else if (ebb_excp =3D=3D POWERPC_EXCP_EXTERNAL_EBB) {
+        env->spr[SPR_BESCR] |=3D BESCR_EEO;
+    }
+
+    if (msr_pr =3D=3D 1) {
+        powerpc_excp(cpu, ebb_excp);
+    } else {
+        env->pending_interrupts |=3D 1 << PPC_INTERRUPT_EBB;
+        cpu_interrupt(cs, CPU_INTERRUPT_HARD);
+    }
+}
+
+void raise_ebb_perfm_exception(CPUPPCState *env)
+{
+    bool perfm_ebb_enabled =3D env->spr[SPR_POWER_MMCR0] & MMCR0_EBE &&
+                             env->spr[SPR_BESCR] & BESCR_PME &&
+                             env->spr[SPR_BESCR] & BESCR_GE;
+
+    if (!perfm_ebb_enabled) {
+        return;
+    }
+
+    do_ebb(env, POWERPC_EXCP_PERFM_EBB);
+}
 #endif
=20
 /***********************************************************************=
******/
diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index d24566315872..beeab5c494e1 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -307,8 +307,7 @@ static void fire_PMC_interrupt(PowerPCCPU *cpu)
         env->spr[SPR_POWER_MMCR0] |=3D MMCR0_PMAO;
     }
=20
-    /* PMC interrupt not implemented yet */
-    return;
+    raise_ebb_perfm_exception(env);
 }
=20
 /* This helper assumes that the PMC is running. */
--=20
2.34.1


