Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D1D4BB793
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 12:04:21 +0100 (CET)
Received: from localhost ([::1]:47312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL13k-0006Ha-BL
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 06:04:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nL0fq-0001CG-Oh; Fri, 18 Feb 2022 05:39:38 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:18946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nL0fg-0005hx-So; Fri, 18 Feb 2022 05:39:36 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21I9udVs024111; 
 Fri, 18 Feb 2022 10:39:00 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ea995gxp5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 10:38:59 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21IAbttv004784;
 Fri, 18 Feb 2022 10:38:57 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 3e64has7xt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 10:38:57 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21IAcs8w25100606
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Feb 2022 10:38:54 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B2C2611C077;
 Fri, 18 Feb 2022 10:38:54 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6FF3611C073;
 Fri, 18 Feb 2022 10:38:54 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 18 Feb 2022 10:38:54 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.87.94])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 9C2072201F1;
 Fri, 18 Feb 2022 11:38:53 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 36/39] target/ppc: cpu_init: Expose some SPR registration
 helpers
Date: Fri, 18 Feb 2022 11:38:24 +0100
Message-Id: <20220218103827.682032-37-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218103827.682032-1-clg@kaod.org>
References: <20220218103827.682032-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: u0dPy_pPhZs_Cb1y80B13NdVtotfGcA_
X-Proofpoint-GUID: u0dPy_pPhZs_Cb1y80B13NdVtotfGcA_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-18_04,2022-02-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 mlxscore=0 spamscore=0
 clxscore=1034 phishscore=0 suspectscore=0 mlxlogscore=797 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202180067
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
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

The following patches will move CPU-specific code into separate files,
so expose the most used SPR registration functions:

register_sdr1_sprs         | 22 callers
register_low_BATs          | 20 callers
register_non_embedded_sprs | 19 callers
register_high_BATs         | 10 callers
register_thrm_sprs         | 8 callers
register_usprgh_sprs       | 6 callers
register_6xx_7xx_soft_tlb  | only 3 callers, but it helps to
                             keep the soft TLB code consistent.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Message-Id: <20220216162426.1885923-25-farosas@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/spr_common.h |  8 ++++++++
 target/ppc/cpu_init.c   | 14 +++++++-------
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/target/ppc/spr_common.h b/target/ppc/spr_common.h
index 5aec76ade4dd..329b7e91a23a 100644
--- a/target/ppc/spr_common.h
+++ b/target/ppc/spr_common.h
@@ -141,4 +141,12 @@ void spr_write_hmer(DisasContext *ctx, int sprn, int=
 gprn);
 void spr_write_lpcr(DisasContext *ctx, int sprn, int gprn);
 #endif
=20
+void register_low_BATs(CPUPPCState *env);
+void register_high_BATs(CPUPPCState *env);
+void register_sdr1_sprs(CPUPPCState *env);
+void register_thrm_sprs(CPUPPCState *env);
+void register_usprgh_sprs(CPUPPCState *env);
+void register_non_embedded_sprs(CPUPPCState *env);
+void register_6xx_7xx_soft_tlb(CPUPPCState *env, int nb_tlbs, int nb_way=
s);
+
 #endif
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index f0bbe340e4fd..40dd2c0fd813 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -241,7 +241,7 @@ static void register_generic_sprs(PowerPCCPU *cpu)
                  0x00000000);
 }
=20
-static void register_non_embedded_sprs(CPUPPCState *env)
+void register_non_embedded_sprs(CPUPPCState *env)
 {
     /* Exception processing */
     spr_register_kvm(env, SPR_DSISR, "DSISR",
@@ -260,7 +260,7 @@ static void register_non_embedded_sprs(CPUPPCState *e=
nv)
 }
=20
 /* Storage Description Register 1 */
-static void register_sdr1_sprs(CPUPPCState *env)
+void register_sdr1_sprs(CPUPPCState *env)
 {
 #ifndef CONFIG_USER_ONLY
     if (env->has_hv_mode) {
@@ -283,7 +283,7 @@ static void register_sdr1_sprs(CPUPPCState *env)
 }
=20
 /* BATs 0-3 */
-static void register_low_BATs(CPUPPCState *env)
+void register_low_BATs(CPUPPCState *env)
 {
 #if !defined(CONFIG_USER_ONLY)
     spr_register(env, SPR_IBAT0U, "IBAT0U",
@@ -355,7 +355,7 @@ static void register_low_BATs(CPUPPCState *env)
 }
=20
 /* BATs 4-7 */
-static void register_high_BATs(CPUPPCState *env)
+void register_high_BATs(CPUPPCState *env)
 {
 #if !defined(CONFIG_USER_ONLY)
     spr_register(env, SPR_IBAT4U, "IBAT4U",
@@ -427,7 +427,7 @@ static void register_high_BATs(CPUPPCState *env)
 }
=20
 /* Softare table search registers */
-static void register_6xx_7xx_soft_tlb(CPUPPCState *env, int nb_tlbs, int=
 nb_ways)
+void register_6xx_7xx_soft_tlb(CPUPPCState *env, int nb_tlbs, int nb_way=
s)
 {
 #if !defined(CONFIG_USER_ONLY)
     env->nb_tlb =3D nb_tlbs;
@@ -667,7 +667,7 @@ static void register_iamr_sprs(CPUPPCState *env)
 }
 #endif /* TARGET_PPC64 */
=20
-static void register_thrm_sprs(CPUPPCState *env)
+void register_thrm_sprs(CPUPPCState *env)
 {
     /* Thermal management */
     spr_register(env, SPR_THRM1, "THRM1",
@@ -1072,7 +1072,7 @@ static void register_l3_ctrl(CPUPPCState *env)
                  0x00000000);
 }
=20
-static void register_usprgh_sprs(CPUPPCState *env)
+void register_usprgh_sprs(CPUPPCState *env)
 {
     spr_register(env, SPR_USPRG4, "USPRG4",
                  &spr_read_ureg, SPR_NOACCESS,
--=20
2.34.1


