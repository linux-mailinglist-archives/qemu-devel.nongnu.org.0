Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDB047609C
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 19:23:09 +0100 (CET)
Received: from localhost ([::1]:44478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxYvk-0006Pe-Oa
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 13:23:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXiE-0004lt-GR; Wed, 15 Dec 2021 12:05:06 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:2322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXiA-0004hN-NT; Wed, 15 Dec 2021 12:05:05 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFGfdjH014398; 
 Wed, 15 Dec 2021 17:04:38 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cyfdnyyr7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:37 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BFH3KKQ024949;
 Wed, 15 Dec 2021 17:04:35 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 3cy7qvyde2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:35 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BFH4X4840305036
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 17:04:33 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 185624C044;
 Wed, 15 Dec 2021 17:04:33 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C10C24C046;
 Wed, 15 Dec 2021 17:04:32 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 15 Dec 2021 17:04:32 +0000 (GMT)
Received: from yukon.home (unknown [9.171.19.61])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 06BEC220295;
 Wed, 15 Dec 2021 18:04:31 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 056/102] target/ppc: Remove the software TLB model of 7450 CPUs
Date: Wed, 15 Dec 2021 18:03:11 +0100
Message-Id: <20211215170357.321643-44-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215170357.321643-1-clg@kaod.org>
References: <20211215165847.321042-1-clg@kaod.org>
 <20211215170357.321643-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7gl7O2k-wf3XfENeJTJjh0bLgA34_Ont
X-Proofpoint-ORIG-GUID: 7gl7O2k-wf3XfENeJTJjh0bLgA34_Ont
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_10,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fabiano Rosas <farosas@linux.ibm.com>

(Applies to 7441, 7445, 7450, 7451, 7455, 7457, 7447, 7447a and 7448)

The QEMU-side software TLB implementation for the 7450 family of CPUs
is being removed due to lack of known users in the real world. The
last users in the code were removed by the two previous commits.

A brief history:

The feature was added in QEMU by commit 7dbe11acd8 ("Handle all MMU
models in switches...") with the mention that Linux was not able to
handle the TLB miss interrupts and the MMU model would be kept
disabled.

At some point later, commit 8ca3f6c382 ("Allow selection of all
defined PowerPC 74xx (aka G4) CPUs.") enabled the model for the 7450
family without further justification.

We have since the year 2011 [1] been unable to run OpenBIOS in the
7450s and have not heard of any other software that is used with those
CPUs in QEMU. Attempts were made to find a guest OS that implemented
the TLB miss handlers and none were found among Linux 5.15, FreeBSD 13,
MacOS9, MacOSX and MorphOS 3.15.

All CPUs that registered this feature were moved to an MMU model that
replaces the software TLB with a QEMU hardware TLB
implementation. They can now run the same software as the 7400 CPUs,
including the OSes mentioned above.

References:

- https://bugs.launchpad.net/qemu/+bug/812398
  https://gitlab.com/qemu-project/qemu/-/issues/86

- https://lists.nongnu.org/archive/html/qemu-ppc/2021-11/msg00289.html
  message id: 20211119134431.406753-1-farosas@linux.ibm.com

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20211130230123.781844-4-farosas@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/cpu-qom.h     |  6 +++++-
 target/ppc/cpu.h         |  4 +---
 target/ppc/helper.h      |  2 --
 target/ppc/cpu_init.c    | 26 --------------------------
 target/ppc/excp_helper.c | 29 -----------------------------
 target/ppc/mmu_common.c  | 19 -------------------
 target/ppc/mmu_helper.c  | 31 -------------------------------
 target/ppc/translate.c   | 26 --------------------------
 8 files changed, 6 insertions(+), 137 deletions(-)

diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index 5800fa324e82..ef9e32447473 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -45,7 +45,11 @@ enum powerpc_mmu_t {
     POWERPC_MMU_32B        =3D 0x00000001,
     /* PowerPC 6xx MMU with software TLB                       */
     POWERPC_MMU_SOFT_6xx   =3D 0x00000002,
-    /* PowerPC 74xx MMU with software TLB                      */
+    /*
+     * PowerPC 74xx MMU with software TLB (this has been
+     * disabled, see git history for more information.
+     * keywords: tlbld tlbli TLBMISS PTEHI PTELO)
+     */
     POWERPC_MMU_SOFT_74xx  =3D 0x00000003,
     /* PowerPC 4xx MMU with software TLB                       */
     POWERPC_MMU_SOFT_4xx   =3D 0x00000004,
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 441d3dce194c..c07a8e9f7d4b 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -2142,8 +2142,6 @@ enum {
     PPC_SEGMENT        =3D 0x0000020000000000ULL,
     /*   PowerPC 6xx TLB management instructions                          =
   */
     PPC_6xx_TLB        =3D 0x0000040000000000ULL,
-    /* PowerPC 74xx TLB management instructions                           =
   */
-    PPC_74xx_TLB       =3D 0x0000080000000000ULL,
     /*   PowerPC 40x TLB management instructions                          =
   */
     PPC_40x_TLB        =3D 0x0000100000000000ULL,
     /*   segment register access instructions for PowerPC 64 "bridge"     =
   */
@@ -2200,7 +2198,7 @@ enum {
                         | PPC_CACHE_DCBZ \
                         | PPC_CACHE_DCBA | PPC_CACHE_LOCK \
                         | PPC_EXTERN | PPC_SEGMENT | PPC_6xx_TLB \
-                        | PPC_74xx_TLB | PPC_40x_TLB | PPC_SEGMENT_64B \
+                        | PPC_40x_TLB | PPC_SEGMENT_64B \
                         | PPC_SLBI | PPC_WRTEE | PPC_40x_EXCP \
                         | PPC_405_MAC | PPC_440_SPEC | PPC_BOOKE \
                         | PPC_MFAPIDI | PPC_TLBIVA | PPC_TLBIVAX \
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 48774fab1917..72b2c70ac1fc 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -625,8 +625,6 @@ DEF_HELPER_2(booke_set_eplc, void, env, tl)
 DEF_HELPER_2(booke_set_epsc, void, env, tl)
 DEF_HELPER_2(6xx_tlbd, void, env, tl)
 DEF_HELPER_2(6xx_tlbi, void, env, tl)
-DEF_HELPER_2(74xx_tlbd, void, env, tl)
-DEF_HELPER_2(74xx_tlbi, void, env, tl)
 DEF_HELPER_FLAGS_1(tlbia, TCG_CALL_NO_RWG, void, env)
 DEF_HELPER_FLAGS_2(tlbie, TCG_CALL_NO_RWG, void, env, tl)
 DEF_HELPER_FLAGS_2(tlbiva, TCG_CALL_NO_RWG, void, env, tl)
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 962acf295fd1..ed0e2136d9c8 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -945,31 +945,6 @@ static void register_l3_ctrl(CPUPPCState *env)
                  0x00000000);
 }
=20
-static void register_74xx_soft_tlb(CPUPPCState *env, int nb_tlbs, int nb_w=
ays)
-{
-#if !defined(CONFIG_USER_ONLY)
-    env->nb_tlb =3D nb_tlbs;
-    env->nb_ways =3D nb_ways;
-    env->id_tlbs =3D 1;
-    env->tlb_type =3D TLB_6XX;
-    /* XXX : not implemented */
-    spr_register(env, SPR_PTEHI, "PTEHI",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_PTELO, "PTELO",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_TLBMISS, "TLBMISS",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-#endif
-}
-
 static void register_usprg3_sprs(CPUPPCState *env)
 {
     spr_register(env, SPR_USPRG3, "USPRG3",
@@ -9238,7 +9213,6 @@ void ppc_cpu_dump_state(CPUState *cs, FILE *f, int fl=
ags)
     case POWERPC_MMU_32B:
     case POWERPC_MMU_601:
     case POWERPC_MMU_SOFT_6xx:
-    case POWERPC_MMU_SOFT_74xx:
 #if defined(TARGET_PPC64)
     case POWERPC_MMU_64B:
     case POWERPC_MMU_2_03:
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 17607adbe411..f1da0e119d6f 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -714,35 +714,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int e=
xcp_model, int excp)
             /* Set way using a LRU mechanism */
             msr |=3D ((env->last_way + 1) & (env->nb_ways - 1)) << 17;
             break;
-        case POWERPC_EXCP_74xx:
-#if defined(DEBUG_SOFTWARE_TLB)
-            if (qemu_log_enabled()) {
-                const char *es;
-                target_ulong *miss, *cmp;
-                int en;
-
-                if (excp =3D=3D POWERPC_EXCP_IFTLB) {
-                    es =3D "I";
-                    en =3D 'I';
-                    miss =3D &env->spr[SPR_TLBMISS];
-                    cmp =3D &env->spr[SPR_PTEHI];
-                } else {
-                    if (excp =3D=3D POWERPC_EXCP_DLTLB) {
-                        es =3D "DL";
-                    } else {
-                        es =3D "DS";
-                    }
-                    en =3D 'D';
-                    miss =3D &env->spr[SPR_TLBMISS];
-                    cmp =3D &env->spr[SPR_PTEHI];
-                }
-                qemu_log("74xx %sTLB miss: %cM " TARGET_FMT_lx " %cC "
-                         TARGET_FMT_lx " %08x\n", es, en, *miss, en, *cmp,
-                         env->error_code);
-            }
-#endif
-            msr |=3D env->error_code; /* key bit */
-            break;
         default:
             cpu_abort(cs, "Invalid TLB miss exception\n");
             break;
diff --git a/target/ppc/mmu_common.c b/target/ppc/mmu_common.c
index 754509e556c0..86795b281427 100644
--- a/target/ppc/mmu_common.c
+++ b/target/ppc/mmu_common.c
@@ -1147,7 +1147,6 @@ void dump_mmu(CPUPPCState *env)
         mmubooke206_dump_mmu(env);
         break;
     case POWERPC_MMU_SOFT_6xx:
-    case POWERPC_MMU_SOFT_74xx:
         mmu6xx_dump_mmu(env);
         break;
 #if defined(TARGET_PPC64)
@@ -1181,7 +1180,6 @@ static int check_physical(CPUPPCState *env, mmu_ctx_t=
 *ctx, target_ulong eaddr,
     ret =3D 0;
     switch (env->mmu_model) {
     case POWERPC_MMU_SOFT_6xx:
-    case POWERPC_MMU_SOFT_74xx:
     case POWERPC_MMU_SOFT_4xx:
     case POWERPC_MMU_REAL:
     case POWERPC_MMU_BOOKE:
@@ -1234,7 +1232,6 @@ int get_physical_address_wtlb(CPUPPCState *env, mmu_c=
tx_t *ctx,
=20
     switch (env->mmu_model) {
     case POWERPC_MMU_SOFT_6xx:
-    case POWERPC_MMU_SOFT_74xx:
         if (real_mode) {
             ret =3D check_physical(env, ctx, eaddr, access_type);
         } else {
@@ -1383,9 +1380,6 @@ static bool ppc_jumbo_xlate(PowerPCCPU *cpu, vaddr ea=
ddr,
                     env->spr[SPR_IMISS] =3D eaddr;
                     env->spr[SPR_ICMP] =3D 0x80000000 | ctx.ptem;
                     goto tlb_miss;
-                case POWERPC_MMU_SOFT_74xx:
-                    cs->exception_index =3D POWERPC_EXCP_IFTLB;
-                    goto tlb_miss_74xx;
                 case POWERPC_MMU_SOFT_4xx:
                 case POWERPC_MMU_SOFT_4xx_Z:
                     cs->exception_index =3D POWERPC_EXCP_ITLB;
@@ -1454,19 +1448,6 @@ static bool ppc_jumbo_xlate(PowerPCCPU *cpu, vaddr e=
addr,
                     env->spr[SPR_HASH2] =3D ppc_hash32_hpt_base(cpu) +
                         get_pteg_offset32(cpu, ctx.hash[1]);
                     break;
-                case POWERPC_MMU_SOFT_74xx:
-                    if (access_type =3D=3D MMU_DATA_STORE) {
-                        cs->exception_index =3D POWERPC_EXCP_DSTLB;
-                    } else {
-                        cs->exception_index =3D POWERPC_EXCP_DLTLB;
-                    }
-                tlb_miss_74xx:
-                    /* Implement LRU algorithm */
-                    env->error_code =3D ctx.key << 19;
-                    env->spr[SPR_TLBMISS] =3D (eaddr & ~((target_ulong)0x3=
)) |
-                        ((env->last_way + 1) & (env->nb_ways - 1));
-                    env->spr[SPR_PTEHI] =3D 0x80000000 | ctx.ptem;
-                    break;
                 case POWERPC_MMU_SOFT_4xx:
                 case POWERPC_MMU_SOFT_4xx_Z:
                     cs->exception_index =3D POWERPC_EXCP_DTLB;
diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index e0c4950dda53..f992131c1aa5 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -385,7 +385,6 @@ void ppc_tlb_invalidate_all(CPUPPCState *env)
 #endif /* defined(TARGET_PPC64) */
     switch (env->mmu_model) {
     case POWERPC_MMU_SOFT_6xx:
-    case POWERPC_MMU_SOFT_74xx:
         ppc6xx_tlb_invalidate_all(env);
         break;
     case POWERPC_MMU_SOFT_4xx:
@@ -434,7 +433,6 @@ void ppc_tlb_invalidate_one(CPUPPCState *env, target_ul=
ong addr)
 #endif /* defined(TARGET_PPC64) */
     switch (env->mmu_model) {
     case POWERPC_MMU_SOFT_6xx:
-    case POWERPC_MMU_SOFT_74xx:
         ppc6xx_tlb_invalidate_virt(env, addr, 0);
         if (env->id_tlbs =3D=3D 1) {
             ppc6xx_tlb_invalidate_virt(env, addr, 1);
@@ -571,35 +569,6 @@ void helper_6xx_tlbi(CPUPPCState *env, target_ulong EP=
N)
     do_6xx_tlb(env, EPN, 1);
 }
=20
-/* PowerPC 74xx software TLB load instructions helpers */
-static void do_74xx_tlb(CPUPPCState *env, target_ulong new_EPN, int is_cod=
e)
-{
-    target_ulong RPN, CMP, EPN;
-    int way;
-
-    RPN =3D env->spr[SPR_PTELO];
-    CMP =3D env->spr[SPR_PTEHI];
-    EPN =3D env->spr[SPR_TLBMISS] & ~0x3;
-    way =3D env->spr[SPR_TLBMISS] & 0x3;
-    (void)EPN; /* avoid a compiler warning */
-    LOG_SWTLB("%s: EPN " TARGET_FMT_lx " " TARGET_FMT_lx " PTE0 " TARGET_F=
MT_lx
-              " PTE1 " TARGET_FMT_lx " way %d\n", __func__, new_EPN, EPN, =
CMP,
-              RPN, way);
-    /* Store this TLB */
-    ppc6xx_tlb_store(env, (uint32_t)(new_EPN & TARGET_PAGE_MASK),
-                     way, is_code, CMP, RPN);
-}
-
-void helper_74xx_tlbd(CPUPPCState *env, target_ulong EPN)
-{
-    do_74xx_tlb(env, EPN, 0);
-}
-
-void helper_74xx_tlbi(CPUPPCState *env, target_ulong EPN)
-{
-    do_74xx_tlb(env, EPN, 1);
-}
-
 /*************************************************************************=
****/
 /* PowerPC 601 specific instructions (POWER bridge) */
=20
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 9960df6e1839..b3f3b408db18 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -6252,30 +6252,6 @@ static void gen_tlbli_6xx(DisasContext *ctx)
 #endif /* defined(CONFIG_USER_ONLY) */
 }
=20
-/* 74xx TLB management */
-
-/* tlbld */
-static void gen_tlbld_74xx(DisasContext *ctx)
-{
-#if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
-#else
-    CHK_SV;
-    gen_helper_74xx_tlbd(cpu_env, cpu_gpr[rB(ctx->opcode)]);
-#endif /* defined(CONFIG_USER_ONLY) */
-}
-
-/* tlbli */
-static void gen_tlbli_74xx(DisasContext *ctx)
-{
-#if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
-#else
-    CHK_SV;
-    gen_helper_74xx_tlbi(cpu_env, cpu_gpr[rB(ctx->opcode)]);
-#endif /* defined(CONFIG_USER_ONLY) */
-}
-
 /* POWER instructions not in PowerPC 601 */
=20
 /* clf */
@@ -7735,8 +7711,6 @@ GEN_HANDLER(esa, 0x1F, 0x14, 0x12, 0x03FFF801, PPC_60=
2_SPEC),
 GEN_HANDLER(mfrom, 0x1F, 0x09, 0x08, 0x03E0F801, PPC_602_SPEC),
 GEN_HANDLER2(tlbld_6xx, "tlbld", 0x1F, 0x12, 0x1E, 0x03FF0001, PPC_6xx_TLB=
),
 GEN_HANDLER2(tlbli_6xx, "tlbli", 0x1F, 0x12, 0x1F, 0x03FF0001, PPC_6xx_TLB=
),
-GEN_HANDLER2(tlbld_74xx, "tlbld", 0x1F, 0x12, 0x1E, 0x03FF0001, PPC_74xx_T=
LB),
-GEN_HANDLER2(tlbli_74xx, "tlbli", 0x1F, 0x12, 0x1F, 0x03FF0001, PPC_74xx_T=
LB),
 GEN_HANDLER(clf, 0x1F, 0x16, 0x03, 0x03E00000, PPC_POWER),
 GEN_HANDLER(cli, 0x1F, 0x16, 0x0F, 0x03E00000, PPC_POWER),
 GEN_HANDLER(dclst, 0x1F, 0x16, 0x13, 0x03E00000, PPC_POWER),
--=20
2.31.1


