Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 815714904A9
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 10:18:38 +0100 (CET)
Received: from localhost ([::1]:42244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9O9t-0000bV-6S
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 04:18:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9O7V-00087g-Bi; Mon, 17 Jan 2022 04:16:10 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:64436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9O7Q-0003Am-V1; Mon, 17 Jan 2022 04:16:09 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20H8Zl6d006046; 
 Mon, 17 Jan 2022 09:15:48 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dn42s9tsp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 09:15:48 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20H98HOn018230;
 Mon, 17 Jan 2022 09:15:46 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 3dknhj25jx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 09:15:46 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20H9FiXE39322028
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jan 2022 09:15:44 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E5AAE11C069;
 Mon, 17 Jan 2022 09:15:43 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A7CF111C05C;
 Mon, 17 Jan 2022 09:15:43 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 17 Jan 2022 09:15:43 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.52.153])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id D99BF2200E5;
 Mon, 17 Jan 2022 10:15:42 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH] target/ppc: Finish removal of 401/403 CPUs
Date: Mon, 17 Jan 2022 10:15:41 +0100
Message-Id: <20220117091541.1615807-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FjWLUu6vKG9zWSsN8CBfEQQy2Zmo13U5
X-Proofpoint-GUID: FjWLUu6vKG9zWSsN8CBfEQQy2Zmo13U5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-17_03,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=663 phishscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1034 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201170058
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit c8f49e6b938e ("target/ppc: remove 401/403 CPUs") left a few
things behind.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/helper.h      |  1 -
 target/ppc/cpu-models.c  |  1 -
 target/ppc/machine.c     | 23 -----------------------
 target/ppc/misc_helper.c |  9 ---------
 target/ppc/translate.c   | 16 +---------------
 5 files changed, 1 insertion(+), 49 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index f9c72dcd504d..d318837ea5cc 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -703,7 +703,6 @@ DEF_HELPER_FLAGS_2(store_hdecr, TCG_CALL_NO_RWG, void=
, env, tl)
 DEF_HELPER_FLAGS_2(store_vtb, TCG_CALL_NO_RWG, void, env, tl)
 DEF_HELPER_FLAGS_2(store_tbu40, TCG_CALL_NO_RWG, void, env, tl)
 DEF_HELPER_2(store_hid0_601, void, env, tl)
-DEF_HELPER_3(store_403_pbr, void, env, i32, tl)
 DEF_HELPER_FLAGS_1(load_40x_pit, TCG_CALL_NO_RWG, tl, env)
 DEF_HELPER_FLAGS_2(store_40x_pit, TCG_CALL_NO_RWG, void, env, tl)
 DEF_HELPER_FLAGS_2(store_40x_tcr, TCG_CALL_NO_RWG, void, env, tl)
diff --git a/target/ppc/cpu-models.c b/target/ppc/cpu-models.c
index c9fcb6119f40..96fec9c2e501 100644
--- a/target/ppc/cpu-models.c
+++ b/target/ppc/cpu-models.c
@@ -750,7 +750,6 @@
 /* PowerPC CPU aliases                                                  =
   */
=20
 PowerPCCPUAlias ppc_cpu_aliases[] =3D {
-    { "403", "403gc" },
     { "405", "405d4" },
     { "405cr", "405crc" },
     { "405gp", "405gpd" },
diff --git a/target/ppc/machine.c b/target/ppc/machine.c
index 756d8de5d8dd..ea0a0d4e4c7a 100644
--- a/target/ppc/machine.c
+++ b/target/ppc/machine.c
@@ -709,25 +709,6 @@ static bool tlbemb_needed(void *opaque)
     return env->nb_tlb && (env->tlb_type =3D=3D TLB_EMB);
 }
=20
-static bool pbr403_needed(void *opaque)
-{
-    PowerPCCPU *cpu =3D opaque;
-    uint32_t pvr =3D cpu->env.spr[SPR_PVR];
-
-    return (pvr & 0xffff0000) =3D=3D 0x00200000;
-}
-
-static const VMStateDescription vmstate_pbr403 =3D {
-    .name =3D "cpu/pbr403",
-    .version_id =3D 1,
-    .minimum_version_id =3D 1,
-    .needed =3D pbr403_needed,
-    .fields =3D (VMStateField[]) {
-        VMSTATE_UINTTL_ARRAY(env.pb, PowerPCCPU, 4),
-        VMSTATE_END_OF_LIST()
-    },
-};
-
 static const VMStateDescription vmstate_tlbemb =3D {
     .name =3D "cpu/tlb6xx",
     .version_id =3D 1,
@@ -742,10 +723,6 @@ static const VMStateDescription vmstate_tlbemb =3D {
         /* 403 protection registers */
         VMSTATE_END_OF_LIST()
     },
-    .subsections =3D (const VMStateDescription*[]) {
-        &vmstate_pbr403,
-        NULL
-    }
 };
=20
 static const VMStateDescription vmstate_tlbmas_entry =3D {
diff --git a/target/ppc/misc_helper.c b/target/ppc/misc_helper.c
index c33f5f39b90b..1bcefa7c843c 100644
--- a/target/ppc/misc_helper.c
+++ b/target/ppc/misc_helper.c
@@ -226,15 +226,6 @@ void helper_store_hid0_601(CPUPPCState *env, target_=
ulong val)
     }
 }
=20
-void helper_store_403_pbr(CPUPPCState *env, uint32_t num, target_ulong v=
alue)
-{
-    if (likely(env->pb[num] !=3D value)) {
-        env->pb[num] =3D value;
-        /* Should be optimized */
-        tlb_flush(env_cpu(env));
-    }
-}
-
 void helper_store_40x_dbcr0(CPUPPCState *env, target_ulong val)
 {
     /* Bits 26 & 27 affect single-stepping. */
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index abbc3a5bb9f0..059956bc59b3 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -911,22 +911,8 @@ void spr_write_booke_tsr(DisasContext *ctx, int sprn=
, int gprn)
 }
 #endif
=20
-/* PowerPC 403 specific registers */
-/* PBL1 / PBU1 / PBL2 / PBU2 */
+/* PIR */
 #if !defined(CONFIG_USER_ONLY)
-void spr_read_403_pbr(DisasContext *ctx, int gprn, int sprn)
-{
-    tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env,
-                  offsetof(CPUPPCState, pb[sprn - SPR_403_PBL1]));
-}
-
-void spr_write_403_pbr(DisasContext *ctx, int sprn, int gprn)
-{
-    TCGv_i32 t0 =3D tcg_const_i32(sprn - SPR_403_PBL1);
-    gen_helper_store_403_pbr(cpu_env, t0, cpu_gpr[gprn]);
-    tcg_temp_free_i32(t0);
-}
-
 void spr_write_pir(DisasContext *ctx, int sprn, int gprn)
 {
     TCGv t0 =3D tcg_temp_new();
--=20
2.31.1


