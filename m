Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C24884CA2E5
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 12:11:45 +0100 (CET)
Received: from localhost ([::1]:36038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPMtU-0003UT-Sf
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 06:11:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqC-0008GU-6c; Wed, 02 Mar 2022 06:08:23 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:47950
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqA-0001gL-Gz; Wed, 02 Mar 2022 06:08:19 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222AmT5C030387; 
 Wed, 2 Mar 2022 11:08:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ej75erby4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:15 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 222AmYoS030467;
 Wed, 2 Mar 2022 11:08:14 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ej75erbx6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:14 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2fP7022365;
 Wed, 2 Mar 2022 11:08:12 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03fra.de.ibm.com with ESMTP id 3efbu9d1v1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:12 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B8Ah952887946
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:10 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 736A911C054;
 Wed,  2 Mar 2022 11:08:10 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4378311C05C;
 Wed,  2 Mar 2022 11:08:10 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:10 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 91E5C2201C1;
 Wed,  2 Mar 2022 12:08:09 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 04/87] target/ppc: finalize pre-EBB PMU logic
Date: Wed,  2 Mar 2022 12:06:40 +0100
Message-Id: <20220302110803.849505-5-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: QLbaAUC96ZURK5wzySjkB0DPlL28i-Xi
X-Proofpoint-GUID: _XksxFCzjVAeNwqP2EOYZiANw1MxeI6C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 phishscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0 mlxlogscore=795
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

There are still PMU exclusive bits to handle in fire_PMC_interrupt()
before implementing the EBB support. Let's finalize it now to avoid
dealing with PMU and EBB logic at the same time in the next patches.

fire_PMC_interrupt() will fire an Performance Monitor alert depending on
MMCR0_PMAE. If we are required to freeze the timers (MMCR0_FCECE) we'll
also need to update summaries and delete the existing overflow timers.
In all cases we're going to update the cycle counters.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220225101140.1054160-3-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/power8-pmu.c | 36 ++++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index 236e8e66e966..d24566315872 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -222,6 +222,20 @@ static void pmu_update_overflow_timers(CPUPPCState *=
env)
     }
 }
=20
+static void pmu_delete_timers(CPUPPCState *env)
+{
+    QEMUTimer *pmc_overflow_timer;
+    int sprn;
+
+    for (sprn =3D SPR_POWER_PMC1; sprn <=3D SPR_POWER_PMC6; sprn++) {
+        pmc_overflow_timer =3D get_cyc_overflow_timer(env, sprn);
+
+        if (pmc_overflow_timer) {
+            timer_del(pmc_overflow_timer);
+        }
+    }
+}
+
 void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
 {
     bool hflags_pmcc0 =3D (value & MMCR0_PMCC0) !=3D 0;
@@ -271,8 +285,26 @@ static void fire_PMC_interrupt(PowerPCCPU *cpu)
 {
     CPUPPCState *env =3D &cpu->env;
=20
-    if (!(env->spr[SPR_POWER_MMCR0] & MMCR0_EBE)) {
-        return;
+    pmu_update_cycles(env);
+
+    if (env->spr[SPR_POWER_MMCR0] & MMCR0_FCECE) {
+        env->spr[SPR_POWER_MMCR0] &=3D ~MMCR0_FCECE;
+        env->spr[SPR_POWER_MMCR0] |=3D MMCR0_FC;
+
+        /* Changing MMCR0_FC requires a new HFLAGS_INSN_CNT calc */
+        pmu_update_summaries(env);
+
+        /*
+         * Delete all pending timers if we need to freeze
+         * the PMC. We'll restart them when the PMC starts
+         * running again.
+         */
+        pmu_delete_timers(env);
+    }
+
+    if (env->spr[SPR_POWER_MMCR0] & MMCR0_PMAE) {
+        env->spr[SPR_POWER_MMCR0] &=3D ~MMCR0_PMAE;
+        env->spr[SPR_POWER_MMCR0] |=3D MMCR0_PMAO;
     }
=20
     /* PMC interrupt not implemented yet */
--=20
2.34.1


