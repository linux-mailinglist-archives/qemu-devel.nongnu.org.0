Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD40483DA0
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 09:05:56 +0100 (CET)
Received: from localhost ([::1]:50152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4epP-0002Dd-F3
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 03:05:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n4eIU-0005qA-TL; Tue, 04 Jan 2022 02:32:01 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:25462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n4eIQ-0008J4-3O; Tue, 04 Jan 2022 02:31:53 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2046Uamf010355; 
 Tue, 4 Jan 2022 07:31:45 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dcccymvdb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 07:31:45 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2047UQwF011945;
 Tue, 4 Jan 2022 07:31:43 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03fra.de.ibm.com with ESMTP id 3daek96agy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 07:31:42 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2047Ve5G37355914
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 Jan 2022 07:31:40 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 53D49A4054;
 Tue,  4 Jan 2022 07:31:40 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 177BDA4068;
 Tue,  4 Jan 2022 07:31:40 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue,  4 Jan 2022 07:31:40 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.33.19])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 6C4DC220144;
 Tue,  4 Jan 2022 08:31:39 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 24/26] target/ppc: Rewrite pmu_increment_insns
Date: Tue,  4 Jan 2022 08:31:19 +0100
Message-Id: <20220104073121.3784280-25-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220104073121.3784280-1-clg@kaod.org>
References: <20220104073121.3784280-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7nfl6a7mGIgGYAvIQNPxSQY0V-_H9R1H
X-Proofpoint-ORIG-GUID: 7nfl6a7mGIgGYAvIQNPxSQY0V-_H9R1H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-04_04,2022-01-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 spamscore=0 malwarescore=0 mlxlogscore=943 clxscore=1034
 impostorscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201040047
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

Use the cached pmc_ins_cnt value.  Unroll the loop over the
different PMC counters.  Treat the PMC4 run-latch specially.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220103224746.167831-3-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/power8-pmu.c | 78 ++++++++++++++++++++++++++---------------
 1 file changed, 49 insertions(+), 29 deletions(-)

diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index 1f4f6119943a..27c4c7915bf3 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -170,45 +170,65 @@ void pmu_update_summaries(CPUPPCState *env)
=20
 static bool pmu_increment_insns(CPUPPCState *env, uint32_t num_insns)
 {
+    target_ulong mmcr0 =3D env->spr[SPR_POWER_MMCR0];
+    unsigned ins_cnt =3D env->pmc_ins_cnt;
     bool overflow_triggered =3D false;
-    int sprn;
-
-    /* PMC6 never counts instructions */
-    for (sprn =3D SPR_POWER_PMC1; sprn <=3D SPR_POWER_PMC5; sprn++) {
-        PMUEventType evt_type =3D pmc_get_event(env, sprn);
-        bool insn_event =3D evt_type =3D=3D PMU_EVENT_INSTRUCTIONS ||
-                          evt_type =3D=3D PMU_EVENT_INSN_RUN_LATCH;
-
-        if (pmc_is_inactive(env, sprn) || !insn_event) {
-            continue;
+    target_ulong tmp;
+
+    if (unlikely(ins_cnt & 0x1e)) {
+        if (ins_cnt & (1 << 1)) {
+            tmp =3D env->spr[SPR_POWER_PMC1];
+            tmp +=3D num_insns;
+            if (tmp >=3D PMC_COUNTER_NEGATIVE_VAL && (mmcr0 & MMCR0_PMC1=
CE)) {
+                tmp =3D PMC_COUNTER_NEGATIVE_VAL;
+                overflow_triggered =3D true;
+            }
+            env->spr[SPR_POWER_PMC1] =3D tmp;
         }
=20
-        if (evt_type =3D=3D PMU_EVENT_INSTRUCTIONS) {
-            env->spr[sprn] +=3D num_insns;
+        if (ins_cnt & (1 << 2)) {
+            tmp =3D env->spr[SPR_POWER_PMC2];
+            tmp +=3D num_insns;
+            if (tmp >=3D PMC_COUNTER_NEGATIVE_VAL && (mmcr0 & MMCR0_PMCj=
CE)) {
+                tmp =3D PMC_COUNTER_NEGATIVE_VAL;
+                overflow_triggered =3D true;
+            }
+            env->spr[SPR_POWER_PMC2] =3D tmp;
         }
=20
-        if (evt_type =3D=3D PMU_EVENT_INSN_RUN_LATCH &&
-            env->spr[SPR_CTRL] & CTRL_RUN) {
-            env->spr[sprn] +=3D num_insns;
+        if (ins_cnt & (1 << 3)) {
+            tmp =3D env->spr[SPR_POWER_PMC3];
+            tmp +=3D num_insns;
+            if (tmp >=3D PMC_COUNTER_NEGATIVE_VAL && (mmcr0 & MMCR0_PMCj=
CE)) {
+                tmp =3D PMC_COUNTER_NEGATIVE_VAL;
+                overflow_triggered =3D true;
+            }
+            env->spr[SPR_POWER_PMC3] =3D tmp;
         }
=20
-        if (env->spr[sprn] >=3D PMC_COUNTER_NEGATIVE_VAL &&
-            pmc_has_overflow_enabled(env, sprn)) {
+        if (ins_cnt & (1 << 4)) {
+            target_ulong mmcr1 =3D env->spr[SPR_POWER_MMCR1];
+            int sel =3D extract64(mmcr1, MMCR1_PMC4EVT_EXTR, MMCR1_EVT_S=
IZE);
+            if (sel =3D=3D 0x02 || (env->spr[SPR_CTRL] & CTRL_RUN)) {
+                tmp =3D env->spr[SPR_POWER_PMC4];
+                tmp +=3D num_insns;
+                if (tmp >=3D PMC_COUNTER_NEGATIVE_VAL && (mmcr0 & MMCR0_=
PMCjCE)) {
+                    tmp =3D PMC_COUNTER_NEGATIVE_VAL;
+                    overflow_triggered =3D true;
+                }
+                env->spr[SPR_POWER_PMC4] =3D tmp;
+            }
+        }
+    }
=20
+    if (ins_cnt & (1 << 5)) {
+        tmp =3D env->spr[SPR_POWER_PMC5];
+        tmp +=3D num_insns;
+        if (tmp >=3D PMC_COUNTER_NEGATIVE_VAL && (mmcr0 & MMCR0_PMCjCE))=
 {
+            tmp =3D PMC_COUNTER_NEGATIVE_VAL;
             overflow_triggered =3D true;
-
-            /*
-             * The real PMU will always trigger a counter overflow with
-             * PMC_COUNTER_NEGATIVE_VAL. We don't have an easy way to
-             * do that since we're counting block of instructions at
-             * the end of each translation block, and we're probably
-             * passing this value at this point.
-             *
-             * Let's write PMC_COUNTER_NEGATIVE_VAL to the overflowed
-             * counter to simulate what the real hardware would do.
-             */
-            env->spr[sprn] =3D PMC_COUNTER_NEGATIVE_VAL;
         }
+        env->spr[SPR_POWER_PMC5] =3D tmp;
     }
=20
     return overflow_triggered;
--=20
2.31.1


