Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 997404B7966
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 22:46:45 +0100 (CET)
Received: from localhost ([::1]:37668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK5el-0006iE-HE
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 16:46:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nK5aU-0003Jl-1g; Tue, 15 Feb 2022 16:42:19 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:23096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nK5aR-0002US-QX; Tue, 15 Feb 2022 16:42:17 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21FKkX54015665; 
 Tue, 15 Feb 2022 21:42:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=K4VQuCe8z6HGIC7q9tHgCCty8oAX/1r17FhQNnMr2jA=;
 b=iauddinjGGvipfQa08bnuWNsjynfiMcA9IJ+PIqPzZsQP56vJnucIPHHlzBiC/aWZoui
 ssDlntkXEgZNMg3zFD1TR9AueW2c4ilS32oalJ+xMd9TMT0hf12YEAJkSVE2QuHwhKx2
 hHm5HYKGU+RdB+8iZrxgavf4K6w4n2w9cm/hrZx+QWweyXR0PITNACYbbXncoaABfOv0
 2XqS8afQ1PeHZZXkSOI4P4Wk/EaMJz5t3wVCD3jZjcww7Becio1Nln461p4qlQ++ya4+
 QL5Nb9lVbmW/cHHnKQAXyLY+UY5/dLmv3dvSS2GBhv9KZPu6VciK7c07UXsFYZZmvArP yg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e8kgs1kcg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 21:42:08 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21FLa5Dk014865;
 Tue, 15 Feb 2022 21:42:07 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e8kgs1kc6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 21:42:07 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21FLMH04009058;
 Tue, 15 Feb 2022 21:42:06 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03wdc.us.ibm.com with ESMTP id 3e64hb2p8a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 21:42:06 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21FLg5hY34865564
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Feb 2022 21:42:05 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5D8A9BE058;
 Tue, 15 Feb 2022 21:42:05 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9BADBBE054;
 Tue, 15 Feb 2022 21:42:03 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.143.123])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 15 Feb 2022 21:42:03 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/27] target/ppc: cpu_init: Move Timebase registration into
 the common function
Date: Tue, 15 Feb 2022 18:41:25 -0300
Message-Id: <20220215214148.1848266-5-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215214148.1848266-1-farosas@linux.ibm.com>
References: <20220215214148.1848266-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -MyQZAGIh3yu69LUakpm6KgN7PyAecHA
X-Proofpoint-ORIG-GUID: oFL_F6wvkhqJtja-GUXaXDIkKKobCkEm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-15_06,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0
 clxscore=1015 mlxscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202150122
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that the 601 was removed, all of our CPUs have a timebase, so that
can be moved into the common function.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/cpu_init.c | 98 ++++++++-----------------------------------
 1 file changed, 18 insertions(+), 80 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 5dc097f2fc..b7e460e12d 100644
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
 
 /* SPR common to all non-embedded PowerPC, including 601 */
@@ -409,27 +427,6 @@ static void register_high_BATs(CPUPPCState *env)
 #endif
 }
 
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
 static void register_6xx_7xx_soft_tlb(CPUPPCState *env, int nb_tlbs, int nb_ways)
 {
@@ -2323,8 +2320,6 @@ static int check_pow_hid0_74xx(CPUPPCState *env)
 
 static void init_proc_405(CPUPPCState *env)
 {
-    /* Time base */
-    register_tbl(env);
     register_40x_sprs(env);
     register_405_sprs(env);
     /* Bus access control */
@@ -2390,8 +2385,6 @@ POWERPC_FAMILY(405)(ObjectClass *oc, void *data)
 
 static void init_proc_440EP(CPUPPCState *env)
 {
-    /* Time base */
-    register_tbl(env);
     register_BookE_sprs(env, 0x000000000000FFFFULL);
     register_440_sprs(env);
     register_usprgh_sprs(env);
@@ -2532,8 +2525,6 @@ POWERPC_FAMILY(460EX)(ObjectClass *oc, void *data)
 
 static void init_proc_440GP(CPUPPCState *env)
 {
-    /* Time base */
-    register_tbl(env);
     register_BookE_sprs(env, 0x000000000000FFFFULL);
     register_440_sprs(env);
     register_usprgh_sprs(env);
@@ -2615,8 +2606,6 @@ POWERPC_FAMILY(440GP)(ObjectClass *oc, void *data)
 
 static void init_proc_440x5(CPUPPCState *env)
 {
-    /* Time base */
-    register_tbl(env);
     register_BookE_sprs(env, 0x000000000000FFFFULL);
     register_440_sprs(env);
     register_usprgh_sprs(env);
@@ -2754,8 +2743,6 @@ POWERPC_FAMILY(440x5wDFPU)(ObjectClass *oc, void *data)
 
 static void init_proc_MPC5xx(CPUPPCState *env)
 {
-    /* Time base */
-    register_tbl(env);
     register_5xx_8xx_sprs(env);
     register_5xx_sprs(env);
     init_excp_MPC5xx(env);
@@ -2798,8 +2785,6 @@ POWERPC_FAMILY(MPC5xx)(ObjectClass *oc, void *data)
 
 static void init_proc_MPC8xx(CPUPPCState *env)
 {
-    /* Time base */
-    register_tbl(env);
     register_5xx_8xx_sprs(env);
     register_8xx_sprs(env);
     init_excp_MPC8xx(env);
@@ -2847,8 +2832,6 @@ static void init_proc_G2(CPUPPCState *env)
     register_sdr1_sprs(env);
     register_G2_755_sprs(env);
     register_G2_sprs(env);
-    /* Time base */
-    register_tbl(env);
     /* External access control */
     spr_register(env, SPR_EAR, "EAR",
                  SPR_NOACCESS, SPR_NOACCESS,
@@ -2960,8 +2943,6 @@ POWERPC_FAMILY(G2LE)(ObjectClass *oc, void *data)
 
 static void init_proc_e200(CPUPPCState *env)
 {
-    /* Time base */
-    register_tbl(env);
     register_BookE_sprs(env, 0x000000070000FFFFULL);
 
     spr_register(env, SPR_BOOKE_SPEFSCR, "SPEFSCR",
@@ -3118,8 +3099,6 @@ static void init_proc_e300(CPUPPCState *env)
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
     register_603_sprs(env);
-    /* Time base */
-    register_tbl(env);
     /* hardware implementation registers */
     spr_register(env, SPR_HID0, "HID0",
                  SPR_NOACCESS, SPR_NOACCESS,
@@ -3233,8 +3212,6 @@ static void init_proc_e500(CPUPPCState *env, int version)
     int i;
 #endif
 
-    /* Time base */
-    register_tbl(env);
     /*
      * XXX The e500 doesn't implement IVOR7 and IVOR9, but doesn't
      *     complain when accessing them.
@@ -3678,8 +3655,6 @@ static void init_proc_603(CPUPPCState *env)
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
     register_603_sprs(env);
-    /* Time base */
-    register_tbl(env);
     /* hardware implementation registers */
     spr_register(env, SPR_HID0, "HID0",
                  SPR_NOACCESS, SPR_NOACCESS,
@@ -3783,8 +3758,6 @@ static void init_proc_604(CPUPPCState *env)
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
     register_604_sprs(env);
-    /* Time base */
-    register_tbl(env);
     /* Hardware implementation registers */
     spr_register(env, SPR_HID0, "HID0",
                  SPR_NOACCESS, SPR_NOACCESS,
@@ -3858,8 +3831,6 @@ static void init_proc_604E(CPUPPCState *env)
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* Time base */
-    register_tbl(env);
     /* Hardware implementation registers */
     spr_register(env, SPR_HID0, "HID0",
                  SPR_NOACCESS, SPR_NOACCESS,
@@ -3923,8 +3894,6 @@ static void init_proc_740(CPUPPCState *env)
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
-    /* Time base */
-    register_tbl(env);
     /* Thermal management */
     register_thrm_sprs(env);
     /* Hardware implementation registers */
@@ -3995,8 +3964,6 @@ static void init_proc_750(CPUPPCState *env)
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, spr_access_nop,
                  0x00000000);
-    /* Time base */
-    register_tbl(env);
     /* Thermal management */
     register_thrm_sprs(env);
     /* Hardware implementation registers */
@@ -4071,8 +4038,6 @@ static void init_proc_750cl(CPUPPCState *env)
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, spr_access_nop,
                  0x00000000);
-    /* Time base */
-    register_tbl(env);
     /* Thermal management */
     /* Those registers are fake on 750CL */
     spr_register(env, SPR_THRM1, "THRM1",
@@ -4268,8 +4233,6 @@ static void init_proc_750cx(CPUPPCState *env)
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, spr_access_nop,
                  0x00000000);
-    /* Time base */
-    register_tbl(env);
     /* Thermal management */
     register_thrm_sprs(env);
 
@@ -4347,8 +4310,6 @@ static void init_proc_750fx(CPUPPCState *env)
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, spr_access_nop,
                  0x00000000);
-    /* Time base */
-    register_tbl(env);
     /* Thermal management */
     register_thrm_sprs(env);
 
@@ -4431,8 +4392,6 @@ static void init_proc_750gx(CPUPPCState *env)
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, spr_access_nop,
                  0x00000000);
-    /* Time base */
-    register_tbl(env);
     /* Thermal management */
     register_thrm_sprs(env);
 
@@ -4511,8 +4470,6 @@ static void init_proc_745(CPUPPCState *env)
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
     register_G2_755_sprs(env);
-    /* Time base */
-    register_tbl(env);
     /* Thermal management */
     register_thrm_sprs(env);
     /* Hardware implementation registers */
@@ -4586,8 +4543,6 @@ static void init_proc_755(CPUPPCState *env)
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
     register_G2_755_sprs(env);
-    /* Time base */
-    register_tbl(env);
     /* L2 cache control */
     spr_register(env, SPR_L2CR, "L2CR",
                  SPR_NOACCESS, SPR_NOACCESS,
@@ -4670,8 +4625,6 @@ static void init_proc_7400(CPUPPCState *env)
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
-    /* Time base */
-    register_tbl(env);
     /* 74xx specific SPR */
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
@@ -4746,8 +4699,6 @@ static void init_proc_7410(CPUPPCState *env)
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
-    /* Time base */
-    register_tbl(env);
     /* 74xx specific SPR */
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
@@ -4829,8 +4780,6 @@ static void init_proc_7440(CPUPPCState *env)
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
-    /* Time base */
-    register_tbl(env);
     /* 74xx specific SPR */
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
@@ -4933,8 +4882,6 @@ static void init_proc_7450(CPUPPCState *env)
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
-    /* Time base */
-    register_tbl(env);
     /* 74xx specific SPR */
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
@@ -5059,8 +5006,6 @@ static void init_proc_7445(CPUPPCState *env)
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
-    /* Time base */
-    register_tbl(env);
     /* 74xx specific SPR */
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
@@ -5192,8 +5137,6 @@ static void init_proc_7455(CPUPPCState *env)
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
-    /* Time base */
-    register_tbl(env);
     /* 74xx specific SPR */
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
@@ -5327,8 +5270,6 @@ static void init_proc_7457(CPUPPCState *env)
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
-    /* Time base */
-    register_tbl(env);
     /* 74xx specific SPR */
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
@@ -5482,8 +5423,6 @@ static void init_proc_e600(CPUPPCState *env)
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
-    /* Time base */
-    register_tbl(env);
     /* 74xx specific SPR */
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
@@ -6307,7 +6246,6 @@ static void init_tcg_pmu_power8(CPUPPCState *env)
 static void init_proc_book3s_common(CPUPPCState *env)
 {
     register_ne_601_sprs(env);
-    register_tbl(env);
     register_usprg3_sprs(env);
     register_book3s_altivec_sprs(env);
     register_book3s_pmu_sup_sprs(env);
-- 
2.34.1


