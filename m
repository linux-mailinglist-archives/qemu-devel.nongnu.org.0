Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBF84760D9
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 19:37:09 +0100 (CET)
Received: from localhost ([::1]:38206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxZ9I-0006Y3-7o
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 13:37:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXig-0005Xz-Qx; Wed, 15 Dec 2021 12:05:35 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:32994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXib-0004sh-DM; Wed, 15 Dec 2021 12:05:34 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFGfbAq024010; 
 Wed, 15 Dec 2021 17:05:02 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cyfrp7eyf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:05:02 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BFGg69d026231;
 Wed, 15 Dec 2021 17:05:02 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cyfrp7ex6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:05:01 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BFH3KoA024954;
 Wed, 15 Dec 2021 17:04:59 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3cy7qvydka-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:59 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1BFH4u9C42664328
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 17:04:56 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 98E44AE058;
 Wed, 15 Dec 2021 17:04:56 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 51352AE053;
 Wed, 15 Dec 2021 17:04:56 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 15 Dec 2021 17:04:56 +0000 (GMT)
Received: from yukon.home (unknown [9.171.19.61])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 7586E220295;
 Wed, 15 Dec 2021 18:04:55 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 088/102] target/ppc/power8-pmu.c: add PM_RUN_INST_CMPL (0xFA)
 event
Date: Wed, 15 Dec 2021 18:03:43 +0100
Message-Id: <20211215170357.321643-76-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215170357.321643-1-clg@kaod.org>
References: <20211215165847.321042-1-clg@kaod.org>
 <20211215170357.321643-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gpS_xGAQ82cobYrjJPY-xPNDbdHFod2T
X-Proofpoint-ORIG-GUID: WO91haFMbdc3Ka2SDA1Lt9iYxniVLp8i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_10,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 clxscore=1034 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

PM_RUN_INST_CMPL, instructions completed with the run latch set, is
the architected PowerISA v3.1 event defined with PMC4SEL =3D 0xFA.

Implement it by checking for the CTRL RUN bit before incrementing the
counter. To make this work properly we also need to force a new
translation block each time SPR_CTRL is written. A small tweak in
pmu_increment_insns() is then needed to only increment this event
if the thread has the run latch.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20211201151734.654994-8-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/cpu.h        |  4 ++++
 target/ppc/spr_tcg.h    |  1 +
 target/ppc/cpu_init.c   |  2 +-
 target/ppc/power8-pmu.c | 27 ++++++++++++++++++++++++---
 target/ppc/translate.c  | 12 ++++++++++++
 5 files changed, 42 insertions(+), 4 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 313b16f39273..b0473526ced0 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -303,6 +303,7 @@ typedef enum {
     PMU_EVENT_INACTIVE,
     PMU_EVENT_CYCLES,
     PMU_EVENT_INSTRUCTIONS,
+    PMU_EVENT_INSN_RUN_LATCH,
 } PMUEventType;
=20
 /***********************************************************************=
******/
@@ -388,6 +389,9 @@ typedef enum {
 #define MMCR1_PMC4SEL_START 56
 #define MMCR1_PMC4EVT_EXTR (64 - MMCR1_PMC4SEL_START - MMCR1_EVT_SIZE)
=20
+/* PMU uses CTRL_RUN to sample PM_RUN_INST_CMPL */
+#define CTRL_RUN PPC_BIT(63)
+
 /* LPCR bits */
 #define LPCR_VPM0         PPC_BIT(0)
 #define LPCR_VPM1         PPC_BIT(1)
diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
index 1d6521eedc83..f98d97c0ba17 100644
--- a/target/ppc/spr_tcg.h
+++ b/target/ppc/spr_tcg.h
@@ -28,6 +28,7 @@ void spr_write_generic(DisasContext *ctx, int sprn, int=
 gprn);
 void spr_write_MMCR0(DisasContext *ctx, int sprn, int gprn);
 void spr_write_MMCR1(DisasContext *ctx, int sprn, int gprn);
 void spr_write_PMC(DisasContext *ctx, int sprn, int gprn);
+void spr_write_CTRL(DisasContext *ctx, int sprn, int gprn);
 void spr_read_xer(DisasContext *ctx, int gprn, int sprn);
 void spr_write_xer(DisasContext *ctx, int sprn, int gprn);
 void spr_read_lr(DisasContext *ctx, int gprn, int sprn);
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index e865d368f237..06ef15cd9e4e 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6182,7 +6182,7 @@ static void register_book3s_ctrl_sprs(CPUPPCState *=
env)
 {
     spr_register(env, SPR_CTRL, "SPR_CTRL",
                  SPR_NOACCESS, SPR_NOACCESS,
-                 SPR_NOACCESS, &spr_write_generic,
+                 SPR_NOACCESS, &spr_write_CTRL,
                  0x00000000);
     spr_register(env, SPR_UCTRL, "SPR_UCTRL",
                  &spr_read_ureg, SPR_NOACCESS,
diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index e163ba564012..08d1902cd5d6 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -96,6 +96,15 @@ static PMUEventType pmc_get_event(CPUPPCState *env, in=
t sprn)
             evt_type =3D PMU_EVENT_CYCLES;
         }
         break;
+    case 0xFA:
+        /*
+         * PMC4SEL =3D 0xFA is the "instructions completed
+         * with run latch set" event.
+         */
+        if (sprn =3D=3D SPR_POWER_PMC4) {
+            evt_type =3D PMU_EVENT_INSN_RUN_LATCH;
+        }
+        break;
     case 0xFE:
         /*
          * PMC1SEL =3D 0xFE is the architected PowerISA v3.1
@@ -117,7 +126,8 @@ bool pmu_insn_cnt_enabled(CPUPPCState *env)
     int sprn;
=20
     for (sprn =3D SPR_POWER_PMC1; sprn <=3D SPR_POWER_PMC5; sprn++) {
-        if (pmc_get_event(env, sprn) =3D=3D PMU_EVENT_INSTRUCTIONS) {
+        if (pmc_get_event(env, sprn) =3D=3D PMU_EVENT_INSTRUCTIONS ||
+            pmc_get_event(env, sprn) =3D=3D PMU_EVENT_INSN_RUN_LATCH) {
             return true;
         }
     }
@@ -132,11 +142,22 @@ static bool pmu_increment_insns(CPUPPCState *env, u=
int32_t num_insns)
=20
     /* PMC6 never counts instructions */
     for (sprn =3D SPR_POWER_PMC1; sprn <=3D SPR_POWER_PMC5; sprn++) {
-        if (pmc_get_event(env, sprn) !=3D PMU_EVENT_INSTRUCTIONS) {
+        PMUEventType evt_type =3D pmc_get_event(env, sprn);
+        bool insn_event =3D evt_type =3D=3D PMU_EVENT_INSTRUCTIONS ||
+                          evt_type =3D=3D PMU_EVENT_INSN_RUN_LATCH;
+
+        if (pmc_is_inactive(env, sprn) || !insn_event) {
             continue;
         }
=20
-        env->spr[sprn] +=3D num_insns;
+        if (evt_type =3D=3D PMU_EVENT_INSTRUCTIONS) {
+            env->spr[sprn] +=3D num_insns;
+        }
+
+        if (evt_type =3D=3D PMU_EVENT_INSN_RUN_LATCH &&
+            env->spr[SPR_CTRL] & CTRL_RUN) {
+            env->spr[sprn] +=3D num_insns;
+        }
=20
         if (env->spr[sprn] >=3D PMC_COUNTER_NEGATIVE_VAL &&
             pmc_has_overflow_enabled(env, sprn)) {
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 633b907058e4..68fbbf67ecb4 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -403,6 +403,18 @@ void spr_write_generic(DisasContext *ctx, int sprn, =
int gprn)
     spr_store_dump_spr(sprn);
 }
=20
+void spr_write_CTRL(DisasContext *ctx, int sprn, int gprn)
+{
+    spr_write_generic(ctx, sprn, gprn);
+
+    /*
+     * SPR_CTRL writes must force a new translation block,
+     * allowing the PMU to calculate the run latch events with
+     * more accuracy.
+     */
+    ctx->base.is_jmp =3D DISAS_EXIT_UPDATE;
+}
+
 #if !defined(CONFIG_USER_ONLY)
 void spr_write_generic32(DisasContext *ctx, int sprn, int gprn)
 {
--=20
2.31.1


