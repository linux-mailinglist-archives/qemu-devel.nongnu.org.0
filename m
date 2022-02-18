Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 758EE4BB7B8
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 12:08:56 +0100 (CET)
Received: from localhost ([::1]:55468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL18B-0003e5-IC
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 06:08:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nL0fT-00011v-9b; Fri, 18 Feb 2022 05:39:15 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:55402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nL0fN-0005h0-3S; Fri, 18 Feb 2022 05:39:13 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21IACGs2014474; 
 Fri, 18 Feb 2022 10:38:45 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ea9g9gg50-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 10:38:45 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21IAc07s006184;
 Fri, 18 Feb 2022 10:38:43 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3e64has9n6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 10:38:43 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 21IAcffW39715306
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Feb 2022 10:38:41 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 62AA14207C;
 Fri, 18 Feb 2022 10:38:41 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1D16242085;
 Fri, 18 Feb 2022 10:38:41 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 18 Feb 2022 10:38:41 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.87.94])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 5B6DF2201F1;
 Fri, 18 Feb 2022 11:38:40 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 16/39] target/ppc: cpu_init: Move Timebase registration into
 the common function
Date: Fri, 18 Feb 2022 11:38:04 +0100
Message-Id: <20220218103827.682032-17-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218103827.682032-1-clg@kaod.org>
References: <20220218103827.682032-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ryVqKq7GIbMD6bvhztVWLaRxVclmIlF9
X-Proofpoint-GUID: ryVqKq7GIbMD6bvhztVWLaRxVclmIlF9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-18_04,2022-02-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034
 lowpriorityscore=0 spamscore=0 malwarescore=0 mlxlogscore=981
 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202180067
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fabiano Rosas <farosas@linux.ibm.com>

Now that the 601 was removed, all of our CPUs have a timebase, so that
can be moved into the common function.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Message-Id: <20220216162426.1885923-5-farosas@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/cpu_init.c | 98 ++++++++-----------------------------------
 1 file changed, 18 insertions(+), 80 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 1fb17a5e5112..c6db87fd5c74 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -221,6 +221,24 @@ static void register_generic_sprs(PowerPCCPU *cpu)
                          pcc->svr);
         }
     }
+
+    /* Time base */
+    spr_register(env, SPR_VTBL,  "TBL",
+                 &spr_read_tbl, SPR_NOACCESS,
+                 &spr_read_tbl, SPR_NOACCESS,
+                 0x00000000);
+    spr_register(env, SPR_TBL,   "TBL",
+                 &spr_read_tbl, SPR_NOACCESS,
+                 &spr_read_tbl, &spr_write_tbl,
+                 0x00000000);
+    spr_register(env, SPR_VTBU,  "TBU",
+                 &spr_read_tbu, SPR_NOACCESS,
+                 &spr_read_tbu, SPR_NOACCESS,
+                 0x00000000);
+    spr_register(env, SPR_TBU,   "TBU",
+                 &spr_read_tbu, SPR_NOACCESS,
+                 &spr_read_tbu, &spr_write_tbu,
+                 0x00000000);
 }
=20
 /* SPR common to all non-embedded PowerPC, including 601 */
@@ -409,27 +427,6 @@ static void register_high_BATs(CPUPPCState *env)
 #endif
 }
=20
-/* Generic PowerPC time base */
-static void register_tbl(CPUPPCState *env)
-{
-    spr_register(env, SPR_VTBL,  "TBL",
-                 &spr_read_tbl, SPR_NOACCESS,
-                 &spr_read_tbl, SPR_NOACCESS,
-                 0x00000000);
-    spr_register(env, SPR_TBL,   "TBL",
-                 &spr_read_tbl, SPR_NOACCESS,
-                 &spr_read_tbl, &spr_write_tbl,
-                 0x00000000);
-    spr_register(env, SPR_VTBU,  "TBU",
-                 &spr_read_tbu, SPR_NOACCESS,
-                 &spr_read_tbu, SPR_NOACCESS,
-                 0x00000000);
-    spr_register(env, SPR_TBU,   "TBU",
-                 &spr_read_tbu, SPR_NOACCESS,
-                 &spr_read_tbu, &spr_write_tbu,
-                 0x00000000);
-}
-
 /* Softare table search registers */
 static void register_6xx_7xx_soft_tlb(CPUPPCState *env, int nb_tlbs, int=
 nb_ways)
 {
@@ -2319,8 +2316,6 @@ static int check_pow_hid0_74xx(CPUPPCState *env)
=20
 static void init_proc_405(CPUPPCState *env)
 {
-    /* Time base */
-    register_tbl(env);
     register_40x_sprs(env);
     register_405_sprs(env);
     /* Bus access control */
@@ -2386,8 +2381,6 @@ POWERPC_FAMILY(405)(ObjectClass *oc, void *data)
=20
 static void init_proc_440EP(CPUPPCState *env)
 {
-    /* Time base */
-    register_tbl(env);
     register_BookE_sprs(env, 0x000000000000FFFFULL);
     register_440_sprs(env);
     register_usprgh_sprs(env);
@@ -2528,8 +2521,6 @@ POWERPC_FAMILY(460EX)(ObjectClass *oc, void *data)
=20
 static void init_proc_440GP(CPUPPCState *env)
 {
-    /* Time base */
-    register_tbl(env);
     register_BookE_sprs(env, 0x000000000000FFFFULL);
     register_440_sprs(env);
     register_usprgh_sprs(env);
@@ -2611,8 +2602,6 @@ POWERPC_FAMILY(440GP)(ObjectClass *oc, void *data)
=20
 static void init_proc_440x5(CPUPPCState *env)
 {
-    /* Time base */
-    register_tbl(env);
     register_BookE_sprs(env, 0x000000000000FFFFULL);
     register_440_sprs(env);
     register_usprgh_sprs(env);
@@ -2750,8 +2739,6 @@ POWERPC_FAMILY(440x5wDFPU)(ObjectClass *oc, void *d=
ata)
=20
 static void init_proc_MPC5xx(CPUPPCState *env)
 {
-    /* Time base */
-    register_tbl(env);
     register_5xx_8xx_sprs(env);
     register_5xx_sprs(env);
     init_excp_MPC5xx(env);
@@ -2794,8 +2781,6 @@ POWERPC_FAMILY(MPC5xx)(ObjectClass *oc, void *data)
=20
 static void init_proc_MPC8xx(CPUPPCState *env)
 {
-    /* Time base */
-    register_tbl(env);
     register_5xx_8xx_sprs(env);
     register_8xx_sprs(env);
     init_excp_MPC8xx(env);
@@ -2843,8 +2828,6 @@ static void init_proc_G2(CPUPPCState *env)
     register_sdr1_sprs(env);
     register_G2_755_sprs(env);
     register_G2_sprs(env);
-    /* Time base */
-    register_tbl(env);
     /* External access control */
     spr_register(env, SPR_EAR, "EAR",
                  SPR_NOACCESS, SPR_NOACCESS,
@@ -2956,8 +2939,6 @@ POWERPC_FAMILY(G2LE)(ObjectClass *oc, void *data)
=20
 static void init_proc_e200(CPUPPCState *env)
 {
-    /* Time base */
-    register_tbl(env);
     register_BookE_sprs(env, 0x000000070000FFFFULL);
=20
     spr_register(env, SPR_BOOKE_SPEFSCR, "SPEFSCR",
@@ -3114,8 +3095,6 @@ static void init_proc_e300(CPUPPCState *env)
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
     register_603_sprs(env);
-    /* Time base */
-    register_tbl(env);
     /* hardware implementation registers */
     spr_register(env, SPR_HID0, "HID0",
                  SPR_NOACCESS, SPR_NOACCESS,
@@ -3229,8 +3208,6 @@ static void init_proc_e500(CPUPPCState *env, int ve=
rsion)
     int i;
 #endif
=20
-    /* Time base */
-    register_tbl(env);
     /*
      * XXX The e500 doesn't implement IVOR7 and IVOR9, but doesn't
      *     complain when accessing them.
@@ -3674,8 +3651,6 @@ static void init_proc_603(CPUPPCState *env)
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
     register_603_sprs(env);
-    /* Time base */
-    register_tbl(env);
     /* hardware implementation registers */
     spr_register(env, SPR_HID0, "HID0",
                  SPR_NOACCESS, SPR_NOACCESS,
@@ -3779,8 +3754,6 @@ static void init_proc_604(CPUPPCState *env)
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
     register_604_sprs(env);
-    /* Time base */
-    register_tbl(env);
     /* Hardware implementation registers */
     spr_register(env, SPR_HID0, "HID0",
                  SPR_NOACCESS, SPR_NOACCESS,
@@ -3854,8 +3827,6 @@ static void init_proc_604E(CPUPPCState *env)
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* Time base */
-    register_tbl(env);
     /* Hardware implementation registers */
     spr_register(env, SPR_HID0, "HID0",
                  SPR_NOACCESS, SPR_NOACCESS,
@@ -3919,8 +3890,6 @@ static void init_proc_740(CPUPPCState *env)
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
-    /* Time base */
-    register_tbl(env);
     /* Thermal management */
     register_thrm_sprs(env);
     /* Hardware implementation registers */
@@ -3991,8 +3960,6 @@ static void init_proc_750(CPUPPCState *env)
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, spr_access_nop,
                  0x00000000);
-    /* Time base */
-    register_tbl(env);
     /* Thermal management */
     register_thrm_sprs(env);
     /* Hardware implementation registers */
@@ -4067,8 +4034,6 @@ static void init_proc_750cl(CPUPPCState *env)
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, spr_access_nop,
                  0x00000000);
-    /* Time base */
-    register_tbl(env);
     /* Thermal management */
     /* Those registers are fake on 750CL */
     spr_register(env, SPR_THRM1, "THRM1",
@@ -4264,8 +4229,6 @@ static void init_proc_750cx(CPUPPCState *env)
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, spr_access_nop,
                  0x00000000);
-    /* Time base */
-    register_tbl(env);
     /* Thermal management */
     register_thrm_sprs(env);
=20
@@ -4343,8 +4306,6 @@ static void init_proc_750fx(CPUPPCState *env)
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, spr_access_nop,
                  0x00000000);
-    /* Time base */
-    register_tbl(env);
     /* Thermal management */
     register_thrm_sprs(env);
=20
@@ -4427,8 +4388,6 @@ static void init_proc_750gx(CPUPPCState *env)
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, spr_access_nop,
                  0x00000000);
-    /* Time base */
-    register_tbl(env);
     /* Thermal management */
     register_thrm_sprs(env);
=20
@@ -4507,8 +4466,6 @@ static void init_proc_745(CPUPPCState *env)
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
     register_G2_755_sprs(env);
-    /* Time base */
-    register_tbl(env);
     /* Thermal management */
     register_thrm_sprs(env);
     /* Hardware implementation registers */
@@ -4582,8 +4539,6 @@ static void init_proc_755(CPUPPCState *env)
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
     register_G2_755_sprs(env);
-    /* Time base */
-    register_tbl(env);
     /* L2 cache control */
     spr_register(env, SPR_L2CR, "L2CR",
                  SPR_NOACCESS, SPR_NOACCESS,
@@ -4666,8 +4621,6 @@ static void init_proc_7400(CPUPPCState *env)
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
-    /* Time base */
-    register_tbl(env);
     /* 74xx specific SPR */
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
@@ -4742,8 +4695,6 @@ static void init_proc_7410(CPUPPCState *env)
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
-    /* Time base */
-    register_tbl(env);
     /* 74xx specific SPR */
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
@@ -4825,8 +4776,6 @@ static void init_proc_7440(CPUPPCState *env)
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
-    /* Time base */
-    register_tbl(env);
     /* 74xx specific SPR */
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
@@ -4929,8 +4878,6 @@ static void init_proc_7450(CPUPPCState *env)
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
-    /* Time base */
-    register_tbl(env);
     /* 74xx specific SPR */
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
@@ -5055,8 +5002,6 @@ static void init_proc_7445(CPUPPCState *env)
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
-    /* Time base */
-    register_tbl(env);
     /* 74xx specific SPR */
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
@@ -5188,8 +5133,6 @@ static void init_proc_7455(CPUPPCState *env)
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
-    /* Time base */
-    register_tbl(env);
     /* 74xx specific SPR */
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
@@ -5323,8 +5266,6 @@ static void init_proc_7457(CPUPPCState *env)
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
-    /* Time base */
-    register_tbl(env);
     /* 74xx specific SPR */
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
@@ -5478,8 +5419,6 @@ static void init_proc_e600(CPUPPCState *env)
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
-    /* Time base */
-    register_tbl(env);
     /* 74xx specific SPR */
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
@@ -6303,7 +6242,6 @@ static void init_tcg_pmu_power8(CPUPPCState *env)
 static void init_proc_book3s_common(CPUPPCState *env)
 {
     register_ne_601_sprs(env);
-    register_tbl(env);
     register_usprg3_sprs(env);
     register_book3s_altivec_sprs(env);
     register_book3s_pmu_sup_sprs(env);
--=20
2.34.1


